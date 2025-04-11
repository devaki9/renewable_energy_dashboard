import React, { createContext, useContext, useState, useEffect, useRef } from 'react';
import { useAuth } from './AuthContext';
import { useApp } from './AppContext';
import api from '../../api';
import axios from 'axios';
import { format, subMonths } from 'date-fns';

interface EnergyData {
  timestamp: string;
  consumption_kwh: number;
  solar_generation_kwh: number;
  wind_generation_kwh: number;
  battery_generation_kwh: number;
  grid_import_kwh: number;
  grid_export_kwh: number;
  temperature_c: number;
  humidity_percent: number;
  wind_speed_mps: number;
  co2_saved_kg: number;
}

interface EnergySummary {
  total_consumption: number;
  total_solar_generation: number;
  total_wind_generation: number;
  total_battery_generation: number;
  total_grid_import: number;
  total_grid_export: number;
  total_co2_saved: number;
  renewable_percentage: number;
  last_updated?: string;
}

interface EnergyContextType {
  realTimeData: EnergyData | null;
  historicalData: EnergyData[];
  summary: EnergySummary | null;
  loading: boolean;
  error: string | null;
  timeRange: 'hourly' | 'daily' | 'weekly' | 'monthly';
  setTimeRange: (range: 'hourly' | 'daily' | 'weekly' | 'monthly') => void;
  refreshData: () => Promise<void>;
  dateRange: {
    start: string;
    end: string;
  };
  setDateRange: (range: { start: string; end: string }) => void;
  checkForUpdates: () => Promise<boolean>;
}

const EnergyContext = createContext<EnergyContextType | undefined>(undefined);

export const EnergyProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const { token } = useAuth();
  const { settings, setIsLoading, setError, isLoading, error } = useApp();
  const [realTimeData, setRealTimeData] = useState<EnergyData | null>(null);
  const [historicalData, setHistoricalData] = useState<EnergyData[]>([]);
  const [summary, setSummary] = useState<EnergySummary | null>(null);
  const [timeRange, setTimeRange] = useState<'hourly' | 'daily' | 'weekly' | 'monthly'>(settings.defaultTimeRange);
  const [dateRange, setDateRange] = useState({
    start: format(subMonths(new Date(), 3), 'yyyy-MM-dd'),
    end: format(new Date(), 'yyyy-MM-dd')
  });
  
  // Keep track of the last data timestamp to check for updates
  const lastDataTimestampRef = useRef<string | null>(null);

  // Add token to requests whenever it changes
  useEffect(() => {
    if (token) {
      // Set the token in axios defaults
      api.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      console.log('Token set in EnergyContext:', token);
      console.log('Authorization header set:', api.defaults.headers.common['Authorization']);
      
      // Test the token by making a simple request to the profile endpoint
      api.get('/auth/profile')
        .then(response => {
          console.log('Token verification successful:', response.data);
        })
        .catch(error => {
          console.error('Token verification failed:', error);
          if (error.response) {
            console.error('Error response:', error.response.status, error.response.data);
          }
        });
    } else {
      delete api.defaults.headers.common['Authorization'];
      console.log('Token removed from EnergyContext');
    }
  }, [token]);

  const fetchRealTimeData = async () => {
    if (!token) {
      console.log('No token available for real-time data fetch');
      return;
    }
    
    try {
      console.log('Fetching real-time data with token:', token);
      const response = await api.get('/energy/realtime');
      console.log('Real-time data received:', response.data);
      setRealTimeData(response.data);
      
      // Store the timestamp for update checking
      if (response.data && response.data.timestamp) {
        lastDataTimestampRef.current = response.data.timestamp;
      }
    } catch (err) {
      console.error('Error fetching real-time data:', err);
      if (axios.isAxiosError(err)) {
        if (err.response?.status === 404) {
          // If no data is found, set default values
          console.log('No real-time data found, setting default values');
          const defaultData = {
            timestamp: new Date().toISOString(),
            consumption_kwh: 0,
            solar_generation_kwh: 0,
            wind_generation_kwh: 0,
            battery_generation_kwh: 0,
            grid_import_kwh: 0,
            grid_export_kwh: 0,
            temperature_c: 0,
            humidity_percent: 0,
            wind_speed_mps: 0,
            co2_saved_kg: 0
          };
          setRealTimeData(defaultData);
          lastDataTimestampRef.current = defaultData.timestamp;
        } else {
          console.error('Error details:', err.response?.data);
          setError('Failed to load real-time data');
        }
      } else {
        console.error('Unknown error:', err);
        setError('Failed to load real-time data');
      }
    }
  };

  const fetchHistoricalData = async () => {
    if (!token) {
      console.log('No token available for historical data fetch');
      return;
    }
    
    try {
      const endDate = new Date(dateRange.end);
      const startDate = new Date(dateRange.start);
      
      console.log('Fetching historical data with token:', token);
      const response = await api.get('/energy/history', {
        params: {
          start_date: startDate.toISOString(),
          end_date: endDate.toISOString()
        }
      });
      console.log('Historical data received:', response.data);
      setHistoricalData(response.data);
    } catch (err) {
      console.error('Error fetching historical data:', err);
      if (axios.isAxiosError(err)) {
        if (err.response?.status === 404) {
          // If no data is found, set empty array
          console.log('No historical data found, setting empty array');
          setHistoricalData([]);
        } else {
          console.error('Error details:', err.response?.data);
          setError('Failed to load historical data');
        }
      } else {
        console.error('Unknown error:', err);
        setError('Failed to load historical data');
      }
    }
  };

  const fetchSummary = async () => {
    if (!token) {
      console.log('No token available for summary data fetch');
      return;
    }
    
    try {
      const endDate = new Date(dateRange.end);
      const startDate = new Date(dateRange.start);
      
      console.log('Fetching summary data with token:', token);
      const response = await api.get('/energy/summary', {
        params: {
          start_date: startDate.toISOString(),
          end_date: endDate.toISOString()
        }
      });
      console.log('Summary data received:', response.data);
      
      // Add last updated timestamp to summary
      const summaryWithTimestamp = {
        ...response.data,
        last_updated: new Date().toISOString()
      };
      
      setSummary(summaryWithTimestamp);
    } catch (err) {
      console.error('Error fetching summary data:', err);
      if (axios.isAxiosError(err)) {
        if (err.response?.status === 404) {
          // If no data is found, set default values
          console.log('No summary data found, setting default values');
          const defaultSummary = {
            total_consumption: 0,
            total_solar_generation: 0,
            total_wind_generation: 0,
            total_battery_generation: 0,
            total_grid_import: 0,
            total_grid_export: 0,
            total_co2_saved: 0,
            renewable_percentage: 0,
            last_updated: new Date().toISOString()
          };
          setSummary(defaultSummary);
        } else {
          console.error('Error details:', err.response?.data);
          setError('Failed to load summary data');
        }
      } else {
        console.error('Unknown error:', err);
        setError('Failed to load summary data');
      }
    }
  };

  // Check if there are updates available
  const checkForUpdates = async (): Promise<boolean> => {
    if (!token) {
      console.log('No token available for update check');
      return false;
    }
    
    try {
      // Get the latest data timestamp from the server
      const response = await api.get('/energy/latest-timestamp');
      const latestTimestamp = response.data.timestamp;
      
      // If we don't have a stored timestamp or the server timestamp is newer
      if (!lastDataTimestampRef.current || 
          new Date(latestTimestamp) > new Date(lastDataTimestampRef.current)) {
        console.log('New data available, refreshing...');
        return true;
      }
      
      console.log('No new data available');
      return false;
    } catch (err) {
      console.error('Error checking for updates:', err);
      return false;
    }
  };

  const refreshData = async () => {
    if (!token) {
      console.log('No token available for data refresh');
      return;
    }
    
    setIsLoading(true);
    setError(null);
    try {
      await Promise.all([
        fetchRealTimeData(),
        fetchHistoricalData(),
        fetchSummary()
      ]);
    } catch (err) {
      console.error('Error refreshing data:', err);
      setError('Failed to refresh data');
    } finally {
      setIsLoading(false);
    }
  };

  // Set up polling for updates
  useEffect(() => {
    if (token) {
      console.log('Token available, refreshing data');
      refreshData();
      
      // Set up intervals for different update types
      const realTimeInterval = setInterval(fetchRealTimeData, settings.refreshInterval);
      const updateCheckInterval = setInterval(async () => {
        const hasUpdates = await checkForUpdates();
        if (hasUpdates) {
          refreshData();
        }
      }, settings.refreshInterval * 2); // Check for updates less frequently
      
      return () => {
        clearInterval(realTimeInterval);
        clearInterval(updateCheckInterval);
      };
    } else {
      console.log('No token available, skipping data refresh');
    }
  }, [timeRange, dateRange, token, settings.refreshInterval]);

  return (
    <EnergyContext.Provider
      value={{
        realTimeData,
        historicalData,
        summary,
        loading: isLoading,
        error: error,
        timeRange,
        setTimeRange,
        refreshData,
        dateRange,
        setDateRange,
        checkForUpdates
      }}
    >
      {children}
    </EnergyContext.Provider>
  );
};

export const useEnergy = () => {
  const context = useContext(EnergyContext);
  if (context === undefined) {
    throw new Error('useEnergy must be used within an EnergyProvider');
  }
  return context;
}; 