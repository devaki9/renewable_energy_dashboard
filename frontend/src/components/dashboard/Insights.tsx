import React, { useEffect, useState, useRef } from 'react';
import { useEnergy } from '../../contexts/EnergyContext';
import EnergyChart from '../charts/EnergyChart';
import { ChartData, Chart as ChartJS } from 'chart.js';
import {
  format, subYears, parseISO, isWithinInterval, subDays, subHours,
  startOfDay,
} from 'date-fns';

const Insights: React.FC = () => {
  const { historicalData, loading, error } = useEnergy();
  const [consumptionVsGenerationData, setConsumptionVsGenerationData] = useState<ChartData<'line'> | null>(null);
  const [sourceContributionData, setSourceContributionData] = useState<ChartData<'line'> | null>(null);
  const [co2SavedData, setCo2SavedData] = useState<ChartData<'line'> | null>(null);
  //const [showPercentages, setShowPercentages] = useState<boolean>(false);
  const [showSurplusDeficit, setShowSurplusDeficit] = useState<boolean>(true);

  // Default date range: Last 1 year (approximating "all time")
  const defaultStartDate = format(subYears(new Date(), 1), 'yyyy-MM-dd');
  const defaultEndDate = format(new Date(), 'yyyy-MM-dd');

  // Local date range state for each chart
  const [chart1DateRange, setChart1DateRange] = useState({ start: defaultStartDate, end: defaultEndDate });
  const [chart2DateRange, setChart2DateRange] = useState({ start: defaultStartDate, end: defaultEndDate });
  const [chart3DateRange, setChart3DateRange] = useState({ start: defaultStartDate, end: defaultEndDate });

  // State for date range errors
  const [chart1DateError, setChart1DateError] = useState<string | null>(null);
  const [chart2DateError, setChart2DateError] = useState<string | null>(null);
  const [chart3DateError, setChart3DateError] = useState<string | null>(null);

  // Refs for each chart instance
  const chart1Ref = useRef<ChartJS | null>(null);
  const chart2Ref = useRef<ChartJS | null>(null);
  const chart3Ref = useRef<ChartJS | null>(null);

  // Process data for Consumption vs Generation chart
  useEffect(() => {
    // Filter data based on chart1DateRange
    const startDate = parseISO(chart1DateRange.start);
    const endDate = parseISO(chart1DateRange.end);
    // Ensure end date includes the whole day
    endDate.setHours(23, 59, 59, 999);

    const filteredData = historicalData.filter(data => {
      const timestamp = parseISO(data.timestamp);
      return isWithinInterval(timestamp, { start: startDate, end: endDate });
    });

    if (filteredData.length > 0) {
      const labels = filteredData.map(data => 
        new Date(data.timestamp).toLocaleString()
      );
      const totalGeneration = filteredData.map(data => 
        data.solar_generation_kwh + data.wind_generation_kwh + data.battery_generation_kwh
      );
      const netSurplusDeficit = filteredData.map((data, index) => 
        totalGeneration[index] - data.consumption_kwh
      );

      const datasets = [
        {
          label: 'Consumption',
          data: filteredData.map(data => data.consumption_kwh),
          borderColor: 'rgb(255, 99, 132)',
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          yAxisID: 'y',
          fill: false,
        },
        {
          label: 'Total Generation',
          data: totalGeneration,
          borderColor: 'rgb(75, 192, 192)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          yAxisID: 'y',
          fill: false,
        },
      ];

      if (showSurplusDeficit) {
        datasets.push({
          label: 'Net Surplus/Deficit',
          data: netSurplusDeficit,
          borderColor: 'rgb(153, 102, 255)',
          backgroundColor: 'rgba(153, 102, 255, 0.2)',
          yAxisID: 'y1',
          fill: true, // Keep fill true when shown
          // hidden: false is default, no need to set explicitly
        });
      }

      setConsumptionVsGenerationData({
        labels,
        datasets: datasets,
      });
    } else {
       setConsumptionVsGenerationData(null); // Clear chart if no data in range
    }
  }, [historicalData, showSurplusDeficit, chart1DateRange]); // Add chart1DateRange dependency

  // Process data for Source Contribution chart (Daily Average Lines)
  useEffect(() => {
    const startDate = parseISO(chart2DateRange.start);
    const endDate = parseISO(chart2DateRange.end);
    endDate.setHours(23, 59, 59, 999);

    const filteredData = historicalData.filter(data => {
      const timestamp = parseISO(data.timestamp);
      return isWithinInterval(timestamp, { start: startDate, end: endDate });
    });

    if (filteredData.length > 0) {
      // Group data by day and calculate sums and counts for each source
      const dailySourceStats: { 
        [day: string]: { 
          solarSum: number; windSum: number; batterySum: number; gridSum: number; count: number 
        }
      } = {};

      filteredData.forEach(data => {
        const dayKey = format(startOfDay(parseISO(data.timestamp)), 'yyyy-MM-dd');
        if (!dailySourceStats[dayKey]) {
          dailySourceStats[dayKey] = { solarSum: 0, windSum: 0, batterySum: 0, gridSum: 0, count: 0 };
        }
        dailySourceStats[dayKey].solarSum += data.solar_generation_kwh || 0;
        dailySourceStats[dayKey].windSum += data.wind_generation_kwh || 0;
        dailySourceStats[dayKey].batterySum += data.battery_generation_kwh || 0;
        dailySourceStats[dayKey].gridSum += data.grid_import_kwh || 0;
        dailySourceStats[dayKey].count += 1;
      });

      const sortedDays = Object.keys(dailySourceStats).sort();
      if (sortedDays.length === 0) {
          setSourceContributionData(null);
          return;
      }

      // Calculate daily averages for each source
      const solarAvgData = sortedDays.map(day => dailySourceStats[day].count > 0 ? dailySourceStats[day].solarSum / dailySourceStats[day].count : 0);
      const windAvgData = sortedDays.map(day => dailySourceStats[day].count > 0 ? dailySourceStats[day].windSum / dailySourceStats[day].count : 0);
      const batteryAvgData = sortedDays.map(day => dailySourceStats[day].count > 0 ? dailySourceStats[day].batterySum / dailySourceStats[day].count : 0);
      const gridAvgData = sortedDays.map(day => dailySourceStats[day].count > 0 ? dailySourceStats[day].gridSum / dailySourceStats[day].count : 0);

      setSourceContributionData({
        labels: sortedDays, // Use days as labels
        datasets: [
          { label: 'Avg Solar (kWh)', data: solarAvgData, borderColor: 'rgb(255, 159, 64)', backgroundColor: 'rgba(255, 159, 64, 0.2)', fill: false, tension: 0.1 },
          { label: 'Avg Wind (kWh)', data: windAvgData, borderColor: 'rgb(54, 162, 235)', backgroundColor: 'rgba(54, 162, 235, 0.2)', fill: false, tension: 0.1 },
          { label: 'Avg Battery (kWh)', data: batteryAvgData, borderColor: 'rgb(153, 102, 255)', backgroundColor: 'rgba(153, 102, 255, 0.2)', fill: false, tension: 0.1 },
          { label: 'Avg Grid Import (kWh)', data: gridAvgData, borderColor: 'rgb(255, 99, 132)', backgroundColor: 'rgba(255, 99, 132, 0.2)', fill: false, tension: 0.1 },
        ],
      });
    } else {
      setSourceContributionData(null);
    }
  }, [historicalData, chart2DateRange]); 

  // Process data for CO2 Saved chart (Daily Average Line)
  useEffect(() => {
    const startDate = parseISO(chart3DateRange.start);
    const endDate = parseISO(chart3DateRange.end);
    endDate.setHours(23, 59, 59, 999);

    const filteredData = historicalData.filter(data => {
      const timestamp = parseISO(data.timestamp);
      return isWithinInterval(timestamp, { start: startDate, end: endDate });
    });

    if (filteredData.length > 0) {
       // Group data by day and calculate sum and count for CO2
      const dailyCo2Stats: { [day: string]: { co2Sum: number; count: number } } = {};

      filteredData.forEach(data => {
        const dayKey = format(startOfDay(parseISO(data.timestamp)), 'yyyy-MM-dd');
        if (!dailyCo2Stats[dayKey]) {
          dailyCo2Stats[dayKey] = { co2Sum: 0, count: 0 };
        }
        dailyCo2Stats[dayKey].co2Sum += data.co2_saved_kg || 0;
        dailyCo2Stats[dayKey].count += 1;
      });

      const sortedDays = Object.keys(dailyCo2Stats).sort();
       if (sortedDays.length === 0) {
          setCo2SavedData(null);
          return;
      }
      
      // Calculate daily averages for CO2
      const co2AvgData = sortedDays.map(day => dailyCo2Stats[day].count > 0 ? dailyCo2Stats[day].co2Sum / dailyCo2Stats[day].count : 0);

      setCo2SavedData({
        labels: sortedDays, // Use days as labels
        datasets: [
          {
            label: 'Avg. Daily CO₂ Saved (kg)', // Updated label
            data: co2AvgData,
            borderColor: 'rgb(107, 114, 128)',
            backgroundColor: 'rgba(107, 114, 128, 0.2)',
            fill: true,
            tension: 0.1
          },
        ],
      });
    } else {
      setCo2SavedData(null);
    }
  }, [historicalData, chart3DateRange]);

  // Generic date validation function
  const validateDateRange = (start: string, end: string): string | null => {
    const startDate = new Date(start);
    const endDate = new Date(end);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (isNaN(startDate.getTime()) || isNaN(endDate.getTime())) {
      return "Invalid date format.";
    }
    if (startDate > today) {
      return "Start date cannot be in the future.";
    }
    // Allow end date to be today
    // if (endDate > today) {
    //   return "End date cannot be in the future.";
    // }
    if (endDate < startDate) {
      return "End date cannot be earlier than start date.";
    }
    return null; // No error
  };

  // Specific date change handlers for each chart
  const handleChart1DateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    const newRange = { ...chart1DateRange, [name]: value };
    const errorMsg = validateDateRange(newRange.start, newRange.end);
    setChart1DateError(errorMsg);
    if (!errorMsg) {
      setChart1DateRange(newRange);
    }
  };

  const handleChart2DateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    const newRange = { ...chart2DateRange, [name]: value };
    const errorMsg = validateDateRange(newRange.start, newRange.end);
    setChart2DateError(errorMsg);
    if (!errorMsg) {
      setChart2DateRange(newRange);
    }
  };

  const handleChart3DateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    const newRange = { ...chart3DateRange, [name]: value };
    const errorMsg = validateDateRange(newRange.start, newRange.end);
    setChart3DateError(errorMsg);
    if (!errorMsg) {
      setChart3DateRange(newRange);
    }
  };

  // Handler for shortcut buttons
  const handleShortcut = (
    setter: React.Dispatch<React.SetStateAction<{ start: string; end: string }>>,
    errorSetter: React.Dispatch<React.SetStateAction<string | null>>,
    duration: '24h' | '7d' | '30d'
  ) => {
    const endDate = new Date();
    let startDate = new Date();

    switch (duration) {
      case '24h':
        startDate = subHours(endDate, 24);
        break;
      case '7d':
        startDate = subDays(endDate, 7);
        break;
      case '30d':
        startDate = subDays(endDate, 30);
        break;
    }

    // Ensure start date is not before the beginning of the historical data if needed
    // Example: if (startDate < earliestHistoricalDate) startDate = earliestHistoricalDate;

    const newRange = {
      start: format(startDate, 'yyyy-MM-dd'),
      end: format(endDate, 'yyyy-MM-dd'),
    };

    setter(newRange);
    errorSetter(null); // Clear any previous validation errors
  };

  // Zoom Handlers (now specific to each chart)
  const handleZoomIn = (chartInstanceRef: React.RefObject<ChartJS | null>) => {
    chartInstanceRef.current?.zoom(1.1);
  };
  const handleZoomOut = (chartInstanceRef: React.RefObject<ChartJS | null>) => {
    chartInstanceRef.current?.zoom(0.9);
  };
  const handleResetZoom = (chartInstanceRef: React.RefObject<ChartJS | null>) => {
    chartInstanceRef.current?.resetZoom();
  };

  if (loading) {
    return <div className="text-center py-8">Loading insights data...</div>;
  }

  if (error) {
    return <div className="text-center py-8 text-red-600">{error}</div>;
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-green-50">
      <div className="max-w-7xl mx-auto p-6 space-y-6">
          <div className="flex justify-between items-center">
            <h2 className="text-3xl font-bold text-gray-900 text-center flex-grow">Your Energy Story</h2>
          </div>

          <div className="space-y-6 mt-6">
          {/* Consumption vs Generation Chart */}
          <div className="bg-white rounded-lg shadow-lg overflow-hidden">
            <div className="p-4">
              <div className="flex justify-between items-center mb-4">
                <h3 className="text-xl font-semibold text-gray-800 text-center">Consumption vs Generation Over Time</h3>
                <div className="flex justify-self-auto mt-8">
                  <label className="flex items-end space-x-2 text-sm text-gray-600">
                    <input
                      type="checkbox"
                      checked={showSurplusDeficit}
                      onChange={() => setShowSurplusDeficit(!showSurplusDeficit)}
                      className="form-checkbox h-4 w-4 text-blue-600 rounded"
                    />
                    <span>Show Net Surplus/Deficit</span>
                  </label>
                </div>
                <p className="text-sm text-gray-800 mt-1 text-right">
                  <strong>Insight:</strong> Was I generating enough to cover my consumption each day/hour?
                </p>
              </div>
              <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4 mb-4">
                <div className="grid grid-cols-2 gap-4 flex-grow">
                  <div>
                    <label className="block text-sm font-medium text-gray-700">Start Date</label>
                    <input
                      type="date"
                      name="start"
                      value={chart1DateRange.start}
                      onChange={handleChart1DateChange}
                      className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700">End Date</label>
                    <input
                      type="date"
                      name="end"
                      value={chart1DateRange.end}
                      onChange={handleChart1DateChange}
                      className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                    />
                  </div>
                </div>
                <div className="flex space-x-2 flex-shrink-0 mt-2 sm:mt-0 self-end">
                  <button onClick={() => handleShortcut(setChart1DateRange, setChart1DateError, '24h')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">24h</button>
                  <button onClick={() => handleShortcut(setChart1DateRange, setChart1DateError, '7d')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">7d</button>
                  <button onClick={() => handleShortcut(setChart1DateRange, setChart1DateError, '30d')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">30d</button>
                </div>
              </div>
              {chart1DateError && <p className="text-red-500 text-sm mb-4">{chart1DateError}</p>}
              {/* Wrapper for Chart + Buttons */}
              <div className="relative">
                {/* Chart 1 Display */}
                {consumptionVsGenerationData && (
                  <div className="h-[600px] w-full">
                    <EnergyChart
                      type="line"
                      data={consumptionVsGenerationData}
                      title="Consumption vs Generation"
                      height={600}
                      dualAxis={true}
                      tooltipFormat="detailed"
                      onChartRef={(ref) => chart1Ref.current = ref}
                    />
                  </div>
                )}
                {/* Chart 1 Buttons */}
                <div className="absolute top-8 right-2 z-10 flex space-x-2">
                  <button onClick={() => handleZoomIn(chart1Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Zoom In">+</button>
                  <button onClick={() => handleZoomOut(chart1Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Zoom Out">-</button>
                  <button onClick={() => handleResetZoom(chart1Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Reset Zoom">↺</button>
                </div>
              </div>
            </div>
          </div>

          {/* Source Contribution Chart */}
          <div className="bg-white rounded-lg shadow-lg overflow-hidden">
            <div className="p-4">
              <div className="flex justify-between items-center mb-4">
                <h3 className="text-xl font-semibold text-gray-900 text-center">
                  Average Daily Source Contribution
                </h3>
                <br />
                <p className="text-sm text-gray-600 mt-4 text-center">
                  <strong>Insight:</strong> Average daily energy (kWh) from each source.
                </p>
              </div>
              <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4 mb-4">
                <div className="grid grid-cols-2 gap-4 flex-grow">
                  <div>
                    <label className="block text-sm font-medium text-gray-700">Period from</label>
                    <input
                      type="date"
                      name="start"
                      value={chart2DateRange.start}
                      onChange={handleChart2DateChange}
                      className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700">To</label>
                    <input
                      type="date"
                      name="end"
                      value={chart2DateRange.end}
                      onChange={handleChart2DateChange}
                      className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                    />
                  </div>
                </div>
                <div className="flex space-x-2 flex-shrink-0 mt-2 sm:mt-0 self-end">
                  <button onClick={() => handleShortcut(setChart2DateRange, setChart2DateError, '7d')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">7d</button>
                  <button onClick={() => handleShortcut(setChart2DateRange, setChart2DateError, '30d')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">30d</button>
                </div>
              </div>
              {chart2DateError && <p className="text-red-500 text-sm mb-4">{chart2DateError}</p>}
              {/* Wrapper for Chart + Buttons */}
              <div className="relative">
                {/* Chart 2 Display */}
                {sourceContributionData && (
                  <div className="h-[600px] w-full">
                    <EnergyChart
                      type="line"
                      data={sourceContributionData}
                      title="Average Daily Source Contribution"
                      height={600}
                      onChartRef={(ref) => chart2Ref.current = ref}
                    />
                  </div>
                )}
                {/* Chart 2 Buttons */}
                <div className="absolute top-8 right-2 z-10 flex space-x-2">
                  <button onClick={() => handleZoomIn(chart2Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Zoom In">+</button>
                  <button onClick={() => handleZoomOut(chart2Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Zoom Out">-</button>
                  <button onClick={() => handleResetZoom(chart2Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Reset Zoom">↺</button>
                </div>
              </div>
            </div>
          </div>

          {/* CO₂ emissions saved Chart*/}
          <div className="bg-white rounded-lg shadow-lg overflow-hidden">
            <div className="p-4">
              <div className="flex justify-between items-center mb-4">
                <h3 className="text-xl font-semibold text-gray-900 text-center">Average Daily CO₂ Saved</h3>
                <br />
                <p className="text-sm text-gray-600 mt-2 text-center">
                  <strong>Insight:</strong> Average daily estimated CO₂ emissions saved.
                </p>
              </div>
              <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4 mb-4">
                <div className="grid grid-cols-2 gap-4 flex-grow">
                  <div>
                    <label className="block text-sm font-medium text-gray-700">Period from</label>
                    <input
                      type="date"
                      name="start"
                      value={chart3DateRange.start}
                      onChange={handleChart3DateChange}
                      className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700">To</label>
                    <input
                      type="date"
                      name="end"
                      value={chart3DateRange.end}
                      onChange={handleChart3DateChange}
                      className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                    />
                  </div>
                </div>
                <div className="flex space-x-2 flex-shrink-0 mt-2 sm:mt-0 self-end">
                  <button onClick={() => handleShortcut(setChart3DateRange, setChart3DateError, '7d')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">7d</button>
                  <button onClick={() => handleShortcut(setChart3DateRange, setChart3DateError, '30d')} className="px-3 py-1 text-xs rounded bg-gray-200 hover:bg-gray-300">30d</button>
                </div>
              </div>
              {chart3DateError && <p className="text-red-500 text-sm mb-4">{chart3DateError}</p>}
              {/* Wrapper for Chart + Buttons */}
              <div className="relative">
                {/* Chart 3 Display */}
                {co2SavedData && (
                  <div className="h-[600px] w-full">
                    <EnergyChart
                      type="line"
                      data={co2SavedData}
                      title="Average Daily CO₂ Saved (kg)"
                      height={600}
                      onChartRef={(ref) => chart3Ref.current = ref}
                    />
                  </div>
                )}
                {/* Chart 3 Buttons*/}
                <div className="absolute top-8 right-2 z-10 flex space-x-2">
                  <button onClick={() => handleZoomIn(chart3Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Zoom In">+</button>
                  <button onClick={() => handleZoomOut(chart3Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Zoom Out">-</button>
                  <button onClick={() => handleResetZoom(chart3Ref)} className="bg-gray-200 hover:bg-gray-300 text-gray-700 font-bold w-6 h-6 rounded-sm text-xs flex items-center justify-center" aria-label="Reset Zoom">↺</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Insights;