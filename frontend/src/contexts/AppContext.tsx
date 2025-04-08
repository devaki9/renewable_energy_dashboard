import React, { createContext, useContext, useState, useEffect } from 'react';

interface AppSettings {
  theme: 'light' | 'dark';
  refreshInterval: number;
  defaultTimeRange: 'hourly' | 'daily' | 'weekly' | 'monthly';
  chartColors: {
    consumption: string;
    solar: string;
    wind: string;
    battery: string;
    gridImport: string;
    gridExport: string;
    co2: string;
  };
}

interface AppContextType {
  settings: AppSettings;
  updateSettings: (newSettings: Partial<AppSettings>) => void;
  isLoading: boolean;
  setIsLoading: (loading: boolean) => void;
  error: string | null;
  setError: (error: string | null) => void;
}

const defaultSettings: AppSettings = {
  theme: 'light',
  refreshInterval: 30000, // 30 seconds
  defaultTimeRange: 'daily',
  chartColors: {
    consumption: 'rgb(75, 192, 192)',
    solar: 'rgb(255, 159, 64)',
    wind: 'rgb(54, 162, 235)',
    battery: 'rgb(153, 102, 255)',
    gridImport: 'rgb(255, 99, 132)',
    gridExport: 'rgb(75, 192, 192)',
    co2: 'rgb(153, 102, 255)',
  },
};

const AppContext = createContext<AppContextType | undefined>(undefined);

export const AppProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [settings, setSettings] = useState<AppSettings>(() => {
    const savedSettings = localStorage.getItem('appSettings');
    return savedSettings ? JSON.parse(savedSettings) : defaultSettings;
  });
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Save settings to localStorage when they change
  useEffect(() => {
    localStorage.setItem('appSettings', JSON.stringify(settings));
  }, [settings]);

  const updateSettings = (newSettings: Partial<AppSettings>) => {
    setSettings(prev => ({ ...prev, ...newSettings }));
  };

  return (
    <AppContext.Provider
      value={{
        settings,
        updateSettings,
        isLoading,
        setIsLoading,
        error,
        setError,
      }}
    >
      {children}
    </AppContext.Provider>
  );
};

export const useApp = () => {
  const context = useContext(AppContext);
  if (context === undefined) {
    throw new Error('useApp must be used within an AppProvider');
  }
  return context;
}; 