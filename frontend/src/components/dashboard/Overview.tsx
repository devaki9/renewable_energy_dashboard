import React, { useEffect, useState } from 'react';
import { useEnergy } from '../../contexts/EnergyContext';
import EnergyChart from '../charts/EnergyChart';
import { ChartData } from 'chart.js';

const Overview: React.FC = () => {
  const { summary, loading, error } = useEnergy();
  const [chartData, setChartData] = useState<ChartData<'bar'> | null>(null);

  useEffect(() => {
    if (summary) {
      setChartData({
        labels: ['Energy Sources'],
        datasets: [
          {
            label: 'Solar Generation',
            data: [summary.total_solar_generation],
            borderColor: 'rgb(255, 159, 64)',
            backgroundColor: 'rgba(255, 159, 64, 0.5)',
          },
          {
            label: 'Wind Generation',
            data: [summary.total_wind_generation],
            borderColor: 'rgb(54, 162, 235)',
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
          },
          {
            label: 'Battery Generation',
            data: [summary.total_battery_generation],
            borderColor: 'rgb(153, 102, 255)',
            backgroundColor: 'rgba(153, 102, 255, 0.5)',
          },
        ],
      });
    }
  }, [summary]);

  if (loading) {
    return <div className="text-center py-8">Loading overview data...</div>;
  }

  if (error) {
    return <div className="text-center py-8 text-red-600">{error}</div>;
  }

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-bold">Energy Dashboard Overview</h2>
      
      {/* Key Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Total Consumption</h3>
          <p className="text-3xl font-bold text-blue-600">
            {summary?.total_consumption.toFixed(2)} kWh
          </p>
          <p className="text-sm text-gray-500 mt-1">Last 24 hours</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Renewable Generation</h3>
          <p className="text-3xl font-bold text-green-600">
            {((summary?.total_solar_generation || 0) + 
              (summary?.total_wind_generation || 0) + 
              (summary?.total_battery_generation || 0)).toFixed(2)} kWh
          </p>
          <p className="text-sm text-gray-500 mt-1">
            {summary?.renewable_percentage.toFixed(1)}% of total
          </p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">Grid Import</h3>
          <p className="text-3xl font-bold text-yellow-600">
            {summary?.total_grid_import.toFixed(2)} kWh
          </p>
          <p className="text-sm text-gray-500 mt-1">From the grid</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900">CO2 Saved</h3>
          <p className="text-3xl font-bold text-purple-600">
            {summary?.total_co2_saved.toFixed(2)} kg
          </p>
          <p className="text-sm text-gray-500 mt-1">Carbon footprint reduction</p>
        </div>
      </div>
      
      {/* Energy Source Breakdown */}
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-lg font-medium text-gray-900 mb-4">Energy Source Breakdown</h3>
        {chartData && (
          <EnergyChart
            type="bar"
            data={chartData}
            title="Energy Generation by Source"
            height={300}
          />
        )}
      </div>
      
      {/* Quick Actions */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <button className="bg-indigo-600 text-white py-3 px-4 rounded-lg hover:bg-indigo-700 transition">
          View Detailed History
        </button>
        <button className="bg-green-600 text-white py-3 px-4 rounded-lg hover:bg-green-700 transition">
          Download Report
        </button>
        <button className="bg-yellow-600 text-white py-3 px-4 rounded-lg hover:bg-yellow-700 transition">
          Set Alerts
        </button>
        <button className="bg-purple-600 text-white py-3 px-4 rounded-lg hover:bg-purple-700 transition">
          Carbon Analysis
        </button>
      </div>
    </div>
  );
};

export default Overview; 