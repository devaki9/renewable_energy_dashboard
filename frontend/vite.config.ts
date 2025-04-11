import { defineConfig, loadEnv  } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '')
  const backendUrl = env.VITE_BACKEND_URL

  return {
    plugins: [react()],
    server: {
      proxy: {
        '/auth': {
          target: backendUrl,
          changeOrigin: true
        },
        '/dashboard': {
          target: backendUrl,
          changeOrigin: true
        }
      }
    }
  }
})
