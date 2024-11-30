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
            series: [{
              name: '剩余工作量',
              type: 'line',
              data: data.remainingWork,
              smooth: true,
              itemStyle: {
                color: '#FF7F50'
              },
              lineStyle: {
                width: 2
              },
              areaStyle: {
                color: 'rgba(255, 127, 80, 0.2)'
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
  