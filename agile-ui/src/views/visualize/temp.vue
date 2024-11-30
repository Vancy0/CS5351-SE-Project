<template>
  <div>
    <!-- 项目选择 -->
    <div>
      <label for="project">Select Project:</label>
      <select v-model="selectedProject" @change="loadBurndownChart">
        <option v-for="project in projects" :key="project.id" :value="project.id">
          {{ project.name }}
        </option>
      </select>
    </div>

    <!-- 显示燃尽图 -->
    <div v-if="burndownData">
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
