import React, { createContext, useContext, useState, useEffect } from 'react';
import { useAuth } from './AuthContext';
import { useApp } from './AppContext';
import api from '../utils/api';
import axios from 'axios';

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
}

const EnergyContext = createContext<EnergyContextType | undefined>(undefined);

export const EnergyProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const { token } = useAuth();
  const { settings, setIsLoading, setError, isLoading, error } = useApp();
  const [realTimeData, setRealTimeData] = useState<EnergyData | null>(null);
  const [historicalData, setHistoricalData] = useState<EnergyData[]>([]);
  const [summary, setSummary] = useState<EnergySummary | null>(null);
  const [timeRange, setTimeRange] = useState<'hourly' | 'daily' | 'weekly' | 'monthly'>(settings.defaultTimeRange);

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
      const endDate = new Date();
      const startDate = new Date();
      
      switch (timeRange) {
        case 'hourly':
          startDate.setHours(startDate.getHours() - 1);
          break;
        case 'daily':
          startDate.setDate(startDate.getDate() - 1);
          break;
        case 'weekly':
          startDate.setDate(startDate.getDate() - 7);
          break;
        case 'monthly':
          startDate.setMonth(startDate.getMonth() - 1);
          break;
      }

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
      console.log('Fetching summary data with token:', token);
      const response = await api.get(`/energy/summary?period=${timeRange}`);
      console.log('Summary data received:', response.data);
      setSummary(response.data);
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
            renewable_percentage: 0
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

  useEffect(() => {
    if (token) {
      console.log('Token available, refreshing data');
      refreshData();
      const interval = setInterval(fetchRealTimeData, settings.refreshInterval);
      return () => clearInterval(interval);
    } else {
      console.log('No token available, skipping data refresh');
    }
  }, [timeRange, token, settings.refreshInterval]);

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
        refreshData
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