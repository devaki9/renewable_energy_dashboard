from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List, Optional, Dict
from datetime import datetime, timedelta
from app.core.database import get_db
from app.models.energy_data import EnergyData
from app.schema.energy_data import (
    EnergyData as EnergyDataSchema,
    EnergyDataCreate,
    EnergyDataSummary,
    EnergyDataTimeRange,
    TimeRangePeriod
)
from app.routes.auth import get_current_user
from app.models.user import User

router = APIRouter(prefix="/energy", tags=["energy"])

# Create new energy data entry
@router.post("/data", response_model=EnergyDataSchema)
async def create_energy_data(
    data: EnergyDataCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    db_data = EnergyData(**data.model_dump(), user_id=current_user.id)
    db.add(db_data)
    db.commit()
    db.refresh(db_data)
    return db_data

# Get real-time data (last hour)
@router.get("/realtime", response_model=EnergyDataSchema)
async def get_realtime_data(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
    
):
    # print(current_user.id)
    latest_data = db.query(EnergyData).filter(
        EnergyData.user_id == current_user.id
    ).order_by(EnergyData.timestamp.desc()).first()
    #print(latest_data)
    
    if not latest_data:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="No energy data found"
        )
    
    return latest_data

# Get latest timestamp for checking updates
@router.get("/latest-timestamp", response_model=Dict[str, str])
async def get_latest_timestamp(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    latest_data = db.query(EnergyData).filter(
        EnergyData.user_id == current_user.id
    ).order_by(EnergyData.timestamp.desc()).first()
    
    if not latest_data:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="No energy data found"
        )
    
    return {"timestamp": latest_data.timestamp.isoformat()}

# Get historical data with time range
@router.get("/history", response_model=List[EnergyDataSchema])
async def get_historical_data(
    start_date: datetime = Query(...),
    end_date: datetime = Query(...),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    data = db.query(EnergyData).filter(
        EnergyData.user_id == current_user.id,
        EnergyData.timestamp >= start_date,
        EnergyData.timestamp <= end_date
    ).order_by(EnergyData.timestamp.asc()).all()
    
    return data

# Get energy summary (daily, weekly, monthly)
@router.get("/summary", response_model=EnergyDataSummary)
async def get_energy_summary(
    start_date: datetime = Query(...),
    end_date: datetime = Query(...),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    # Get summary data
    summary = db.query(
        func.sum(EnergyData.consumption_kwh).label('total_consumption'),
        func.sum(EnergyData.solar_generation_kwh).label('total_solar_generation'),
        func.sum(EnergyData.wind_generation_kwh).label('total_wind_generation'),
        func.sum(EnergyData.battery_generation_kwh).label('total_battery_generation'),
        func.sum(EnergyData.grid_import_kwh).label('total_grid_import'),
        func.sum(EnergyData.grid_export_kwh).label('total_grid_export')
    ).filter(
        EnergyData.user_id == current_user.id,
        EnergyData.timestamp >= start_date,
        EnergyData.timestamp <= end_date
    ).first()
    
    if not summary:
        return EnergyDataSummary(
            total_consumption=0,
            total_solar_generation=0,
            total_wind_generation=0,
            total_battery_generation=0,
            total_grid_import=0,
            total_grid_export=0,
            total_co2_saved=0,
            renewable_percentage=0
        )
    
    # Convert None values to 0
    total_consumption = summary.total_consumption or 0
    total_solar = summary.total_solar_generation or 0
    total_wind = summary.total_wind_generation or 0
    total_battery = summary.total_battery_generation or 0
    total_grid_import = summary.total_grid_import or 0
    total_grid_export = summary.total_grid_export or 0
    
    # Calculate renewable percentage
    total_generation = total_solar + total_wind + total_battery
    renewable_percentage = (total_generation / total_consumption * 100) if total_consumption > 0 else 0
    
    # Calculate CO2 saved
    co2_saved = total_generation * 0.5  # 0.5 kg CO2 per kWh
    
    return EnergyDataSummary(
        total_consumption=total_consumption,
        total_solar_generation=total_solar,
        total_wind_generation=total_wind,
        total_battery_generation=total_battery,
        total_grid_import=total_grid_import,
        total_grid_export=total_grid_export,
        total_co2_saved=co2_saved,
        renewable_percentage=renewable_percentage
    )

# Get contribution from different energy sources
@router.get("/sources", response_model=dict)
async def get_energy_sources(
    period: TimeRangePeriod = Query(default=TimeRangePeriod.DAILY, description="Time period for summary"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    now = datetime.utcnow()
    
    if period == TimeRangePeriod.HOURLY:
        start_date = now - timedelta(hours=1)
    elif period == TimeRangePeriod.DAILY:
        start_date = now - timedelta(days=1)
    elif period == TimeRangePeriod.WEEKLY:
        start_date = now - timedelta(weeks=1)
    else:  # monthly
        start_date = now - timedelta(days=30)
    
    # Query for source contributions
    sources = db.query(
        func.sum(EnergyData.solar_generation_kwh).label("solar"),
        func.sum(EnergyData.wind_generation_kwh).label("wind"),
        func.sum(EnergyData.battery_generation_kwh).label("battery"),
        func.sum(EnergyData.grid_import_kwh).label("grid")
    ).filter(
        EnergyData.user_id == current_user.id,
        EnergyData.timestamp >= start_date
    ).first()
    
    total = (
        (sources.solar or 0) + 
        (sources.wind or 0) + 
        (sources.battery or 0) + 
        (sources.grid or 0)
    )
    
    if total == 0:
        return {
            "solar": 0,
            "wind": 0,
            "battery": 0,
            "grid": 0
        }
    
    return {
        "solar": (sources.solar or 0) / total * 100,
        "wind": (sources.wind or 0) / total * 100,
        "battery": (sources.battery or 0) / total * 100,
        "grid": (sources.grid or 0) / total * 100
    }

# Get carbon footprint data
@router.get("/carbon", response_model=dict)
async def get_carbon_footprint(
    period: TimeRangePeriod = Query(default=TimeRangePeriod.DAILY, description="Time period for summary"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    now = datetime.utcnow()
    
    if period == TimeRangePeriod.HOURLY:
        start_date = now - timedelta(hours=1)
    elif period == TimeRangePeriod.DAILY:
        start_date = now - timedelta(days=1)
    elif period == TimeRangePeriod.WEEKLY:
        start_date = now - timedelta(weeks=1)
    else:  # monthly
        start_date = now - timedelta(days=30)
    
    # Query for carbon footprint data
    data = db.query(
        func.sum(EnergyData.consumption_kwh).label("total_consumption"),
        func.sum(EnergyData.solar_generation_kwh).label("solar_generation"),
        func.sum(EnergyData.wind_generation_kwh).label("wind_generation"),
        func.sum(EnergyData.battery_generation_kwh).label("battery_generation")
    ).filter(
        EnergyData.user_id == current_user.id,
        EnergyData.timestamp >= start_date
    ).first()
    
    # Calculate CO2 emissions and savings
    grid_consumption = (
        data.total_consumption - 
        (data.solar_generation + data.wind_generation + data.battery_generation)
    )
    
    co2_emissions = grid_consumption * 0.5  # 0.5 kg CO2 per kWh from grid
    co2_saved = (
        (data.solar_generation + data.wind_generation + data.battery_generation) * 0.5
    )
    
    return {
        "co2_emissions": co2_emissions,
        "co2_saved": co2_saved,
        "net_impact": co2_saved - co2_emissions
    }



