# Renewable Energy Dashboard

A full-stack application for monitoring and visualizing renewable energy data.
## Prerequisites

- Docker and Docker Compose
- FastAPI (for local development)
- Python 3.11 (for local development)
- NPM (for local development)
- React, TailwindCSS, ChartJS (for local development)

## TABLE OF CONTENTS

[1. **Introduction**](#1-introduction)  
   [1.1 About the Project](#11-about-the-project)  
   [1.2 Target Users](#12-target-users)  
   [1.3 Dashboard Purpose](#13-dashboard-purpose)  
   [1.4 User Personas](#14-user-personas)
[2. **Design**](#2-design)  
   [2.1 Assumptions](#21-assumptions)  
   [2.2 Scalability Considerations](#22-scalability-considerations)  
   [2.3 System Architecture Diagram](#23-system-architecture-diagram)  
   [2.4 Database & Data Model](#24-database--data-model)

   Obtaining energy data from public datasets seemed like one choice, however, cleaning and pre-processing would add overhead in a time-constrained situation.  
   [2.5 Tech Stack](#25-tech-stack)  
   [2.6 Platform Compatibility](#26-platform-compatibility)
[3. **Installation & Deployment**](#3-installation--deployment)  
   [3.1 Docker Setup (Quickstart)](#31-docker-setup-quickstart)  
   [3.2 Local Setup](#32-local-setup) 
[4. **API Usage Examples**](#4-api-usage-examples)  
   [4.1 Auth Endpoints](#41-auth-endpoints)  
   [4.2 Energy Data Endpoints](#42-energy-data-endpoints)  
   [4.3 Insights & Summary APIs](#43-insights--summary-apis)  
   [4.4 Carbon Footprint & Source Contribution](#44-carbon-footprint--source-contribution)
[5. **Pending Activities**](#5-pending-activities)  
   [5.1 Testing Enhancements](#51-testing-enhancements)  
   [5.2 Role-based Access](#52-role-based-access)  
   [5.3 Notification System](#53-notification-system)  
   [5.4 Data Export Options](#54-data-export-options)
[6. **Future Scope**](#6-future-scope)  
   [6.1 Real Weather Data Integration](#61-real-weather-data-integration)  
   [6.2 Enterprise Dashboard Mode](#62-enterprise-dashboard-mode)  
   [6.3 Mobile App or PWA Version](#63-mobile-app-or-pwa-version)
   [6.4 Data Pipeline for Adding Multiple Sources](#64-data-pipeline-for-adding-multiple-sources)

### 1.1 About the Project
This application is a renewable energy monitoring dashboard built to help users(residential) track and visualize energy consumption and generation trends. The focus is on highlighting renewable energy usage transparent and actionable by showing users real-time and historical patterns in how they consume and generate energy from on-premise sources like solar, wind, and battery systems.

### 1.2 Target Users
Due to the time constraints, in this initial version, the target user is a **residential user** — someone who consumes energy and has personal energy generation systems at home (solar panels, battery storage, etc.).

In the future versions, the system is intended to support **corporate users** such as energy organizations having large-scale energy generation sources. These users can:
- Monitor organizational energy production and usage
- Filter by energy source
- Analyze regional and global site-level data

### 1.3 Dashboard Purpose
This dashboard provides the following:
1. **Overview of consumption and generation** – View overview of  energy consumption and generation metrics
2. **Insights** – Explore trends and patterns over time
3. **Energy source contribution tracking** – Understand how much energy was generated by each source
4. **Optional future features**:
   - Carbon footprint tracking
   - Alerts and notifications for anomalies
   - Report generation and data exporting

### 1.4 User Personas
**Thought Process Before Finalizing Users:**
- A residential user benefits from personalized tracking, but meaningful source-based insights require detailed data on their household energy setup.
- A corporate user from an energy-producing organization could use the dashboard to monitor distributed infrastructure (like solar farms, wind parks).

**Decided Approach:**
- Start with residential user functionality using mock hourly data.
- Expand later to corporate users and organizational-level analytics, including role-based dashboards and global operations.

### 3.1 Docker Setup (Quickstart)
```bash
git clone https://github.com/devaki9/renewable_energy_dashboard.git
cd renewable-energy-dashboard
docker-compose up --build
```
The application will be available at:
   - Frontend: http://localhost/5173
   - Backend API: http://localhost:8000

**Note:** Run a docker-compose down -v if you want to start afresh

### 3.2 Local Setup
#### Backend Setup
1. Clone the repository
   ```bash
      git clone https://github.com/devaki9/renewable_energy_dashboard.git
   ```
2. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Switch to existing virtual environment:
   ```bash
   source dev/bin/activate
   ```
3. You can also create your own virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Install PostgreSQL:
   - Add your PostgreSQL password to the .env file
   - Ensure Postgres is running and run init_db.sql to populate schema and mock data.
5. Run the backend server:
   ```bash
   uvicorn app.main:app --reload
   ```

### Frontend Setup
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the development server:
   ```bash
   npm run dev
   ```

### 6.1 Real Weather Data Integration
Currently, weather data such as temperature, wind speed, and condition are simulated. A future improvement is to integrate accurate live weather APIs (e.g., OpenWeather, Climacell) for accurate, real-time environmental metrics. This will help correlate renewable energy production with weather patterns and geographical conditions, which is valuable for solar and wind generation analysis.

### 6.2 Enterprise Dashboard Mode
We could introduce a new user role: **corporate user**, designed for energy organizations such that:
- Multiple corporate users could be representing a single energy organization.
- Users can monitor company-wide energy generation and consumption metrics. 
- Such users could possibly be data analysts, business analysts for the energy orgs.

The Dashboard would allow for users to save frequently used or relevant visualizations and set alerts for monitoring and reporting purposes. Future enhancements may include financial analytics such as **revenue per energy source per hour/day**. An added feature would be to consider geospatial views showcasing a bird's-eye view of the global facilities.

### 6.3 Mobile App or PWA Version
To improve accessibility and user engagement, we could do the following:
- Build a mobile-responsive version using **React PWA** or a native app via React Native/Flutter.
- Target quick energy insights and notifications for residential users on the go.
- Offline data caching and push notifications for alerts can be implemented.

### 6.4 Data Pipeline for Adding Multiple Sources
To transition from an MVP to production-ready application, we need to focus on ensuring the data backing the application is real-time, sanitized and standardized before it is persisted in a database.
To make the application production-ready, we need to implement the following:
- Add a **data ingestion microservice** that accepts multiple data formats:
  - IoT data streams
  - Uploaded CSV files by users
  - REST API inputs from smart energy systems
- Include validation, transformation, and cleaning steps before loading into the database.

We could design this as a **modular pipeline**, so that new source formats can be integrated easily.

## License
This project is licensed under the MIT License - see the LICENSE file for details. 