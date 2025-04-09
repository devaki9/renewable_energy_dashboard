import React, { useEffect, useState, useCallback } from 'react';
import { useEnergy } from '../../contexts/EnergyContext';
import EnergyChart from '../charts/EnergyChart';
import { ChartData } from 'chart.js';
import { Tooltip } from 'react-tooltip';
import 'react-tooltip/dist/react-tooltip.css';

interface ExtendedChartDataset {
  label: string;
  data: number[];
  borderColor: string;
  backgroundColor: string;
  percentage: string;
}

const Overview: React.FC = () => {
  const { 
    summary, 
    loading, 
    error, 
    timeRange, 
    setTimeRange,
    dateRange,
    setDateRange,
    refreshData,
    realTimeData
  } = useEnergy();
  const [chartData, setChartData] = useState<ChartData<'bar'> | null>(null);
  const [showPercentages, setShowPercentages] = useState(false);
  const [dateError, setDateError] = useState<string | null>(null);
  const [lastUpdated, setLastUpdated] = useState<Date | undefined>(undefined);
  const [isUpdating, setIsUpdating] = useState(false);

  // Handle manual update button click
  const handleUpdate = useCallback(async () => {
    setIsUpdating(true);
    try {
      await refreshData();
      setLastUpdated(new Date());
    } catch (err) {
      console.error('Error updating data:', err);
    } finally {
      setIsUpdating(false);
    }
  }, [refreshData]);

  // Update chart data when summary changes
  useEffect(() => {
    if (summary) {
      const total = summary.total_solar_generation + 
                   summary.total_wind_generation + 
                   summary.total_battery_generation;

      const datasets: ExtendedChartDataset[] = [
        {
          label: 'Consumption',
          data: [summary.total_consumption],
          borderColor: 'rgb(255, 99, 132)',
          backgroundColor: 'rgba(255, 99, 132, 0.5)',
          percentage: '100', // Consumption is always 100% of itself
        },
        {
          label: 'Solar Generation',
          data: [summary.total_solar_generation],
          borderColor: 'rgb(255, 159, 64)',
          backgroundColor: 'rgba(255, 159, 64, 0.5)',
          percentage: total > 0 ? (summary.total_solar_generation / total * 100).toFixed(1) : '0',
        },
        {
          label: 'Wind Generation',
          data: [summary.total_wind_generation],
          borderColor: 'rgb(54, 162, 235)',
          backgroundColor: 'rgba(54, 162, 235, 0.5)',
          percentage: total > 0 ? (summary.total_wind_generation / total * 100).toFixed(1) : '0',
        },
        {
          label: 'Battery Generation',
          data: [summary.total_battery_generation],
          borderColor: 'rgb(153, 102, 255)',
          backgroundColor: 'rgba(153, 102, 255, 0.5)',
          percentage: total > 0 ? (summary.total_battery_generation / total * 100).toFixed(1) : '0',
        },
      ];

      setChartData({
        labels: ['Energy Sources'],
        datasets: datasets as any,
      });
    }
  }, [summary]);

  // Set last updated time when realTimeData changes
  useEffect(() => {
    if (realTimeData?.timestamp) {
      setLastUpdated(new Date(realTimeData.timestamp));
    }
  }, [realTimeData]);

  // Validate date range
  const validateDateRange = (start: string, end: string) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    const startDate = new Date(start);
    const endDate = new Date(end);
    
    if (startDate > today) {
      setDateError("Start date cannot be in the future");
      return false;
    }
    
    if (endDate < startDate) {
      setDateError("End date cannot be earlier than start date");
      return false;
    }
    
    setDateError(null);
    return true;
  };

  // Handle date range change
  const handleDateRangeChange = (field: 'start' | 'end', value: string) => {
    const newDateRange = { ...dateRange, [field]: value };
    
    if (validateDateRange(newDateRange.start, newDateRange.end)) {
      setDateRange(newDateRange);
    }
  };

  // Generate consumption tooltip content
  const getConsumptionTooltipContent = () => {
    if (!summary) return "No data available";
    
    const consumption = summary.total_consumption || 0;
    const solar = summary.total_solar_generation || 0;
    const wind = summary.total_wind_generation || 0;
    const battery = summary.total_battery_generation || 0;
    const grid = summary.total_grid_import || 0;
    
    const renewableKwh = solar + wind + battery;
    const renewablePct = consumption > 0 ? Math.round((renewableKwh / consumption) * 100) : 0;
    
    // If consumption is fully met by renewables
    if (renewablePct >= 100) {
      return `You consumed ${consumption.toFixed(1)} kWh today — 100% powered by renewables! ⚡🌿`;
    }
    
    // If mostly grid
    if (grid > renewableKwh) {
      return `You consumed ${consumption.toFixed(1)} kWh today
– ${grid.toFixed(1)} kWh from the grid
– ${renewableKwh.toFixed(1)} kWh from your own sources

You're currently relying on the grid for most of your energy.`;
    }
    
    // Default case
    return `You consumed ${consumption.toFixed(1)} kWh today
– ${solar.toFixed(1)} kWh from solar ☀️
– ${wind.toFixed(1)} kWh from wind 🌬
– ${battery.toFixed(1)} kWh from battery 🔋
– ${grid.toFixed(1)} kWh from the grid ⚡

${renewablePct}% of your energy came from renewable sources 🌱`;
  };

  if (loading) {
    return <div className="text-center py-8">Loading overview data...</div>;
  }

  if (error) {
    return <div className="text-center py-8 text-red-600">{error}</div>;
  }

  // Calculate comparative metrics
  const calculateChange = (current: number, previous: number) => {
    if (previous === 0) return 0;
    return ((current - previous) / previous * 100).toFixed(1);
  };

  const getChangeIndicator = (change: number) => {
    return change > 0 ? '▲' : '📉';
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-green-50 p-6">
      <div className="max-w-7xl mx-auto space-y-6">
        <div className="flex justify-between items-center">
          <h2 className="text-3xl font-bold text-gray-800">Energy Dashboard Overview</h2>
          <div className="flex space-x-4">
            <select
              className="px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500"
              value={timeRange}
              onChange={(e) => setTimeRange(e.target.value as any)}
            >
              <option value="hourly">Last 24 hours</option>
              <option value="daily">Past week</option>
              <option value="weekly">Past month</option>
              <option value="monthly">Past 3 months</option>
            </select>
            <div className="flex flex-col space-y-2">
              <div className="flex space-x-2">
                <input
                  type="date"
                  className="px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500"
                  value={dateRange.start}
                  onChange={(e) => handleDateRangeChange('start', e.target.value)}
                />
                <input
                  type="date"
                  className="px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500"
                  value={dateRange.end}
                  onChange={(e) => handleDateRangeChange('end', e.target.value)}
                />
              </div>
              {dateError && <p className="text-red-500 text-sm">{dateError}</p>}
            </div>
          </div>
        </div>
        
        {/* Key Metrics */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div className="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <h3 className="text-lg font-medium text-gray-900 flex items-center justify-center">
              Total Consumption
              <span 
                className="ml-2 cursor-help"
                data-tooltip-id="consumption-tooltip"
                data-tooltip-html={getConsumptionTooltipContent()}
              >
                ⓘ
              </span>
            </h3>
            <p className="text-3xl font-bold text-blue-600">
              {summary?.total_consumption.toFixed(2)} kWh
            </p>
            <p className="text-sm text-gray-500 mt-1">
              {getChangeIndicator(Number(calculateChange(summary?.total_consumption || 0, summary?.total_consumption || 0)))}
              {Math.abs(Number(calculateChange(summary?.total_consumption || 0, summary?.total_consumption || 0)))}% from previous period
            </p>
          </div>
          
          <div className="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <h3 className="text-lg font-medium text-gray-900 flex items-center justify-center">
              Renewable Generation
              <span 
                className="ml-2 cursor-help"
                data-tooltip-id="renewable-tooltip"
                data-tooltip-content="Total energy generated from solar, wind, and battery sources"
              >
                ⓘ
              </span>
            </h3>
            <p className="text-3xl font-bold text-green-600">
              {((summary?.total_solar_generation || 0) + 
                (summary?.total_wind_generation || 0) + 
                (summary?.total_battery_generation || 0)).toFixed(2)} kWh
            </p>
            <p className="text-sm text-gray-500 mt-1">
              {summary?.renewable_percentage.toFixed(1)}% of total
            </p>
          </div>
          
          <div className="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <h3 className="text-lg font-medium text-gray-900 flex items-center justify-center">
              Grid Import
              <span 
                className="ml-2 cursor-help"
                data-tooltip-id="grid-tooltip"
                data-tooltip-content="Energy needed from the grid"
              >
                ⓘ
              </span>
            </h3>
            <p className="text-3xl font-bold text-yellow-600">
              {summary?.total_grid_import.toFixed(2)} kWh
            </p>
            <p className="text-sm text-gray-500 mt-1">
              {getChangeIndicator(Number(calculateChange(summary?.total_grid_import || 0, summary?.total_grid_import || 0)))}
              {Math.abs(Number(calculateChange(summary?.total_grid_import || 0, summary?.total_grid_import || 0)))}% from previous period
            </p>
          </div>
          
          <div className="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <h3 className="text-lg font-medium text-gray-900 flex items-center justify-center">
              CO2 Saved
              <span 
                className="ml-2 cursor-help"
                data-tooltip-id="co2-tooltip"
                data-tooltip-content="Estimated CO2 emissions saved through renewable energy generation"
              >
                ⓘ
              </span>
            </h3>
            <p className="text-3xl font-bold text-purple-600 text-center">
              {summary?.total_co2_saved.toFixed(2)} kg
            </p>
            <p className="text-sm text-gray-500 mt-1 text-center">
              {getChangeIndicator(Number(calculateChange(summary?.total_co2_saved || 0, summary?.total_co2_saved || 0)))}
              {Math.abs(Number(calculateChange(summary?.total_co2_saved || 0, summary?.total_co2_saved || 0)))}% from previous period
            </p>
          </div>
        </div>
        
        {/* Energy Source Breakdown */}
        <div className="bg-white p-6 rounded-xl shadow-lg">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-medium text-gray-900">Realtime Energy Distribution</h3>
            <div className="flex space-x-2">
              <button
                className="px-4 py-2 rounded-lg bg-blue-500 text-white hover:bg-blue-600 transition-colors"
                onClick={() => setShowPercentages(!showPercentages)}
              >
                {showPercentages ? 'Show kWh' : 'Show %'}
              </button>
              <button
                className="px-4 py-2 rounded-lg bg-green-500 text-white hover:bg-green-600 transition-colors flex items-center"
                onClick={handleUpdate}
                disabled={isUpdating}
              >
                {isUpdating ? (
                  <>
                    <svg className="animate-spin -ml-1 mr-2 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Updating...
                  </>
                ) : (
                  <>
                    <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                    </svg>
                    Update
                  </>
                )}
              </button>
            </div>
          </div>
          {chartData && (
            <EnergyChart
              type="bar"
              data={chartData}
              title="Energy Distribution by Source"
              showPercentages={showPercentages}
              lastUpdated={lastUpdated}
            />
          )}
        </div>
      </div>
      
      <Tooltip id="consumption-tooltip" />
      <Tooltip id="renewable-tooltip" />
      <Tooltip id="grid-tooltip" />
      <Tooltip id="co2-tooltip" />
    </div>
  );
};

export default Overview; 