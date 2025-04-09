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
    weather_condition TEXT,     
    temperature FLOAT,
    wind_speed FLOAT
);

-- Insert sample user if not exists
INSERT INTO users (email, username, hashed_password, is_active)
VALUES ('admin@example.com', 'admin', '$2b$12$5nmuHxfWXJOVVRJMdKubVO8waeJClqC4Y8xm0QOwIO2J1jLumIqF.', TRUE)
ON CONFLICT (username) DO NOTHING;

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 06:22:17', 3.1, 2.3, 1.39, 0.84,
       0, 1.43, 'sunny', 26.6, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 07:22:17', 2.42, 2.89, 1.07, 0.91,
       0, 2.45, 'windy', 31.6, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 08:22:17', 2.39, 2.63, 0.36, 0.02,
       0, 0.62, 'cloudy', 24.2, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 09:22:17', 1.68, 1.15, 1.17, 0.22,
       0, 0.86, 'windy', 18.7, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 10:22:17', 2.69, 0.53, 1.12, 0.83,
       0.21, 0, 'cloudy', 19.0, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 11:22:17', 2.23, 2.09, 0.94, 0.99,
       0, 1.79, 'sunny', 33.7, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 12:22:17', 2.92, 1.32, 0.59, 0.47,
       0.54, 0, 'rainy', 33.3, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 13:22:17', 1.83, 1.37, 0.85, 0.14,
       0, 0.53, 'sunny', 35.0, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 14:22:17', 3.47, 1.08, 0.63, 0.47,
       1.29, 0, 'sunny', 15.7, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 15:22:17', 1.88, 1.43, 1.28, 0.89,
       0, 1.72, 'windy', 34.5, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 16:22:17', 2.36, 0.62, 1.47, 0.9,
       0, 0.63, 'windy', 28.7, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 17:22:17', 1.87, 2.89, 0.84, 0.1,
       0, 1.96, 'rainy', 25.8, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 18:22:17', 2.85, 2.31, 0.59, 0.46,
       0, 0.51, 'cloudy', 32.6, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 19:22:17', 3.38, 0.0, 1.06, 0.28,
       2.04, 0, 'cloudy', 32.4, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 20:22:17', 1.53, 0.0, 1.33, 0.88,
       0, 0.68, 'windy', 18.5, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 21:22:17', 3.43, 0.0, 1.3, 0.55,
       1.58, 0, 'rainy', 31.5, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 22:22:17', 1.67, 0.0, 1.44, 0.86,
       0, 0.63, 'cloudy', 22.4, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 23:22:17', 1.97, 0.0, 0.68, 0.93,
       0.36, 0, 'cloudy', 34.2, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-09 00:22:17', 2.58, 0.0, 1.06, 0.83,
       0.69, 0, 'windy', 23.1, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-09 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-09 01:22:17', 2.56, 0.0, 0.97, 0.53,
       1.06, 0, 'windy', 28.9, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-09 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-09 02:22:17', 2.89, 0.0, 0.49, 0.53,
       1.87, 0, 'sunny', 19.4, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-09 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-09 03:22:17', 2.26, 0.0, 0.25, 0.31,
       1.7, 0, 'cloudy', 22.2, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-09 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-09 04:22:17', 2.63, 0.0, 0.87, 0.7,
       1.06, 0, 'cloudy', 25.0, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-09 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-09 05:22:17', 3.21, 0.0, 0.98, 0.47,
       1.76, 0, 'sunny', 29.6, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-09 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 06:22:17', 1.8, 1.47, 0.59, 0.45,
       0, 0.71, 'rainy', 27.7, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 07:22:17', 2.98, 2.55, 1.45, 0.41,
       0, 1.43, 'windy', 29.0, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 08:22:17', 3.1, 1.09, 0.32, 0.62,
       1.07, 0, 'windy', 18.7, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 09:22:17', 2.72, 1.0, 1.21, 0.27,
       0.24, 0, 'cloudy', 15.0, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 10:22:17', 3.16, 1.83, 0.68, 0.3,
       0.35, 0, 'windy', 21.2, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 11:22:17', 2.46, 0.53, 0.54, 0.65,
       0.74, 0, 'windy', 19.9, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 12:22:17', 2.43, 2.08, 1.39, 0.88,
       0, 1.92, 'sunny', 29.0, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 13:22:17', 1.93, 1.77, 1.16, 0.29,
       0, 1.29, 'sunny', 20.6, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 14:22:17', 2.92, 2.64, 0.47, 0.38,
       0, 0.57, 'sunny', 33.1, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 15:22:17', 2.55, 0.7, 1.04, 0.18,
       0.63, 0, 'sunny', 16.4, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 16:22:17', 2.33, 2.12, 1.4, 0.28,
       0, 1.47, 'cloudy', 20.1, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 17:22:17', 2.17, 2.25, 1.3, 0.51,
       0, 1.89, 'windy', 27.0, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 18:22:17', 3.29, 2.01, 1.4, 0.92,
       0, 1.04, 'sunny', 34.7, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 19:22:17', 2.05, 0.0, 1.08, 0.46,
       0.51, 0, 'rainy', 18.6, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 20:22:17', 3.4, 0.0, 0.69, 0.64,
       2.07, 0, 'rainy', 24.4, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 21:22:17', 3.21, 0.0, 0.4, 0.6,
       2.21, 0, 'sunny', 33.0, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 22:22:17', 2.54, 0.0, 1.39, 0.34,
       0.81, 0, 'rainy', 32.7, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 23:22:17', 1.75, 0.0, 0.4, 0.21,
       1.14, 0, 'sunny', 32.1, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 00:22:17', 1.78, 0.0, 0.24, 0.57,
       0.97, 0, 'windy', 17.8, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 01:22:17', 2.07, 0.0, 0.76, 0.24,
       1.07, 0, 'sunny', 21.7, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 02:22:17', 2.12, 0.0, 1.09, 0.43,
       0.6, 0, 'sunny', 26.8, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 03:22:17', 2.89, 0.0, 0.79, 1.0,
       1.1, 0, 'sunny', 18.5, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 04:22:17', 2.15, 0.0, 1.36, 0.91,
       0, 0.12, 'sunny', 25.6, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-08 05:22:17', 3.1, 0.0, 1.27, 0.14,
       1.69, 0, 'cloudy', 35.0, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-08 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 06:22:17', 2.01, 1.48, 1.3, 0.88,
       0, 1.65, 'windy', 31.0, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 07:22:17', 3.12, 1.19, 1.04, 0.63,
       0.26, 0, 'cloudy', 18.4, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 08:22:17', 3.44, 1.03, 0.95, 1.0,
       0.46, 0, 'cloudy', 34.8, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 09:22:17', 3.3, 2.56, 0.94, 0.55,
       0, 0.75, 'windy', 21.1, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 10:22:17', 2.58, 2.03, 0.28, 0.99,
       0, 0.72, 'windy', 21.2, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 11:22:17', 3.34, 0.75, 0.73, 1.0,
       0.86, 0, 'sunny', 27.7, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 12:22:17', 2.46, 2.05, 0.73, 0.6,
       0, 0.92, 'windy', 23.6, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 13:22:17', 1.94, 2.15, 0.59, 0.03,
       0, 0.83, 'rainy', 33.4, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 14:22:17', 2.4, 2.35, 1.04, 0.26,
       0, 1.25, 'sunny', 33.6, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 15:22:17', 2.24, 2.62, 0.59, 0.95,
       0, 1.92, 'rainy', 15.9, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 16:22:17', 3.45, 0.52, 0.68, 0.43,
       1.82, 0, 'rainy', 29.1, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 17:22:17', 1.93, 2.84, 0.49, 0.93,
       0, 2.33, 'sunny', 28.4, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 18:22:17', 2.88, 1.16, 1.45, 0.57,
       0, 0.3, 'windy', 30.2, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 19:22:17', 2.09, 0.0, 0.54, 0.67,
       0.88, 0, 'windy', 31.8, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 20:22:17', 1.59, 0.0, 0.79, 0.43,
       0.37, 0, 'sunny', 33.6, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 21:22:17', 3.25, 0.0, 0.42, 0.35,
       2.48, 0, 'cloudy', 23.0, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 22:22:17', 2.09, 0.0, 0.53, 0.83,
       0.73, 0, 'sunny', 27.0, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 23:22:17', 3.04, 0.0, 0.39, 0.88,
       1.77, 0, 'sunny', 32.7, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 00:22:17', 3.36, 0.0, 1.14, 0.32,
       1.9, 0, 'sunny', 25.4, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 01:22:17', 2.2, 0.0, 0.54, 0.8,
       0.86, 0, 'windy', 31.8, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 02:22:17', 2.41, 0.0, 1.07, 1.0,
       0.34, 0, 'rainy', 24.1, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 03:22:17', 1.83, 0.0, 1.05, 0.95,
       0, 0.17, 'sunny', 22.5, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 04:22:17', 1.5, 0.0, 1.27, 0.43,
       0, 0.2, 'sunny', 30.5, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-07 05:22:17', 1.87, 0.0, 0.34, 0.03,
       1.5, 0, 'rainy', 31.0, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-07 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 06:22:17', 1.81, 0.97, 1.18, 0.07,
       0, 0.41, 'rainy', 20.7, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 07:22:17', 2.41, 2.33, 0.57, 0.28,
       0, 0.77, 'sunny', 22.8, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 08:22:17', 1.61, 2.41, 1.23, 0.51,
       0, 2.54, 'cloudy', 17.3, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 09:22:17', 1.68, 2.23, 0.28, 0.42,
       0, 1.25, 'cloudy', 24.1, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 10:22:17', 2.23, 2.83, 0.3, 0.99,
       0, 1.89, 'windy', 32.0, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 11:22:17', 2.81, 2.71, 0.79, 0.91,
       0, 1.6, 'sunny', 22.7, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 12:22:17', 1.62, 2.08, 1.1, 0.86,
       0, 2.42, 'windy', 27.8, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 13:22:17', 2.11, 1.27, 0.54, 0.81,
       0, 0.51, 'sunny', 18.8, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 14:22:17', 2.34, 2.77, 0.32, 0.61,
       0, 1.36, 'windy', 23.8, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 15:22:17', 2.5, 1.17, 1.13, 0.71,
       0, 0.51, 'rainy', 25.9, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 16:22:17', 1.79, 1.88, 0.96, 0.15,
       0, 1.2, 'sunny', 26.4, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 17:22:17', 1.91, 2.65, 0.92, 0.79,
       0, 2.45, 'windy', 19.5, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 18:22:17', 3.15, 0.7, 0.22, 0.52,
       1.71, 0, 'rainy', 32.6, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 19:22:17', 2.28, 0.0, 0.81, 0.6,
       0.87, 0, 'rainy', 22.8, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 20:22:17', 3.32, 0.0, 1.12, 0.9,
       1.3, 0, 'sunny', 22.2, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 21:22:17', 1.75, 0.0, 1.22, 0.1,
       0.43, 0, 'cloudy', 15.4, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 22:22:17', 1.56, 0.0, 0.79, 0.12,
       0.65, 0, 'cloudy', 32.6, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 23:22:17', 2.66, 0.0, 0.89, 0.4,
       1.37, 0, 'rainy', 17.7, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 00:22:17', 2.45, 0.0, 0.75, 0.24,
       1.46, 0, 'rainy', 32.7, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 01:22:17', 1.52, 0.0, 0.3, 0.31,
       0.91, 0, 'rainy', 27.6, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 02:22:17', 3.08, 0.0, 0.29, 0.61,
       2.18, 0, 'rainy', 21.6, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 03:22:17', 1.78, 0.0, 0.87, 0.17,
       0.74, 0, 'rainy', 27.1, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 04:22:17', 2.53, 0.0, 1.07, 0.96,
       0.5, 0, 'cloudy', 16.1, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-06 05:22:17', 1.78, 0.0, 1.31, 0.46,
       0.01, 0, 'sunny', 25.6, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-06 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 06:22:17', 1.91, 1.51, 0.27, 0.01,
       0.12, 0, 'cloudy', 27.7, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 07:22:17', 3.22, 0.85, 1.11, 0.11,
       1.15, 0, 'rainy', 16.8, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 08:22:17', 3.08, 0.99, 0.93, 0.03,
       1.13, 0, 'sunny', 26.3, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 09:22:17', 2.62, 1.51, 1.24, 0.62,
       0, 0.75, 'cloudy', 27.2, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 10:22:17', 2.3, 2.91, 1.02, 0.33,
       0, 1.96, 'cloudy', 24.0, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 11:22:17', 2.93, 1.35, 0.2, 0.15,
       1.23, 0, 'cloudy', 27.6, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 12:22:17', 2.79, 2.28, 0.8, 0.9,
       0, 1.19, 'rainy', 19.1, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 13:22:17', 1.58, 1.37, 0.41, 0.94,
       0, 1.14, 'rainy', 30.6, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 14:22:17', 2.02, 1.49, 0.94, 0.04,
       0, 0.45, 'sunny', 31.3, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 15:22:17', 2.31, 0.73, 0.55, 0.12,
       0.91, 0, 'cloudy', 23.5, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 16:22:17', 2.55, 2.65, 0.81, 0.17,
       0, 1.08, 'cloudy', 17.5, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 17:22:17', 2.6, 1.55, 1.36, 0.06,
       0, 0.37, 'rainy', 29.1, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 18:22:17', 2.94, 1.45, 0.94, 0.31,
       0.24, 0, 'rainy', 19.5, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 19:22:17', 1.69, 0.0, 0.56, 0.87,
       0.26, 0, 'windy', 19.5, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 20:22:17', 3.35, 0.0, 0.32, 0.69,
       2.34, 0, 'sunny', 30.1, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 21:22:17', 3.3, 0.0, 1.05, 0.63,
       1.62, 0, 'windy', 33.2, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 22:22:17', 2.53, 0.0, 0.32, 0.53,
       1.68, 0, 'rainy', 16.8, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 23:22:17', 2.67, 0.0, 0.39, 0.92,
       1.36, 0, 'sunny', 23.0, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 00:22:17', 2.98, 0.0, 1.04, 0.03,
       1.91, 0, 'sunny', 31.0, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 01:22:17', 2.89, 0.0, 1.22, 0.5,
       1.17, 0, 'cloudy', 30.5, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 02:22:17', 2.32, 0.0, 1.24, 0.37,
       0.71, 0, 'windy', 22.1, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 03:22:17', 2.71, 0.0, 1.44, 0.35,
       0.92, 0, 'cloudy', 30.0, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 04:22:17', 2.55, 0.0, 0.63, 0.88,
       1.04, 0, 'sunny', 15.1, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-05 05:22:17', 2.33, 0.0, 1.25, 0.05,
       1.03, 0, 'rainy', 30.3, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-05 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 06:22:17', 2.29, 1.1, 0.76, 0.19,
       0.24, 0, 'windy', 26.5, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 07:22:17', 3.41, 1.66, 0.25, 0.69,
       0.81, 0, 'rainy', 19.2, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 08:22:17', 3.16, 0.51, 1.08, 0.21,
       1.36, 0, 'rainy', 23.8, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 09:22:17', 2.99, 1.32, 1.48, 0.08,
       0.11, 0, 'cloudy', 25.2, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 10:22:17', 1.95, 2.25, 0.59, 0.39,
       0, 1.28, 'rainy', 15.7, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 11:22:17', 3.24, 0.79, 0.35, 0.7,
       1.4, 0, 'cloudy', 32.0, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 12:22:17', 2.05, 2.77, 1.37, 0.25,
       0, 2.34, 'windy', 16.8, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 13:22:17', 1.53, 2.09, 1.25, 0.59,
       0, 2.4, 'sunny', 28.0, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 14:22:17', 2.12, 2.21, 1.35, 0.83,
       0, 2.27, 'cloudy', 27.8, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 15:22:17', 1.84, 1.88, 1.14, 0.24,
       0, 1.42, 'cloudy', 30.0, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 16:22:17', 2.59, 1.26, 0.75, 0.12,
       0.46, 0, 'rainy', 19.4, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 17:22:17', 2.67, 0.78, 0.95, 0.16,
       0.78, 0, 'rainy', 22.8, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 18:22:17', 2.26, 0.86, 0.71, 0.62,
       0.07, 0, 'sunny', 25.7, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 19:22:17', 3.34, 0.0, 1.07, 0.71,
       1.56, 0, 'windy', 21.5, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 20:22:17', 1.66, 0.0, 1.24, 0.26,
       0.16, 0, 'windy', 27.5, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 21:22:17', 2.13, 0.0, 0.94, 0.8,
       0.39, 0, 'cloudy', 24.0, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 22:22:17', 2.64, 0.0, 0.28, 0.07,
       2.29, 0, 'windy', 27.1, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 23:22:17', 1.57, 0.0, 1.25, 0.07,
       0.25, 0, 'sunny', 29.8, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 00:22:17', 3.42, 0.0, 0.94, 0.36,
       2.12, 0, 'rainy', 21.0, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 01:22:17', 2.27, 0.0, 1.21, 0.1,
       0.96, 0, 'windy', 31.6, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 02:22:17', 2.38, 0.0, 1.34, 0.69,
       0.35, 0, 'sunny', 28.2, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 03:22:17', 2.64, 0.0, 0.27, 0.02,
       2.35, 0, 'rainy', 28.1, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 04:22:17', 3.29, 0.0, 0.71, 0.06,
       2.52, 0, 'rainy', 15.9, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-04 05:22:17', 1.88, 0.0, 0.58, 0.06,
       1.24, 0, 'windy', 26.9, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-04 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 06:22:17', 1.56, 1.21, 0.4, 0.64,
       0, 0.69, 'cloudy', 21.9, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 07:22:17', 3.37, 1.75, 0.99, 0.82,
       0, 0.19, 'cloudy', 24.5, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 08:22:17', 3.3, 1.8, 1.25, 0.47,
       0, 0.22, 'rainy', 21.8, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 09:22:17', 3.4, 0.6, 0.97, 0.18,
       1.65, 0, 'windy', 28.9, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 10:22:17', 2.68, 0.77, 1.1, 0.01,
       0.8, 0, 'sunny', 20.4, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 11:22:17', 1.91, 1.96, 0.36, 0.7,
       0, 1.11, 'rainy', 30.7, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 12:22:17', 2.97, 1.17, 0.99, 0.7,
       0.11, 0, 'rainy', 27.9, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 13:22:17', 2.65, 2.23, 0.47, 0.96,
       0, 1.01, 'rainy', 24.4, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 14:22:17', 2.57, 2.51, 0.54, 0.45,
       0, 0.93, 'windy', 30.8, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 15:22:17', 1.65, 2.56, 0.94, 0.52,
       0, 2.37, 'cloudy', 15.3, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 16:22:17', 2.36, 1.71, 0.8, 0.66,
       0, 0.81, 'rainy', 16.5, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 17:22:17', 2.72, 0.93, 1.06, 0.4,
       0.33, 0, 'windy', 18.2, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 18:22:17', 1.63, 1.59, 1.07, 0.9,
       0, 1.93, 'sunny', 18.4, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 19:22:17', 2.55, 0.0, 1.1, 0.4,
       1.05, 0, 'rainy', 21.5, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 20:22:17', 2.27, 0.0, 0.6, 0.42,
       1.25, 0, 'windy', 16.0, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 21:22:17', 1.98, 0.0, 0.84, 0.14,
       1.0, 0, 'sunny', 15.4, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 22:22:17', 2.99, 0.0, 1.38, 0.5,
       1.11, 0, 'cloudy', 34.4, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 23:22:17', 2.94, 0.0, 0.42, 0.33,
       2.19, 0, 'sunny', 33.0, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 00:22:17', 2.02, 0.0, 1.47, 0.87,
       0, 0.32, 'windy', 19.0, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 01:22:17', 2.6, 0.0, 1.27, 0.31,
       1.02, 0, 'cloudy', 29.2, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 02:22:17', 3.02, 0.0, 0.75, 0.27,
       2.0, 0, 'sunny', 22.5, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 03:22:17', 3.03, 0.0, 0.33, 0.75,
       1.95, 0, 'cloudy', 26.0, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 04:22:17', 3.47, 0.0, 1.37, 0.87,
       1.23, 0, 'windy', 25.7, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-03 05:22:17', 2.44, 0.0, 0.72, 0.82,
       0.9, 0, 'sunny', 17.4, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-03 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 06:22:17', 1.98, 1.54, 1.46, 0.27,
       0, 1.29, 'cloudy', 27.0, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 07:22:17', 2.14, 1.37, 1.38, 0.04,
       0, 0.65, 'cloudy', 17.2, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 08:22:17', 2.46, 1.83, 1.15, 0.9,
       0, 1.42, 'sunny', 15.4, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 09:22:17', 1.59, 1.68, 1.08, 0.39,
       0, 1.56, 'windy', 22.2, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 10:22:17', 3.26, 2.96, 0.38, 0.21,
       0, 0.29, 'cloudy', 27.9, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 11:22:17', 1.65, 1.93, 0.95, 0.73,
       0, 1.96, 'cloudy', 33.5, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 12:22:17', 3.01, 0.76, 0.25, 0.61,
       1.39, 0, 'cloudy', 28.5, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 13:22:17', 2.63, 1.49, 0.52, 0.36,
       0.26, 0, 'windy', 23.8, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 14:22:17', 1.65, 0.88, 0.32, 0.33,
       0.12, 0, 'cloudy', 23.8, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 15:22:17', 2.11, 0.91, 0.66, 0.44,
       0.1, 0, 'rainy', 33.9, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 16:22:17', 2.27, 1.36, 0.23, 0.64,
       0.04, 0, 'rainy', 17.4, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 17:22:17', 2.04, 1.54, 1.04, 0.12,
       0, 0.66, 'windy', 29.9, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 18:22:17', 2.69, 1.15, 0.53, 0.91,
       0.1, 0, 'cloudy', 30.8, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 19:22:17', 2.36, 0.0, 1.2, 0.6,
       0.56, 0, 'rainy', 24.3, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 20:22:17', 2.06, 0.0, 0.21, 0.19,
       1.66, 0, 'windy', 34.7, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 21:22:17', 2.96, 0.0, 0.27, 0.18,
       2.51, 0, 'rainy', 33.9, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 22:22:17', 1.96, 0.0, 1.48, 0.7,
       0, 0.22, 'cloudy', 21.5, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 23:22:17', 3.03, 0.0, 1.13, 0.9,
       1.0, 0, 'cloudy', 33.5, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 00:22:17', 2.64, 0.0, 0.42, 0.48,
       1.74, 0, 'windy', 20.4, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 01:22:17', 3.37, 0.0, 0.4, 0.21,
       2.76, 0, 'windy', 33.3, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 02:22:17', 3.12, 0.0, 1.43, 0.91,
       0.78, 0, 'rainy', 32.0, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 03:22:17', 1.51, 0.0, 1.44, 0.95,
       0, 0.88, 'sunny', 31.9, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 04:22:17', 1.95, 0.0, 0.33, 0.61,
       1.01, 0, 'rainy', 33.1, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-02 05:22:17', 2.3, 0.0, 0.45, 0.54,
       1.31, 0, 'cloudy', 24.7, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-02 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 06:22:17', 1.96, 2.3, 1.36, 0.34,
       0, 2.04, 'sunny', 31.0, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 07:22:17', 1.68, 1.86, 0.56, 0.76,
       0, 1.5, 'cloudy', 18.4, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 08:22:17', 2.28, 2.78, 0.71, 0.31,
       0, 1.52, 'windy', 23.5, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 09:22:17', 3.17, 0.61, 1.37, 0.84,
       0.35, 0, 'sunny', 29.9, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 10:22:17', 1.75, 2.54, 1.17, 0.37,
       0, 2.33, 'windy', 15.3, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 11:22:17', 1.52, 1.65, 0.65, 0.11,
       0, 0.89, 'windy', 30.1, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 12:22:17', 1.74, 0.52, 0.36, 0.62,
       0.24, 0, 'rainy', 32.5, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 13:22:17', 2.36, 2.12, 1.03, 0.76,
       0, 1.55, 'rainy', 33.6, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 14:22:17', 2.88, 1.73, 0.45, 0.14,
       0.56, 0, 'rainy', 27.4, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 15:22:17', 3.44, 1.81, 1.43, 0.42,
       0, 0.22, 'sunny', 28.3, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 16:22:17', 3.03, 1.19, 1.37, 0.71,
       0, 0.24, 'sunny', 34.2, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 17:22:17', 3.32, 1.38, 0.25, 0.69,
       1.0, 0, 'rainy', 25.9, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 18:22:17', 1.96, 1.29, 1.5, 0.49,
       0, 1.32, 'rainy', 32.1, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 19:22:17', 3.04, 0.0, 0.75, 0.49,
       1.8, 0, 'sunny', 25.4, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 20:22:17', 2.02, 0.0, 1.07, 0.39,
       0.56, 0, 'rainy', 20.2, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 21:22:17', 1.92, 0.0, 0.68, 0.22,
       1.02, 0, 'windy', 31.3, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 22:22:17', 2.85, 0.0, 1.17, 0.89,
       0.79, 0, 'windy', 15.6, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 23:22:17', 2.77, 0.0, 0.49, 0.01,
       2.27, 0, 'sunny', 23.7, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 00:22:17', 2.72, 0.0, 0.47, 0.02,
       2.23, 0, 'cloudy', 15.4, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 01:22:17', 2.79, 0.0, 1.24, 0.91,
       0.64, 0, 'windy', 24.1, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 02:22:17', 2.37, 0.0, 0.38, 0.1,
       1.89, 0, 'rainy', 30.6, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 03:22:17', 3.34, 0.0, 1.0, 0.61,
       1.73, 0, 'cloudy', 22.5, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 04:22:17', 2.87, 0.0, 1.47, 0.68,
       0.72, 0, 'rainy', 15.2, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-04-01 05:22:17', 1.56, 0.0, 0.82, 0.59,
       0.15, 0, 'rainy', 32.4, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-04-01 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 06:22:17', 2.92, 0.98, 1.01, 0.41,
       0.52, 0, 'cloudy', 28.0, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 07:22:17', 1.63, 1.59, 0.3, 0.86,
       0, 1.12, 'rainy', 34.0, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 08:22:17', 3.12, 1.47, 1.43, 0.93,
       0, 0.71, 'rainy', 20.5, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 09:22:17', 3.36, 1.55, 0.6, 0.51,
       0.7, 0, 'rainy', 32.4, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 10:22:17', 3.24, 2.54, 0.21, 0.52,
       0, 0.03, 'windy', 23.6, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 11:22:17', 2.27, 1.43, 0.34, 0.76,
       0, 0.26, 'sunny', 27.6, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 12:22:17', 2.19, 2.85, 0.49, 0.95,
       0, 2.1, 'sunny', 20.5, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 13:22:17', 2.52, 0.96, 1.31, 0.84,
       0, 0.59, 'cloudy', 25.4, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 14:22:17', 1.71, 2.01, 1.25, 0.64,
       0, 2.19, 'rainy', 32.2, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 15:22:17', 2.98, 1.85, 1.43, 0.09,
       0, 0.39, 'rainy', 15.6, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 16:22:17', 2.28, 1.73, 0.6, 0.05,
       0, 0.1, 'windy', 26.0, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 17:22:17', 1.99, 2.13, 0.63, 0.73,
       0, 1.5, 'rainy', 24.3, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 18:22:17', 2.43, 2.99, 1.46, 0.0,
       0, 2.02, 'rainy', 15.6, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 19:22:17', 1.68, 0.0, 0.75, 0.47,
       0.46, 0, 'windy', 26.7, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 20:22:17', 2.96, 0.0, 0.4, 0.54,
       2.02, 0, 'cloudy', 19.8, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 21:22:17', 2.65, 0.0, 1.49, 0.54,
       0.62, 0, 'sunny', 32.2, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 22:22:17', 2.72, 0.0, 1.19, 0.25,
       1.28, 0, 'windy', 30.2, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 23:22:17', 1.72, 0.0, 1.14, 0.97,
       0, 0.39, 'cloudy', 26.1, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 00:22:17', 2.54, 0.0, 1.03, 0.69,
       0.82, 0, 'rainy', 22.4, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 01:22:17', 2.76, 0.0, 1.29, 0.49,
       0.98, 0, 'sunny', 17.9, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 02:22:17', 2.91, 0.0, 1.01, 0.18,
       1.72, 0, 'rainy', 27.5, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 03:22:17', 2.51, 0.0, 1.14, 0.39,
       0.98, 0, 'rainy', 23.8, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 04:22:17', 2.33, 0.0, 0.69, 0.12,
       1.52, 0, 'rainy', 15.9, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-31 05:22:17', 1.57, 0.0, 1.5, 0.74,
       0, 0.67, 'rainy', 28.4, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-31 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 06:22:17', 3.27, 2.04, 0.39, 0.16,
       0.68, 0, 'sunny', 16.4, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 07:22:17', 2.45, 0.98, 0.46, 0.82,
       0.19, 0, 'sunny', 31.8, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 08:22:17', 2.92, 2.18, 0.6, 0.56,
       0, 0.42, 'rainy', 34.0, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 09:22:17', 2.87, 1.88, 0.62, 0.79,
       0, 0.42, 'cloudy', 20.2, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 10:22:17', 2.65, 2.65, 0.64, 0.86,
       0, 1.5, 'rainy', 25.7, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 11:22:17', 3.27, 1.36, 1.27, 0.21,
       0.43, 0, 'windy', 35.0, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 12:22:17', 2.27, 2.06, 0.42, 0.22,
       0, 0.43, 'rainy', 25.7, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 13:22:17', 2.97, 1.1, 0.63, 0.89,
       0.35, 0, 'windy', 23.2, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 14:22:17', 3.16, 2.4, 1.04, 0.09,
       0, 0.37, 'sunny', 27.7, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 15:22:17', 3.1, 2.41, 1.06, 0.37,
       0, 0.74, 'cloudy', 29.4, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 16:22:17', 2.21, 0.53, 1.41, 0.54,
       0, 0.27, 'rainy', 32.5, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 17:22:17', 2.77, 2.12, 0.64, 0.5,
       0, 0.49, 'sunny', 28.1, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 18:22:17', 2.86, 2.62, 1.11, 0.14,
       0, 1.01, 'windy', 16.0, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 19:22:17', 1.95, 0.0, 0.99, 0.41,
       0.55, 0, 'sunny', 27.8, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 20:22:17', 2.8, 0.0, 0.34, 0.8,
       1.66, 0, 'windy', 23.9, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 21:22:17', 2.89, 0.0, 0.81, 0.21,
       1.87, 0, 'rainy', 18.1, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 22:22:17', 2.47, 0.0, 0.41, 0.62,
       1.44, 0, 'rainy', 26.3, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 23:22:17', 2.24, 0.0, 0.2, 0.35,
       1.69, 0, 'sunny', 32.0, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 00:22:17', 1.88, 0.0, 0.34, 0.18,
       1.36, 0, 'sunny', 28.0, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 01:22:17', 3.2, 0.0, 0.67, 0.84,
       1.69, 0, 'rainy', 32.1, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 02:22:17', 3.05, 0.0, 1.41, 0.04,
       1.6, 0, 'sunny', 26.3, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 03:22:17', 2.16, 0.0, 0.21, 0.22,
       1.73, 0, 'windy', 22.3, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 04:22:17', 3.16, 0.0, 1.38, 0.96,
       0.82, 0, 'windy', 29.2, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-30 05:22:17', 1.94, 0.0, 1.38, 0.84,
       0, 0.28, 'sunny', 16.5, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-30 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 06:22:17', 2.59, 2.36, 1.2, 0.28,
       0, 1.25, 'windy', 32.0, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 07:22:17', 2.8, 1.15, 0.3, 0.75,
       0.6, 0, 'sunny', 29.4, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 08:22:17', 3.14, 0.98, 0.98, 0.12,
       1.06, 0, 'windy', 18.9, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 09:22:17', 2.16, 1.01, 1.22, 0.69,
       0, 0.76, 'sunny', 23.9, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 10:22:17', 3.32, 1.37, 0.69, 0.26,
       1.0, 0, 'sunny', 22.2, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 11:22:17', 2.0, 2.11, 1.13, 0.86,
       0, 2.1, 'windy', 30.5, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 12:22:17', 2.35, 2.31, 0.38, 0.52,
       0, 0.86, 'windy', 15.6, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 13:22:17', 1.91, 2.95, 0.53, 0.7,
       0, 2.27, 'sunny', 19.5, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 14:22:17', 2.25, 2.53, 0.55, 0.56,
       0, 1.39, 'sunny', 30.6, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 15:22:17', 2.19, 1.16, 1.3, 0.49,
       0, 0.76, 'sunny', 31.0, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 16:22:17', 3.34, 2.47, 0.71, 0.7,
       0, 0.54, 'windy', 29.0, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 17:22:17', 3.49, 1.07, 0.27, 0.88,
       1.27, 0, 'cloudy', 18.7, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 18:22:17', 1.6, 2.67, 1.28, 0.86,
       0, 3.21, 'cloudy', 22.8, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 19:22:17', 2.99, 0.0, 0.64, 0.8,
       1.55, 0, 'sunny', 17.0, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 20:22:17', 2.62, 0.0, 1.26, 0.8,
       0.56, 0, 'rainy', 17.0, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 21:22:17', 1.68, 0.0, 1.21, 0.92,
       0, 0.45, 'sunny', 22.5, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 22:22:17', 2.34, 0.0, 0.58, 0.66,
       1.1, 0, 'cloudy', 26.0, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 23:22:17', 3.3, 0.0, 1.46, 0.17,
       1.67, 0, 'windy', 29.2, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 00:22:17', 2.38, 0.0, 0.91, 0.04,
       1.43, 0, 'sunny', 20.5, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 01:22:17', 2.56, 0.0, 0.88, 0.31,
       1.37, 0, 'windy', 29.7, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 02:22:17', 3.42, 0.0, 0.76, 0.01,
       2.65, 0, 'windy', 19.2, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 03:22:17', 1.63, 0.0, 1.22, 0.02,
       0.39, 0, 'rainy', 34.3, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 04:22:17', 1.93, 0.0, 0.93, 0.03,
       0.97, 0, 'sunny', 16.7, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-29 05:22:17', 3.41, 0.0, 0.58, 0.12,
       2.71, 0, 'sunny', 29.4, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-29 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 06:22:17', 2.05, 1.1, 0.23, 0.66,
       0.06, 0, 'rainy', 18.1, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 07:22:17', 2.22, 1.09, 0.43, 0.51,
       0.19, 0, 'sunny', 22.7, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 08:22:17', 2.79, 1.62, 1.42, 0.81,
       0, 1.06, 'sunny', 26.6, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 09:22:17', 2.08, 0.65, 1.27, 0.79,
       0, 0.63, 'cloudy', 24.3, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 10:22:17', 2.28, 1.1, 1.19, 0.51,
       0, 0.52, 'cloudy', 31.6, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 11:22:17', 2.95, 1.53, 1.18, 0.94,
       0, 0.7, 'windy', 34.1, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 12:22:17', 3.06, 1.18, 0.94, 0.69,
       0.25, 0, 'rainy', 17.1, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 13:22:17', 2.53, 2.62, 1.47, 0.45,
       0, 2.01, 'windy', 30.6, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 14:22:17', 3.16, 2.74, 0.68, 0.0,
       0, 0.26, 'cloudy', 18.4, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 15:22:17', 2.77, 0.61, 0.22, 0.66,
       1.28, 0, 'rainy', 27.4, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 16:22:17', 2.39, 1.27, 0.62, 0.47,
       0.03, 0, 'windy', 28.0, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 17:22:17', 2.45, 1.92, 0.3, 0.75,
       0, 0.52, 'rainy', 25.3, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 18:22:17', 1.84, 1.13, 1.36, 0.62,
       0, 1.27, 'cloudy', 27.5, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 19:22:17', 1.68, 0.0, 0.49, 0.43,
       0.76, 0, 'cloudy', 29.3, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 20:22:17', 1.98, 0.0, 1.06, 0.28,
       0.64, 0, 'cloudy', 29.4, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 21:22:17', 2.31, 0.0, 0.44, 0.48,
       1.39, 0, 'rainy', 34.4, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 22:22:17', 2.92, 0.0, 1.5, 0.58,
       0.84, 0, 'sunny', 19.5, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 23:22:17', 1.79, 0.0, 1.02, 0.07,
       0.7, 0, 'windy', 33.5, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 00:22:17', 3.39, 0.0, 0.47, 0.29,
       2.63, 0, 'sunny', 32.2, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 01:22:17', 2.5, 0.0, 1.0, 0.36,
       1.14, 0, 'cloudy', 24.3, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 02:22:17', 3.45, 0.0, 0.76, 0.76,
       1.93, 0, 'cloudy', 27.2, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 03:22:17', 3.32, 0.0, 0.46, 0.34,
       2.52, 0, 'cloudy', 15.1, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 04:22:17', 1.99, 0.0, 0.87, 0.14,
       0.98, 0, 'cloudy', 23.9, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-28 05:22:17', 3.45, 0.0, 0.8, 0.87,
       1.78, 0, 'sunny', 32.8, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-28 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 06:22:17', 1.92, 2.22, 1.1, 0.12,
       0, 1.52, 'rainy', 27.8, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 07:22:17', 2.75, 2.98, 0.66, 0.53,
       0, 1.42, 'rainy', 18.5, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 08:22:17', 1.7, 2.9, 0.58, 0.77,
       0, 2.55, 'sunny', 21.2, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 09:22:17', 3.14, 1.86, 0.33, 0.69,
       0.26, 0, 'sunny', 16.4, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 10:22:17', 1.72, 1.88, 1.4, 0.52,
       0, 2.08, 'sunny', 27.9, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 11:22:17', 2.05, 1.4, 1.14, 0.29,
       0, 0.78, 'windy', 27.5, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 12:22:17', 3.16, 2.58, 1.35, 0.09,
       0, 0.86, 'cloudy', 28.0, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 13:22:17', 2.31, 2.5, 0.47, 0.04,
       0, 0.7, 'sunny', 20.2, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 14:22:17', 2.28, 1.48, 0.83, 0.09,
       0, 0.12, 'windy', 19.6, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 15:22:17', 2.6, 0.85, 0.6, 0.22,
       0.93, 0, 'sunny', 24.2, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 16:22:17', 1.86, 1.53, 1.36, 0.56,
       0, 1.59, 'windy', 21.0, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 17:22:17', 2.42, 0.6, 0.86, 0.15,
       0.81, 0, 'rainy', 34.6, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 18:22:17', 2.5, 0.95, 0.21, 0.82,
       0.52, 0, 'windy', 25.1, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 19:22:17', 2.9, 0.0, 1.17, 0.15,
       1.58, 0, 'windy', 19.9, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 20:22:17', 2.45, 0.0, 0.84, 0.22,
       1.39, 0, 'windy', 34.5, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 21:22:17', 1.5, 0.0, 0.46, 0.76,
       0.28, 0, 'rainy', 22.3, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 22:22:17', 1.82, 0.0, 0.92, 0.35,
       0.55, 0, 'sunny', 27.4, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 23:22:17', 2.53, 0.0, 1.01, 0.81,
       0.71, 0, 'rainy', 32.5, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 00:22:17', 2.79, 0.0, 0.89, 0.02,
       1.88, 0, 'rainy', 26.6, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 01:22:17', 3.3, 0.0, 0.49, 0.33,
       2.48, 0, 'windy', 27.5, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 02:22:17', 2.88, 0.0, 0.95, 0.59,
       1.34, 0, 'sunny', 15.7, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 03:22:17', 2.4, 0.0, 1.12, 0.01,
       1.27, 0, 'sunny', 34.6, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 04:22:17', 1.65, 0.0, 1.43, 0.26,
       0, 0.04, 'windy', 19.9, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-27 05:22:17', 1.82, 0.0, 1.47, 0.07,
       0.28, 0, 'cloudy', 33.4, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-27 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 06:22:17', 2.63, 0.92, 0.57, 0.9,
       0.24, 0, 'cloudy', 19.1, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 07:22:17', 1.91, 2.72, 1.17, 0.35,
       0, 2.33, 'rainy', 31.4, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 08:22:17', 2.86, 1.86, 0.41, 0.64,
       0, 0.05, 'rainy', 30.2, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 09:22:17', 2.2, 2.35, 1.18, 0.28,
       0, 1.61, 'sunny', 34.0, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 10:22:17', 2.6, 1.98, 1.25, 0.2,
       0, 0.83, 'cloudy', 17.7, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 11:22:17', 3.43, 1.91, 1.48, 0.53,
       0, 0.49, 'windy', 32.6, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 12:22:17', 2.14, 1.19, 1.4, 0.19,
       0, 0.64, 'rainy', 21.1, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 13:22:17', 3.05, 0.75, 0.97, 0.66,
       0.67, 0, 'sunny', 24.4, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 14:22:17', 2.41, 2.73, 1.34, 0.62,
       0, 2.28, 'rainy', 31.6, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 15:22:17', 2.45, 1.5, 1.06, 0.05,
       0, 0.16, 'cloudy', 19.4, 0.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 16:22:17', 3.42, 0.96, 1.1, 0.28,
       1.08, 0, 'cloudy', 26.3, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 17:22:17', 1.74, 1.39, 1.34, 0.57,
       0, 1.56, 'windy', 30.2, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 18:22:17', 2.58, 1.25, 0.3, 0.58,
       0.45, 0, 'rainy', 29.2, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 19:22:17', 2.78, 0.0, 0.89, 0.36,
       1.53, 0, 'windy', 30.5, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 20:22:17', 3.25, 0.0, 1.35, 0.34,
       1.56, 0, 'cloudy', 17.2, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 21:22:17', 2.3, 0.0, 1.27, 0.97,
       0.06, 0, 'cloudy', 33.8, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 22:22:17', 2.96, 0.0, 1.49, 0.26,
       1.21, 0, 'sunny', 33.5, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 23:22:17', 2.72, 0.0, 0.7, 0.07,
       1.95, 0, 'windy', 19.8, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 00:22:17', 2.57, 0.0, 0.89, 0.63,
       1.05, 0, 'sunny', 24.8, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 01:22:17', 1.99, 0.0, 1.08, 0.12,
       0.79, 0, 'cloudy', 15.4, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 02:22:17', 2.89, 0.0, 1.48, 0.05,
       1.36, 0, 'sunny', 28.8, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 03:22:17', 2.58, 0.0, 0.3, 0.01,
       2.27, 0, 'sunny', 15.8, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 04:22:17', 2.44, 0.0, 0.38, 0.6,
       1.46, 0, 'cloudy', 16.5, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-26 05:22:17', 1.9, 0.0, 1.41, 0.43,
       0.06, 0, 'cloudy', 22.0, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-26 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 06:22:17', 3.28, 2.49, 1.23, 0.77,
       0, 1.21, 'windy', 18.5, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 07:22:17', 2.89, 0.68, 1.09, 0.84,
       0.28, 0, 'rainy', 30.0, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 08:22:17', 2.97, 2.4, 1.03, 0.5,
       0, 0.96, 'windy', 30.8, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 09:22:17', 3.34, 1.48, 0.91, 0.56,
       0.39, 0, 'windy', 32.3, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 10:22:17', 2.74, 0.62, 0.39, 0.18,
       1.55, 0, 'sunny', 19.9, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 11:22:17', 2.94, 0.69, 1.36, 0.48,
       0.41, 0, 'rainy', 19.2, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 12:22:17', 1.92, 0.89, 0.96, 0.02,
       0.05, 0, 'sunny', 24.3, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 13:22:17', 2.65, 2.62, 0.9, 0.42,
       0, 1.29, 'cloudy', 26.3, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 14:22:17', 2.68, 2.71, 1.17, 0.75,
       0, 1.95, 'sunny', 18.4, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 15:22:17', 2.3, 1.67, 0.45, 0.18,
       0, 0.0, 'cloudy', 21.5, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 16:22:17', 2.54, 1.14, 0.81, 0.83,
       0, 0.24, 'sunny', 18.9, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 17:22:17', 2.5, 1.29, 1.43, 0.5,
       0, 0.72, 'cloudy', 32.0, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 18:22:17', 2.0, 1.09, 0.28, 0.74,
       0, 0.11, 'windy', 30.1, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 19:22:17', 1.89, 0.0, 1.17, 0.88,
       0, 0.16, 'rainy', 31.2, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 20:22:17', 3.27, 0.0, 1.06, 0.5,
       1.71, 0, 'sunny', 18.5, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 21:22:17', 3.41, 0.0, 1.23, 0.78,
       1.4, 0, 'cloudy', 21.7, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 22:22:17', 2.8, 0.0, 0.52, 0.06,
       2.22, 0, 'sunny', 30.2, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 23:22:17', 2.67, 0.0, 0.65, 0.62,
       1.4, 0, 'windy', 34.3, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 00:22:17', 1.64, 0.0, 1.42, 0.77,
       0, 0.55, 'windy', 23.2, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 01:22:17', 2.84, 0.0, 0.39, 0.29,
       2.16, 0, 'cloudy', 20.8, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 02:22:17', 1.66, 0.0, 1.3, 0.98,
       0, 0.62, 'cloudy', 32.2, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 03:22:17', 1.69, 0.0, 0.83, 0.73,
       0.13, 0, 'rainy', 24.3, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 04:22:17', 2.43, 0.0, 0.93, 0.99,
       0.51, 0, 'windy', 34.3, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-25 05:22:17', 2.75, 0.0, 0.42, 0.5,
       1.83, 0, 'sunny', 31.4, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-25 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 06:22:17', 2.73, 1.71, 1.18, 0.47,
       0, 0.63, 'rainy', 24.4, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 07:22:17', 1.86, 0.67, 1.1, 0.37,
       0, 0.28, 'sunny', 33.8, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 08:22:17', 3.43, 2.07, 1.02, 0.93,
       0, 0.59, 'rainy', 24.2, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 09:22:17', 2.99, 2.99, 1.48, 0.3,
       0, 1.78, 'windy', 33.8, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 10:22:17', 3.22, 2.55, 1.41, 0.78,
       0, 1.52, 'windy', 33.0, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 11:22:17', 3.44, 1.11, 0.42, 0.61,
       1.3, 0, 'windy', 18.8, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 12:22:17', 2.81, 0.77, 1.35, 0.49,
       0.2, 0, 'rainy', 23.5, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 13:22:17', 1.61, 0.91, 0.96, 0.91,
       0, 1.17, 'rainy', 34.4, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 14:22:17', 3.41, 1.62, 1.42, 0.19,
       0.18, 0, 'rainy', 26.8, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 15:22:17', 1.96, 1.66, 0.97, 0.2,
       0, 0.87, 'rainy', 22.0, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 16:22:17', 3.2, 2.44, 0.44, 0.81,
       0, 0.49, 'windy', 21.7, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 17:22:17', 2.66, 0.83, 0.91, 0.89,
       0.03, 0, 'windy', 17.6, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 18:22:17', 3.28, 1.56, 0.79, 0.73,
       0.2, 0, 'rainy', 24.5, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 19:22:17', 3.4, 0.0, 0.31, 0.89,
       2.2, 0, 'sunny', 23.7, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 20:22:17', 3.42, 0.0, 1.35, 0.23,
       1.84, 0, 'rainy', 30.0, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 21:22:17', 2.77, 0.0, 0.99, 0.52,
       1.26, 0, 'sunny', 26.1, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 22:22:17', 2.25, 0.0, 0.78, 0.06,
       1.41, 0, 'sunny', 20.8, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 23:22:17', 3.32, 0.0, 0.74, 0.93,
       1.65, 0, 'windy', 33.1, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 00:22:17', 2.82, 0.0, 0.38, 0.08,
       2.36, 0, 'rainy', 25.4, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 01:22:17', 2.86, 0.0, 1.39, 0.16,
       1.31, 0, 'windy', 28.0, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 02:22:17', 2.7, 0.0, 0.93, 0.05,
       1.72, 0, 'windy', 29.8, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 03:22:17', 2.11, 0.0, 1.48, 0.88,
       0, 0.25, 'rainy', 35.0, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 04:22:17', 3.3, 0.0, 0.56, 1.0,
       1.74, 0, 'sunny', 17.8, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-24 05:22:17', 1.6, 0.0, 0.62, 0.16,
       0.82, 0, 'sunny', 33.3, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-24 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 06:22:17', 1.6, 1.0, 0.56, 0.19,
       0, 0.15, 'cloudy', 26.4, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 07:22:17', 3.03, 0.77, 0.6, 0.81,
       0.85, 0, 'cloudy', 32.8, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 08:22:17', 2.76, 1.7, 1.18, 0.39,
       0, 0.51, 'sunny', 33.4, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 09:22:17', 1.81, 0.59, 1.0, 0.45,
       0, 0.23, 'windy', 18.9, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 10:22:17', 1.53, 1.9, 0.29, 0.73,
       0, 1.39, 'rainy', 15.9, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 11:22:17', 1.68, 2.32, 1.12, 0.86,
       0, 2.62, 'rainy', 31.2, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 12:22:17', 1.59, 2.25, 1.02, 0.85,
       0, 2.53, 'windy', 19.5, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 13:22:17', 1.94, 0.62, 1.01, 0.86,
       0, 0.55, 'sunny', 27.0, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 14:22:17', 2.85, 0.57, 0.72, 0.1,
       1.46, 0, 'windy', 33.2, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 15:22:17', 1.59, 1.18, 1.32, 0.89,
       0, 1.8, 'cloudy', 15.7, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 16:22:17', 3.25, 1.15, 1.5, 0.65,
       0, 0.05, 'windy', 28.5, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 17:22:17', 1.99, 2.42, 0.86, 0.81,
       0, 2.1, 'cloudy', 17.0, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 18:22:17', 2.29, 1.16, 1.16, 0.34,
       0, 0.37, 'windy', 25.8, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 19:22:17', 2.16, 0.0, 0.47, 0.02,
       1.67, 0, 'rainy', 21.2, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 20:22:17', 2.79, 0.0, 0.31, 0.65,
       1.83, 0, 'sunny', 34.7, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 21:22:17', 2.63, 0.0, 0.42, 0.52,
       1.69, 0, 'windy', 26.5, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 22:22:17', 2.74, 0.0, 0.36, 0.54,
       1.84, 0, 'sunny', 19.6, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 23:22:17', 3.41, 0.0, 1.15, 0.79,
       1.47, 0, 'cloudy', 31.2, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 00:22:17', 3.09, 0.0, 0.5, 0.0,
       2.59, 0, 'sunny', 34.6, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 01:22:17', 2.63, 0.0, 1.12, 0.84,
       0.67, 0, 'sunny', 30.4, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 02:22:17', 3.17, 0.0, 0.83, 0.42,
       1.92, 0, 'rainy', 28.1, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 03:22:17', 3.25, 0.0, 1.03, 0.56,
       1.66, 0, 'rainy', 34.6, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 04:22:17', 1.73, 0.0, 1.3, 0.43,
       0, 0, 'sunny', 30.7, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-23 05:22:17', 2.5, 0.0, 1.07, 0.15,
       1.28, 0, 'sunny', 29.0, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-23 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 06:22:17', 2.45, 2.46, 0.65, 0.28,
       0, 0.94, 'cloudy', 29.2, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 07:22:17', 2.47, 1.69, 0.26, 0.4,
       0.12, 0, 'windy', 33.8, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 08:22:17', 3.14, 2.73, 0.39, 0.23,
       0, 0.21, 'sunny', 22.0, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 09:22:17', 3.21, 0.94, 1.24, 0.04,
       0.99, 0, 'cloudy', 31.9, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 10:22:17', 2.26, 2.42, 0.63, 0.41,
       0, 1.2, 'sunny', 33.8, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 11:22:17', 2.81, 0.68, 1.23, 0.28,
       0.62, 0, 'windy', 20.6, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 12:22:17', 1.61, 2.55, 0.34, 0.37,
       0, 1.65, 'cloudy', 20.4, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 13:22:17', 3.3, 1.48, 0.33, 0.32,
       1.17, 0, 'rainy', 24.7, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 14:22:17', 2.87, 2.45, 0.71, 0.63,
       0, 0.92, 'windy', 16.1, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 15:22:17', 2.35, 1.08, 0.62, 0.32,
       0.33, 0, 'cloudy', 17.6, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 16:22:17', 3.2, 2.54, 1.05, 0.58,
       0, 0.97, 'cloudy', 28.3, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 17:22:17', 3.11, 2.45, 1.0, 0.9,
       0, 1.24, 'windy', 18.9, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 18:22:17', 2.45, 1.29, 0.57, 0.3,
       0.29, 0, 'sunny', 27.6, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 19:22:17', 2.46, 0.0, 0.31, 0.29,
       1.86, 0, 'windy', 33.4, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 20:22:17', 2.13, 0.0, 0.37, 0.54,
       1.22, 0, 'sunny', 19.1, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 21:22:17', 2.06, 0.0, 1.42, 0.61,
       0.03, 0, 'windy', 25.1, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 22:22:17', 3.06, 0.0, 0.4, 0.5,
       2.16, 0, 'rainy', 21.4, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 23:22:17', 2.62, 0.0, 0.4, 0.8,
       1.42, 0, 'rainy', 32.8, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 00:22:17', 2.69, 0.0, 1.24, 0.78,
       0.67, 0, 'rainy', 31.7, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 01:22:17', 2.64, 0.0, 1.19, 0.22,
       1.23, 0, 'cloudy', 18.1, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 02:22:17', 1.75, 0.0, 0.86, 0.16,
       0.73, 0, 'rainy', 17.1, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 03:22:17', 1.68, 0.0, 0.71, 0.99,
       0, 0.02, 'windy', 17.0, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 04:22:17', 2.39, 0.0, 1.31, 0.62,
       0.46, 0, 'rainy', 22.6, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-22 05:22:17', 2.76, 0.0, 0.3, 0.41,
       2.05, 0, 'rainy', 31.0, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-22 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 06:22:17', 1.93, 1.85, 0.49, 0.19,
       0, 0.6, 'sunny', 33.1, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 07:22:17', 1.52, 2.54, 0.48, 0.22,
       0, 1.72, 'rainy', 34.2, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 08:22:17', 1.52, 1.42, 1.27, 0.51,
       0, 1.68, 'cloudy', 23.0, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 09:22:17', 1.81, 0.96, 0.59, 0.28,
       0, 0.02, 'cloudy', 31.7, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 10:22:17', 1.66, 0.71, 0.96, 0.47,
       0, 0.48, 'windy', 26.9, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 11:22:17', 3.01, 2.86, 0.39, 0.0,
       0, 0.24, 'rainy', 17.8, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 12:22:17', 1.8, 1.49, 0.21, 0.55,
       0, 0.45, 'windy', 20.2, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 13:22:17', 2.5, 1.79, 1.06, 0.43,
       0, 0.78, 'rainy', 20.6, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 14:22:17', 2.96, 2.28, 1.14, 0.98,
       0, 1.44, 'windy', 15.4, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 15:22:17', 3.09, 2.32, 1.33, 0.99,
       0, 1.55, 'sunny', 21.8, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 16:22:17', 2.6, 0.62, 0.97, 0.71,
       0.3, 0, 'rainy', 15.7, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 17:22:17', 3.36, 2.6, 1.19, 0.36,
       0, 0.79, 'windy', 31.4, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 18:22:17', 3.36, 0.93, 0.57, 0.17,
       1.69, 0, 'sunny', 16.6, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 19:22:17', 1.64, 0.0, 1.28, 0.33,
       0.03, 0, 'sunny', 16.3, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 20:22:17', 2.99, 0.0, 0.27, 0.17,
       2.55, 0, 'rainy', 21.7, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 21:22:17', 2.63, 0.0, 1.39, 0.58,
       0.66, 0, 'sunny', 20.0, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 22:22:17', 3.17, 0.0, 0.36, 0.79,
       2.02, 0, 'rainy', 32.1, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 23:22:17', 2.64, 0.0, 1.15, 0.47,
       1.02, 0, 'rainy', 15.7, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 00:22:17', 2.73, 0.0, 0.59, 0.86,
       1.28, 0, 'rainy', 21.0, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 01:22:17', 2.53, 0.0, 0.33, 0.15,
       2.05, 0, 'cloudy', 19.7, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 02:22:17', 3.31, 0.0, 0.79, 0.24,
       2.28, 0, 'rainy', 19.8, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 03:22:17', 1.9, 0.0, 0.84, 0.25,
       0.81, 0, 'windy', 27.1, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 04:22:17', 1.74, 0.0, 0.72, 0.89,
       0.13, 0, 'rainy', 17.1, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-21 05:22:17', 2.28, 0.0, 0.49, 0.83,
       0.96, 0, 'rainy', 26.4, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-21 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 06:22:17', 3.41, 2.21, 0.26, 0.27,
       0.67, 0, 'cloudy', 32.5, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 07:22:17', 2.5, 2.25, 0.69, 0.2,
       0, 0.64, 'cloudy', 21.0, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 08:22:17', 1.56, 1.4, 0.88, 0.73,
       0, 1.45, 'sunny', 16.3, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 09:22:17', 2.41, 0.89, 0.87, 0.84,
       0, 0.19, 'cloudy', 24.4, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 10:22:17', 1.72, 2.91, 1.08, 0.91,
       0, 3.18, 'cloudy', 19.5, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 11:22:17', 2.89, 2.15, 0.62, 0.78,
       0, 0.66, 'windy', 26.4, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 12:22:17', 2.58, 1.04, 1.45, 0.14,
       0, 0.05, 'cloudy', 21.9, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 13:22:17', 1.88, 0.99, 0.2, 0.43,
       0.26, 0, 'cloudy', 24.7, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 14:22:17', 3.25, 1.7, 0.43, 0.13,
       0.99, 0, 'windy', 29.9, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 15:22:17', 1.7, 2.72, 0.93, 0.29,
       0, 2.24, 'rainy', 21.9, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 16:22:17', 1.52, 2.23, 1.18, 0.03,
       0, 1.92, 'sunny', 28.4, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 17:22:17', 2.57, 2.45, 0.24, 0.85,
       0, 0.97, 'cloudy', 20.6, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 18:22:17', 1.76, 2.54, 0.31, 0.63,
       0, 1.72, 'windy', 21.0, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 19:22:17', 3.37, 0.0, 0.59, 0.73,
       2.05, 0, 'cloudy', 34.9, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 20:22:17', 1.53, 0.0, 1.5, 0.53,
       0, 0.5, 'cloudy', 18.5, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 21:22:17', 3.01, 0.0, 0.73, 0.49,
       1.79, 0, 'cloudy', 28.9, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 22:22:17', 2.83, 0.0, 0.7, 0.89,
       1.24, 0, 'rainy', 17.1, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 23:22:17', 2.77, 0.0, 1.31, 0.43,
       1.03, 0, 'rainy', 26.0, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 00:22:17', 1.58, 0.0, 0.55, 0.42,
       0.61, 0, 'rainy', 25.9, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 01:22:17', 3.27, 0.0, 0.43, 0.83,
       2.01, 0, 'sunny', 17.8, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 02:22:17', 2.65, 0.0, 1.32, 0.88,
       0.45, 0, 'sunny', 17.6, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 03:22:17', 1.87, 0.0, 1.1, 0.17,
       0.6, 0, 'windy', 20.6, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 04:22:17', 1.93, 0.0, 1.32, 0.78,
       0, 0.17, 'cloudy', 21.8, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-20 05:22:17', 2.9, 0.0, 1.15, 0.74,
       1.01, 0, 'windy', 24.7, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-20 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 06:22:17', 2.89, 2.14, 0.47, 0.11,
       0.17, 0, 'windy', 18.3, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 07:22:17', 2.7, 1.07, 0.24, 0.68,
       0.71, 0, 'cloudy', 19.2, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 08:22:17', 3.49, 0.96, 0.93, 0.63,
       0.97, 0, 'cloudy', 20.8, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 09:22:17', 2.08, 0.75, 1.21, 0.81,
       0, 0.69, 'sunny', 27.2, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 10:22:17', 3.25, 0.76, 0.79, 0.52,
       1.18, 0, 'sunny', 26.7, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 11:22:17', 3.08, 0.97, 1.48, 0.57,
       0.06, 0, 'rainy', 18.0, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 12:22:17', 1.95, 1.07, 0.95, 0.86,
       0, 0.93, 'windy', 15.3, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 13:22:17', 1.69, 0.52, 0.52, 0.42,
       0.23, 0, 'windy', 33.5, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 14:22:17', 2.5, 1.89, 0.95, 0.86,
       0, 1.2, 'sunny', 34.7, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 15:22:17', 2.34, 0.93, 0.79, 0.09,
       0.53, 0, 'sunny', 17.7, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 16:22:17', 2.77, 2.47, 0.9, 0.12,
       0, 0.72, 'rainy', 32.2, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 17:22:17', 3.44, 0.76, 0.23, 0.45,
       2.0, 0, 'cloudy', 34.9, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 18:22:17', 2.14, 1.84, 0.78, 0.79,
       0, 1.27, 'rainy', 32.8, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 19:22:17', 3.27, 0.0, 1.25, 0.82,
       1.2, 0, 'cloudy', 33.1, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 20:22:17', 2.14, 0.0, 1.16, 0.7,
       0.28, 0, 'sunny', 29.6, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 21:22:17', 2.33, 0.0, 1.38, 0.69,
       0.26, 0, 'rainy', 31.4, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 22:22:17', 1.79, 0.0, 0.72, 0.03,
       1.04, 0, 'sunny', 19.0, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 23:22:17', 3.23, 0.0, 0.88, 0.83,
       1.52, 0, 'cloudy', 33.6, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 00:22:17', 3.05, 0.0, 0.66, 0.19,
       2.2, 0, 'sunny', 17.3, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 01:22:17', 1.84, 0.0, 0.29, 0.32,
       1.23, 0, 'sunny', 19.0, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 02:22:17', 1.9, 0.0, 1.0, 0.24,
       0.66, 0, 'rainy', 24.9, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 03:22:17', 1.53, 0.0, 1.39, 0.22,
       0, 0.08, 'cloudy', 15.1, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 04:22:17', 2.02, 0.0, 0.42, 0.82,
       0.78, 0, 'cloudy', 26.9, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-19 05:22:17', 2.45, 0.0, 0.42, 0.99,
       1.04, 0, 'sunny', 28.0, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-19 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 06:22:17', 3.34, 2.42, 0.68, 0.22,
       0.02, 0, 'cloudy', 33.9, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 07:22:17', 3.31, 0.57, 0.52, 0.21,
       2.01, 0, 'cloudy', 33.9, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 08:22:17', 2.78, 0.97, 0.25, 0.12,
       1.44, 0, 'rainy', 35.0, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 09:22:17', 3.25, 2.94, 0.88, 0.33,
       0, 0.9, 'windy', 15.6, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 10:22:17', 2.23, 1.35, 0.91, 0.66,
       0, 0.69, 'cloudy', 34.1, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 11:22:17', 1.62, 1.32, 1.27, 0.32,
       0, 1.29, 'cloudy', 22.5, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 12:22:17', 3.12, 1.05, 1.13, 0.77,
       0.17, 0, 'cloudy', 28.5, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 13:22:17', 2.5, 0.57, 0.62, 0.62,
       0.69, 0, 'windy', 24.5, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 14:22:17', 3.25, 1.17, 0.53, 0.92,
       0.63, 0, 'rainy', 21.4, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 15:22:17', 2.35, 2.87, 1.38, 0.04,
       0, 1.94, 'windy', 22.7, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 16:22:17', 1.92, 1.73, 1.18, 0.29,
       0, 1.28, 'rainy', 24.9, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 17:22:17', 3.26, 2.04, 1.46, 0.98,
       0, 1.22, 'cloudy', 17.1, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 18:22:17', 2.75, 0.87, 0.78, 0.45,
       0.65, 0, 'sunny', 19.9, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 19:22:17', 2.95, 0.0, 0.86, 0.84,
       1.25, 0, 'windy', 18.8, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 20:22:17', 2.22, 0.0, 0.69, 0.09,
       1.44, 0, 'windy', 19.7, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 21:22:17', 2.77, 0.0, 0.59, 0.07,
       2.11, 0, 'cloudy', 24.6, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 22:22:17', 3.37, 0.0, 0.92, 0.97,
       1.48, 0, 'cloudy', 32.0, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 23:22:17', 3.24, 0.0, 0.81, 0.78,
       1.65, 0, 'sunny', 21.4, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 00:22:17', 2.03, 0.0, 0.22, 0.75,
       1.06, 0, 'cloudy', 34.4, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 01:22:17', 3.12, 0.0, 0.77, 0.62,
       1.73, 0, 'windy', 26.8, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 02:22:17', 2.73, 0.0, 0.74, 0.36,
       1.63, 0, 'rainy', 20.6, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 03:22:17', 2.28, 0.0, 0.51, 0.26,
       1.51, 0, 'sunny', 16.5, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 04:22:17', 2.69, 0.0, 0.37, 0.83,
       1.49, 0, 'rainy', 21.7, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-18 05:22:17', 2.57, 0.0, 1.14, 0.51,
       0.92, 0, 'rainy', 16.9, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-18 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 06:22:17', 2.09, 0.69, 1.08, 0.19,
       0.13, 0, 'cloudy', 33.0, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 07:22:17', 2.53, 2.45, 1.37, 0.22,
       0, 1.51, 'cloudy', 28.5, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 08:22:17', 3.3, 1.97, 0.78, 0.12,
       0.43, 0, 'rainy', 26.6, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 09:22:17', 1.97, 1.34, 1.21, 0.83,
       0, 1.41, 'cloudy', 23.6, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 10:22:17', 3.04, 1.33, 0.76, 0.71,
       0.24, 0, 'cloudy', 29.1, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 11:22:17', 2.55, 0.7, 0.32, 0.64,
       0.89, 0, 'sunny', 33.9, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 12:22:17', 2.15, 2.97, 1.3, 0.9,
       0, 3.02, 'windy', 31.5, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 13:22:17', 2.28, 1.88, 0.76, 0.91,
       0, 1.27, 'windy', 20.5, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 14:22:17', 2.81, 2.17, 1.02, 0.71,
       0, 1.09, 'rainy', 27.8, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 15:22:17', 1.84, 1.98, 0.62, 0.67,
       0, 1.43, 'cloudy', 22.8, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 16:22:17', 2.34, 2.95, 0.79, 0.19,
       0, 1.59, 'cloudy', 18.0, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 17:22:17', 2.24, 2.82, 0.94, 0.58,
       0, 2.1, 'sunny', 19.4, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 18:22:17', 2.69, 2.09, 1.12, 0.73,
       0, 1.25, 'rainy', 33.0, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 19:22:17', 2.31, 0.0, 0.94, 0.8,
       0.57, 0, 'rainy', 16.1, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 20:22:17', 2.9, 0.0, 0.86, 0.83,
       1.21, 0, 'rainy', 30.2, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 21:22:17', 2.99, 0.0, 0.38, 0.46,
       2.15, 0, 'windy', 23.2, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 22:22:17', 3.06, 0.0, 1.24, 0.59,
       1.23, 0, 'cloudy', 22.7, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 23:22:17', 1.61, 0.0, 0.78, 0.76,
       0.07, 0, 'rainy', 33.1, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 00:22:17', 1.91, 0.0, 0.91, 0.42,
       0.58, 0, 'windy', 16.2, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 01:22:17', 2.72, 0.0, 0.25, 0.26,
       2.21, 0, 'cloudy', 28.9, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 02:22:17', 2.65, 0.0, 0.59, 0.89,
       1.17, 0, 'sunny', 15.3, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 03:22:17', 2.62, 0.0, 0.87, 0.01,
       1.74, 0, 'cloudy', 29.8, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 04:22:17', 2.65, 0.0, 1.44, 0.93,
       0.28, 0, 'sunny', 17.7, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-17 05:22:17', 2.36, 0.0, 0.95, 0.84,
       0.57, 0, 'rainy', 18.7, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-17 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 06:22:17', 2.1, 1.94, 1.48, 0.88,
       0, 2.2, 'sunny', 31.3, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 07:22:17', 2.31, 2.29, 0.93, 0.34,
       0, 1.25, 'windy', 29.4, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 08:22:17', 2.11, 0.8, 0.69, 0.77,
       0, 0.15, 'sunny', 24.3, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 09:22:17', 1.75, 0.91, 0.74, 0.34,
       0, 0.24, 'windy', 28.6, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 10:22:17', 3.05, 2.87, 0.88, 0.04,
       0, 0.74, 'rainy', 19.6, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 11:22:17', 1.91, 1.91, 1.46, 0.04,
       0, 1.5, 'windy', 30.2, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 12:22:17', 1.6, 2.03, 1.29, 0.04,
       0, 1.76, 'rainy', 17.7, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 13:22:17', 2.19, 1.3, 0.58, 0.73,
       0, 0.42, 'windy', 28.8, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 14:22:17', 2.58, 1.4, 1.05, 0.29,
       0, 0.16, 'rainy', 19.6, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 15:22:17', 2.98, 0.89, 0.73, 0.94,
       0.42, 0, 'sunny', 15.7, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 16:22:17', 2.68, 0.57, 0.32, 0.97,
       0.82, 0, 'sunny', 20.9, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 17:22:17', 2.81, 1.76, 1.27, 0.34,
       0, 0.56, 'windy', 30.8, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 18:22:17', 1.5, 2.78, 1.18, 0.93,
       0, 3.39, 'sunny', 15.6, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 19:22:17', 2.07, 0.0, 0.32, 0.03,
       1.72, 0, 'rainy', 30.2, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 20:22:17', 1.78, 0.0, 0.36, 0.1,
       1.32, 0, 'cloudy', 19.2, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 21:22:17', 1.91, 0.0, 1.01, 0.14,
       0.76, 0, 'rainy', 25.2, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 22:22:17', 2.42, 0.0, 0.37, 0.61,
       1.44, 0, 'rainy', 30.6, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 23:22:17', 3.03, 0.0, 0.37, 0.06,
       2.6, 0, 'cloudy', 26.6, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 00:22:17', 2.3, 0.0, 0.42, 0.46,
       1.42, 0, 'cloudy', 30.5, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 01:22:17', 1.74, 0.0, 0.49, 0.82,
       0.43, 0, 'sunny', 31.1, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 02:22:17', 2.27, 0.0, 0.54, 0.94,
       0.79, 0, 'rainy', 15.4, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 03:22:17', 3.05, 0.0, 1.01, 0.0,
       2.04, 0, 'windy', 29.3, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 04:22:17', 3.14, 0.0, 0.77, 0.96,
       1.41, 0, 'windy', 33.8, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-16 05:22:17', 1.9, 0.0, 0.71, 0.09,
       1.1, 0, 'rainy', 26.2, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-16 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 06:22:17', 2.64, 1.61, 0.4, 0.51,
       0.12, 0, 'sunny', 31.8, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 07:22:17', 3.33, 2.88, 1.41, 0.23,
       0, 1.19, 'cloudy', 29.8, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 08:22:17', 1.53, 0.61, 0.33, 0.93,
       0, 0.34, 'rainy', 22.3, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 09:22:17', 2.61, 2.96, 0.68, 0.99,
       0, 2.02, 'cloudy', 31.0, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 10:22:17', 1.85, 2.63, 0.55, 0.1,
       0, 1.43, 'windy', 15.5, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 11:22:17', 3.03, 2.12, 0.9, 0.5,
       0, 0.49, 'cloudy', 31.4, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 12:22:17', 1.74, 0.6, 0.74, 0.35,
       0.05, 0, 'cloudy', 35.0, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 13:22:17', 1.97, 2.59, 0.45, 0.28,
       0, 1.35, 'sunny', 20.7, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 14:22:17', 3.04, 2.88, 1.49, 0.88,
       0, 2.21, 'windy', 30.5, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 15:22:17', 2.33, 2.39, 0.74, 0.79,
       0, 1.59, 'windy', 22.9, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 16:22:17', 2.69, 2.7, 1.21, 0.02,
       0, 1.24, 'windy', 32.8, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 17:22:17', 2.27, 2.57, 0.99, 0.75,
       0, 2.04, 'cloudy', 15.9, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 18:22:17', 1.7, 0.59, 1.2, 0.4,
       0, 0.49, 'rainy', 16.9, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 19:22:17', 2.73, 0.0, 0.61, 0.89,
       1.23, 0, 'rainy', 31.2, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 20:22:17', 3.19, 0.0, 1.33, 0.23,
       1.63, 0, 'sunny', 33.3, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 21:22:17', 2.08, 0.0, 0.3, 0.83,
       0.95, 0, 'sunny', 27.0, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 22:22:17', 2.62, 0.0, 1.22, 0.44,
       0.96, 0, 'cloudy', 17.4, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 23:22:17', 1.69, 0.0, 1.25, 0.27,
       0.17, 0, 'sunny', 29.4, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 00:22:17', 2.49, 0.0, 0.88, 0.87,
       0.74, 0, 'windy', 26.2, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 01:22:17', 1.5, 0.0, 1.29, 0.41,
       0, 0.2, 'rainy', 16.6, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 02:22:17', 3.44, 0.0, 1.18, 0.74,
       1.52, 0, 'sunny', 15.6, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 03:22:17', 2.27, 0.0, 0.54, 0.62,
       1.11, 0, 'sunny', 33.6, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 04:22:17', 1.81, 0.0, 0.84, 0.5,
       0.47, 0, 'rainy', 28.7, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-15 05:22:17', 2.86, 0.0, 0.99, 0.73,
       1.14, 0, 'sunny', 26.8, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-15 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 06:22:17', 3.1, 1.45, 1.14, 0.06,
       0.45, 0, 'windy', 31.6, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 07:22:17', 2.97, 1.46, 1.15, 0.73,
       0, 0.37, 'windy', 29.9, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 08:22:17', 2.88, 2.4, 1.48, 0.58,
       0, 1.58, 'rainy', 25.1, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 09:22:17', 2.53, 2.58, 1.37, 0.76,
       0, 2.18, 'rainy', 32.3, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 10:22:17', 2.33, 1.63, 0.97, 0.64,
       0, 0.91, 'sunny', 21.7, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 11:22:17', 2.52, 1.31, 0.84, 0.96,
       0, 0.59, 'windy', 30.4, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 12:22:17', 2.91, 0.87, 0.85, 0.05,
       1.14, 0, 'rainy', 21.3, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 13:22:17', 1.69, 2.04, 0.58, 0.86,
       0, 1.79, 'rainy', 18.8, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 14:22:17', 1.54, 0.93, 0.27, 0.65,
       0, 0.31, 'windy', 19.1, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 15:22:17', 2.37, 1.47, 1.43, 0.52,
       0, 1.05, 'rainy', 24.1, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 16:22:17', 3.45, 2.29, 1.35, 0.1,
       0, 0.29, 'windy', 29.2, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 17:22:17', 2.13, 1.84, 1.11, 0.77,
       0, 1.59, 'windy', 30.4, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 18:22:17', 3.41, 1.44, 0.77, 0.12,
       1.08, 0, 'sunny', 18.3, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 19:22:17', 2.73, 0.0, 0.52, 0.88,
       1.33, 0, 'cloudy', 27.3, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 20:22:17', 1.77, 0.0, 0.39, 0.35,
       1.03, 0, 'sunny', 19.2, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 21:22:17', 2.33, 0.0, 0.49, 0.6,
       1.24, 0, 'sunny', 25.1, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 22:22:17', 2.29, 0.0, 1.31, 0.18,
       0.8, 0, 'rainy', 22.7, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 23:22:17', 2.88, 0.0, 0.51, 0.23,
       2.14, 0, 'sunny', 34.3, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 00:22:17', 1.62, 0.0, 1.04, 0.52,
       0.06, 0, 'rainy', 32.6, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 01:22:17', 2.77, 0.0, 0.9, 0.92,
       0.95, 0, 'rainy', 15.6, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 02:22:17', 2.71, 0.0, 0.59, 0.5,
       1.62, 0, 'rainy', 23.5, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 03:22:17', 1.8, 0.0, 1.31, 0.24,
       0.25, 0, 'windy', 34.8, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 04:22:17', 2.51, 0.0, 0.53, 0.36,
       1.62, 0, 'windy', 21.1, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-14 05:22:17', 2.43, 0.0, 1.45, 0.2,
       0.78, 0, 'sunny', 19.5, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-14 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 06:22:17', 3.05, 2.23, 0.78, 0.05,
       0, 0.01, 'cloudy', 26.0, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 07:22:17', 3.48, 2.5, 0.3, 0.2,
       0.48, 0, 'sunny', 34.5, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 08:22:17', 3.18, 1.15, 0.33, 0.98,
       0.72, 0, 'windy', 32.6, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 09:22:17', 1.91, 0.55, 0.94, 0.54,
       0, 0.12, 'rainy', 16.8, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 10:22:17', 2.05, 2.59, 1.28, 0.12,
       0, 1.94, 'rainy', 18.4, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 11:22:17', 2.57, 1.95, 0.74, 0.77,
       0, 0.89, 'cloudy', 27.6, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 12:22:17', 1.88, 1.39, 1.12, 0.89,
       0, 1.52, 'rainy', 30.2, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 13:22:17', 1.64, 2.58, 0.83, 0.77,
       0, 2.54, 'cloudy', 31.8, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 14:22:17', 2.04, 1.59, 0.25, 0.58,
       0, 0.38, 'cloudy', 17.9, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 15:22:17', 3.06, 1.78, 0.46, 0.5,
       0.32, 0, 'rainy', 26.7, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 16:22:17', 1.85, 1.51, 0.76, 0.95,
       0, 1.37, 'rainy', 29.0, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 17:22:17', 1.92, 1.86, 0.44, 0.53,
       0, 0.91, 'rainy', 16.0, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 18:22:17', 3.18, 1.28, 0.41, 0.59,
       0.9, 0, 'rainy', 30.0, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 19:22:17', 1.75, 0.0, 0.54, 0.87,
       0.34, 0, 'rainy', 22.2, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 20:22:17', 3.43, 0.0, 0.8, 0.41,
       2.22, 0, 'rainy', 21.2, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 21:22:17', 1.52, 0.0, 1.09, 0.64,
       0, 0.21, 'rainy', 20.0, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 22:22:17', 2.51, 0.0, 1.12, 0.81,
       0.58, 0, 'cloudy', 30.7, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 23:22:17', 2.6, 0.0, 0.83, 0.64,
       1.13, 0, 'sunny', 30.3, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 00:22:17', 1.71, 0.0, 1.04, 0.15,
       0.52, 0, 'sunny', 30.3, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 01:22:17', 1.98, 0.0, 0.73, 0.37,
       0.88, 0, 'rainy', 34.8, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 02:22:17', 2.17, 0.0, 0.79, 0.67,
       0.71, 0, 'cloudy', 30.8, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 03:22:17', 2.48, 0.0, 1.43, 0.88,
       0.17, 0, 'windy', 27.8, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 04:22:17', 2.4, 0.0, 1.05, 0.17,
       1.18, 0, 'windy', 32.5, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-13 05:22:17', 3.3, 0.0, 0.62, 0.53,
       2.15, 0, 'windy', 17.0, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-13 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 06:22:17', 3.47, 2.51, 0.87, 0.28,
       0, 0.19, 'cloudy', 33.3, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 07:22:17', 1.79, 0.65, 1.06, 0.38,
       0, 0.3, 'sunny', 26.9, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 08:22:17', 3.03, 2.21, 0.59, 0.88,
       0, 0.65, 'sunny', 20.7, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 09:22:17', 3.21, 1.2, 1.01, 0.2,
       0.8, 0, 'windy', 28.2, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 10:22:17', 2.51, 2.87, 0.76, 0.23,
       0, 1.35, 'cloudy', 25.4, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 11:22:17', 2.66, 1.96, 0.23, 0.08,
       0.39, 0, 'rainy', 17.4, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 12:22:17', 2.67, 2.6, 0.27, 0.22,
       0, 0.42, 'sunny', 30.2, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 13:22:17', 1.86, 2.59, 1.32, 0.56,
       0, 2.61, 'rainy', 21.1, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 14:22:17', 2.28, 2.76, 1.32, 0.93,
       0, 2.73, 'windy', 34.4, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 15:22:17', 2.97, 1.93, 1.41, 0.89,
       0, 1.26, 'rainy', 34.8, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 16:22:17', 3.04, 1.3, 0.72, 0.19,
       0.83, 0, 'rainy', 31.3, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 17:22:17', 1.71, 0.92, 0.22, 0.96,
       0, 0.39, 'windy', 22.5, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 18:22:17', 2.5, 2.95, 0.88, 0.21,
       0, 1.54, 'windy', 22.8, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 19:22:17', 2.7, 0.0, 1.08, 0.54,
       1.08, 0, 'rainy', 34.4, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 20:22:17', 3.1, 0.0, 0.45, 0.93,
       1.72, 0, 'rainy', 23.6, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 21:22:17', 3.18, 0.0, 0.5, 0.97,
       1.71, 0, 'rainy', 25.1, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 22:22:17', 3.17, 0.0, 0.25, 0.03,
       2.89, 0, 'sunny', 17.6, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 23:22:17', 3.3, 0.0, 0.49, 0.77,
       2.04, 0, 'cloudy', 22.8, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 00:22:17', 2.38, 0.0, 0.82, 0.45,
       1.11, 0, 'cloudy', 19.3, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 01:22:17', 1.96, 0.0, 0.54, 0.61,
       0.81, 0, 'rainy', 25.8, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 02:22:17', 2.85, 0.0, 1.23, 0.51,
       1.11, 0, 'rainy', 32.6, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 03:22:17', 2.52, 0.0, 0.6, 0.11,
       1.81, 0, 'sunny', 17.1, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 04:22:17', 3.46, 0.0, 0.58, 0.34,
       2.54, 0, 'rainy', 17.9, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-12 05:22:17', 3.14, 0.0, 0.31, 0.63,
       2.2, 0, 'rainy', 19.6, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-12 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 06:22:17', 2.02, 1.05, 0.44, 0.97,
       0, 0.44, 'rainy', 17.4, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 07:22:17', 3.08, 2.92, 1.12, 0.37,
       0, 1.33, 'windy', 29.8, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 08:22:17', 2.24, 2.68, 0.96, 0.66,
       0, 2.06, 'windy', 32.9, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 09:22:17', 2.14, 0.92, 0.95, 0.69,
       0, 0.42, 'cloudy', 28.8, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 10:22:17', 2.67, 1.89, 1.19, 0.56,
       0, 0.97, 'rainy', 23.2, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 11:22:17', 3.1, 1.62, 1.38, 0.98,
       0, 0.88, 'sunny', 31.5, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 12:22:17', 2.86, 2.35, 1.43, 0.35,
       0, 1.27, 'sunny', 23.1, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 13:22:17', 1.76, 1.98, 1.07, 0.21,
       0, 1.5, 'windy', 19.8, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 14:22:17', 2.65, 1.53, 0.35, 0.98,
       0, 0.21, 'windy', 24.7, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 15:22:17', 2.46, 2.5, 0.96, 0.02,
       0, 1.02, 'windy', 27.8, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 16:22:17', 2.53, 0.68, 0.62, 0.85,
       0.38, 0, 'sunny', 26.1, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 17:22:17', 2.1, 1.71, 1.46, 0.24,
       0, 1.31, 'windy', 19.0, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 18:22:17', 2.36, 2.85, 0.26, 0.79,
       0, 1.54, 'rainy', 15.5, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 19:22:17', 2.3, 0.0, 1.31, 0.78,
       0.21, 0, 'sunny', 24.2, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 20:22:17', 3.39, 0.0, 0.78, 0.61,
       2.0, 0, 'cloudy', 17.8, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 21:22:17', 2.14, 0.0, 0.4, 0.21,
       1.53, 0, 'windy', 32.1, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 22:22:17', 2.61, 0.0, 0.39, 0.17,
       2.05, 0, 'windy', 21.0, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 23:22:17', 2.83, 0.0, 1.5, 0.99,
       0.34, 0, 'rainy', 15.5, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 00:22:17', 2.12, 0.0, 1.02, 0.51,
       0.59, 0, 'rainy', 25.1, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 01:22:17', 2.57, 0.0, 0.94, 0.32,
       1.31, 0, 'sunny', 19.6, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 02:22:17', 2.93, 0.0, 1.17, 0.0,
       1.76, 0, 'sunny', 33.0, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 03:22:17', 2.0, 0.0, 0.88, 0.32,
       0.8, 0, 'sunny', 19.9, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 04:22:17', 2.64, 0.0, 0.58, 0.99,
       1.07, 0, 'rainy', 15.3, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-11 05:22:17', 3.07, 0.0, 0.91, 0.96,
       1.2, 0, 'windy', 24.1, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-11 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 06:22:17', 3.23, 1.44, 0.39, 0.68,
       0.72, 0, 'windy', 15.9, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 07:22:17', 3.28, 1.16, 0.25, 0.3,
       1.57, 0, 'sunny', 15.1, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 08:22:17', 2.25, 1.16, 0.95, 0.51,
       0, 0.37, 'windy', 32.0, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 09:22:17', 2.34, 0.8, 1.17, 0.4,
       0, 0.03, 'cloudy', 28.5, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 10:22:17', 3.46, 1.08, 1.06, 0.06,
       1.26, 0, 'sunny', 34.8, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 11:22:17', 3.26, 1.95, 0.6, 0.42,
       0.29, 0, 'rainy', 30.1, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 12:22:17', 1.68, 1.56, 0.85, 0.78,
       0, 1.51, 'sunny', 16.0, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 13:22:17', 2.38, 0.71, 0.63, 0.03,
       1.01, 0, 'rainy', 28.8, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 14:22:17', 2.92, 2.02, 0.28, 0.37,
       0.25, 0, 'windy', 23.5, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 15:22:17', 2.69, 1.24, 0.82, 0.18,
       0.45, 0, 'cloudy', 19.8, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 16:22:17', 3.27, 2.97, 1.23, 0.6,
       0, 1.53, 'rainy', 23.1, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 17:22:17', 3.23, 1.78, 1.07, 0.0,
       0.38, 0, 'cloudy', 28.3, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 18:22:17', 1.57, 2.38, 0.25, 0.16,
       0, 1.22, 'windy', 27.0, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 19:22:17', 1.89, 0.0, 0.47, 0.1,
       1.32, 0, 'windy', 25.4, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 20:22:17', 1.52, 0.0, 0.28, 0.05,
       1.19, 0, 'windy', 32.0, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 21:22:17', 2.01, 0.0, 1.25, 0.12,
       0.64, 0, 'sunny', 31.9, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 22:22:17', 2.46, 0.0, 1.15, 0.68,
       0.63, 0, 'sunny', 17.9, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 23:22:17', 2.24, 0.0, 0.4, 0.73,
       1.11, 0, 'rainy', 25.6, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 00:22:17', 2.42, 0.0, 0.66, 0.65,
       1.11, 0, 'windy', 15.2, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 01:22:17', 1.78, 0.0, 0.88, 0.53,
       0.37, 0, 'sunny', 16.2, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 02:22:17', 3.16, 0.0, 1.3, 0.69,
       1.17, 0, 'cloudy', 27.9, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 03:22:17', 2.35, 0.0, 1.37, 0.81,
       0.17, 0, 'cloudy', 27.8, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 04:22:17', 1.55, 0.0, 0.43, 0.16,
       0.96, 0, 'sunny', 28.4, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-10 05:22:17', 2.1, 0.0, 0.4, 0.71,
       0.99, 0, 'sunny', 17.0, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-10 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 06:22:17', 2.48, 0.89, 1.05, 0.06,
       0.48, 0, 'windy', 19.0, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 07:22:17', 3.02, 1.54, 0.84, 0.18,
       0.46, 0, 'cloudy', 26.0, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 08:22:17', 2.11, 2.43, 0.99, 0.96,
       0, 2.27, 'rainy', 22.0, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 09:22:17', 2.34, 1.11, 0.36, 0.86,
       0.01, 0, 'cloudy', 24.4, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 10:22:17', 2.85, 1.6, 0.45, 0.62,
       0.18, 0, 'windy', 32.3, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 11:22:17', 1.61, 1.76, 0.34, 0.54,
       0, 1.03, 'windy', 22.6, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 12:22:17', 2.28, 1.63, 1.42, 0.08,
       0, 0.85, 'cloudy', 23.0, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 13:22:17', 2.46, 1.39, 1.25, 0.66,
       0, 0.84, 'cloudy', 34.3, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 14:22:17', 1.73, 0.85, 0.23, 0.05,
       0.6, 0, 'windy', 26.2, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 15:22:17', 1.98, 1.59, 0.57, 0.66,
       0, 0.84, 'windy', 33.4, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 16:22:17', 1.97, 2.77, 0.22, 0.86,
       0, 1.88, 'cloudy', 22.9, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 17:22:17', 3.46, 1.7, 0.67, 0.48,
       0.61, 0, 'rainy', 25.3, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 18:22:17', 3.33, 1.26, 0.94, 0.44,
       0.69, 0, 'rainy', 22.4, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 19:22:17', 3.37, 0.0, 1.04, 0.38,
       1.95, 0, 'cloudy', 29.7, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 20:22:17', 3.04, 0.0, 0.98, 0.52,
       1.54, 0, 'windy', 16.8, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 21:22:17', 2.06, 0.0, 1.32, 0.88,
       0, 0.14, 'windy', 34.9, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 22:22:17', 2.38, 0.0, 1.03, 0.86,
       0.49, 0, 'sunny', 32.1, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 23:22:17', 3.4, 0.0, 1.09, 0.0,
       2.31, 0, 'windy', 34.6, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 00:22:17', 1.83, 0.0, 1.25, 0.15,
       0.43, 0, 'sunny', 21.0, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 01:22:17', 2.83, 0.0, 0.75, 0.58,
       1.5, 0, 'cloudy', 17.4, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 02:22:17', 3.12, 0.0, 1.4, 0.13,
       1.59, 0, 'rainy', 23.5, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 03:22:17', 2.84, 0.0, 0.88, 0.29,
       1.67, 0, 'sunny', 31.1, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 04:22:17', 1.9, 0.0, 0.82, 0.32,
       0.76, 0, 'rainy', 22.3, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-09 05:22:17', 2.76, 0.0, 0.63, 0.08,
       2.05, 0, 'rainy', 34.4, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-09 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 06:22:17', 3.26, 1.31, 0.39, 0.23,
       1.33, 0, 'sunny', 30.5, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 07:22:17', 1.84, 0.68, 1.15, 0.16,
       0, 0.15, 'cloudy', 19.3, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 08:22:17', 1.64, 1.7, 0.85, 0.14,
       0, 1.05, 'cloudy', 30.9, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 09:22:17', 2.28, 1.64, 1.39, 0.12,
       0, 0.87, 'rainy', 22.5, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 10:22:17', 2.1, 2.43, 0.49, 0.49,
       0, 1.31, 'sunny', 35.0, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 11:22:17', 2.64, 1.06, 0.57, 0.57,
       0.44, 0, 'rainy', 24.9, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 12:22:17', 2.9, 1.5, 1.41, 0.48,
       0, 0.49, 'rainy', 21.6, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 13:22:17', 3.47, 2.58, 0.66, 0.35,
       0, 0.12, 'sunny', 26.3, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 14:22:17', 2.61, 1.73, 0.93, 0.3,
       0, 0.35, 'windy', 33.0, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 15:22:17', 2.19, 1.49, 0.88, 0.89,
       0, 1.07, 'cloudy', 30.7, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 16:22:17', 2.12, 0.77, 1.45, 0.32,
       0, 0.42, 'windy', 32.7, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 17:22:17', 3.44, 1.45, 1.27, 0.96,
       0, 0.24, 'windy', 25.7, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 18:22:17', 3.47, 2.33, 0.76, 0.16,
       0.22, 0, 'rainy', 27.8, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 19:22:17', 2.72, 0.0, 0.74, 0.56,
       1.42, 0, 'cloudy', 32.1, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 20:22:17', 1.59, 0.0, 0.69, 0.82,
       0.08, 0, 'windy', 34.3, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 21:22:17', 2.56, 0.0, 1.25, 0.67,
       0.64, 0, 'rainy', 25.0, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 22:22:17', 2.17, 0.0, 0.27, 0.36,
       1.54, 0, 'windy', 18.2, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 23:22:17', 3.44, 0.0, 1.44, 0.77,
       1.23, 0, 'windy', 24.9, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 00:22:17', 3.09, 0.0, 1.39, 0.78,
       0.92, 0, 'rainy', 22.7, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 01:22:17', 1.95, 0.0, 0.24, 0.37,
       1.34, 0, 'rainy', 30.3, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 02:22:17', 1.52, 0.0, 0.65, 0.86,
       0.01, 0, 'sunny', 20.2, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 03:22:17', 1.56, 0.0, 0.42, 0.69,
       0.45, 0, 'sunny', 19.2, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 04:22:17', 2.08, 0.0, 0.5, 0.92,
       0.66, 0, 'cloudy', 22.6, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-08 05:22:17', 2.28, 0.0, 0.68, 0.47,
       1.13, 0, 'sunny', 19.4, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-08 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 06:22:17', 1.67, 1.65, 0.59, 0.18,
       0, 0.75, 'windy', 34.5, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 07:22:17', 2.68, 2.0, 0.6, 0.72,
       0, 0.64, 'rainy', 31.4, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 08:22:17', 2.0, 2.86, 0.29, 0.45,
       0, 1.6, 'rainy', 23.7, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 09:22:17', 2.49, 2.77, 1.24, 0.4,
       0, 1.92, 'windy', 31.9, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 10:22:17', 2.06, 1.29, 0.33, 0.08,
       0.36, 0, 'sunny', 20.6, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 11:22:17', 1.84, 0.81, 1.03, 0.6,
       0, 0.6, 'cloudy', 20.3, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 12:22:17', 3.15, 2.54, 0.6, 0.7,
       0, 0.69, 'rainy', 17.6, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 13:22:17', 2.98, 1.89, 0.34, 0.08,
       0.67, 0, 'sunny', 26.6, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 14:22:17', 3.22, 1.42, 0.27, 0.37,
       1.16, 0, 'windy', 34.4, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 15:22:17', 3.39, 1.42, 1.27, 0.51,
       0.19, 0, 'rainy', 28.3, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 16:22:17', 1.7, 2.33, 0.61, 0.97,
       0, 2.21, 'windy', 15.6, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 17:22:17', 1.99, 0.59, 1.15, 0.92,
       0, 0.67, 'sunny', 30.7, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 18:22:17', 3.08, 2.94, 0.67, 0.19,
       0, 0.72, 'sunny', 35.0, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 19:22:17', 2.22, 0.0, 0.55, 0.06,
       1.61, 0, 'windy', 15.9, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 20:22:17', 2.39, 0.0, 0.89, 0.48,
       1.02, 0, 'windy', 19.5, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 21:22:17', 1.99, 0.0, 0.48, 0.65,
       0.86, 0, 'cloudy', 26.1, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 22:22:17', 3.11, 0.0, 1.45, 0.64,
       1.02, 0, 'windy', 17.0, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 23:22:17', 2.01, 0.0, 0.22, 0.38,
       1.41, 0, 'cloudy', 19.0, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 00:22:17', 3.21, 0.0, 0.9, 0.39,
       1.92, 0, 'cloudy', 28.1, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 01:22:17', 2.95, 0.0, 0.91, 0.6,
       1.44, 0, 'sunny', 15.8, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 02:22:17', 2.9, 0.0, 0.78, 0.6,
       1.52, 0, 'cloudy', 22.0, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 03:22:17', 1.73, 0.0, 0.73, 0.15,
       0.85, 0, 'cloudy', 25.7, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 04:22:17', 2.23, 0.0, 0.46, 0.3,
       1.47, 0, 'sunny', 28.7, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-07 05:22:17', 2.08, 0.0, 0.35, 0.86,
       0.87, 0, 'cloudy', 22.5, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-07 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 06:22:17', 1.64, 2.69, 1.34, 0.09,
       0, 2.48, 'cloudy', 20.7, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 07:22:17', 2.82, 1.12, 0.59, 0.55,
       0.56, 0, 'windy', 22.1, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 08:22:17', 2.82, 2.14, 0.27, 0.99,
       0, 0.58, 'windy', 22.1, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 09:22:17', 2.46, 1.53, 1.33, 0.7,
       0, 1.1, 'sunny', 22.0, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 10:22:17', 3.2, 1.69, 1.05, 0.86,
       0, 0.4, 'cloudy', 22.6, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 11:22:17', 1.79, 0.57, 0.51, 0.37,
       0.34, 0, 'cloudy', 15.7, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 12:22:17', 2.1, 2.59, 0.72, 0.42,
       0, 1.63, 'windy', 17.6, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 13:22:17', 2.78, 1.47, 0.75, 0.83,
       0, 0.27, 'windy', 19.9, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 14:22:17', 2.24, 1.15, 1.37, 0.03,
       0, 0.31, 'rainy', 29.4, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 15:22:17', 3.08, 1.5, 1.4, 0.73,
       0, 0.55, 'cloudy', 24.4, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 16:22:17', 2.14, 1.23, 1.45, 0.32,
       0, 0.86, 'windy', 24.0, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 17:22:17', 2.65, 0.63, 0.55, 0.03,
       1.44, 0, 'rainy', 18.7, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 18:22:17', 2.03, 1.58, 1.43, 0.45,
       0, 1.43, 'windy', 18.1, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 19:22:17', 2.86, 0.0, 0.83, 0.95,
       1.08, 0, 'windy', 32.7, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 20:22:17', 2.86, 0.0, 0.63, 0.48,
       1.75, 0, 'cloudy', 31.0, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 21:22:17', 3.06, 0.0, 0.62, 0.66,
       1.78, 0, 'cloudy', 31.3, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 22:22:17', 3.48, 0.0, 0.54, 0.37,
       2.57, 0, 'cloudy', 19.6, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 23:22:17', 2.17, 0.0, 1.43, 0.19,
       0.55, 0, 'sunny', 24.0, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 00:22:17', 2.59, 0.0, 0.67, 0.92,
       1.0, 0, 'cloudy', 31.6, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 01:22:17', 2.07, 0.0, 0.9, 0.27,
       0.9, 0, 'cloudy', 29.1, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 02:22:17', 2.87, 0.0, 0.76, 0.55,
       1.56, 0, 'sunny', 22.1, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 03:22:17', 2.19, 0.0, 0.58, 0.25,
       1.36, 0, 'rainy', 17.3, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 04:22:17', 2.52, 0.0, 1.44, 0.01,
       1.07, 0, 'cloudy', 24.2, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-06 05:22:17', 3.0, 0.0, 0.57, 0.9,
       1.53, 0, 'windy', 25.1, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-06 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 06:22:17', 3.32, 2.73, 1.42, 0.89,
       0, 1.72, 'windy', 17.6, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 07:22:17', 2.01, 0.75, 0.39, 0.86,
       0.01, 0, 'cloudy', 27.2, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 08:22:17', 2.63, 2.05, 1.21, 0.1,
       0, 0.73, 'windy', 28.7, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 09:22:17', 1.79, 0.65, 0.27, 0.54,
       0.33, 0, 'rainy', 15.6, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 10:22:17', 1.79, 2.84, 1.09, 0.99,
       0, 3.13, 'rainy', 20.7, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 11:22:17', 3.31, 1.75, 0.34, 0.88,
       0.34, 0, 'windy', 30.6, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 12:22:17', 1.81, 1.84, 1.46, 0.25,
       0, 1.74, 'cloudy', 33.8, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 13:22:17', 2.57, 1.03, 1.44, 0.21,
       0, 0.11, 'sunny', 29.4, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 14:22:17', 2.96, 1.88, 0.29, 0.66,
       0.13, 0, 'windy', 23.4, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 15:22:17', 1.79, 1.84, 0.61, 0.83,
       0, 1.49, 'cloudy', 25.7, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 16:22:17', 2.29, 1.47, 1.31, 0.69,
       0, 1.18, 'cloudy', 29.1, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 17:22:17', 3.02, 1.55, 0.81, 0.38,
       0.28, 0, 'cloudy', 30.8, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 18:22:17', 2.4, 2.8, 1.11, 0.11,
       0, 1.62, 'sunny', 20.1, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 19:22:17', 2.34, 0.0, 0.49, 0.23,
       1.62, 0, 'rainy', 34.6, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 20:22:17', 1.91, 0.0, 1.1, 0.88,
       0, 0.07, 'cloudy', 30.5, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 21:22:17', 1.71, 0.0, 1.23, 0.42,
       0.06, 0, 'sunny', 22.0, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 22:22:17', 2.62, 0.0, 0.54, 0.12,
       1.96, 0, 'windy', 25.5, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 23:22:17', 3.09, 0.0, 0.65, 0.75,
       1.69, 0, 'rainy', 27.2, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 00:22:17', 1.68, 0.0, 0.38, 0.97,
       0.33, 0, 'cloudy', 20.4, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 01:22:17', 2.46, 0.0, 0.73, 0.44,
       1.29, 0, 'rainy', 18.4, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 02:22:17', 3.15, 0.0, 0.31, 0.72,
       2.12, 0, 'sunny', 33.0, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 03:22:17', 2.8, 0.0, 0.37, 0.42,
       2.01, 0, 'rainy', 28.1, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 04:22:17', 2.47, 0.0, 1.07, 0.67,
       0.73, 0, 'rainy', 30.3, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-05 05:22:17', 2.61, 0.0, 0.72, 0.49,
       1.4, 0, 'cloudy', 19.2, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-05 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 06:22:17', 3.14, 1.12, 0.55, 0.12,
       1.35, 0, 'rainy', 33.6, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 07:22:17', 2.81, 0.96, 1.03, 0.11,
       0.71, 0, 'rainy', 26.8, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 08:22:17', 1.61, 0.79, 1.47, 0.84,
       0, 1.49, 'windy', 18.3, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 09:22:17', 2.28, 1.36, 0.29, 0.52,
       0.11, 0, 'cloudy', 34.5, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 10:22:17', 2.09, 2.28, 0.86, 0.23,
       0, 1.28, 'windy', 32.2, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 11:22:17', 1.62, 2.29, 0.76, 0.78,
       0, 2.21, 'windy', 29.3, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 12:22:17', 1.67, 0.98, 1.07, 0.15,
       0, 0.53, 'cloudy', 32.8, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 13:22:17', 1.92, 2.89, 0.73, 0.43,
       0, 2.13, 'windy', 27.1, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 14:22:17', 2.66, 0.81, 0.81, 0.95,
       0.09, 0, 'rainy', 20.1, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 15:22:17', 2.28, 1.8, 1.38, 0.9,
       0, 1.8, 'cloudy', 16.3, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 16:22:17', 1.67, 2.06, 1.39, 0.99,
       0, 2.77, 'windy', 19.9, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 17:22:17', 2.75, 2.19, 0.6, 0.56,
       0, 0.6, 'rainy', 32.8, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 18:22:17', 2.96, 1.85, 0.62, 0.71,
       0, 0.22, 'windy', 31.9, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 19:22:17', 3.3, 0.0, 0.35, 0.43,
       2.52, 0, 'sunny', 32.6, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 20:22:17', 2.63, 0.0, 0.35, 0.4,
       1.88, 0, 'sunny', 18.7, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 21:22:17', 2.24, 0.0, 0.74, 0.29,
       1.21, 0, 'rainy', 21.2, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 22:22:17', 2.01, 0.0, 0.26, 0.74,
       1.01, 0, 'cloudy', 16.0, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 23:22:17', 1.97, 0.0, 0.73, 0.96,
       0.28, 0, 'rainy', 29.2, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 00:22:17', 2.76, 0.0, 0.33, 0.32,
       2.11, 0, 'sunny', 31.3, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 01:22:17', 1.73, 0.0, 1.39, 0.71,
       0, 0.37, 'windy', 28.0, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 02:22:17', 2.39, 0.0, 1.1, 0.87,
       0.42, 0, 'windy', 27.8, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 03:22:17', 2.23, 0.0, 0.38, 0.4,
       1.45, 0, 'cloudy', 18.2, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 04:22:17', 1.9, 0.0, 1.32, 0.36,
       0.22, 0, 'windy', 34.2, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-04 05:22:17', 3.27, 0.0, 0.73, 0.31,
       2.23, 0, 'rainy', 21.3, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-04 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 06:22:17', 1.71, 0.95, 0.22, 0.93,
       0, 0.39, 'cloudy', 27.4, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 07:22:17', 2.56, 0.56, 1.13, 0.67,
       0.2, 0, 'sunny', 19.1, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 08:22:17', 2.56, 1.18, 1.03, 0.39,
       0, 0.04, 'windy', 19.9, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 09:22:17', 2.56, 2.72, 1.02, 0.39,
       0, 1.57, 'cloudy', 34.1, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 10:22:17', 1.98, 2.33, 0.38, 0.19,
       0, 0.92, 'cloudy', 28.7, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 11:22:17', 2.17, 1.04, 0.73, 0.48,
       0, 0.08, 'rainy', 33.1, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 12:22:17', 1.89, 1.6, 0.53, 0.47,
       0, 0.71, 'sunny', 24.0, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 13:22:17', 2.44, 0.76, 0.3, 0.48,
       0.9, 0, 'cloudy', 29.0, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 14:22:17', 2.62, 2.81, 0.45, 0.72,
       0, 1.36, 'rainy', 31.6, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 15:22:17', 2.49, 0.99, 0.58, 0.33,
       0.59, 0, 'cloudy', 24.7, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 16:22:17', 1.73, 2.38, 1.26, 0.05,
       0, 1.96, 'cloudy', 31.5, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 17:22:17', 3.17, 1.2, 0.53, 0.09,
       1.35, 0, 'rainy', 27.5, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 18:22:17', 2.67, 2.92, 0.93, 0.84,
       0, 2.02, 'windy', 32.1, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 19:22:17', 2.0, 0.0, 0.88, 0.85,
       0.27, 0, 'windy', 21.2, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 20:22:17', 3.38, 0.0, 1.02, 0.41,
       1.95, 0, 'cloudy', 17.0, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 21:22:17', 1.57, 0.0, 1.24, 0.79,
       0, 0.46, 'cloudy', 25.2, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 22:22:17', 2.67, 0.0, 0.73, 0.52,
       1.42, 0, 'sunny', 31.5, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 23:22:17', 2.54, 0.0, 0.7, 0.58,
       1.26, 0, 'cloudy', 27.1, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 00:22:17', 2.12, 0.0, 0.83, 0.82,
       0.47, 0, 'cloudy', 17.2, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 01:22:17', 1.99, 0.0, 1.16, 0.35,
       0.48, 0, 'sunny', 19.8, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 02:22:17', 2.61, 0.0, 1.2, 0.66,
       0.75, 0, 'cloudy', 26.5, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 03:22:17', 3.04, 0.0, 0.86, 0.66,
       1.52, 0, 'sunny', 26.0, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 04:22:17', 1.79, 0.0, 0.75, 0.12,
       0.92, 0, 'sunny', 24.6, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-03 05:22:17', 3.48, 0.0, 0.73, 0.19,
       2.56, 0, 'windy', 30.1, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-03 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 06:22:17', 3.0, 0.67, 0.29, 0.39,
       1.65, 0, 'sunny', 28.7, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 07:22:17', 2.67, 2.79, 0.59, 0.01,
       0, 0.72, 'windy', 19.1, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 08:22:17', 2.21, 2.3, 0.58, 0.83,
       0, 1.5, 'sunny', 17.3, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 09:22:17', 1.59, 1.7, 0.92, 0.38,
       0, 1.41, 'sunny', 30.5, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 10:22:17', 2.62, 2.48, 0.39, 0.93,
       0, 1.18, 'rainy', 16.0, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 11:22:17', 1.81, 1.41, 1.28, 0.3,
       0, 1.18, 'sunny', 33.1, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 12:22:17', 3.39, 2.15, 0.51, 0.26,
       0.47, 0, 'cloudy', 26.2, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 13:22:17', 3.06, 1.03, 0.44, 0.24,
       1.35, 0, 'rainy', 15.1, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 14:22:17', 3.35, 0.95, 0.24, 0.47,
       1.69, 0, 'rainy', 19.0, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 15:22:17', 1.62, 1.12, 0.29, 0.73,
       0, 0.52, 'rainy', 25.9, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 16:22:17', 3.19, 1.14, 0.52, 0.64,
       0.89, 0, 'cloudy', 18.7, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 17:22:17', 1.53, 1.99, 1.36, 0.71,
       0, 2.53, 'windy', 26.8, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 18:22:17', 3.31, 2.46, 1.27, 0.42,
       0, 0.84, 'sunny', 26.7, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 19:22:17', 1.81, 0.0, 1.14, 0.86,
       0, 0.19, 'rainy', 20.4, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 20:22:17', 1.93, 0.0, 0.79, 0.01,
       1.13, 0, 'windy', 27.5, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 21:22:17', 2.84, 0.0, 0.61, 0.32,
       1.91, 0, 'windy', 27.8, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 22:22:17', 2.23, 0.0, 0.66, 0.85,
       0.72, 0, 'windy', 32.5, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 23:22:17', 2.29, 0.0, 0.93, 0.43,
       0.93, 0, 'sunny', 25.8, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 00:22:17', 3.14, 0.0, 0.82, 0.92,
       1.4, 0, 'sunny', 34.6, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 01:22:17', 2.86, 0.0, 0.59, 0.25,
       2.02, 0, 'windy', 21.4, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 02:22:17', 1.68, 0.0, 0.5, 0.06,
       1.12, 0, 'rainy', 19.7, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 03:22:17', 2.48, 0.0, 0.51, 0.36,
       1.61, 0, 'windy', 32.1, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 04:22:17', 3.48, 0.0, 0.37, 0.12,
       2.99, 0, 'rainy', 27.9, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-02 05:22:17', 2.66, 0.0, 0.87, 0.12,
       1.67, 0, 'rainy', 18.3, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-02 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 06:22:17', 3.0, 1.12, 0.77, 0.25,
       0.86, 0, 'sunny', 20.2, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 07:22:17', 2.45, 1.58, 0.74, 0.07,
       0.06, 0, 'cloudy', 16.1, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 08:22:17', 2.61, 0.87, 0.45, 0.11,
       1.18, 0, 'windy', 31.3, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 09:22:17', 3.25, 0.64, 0.89, 0.72,
       1.0, 0, 'cloudy', 27.9, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 10:22:17', 2.57, 2.47, 0.97, 0.13,
       0, 1.0, 'cloudy', 21.6, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 11:22:17', 2.66, 2.76, 0.77, 0.29,
       0, 1.16, 'cloudy', 20.1, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 12:22:17', 1.65, 1.13, 0.78, 0.5,
       0, 0.76, 'rainy', 25.2, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 13:22:17', 1.6, 2.37, 0.87, 0.53,
       0, 2.17, 'windy', 33.3, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 14:22:17', 1.64, 0.95, 1.42, 0.81,
       0, 1.54, 'windy', 20.6, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 15:22:17', 3.23, 0.77, 0.22, 0.22,
       2.02, 0, 'cloudy', 21.1, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 16:22:17', 2.1, 2.76, 1.19, 0.53,
       0, 2.38, 'sunny', 31.1, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 17:22:17', 2.91, 2.01, 0.47, 0.79,
       0, 0.36, 'cloudy', 32.3, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 18:22:17', 2.17, 0.82, 1.19, 0.07,
       0.09, 0, 'cloudy', 18.7, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 19:22:17', 2.54, 0.0, 0.99, 0.14,
       1.41, 0, 'windy', 30.9, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 20:22:17', 2.25, 0.0, 0.63, 0.83,
       0.79, 0, 'sunny', 15.3, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 21:22:17', 3.42, 0.0, 1.24, 0.76,
       1.42, 0, 'windy', 19.1, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 22:22:17', 1.78, 0.0, 1.16, 0.94,
       0, 0.32, 'rainy', 18.6, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 23:22:17', 2.88, 0.0, 0.38, 0.59,
       1.91, 0, 'sunny', 24.5, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 00:22:17', 2.67, 0.0, 1.19, 0.02,
       1.46, 0, 'cloudy', 15.4, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 01:22:17', 1.94, 0.0, 0.58, 0.6,
       0.76, 0, 'rainy', 24.5, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 02:22:17', 1.77, 0.0, 1.39, 0.24,
       0.14, 0, 'sunny', 16.8, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 03:22:17', 2.7, 0.0, 0.82, 0.19,
       1.69, 0, 'rainy', 28.4, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 04:22:17', 2.38, 0.0, 1.38, 0.38,
       0.62, 0, 'windy', 29.8, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-03-01 05:22:17', 1.55, 0.0, 1.23, 0.32,
       0, 0, 'rainy', 26.8, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-03-01 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 06:22:17', 1.99, 0.89, 0.9, 0.04,
       0.16, 0, 'rainy', 16.2, 4.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 07:22:17', 3.31, 1.0, 0.38, 0.77,
       1.16, 0, 'rainy', 34.0, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 08:22:17', 2.5, 2.78, 0.9, 0.29,
       0, 1.47, 'sunny', 17.6, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 09:22:17', 2.58, 1.22, 1.24, 0.62,
       0, 0.5, 'rainy', 23.9, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 10:22:17', 1.87, 0.8, 0.89, 0.42,
       0, 0.24, 'rainy', 24.8, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 11:22:17', 3.35, 1.4, 0.99, 0.87,
       0.09, 0, 'sunny', 27.3, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 12:22:17', 3.13, 1.66, 0.64, 0.64,
       0.19, 0, 'cloudy', 32.1, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 13:22:17', 2.03, 2.41, 0.45, 0.22,
       0, 1.05, 'rainy', 30.1, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 14:22:17', 2.47, 0.54, 0.26, 0.34,
       1.33, 0, 'cloudy', 15.6, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 15:22:17', 3.1, 1.11, 1.07, 0.88,
       0.04, 0, 'sunny', 17.9, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 16:22:17', 2.6, 2.69, 1.46, 0.17,
       0, 1.72, 'cloudy', 26.2, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 17:22:17', 2.99, 0.5, 0.47, 0.47,
       1.55, 0, 'cloudy', 23.0, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 18:22:17', 3.03, 2.14, 0.53, 0.98,
       0, 0.62, 'windy', 24.9, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 19:22:17', 2.37, 0.0, 1.07, 0.45,
       0.85, 0, 'windy', 21.3, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 20:22:17', 2.56, 0.0, 1.26, 0.01,
       1.29, 0, 'windy', 30.2, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 21:22:17', 3.11, 0.0, 0.83, 0.22,
       2.06, 0, 'sunny', 33.0, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 22:22:17', 2.8, 0.0, 0.78, 0.56,
       1.46, 0, 'rainy', 30.5, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 23:22:17', 2.0, 0.0, 0.89, 0.88,
       0.23, 0, 'cloudy', 21.6, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 00:22:17', 3.43, 0.0, 1.42, 0.2,
       1.81, 0, 'cloudy', 29.0, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 01:22:17', 2.71, 0.0, 1.13, 0.51,
       1.07, 0, 'windy', 34.0, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 02:22:17', 3.41, 0.0, 1.07, 0.13,
       2.21, 0, 'windy', 26.2, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 03:22:17', 3.14, 0.0, 1.13, 0.34,
       1.67, 0, 'sunny', 20.9, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 04:22:17', 3.5, 0.0, 0.8, 0.61,
       2.09, 0, 'windy', 17.9, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-28 05:22:17', 2.91, 0.0, 0.66, 0.71,
       1.54, 0, 'windy', 33.1, 5.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-28 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 06:22:17', 2.64, 0.53, 1.24, 0.89,
       0, 0.02, 'cloudy', 16.3, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 07:22:17', 2.38, 2.82, 1.18, 0.64,
       0, 2.26, 'windy', 24.6, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 08:22:17', 1.83, 1.69, 0.59, 0.73,
       0, 1.18, 'windy', 23.1, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 09:22:17', 3.47, 1.75, 0.22, 0.92,
       0.58, 0, 'windy', 22.3, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 10:22:17', 2.54, 0.6, 1.45, 0.12,
       0.37, 0, 'rainy', 27.6, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 11:22:17', 1.54, 2.85, 0.37, 0.97,
       0, 2.65, 'rainy', 19.6, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 12:22:17', 2.32, 2.96, 1.13, 0.55,
       0, 2.32, 'cloudy', 19.2, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 13:22:17', 2.99, 2.42, 1.33, 0.72,
       0, 1.48, 'sunny', 22.3, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 14:22:17', 2.09, 1.16, 0.5, 0.84,
       0, 0.41, 'sunny', 26.6, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 15:22:17', 1.83, 0.82, 0.63, 0.86,
       0, 0.48, 'rainy', 28.9, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 16:22:17', 2.78, 2.55, 1.07, 0.19,
       0, 1.03, 'windy', 20.0, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 17:22:17', 2.23, 2.04, 0.98, 0.96,
       0, 1.75, 'rainy', 20.5, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 18:22:17', 2.13, 0.65, 1.42, 0.57,
       0, 0.51, 'sunny', 20.4, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 19:22:17', 1.93, 0.0, 1.43, 0.15,
       0.35, 0, 'rainy', 30.7, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 20:22:17', 1.84, 0.0, 0.29, 0.08,
       1.47, 0, 'windy', 25.7, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 21:22:17', 3.15, 0.0, 0.47, 0.91,
       1.77, 0, 'sunny', 32.0, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 22:22:17', 3.21, 0.0, 0.96, 0.91,
       1.34, 0, 'cloudy', 30.7, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 23:22:17', 2.41, 0.0, 0.7, 0.34,
       1.37, 0, 'rainy', 15.7, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 00:22:17', 2.18, 0.0, 0.27, 0.01,
       1.9, 0, 'rainy', 21.2, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 01:22:17', 3.05, 0.0, 0.49, 0.34,
       2.22, 0, 'rainy', 28.1, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 02:22:17', 2.61, 0.0, 0.59, 0.99,
       1.03, 0, 'cloudy', 17.1, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 03:22:17', 3.11, 0.0, 0.61, 0.58,
       1.92, 0, 'rainy', 24.1, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 04:22:17', 1.55, 0.0, 0.83, 0.44,
       0.28, 0, 'rainy', 33.3, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-27 05:22:17', 1.78, 0.0, 0.76, 0.41,
       0.61, 0, 'sunny', 18.7, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-27 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 06:22:17', 2.96, 2.93, 1.35, 0.43,
       0, 1.75, 'rainy', 23.8, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 07:22:17', 3.22, 2.27, 1.31, 0.96,
       0, 1.32, 'windy', 28.4, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 08:22:17', 1.82, 1.38, 1.32, 0.2,
       0, 1.08, 'windy', 29.2, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 09:22:17', 1.91, 0.95, 1.22, 0.81,
       0, 1.07, 'windy', 30.6, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 10:22:17', 2.71, 2.5, 0.78, 0.29,
       0, 0.86, 'windy', 17.9, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 11:22:17', 3.47, 1.03, 0.78, 0.62,
       1.04, 0, 'windy', 29.1, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 12:22:17', 2.98, 2.92, 1.18, 0.56,
       0, 1.68, 'cloudy', 22.2, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 13:22:17', 3.48, 2.32, 0.96, 0.69,
       0, 0.49, 'rainy', 28.0, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 14:22:17', 2.5, 2.09, 0.68, 0.15,
       0, 0.42, 'rainy', 19.2, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 15:22:17', 2.39, 2.01, 1.05, 0.58,
       0, 1.25, 'sunny', 29.5, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 16:22:17', 1.67, 2.61, 0.48, 0.96,
       0, 2.38, 'cloudy', 31.8, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 17:22:17', 2.06, 2.46, 0.33, 0.44,
       0, 1.17, 'cloudy', 16.7, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 18:22:17', 3.43, 1.9, 0.21, 0.18,
       1.14, 0, 'cloudy', 19.3, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 19:22:17', 3.11, 0.0, 1.12, 0.85,
       1.14, 0, 'cloudy', 33.0, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 20:22:17', 1.74, 0.0, 0.26, 0.72,
       0.76, 0, 'windy', 23.2, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 21:22:17', 2.59, 0.0, 1.41, 0.66,
       0.52, 0, 'windy', 27.9, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 22:22:17', 3.01, 0.0, 0.38, 0.54,
       2.09, 0, 'rainy', 31.7, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 23:22:17', 1.98, 0.0, 0.43, 0.85,
       0.7, 0, 'cloudy', 33.9, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 00:22:17', 2.25, 0.0, 1.07, 0.42,
       0.76, 0, 'windy', 33.6, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 01:22:17', 2.52, 0.0, 1.4, 0.82,
       0.3, 0, 'rainy', 30.6, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 02:22:17', 2.48, 0.0, 0.45, 0.29,
       1.74, 0, 'cloudy', 23.8, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 03:22:17', 1.97, 0.0, 0.77, 0.74,
       0.46, 0, 'windy', 24.5, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 04:22:17', 2.24, 0.0, 0.43, 0.01,
       1.8, 0, 'cloudy', 29.2, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-26 05:22:17', 2.7, 0.0, 1.14, 0.67,
       0.89, 0, 'rainy', 20.7, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-26 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 06:22:17', 2.56, 0.96, 1.28, 0.63,
       0, 0.31, 'cloudy', 24.5, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 07:22:17', 1.84, 2.19, 1.03, 0.92,
       0, 2.3, 'rainy', 33.5, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 08:22:17', 2.89, 2.52, 1.41, 0.14,
       0, 1.18, 'windy', 16.9, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 09:22:17', 2.25, 0.88, 1.14, 0.05,
       0.18, 0, 'sunny', 24.2, 0.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 10:22:17', 2.92, 1.41, 0.94, 0.42,
       0.15, 0, 'rainy', 30.5, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 11:22:17', 2.39, 1.01, 0.56, 0.86,
       0, 0.04, 'windy', 26.7, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 12:22:17', 2.08, 0.6, 1.19, 0.94,
       0, 0.65, 'windy', 27.2, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 13:22:17', 2.32, 0.5, 1.05, 0.15,
       0.62, 0, 'sunny', 25.0, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 14:22:17', 2.28, 2.02, 0.87, 0.15,
       0, 0.76, 'cloudy', 28.6, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 15:22:17', 1.57, 0.82, 0.33, 0.52,
       0, 0.1, 'windy', 26.0, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 16:22:17', 2.61, 2.57, 1.11, 0.48,
       0, 1.55, 'windy', 24.1, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 17:22:17', 2.1, 0.71, 0.42, 0.94,
       0.03, 0, 'rainy', 34.0, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 18:22:17', 1.75, 1.88, 0.74, 0.38,
       0, 1.25, 'rainy', 20.8, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 19:22:17', 3.45, 0.0, 0.28, 0.08,
       3.09, 0, 'cloudy', 16.2, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 20:22:17', 3.33, 0.0, 0.78, 0.6,
       1.95, 0, 'sunny', 24.0, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 21:22:17', 3.25, 0.0, 0.2, 0.98,
       2.07, 0, 'rainy', 34.4, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 22:22:17', 2.3, 0.0, 1.32, 0.02,
       0.96, 0, 'windy', 34.0, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 23:22:17', 3.45, 0.0, 1.07, 0.26,
       2.12, 0, 'cloudy', 23.1, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 00:22:17', 2.39, 0.0, 1.0, 0.61,
       0.78, 0, 'sunny', 19.4, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 01:22:17', 2.04, 0.0, 0.84, 0.5,
       0.7, 0, 'cloudy', 18.6, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 02:22:17', 2.39, 0.0, 1.02, 0.52,
       0.85, 0, 'sunny', 24.4, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 03:22:17', 2.14, 0.0, 0.45, 0.47,
       1.22, 0, 'sunny', 21.1, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 04:22:17', 2.69, 0.0, 1.19, 0.95,
       0.55, 0, 'cloudy', 26.6, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-25 05:22:17', 3.28, 0.0, 1.08, 0.52,
       1.68, 0, 'rainy', 23.0, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-25 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 06:22:17', 1.63, 1.79, 1.18, 0.88,
       0, 2.22, 'sunny', 18.9, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 07:22:17', 3.19, 1.35, 1.45, 0.42,
       0, 0.03, 'cloudy', 22.9, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 08:22:17', 1.7, 2.57, 0.7, 0.97,
       0, 2.54, 'rainy', 15.4, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 09:22:17', 3.14, 2.44, 0.78, 0.21,
       0, 0.29, 'windy', 24.8, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 10:22:17', 3.46, 0.86, 1.08, 0.41,
       1.11, 0, 'rainy', 30.4, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 11:22:17', 2.25, 1.72, 0.73, 0.58,
       0, 0.78, 'sunny', 30.5, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 12:22:17', 3.05, 1.54, 0.22, 0.83,
       0.46, 0, 'sunny', 25.5, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 13:22:17', 1.74, 1.2, 1.01, 0.67,
       0, 1.14, 'cloudy', 25.9, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 14:22:17', 2.57, 1.05, 0.93, 0.95,
       0, 0.36, 'sunny', 34.1, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 15:22:17', 2.09, 0.56, 1.34, 0.3,
       0, 0.11, 'sunny', 33.7, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 16:22:17', 3.26, 0.63, 1.21, 0.17,
       1.25, 0, 'sunny', 34.3, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 17:22:17', 3.47, 2.21, 0.44, 0.89,
       0, 0.07, 'sunny', 25.4, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 18:22:17', 3.42, 2.81, 0.33, 0.02,
       0.26, 0, 'sunny', 29.6, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 19:22:17', 3.3, 0.0, 0.87, 0.42,
       2.01, 0, 'cloudy', 15.4, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 20:22:17', 2.79, 0.0, 1.26, 0.59,
       0.94, 0, 'sunny', 31.9, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 21:22:17', 2.65, 0.0, 0.92, 0.5,
       1.23, 0, 'rainy', 23.4, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 22:22:17', 3.11, 0.0, 0.23, 0.08,
       2.8, 0, 'rainy', 23.9, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 23:22:17', 3.05, 0.0, 0.56, 0.99,
       1.5, 0, 'sunny', 17.7, 3.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 00:22:17', 2.33, 0.0, 1.3, 0.68,
       0.35, 0, 'cloudy', 19.6, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 01:22:17', 2.28, 0.0, 0.22, 0.89,
       1.17, 0, 'windy', 24.2, 9.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 02:22:17', 2.89, 0.0, 1.33, 0.43,
       1.13, 0, 'rainy', 16.7, 3.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 03:22:17', 2.64, 0.0, 0.99, 0.95,
       0.7, 0, 'sunny', 27.3, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 04:22:17', 2.46, 0.0, 0.71, 0.8,
       0.95, 0, 'cloudy', 20.5, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-24 05:22:17', 2.77, 0.0, 0.53, 0.43,
       1.81, 0, 'windy', 34.9, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-24 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 06:22:17', 1.95, 1.39, 0.97, 0.47,
       0, 0.88, 'windy', 32.0, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 07:22:17', 2.61, 2.33, 0.73, 0.06,
       0, 0.51, 'windy', 22.6, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 08:22:17', 2.05, 2.55, 0.79, 0.24,
       0, 1.53, 'windy', 30.7, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 09:22:17', 2.24, 1.68, 0.35, 0.48,
       0, 0.27, 'sunny', 31.4, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 10:22:17', 3.12, 1.5, 0.39, 0.78,
       0.45, 0, 'rainy', 17.9, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 11:22:17', 1.74, 2.85, 1.47, 0.5,
       0, 3.08, 'rainy', 17.6, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 12:22:17', 1.54, 2.19, 1.4, 0.19,
       0, 2.24, 'rainy', 15.1, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 13:22:17', 3.45, 1.95, 1.33, 0.12,
       0.05, 0, 'sunny', 19.3, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 14:22:17', 3.38, 0.83, 0.92, 0.93,
       0.7, 0, 'cloudy', 15.3, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 15:22:17', 3.14, 0.77, 0.68, 0.77,
       0.92, 0, 'cloudy', 27.9, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 16:22:17', 1.84, 2.74, 0.9, 0.7,
       0, 2.5, 'rainy', 18.3, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 17:22:17', 2.16, 2.3, 0.51, 0.23,
       0, 0.88, 'windy', 35.0, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 18:22:17', 3.17, 2.2, 0.69, 0.74,
       0, 0.46, 'windy', 18.9, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 19:22:17', 2.11, 0.0, 0.53, 0.21,
       1.37, 0, 'rainy', 15.4, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 20:22:17', 1.55, 0.0, 1.42, 0.79,
       0, 0.66, 'cloudy', 15.3, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 21:22:17', 2.37, 0.0, 0.81, 0.8,
       0.76, 0, 'windy', 33.3, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 22:22:17', 2.91, 0.0, 1.42, 0.54,
       0.95, 0, 'sunny', 30.8, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 23:22:17', 2.43, 0.0, 0.52, 0.5,
       1.41, 0, 'sunny', 17.4, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 00:22:17', 2.36, 0.0, 0.42, 0.94,
       1.0, 0, 'cloudy', 33.5, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 01:22:17', 2.09, 0.0, 1.38, 0.52,
       0.19, 0, 'cloudy', 29.3, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 02:22:17', 1.92, 0.0, 1.12, 0.14,
       0.66, 0, 'rainy', 22.9, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 03:22:17', 1.94, 0.0, 1.24, 0.43,
       0.27, 0, 'windy', 27.8, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 04:22:17', 2.26, 0.0, 1.29, 0.56,
       0.41, 0, 'rainy', 32.2, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-23 05:22:17', 2.74, 0.0, 0.64, 0.57,
       1.53, 0, 'rainy', 32.8, 9.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-23 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 06:22:17', 3.47, 1.2, 0.79, 0.26,
       1.22, 0, 'cloudy', 28.1, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 07:22:17', 1.98, 0.9, 0.42, 0.12,
       0.54, 0, 'sunny', 24.8, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 08:22:17', 2.75, 2.99, 0.44, 0.73,
       0, 1.41, 'cloudy', 16.1, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 09:22:17', 2.36, 0.6, 0.95, 0.93,
       0, 0.12, 'rainy', 15.4, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 10:22:17', 2.99, 0.7, 0.21, 0.34,
       1.74, 0, 'cloudy', 28.2, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 11:22:17', 2.55, 1.72, 0.97, 0.32,
       0, 0.46, 'rainy', 25.0, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 12:22:17', 1.65, 0.56, 0.92, 0.47,
       0, 0.3, 'cloudy', 19.2, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 13:22:17', 1.63, 2.34, 0.79, 0.3,
       0, 1.8, 'sunny', 30.9, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 14:22:17', 3.04, 0.94, 0.79, 0.9,
       0.41, 0, 'windy', 30.4, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 15:22:17', 2.94, 2.48, 0.75, 0.08,
       0, 0.37, 'windy', 34.4, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 16:22:17', 2.86, 2.37, 1.13, 0.81,
       0, 1.45, 'windy', 16.0, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 17:22:17', 1.58, 1.15, 0.41, 0.74,
       0, 0.72, 'cloudy', 17.7, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 18:22:17', 2.86, 1.98, 1.1, 0.46,
       0, 0.68, 'sunny', 28.0, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 19:22:17', 2.61, 0.0, 0.33, 0.82,
       1.46, 0, 'cloudy', 28.7, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 20:22:17', 3.35, 0.0, 1.22, 0.5,
       1.63, 0, 'cloudy', 25.3, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 21:22:17', 1.66, 0.0, 0.68, 0.07,
       0.91, 0, 'rainy', 16.1, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 22:22:17', 3.28, 0.0, 1.13, 0.94,
       1.21, 0, 'sunny', 22.4, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 23:22:17', 1.63, 0.0, 0.96, 0.04,
       0.63, 0, 'rainy', 24.4, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 00:22:17', 3.4, 0.0, 1.04, 0.76,
       1.6, 0, 'sunny', 34.8, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 01:22:17', 2.61, 0.0, 0.61, 0.31,
       1.69, 0, 'windy', 17.1, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 02:22:17', 2.27, 0.0, 1.15, 0.91,
       0.21, 0, 'rainy', 21.4, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 03:22:17', 1.77, 0.0, 1.01, 0.55,
       0.21, 0, 'windy', 30.0, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 04:22:17', 1.99, 0.0, 1.03, 0.02,
       0.94, 0, 'sunny', 17.7, 2.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-22 05:22:17', 2.36, 0.0, 1.18, 0.01,
       1.17, 0, 'sunny', 27.5, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-22 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 06:22:17', 1.52, 2.58, 1.14, 0.62,
       0, 2.82, 'windy', 19.3, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 07:22:17', 3.12, 2.31, 0.72, 0.98,
       0, 0.89, 'cloudy', 30.1, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 08:22:17', 1.87, 1.37, 0.39, 0.46,
       0, 0.35, 'windy', 27.1, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 09:22:17', 2.79, 0.8, 0.41, 0.96,
       0.62, 0, 'rainy', 20.1, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 10:22:17', 2.65, 0.96, 0.62, 0.12,
       0.95, 0, 'rainy', 24.8, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 11:22:17', 2.16, 2.05, 1.31, 0.92,
       0, 2.12, 'cloudy', 31.1, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 12:22:17', 3.15, 2.66, 0.69, 0.53,
       0, 0.73, 'sunny', 17.1, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 13:22:17', 3.35, 0.79, 1.17, 0.53,
       0.86, 0, 'sunny', 20.5, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 14:22:17', 2.41, 0.81, 0.68, 0.19,
       0.73, 0, 'cloudy', 22.6, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 15:22:17', 2.88, 0.89, 1.35, 0.04,
       0.6, 0, 'sunny', 24.7, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 16:22:17', 2.55, 2.57, 0.32, 0.76,
       0, 1.1, 'windy', 33.3, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 17:22:17', 1.65, 2.77, 1.3, 0.66,
       0, 3.08, 'cloudy', 29.9, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 18:22:17', 2.06, 2.71, 1.22, 0.36,
       0, 2.23, 'sunny', 28.0, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 19:22:17', 3.31, 0.0, 1.25, 0.38,
       1.68, 0, 'cloudy', 33.4, 7.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 20:22:17', 2.85, 0.0, 1.27, 0.7,
       0.88, 0, 'rainy', 33.4, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 21:22:17', 2.27, 0.0, 0.93, 0.26,
       1.08, 0, 'rainy', 20.4, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 22:22:17', 3.09, 0.0, 0.74, 0.44,
       1.91, 0, 'cloudy', 18.4, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 23:22:17', 2.0, 0.0, 0.85, 0.3,
       0.85, 0, 'rainy', 28.9, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 00:22:17', 2.47, 0.0, 0.4, 0.02,
       2.05, 0, 'sunny', 21.7, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 01:22:17', 3.17, 0.0, 1.38, 0.2,
       1.59, 0, 'cloudy', 25.5, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 02:22:17', 3.17, 0.0, 1.38, 0.42,
       1.37, 0, 'windy', 15.2, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 03:22:17', 2.29, 0.0, 1.28, 0.62,
       0.39, 0, 'windy', 15.3, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 04:22:17', 2.2, 0.0, 1.2, 0.46,
       0.54, 0, 'windy', 23.4, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-21 05:22:17', 2.81, 0.0, 1.28, 0.62,
       0.91, 0, 'sunny', 22.5, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-21 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 06:22:17', 2.42, 2.12, 0.5, 0.3,
       0, 0.5, 'sunny', 20.1, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 07:22:17', 3.1, 0.64, 0.52, 0.3,
       1.64, 0, 'rainy', 26.0, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 08:22:17', 1.84, 0.83, 0.4, 0.3,
       0.31, 0, 'sunny', 17.8, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 09:22:17', 1.75, 1.94, 0.52, 0.53,
       0, 1.24, 'windy', 17.4, 5.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 10:22:17', 2.11, 1.31, 0.72, 0.3,
       0, 0.22, 'sunny', 26.4, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 11:22:17', 2.96, 2.46, 0.99, 0.5,
       0, 0.99, 'windy', 20.0, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 12:22:17', 2.99, 1.9, 1.31, 0.34,
       0, 0.56, 'rainy', 17.7, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 13:22:17', 1.93, 2.33, 0.66, 0.58,
       0, 1.64, 'rainy', 20.4, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 14:22:17', 2.06, 2.92, 1.39, 0.99,
       0, 3.24, 'rainy', 31.1, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 15:22:17', 3.13, 1.79, 0.45, 0.46,
       0.43, 0, 'rainy', 30.2, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 16:22:17', 3.41, 1.61, 0.94, 0.16,
       0.7, 0, 'rainy', 34.5, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 17:22:17', 2.55, 2.36, 1.08, 0.22,
       0, 1.11, 'sunny', 21.8, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 18:22:17', 3.14, 2.08, 0.48, 0.76,
       0, 0.18, 'cloudy', 34.6, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 19:22:17', 1.69, 0.0, 1.35, 0.44,
       0, 0.1, 'sunny', 15.9, 5.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 20:22:17', 1.9, 0.0, 0.5, 0.38,
       1.02, 0, 'cloudy', 26.3, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 21:22:17', 1.59, 0.0, 1.04, 0.99,
       0, 0.44, 'cloudy', 19.2, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 22:22:17', 1.77, 0.0, 0.71, 0.79,
       0.27, 0, 'windy', 17.9, 8.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 23:22:17', 3.36, 0.0, 1.49, 0.3,
       1.57, 0, 'windy', 26.4, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 00:22:17', 3.13, 0.0, 1.37, 0.14,
       1.62, 0, 'cloudy', 15.0, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 01:22:17', 2.33, 0.0, 0.25, 0.32,
       1.76, 0, 'cloudy', 19.6, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 02:22:17', 2.71, 0.0, 1.04, 0.23,
       1.44, 0, 'rainy', 16.9, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 03:22:17', 2.59, 0.0, 0.27, 0.02,
       2.3, 0, 'cloudy', 26.2, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 04:22:17', 2.61, 0.0, 1.07, 0.29,
       1.25, 0, 'cloudy', 21.4, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-20 05:22:17', 2.29, 0.0, 0.46, 0.89,
       0.94, 0, 'cloudy', 31.7, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-20 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 06:22:17', 3.42, 1.21, 0.37, 0.68,
       1.16, 0, 'windy', 28.3, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 07:22:17', 3.27, 2.19, 1.09, 0.61,
       0, 0.62, 'windy', 23.7, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 08:22:17', 2.27, 2.47, 1.37, 0.2,
       0, 1.77, 'windy', 17.0, 2.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 09:22:17', 2.43, 2.79, 1.43, 0.6,
       0, 2.39, 'rainy', 19.4, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 10:22:17', 1.76, 2.04, 0.87, 0.47,
       0, 1.62, 'windy', 34.7, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 11:22:17', 2.1, 0.69, 0.64, 0.02,
       0.75, 0, 'sunny', 32.1, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 12:22:17', 3.48, 2.3, 1.02, 0.91,
       0, 0.75, 'sunny', 31.2, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 13:22:17', 1.89, 1.21, 0.24, 0.15,
       0.29, 0, 'sunny', 34.1, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 14:22:17', 3.49, 0.89, 1.28, 0.47,
       0.85, 0, 'rainy', 16.1, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 15:22:17', 2.88, 1.27, 1.47, 0.38,
       0, 0.24, 'sunny', 34.8, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 16:22:17', 2.31, 1.63, 1.26, 0.34,
       0, 0.92, 'rainy', 17.9, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 17:22:17', 2.69, 2.96, 0.79, 0.69,
       0, 1.75, 'cloudy', 26.3, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 18:22:17', 2.28, 1.81, 1.13, 0.14,
       0, 0.8, 'sunny', 15.8, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 19:22:17', 3.23, 0.0, 1.35, 0.89,
       0.99, 0, 'rainy', 30.1, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 20:22:17', 1.71, 0.0, 0.3, 0.58,
       0.83, 0, 'cloudy', 30.7, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 21:22:17', 2.62, 0.0, 0.69, 0.51,
       1.42, 0, 'rainy', 33.6, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 22:22:17', 2.78, 0.0, 0.54, 0.01,
       2.23, 0, 'windy', 28.2, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 23:22:17', 2.56, 0.0, 0.56, 0.43,
       1.57, 0, 'sunny', 32.5, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 00:22:17', 1.76, 0.0, 0.25, 0.17,
       1.34, 0, 'sunny', 28.4, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 01:22:17', 2.73, 0.0, 1.14, 0.99,
       0.6, 0, 'cloudy', 31.0, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 02:22:17', 1.86, 0.0, 0.86, 0.46,
       0.54, 0, 'rainy', 25.4, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 03:22:17', 2.87, 0.0, 1.45, 0.3,
       1.12, 0, 'sunny', 29.1, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 04:22:17', 2.49, 0.0, 0.41, 0.68,
       1.4, 0, 'windy', 21.0, 10.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-19 05:22:17', 2.58, 0.0, 0.67, 0.58,
       1.33, 0, 'sunny', 34.9, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-19 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 06:22:17', 2.27, 2.29, 1.45, 0.89,
       0, 2.36, 'windy', 24.7, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 07:22:17', 1.68, 1.73, 0.6, 0.32,
       0, 0.97, 'windy', 21.2, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 08:22:17', 1.92, 1.0, 1.1, 0.25,
       0, 0.43, 'cloudy', 33.7, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 09:22:17', 2.25, 2.98, 0.72, 0.82,
       0, 2.27, 'rainy', 30.0, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 10:22:17', 3.16, 1.24, 1.14, 0.45,
       0.33, 0, 'cloudy', 22.4, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 11:22:17', 2.41, 0.75, 1.13, 0.34,
       0.19, 0, 'cloudy', 30.8, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 12:22:17', 2.31, 1.27, 1.12, 0.15,
       0, 0.23, 'windy', 21.4, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 13:22:17', 2.07, 0.52, 0.99, 0.38,
       0.18, 0, 'rainy', 33.0, 4.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 14:22:17', 2.08, 1.96, 1.23, 0.63,
       0, 1.74, 'sunny', 21.6, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 15:22:17', 2.48, 2.14, 0.52, 0.24,
       0, 0.42, 'cloudy', 22.7, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 16:22:17', 2.91, 1.33, 0.96, 0.42,
       0.2, 0, 'windy', 31.4, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 17:22:17', 1.99, 2.04, 0.72, 0.36,
       0, 1.13, 'rainy', 27.6, 2.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 18:22:17', 2.56, 2.25, 0.43, 0.79,
       0, 0.91, 'windy', 24.9, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 19:22:17', 2.83, 0.0, 0.89, 0.89,
       1.05, 0, 'windy', 26.7, 3.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 20:22:17', 2.39, 0.0, 0.71, 0.08,
       1.6, 0, 'rainy', 30.1, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 21:22:17', 3.41, 0.0, 0.31, 0.11,
       2.99, 0, 'windy', 30.9, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 22:22:17', 1.76, 0.0, 1.22, 0.15,
       0.39, 0, 'rainy', 28.3, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 23:22:17', 1.95, 0.0, 1.07, 0.42,
       0.46, 0, 'cloudy', 25.0, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 00:22:17', 2.14, 0.0, 1.48, 0.08,
       0.58, 0, 'rainy', 24.0, 7.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 01:22:17', 2.13, 0.0, 0.45, 0.01,
       1.67, 0, 'rainy', 18.5, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 02:22:17', 1.67, 0.0, 0.38, 0.45,
       0.84, 0, 'windy', 28.1, 4.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 03:22:17', 3.15, 0.0, 0.78, 0.19,
       2.18, 0, 'sunny', 20.5, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 04:22:17', 2.64, 0.0, 0.24, 0.24,
       2.16, 0, 'windy', 34.7, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-18 05:22:17', 2.61, 0.0, 1.37, 0.13,
       1.11, 0, 'sunny', 15.1, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-18 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 06:22:17', 1.56, 2.27, 1.45, 0.0,
       0, 2.16, 'sunny', 15.7, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 07:22:17', 3.45, 2.15, 0.32, 0.16,
       0.82, 0, 'sunny', 27.2, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 08:22:17', 3.01, 1.94, 1.11, 0.3,
       0, 0.34, 'rainy', 15.7, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 09:22:17', 2.5, 2.71, 0.83, 0.68,
       0, 1.72, 'windy', 22.8, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 10:22:17', 3.1, 1.7, 1.42, 0.44,
       0, 0.46, 'rainy', 24.7, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 11:22:17', 3.49, 1.82, 0.31, 0.22,
       1.14, 0, 'sunny', 29.8, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 12:22:17', 2.13, 1.18, 1.1, 0.11,
       0, 0.26, 'sunny', 21.0, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 13:22:17', 2.74, 1.75, 0.71, 0.4,
       0, 0.12, 'rainy', 18.5, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 14:22:17', 3.35, 2.81, 0.72, 0.84,
       0, 1.02, 'cloudy', 15.6, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 15:22:17', 2.36, 1.41, 1.38, 0.27,
       0, 0.7, 'windy', 33.2, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 16:22:17', 2.77, 1.39, 0.55, 0.05,
       0.78, 0, 'rainy', 32.3, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 17:22:17', 1.81, 2.96, 0.3, 0.99,
       0, 2.44, 'cloudy', 26.5, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 18:22:17', 1.56, 2.34, 0.99, 0.55,
       0, 2.32, 'windy', 21.5, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 19:22:17', 2.61, 0.0, 0.34, 0.8,
       1.47, 0, 'windy', 25.1, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 20:22:17', 2.51, 0.0, 0.5, 0.57,
       1.44, 0, 'rainy', 16.3, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 21:22:17', 2.42, 0.0, 0.44, 0.65,
       1.33, 0, 'sunny', 25.4, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 22:22:17', 3.26, 0.0, 1.1, 0.25,
       1.91, 0, 'rainy', 22.3, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 23:22:17', 2.0, 0.0, 1.41, 0.66,
       0, 0.07, 'sunny', 22.7, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 00:22:17', 2.39, 0.0, 0.71, 0.21,
       1.47, 0, 'cloudy', 27.9, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 01:22:17', 1.84, 0.0, 0.39, 0.85,
       0.6, 0, 'rainy', 27.3, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 02:22:17', 2.51, 0.0, 0.27, 0.69,
       1.55, 0, 'sunny', 29.5, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 03:22:17', 3.2, 0.0, 1.37, 0.92,
       0.91, 0, 'rainy', 33.3, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 04:22:17', 1.58, 0.0, 0.3, 0.02,
       1.26, 0, 'rainy', 31.6, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-17 05:22:17', 2.29, 0.0, 1.02, 0.96,
       0.31, 0, 'cloudy', 29.7, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-17 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 06:22:17', 3.24, 2.17, 1.13, 0.64,
       0, 0.7, 'windy', 24.0, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 07:22:17', 2.36, 0.88, 0.67, 0.56,
       0.25, 0, 'sunny', 31.9, 1.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 08:22:17', 1.63, 1.27, 1.1, 0.66,
       0, 1.4, 'sunny', 24.6, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 09:22:17', 3.41, 2.02, 0.97, 0.81,
       0, 0.39, 'sunny', 15.6, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 10:22:17', 2.86, 1.06, 0.24, 0.14,
       1.42, 0, 'rainy', 30.9, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 11:22:17', 3.17, 0.87, 0.46, 0.55,
       1.29, 0, 'rainy', 16.7, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 12:22:17', 1.75, 2.87, 1.02, 0.69,
       0, 2.83, 'sunny', 33.7, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 13:22:17', 2.08, 0.77, 1.0, 0.67,
       0, 0.36, 'rainy', 19.1, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 14:22:17', 1.94, 1.92, 0.99, 0.41,
       0, 1.38, 'windy', 19.8, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 15:22:17', 1.67, 1.11, 1.36, 0.31,
       0, 1.11, 'sunny', 17.3, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 16:22:17', 2.66, 2.63, 0.36, 0.06,
       0, 0.39, 'rainy', 24.1, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 17:22:17', 2.18, 2.06, 0.68, 0.7,
       0, 1.26, 'cloudy', 29.6, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 18:22:17', 2.09, 2.06, 1.28, 0.26,
       0, 1.51, 'rainy', 19.4, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 19:22:17', 2.76, 0.0, 1.12, 0.0,
       1.64, 0, 'rainy', 23.7, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 20:22:17', 2.17, 0.0, 0.96, 0.59,
       0.62, 0, 'rainy', 19.9, 3.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 21:22:17', 1.56, 0.0, 1.36, 0.81,
       0, 0.61, 'rainy', 24.3, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 22:22:17', 3.08, 0.0, 1.01, 0.7,
       1.37, 0, 'cloudy', 33.1, 6.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 23:22:17', 1.8, 0.0, 1.24, 0.07,
       0.49, 0, 'cloudy', 23.6, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 00:22:17', 2.32, 0.0, 0.21, 0.06,
       2.05, 0, 'cloudy', 23.9, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 01:22:17', 2.22, 0.0, 0.69, 0.75,
       0.78, 0, 'cloudy', 25.2, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 02:22:17', 3.45, 0.0, 0.76, 0.25,
       2.44, 0, 'windy', 22.0, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 03:22:17', 2.01, 0.0, 0.45, 0.61,
       0.95, 0, 'cloudy', 31.1, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 04:22:17', 3.03, 0.0, 0.94, 0.33,
       1.76, 0, 'windy', 29.0, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-16 05:22:17', 1.61, 0.0, 0.96, 0.11,
       0.54, 0, 'cloudy', 32.7, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-16 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 06:22:17', 3.39, 1.27, 1.21, 0.89,
       0.02, 0, 'windy', 20.7, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 07:22:17', 2.92, 3.0, 0.57, 0.01,
       0, 0.66, 'rainy', 30.9, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 08:22:17', 2.09, 0.74, 1.37, 0.12,
       0, 0.14, 'rainy', 33.3, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 09:22:17', 2.19, 1.88, 1.33, 0.91,
       0, 1.93, 'cloudy', 31.0, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 10:22:17', 2.01, 1.53, 0.93, 0.97,
       0, 1.42, 'cloudy', 30.7, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 11:22:17', 2.51, 0.55, 0.45, 0.97,
       0.54, 0, 'cloudy', 27.8, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 12:22:17', 2.44, 1.42, 0.32, 0.08,
       0.62, 0, 'sunny', 17.2, 7.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 13:22:17', 1.76, 2.17, 1.1, 0.38,
       0, 1.89, 'rainy', 15.0, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 14:22:17', 2.33, 2.31, 0.92, 0.31,
       0, 1.21, 'cloudy', 31.9, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 15:22:17', 3.28, 0.63, 0.38, 0.41,
       1.86, 0, 'sunny', 29.2, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 16:22:17', 1.6, 2.68, 0.56, 0.59,
       0, 2.23, 'rainy', 34.8, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 17:22:17', 3.17, 1.27, 1.3, 0.11,
       0.49, 0, 'rainy', 19.9, 6.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 18:22:17', 2.2, 0.78, 1.08, 0.98,
       0, 0.64, 'rainy', 21.9, 4.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 19:22:17', 3.09, 0.0, 1.16, 0.33,
       1.6, 0, 'cloudy', 18.3, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 20:22:17', 1.65, 0.0, 1.08, 0.56,
       0.01, 0, 'cloudy', 30.3, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 21:22:17', 2.25, 0.0, 0.78, 0.83,
       0.64, 0, 'sunny', 35.0, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 22:22:17', 2.3, 0.0, 0.66, 0.31,
       1.33, 0, 'rainy', 19.1, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 23:22:17', 3.17, 0.0, 0.95, 0.09,
       2.13, 0, 'sunny', 24.2, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 00:22:17', 3.42, 0.0, 0.72, 0.37,
       2.33, 0, 'sunny', 34.1, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 01:22:17', 2.07, 0.0, 0.23, 0.26,
       1.58, 0, 'windy', 30.1, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 02:22:17', 1.93, 0.0, 0.87, 0.68,
       0.38, 0, 'sunny', 22.6, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 03:22:17', 3.48, 0.0, 1.39, 0.17,
       1.92, 0, 'windy', 16.6, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 04:22:17', 2.7, 0.0, 1.26, 0.08,
       1.36, 0, 'windy', 20.7, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-15 05:22:17', 1.56, 0.0, 1.32, 0.17,
       0.07, 0, 'windy', 30.1, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-15 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 06:22:17', 2.83, 1.43, 0.32, 0.28,
       0.8, 0, 'rainy', 19.1, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 07:22:17', 2.35, 1.77, 0.73, 0.29,
       0, 0.44, 'windy', 22.8, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 08:22:17', 2.42, 2.81, 0.84, 0.19,
       0, 1.42, 'sunny', 25.1, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 09:22:17', 2.51, 1.77, 0.28, 0.01,
       0.45, 0, 'sunny', 18.3, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 10:22:17', 3.43, 1.03, 0.49, 0.35,
       1.56, 0, 'windy', 19.1, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 11:22:17', 2.31, 2.97, 0.38, 0.44,
       0, 1.48, 'sunny', 22.7, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 12:22:17', 2.71, 1.47, 0.92, 0.18,
       0.14, 0, 'cloudy', 26.3, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 13:22:17', 2.62, 2.91, 1.29, 0.66,
       0, 2.24, 'sunny', 31.0, 7.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 14:22:17', 1.8, 1.82, 1.35, 0.6,
       0, 1.97, 'windy', 26.8, 4.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 15:22:17', 2.13, 1.35, 0.7, 0.72,
       0, 0.64, 'sunny', 34.3, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 16:22:17', 1.95, 2.12, 1.4, 0.47,
       0, 2.04, 'sunny', 18.1, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 17:22:17', 2.36, 0.96, 1.43, 0.11,
       0, 0.14, 'windy', 24.1, 5.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 18:22:17', 1.6, 2.93, 0.64, 0.99,
       0, 2.96, 'cloudy', 25.9, 7.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 19:22:17', 3.13, 0.0, 0.96, 0.29,
       1.88, 0, 'windy', 23.4, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 20:22:17', 2.98, 0.0, 0.84, 0.28,
       1.86, 0, 'rainy', 24.9, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 21:22:17', 1.71, 0.0, 1.06, 0.59,
       0.06, 0, 'cloudy', 33.0, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 22:22:17', 3.44, 0.0, 1.2, 0.1,
       2.14, 0, 'sunny', 19.3, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 23:22:17', 3.28, 0.0, 0.26, 0.16,
       2.86, 0, 'sunny', 19.2, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 00:22:17', 1.58, 0.0, 1.19, 0.65,
       0, 0.26, 'cloudy', 17.0, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 01:22:17', 3.23, 0.0, 0.6, 0.23,
       2.4, 0, 'cloudy', 22.2, 8.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 02:22:17', 1.97, 0.0, 0.94, 0.3,
       0.73, 0, 'cloudy', 15.1, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 03:22:17', 1.52, 0.0, 1.43, 0.75,
       0, 0.66, 'windy', 17.1, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 04:22:17', 1.52, 0.0, 0.92, 0.6,
       0, 0, 'windy', 17.1, 4.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-14 05:22:17', 2.43, 0.0, 0.8, 0.6,
       1.03, 0, 'windy', 30.0, 1.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-14 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 06:22:17', 1.61, 2.21, 0.7, 0.86,
       0, 2.16, 'cloudy', 22.3, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 07:22:17', 2.21, 1.24, 0.21, 0.23,
       0.53, 0, 'sunny', 28.9, 6.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 08:22:17', 2.17, 2.72, 0.63, 0.2,
       0, 1.38, 'cloudy', 28.7, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 09:22:17', 2.8, 1.02, 0.75, 0.36,
       0.67, 0, 'windy', 31.3, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 10:22:17', 2.0, 1.15, 1.19, 0.65,
       0, 0.99, 'windy', 16.0, 5.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 11:22:17', 1.87, 1.87, 1.49, 0.74,
       0, 2.23, 'cloudy', 31.6, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 12:22:17', 2.88, 1.5, 0.43, 0.13,
       0.82, 0, 'rainy', 32.7, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 13:22:17', 2.41, 2.71, 1.18, 0.96,
       0, 2.44, 'cloudy', 18.1, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 14:22:17', 2.51, 1.86, 1.35, 0.68,
       0, 1.38, 'sunny', 15.0, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 15:22:17', 2.06, 2.13, 1.41, 0.9,
       0, 2.38, 'cloudy', 25.8, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 16:22:17', 3.19, 1.65, 0.86, 0.5,
       0.18, 0, 'cloudy', 32.8, 5.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 17:22:17', 2.64, 1.5, 0.31, 1.0,
       0, 0.17, 'windy', 27.3, 1.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 18:22:17', 1.84, 1.68, 1.22, 0.24,
       0, 1.3, 'rainy', 33.2, 8.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 19:22:17', 1.62, 0.0, 0.99, 0.16,
       0.47, 0, 'rainy', 31.8, 5.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 20:22:17', 1.71, 0.0, 1.44, 0.87,
       0, 0.6, 'rainy', 23.5, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 21:22:17', 2.97, 0.0, 0.65, 0.08,
       2.24, 0, 'windy', 24.6, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 22:22:17', 1.7, 0.0, 0.59, 0.54,
       0.57, 0, 'windy', 27.7, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 23:22:17', 2.08, 0.0, 0.71, 0.47,
       0.9, 0, 'rainy', 25.6, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 00:22:17', 3.22, 0.0, 0.74, 0.25,
       2.23, 0, 'sunny', 24.8, 1.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 01:22:17', 3.14, 0.0, 0.7, 0.45,
       1.99, 0, 'cloudy', 30.0, 1.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 02:22:17', 2.67, 0.0, 0.93, 0.14,
       1.6, 0, 'sunny', 32.1, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 03:22:17', 3.22, 0.0, 0.24, 0.78,
       2.2, 0, 'sunny', 30.2, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 04:22:17', 1.99, 0.0, 0.31, 0.44,
       1.24, 0, 'cloudy', 29.2, 1.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-13 05:22:17', 2.96, 0.0, 0.72, 0.05,
       2.19, 0, 'cloudy', 20.2, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-13 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 06:22:17', 2.29, 2.35, 1.0, 0.4,
       0, 1.46, 'windy', 16.6, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 07:22:17', 2.3, 0.5, 0.4, 0.93,
       0.47, 0, 'windy', 25.4, 1.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 08:22:17', 1.81, 2.9, 1.5, 0.15,
       0, 2.74, 'cloudy', 34.8, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 09:22:17', 2.73, 1.96, 0.47, 0.39,
       0, 0.09, 'sunny', 18.5, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 10:22:17', 3.02, 1.99, 0.23, 0.52,
       0.28, 0, 'rainy', 15.3, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 11:22:17', 1.92, 1.59, 0.87, 0.17,
       0, 0.71, 'sunny', 18.5, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 12:22:17', 2.35, 1.07, 1.15, 0.88,
       0, 0.75, 'windy', 25.4, 3.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 13:22:17', 2.76, 2.35, 0.54, 0.53,
       0, 0.66, 'windy', 20.2, 8.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 14:22:17', 2.89, 2.3, 1.43, 0.07,
       0, 0.91, 'rainy', 34.7, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 15:22:17', 2.49, 1.4, 1.24, 0.44,
       0, 0.59, 'rainy', 27.0, 2.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 16:22:17', 1.79, 1.19, 0.59, 0.17,
       0, 0.16, 'windy', 20.9, 8.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 17:22:17', 2.84, 0.83, 1.27, 0.4,
       0.34, 0, 'windy', 21.9, 6.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 18:22:17', 2.85, 2.99, 0.42, 0.08,
       0, 0.64, 'windy', 32.6, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 19:22:17', 2.89, 0.0, 0.24, 0.18,
       2.47, 0, 'windy', 17.4, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 20:22:17', 2.95, 0.0, 1.49, 0.82,
       0.64, 0, 'cloudy', 31.0, 1.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 21:22:17', 2.17, 0.0, 0.96, 0.53,
       0.68, 0, 'rainy', 30.1, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 22:22:17', 3.32, 0.0, 1.32, 0.5,
       1.5, 0, 'cloudy', 16.7, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 23:22:17', 3.34, 0.0, 0.57, 0.02,
       2.75, 0, 'cloudy', 27.4, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 00:22:17', 1.82, 0.0, 0.66, 0.69,
       0.47, 0, 'rainy', 18.4, 7.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 01:22:17', 3.44, 0.0, 1.1, 0.96,
       1.38, 0, 'rainy', 23.9, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 02:22:17', 2.47, 0.0, 1.36, 0.23,
       0.88, 0, 'rainy', 31.3, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 03:22:17', 2.77, 0.0, 0.9, 0.78,
       1.09, 0, 'cloudy', 21.5, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 04:22:17', 1.66, 0.0, 0.8, 0.3,
       0.56, 0, 'rainy', 20.4, 2.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-12 05:22:17', 1.52, 0.0, 0.34, 0.57,
       0.61, 0, 'sunny', 34.2, 4.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-12 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 06:22:17', 2.05, 1.56, 0.31, 0.83,
       0, 0.65, 'windy', 15.9, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 07:22:17', 2.87, 0.57, 0.55, 0.15,
       1.6, 0, 'windy', 33.3, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 08:22:17', 2.11, 0.59, 1.04, 0.01,
       0.47, 0, 'windy', 22.7, 6.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 09:22:17', 3.13, 2.43, 0.57, 0.6,
       0, 0.47, 'rainy', 18.6, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 10:22:17', 2.67, 2.03, 0.76, 0.24,
       0, 0.36, 'rainy', 23.0, 2.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 11:22:17', 1.96, 0.59, 0.58, 0.1,
       0.69, 0, 'sunny', 29.7, 3.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 12:22:17', 2.04, 2.1, 0.27, 0.58,
       0, 0.91, 'sunny', 29.0, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 13:22:17', 1.7, 1.05, 0.32, 0.41,
       0, 0.08, 'cloudy', 18.0, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 14:22:17', 2.93, 2.57, 0.81, 0.29,
       0, 0.74, 'rainy', 25.5, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 15:22:17', 2.8, 2.08, 0.86, 0.91,
       0, 1.05, 'sunny', 26.9, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 16:22:17', 3.07, 2.86, 1.03, 0.64,
       0, 1.46, 'windy', 18.3, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 17:22:17', 1.54, 2.28, 0.65, 0.02,
       0, 1.41, 'sunny', 19.4, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 18:22:17', 3.42, 0.54, 0.92, 0.06,
       1.9, 0, 'cloudy', 27.4, 9.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 19:22:17', 2.2, 0.0, 1.24, 0.42,
       0.54, 0, 'sunny', 34.0, 6.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 20:22:17', 2.76, 0.0, 1.49, 0.47,
       0.8, 0, 'rainy', 32.1, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 21:22:17', 2.69, 0.0, 0.47, 0.14,
       2.08, 0, 'windy', 15.8, 5.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 22:22:17', 2.81, 0.0, 1.39, 0.84,
       0.58, 0, 'windy', 33.1, 0.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 23:22:17', 2.9, 0.0, 1.01, 0.42,
       1.47, 0, 'sunny', 26.2, 3.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 00:22:17', 3.42, 0.0, 0.67, 0.05,
       2.7, 0, 'cloudy', 27.6, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 01:22:17', 2.41, 0.0, 0.59, 0.51,
       1.31, 0, 'cloudy', 15.9, 3.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 02:22:17', 2.53, 0.0, 0.27, 0.92,
       1.34, 0, 'cloudy', 21.8, 9.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 03:22:17', 1.86, 0.0, 0.26, 0.81,
       0.79, 0, 'sunny', 24.1, 2.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 04:22:17', 3.0, 0.0, 0.47, 0.91,
       1.62, 0, 'sunny', 23.5, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-11 05:22:17', 2.3, 0.0, 0.25, 0.54,
       1.51, 0, 'windy', 29.2, 0.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-11 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 06:22:17', 3.33, 2.76, 1.23, 0.31,
       0, 0.97, 'sunny', 32.2, 1.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 07:22:17', 3.09, 0.79, 1.35, 0.97,
       0, 0.02, 'sunny', 25.7, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 08:22:17', 1.99, 0.77, 0.26, 0.65,
       0.31, 0, 'rainy', 34.1, 7.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 09:22:17', 1.83, 2.29, 1.13, 0.62,
       0, 2.21, 'cloudy', 23.2, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 10:22:17', 2.15, 2.4, 0.74, 0.59,
       0, 1.58, 'windy', 27.6, 4.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 11:22:17', 2.24, 0.87, 0.92, 0.96,
       0, 0.51, 'cloudy', 15.2, 8.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 12:22:17', 2.94, 0.95, 1.29, 0.17,
       0.53, 0, 'cloudy', 30.2, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 13:22:17', 1.88, 3.0, 0.91, 0.37,
       0, 2.4, 'rainy', 18.9, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 14:22:17', 2.29, 0.76, 1.06, 0.37,
       0.1, 0, 'sunny', 26.5, 9.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 15:22:17', 1.68, 1.59, 0.4, 0.99,
       0, 1.3, 'windy', 25.6, 6.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 16:22:17', 3.08, 1.75, 0.75, 0.22,
       0.36, 0, 'rainy', 25.5, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 17:22:17', 2.2, 2.99, 1.23, 0.64,
       0, 2.66, 'sunny', 19.3, 9.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 18:22:17', 2.05, 2.79, 0.73, 0.27,
       0, 1.74, 'rainy', 16.6, 4.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 19:22:17', 1.58, 0.0, 1.4, 0.71,
       0, 0.53, 'sunny', 20.3, 3.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 20:22:17', 2.42, 0.0, 0.63, 0.33,
       1.46, 0, 'windy', 17.5, 5.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 21:22:17', 2.75, 0.0, 0.28, 1.0,
       1.47, 0, 'rainy', 15.9, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 22:22:17', 2.74, 0.0, 1.38, 0.07,
       1.29, 0, 'cloudy', 16.3, 0.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 23:22:17', 2.12, 0.0, 1.33, 0.58,
       0.21, 0, 'windy', 24.3, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 00:22:17', 3.42, 0.0, 0.66, 0.95,
       1.81, 0, 'sunny', 17.3, 7.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 01:22:17', 3.36, 0.0, 1.45, 0.76,
       1.15, 0, 'sunny', 23.2, 8.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 02:22:17', 3.37, 0.0, 1.06, 0.31,
       2.0, 0, 'sunny', 24.6, 6.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 03:22:17', 2.76, 0.0, 0.57, 0.18,
       2.01, 0, 'sunny', 32.3, 5.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 04:22:17', 1.52, 0.0, 1.47, 0.78,
       0, 0.73, 'cloudy', 16.0, 2.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-10 05:22:17', 3.46, 0.0, 0.22, 0.7,
       2.54, 0, 'cloudy', 29.3, 2.0
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-10 05:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 06:22:17', 2.62, 2.36, 0.99, 0.42,
       0, 1.15, 'cloudy', 22.7, 9.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 06:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 07:22:17', 2.72, 1.96, 0.79, 0.13,
       0, 0.16, 'sunny', 28.4, 0.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 07:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 08:22:17', 1.93, 1.99, 1.43, 0.6,
       0, 2.09, 'rainy', 29.0, 1.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 08:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 09:22:17', 2.02, 1.68, 1.26, 0.39,
       0, 1.31, 'rainy', 32.2, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 09:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 10:22:17', 2.52, 1.03, 0.4, 0.17,
       0.92, 0, 'sunny', 25.0, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 10:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 11:22:17', 2.86, 0.52, 0.72, 0.99,
       0.63, 0, 'rainy', 34.6, 8.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 11:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 12:22:17', 2.43, 0.92, 0.74, 0.36,
       0.41, 0, 'sunny', 17.6, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 12:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 13:22:17', 3.16, 2.3, 1.42, 0.09,
       0, 0.65, 'rainy', 18.7, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 13:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 14:22:17', 3.49, 1.65, 1.46, 0.48,
       0, 0.1, 'rainy', 17.0, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 14:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 15:22:17', 2.05, 1.89, 1.38, 0.51,
       0, 1.73, 'rainy', 19.4, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 15:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 16:22:17', 3.17, 1.36, 0.66, 0.67,
       0.48, 0, 'windy', 30.5, 8.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 16:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 17:22:17', 3.36, 2.26, 1.49, 0.34,
       0, 0.73, 'rainy', 30.9, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 17:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 18:22:17', 2.49, 2.71, 0.61, 0.72,
       0, 1.55, 'cloudy', 16.8, 9.5
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 18:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 19:22:17', 2.33, 0.0, 0.62, 0.94,
       0.77, 0, 'rainy', 24.9, 6.7
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 19:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 20:22:17', 3.33, 0.0, 1.0, 0.15,
       2.18, 0, 'sunny', 15.3, 3.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 20:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 21:22:17', 2.83, 0.0, 0.8, 0.77,
       1.26, 0, 'cloudy', 31.8, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 21:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 22:22:17', 3.47, 0.0, 0.68, 0.61,
       2.18, 0, 'windy', 27.1, 9.8
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 22:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-08 23:22:17', 3.42, 0.0, 0.46, 0.56,
       2.4, 0, 'windy', 25.3, 6.6
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-08 23:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 00:22:17', 3.35, 0.0, 0.2, 0.06,
       3.09, 0, 'windy', 32.1, 2.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 00:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 01:22:17', 2.75, 0.0, 0.68, 0.24,
       1.83, 0, 'sunny', 15.4, 4.2
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 01:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 02:22:17', 1.67, 0.0, 1.3, 0.85,
       0, 0.48, 'windy', 19.5, 7.1
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 02:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 03:22:17', 2.32, 0.0, 0.93, 0.58,
       0.81, 0, 'sunny', 30.8, 7.9
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 03:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 04:22:17', 2.43, 0.0, 1.14, 0.34,
       0.95, 0, 'windy', 31.3, 9.3
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 04:22:17'
);

INSERT INTO energy_data (
    user_id, timestamp, consumption_kwh, solar_generation_kwh, wind_generation_kwh,
    battery_generation_kwh, grid_import_kwh, grid_export_kwh, weather_condition,
    temperature, wind_speed
) 
SELECT 1, '2025-02-09 05:22:17', 3.2, 0.0, 1.0, 0.73,
       1.47, 0, 'windy', 29.4, 8.4
WHERE NOT EXISTS (
    SELECT 1 FROM energy_data WHERE user_id = 1 AND timestamp = '2025-02-09 05:22:17'
);