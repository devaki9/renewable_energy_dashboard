from app.models.energy_data import EnergyData
from datetime import datetime, timedelta
import random
from sqlalchemy.orm import Session

def generate_mock_energy_data_for_user(user_id: int, db: Session):
    now = datetime.now()
    for day in range(10): #faster to load 10 days
        for hour in range(24):
            timestamp = now - timedelta(days=day, hours=(23 - hour))
            solar = random.uniform(0.0, 2.5)
            wind = random.uniform(0.0, 1.5)
            battery = random.uniform(0.0, 1.0)
            consumption = random.uniform(1.5, 3.5)
            total_gen = solar + wind + battery
            grid_import = max(0, consumption - total_gen)
            grid_export = max(0, total_gen - consumption)
            
            db_data = EnergyData(
                user_id=user_id,
                timestamp=timestamp,
                consumption_kwh=consumption,
                solar_generation_kwh=solar,
                wind_generation_kwh=wind,
                battery_generation_kwh=battery,
                grid_import_kwh=grid_import,
                grid_export_kwh=grid_export,
                weather_condition=random.choice(["sunny", "cloudy", "windy", "rainy"]),
                temperature=random.uniform(15, 35),
                wind_speed=random.uniform(1.0, 10.0)
            )
            db.add(db_data)
    db.commit()
