<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="Project Name" prop="projectName">
        <el-input
          v-model="queryParams.projectName"
          placeholder="Please enter project name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Manager Name" prop="managerName">
        <el-input
          v-model="queryParams.managerName"
          placeholder="Please enter manager name"
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
        >Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >Export</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="projectList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="ID" align="center" prop="id" /> -->
      <el-table-column label="Project ID" align="center" prop="projectId" />
      <el-table-column label="Project Name" align="center" prop="projectName" />
      <el-table-column label="Project Status" align="center" prop="status" />
      <el-table-column label="Manager ID" align="center" prop="managerId" />
      <el-table-column label="Manager Name" align="center" prop="managerName" />
      <!-- TODO -->
      <el-table-column label="Current Cycle" align="center" prop="currentCycle" />
      <el-table-column label="Total Cycle" align="center" prop="totalCycle" />
      <el-table-column label="Approval Time" align="center" prop="verifyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.verifyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleMember(scope.row)"
          >Member Details</el-button> -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleSubproject(scope.row)"
          >Task Details</el-button>
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

    <!-- Add or Edit Project Dialog -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="150px">
        <el-form-item label="Project ID" prop="projectId">
          <el-input v-model="form.projectId" placeholder="Please enter project ID" />
        </el-form-item>
        <el-form-item label="Project Name" prop="projectName">
          <el-input v-model="form.projectName" placeholder="Please enter project name" />
        </el-form-item>
        <el-form-item prop="status">
          <template #label>
            Project Status
            <!-- Tooltip for detailed description, placed next to label -->
            <el-tooltip class="item" effect="dark" content="1: In Progress, 2: On Hold, 3: Completed" placement="top-start">
              <el-button type="text" icon="el-icon-info" size="mini" style="padding: 0; margin-left: 5px;"></el-button>
            </el-tooltip>
          </template>
          <el-select v-model="form.status" placeholder="Select status">
            <el-option label="In Progress" value="1"></el-option>
            <el-option label="On Hold" value="2"></el-option>
            <el-option label="Completed" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="Manager ID" prop="managerId">
          <el-input v-model="form.managerId" placeholder="Please enter manager ID" />
        </el-form-item>
        <el-form-item label="Manager Name" prop="managerName">
          <el-input v-model="form.managerName" placeholder="Please enter manager name" />
        </el-form-item>
        <!-- TODO -->
        <el-form-item label="Current Cycle" prop="currentCycle">
          <el-input v-model="form.currentCycle" placeholder="Please enter current cycle" />
        </el-form-item>
        <el-form-item label="Total Cycle" prop="totalCycle">
          <el-input v-model="form.totalCycle" placeholder="Please enter project cycle" />
        </el-form-item>
        <el-form-item label="Approval Time" prop="verifyTime">
          <el-date-picker clearable
                          v-model="form.verifyTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="Please select approval time">
          </el-date-picker>
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
import { listProject, getProject, delProject, addProject, updateProject } from "@/api/project/project";

export default {
  name: "Project",
  data() {
    return {
      // Loading indicator
      loading: true,
      // Selected IDs
      ids: [],
      // Disable actions when not single
      single: true,
      // Disable actions when no selection
      multiple: true,
      // Show search conditions
      showSearch: true,
      // Total records
      total: 0,
      // Project table data
      projectList: [],
      // Dialog title
      title: "",
      // Show dialog
      open: false,
      // Query parameters
      queryParams: {
        //TODO
        pageNum: 1,
        pageSize: 10,
        projectName: null,
        status: null,
        managerName: null,
      },
      // Form parameters
      form: {},
      // Form validation rules
      rules: {
        managerId: [
          { required: true, message: "Manager ID cannot be empty", trigger: "blur" }
        ],
        managerName: [
          { required: true, message: "Manager name cannot be empty", trigger: "blur" }
        ],
        status: [
          { required: true, message: "status cannot be empty", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** Fetch project list */
    getList() {
      this.loading = true;
      listProject(this.queryParams).then(response => {
        this.projectList = response.rows;
        console.log(this.projectList)
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
        projectName: null,
        status: null,
        managerId: null,
        managerName: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        verifyTime: null,
        updateBy: null,
        delFlag: null,
        // currentCycle: null,
        // totalCycle: null
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
    /** Details button action */
    handleSubproject(row) {
      this.$router.push("/project/subproject/" + row.projectId);
    },
    // Handle selected rows
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** Add button action */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "Add Project";
    },
    /** Edit button action */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getProject(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "Edit Project";
      });
    },
    /** Submit form */
    submitForm() {
      this.$refs["form"].validate(valid => {
        console.log(this.form);
        if (valid) {
          if (this.form.id != null) {
            updateProject(this.form).then(response => {
              this.$modal.msgSuccess("Edit successful");
              this.open = false;
              this.getList();
            });
          } else {
            addProject(this.form).then(response => {
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
      this.$modal.confirm('Are you sure you want to delete the project with ID "' + ids + '"?').then(function() {
        return delProject(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("Delete successful");
      }).catch(() => {});
    },
    /** Export button action */
    handleExport() {
      this.download('system/project/export', {
        ...this.queryParams
      }, `project_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

