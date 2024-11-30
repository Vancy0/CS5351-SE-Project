<template>
    <div ref="chartContainer" class="burndown-chart" style="height: 400px;"></div>
  </template>
  
  <script>
  import * as echarts from 'echarts';
  
  export default {
    props: {
      data: {
        type: Object,
        required: true
      }
    },
    watch: {
      data: {
        handler(newData) {
          this.updateChart(newData);
        },
        deep: true
      }
    },
    mounted() {
      this.initChart();
    },
    methods: {
      initChart() {
        this.chart = echarts.init(this.$refs.chartContainer);
        this.updateChart(this.data);
      },
      updateChart(data) {
        if (this.chart) {
          this.chart.setOption({
            xAxis: {
              type: 'category',
              data: data.dates
            },
            yAxis: {
              type: 'value'
            },
            series: [
            {
              name: '期望剩余工作量',
              type: 'line',
              data: data.expectedRemainingWork,  // 使用期望数据
              smooth: true,
              itemStyle: {
                color: '#FF6347'  // 设定期望剩余工作量的线的颜色
              },
              lineStyle: {
                width: 2
              },
              areaStyle: {
                color: 'rgba(255, 99, 71, 0.2)'  // 期望剩余工作量的区域填充颜色
              }
            },
            {
              name: '实际剩余工作量',
              type: 'line',
              data: data.actualRemainingWork,  // 使用实际数据
              smooth: true,
              itemStyle: {
                color: '#1E90FF'  // 设定实际剩余工作量的线的颜色
              },
              lineStyle: {
                width: 2
              },
              areaStyle: {
                color: 'rgba(30, 144, 255, 0.2)'  // 实际剩余工作量的区域填充颜色
              }
            }]
          });
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .burndown-chart {
    width: 100%;
    height: 300px;
  }
  </style>
  