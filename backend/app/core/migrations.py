from sqlalchemy import text
from app.core.database import engine

def run_migrations():
    """Run database migrations"""
    with engine.connect() as connection:
        # Adding the GENERATED ALWAYS AS constraint to grid_import_kwh
        connection.execute(text("""
            ALTER TABLE energy_data 
            ALTER COLUMN grid_import_kwh 
            SET GENERATED ALWAYS AS (
                GREATEST(0, consumption_kwh - (solar_generation_kwh + wind_generation_kwh + battery_generation_kwh))
            ) STORED
        """))
        connection.commit() 