<template>
  <div class="burndown-container">
    <div class="chart-title">
      <el-row>
        <el-col :span="24">
          <h1 style="color">Burndown Chart</h1>
        </el-col>
      </el-row>
    </div>
    <!-- 项目选择 -->
    <div class="project-select">
      <el-row>
        <el-col :span="24">
          <el-select v-model="selectedProject" @change="loadBurndownChart" placeholder="Select Project" class="select-project">
            <el-option
              v-for="project in projects"
              :key="project.id"
              :label="project.name"
              :value="project.id"
            />
          </el-select>
        </el-col>
      </el-row>
    </div>

    <!-- 显示燃尽图 -->
    <div v-if="burndownData" class="burndown-chart-container">
      <burndown-chart :data="burndownData" />
    </div>

  </div>
</template>

<script>
import BurndownChart from '../dashboard/BurndownChart.vue'; // 引入燃尽图组件

export default {
  components: {
    BurndownChart
  },
  data() {
    return {
      // 模拟的项目数据
      projects: [
        { id: 1, name: 'Project A' },
        { id: 2, name: 'Project B' },
        { id: 3, name: 'Project C' }
      ],
      selectedProject: null,  // 当前选中的项目
      burndownData: null  // 当前项目的燃尽图数据
    };
  },
  methods: {
    // 选择项目后加载燃尽图数据
    loadBurndownChart() {
      if (this.selectedProject) {
        // 模拟不同项目的燃尽图数据
        switch (this.selectedProject) {
          case 1:
            this.burndownData = this.getBurndownDataA();
            break;
          case 2:
            this.burndownData = this.getBurndownDataB();
            break;
          case 3:
            this.burndownData = this.getBurndownDataC();
            break;
          default:
            this.burndownData = null;
        }
      }
    },
    
    // 模拟项目 A 的燃尽图数据
    getBurndownDataA() {
      return {
        dates: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        remainingWork: [100, 90, 80, 70, 60, 50, 40]
      };
    },
    
    // 模拟项目 B 的燃尽图数据
    getBurndownDataB() {
      return {
        dates: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        remainingWork: [120, 110, 100, 85, 70, 60, 50]
      };
    },
    
    // 模拟项目 C 的燃尽图数据
    getBurndownDataC() {
      return {
        dates: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        remainingWork: [80, 70, 60, 55, 45, 40, 30]
      };
    }
  }
};
</script>

<style scoped>
.burndown-container {
  background-color: #f5f7fa; /* 页面背景色 */
  padding: 40px 20px;
  min-height: 100vh;
  background: #f2f2f2;
  background-image: 
    linear-gradient(90deg, #e0e0e0 1px, transparent 1px),
    linear-gradient(90deg, #e0e0e0 1px, transparent 1px);
  background-size: 30px 30px;
  opacity: 0.95;
}

.chart-title {
  font-family: "Monotype Corsiva", cursive;
  text-align: center;
  font-weight: bold;
  font-size: 48px;
  color: #080606;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.project-select {
  margin-bottom: 30px;
  text-align: center;
}

.select-project {
  width: 300px;
  margin: 0 auto;
  background-color: #ffffff;
}

.burndown-chart-container {
  display: flex;
  justify-content: center;
  margin-top: 40px;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  min-height: 400px; /* 设置最小高度 */
}

.el-select {
  border-radius: 8px;
  font-size: 16px;
}

.el-option {
  font-size: 14px;
}

.el-row {
  justify-content: center;
}

.el-col {
  display: flex;
  justify-content: center;
}

.el-select, .el-option {
  color: #333;
}

.el-row {
  margin-bottom: 20px;
}
</style>
