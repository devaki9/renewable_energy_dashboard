import React, { useEffect, useState } from 'react';
import { useEnergy } from '../../contexts/EnergyContext';
import EnergyChart from '../charts/EnergyChart';
import { ChartData } from 'chart.js';

const RealTimeMonitoring: React.FC = () => {
  const { realTimeData, loading, error } = useEnergy();
  const [chartData, setChartData] = useState<ChartData<'bar'> | null>(null);

  useEffect(() => {
    if (realTimeData) {
      setChartData({
        labels: ['Current'],
        datasets: [
          {
            label: 'Consumption',
            data: [realTimeData.consumption_kwh || 0],
            borderColor: 'rgb(75, 192, 192)',
            backgroundColor: 'rgba(75, 192, 192, 0.5)',
          },
          {
            label: 'Solar Generation',
            data: [realTimeData.solar_generation_kwh || 0],
            borderColor: 'rgb(255, 159, 64)',
            backgroundColor: 'rgba(255, 159, 64, 0.5)',
          },
          {
            label: 'Wind Generation',
            data: [realTimeData.wind_generation_kwh || 0],
            borderColor: 'rgb(54, 162, 235)',
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
          },
          {
            label: 'Battery Generation',
            data: [realTimeData.battery_generation_kwh || 0],
            borderColor: 'rgb(153, 102, 255)',
            backgroundColor: 'rgba(153, 102, 255, 0.5)',
          },
        ],
      });
    }
  }, [realTimeData]);

  if (loading) {
    return <div className="text-center py-8">Loading real-time data...</div>;
  }

  if (error) {
    return <div className="text-center py-8 text-red-600">{error}</div>;
  }

  if (!realTimeData) {
    return <div className="text-center py-8">No real-time data available</div>;
  }

  // Check if all values are zero (no data)
  const hasData = Object.entries(realTimeData).some(([key, value]) => {
    if (key === 'timestamp') return false;
    return typeof value === 'number' && value !== 0;
  });

  if (!hasData) {
    return (
      <div className="text-center py-8">
        <h3 className="text-lg font-medium text-gray-900 mb-2">No Energy Data Available</h3>
        <p className="text-gray-600">
          There is no energy data available for your account. Please add some data to see the real-time monitoring.
        </p>
      </div>
    );
  }

  // Safely access properties with fallbacks to 0
  const consumption = realTimeData.consumption_kwh || 0;
  const solarGeneration = realTimeData.solar_generation_kwh || 0;
  const windGeneration = realTimeData.wind_generation_kwh || 0;
  const batteryGeneration = realTimeData.battery_generation_kwh || 0;
  const temperature = realTimeData.temperature_c || 0;
  const humidity = realTimeData.humidity_percent || 0;
  const windSpeed = realTimeData.wind_speed_mps || 0;
  const gridImport = realTimeData.grid_import_kwh || 0;
  const gridExport = realTimeData.grid_export_kwh || 0;
  const co2Saved = realTimeData.co2_saved_kg || 0;

  return (
    <div className="space-y-6">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Current Consumption</h3>
          <p className="text-3xl font-bold text-blue-600">
            {consumption.toFixed(2)} kWh
          </p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Solar Generation</h3>
          <p className="text-3xl font-bold text-orange-600">
            {solarGeneration.toFixed(2)} kWh
          </p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Wind Generation</h3>
          <p className="text-3xl font-bold text-blue-600">
            {windGeneration.toFixed(2)} kWh
          </p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Battery Generation</h3>
          <p className="text-3xl font-bold text-purple-600">
            {batteryGeneration.toFixed(2)} kWh
          </p>
        </div>
      </div>

      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-lg font-medium text-gray-900 mb-4">Real-time Energy Distribution</h3>
        {chartData && (
          <EnergyChart
            type="bar"
            data={chartData}
            title="Current Energy Distribution"
            height={300}
          />
        )}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900 mb-4">Weather Conditions</h3>
          <div className="space-y-2">
            <p className="flex justify-between">
              <span className="text-gray-600">Temperature:</span>
              <span className="font-medium">{temperature.toFixed(1)}°C</span>
            </p>
            <p className="flex justify-between">
              <span className="text-gray-600">Humidity:</span>
              <span className="font-medium">{humidity.toFixed(1)}%</span>
            </p>
            <p className="flex justify-between">
              <span className="text-gray-600">Wind Speed:</span>
              <span className="font-medium">{windSpeed.toFixed(1)} m/s</span>
            </p>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900 mb-4">Grid Status</h3>
          <div className="space-y-2">
            <p className="flex justify-between">
              <span className="text-gray-600">Grid Import:</span>
              <span className="font-medium text-red-600">
                {gridImport.toFixed(2)} kWh
              </span>
            </p>
            <p className="flex justify-between">
              <span className="text-gray-600">Grid Export:</span>
              <span className="font-medium text-green-600">
                {gridExport.toFixed(2)} kWh
              </span>
            </p>
            <p className="flex justify-between">
              <span className="text-gray-600">CO2 Saved:</span>
              <span className="font-medium text-green-600">
                {co2Saved.toFixed(2)} kg
              </span>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default RealTimeMonitoring; 