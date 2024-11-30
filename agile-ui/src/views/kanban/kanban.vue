<template>
  <div class="scrum-board">
    <div class="kanban-title">
      <el-row>
        <el-col :span="24">
          <h1 style="color">Task Board</h1>
        </el-col>
      </el-row>
    </div>

    <!-- 项目选择 -->
    <el-select v-model="selectedProject" @change="loadTasksForProject" placeholder="Select Project"
      class="select-width">
      <el-option v-for="project in idNameList" :key="project.id" :label="project.name" :value="project.id" />
    </el-select>

    <!-- 任务看板 -->
    <el-row class="task-board" type="flex" justify="start">
      <el-col :span="8" v-for="status in taskStatuses" :key="status">
        <el-card :body-style="{ padding: '20px' }" class="task-column">
          <h2>{{ status }}</h2>
          <div class="task-list">
            <el-card v-for="task in filteredTasks(status)" :key="task.id" class="task-item">
              <h3>{{ task.name }}</h3>
            </el-card>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 任务详情模态框 -->
    <!-- <el-dialog :visible.sync="dialogVisible" title="Task Detail" width="500px">
      <div v-if="selectedTask">
        <p><strong>Title:</strong> {{ selectedTask.title }}</p>
        <p><strong>Description:</strong> {{ selectedTask.description }}</p>
        <p><strong>Priority:</strong> {{ selectedTask.priority }}</p>
        <p><strong>Status:</strong> {{ selectedTask.status }}</p>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="closeTaskDetail">Close</el-button>
      </span>
    </el-dialog> -->
  </div>
</template>

<script>
import { listProject } from "@/api/project/project";
import { listSubproject } from "@/api/project/subproject";
export default {
  mounted() {
    this.getProjectId()
  },
  data() {
    return {
      // 模拟的项目数据
      projects: [
        { id: 1, name: 'Project A' },
        { id: 2, name: 'Project B' },
        { id: 3, name: 'Project C' }
      ],
      // 当前选中的项目
      selectedProject: null,
      taskStatuses: ['To Do', 'In Progress', 'Done'], // 改为 "To Do", "In Progress", "Done"
      // 模拟的任务数据，按项目组织
      allTasks: {
        1: [  // Project A
          { id: 1, title: 'Task 1', description: 'This is the first task', status: 'To Do', priority: 'High' },
          { id: 3, title: 'Task 3', description: 'This is the first task', status: 'To Do', priority: 'High' },
          { id: 2, title: 'Task 2', description: 'This is the second task', status: 'In Progress', priority: 'Medium' },
        ],
        2: [  // Project B
          { id: 3, title: 'Task 3', description: 'This is the third task', status: 'Done', priority: 'Low' },
          { id: 4, title: 'Task 4', description: 'This is the fourth task', status: 'To Do', priority: 'High' },
        ],
        3: [  // Project C
          { id: 5, title: 'Task 5', description: 'This is the fifth task', status: 'To Do', priority: 'Low' },
          { id: 6, title: 'Task 6', description: 'This is the sixth task', status: 'In Progress', priority: 'High' },
        ]
      },
      querySubParams: {
        pageNum: 1,
        pageSize: 10,
        projectId: null,
        subprojectId: null,
        subprojectName: null,
        subStatus: null,
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        projectName: null,
        status: null,
        managerName: null,
      },
      projectList: [],
      idNameList: [],
      subprojectList: [],
      selectedTask: null, // 当前选中的任务
      dialogVisible: false, // 控制任务详情模态框的显示与隐藏
    };
  },
  methods: {
    getProjectId() {
      listProject(this.queryParams).then(response => {
        this.projectList = response.rows;
        this.idNameList = this.projectList.map(project => ({
          id: project.projectId,
          name: project.projectName
        }));
      });
    },
    // 过滤任务，按状态分组
    filteredTasks(status) {
      return this.selectedProject
        ? this.allTasks.filter((task) => task.status === status)
        : [];
    },

    // 选择项目后加载该项目的任务
    loadTasksForProject() {
      this.selectedTask = null; // 选择项目后，初始化当前选中的任务为 null
      if (this.selectedProject) {
        console.log(this.selectedProject);

        // 发起请求并等待完成
        Promise.all([
          this.getSubproject()  // 发起 subproject 请求
        ])
          .then(() => {
            // 请求成功，生成任务列表
            this.allTasks = [];
            this.allTasks = this.subprojectList.map(project => ({
              id: project.subprojectId,
              name: project.subprojectName,
              status: project.subStatus === "1" ? 'To Do' :
                project.subStatus === "2" ? 'In Progress' :
                  project.subStatus === "3" ? 'Done' : 'Unknown'
            }));
            console.log("all task:",this.allTasks);
          })
          .catch(error => {
            // 错误处理
            console.error("Error loading tasks:", error);
          });
      }
    },
    getSubproject() {
      this.querySubParams.projectId = this.selectedProject;
      return listSubproject(this.querySubParams).then(response => {
        this.subprojectList = response.rows;
        console.log("subproject list", this.subprojectList);
      }).catch(error => {
        console.error("Error fetching subprojects:", error);
      });
    },
    // 选择任务
    selectTask(task) {
      this.selectedTask = task;
      this.dialogVisible = true; // 打开任务详情模态框
    },
    // 关闭任务详情
    closeTaskDetail() {
      this.dialogVisible = false;
      this.selectedTask = null; // 关闭后清空选中的任务
    }
  }
};
</script>

<style scoped>
html,
body {
  height: 100%;
  margin: 0;
}

.scrum-board {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  opacity: 0.8;
  /* 使背景稍微透明 */
  height: 100vh;
  /* 确保背景覆盖整个页面 */
  background: linear-gradient(135deg, #ebd16555 25%, transparent 25%) -10px 0/ 20px 20px,
    linear-gradient(225deg, #ebd165 25%, transparent 25%) -10px 0/ 20px 20px,
    linear-gradient(315deg, #ebd16555 25%, transparent 25%) 0px 0/ 20px 20px,
    linear-gradient(45deg, #ebd165 25%, #96a039 25%) 0px 0/ 20px 20px;
  background-size: cover;
  overflow-y: auto;      /* 启用垂直滚动 */
  /* 背景按比例缩放，避免有空白 */
}


.kanban-title {
  font-family: "Monotype Corsiva", cursive;
  text-align: center;
  font-weight: bold;
  font-size: 48px;
  color: #f7f2f2;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.select-width {
  width: 300px;
  margin-bottom: 20px;
}

/* .task-board {
  display: flex;
  gap: 20px;
} */

.task-board {
  display: flex;
  gap: 20px;
}

.task-column {
  width: 400px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  min-height: 500px
}

.task-list {
  margin-top: 10px;
}

.task-item {
  display: flex;          /* 使用 flexbox 布局 */
  align-items: center;    /* 垂直居中对齐 */
  padding: 3px;           /* 内边距保持小一些 */
  background-color: #f4f4f4;
  border-radius: 4px;
  margin-bottom: 2px;
  cursor: pointer;
  position: relative;
  z-index: 10;
  height: 60px;           /* 设置较小的固定高度 */
}

.task-item:hover {
  background-color: #e0e0e0;
}
</style>
