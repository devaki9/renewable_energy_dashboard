from sqlalchemy import Column, Integer, Float, DateTime, ForeignKey, String, text
from sqlalchemy.orm import relationship
from app.core.database import Base
from datetime import datetime

class EnergyData(Base):
    __tablename__ = "energy_data"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    timestamp = Column(DateTime, nullable=False, index=True)
    consumption_kwh = Column(Float, nullable=False)
    solar_generation_kwh = Column(Float, default=0)
    wind_generation_kwh = Column(Float, default=0)
    battery_generation_kwh = Column(Float, default=0)
    grid_import_kwh = Column(Float, default=0)
    grid_export_kwh = Column(Float, default=0)
    weather_condition = Column(String, nullable=True)  # sunny, cloudy, rainy, etc.
    temperature = Column(Float, nullable=True)  # in Celsius
    wind_speed = Column(Float, nullable=True)  # in m/s
    
    # Relationship with User model
    user = relationship("User", back_populates="energy_data")
    
    # Computed property for CO2 saved (assuming 0.5 kg CO2 per kWh from grid)
    @property
    def co2_saved_kg(self):
        total_renewable = self.solar_generation_kwh + self.wind_generation_kwh + self.battery_generation_kwh
        return total_renewable * 0.5  # 0.5 kg CO2 per kWh
    
    def calculate_grid_import(self):
        """Calculate grid import based on consumption and generation"""
        total_generation = self.solar_generation_kwh + self.wind_generation_kwh + self.battery_generation_kwh
        return max(0, self.consumption_kwh - total_generation)
