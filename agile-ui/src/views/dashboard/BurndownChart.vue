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
            data: data.dates,
            boundaryGap: false,  // 保证横坐标与纵坐标的零点对齐
            min: 0  // 设置横坐标最小值为 0
          },
          yAxis: {
            type: 'value',
            min: 0,  // 设置纵坐标最小值为 0
            max: Math.max(...data.expectedRemainingWork, ...data.actualRemainingWork),  // 设置纵坐标的最大值
            axisLabel: {
              formatter: (value) => value === 0 ? '0' : value  // 格式化零点
            }
          },
          series: [
            {
              name: 'Expected',
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
              name: 'Actual',
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
            }
          ],
          legend: {
            show: true,  // 显示图例
            data: ['Expected', 'Actual'],  // 图例中显示的系列名称，必须与 series 中的 name 一致
            top: 'top',  // 图例的位置，'top' 为顶部
            left: 'center',  // 图例居中显示
            itemWidth: 20,  // 图例标识的宽度
            itemHeight: 14,  // 图例标识的高度
            textStyle: {
              fontSize: 14,  // 图例文本的字体大小
              color: '#333'  // 图例文本颜色
            }
          }
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