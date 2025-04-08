import React from 'react';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  Tooltip,
  Legend,
  ChartData,
  ChartOptions
} from 'chart.js';
import { Line, Bar } from 'react-chartjs-2';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  Tooltip,
  Legend
);

type ChartType = 'line' | 'bar';

interface EnergyChartProps {
  type: ChartType;
  data: ChartData<ChartType>;
  title: string;
  height?: number;
}

const defaultOptions: ChartOptions<ChartType> = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'top' as const,
    },
    title: {
      display: true,
      text: '',
    },
  },
  scales: {
    y: {
      beginAtZero: true,
      title: {
        display: true,
        text: 'Energy (kWh)'
      }
    },
    x: {
      title: {
        display: true,
        text: 'Time'
      }
    }
  }
};

const EnergyChart: React.FC<EnergyChartProps> = ({ type, data, title, height = 400 }) => {
  const options = {
    ...defaultOptions,
    plugins: {
      ...defaultOptions.plugins,
      title: {
        ...defaultOptions.plugins?.title,
        text: title
      }
    }
  };

  return (
    <div style={{ height }}>
      {type === 'line' ? (
        <Line data={data as ChartData<'line'>} options={options as ChartOptions<'line'>} />
      ) : (
        <Bar data={data as ChartData<'bar'>} options={options as ChartOptions<'bar'>} />
      )}
    </div>
  );
};

export default EnergyChart; 