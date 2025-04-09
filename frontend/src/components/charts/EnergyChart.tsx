import React, { useRef, useEffect } from 'react';
import { Bar, Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  PointElement,
  Scale,
  CoreScaleOptions,
} from 'chart.js';
import zoomPlugin from 'chartjs-plugin-zoom';
import { format, parseISO } from 'date-fns';

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  PointElement,
  zoomPlugin
);

interface EnergyChartProps {
  type: 'bar' | 'line';
  data: any;
  title: string;
  height?: number;
  showPercentages?: boolean;
  lastUpdated?: Date;
  dualAxis?: boolean;
  stacked?: boolean;
  tooltipFormat?: 'simple' | 'detailed';
  onChartRef?: (ref: ChartJS | null) => void;
}

const EnergyChart: React.FC<EnergyChartProps> = ({ 
  type, 
  data, 
  height = 600,
  showPercentages = false,
  lastUpdated,
  dualAxis = false,
  onChartRef
}) => {
  const chartRefInternal = useRef<any>(null);

  useEffect(() => {
    if (onChartRef) {
      onChartRef(chartRefInternal.current);
    }
  }, [chartRefInternal, onChartRef]);

  // Tooltip Title Callback (Date + Day of Week)
  const formatTooltipTitle = (tooltipItems: any[]): string => {
    const item = tooltipItems[0];
    if (!item) return '';
    const timestamp = item.label;
    try {
      const date = parseISO(timestamp);
      // Format example: Monday, Jan 1, 2024
      return format(date, 'EEEE, MMM d, yyyy'); 
    } catch (e) {
      // if the label is not a parseable date string
      return timestamp;
    }
  };

  // Tooltip Label Callback (Value Only)
  const formatTooltipLabel = (context: any): string | undefined => { 
    const value = context.parsed.y;
    const datasetLabel = context.dataset.label;

    if (value === null || isNaN(value)) return undefined;

    const valueString = showPercentages ? `${value}%` : `${value.toFixed(2)} kWh`;
    return `${datasetLabel}: ${valueString}`;
  };

  const options: any = {
    responsive: true,
    maintainAspectRatio: false,
    layout: {
      padding: { top: 10, left: 0, right: 0, bottom: 0 }
    },
    plugins: {
      legend: {
        position: 'top' as const,
        align: 'start' as const,
        labels: {
          boxWidth: 15,
          padding: 15,
          font: {
            size: 12,
            weight: 'bold' as const,
          },
          usePointStyle: true,
          pointStyle: 'circle',
        },
      },
      tooltip: {
        backgroundColor: 'rgba(255, 255, 255, 0.9)',
        titleColor: '#111827',
        bodyColor: '#374151',
        borderColor: '#E5E7EB',
        borderWidth: 1,
        padding: 12,
        boxPadding: 6,
        usePointStyle: true,
        callbacks: {
          title: formatTooltipTitle,
          label: formatTooltipLabel,
        },
      },
      zoom: {
        zoom: {
          wheel: {
            enabled: true,
          },
          pinch: {
            enabled: true
          },
          mode: 'x' as const,
          drag: { 
            enabled: true
          }
        },
        pan: {
          enabled: true,
          mode: 'x' as const,
        }
      }
    },
    scales: dualAxis ? {
      x: {
        grid: {
          display: false,
        },
        ticks: {
          display: false,
        },
        title: {
          display: true,
          text: 'Time',
          font: {
             size: 12,
             weight: 'bold' as const,
           },
        }
      },
      y: {
        type: 'linear' as const,
        display: true,
        position: 'left' as const,
        grid: {
          color: 'rgba(0, 0, 0, 0.05)',
        },
        title: {
          display: true,
          text: showPercentages ? 'Percentage (%)' : 'Energy (kWh)',
          font: {
            size: 12,
            weight: 'bold' as const,
          },
        },
        ticks: {
          callback: function(this: Scale<CoreScaleOptions>, tickValue: string | number) {
            return showPercentages ? `${tickValue}%` : tickValue;
          },
          font: {
            size: 11
          }
        },
        min: showPercentages ? 0 : undefined,
        max: showPercentages ? 100 : undefined,
      },
      y1: {
        type: 'linear' as const,
        display: true,
        position: 'right' as const,
        grid: {
          drawOnChartArea: false,
        },
        title: {
          display: true,
          text: 'Net Surplus/Deficit (kWh)',
          font: {
            size: 12,
            weight: 'bold' as const,
          },
        },
        ticks: {
          font: {
            size: 11
          }
        }
      },
    } : {
      x: {
        grid: {
          display: false,
        },
        ticks: {
          display: false,
        },
        title: {
          display: true,
          text: 'Time',
          font: {
             size: 12,
             weight: 'bold' as const,
           },
        }
      },
      y: {
        beginAtZero: true,
        grid: {
          color: 'rgba(0, 0, 0, 0.05)',
        },
        title: {
          display: true,
          text: showPercentages ? 'Percentage (%)' : 'Energy (kWh)',
          font: {
            size: 12,
            weight: 'bold' as const,
          },
        },
        ticks: {
          callback: function(this: Scale<CoreScaleOptions>, tickValue: string | number) {
            return showPercentages ? `${tickValue}%` : tickValue;
          },
          font: {
            size: 11
          }
        },
        min: showPercentages ? 0 : undefined,
        max: showPercentages ? 100 : undefined,
      },
    },
  };

  const chartStyle = {
    height: `${height}px`,
    width: '100%'
  };

  return (
    <div style={chartStyle}>
      {/* Chart Canvas */}
      {type === 'bar' ? (
        <Bar ref={chartRefInternal} options={options} data={data} />
      ) : (
        <Line ref={chartRefInternal} options={options} data={data} />
      )}

      {/* Last Updated Text */}
      {lastUpdated && (
        <div className="text-right text-xs text-gray-500 mt-2">
          Last updated: {lastUpdated.toLocaleString()}
        </div>
      )}
    </div>
  );
};

export default EnergyChart; 