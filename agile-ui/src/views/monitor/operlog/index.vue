<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="Operation Address" prop="operIp">
        <el-input
          v-model="queryParams.operIp"
          placeholder="Please enter operation address"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="System Module" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="Please enter system module"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Operator" prop="operName">
        <el-input
          v-model="queryParams.operName"
          placeholder="Please enter operator"
          clearable
          style="width: 240px;"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Type" prop="businessType">
        <el-select
          v-model="queryParams.businessType"
          placeholder="Operation Type"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_oper_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="Status" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="Operation Status"
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
      <el-form-item label="Operation Time">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="daterange"
          range-separator="-"
          start-placeholder="Start Date"
          end-placeholder="End Date"
          :default-time="['00:00:00', '23:59:59']"
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
          v-hasPermi="['monitor:operlog:remove']"
        >Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="handleClean"
          v-hasPermi="['monitor:operlog:remove']"
        >Clear</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['monitor:operlog:export']"
        >Export</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table ref="tables" v-loading="loading" :data="list" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="Log ID" align="center" prop="operId" />
      <el-table-column label="System Module" align="center" prop="title" :show-overflow-tooltip="true" />
      <el-table-column label="Operation Type" align="center" prop="businessType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_oper_type" :value="scope.row.businessType"/>
        </template>
      </el-table-column>
      <el-table-column label="Operator" align="center" prop="operName" width="110" :show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']" />
      <el-table-column label="Operation Address" align="center" prop="operIp" width="130" :show-overflow-tooltip="true" />
      <el-table-column label="Operation Location" align="center" prop="operLocation" :show-overflow-tooltip="true" />
      <el-table-column label="Operation Status" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_common_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="Operation Date" align="center" prop="operTime" width="160" sortable="custom" :sort-orders="['descending', 'ascending']">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.operTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Elapsed Time" align="center" prop="costTime" width="110" :show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']">
        <template slot-scope="scope">
          <span>{{ scope.row.costTime }}ms</span>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row,scope.index)"
            v-hasPermi="['monitor:operlog:query']"
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

    <!-- Operation Log Details -->
    <el-dialog title="Operation Log Details" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="Module:">{{ form.title }} / {{ typeFormat(form) }}</el-form-item>
            <el-form-item
              label="Login Info:"
            >{{ form.operName }} / {{ form.operIp }} / {{ form.operLocation }}</el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="Request Address:">{{ form.operUrl }}</el-form-item>
            <el-form-item label="Request Method:">{{ form.requestMethod }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Operation Method:">{{ form.method }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Request Parameters:">{{ form.operParam }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Response Parameters:">{{ form.jsonResult }}</el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="Operation Status:">
              <div v-if="form.status === 0">Normal</div>
              <div v-else-if="form.status === 1">Failed</div>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="Elapsed Time:">{{ form.costTime }}ms</el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="Operation Time:">{{ parseTime(form.operTime) }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="Error Message:" v-if="form.status === 1">{{ form.errorMsg }}</el-form-item>
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
import { list, delOperlog, cleanOperlog } from "@/api/monitor/operlog";

export default {
  name: "Operlog",
  dicts: ['sys_oper_type', 'sys_common_status'],
  data() {
    return {
      // Loading indicator
      loading: true,
      // Selected IDs
      ids: [],
      // Disable actions when no selection
      multiple: true,
      // Show search conditions
      showSearch: true,
      // Total records
      total: 0,
      // Table data
      list: [],
      // Show dialog
      open: false,
      // Date range
      dateRange: [],
      // Default sort
      defaultSort: {prop: 'operTime', order: 'descending'},
      // Form data
      form: {},
      // Query parameters
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        operIp: undefined,
        title: undefined,
        operName: undefined,
        businessType: undefined,
        status: undefined
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** Fetch operation logs */
    getList() {
      this.loading = true;
      list(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.list = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // Translate operation log type dictionary
    typeFormat(row, column) {
      return this.selectDictLabel(this.dict.type.sys_oper_type, row.businessType);
    },
    /** Search button action */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** Reset button action */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.pageNum = 1;
      this.$refs.tables.sort(this.defaultSort.prop, this.defaultSort.order)
    },
    /** Handle selected rows */
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.operId)
      this.multiple = !selection.length
    },
    /** Sorting trigger */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    /** View details action */
    handleView(row) {
      this.open = true;
      this.form = row;
    },
    /** Delete action */
    handleDelete(row) {
      const operIds = row.operId || this.ids;
      this.$modal.confirm('Are you sure you want to delete the log with ID "' + operIds + '"?').then(function() {
        return delOperlog(operIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("Successfully deleted");
      }).catch(() => {});
    },
    /** Clear all logs action */
    handleClean() {
      this.$modal.confirm('Are you sure you want to clear all operation logs?').then(function() {
        return cleanOperlog();
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("Successfully cleared");
      }).catch(() => {});
    },
    /** Export button action */
    handleExport() {
      this.download('monitor/operlog/export', {
        ...this.queryParams
      }, `operlog_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

