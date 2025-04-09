import { createContext, useContext, useState, ReactNode, useEffect } from 'react';
import axios from 'axios';
import api from '../utils/api';

interface User {
  id: number;
  email: string;
  username: string;
  is_active: boolean;
}

interface AuthContextType {
  user: User | null;
  token: string | null;
  login: (username: string, password: string) => Promise<void>;
  register: (email: string, username: string, password: string) => Promise<void>;
  logout: () => Promise<void>;
  isAuthenticated: boolean;
  loading: boolean;
  refreshToken: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | null>(null);

// Configure axios defaults
axios.defaults.withCredentials = true;

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [token, setToken] = useState<string | null>(null);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [loading, setLoading] = useState(true);
  const [tokenExpiryTime, setTokenExpiryTime] = useState<number | null>(null);

  // Check authentication status on mount
  useEffect(() => {
    const checkAuth = async () => {
      try {
        // Check if token exists in localStorage
        const storedToken = localStorage.getItem('token');
        const storedExpiryTime = localStorage.getItem('tokenExpiryTime');
        console.log('Stored token on mount:', storedToken);
        
        if (storedToken && storedExpiryTime) {
          const expiryTime = parseInt(storedExpiryTime, 10);
          const now = Date.now();
          
          // Check if token is expired
          if (now >= expiryTime) {
            console.log('Token expired, attempting to refresh');
            await refreshToken();
          } else {
            // Set the token in axios defaults
            api.defaults.headers.common['Authorization'] = `Bearer ${storedToken}`;
            console.log('Authorization header set in AuthContext:', api.defaults.headers.common['Authorization']);
            
            // Try to get user profile
            console.log('Fetching user profile with token:', storedToken);
            const response = await api.get('/auth/profile');
            setUser(response.data);
            setToken(storedToken);
            setTokenExpiryTime(expiryTime);
            setIsAuthenticated(true);
            console.log('User authenticated:', response.data);
          }
        } else {
          console.log('No stored token found');
        }
      } catch (error) {
        // Silently handle 401 errors during initial check
        if (axios.isAxiosError(error) && error.response?.status !== 401) {
          console.error('Auth check error:', error);
        }
        console.log('Auth check failed, clearing token');
        setUser(null);
        setToken(null);
        setTokenExpiryTime(null);
        setIsAuthenticated(false);
        localStorage.removeItem('token');
        localStorage.removeItem('tokenExpiryTime');
      } finally {
        setLoading(false);
      }
    };

    checkAuth();
  }, []);

  // Set up a timer to check token expiration
  useEffect(() => {
    if (tokenExpiryTime) {
      const now = Date.now();
      const timeUntilExpiry = tokenExpiryTime - now;
      
      if (timeUntilExpiry > 0) {
        // Set a timer to refresh the token 5 minutes before it expires
        const refreshTime = Math.max(0, timeUntilExpiry - 5 * 60 * 1000);
        const timer = setTimeout(() => {
          refreshToken();
        }, refreshTime);
        
        return () => clearTimeout(timer);
      }
    }
  }, [tokenExpiryTime]);

  const refreshToken = async () => {
    try {
      console.log('Refreshing token');
      const response = await api.post('/auth/refresh');
      const { access_token } = response.data;
      
      // Calculate new expiry time (30 minutes from now)
      const expiryTime = Date.now() + 30 * 60 * 1000;
      
      // Store token and expiry time
      localStorage.setItem('token', access_token);
      localStorage.setItem('tokenExpiryTime', expiryTime.toString());
      
      // Update state
      setToken(access_token);
      setTokenExpiryTime(expiryTime);
      
      // Update axios headers
      api.defaults.headers.common['Authorization'] = `Bearer ${access_token}`;
      
      console.log('Token refreshed successfully');
    } catch (error) {
      console.error('Token refresh failed:', error);
      // If refresh fails, log out the user
      await logout();
    }
  };

  const login = async (username: string, password: string) => {
    try {
      // Create form data with the correct field names
      const formData = new FormData();
      formData.append('username', username);
      formData.append('password', password);
      // Add grant_type field which is required by OAuth2
      formData.append('grant_type', 'password');

      console.log('Attempting login for user:', username);
      const response = await api.post('/auth/login', formData, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      });
      const { access_token } = response.data;
      console.log('Login successful, token received:', access_token);
      
      // Calculate expiry time (30 minutes from now)
      const expiryTime = Date.now() + 30 * 60 * 1000;
      
      // Store token and expiry time in localStorage
      localStorage.setItem('token', access_token);
      localStorage.setItem('tokenExpiryTime', expiryTime.toString());
      console.log('Token stored in localStorage');
      
      // Set the token in axios defaults
      api.defaults.headers.common['Authorization'] = `Bearer ${access_token}`;
      console.log('Authorization header set in AuthContext:', api.defaults.headers.common['Authorization']);
      
      setToken(access_token);
      setTokenExpiryTime(expiryTime);
      setIsAuthenticated(true);
      
      // Get user info
      console.log('Fetching user profile after login');
      const userResponse = await api.get('/auth/profile');
      setUser(userResponse.data);
      console.log('User profile fetched:', userResponse.data);
    } catch (error) {
      console.error('Login error:', error);
      if (axios.isAxiosError(error)) {
        console.error('Error details:', error.response?.data);
      }
      throw error;
    }
  };

  const register = async (email: string, username: string, password: string) => {
    try {
      console.log('Attempting registration for user:', username);
      await api.post('/auth/register', {
        email,
        username,
        password
      });
      console.log('Registration successful');
    } catch (error) {
      console.error('Registration error:', error);
      throw error;
    }
  };

  const logout = async () => {
    try {
      console.log('Attempting logout');
      await api.post('/auth/logout');
      setUser(null);
      setToken(null);
      setTokenExpiryTime(null);
      setIsAuthenticated(false);
      localStorage.removeItem('token');
      localStorage.removeItem('tokenExpiryTime');
      delete api.defaults.headers.common['Authorization'];
      console.log('Logout successful');
    } catch (error) {
      console.error('Logout error:', error);
      throw error;
    }
  };

  return (
    <AuthContext.Provider value={{ 
      user, 
      token, 
      login, 
      register, 
      logout,
      isAuthenticated,
      loading,
      refreshToken
    }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
