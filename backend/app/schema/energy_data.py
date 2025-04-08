from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional
from enum import Enum

class TimeRangePeriod(str, Enum):
    HOURLY = "hourly"
    DAILY = "daily"
    WEEKLY = "weekly"
    MONTHLY = "monthly"

class EnergyDataBase(BaseModel):
    timestamp: datetime
    consumption_kwh: float = Field(..., gt=0)
    solar_generation_kwh: float = Field(0, ge=0)
    wind_generation_kwh: float = Field(0, ge=0)
    battery_generation_kwh: float = Field(0, ge=0)
    grid_export_kwh: float = Field(0, ge=0)
    weather_condition: Optional[str] = None
    temperature: Optional[float] = None
    wind_speed: Optional[float] = None

class EnergyDataCreate(EnergyDataBase):
    pass

class EnergyData(EnergyDataBase):
    id: int
    user_id: int
    grid_import_kwh: float
    co2_saved_kg: float

    class Config:
        from_attributes = True

class EnergyDataSummary(BaseModel):
    total_consumption: float
    total_solar_generation: float
    total_wind_generation: float
    total_battery_generation: float
    total_grid_import: float
    total_grid_export: float
    total_co2_saved: float
    renewable_percentage: float

class EnergyDataTimeRange(BaseModel):
    start_date: datetime
    end_date: datetime
