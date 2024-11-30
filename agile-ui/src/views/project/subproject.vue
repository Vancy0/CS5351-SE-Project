<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="Project ID" prop="projectId">
        <el-input
          v-model="queryParams.projectId"
          placeholder="Please enter project ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Task ID" prop="subprojectId">
        <el-input
          v-model="queryParams.subprojectId"
          placeholder="Please enter task ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Task Name" prop="subprojectName">
        <el-input
          v-model="queryParams.subprojectName"
          placeholder="Please enter task name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">Search</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">Reset</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['project:subproject:add']"
        >Add</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['project:subproject:edit']"
        >Edit</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['project:subproject:remove']"
        >Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['project:subproject:export']"
        >Export</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="subprojectList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="ID" align="center" prop="id" /> -->
      <el-table-column label="Project ID" align="center" prop="projectId" />
      <el-table-column label="Task ID" align="center" prop="subprojectId" />
      <el-table-column label="Task Name" align="center" prop="subprojectName" />
      <el-table-column label="Task Status" align="center" prop="subStatus" />
      <el-table-column label="Story Points" align="center" prop="storyPoint" />
      <el-table-column label="Expected Cycle" align="center" prop="expectedCycle" />
      <el-table-column label="Finished Cycle" align="center" prop="finishedCycle" />
      <el-table-column label="Member ID" align="center" prop="memberId" />
      <el-table-column label="Approval Time" align="center" prop="verifyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.verifyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >Edit</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- Add or Edit Subproject Dialog -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="170px">
        <el-form-item label="Project ID" prop="projectId">
          <el-input v-model="form.projectId" placeholder="Please enter project ID" />
        </el-form-item>
        <el-form-item label="Task ID" prop="subprojectId">
          <el-input v-model="form.subprojectId" placeholder="Please enter subproject ID" />
        </el-form-item>
        <el-form-item label="Task Name" prop="subprojectName">
          <el-input v-model="form.subprojectName" placeholder="Please enter subproject name" />
        </el-form-item>
        <el-form-item prop="subStatus">
          <template #label>
            Task Status
            <!-- Tooltip for detailed description, placed next to label -->
            <el-tooltip class="item" effect="dark" content="1: In Progress, 2: On Hold, 3: Completed" placement="top-start">
              <el-button type="text" icon="el-icon-info" size="mini" style="padding: 0; margin-left: 5px;"></el-button>
            </el-tooltip>
          </template>
          <el-select v-model="form.subStatus" placeholder="Select status">
            <el-option label="In Progress" value="1"></el-option>
            <el-option label="On Hold" value="2"></el-option>
            <el-option label="Completed" value="3"></el-option>
          </el-select>
        </el-form-item>
        <!-- TODO -->
        <el-form-item label="Story Points" prop="storyPoint">
          <el-input v-model="form.storyPoint" placeholder="Please enter story points" />
        </el-form-item>
        <el-form-item label="Expected Cycle" prop="expectedCycle">
          <el-input v-model="form.expectedCycle" placeholder="Please enter expected cycle" />
        </el-form-item>
        <el-form-item label="Finished Cycle" prop="finishedCycle">
          <el-input v-model="form.finishedCycle" placeholder="Please enter finished cycle" />
        </el-form-item>
        <el-form-item label="Member ID" prop="memberId">
          <el-input v-model="form.memberId" placeholder="Please enter member ID" />
        </el-form-item>
        <el-form-item label="Approval Time" prop="verifyTime">
          <el-date-picker clearable
                          v-model="form.verifyTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="Please select approval time">
          </el-date-picker>
        </el-form-item>
        <el-form-item prop="delFlag">
          <template #label>
            Delete Flag
            <!-- Tooltip for detailed description, placed next to label -->
            <el-tooltip class="item" effect="dark" content="0 for Normal, 1 for Deleted" placement="top-start">
              <el-button type="text" icon="el-icon-info" size="mini" style="padding: 0; margin-left: 5px;"></el-button>
            </el-tooltip>
          </template>
          <el-input v-model="form.delFlag" placeholder="Please enter delete flag" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">Confirm</el-button>
        <el-button @click="cancel">Cancel</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSubproject, getSubproject, delSubproject, addSubproject, updateSubproject } from "@/api/project/subproject";

export default {
  name: "Subproject",
  data() {
    return {
      projectId: "",
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 子系统表格数据
      subprojectList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        //TODO
        pageNum: 1,
        pageSize: 10,
        projectId: null,
        subprojectId: null,
        subprojectName: null,
        subStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        subprojectId: [
          { required: true, message: "Subproject id cannot be empty", trigger: "blur" }
        ],
        subprojectName: [
          { required: true, message: "Subproject name cannot be empty", trigger: "blur" }
        ],
        subStatus: [
          { required: true, message: "Status id cannot be empty", trigger: "blur" }
        ],
        point: [
          { required: true, message: "Story points cannot be empty", trigger: "blur" }
        ],
      }
    };
  },
  created() {

    this.getList();
  },
  methods: {
    /** Fetch subproject list */
    getList() {
      this.loading = true;
      this.queryParams.projectId = this.projectId;
      console.log("this.queryParams: ",this.queryParams);
      listSubproject(this.queryParams).then(response => {
        this.subprojectList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // Cancel button action
    cancel() {
      this.open = false;
      this.reset();
    },
    // Reset form
    reset() {
      this.form = {
        id: null,
        projectId: null,
        subprojectId: null,
        subprojectName: null,
        subStatus: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        verifyTime: null,
        updateBy: null,
        delFlag: null
      };
      this.resetForm("form");
    },
    /** Search button action */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** Reset button action */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // Handle selected rows in the table
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** Add button action */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "Add Subproject";
    },
    /** Edit button action */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getSubproject(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "Edit Subproject";
      });
    },
    /** Submit form */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSubproject(this.form).then(response => {
              this.$modal.msgSuccess("Edit successful");
              this.open = false;
              this.getList();
            });
          } else {
            addSubproject(this.form).then(response => {
              this.$modal.msgSuccess("Add successful");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** Delete button action */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('Are you sure you want to delete the subproject with ID "' + ids + '"?').then(function() {
        return delSubproject(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("Delete successful");
      }).catch(() => {});
    },
    /** Export button action */
    handleExport() {
      this.download('project/subproject/export', {
        ...this.queryParams
      }, `subproject_${new Date().getTime()}.xlsx`);
    }
  }

};
</script>
