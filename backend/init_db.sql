-- Create tables if they don't exist
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS energy_data (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    timestamp TIMESTAMP NOT NULL,
    consumption_kwh FLOAT NOT NULL,
    solar_generation_kwh FLOAT NOT NULL,
    wind_generation_kwh FLOAT NOT NULL,
    battery_generation_kwh FLOAT NOT NULL,
    grid_import_kwh FLOAT NOT NULL,
    grid_export_kwh FLOAT NOT NULL,
    co2_saved_kg FLOAT NOT NULL,
    renewable_percentage FLOAT NOT NULL,
    temperature_c FLOAT,
    humidity_percent FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample user if not exists
INSERT INTO users (email, username, hashed_password, is_active)
VALUES ('admin@example.com', 'admin', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj4J/vYBxLri', TRUE)
ON CONFLICT (username) DO NOTHING;

-- Insert sample energy data
INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, 
    wind_generation_kwh, battery_generation_kwh, grid_import_kwh, 
    grid_export_kwh, co2_saved_kg, renewable_percentage, 
    temperature_c, humidity_percent
)
SELECT 
    1, -- Assuming admin user has ID 1
    NOW() - (n || ' hours')::INTERVAL,
    10 + random() * 5, -- consumption
    5 + random() * 3,  -- solar
    2 + random() * 2,  -- wind
    1 + random() * 2,  -- battery
    2 + random() * 3,  -- grid import
    1 + random() * 2,  -- grid export
    3 + random() * 2,  -- co2 saved
    60 + random() * 20, -- renewable percentage
    20 + random() * 10, -- temperature
    40 + random() * 30  -- humidity
FROM generate_series(0, 24) n; 


--TODO: Add all the rows from csv here.