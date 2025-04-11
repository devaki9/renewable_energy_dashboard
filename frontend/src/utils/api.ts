import axios from 'axios';

// Get the API URL from environment variables or use a default
//const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:8000';

// Create a shared axios instance
const api = axios.create({
  //baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
  withCredentials: true, // Important for cookies
});

// Add a request interceptor to add the token to all requests
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export default api; 