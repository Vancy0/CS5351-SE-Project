<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="Job Name" prop="jobName">
        <el-input
          v-model="queryParams.jobName"
          placeholder="Enter Job Name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Job Group" prop="jobGroup">
        <el-select v-model="queryParams.jobGroup" placeholder="Select Job Group" clearable>
          <el-option
            v-for="dict in dict.type.sys_job_group"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="Job Status" prop="status">
        <el-select v-model="queryParams.status" placeholder="Select Job Status" clearable>
          <el-option
            v-for="dict in dict.type.sys_job_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['monitor:job:add']"
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
          v-hasPermi="['monitor:job:edit']"
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
          v-hasPermi="['monitor:job:remove']"
        >Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['monitor:job:export']"
        >Export</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-s-operation"
          size="mini"
          @click="handleJobLog"
          v-hasPermi="['monitor:job:query']"
        >Log</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="jobList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Job ID" width="100" align="center" prop="jobId" />
      <el-table-column label="Job Name" align="center" prop="jobName" :show-overflow-tooltip="true" />
      <el-table-column label="Job Group" align="center" prop="jobGroup">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_job_group" :value="scope.row.jobGroup"/>
        </template>
      </el-table-column>
      <el-table-column label="Invoke Target String" align="center" prop="invokeTarget" :show-overflow-tooltip="true" />
      <el-table-column label="Cron Expression" align="center" prop="cronExpression" :show-overflow-tooltip="true" />
      <el-table-column label="Status" align="center">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.status"
            active-value="0"
            inactive-value="1"
            @change="handleStatusChange(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['monitor:job:edit']"
          >Edit</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['monitor:job:remove']"
          >Delete</el-button>
          <el-dropdown size="mini" @command="(command) => handleCommand(command, scope.row)" v-hasPermi="['monitor:job:changeStatus', 'monitor:job:query']">
            <el-button size="mini" type="text" icon="el-icon-d-arrow-right">More</el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="handleRun" icon="el-icon-caret-right"
                                v-hasPermi="['monitor:job:changeStatus']">Run Once</el-dropdown-item>
              <el-dropdown-item command="handleView" icon="el-icon-view"
                                v-hasPermi="['monitor:job:query']">Job Details</el-dropdown-item>
              <el-dropdown-item command="handleJobLog" icon="el-icon-s-operation"
                                v-hasPermi="['monitor:job:query']">Schedule Log</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </template>
      </el-table-column>
    </el-table>


    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- Add or Edit Scheduled Task Dialog -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="Job Name" prop="jobName">
              <el-input v-model="form.jobName" placeholder="Enter Job Name" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Job Group" prop="jobGroup">
              <el-select v-model="form.jobGroup" placeholder="Select Job Group">
                <el-option
                  v-for="dict in dict.type.sys_job_group"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item prop="invokeTarget">
          <span slot="label">
            Invoke Method
            <el-tooltip placement="top">
              <div slot="content">
                Bean Invoke Example: ryTask.ryParams('ry')
                <br />Class Invoke Example: com.ruoyi.quartz.task.RyTask.ryParams('ry')
                <br />Parameter Description: Supports String, Boolean, Long, Float, Integer
              </div>
              <i class="el-icon-question"></i>
            </el-tooltip>
          </span>
              <el-input v-model="form.invokeTarget" placeholder="Enter Invoke Target String" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Cron Expression" prop="cronExpression">
              <el-input v-model="form.cronExpression" placeholder="Enter Cron Execution Expression">
                <template slot="append">
                  <el-button type="primary" @click="handleShowCron">
                    Generate Expression
                    <i class="el-icon-time el-icon--right"></i>
                  </el-button>
                </template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="24" v-if="form.jobId !== undefined">
            <el-form-item label="Status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.sys_job_status"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Execution Policy" prop="misfirePolicy">
              <el-radio-group v-model="form.misfirePolicy" size="small">
                <el-radio-button label="1">Execute Immediately</el-radio-button>
                <el-radio-button label="2">Execute Once</el-radio-button>
                <el-radio-button label="3">Abandon Execution</el-radio-button>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Concurrent Execution" prop="concurrent">
              <el-radio-group v-model="form.concurrent" size="small">
                <el-radio-button label="0">Allow</el-radio-button>
                <el-radio-button label="1">Disallow</el-radio-button>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">Confirm</el-button>
        <el-button @click="cancel">Cancel</el-button>
      </div>
    </el-dialog>

    <el-dialog title="Cron Expression Generator" :visible.sync="openCron" append-to-body destroy-on-close class="scrollbar">
      <crontab @hide="openCron=false" @fill="crontabFill" :expression="expression"></crontab>
    </el-dialog>

    <!-- Task Log Details -->
    <el-dialog title="Task Details" :visible.sync="openView" width="700px" append-to-body>
      <el-form ref="form" :model="form" label-width="120px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="Job ID:">{{ form.jobId }}</el-form-item>
            <el-form-item label="Job Name:">{{ form.jobName }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Job Group:">{{ jobGroupFormat(form) }}</el-form-item>
            <el-form-item label="Creation Time:">{{ form.createTime }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Cron Expression:">{{ form.cronExpression }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Next Execution Time:">{{ parseTime(form.nextValidTime) }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Invoke Target Method:">{{ form.invokeTarget }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Task Status:">
              <div v-if="form.status == 0">Normal</div>
              <div v-else-if="form.status == 1">Paused</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Concurrent Execution:">
              <div v-if="form.concurrent == 0">Allow</div>
              <div v-else-if="form.concurrent == 1">Disallow</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Execution Policy:">
              <div v-if="form.misfirePolicy == 0">Default Policy</div>
              <div v-else-if="form.misfirePolicy == 1">Execute Immediately</div>
              <div v-else-if="form.misfirePolicy == 2">Execute Once</div>
              <div v-else-if="form.misfirePolicy == 3">Abandon Execution</div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openView = false">Close</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listJob, getJob, delJob, addJob, updateJob, runJob, changeJobStatus } from "@/api/monitor/job";
import Crontab from '@/components/Crontab';

export default {
  components: { Crontab },
  name: "Job",
  dicts: ['sys_job_group', 'sys_job_status'],
  data() {
    return {
      // Loading overlay
      loading: true,
      // Selected IDs
      ids: [],
      // Disable if not a single selection
      single: true,
      // Disable if no multiple selection
      multiple: true,
      // Show search criteria
      showSearch: true,
      // Total count
      total: 0,
      // Job table data
      jobList: [],
      // Dialog title
      title: "",
      // Show dialog
      open: false,
      // Show detail dialog
      openView: false,
      // Show Cron expression dialog
      openCron: false,
      // Passed expression
      expression: "",
      // Query parameters
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        jobName: undefined,
        jobGroup: undefined,
        status: undefined
      },
      // Form parameters
      form: {},
      // Form validation rules
      rules: {
        jobName: [
          { required: true, message: "Job Name cannot be empty", trigger: "blur" }
        ],
        invokeTarget: [
          { required: true, message: "Invoke Target String cannot be empty", trigger: "blur" }
        ],
        cronExpression: [
          { required: true, message: "Cron Execution Expression cannot be empty", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** Fetch scheduled job list */
    getList() {
      this.loading = true;
      listJob(this.queryParams).then(response => {
        this.jobList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** Translate job group dictionary */
    jobGroupFormat(row, column) {
      return this.selectDictLabel(this.dict.type.sys_job_group, row.jobGroup);
    },
    /** Cancel button */
    cancel() {
      this.open = false;
      this.reset();
    },
    /** Reset form */
    reset() {
      this.form = {
        jobId: undefined,
        jobName: undefined,
        jobGroup: undefined,
        invokeTarget: undefined,
        cronExpression: undefined,
        misfirePolicy: 1,
        concurrent: 1,
        status: "0"
      };
      this.resetForm("form");
    },
    /** Handle search button */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** Handle reset button */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** Handle selection change */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.jobId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },

    /** Handle more operations */
    handleCommand(command, row) {
      switch (command) {
        case "handleRun":
          this.handleRun(row);
          break;
        case "handleView":
          this.handleView(row);
          break;
        case "handleJobLog":
          this.handleJobLog(row);
          break;
        default:
          break;
      }
    },
    /** Change job status */
    handleStatusChange(row) {
      let text = row.status === "0" ? "Enable" : "Disable";
      this.$modal.confirm(`Are you sure you want to "${text}" the task "${row.jobName}"?`).then(function() {
        return changeJobStatus(row.jobId, row.status);
      }).then(() => {
        this.$modal.msgSuccess(`${text} Successful`);
      }).catch(() => {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    /** Execute once immediately */
    handleRun(row) {
      this.$modal.confirm(`Are you sure you want to execute the task "${row.jobName}" immediately?`).then(() => {
        return runJob(row.jobId, row.jobGroup);
      }).then(() => {
        this.$modal.msgSuccess("Execution Successful");
      }).catch(() => {});
    },
    /** View job details */
    handleView(row) {
      getJob(row.jobId).then(response => {
        this.form = response.data;
        this.openView = true;
      });
    },
    /** Handle Cron expression button */
    handleShowCron() {
      this.expression = this.form.cronExpression;
      this.openCron = true;
    },
    /** Pass value after confirmation */
    crontabFill(value) {
      this.form.cronExpression = value;
    },
    /** Fetch job log list */
    handleJobLog(row) {
      const jobId = row.jobId || 0;
      this.$router.push('/monitor/job-log/index/' + jobId);
    },
    /** Handle add button */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "Add Job";
    },
    /** Handle update button */
    handleUpdate(row) {
      this.reset();
      const jobId = row.jobId || this.ids;
      getJob(jobId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "Update Job";
      });
    },
    /** Submit form */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.jobId != undefined) {
            updateJob(this.form).then(() => {
              this.$modal.msgSuccess("Update Successful");
              this.open = false;
              this.getList();
            });
          } else {
            addJob(this.form).then(() => {
              this.$modal.msgSuccess("Addition Successful");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** Handle delete button */
    handleDelete(row) {
      const jobIds = row.jobId || this.ids;
      this.$modal.confirm(`Are you sure you want to delete the scheduled job with ID "${jobIds}"?`).then(() => {
        return delJob(jobIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("Deletion Successful");
      }).catch(() => {});
    },
    /** Handle export button */
    handleExport() {
      this.download('monitor/job/export', {
        ...this.queryParams
      }, `job_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

