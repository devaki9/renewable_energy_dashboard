#!/bin/bash
set -e


echo "Waiting for PostgreSQL to be up..."
while ! pg_isready -h db -p 5432 -U postgres; do
  sleep 1
done
echo "PostgreSQL is ready!"

# Run the initialization script
echo "Initializing database..."
PGPASSWORD=yourpassword psql -h db -U postgres -d renewable_energy -f /app/init_db.sql
echo "Database initialization completed"

# Start the application
echo "Starting the backend application..."
exec uvicorn app.main:app --host 0.0.0.0 --port 8000 