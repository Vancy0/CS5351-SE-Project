<template>
  <div class="app-container home" style="background-color: #f0f8ff; height: 100vh; display: flex; align-items: center; justify-content: center;">
    <h1 class=dashboard-title >Welcome to Agility X</h1>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      version: '3.8.8' // 你可以根据实际情况修改版本号
    };
  }
};
</script>

<style scoped>
.app-container.home {
  background-color: #f0f8ff; /* 设置背景颜色 */
  height: 100vh; /* 设置高度为视口高度 */
  display: flex; /* 使用Flexbox布局 */
  align-items: center; /* 垂直居中 */
  justify-content: center; /* 水平居中 */
}

.dashboard-title {
  font-family: "Monotype Corsiva", cursive;
  text-align: center;
  font-weight: bold;
  font-size: 144px;
  color: #2133bd;
  text-shadow: 2px 2px 4px rgba(59, 196, 38, 0.5);
}
</style>