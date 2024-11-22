<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="Job Name" prop="jobName">
        <el-input
          v-model="queryParams.jobName"
          placeholder="Enter Job Name"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Job Group" prop="jobGroup">
        <el-select
          v-model="queryParams.jobGroup"
          placeholder="Select Job Group"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_job_group"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="Execution Status" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="Select Execution Status"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_common_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="Execution Time">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="Start Date"
          end-placeholder="End Date"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">Search</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">Reset</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
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
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="handleClean"
          v-hasPermi="['monitor:job:remove']"
        >Clear</el-button>
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
          type="warning"
          plain
          icon="el-icon-close"
          size="mini"
          @click="handleClose"
        >Close</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="jobLogList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Log ID" width="80" align="center" prop="jobLogId" />
      <el-table-column label="Job Name" align="center" prop="jobName" :show-overflow-tooltip="true" />
      <el-table-column label="Job Group" align="center" prop="jobGroup" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_job_group" :value="scope.row.jobGroup"/>
        </template>
      </el-table-column>
      <el-table-column label="Invoke Target String" align="center" prop="invokeTarget" :show-overflow-tooltip="true" />
      <el-table-column label="Log Message" align="center" prop="jobMessage" :show-overflow-tooltip="true" />
      <el-table-column label="Execution Status" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_common_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="Execution Time" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['monitor:job:query']"
          >Details</el-button>
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

    <!-- Schedule Log Details -->
    <el-dialog title="Schedule Log Details" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="Log ID:">{{ form.jobLogId }}</el-form-item>
            <el-form-item label="Job Name:">{{ form.jobName }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Job Group:">{{ form.jobGroup }}</el-form-item>
            <el-form-item label="Execution Time:">{{ form.createTime }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Invoke Method:">{{ form.invokeTarget }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Log Message:">{{ form.jobMessage }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Execution Status:">
              <div v-if="form.status == 0">Normal</div>
              <div v-else-if="form.status == 1">Failed</div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Exception Info:" v-if="form.status == 1">{{ form.exceptionInfo }}</el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="open = false">Close</el-button>
      </div>
    </el-dialog>
  </div>
</template>


<script>
import { listJobLogs, deleteJobLogs, exportJobLogs } from "@/api/monitor/jobLog";

export default {
  name: "JobLog",
  data() {
    return {
      // Search form parameters
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        jobName: undefined,
        jobGroup: undefined,
        status: undefined
      },
      // Date range for search
      dateRange: [],
      // Job log list
      jobLogList: [],
      // Loading state
      loading: true,
      // Selected logs
      ids: [],
      // Multiple selection disabled state
      multiple: true,
      // Total records
      total: 0,
      // Form data
      form: {},
      // Dialog visibility
      open: false
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** Fetch job log list */
    getList() {
      this.loading = true;
      listJobLogs({
        ...this.queryParams,
        beginTime: this.dateRange[0],
        endTime: this.dateRange[1]
      }).then(response => {
        this.jobLogList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** Reset search form */
    resetQuery() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        jobName: undefined,
        jobGroup: undefined,
        status: undefined
      };
      this.dateRange = [];
      this.getList();
    },
    /** Handle selection change */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.jobLogId);
      this.multiple = !selection.length;
    },
    /** Handle delete logs */
    handleDelete() {
      this.$modal
        .confirm("Are you sure you want to delete the selected logs?")
        .then(() => {
          return deleteJobLogs(this.ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("Deletion Successful");
        });
    },
    /** Handle clear logs */
    handleClean() {
      this.$modal
        .confirm("Are you sure you want to clear all logs?")
        .then(() => {
          return deleteJobLogs([]);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("Logs Cleared Successfully");
        });
    },
    /** Handle export logs */
    handleExport() {
      this.download(
        "monitor/jobLog/export",
        {
          ...this.queryParams,
          beginTime: this.dateRange[0],
          endTime: this.dateRange[1]
        },
        `jobLog_${new Date().getTime()}.xlsx`
      );
    },
    /** Handle view log details */
    handleView(row) {
      this.form = row;
      this.open = true;
    }
  }
};
</script>

