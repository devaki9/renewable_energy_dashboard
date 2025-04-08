import React, { useEffect, useState } from 'react';
import { useEnergy } from '../../contexts/EnergyContext';
import EnergyChart from '../charts/EnergyChart';
import { ChartData } from 'chart.js';

const HistoricalData: React.FC = () => {
  const { historicalData, loading, error, timeRange, setTimeRange } = useEnergy();
  const [chartData, setChartData] = useState<ChartData<'line'> | null>(null);

  useEffect(() => {
    if (historicalData.length > 0) {
      const labels = historicalData.map(data => 
        new Date(data.timestamp).toLocaleString()
      );

      setChartData({
        labels,
        datasets: [
          {
            label: 'Consumption',
            data: historicalData.map(data => data.consumption_kwh),
            borderColor: 'rgb(75, 192, 192)',
            backgroundColor: 'rgba(75, 192, 192, 0.5)',
          },
          {
            label: 'Solar Generation',
            data: historicalData.map(data => data.solar_generation_kwh),
            borderColor: 'rgb(255, 159, 64)',
            backgroundColor: 'rgba(255, 159, 64, 0.5)',
          },
          {
            label: 'Wind Generation',
            data: historicalData.map(data => data.wind_generation_kwh),
            borderColor: 'rgb(54, 162, 235)',
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
          },
          {
            label: 'Battery Generation',
            data: historicalData.map(data => data.battery_generation_kwh),
            borderColor: 'rgb(153, 102, 255)',
            backgroundColor: 'rgba(153, 102, 255, 0.5)',
          },
        ],
      });
    }
  }, [historicalData]);

  if (loading) {
    return <div className="text-center py-8">Loading historical data...</div>;
  }

  if (error) {
    return <div className="text-center py-8 text-red-600">{error}</div>;
  }

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-bold">Historical Energy Data</h2>
        <div className="flex space-x-2">
          <button
            className={`px-4 py-2 rounded-lg ${
              timeRange === 'hourly'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
            }`}
            onClick={() => setTimeRange('hourly')}
          >
            Hourly
          </button>
          <button
            className={`px-4 py-2 rounded-lg ${
              timeRange === 'daily'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
            }`}
            onClick={() => setTimeRange('daily')}
          >
            Daily
          </button>
          <button
            className={`px-4 py-2 rounded-lg ${
              timeRange === 'weekly'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
            }`}
            onClick={() => setTimeRange('weekly')}
          >
            Weekly
          </button>
          <button
            className={`px-4 py-2 rounded-lg ${
              timeRange === 'monthly'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
            }`}
            onClick={() => setTimeRange('monthly')}
          >
            Monthly
          </button>
        </div>
      </div>

      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-lg font-medium text-gray-900 mb-4">Energy Consumption & Generation</h3>
        {chartData && (
          <EnergyChart
            type="line"
            data={chartData}
            title={`Historical Energy Data (${timeRange})`}
            height={400}
          />
        )}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900 mb-4">Grid Interaction</h3>
          {chartData && (
            <EnergyChart
              type="line"
              data={{
                labels: chartData.labels,
                datasets: [
                  {
                    label: 'Grid Import',
                    data: historicalData.map(data => data.grid_import_kwh),
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                  },
                  {
                    label: 'Grid Export',
                    data: historicalData.map(data => data.grid_export_kwh),
                    borderColor: 'rgb(75, 192, 192)',
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                  },
                ],
              }}
              title="Grid Import/Export"
              height={300}
            />
          )}
        </div>

        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-medium text-gray-900 mb-4">Environmental Impact</h3>
          {chartData && (
            <EnergyChart
              type="line"
              data={{
                labels: chartData.labels,
                datasets: [
                  {
                    label: 'CO2 Saved',
                    data: historicalData.map(data => data.co2_saved_kg),
                    borderColor: 'rgb(153, 102, 255)',
                    backgroundColor: 'rgba(153, 102, 255, 0.5)',
                  },
                ],
              }}
              title="CO2 Savings Over Time"
              height={300}
            />
          )}
        </div>
      </div>
    </div>
  );
};

export default HistoricalData; 