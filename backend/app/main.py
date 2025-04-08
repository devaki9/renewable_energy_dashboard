#backend/app/main.py

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.database import engine
from app.models import user
from app.models.energy_data import EnergyData
from app.routes import auth, energy_data as energy_routes

# Create database tables
user.Base.metadata.create_all(bind=engine)
EnergyData.metadata.create_all(bind=engine)

app = FastAPI(title="Renewable Energy Dashboard")

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost", "http://localhost:80"],  # Frontend origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

#Include routers
app.include_router(auth.router)
app.include_router(energy_routes.router)

@app.get("/")
async def root():
    return {"message": "Welcome to Renewable Energy Dashboard API"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
