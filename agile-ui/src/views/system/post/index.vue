<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="Post Code" prop="postCode">
        <el-input
          v-model="queryParams.postCode"
          placeholder="Enter post code"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Post Name" prop="postName">
        <el-input
          v-model="queryParams.postName"
          placeholder="Enter post name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Status" prop="status">
        <el-select v-model="queryParams.status" placeholder="Post status" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
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
          v-hasPermi="['system:post:add']"
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
          v-hasPermi="['system:post:edit']"
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
          v-hasPermi="['system:post:remove']"
        >Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:post:export']"
        >Export</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Post ID" align="center" prop="postId" />
      <el-table-column label="Post Code" align="center" prop="postCode" />
      <el-table-column label="Post Name" align="center" prop="postName" />
      <el-table-column label="Post Sort" align="center" prop="postSort" />
      <el-table-column label="Status" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="Creation Time" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:post:edit']"
          >Edit</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:post:remove']"
          >Delete</el-button>
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

    <!-- Add or Edit Post Dialog -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Post Name" prop="postName">
          <el-input v-model="form.postName" placeholder="Enter post name" />
        </el-form-item>
        <el-form-item label="Post Code" prop="postCode">
          <el-input v-model="form.postCode" placeholder="Enter post code" />
        </el-form-item>
        <el-form-item label="Post Order" prop="postSort">
          <el-input-number v-model="form.postSort" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="Post Status" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Remarks" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="Enter remarks" />
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
import { listPost, getPost, delPost, addPost, updatePost } from "@/api/system/post";

export default {
  name: "Post",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // Loading overlay
      loading: true,
      // Selected items array
      ids: [],
      // Disable if not single selection
      single: true,
      // Disable if not multiple selection
      multiple: true,
      // Show search conditions
      showSearch: true,
      // Total number of items
      total: 0,
      // Post table data
      postList: [],
      // Dialog title
      title: "",
      // Show dialog
      open: false,
      // Query parameters
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        postCode: undefined,
        postName: undefined,
        status: undefined
      },
      // Form parameters
      form: {},
      // Form validation rules
      rules: {
        postName: [
          { required: true, message: "Post name cannot be empty", trigger: "blur" }
        ],
        postCode: [
          { required: true, message: "Post code cannot be empty", trigger: "blur" }
        ],
        postSort: [
          { required: true, message: "Post order cannot be empty", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** Fetch post list */
    getList() {
      this.loading = true;
      listPost(this.queryParams).then(response => {
        this.postList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // Cancel button
    cancel() {
      this.open = false;
      this.reset();
    },
    // Reset form
    reset() {
      this.form = {
        postId: undefined,
        postCode: undefined,
        postName: undefined,
        postSort: 0,
        status: "0",
        remark: undefined
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
    // Handle selected items in the table
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.postId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** Add button action */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "Add Post";
    },
    /** Edit button action */
    handleUpdate(row) {
      this.reset();
      const postId = row.postId || this.ids;
      getPost(postId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "Edit Post";
      });
    },
    /** Submit form */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.postId != undefined) {
            updatePost(this.form).then(response => {
              this.$modal.msgSuccess("Successfully updated");
              this.open = false;
              this.getList();
            });
          } else {
            addPost(this.form).then(response => {
              this.$modal.msgSuccess("Successfully added");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** Delete button action */
    handleDelete(row) {
      const postIds = row.postId || this.ids;
      this.$modal.confirm('Are you sure to delete the post with ID "' + postIds + '"?').then(function() {
        return delPost(postIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("Successfully deleted");
      }).catch(() => {});
    },
    /** Export button action */
    handleExport() {
      this.download('system/post/export', {
        ...this.queryParams
      }, `post_${new Date().getTime()}.xlsx`);
    }
  }
};

</script>
