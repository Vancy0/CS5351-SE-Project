/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 90001 (9.0.1)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 90001 (9.0.1)
 File Encoding         : 65001

 Date: 01/12/2024 13:15:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agile_member
-- ----------------------------
DROP TABLE IF EXISTS `agile_member`;
CREATE TABLE `agile_member`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` int NULL DEFAULT NULL COMMENT '项目id',
  `member_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '项目负责人id(user_name)',
  `member_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '负责人名字(nick_name)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of agile_member
-- ----------------------------

-- ----------------------------
-- Table structure for agile_project
-- ----------------------------
DROP TABLE IF EXISTS `agile_project`;
CREATE TABLE `agile_project`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` int NULL DEFAULT NULL COMMENT '项目id',
  `project_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '项目名',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '项目状态(1进行中，2已完结)',
  `manager_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '项目负责人id(user_name)',
  `manager_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '负责人名字(nick_name)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记，0正常，1删除',
  `total_cycle` int NOT NULL,
  `current_cycle` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of agile_project
-- ----------------------------
INSERT INTO `agile_project` VALUES (7, 101, 'Corporate Website Upgrade', '2', '001', 'ziyang', '2024-11-30 21:38:57', NULL, NULL, '2024-12-01 00:00:00', NULL, '0', 3, 1);
INSERT INTO `agile_project` VALUES (8, 102, 'Employee Management System', '2', '002', 'yilin', '2024-11-30 21:39:57', NULL, NULL, '2024-12-04 00:00:00', NULL, '0', 6, 4);
INSERT INTO `agile_project` VALUES (9, 103, 'E-Commerce Promotion System', '2', '003', 'wenjin', '2024-11-30 21:40:45', NULL, NULL, '2024-12-06 00:00:00', NULL, '0', 7, 5);
INSERT INTO `agile_project` VALUES (10, 104, 'Mobile Social App', '3', '004', 'xinyi', '2024-11-30 21:41:27', NULL, NULL, '2024-12-04 00:00:00', NULL, '0', 9, 9);

-- ----------------------------
-- Table structure for agile_subproject
-- ----------------------------
DROP TABLE IF EXISTS `agile_subproject`;
CREATE TABLE `agile_subproject`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` int NULL DEFAULT NULL COMMENT '项目id',
  `subproject_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '子项目id',
  `subproject_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '子项目名字',
  `sub_status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '子项目状态(0待处理，1进行中，2已完结)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记，0正常，1删除',
  `member_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `story_point` int NOT NULL,
  `finished_cycle` int NULL DEFAULT NULL,
  `expected_cycle` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of agile_subproject
-- ----------------------------
INSERT INTO `agile_subproject` VALUES (9, 101, '101-01', 'Requirement Gathering', '3', '2024-11-30 21:43:43', NULL, NULL, '2024-11-13 00:00:00', NULL, '0', '001', 5, 1, 1);
INSERT INTO `agile_subproject` VALUES (10, 101, '101-02', 'Wireframe Design', '2', '2024-11-30 21:44:27', NULL, NULL, '2024-11-22 00:00:00', NULL, '0', '001', 8, 1, 1);
INSERT INTO `agile_subproject` VALUES (11, 101, '101-03', 'Homepage Development', '2', '2024-12-01 08:00:00', NULL, NULL, '2024-12-05 00:00:00', NULL, '0', '002', 10, 1, 1);
INSERT INTO `agile_subproject` VALUES (12, 101, '101-04', 'Product Page Development', '2', '2024-12-02 09:00:00', NULL, NULL, '2024-12-10 00:00:00', NULL, '0', '003', 8, 1, 1);
INSERT INTO `agile_subproject` VALUES (13, 101, '101-05', 'Blog Module Integration', '2', '2024-12-02 10:00:00', NULL, NULL, '2024-12-12 00:00:00', NULL, '0', '004', 7, 0, 2);
INSERT INTO `agile_subproject` VALUES (14, 101, '101-06', 'Responsive Design Testing', '2', '2024-12-05 11:00:00', NULL, NULL, '2024-12-15 00:00:00', NULL, '0', '005', 6, 0, 2);
INSERT INTO `agile_subproject` VALUES (15, 101, '101-07', 'Website Performance Optimization', '2', '2024-12-06 14:00:00', NULL, NULL, '2024-12-18 00:00:00', NULL, '0', '006', 9, 0, 2);
INSERT INTO `agile_subproject` VALUES (16, 101, '101-08', 'SEO Optimization', '2', '2024-12-07 15:00:00', NULL, NULL, '2024-12-20 00:00:00', NULL, '0', '003', 5, 0, 2);
INSERT INTO `agile_subproject` VALUES (17, 101, '101-09', 'Internal Review and Feedback', '2', '2024-12-10 16:00:00', NULL, NULL, '2024-12-22 00:00:00', NULL, '0', '004', 4, 0, 3);
INSERT INTO `agile_subproject` VALUES (18, 101, '101-10', 'Deployment to Production Environment', '2', '2024-12-11 17:00:00', NULL, NULL, '2024-12-25 00:00:00', NULL, '0', '006', 10, 0, 3);
INSERT INTO `agile_subproject` VALUES (19, 101, '101-11', 'Final User Testing', '2', '2024-12-12 18:00:00', NULL, NULL, '2024-12-28 00:00:00', NULL, '0', '006', 6, 0, 3);
INSERT INTO `agile_subproject` VALUES (20, 101, '101-12', 'Project Documentation and Archive', '2', '2024-12-13 19:00:00', NULL, NULL, '2024-12-30 00:00:00', NULL, '0', '006', 4, 0, 3);
INSERT INTO `agile_subproject` VALUES (21, 102, '102-01', 'Requirements Analysis', '3', '2024-12-01 09:00:00', NULL, NULL, '2024-12-03 00:00:00', NULL, '0', '001', 5, 1, 1);
INSERT INTO `agile_subproject` VALUES (22, 102, '102-02', 'System Architecture Design', '2', '2024-12-01 10:00:00', NULL, NULL, '2024-12-04 00:00:00', NULL, '0', '001', 8, 1, 2);
INSERT INTO `agile_subproject` VALUES (23, 102, '102-03', 'Database Design and Setup', '2', '2024-12-02 09:00:00', NULL, NULL, '2024-12-06 00:00:00', NULL, '0', '001', 7, 1, 2);
INSERT INTO `agile_subproject` VALUES (24, 102, '102-04', 'User Authentication Module Development', '3', '2024-12-02 10:00:00', NULL, NULL, '2024-12-08 00:00:00', NULL, '0', '001', 9, 2, 2);
INSERT INTO `agile_subproject` VALUES (25, 102, '102-05', 'Employee Data Entry Module', '3', '2024-12-03 09:00:00', NULL, NULL, '2024-12-10 00:00:00', NULL, '0', '002', 8, 3, 3);
INSERT INTO `agile_subproject` VALUES (26, 102, '102-06', 'Attendance Tracking Module', '3', '2024-12-04 10:00:00', NULL, NULL, '2024-12-12 00:00:00', NULL, '0', '003', 7, 3, 3);
INSERT INTO `agile_subproject` VALUES (27, 102, '102-07', 'Payroll Module Development', '3', '2024-12-05 11:00:00', NULL, NULL, '2024-12-14 00:00:00', NULL, '0', '004', 9, 4, 4);
INSERT INTO `agile_subproject` VALUES (28, 102, '102-08', 'API Development and Documentation', '2', '2024-12-06 12:00:00', NULL, NULL, '2024-12-16 00:00:00', NULL, '0', '005', 8, 3, 4);
INSERT INTO `agile_subproject` VALUES (29, 102, '102-09', 'Frontend Management Panel Design', '2', '2024-12-07 13:00:00', NULL, NULL, '2024-12-18 00:00:00', NULL, '0', '001', 6, 1, 4);
INSERT INTO `agile_subproject` VALUES (30, 102, '102-10', 'System Integration Testing', '2', '2024-12-08 14:00:00', NULL, NULL, '2024-12-20 00:00:00', NULL, '0', '001', 7, 1, 5);
INSERT INTO `agile_subproject` VALUES (31, 102, '102-11', 'User Training and Documentation', '2', '2024-12-09 15:00:00', NULL, NULL, '2024-12-22 00:00:00', NULL, '0', '001', 5, 2, 5);
INSERT INTO `agile_subproject` VALUES (32, 102, '102-12', 'Deployment and Monitoring Setup', '2', '2024-12-10 16:00:00', NULL, NULL, '2024-12-25 00:00:00', NULL, '0', '006', 10, 4, 6);
INSERT INTO `agile_subproject` VALUES (33, 102, '102-13', 'System Maintenance Plan Creation', '3', '2024-12-11 17:00:00', NULL, NULL, '2024-12-28 00:00:00', NULL, '0', '002', 6, 0, 6);
INSERT INTO `agile_subproject` VALUES (34, 103, '103-01', 'Promotion Rules Definition', '3', '2024-11-25 10:00:00', NULL, NULL, '2024-11-30 00:00:00', NULL, '0', '001', 4, 1, 1);
INSERT INTO `agile_subproject` VALUES (35, 103, '103-02', 'Backend Promotion Module Development', '2', '2024-11-27 11:00:00', NULL, NULL, '2024-12-05 00:00:00', NULL, '0', '001', 10, 1, 2);
INSERT INTO `agile_subproject` VALUES (36, 103, '103-03', 'Frontend Promotion Page Design', '2', '2024-11-28 12:00:00', NULL, NULL, '2024-12-07 00:00:00', NULL, '0', '001', 8, 3, 2);
INSERT INTO `agile_subproject` VALUES (37, 103, '103-04', 'Database Schema Update for Promotions', '3', '2024-12-01 13:00:00', NULL, NULL, '2024-12-10 00:00:00', NULL, '0', '001', 7, 3, 3);
INSERT INTO `agile_subproject` VALUES (38, 103, '103-05', 'High-Concurrency System Optimization', '2', '2024-12-02 14:00:00', NULL, NULL, '2024-12-12 00:00:00', NULL, '0', '002', 9, 2, 3);
INSERT INTO `agile_subproject` VALUES (39, 103, '103-06', 'Promotion Scheduler Development', '2', '2024-12-03 15:00:00', NULL, NULL, '2024-12-15 00:00:00', NULL, '0', '003', 7, 2, 3);
INSERT INTO `agile_subproject` VALUES (40, 103, '103-07', 'API Integration with Payment Module', '2', '2024-12-04 16:00:00', NULL, NULL, '2024-12-17 00:00:00', NULL, '0', '004', 8, 2, 4);
INSERT INTO `agile_subproject` VALUES (41, 103, '103-08', 'User Notifications Development', '3', '2024-12-05 17:00:00', NULL, NULL, '2024-12-20 00:00:00', NULL, '0', '005', 6, 5, 4);
INSERT INTO `agile_subproject` VALUES (42, 103, '103-09', 'Promotion Logs and Monitoring', '3', '2024-12-06 18:00:00', NULL, NULL, '2024-12-22 00:00:00', NULL, '0', '006', 5, 5, 4);
INSERT INTO `agile_subproject` VALUES (43, 103, '103-10', 'Frontend and Backend Testing', '2', '2024-12-07 19:00:00', NULL, NULL, '2024-12-25 00:00:00', NULL, '0', '001', 7, 4, 5);
INSERT INTO `agile_subproject` VALUES (44, 103, '103-11', 'Performance Testing for Promotions', '2', '2024-12-08 20:00:00', NULL, NULL, '2024-12-28 00:00:00', NULL, '0', '002', 6, 1, 5);
INSERT INTO `agile_subproject` VALUES (45, 103, '103-12', 'User Feedback Integration', '2', '2024-12-09 21:00:00', NULL, NULL, '2024-12-30 00:00:00', NULL, '0', '001', 4, 3, 6);
INSERT INTO `agile_subproject` VALUES (46, 103, '103-13', 'Final Deployment and Monitoring', '2', '2024-12-10 22:00:00', NULL, NULL, '2025-01-02 00:00:00', NULL, '0', '006', 10, 5, 7);
INSERT INTO `agile_subproject` VALUES (47, 104, '104-01', 'User Requirements Gathering', '3', '2024-12-01 09:00:00', NULL, NULL, '2024-12-03 00:00:00', NULL, '0', '001', 6, 1, 1);
INSERT INTO `agile_subproject` VALUES (48, 104, '104-02', 'UI/UX Prototyping', '2', '2024-12-02 10:00:00', NULL, NULL, '2024-12-05 00:00:00', NULL, '0', '001', 8, 2, 2);
INSERT INTO `agile_subproject` VALUES (49, 104, '104-03', 'User Authentication Module Development', '2', '2024-12-03 11:00:00', NULL, NULL, '2024-12-08 00:00:00', NULL, '0', '001', 10, 2, 2);
INSERT INTO `agile_subproject` VALUES (50, 104, '104-04', 'User Profile Management Module', '2', '2024-12-04 12:00:00', NULL, NULL, '2024-12-10 00:00:00', NULL, '0', '002', 9, 2, 3);
INSERT INTO `agile_subproject` VALUES (51, 104, '104-05', 'Friend Management System', '3', '2024-12-05 13:00:00', NULL, NULL, '2024-12-12 00:00:00', NULL, '0', '003', 7, 3, 3);
INSERT INTO `agile_subproject` VALUES (52, 104, '104-06', 'Content Posting and Sharing Module', '2', '2024-12-06 14:00:00', NULL, NULL, '2024-12-15 00:00:00', NULL, '0', '004', 8, 6, 5);
INSERT INTO `agile_subproject` VALUES (53, 104, '104-07', 'Push Notifications Implementation', '2', '2024-12-07 15:00:00', NULL, NULL, '2024-12-18 00:00:00', NULL, '0', '005', 6, 3, 4);
INSERT INTO `agile_subproject` VALUES (54, 104, '104-08', 'Backend Chat Service Development', '2', '2024-12-08 16:00:00', NULL, NULL, '2024-12-20 00:00:00', NULL, '0', '006', 9, 3, 4);
INSERT INTO `agile_subproject` VALUES (55, 104, '104-09', 'Data Encryption and Security Measures', '3', '2024-12-09 17:00:00', NULL, NULL, '2024-12-22 00:00:00', NULL, '0', '001', 7, 7, 8);
INSERT INTO `agile_subproject` VALUES (56, 104, '104-10', 'Application Performance Optimization', '2', '2024-12-10 18:00:00', NULL, NULL, '2024-12-25 00:00:00', NULL, '0', '001', 8, 5, 5);
INSERT INTO `agile_subproject` VALUES (57, 104, '104-11', 'Third-party Login and Payment Integration', '2', '2024-12-11 19:00:00', NULL, NULL, '2024-12-28 00:00:00', NULL, '0', '007', 6, 6, 7);
INSERT INTO `agile_subproject` VALUES (58, 104, '104-12', 'App Packaging and Store Release', '2', '2024-12-12 20:00:00', NULL, NULL, '2024-12-30 00:00:00', NULL, '0', '002', 5, 7, 6);
INSERT INTO `agile_subproject` VALUES (59, 104, '104-13', 'User Feedback Collection and Bug Fixing', '2', '2024-12-13 21:00:00', NULL, NULL, '2025-01-02 00:00:00', NULL, '0', '002', 6, 8, 9);
INSERT INTO `agile_subproject` VALUES (60, 104, '104-14', 'Continuous Updates and Versioning Plan', '2', '2024-12-14 22:00:00', NULL, NULL, '2025-01-05 00:00:00', NULL, '0', '003', 4, 9, 9);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-11-28 15:50:46', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-11-28 15:50:46', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-11-28 15:50:46', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-11-28 15:50:46', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-11-28 15:50:46', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-11-28 15:50:46', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'Dev_Team', 0, 'admin', '15888888888', 'ad@qq.com', '0', '0', 'admin', '2024-11-28 15:50:45', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-11-28 15:50:46', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-11-28 15:50:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-11-28 15:50:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-11-28 15:50:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-28 16:08:04');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 03:04:40');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-29 03:26:44');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 03:27:19');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 14:31:00');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 15:33:25');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-29 17:13:03');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 17:13:08');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 01:18:42');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 09:10:24');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:22:40');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:34:38');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:35:45');
INSERT INTO `sys_logininfor` VALUES (113, 'wanxi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-11-30 10:35:53');
INSERT INTO `sys_logininfor` VALUES (114, 'wanxilin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:35:58');
INSERT INTO `sys_logininfor` VALUES (115, 'wanxilin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:37:05');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:37:10');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:53:50');
INSERT INTO `sys_logininfor` VALUES (118, 'wanxilin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:53:59');
INSERT INTO `sys_logininfor` VALUES (119, 'wanxilin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:54:33');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:54:37');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:55:10');
INSERT INTO `sys_logininfor` VALUES (122, 'wanxi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:55:16');
INSERT INTO `sys_logininfor` VALUES (123, 'wanxi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 10:56:57');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 10:56:59');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-30 11:56:09');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 11:56:12');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 13:15:20');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 13:39:03');
INSERT INTO `sys_logininfor` VALUES (129, 'wanxi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 13:39:11');
INSERT INTO `sys_logininfor` VALUES (130, 'wanxi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 13:39:27');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 13:39:30');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 14:53:13');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 14:53:30');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 16:52:40');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 16:52:55');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 18:04:05');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 18:04:36');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 18:08:18');
INSERT INTO `sys_logininfor` VALUES (139, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 18:08:27');
INSERT INTO `sys_logininfor` VALUES (140, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 18:08:44');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 18:08:53');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 18:09:47');
INSERT INTO `sys_logininfor` VALUES (143, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 18:09:59');
INSERT INTO `sys_logininfor` VALUES (144, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2024-11-30 18:47:06');
INSERT INTO `sys_logininfor` VALUES (145, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 18:47:09');
INSERT INTO `sys_logininfor` VALUES (146, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 19:14:20');
INSERT INTO `sys_logininfor` VALUES (147, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 19:14:23');
INSERT INTO `sys_logininfor` VALUES (148, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 19:14:28');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 19:14:36');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-30 20:13:16');
INSERT INTO `sys_logininfor` VALUES (151, 'manager', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-30 20:13:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2007 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 'System', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:14', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, 'Monitor', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:35:41', '系统监控目录');
INSERT INTO `sys_menu` VALUES (100, 'User', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:18', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, 'Role', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:21', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, 'Menu', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:25', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, 'Department', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:30', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, 'Post', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:40', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, 'Dictionary', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:31:52', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, 'Parameter', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:32:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, 'Announcement', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:32:14', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, 'Log', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:32:23', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, 'Online Users', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:35:55', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, 'Tasks', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:36:10', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Druid', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:36:48', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, 'Server', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:36:59', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, 'Cache', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:36:37', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, 'Cache List', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-11-22 16:11:45', 'admin', '2024-11-22 17:37:05', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (1000, 'User Search', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, 'User Add', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, 'User Edit', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, 'User Delete', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, 'User Export', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, 'User Import', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, 'Reset Password', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, 'Role Search', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, 'Role Add', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, 'Role Edit', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, 'Role Delete', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, 'Role Export', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, 'Menu Search', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, 'Menu Add', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, 'Menu Edit', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, 'Menu Delete', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, 'Department Search', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, 'Department Add', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, 'Department Edit', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, 'Department Delete', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, 'Post Search', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, 'Post Add', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, 'Post Edit', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, 'Post Delete', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, 'Post Export', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, 'Dictionary Search', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, 'Dictionary Add', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, 'Dictionary Edit', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, 'Dictionary Delete', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, 'Dictionary Export', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, 'Parameter Search', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, 'Parameter Add', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, 'Parameter Edit', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, 'Parameter Delete', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, 'Parameter Export', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, 'Announce Search', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, 'Announce Add', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, 'Announce Edit', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, 'Announce Delete', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, 'Operation Search', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, 'Operation Delete', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, 'Log Export', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, 'Login Search', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, 'Login Delete', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, 'Log Export', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, 'Account Unlock', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, 'Online Search', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, 'Batch Force Logout', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, 'Task Search', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, 'Task Add', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, 'Task Edit', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, 'Task Delete', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, 'Status Edit', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, 'Task Export', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-11-22 16:11:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, 'Project Manage', 0, 0, 'project', '', NULL, '', 1, 0, 'M', '0', '0', '', 'checkbox', 'admin', '2024-11-29 04:21:10', 'admin', '2024-11-30 10:46:55', '');
INSERT INTO `sys_menu` VALUES (2004, 'Task Board', 2001, 1, 'kanban', 'kanban/kanban', NULL, '', 1, 0, 'C', '0', '0', '', 'row', 'admin', '2024-11-29 05:16:26', 'admin', '2024-11-30 14:21:17', '');
INSERT INTO `sys_menu` VALUES (2005, 'Visualization', 2001, 2, 'visualize', 'visualize/burndown_chart', NULL, '', 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2024-11-29 05:18:51', 'admin', '2024-11-29 16:18:31', '');
INSERT INTO `sys_menu` VALUES (2006, 'project', 2001, 0, 'list', 'project/index', NULL, '', 1, 0, 'C', '0', '0', '', 'list', 'admin', '2024-11-29 15:54:44', 'admin', '2024-11-30 10:47:28', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-11-28 15:50:46', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-11-28 15:50:46', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Kanban\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"kanban\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 03:38:24', 9);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-29 03:38:24\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Kanban\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"kanban\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 03:38:41', 6);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-29 03:38:24\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Kanban\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"kanban\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:03:34', 4);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kanban/index\",\"createTime\":\"2024-11-29 03:38:24\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Kanban\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"kanban\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:04:54', 5);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"task/index\",\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Task pool\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:21:10', 6);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"task/index\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Task pool\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:21:25', 4);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"task/index\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Task pool\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:24:58', 0);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"task/task-poll\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Task pool\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:27:32', 4);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Task pool\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:29:32', 6);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/subproject\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"subproject\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"subproject\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:30:41', 4);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Projects\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:32:56', 5);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"proejct/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Project list\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:33:54', 9);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Project Manage\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:34:06', 21);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/subproject\",\"createTime\":\"2024-11-29 04:30:41\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"subproject\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"subproject\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:34:14', 6);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"proejct/index\",\"createTime\":\"2024-11-29 04:33:54\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"Project list\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"list\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:34:23', 6);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 04:33:54\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"Project list\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"list\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:35:37', 11);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Project Manage\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:36:52', 6);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Project Manage\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:37:13', 5);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/subproject\",\"createTime\":\"2024-11-29 04:30:41\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"subproject\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"subproject\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:37:42', 6);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Project Manage\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"projects\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:49:12', 13);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/project_manage\",\"createTime\":\"2024-11-29 04:33:54\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"Project list\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"manage\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:49:56', 2);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/task_page\",\"createTime\":\"2024-11-29 04:30:41\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"subproject\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 04:50:24', 7);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/task_page\",\"createTime\":\"2024-11-29 04:30:41\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"Project info\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 05:15:11', 4);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kanban/index\",\"createBy\":\"admin\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Kanban\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"kanban\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 05:16:26', 9);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.agile.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 05:16:31', 11);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/burndown\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Viusalization\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"viusalize\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 05:18:51', 8);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/burndown\",\"createTime\":\"2024-11-29 05:18:51\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"Viusalization\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"viusalize\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 05:19:13', 4);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.agile.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"project\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 15:54:44', 4);
INSERT INTO `sys_oper_log` VALUES (128, '项目', 5, 'com.agile.web.controller.project.AgileProjectController.export()', 'POST', 1, 'admin', '研发部门', '/system/project/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-11-29 15:55:13', 796);
INSERT INTO `sys_oper_log` VALUES (129, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 15:59:35\",\"id\":2,\"managerId\":\"2\",\"managerName\":\"vc\",\"params\":{},\"projectId\":2,\"projectName\":\"p22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 15:59:35', 11);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 15:54:44\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"project\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:06:16', 8);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 15:54:44\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"project\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:06:26', 5);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/task_page\",\"createTime\":\"2024-11-29 04:30:41\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"Project info\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"tasks\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:06:36', 8);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 15:54:44\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"project\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:06:59', 8);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project_list/project_manage\",\"createTime\":\"2024-11-29 04:33:54\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"Project list\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"manage\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:07:04', 5);
INSERT INTO `sys_oper_log` VALUES (135, '项目', 3, 'com.agile.web.controller.project.AgileProjectController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/project/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:07:32', 6);
INSERT INTO `sys_oper_log` VALUES (136, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 16:07:53\",\"id\":3,\"managerId\":\"2\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":2,\"projectName\":\"p2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:07:53', 6);
INSERT INTO `sys_oper_log` VALUES (137, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 16:07:54\",\"delFlag\":\"0\",\"id\":3,\"managerId\":\"2\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":2,\"projectName\":\"p2\",\"updateTime\":\"2024-11-29 16:08:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:08:25', 11);
INSERT INTO `sys_oper_log` VALUES (138, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 16:09:00\",\"id\":4,\"managerId\":\"2\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":1,\"projectName\":\"p3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:09:00', 5);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"burndownchart/burndown\",\"createTime\":\"2024-11-29 05:18:51\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"Viusalization\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"viusalize\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:14:50', 4);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"visualize/burndownchart\",\"createTime\":\"2024-11-29 05:18:51\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"Viusalization\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"viusalize\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:16:22', 4);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.agile.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:16:29', 5);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.agile.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:16:33', 8);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kanban/index\",\"createTime\":\"2024-11-29 05:16:26\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"Kanban\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"kanban\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:17:18', 5);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"visualize/burndownchart\",\"createTime\":\"2024-11-29 05:18:51\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"Visualization\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"visualize\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:18:03', 9);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"visualize/burndown_chart\",\"createTime\":\"2024-11-29 05:18:51\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"Visualization\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"visualize\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 16:18:31', 9);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.agile.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-11-30 09:16:42', 13);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.agile.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-11-30 09:16:54', 11);
INSERT INTO `sys_oper_log` VALUES (148, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:23:39\",\"id\":1,\"params\":{},\"projectId\":1,\"subprojectId\":\"test\",\"subprojectName\":\"test1\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:23:39', 0);
INSERT INTO `sys_oper_log` VALUES (149, '子系统', 3, 'com.agile.web.controller.project.AgileSubprojectController.remove()', 'DELETE', 1, 'admin', '研发部门', '/project/subproject/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:23:50', 14);
INSERT INTO `sys_oper_log` VALUES (150, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"id\":2,\"params\":{},\"projectId\":1,\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:24:20', 8);
INSERT INTO `sys_oper_log` VALUES (151, '子系统', 5, 'com.agile.web.controller.project.AgileSubprojectController.export()', 'POST', 1, 'admin', '研发部门', '/project/subproject/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-11-30 09:24:44', 485);
INSERT INTO `sys_oper_log` VALUES (152, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"updateTime\":\"2024-11-30 09:30:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:30:03', 12);
INSERT INTO `sys_oper_log` VALUES (153, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"updateTime\":\"2024-11-30 09:37:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:37:01', 8);
INSERT INTO `sys_oper_log` VALUES (154, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"updateTime\":\"2024-11-30 09:51:35\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:51:35', 3);
INSERT INTO `sys_oper_log` VALUES (155, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"updateTime\":\"2024-11-30 09:58:51\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:58:51', 5);
INSERT INTO `sys_oper_log` VALUES (156, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"In Progress\",\"updateTime\":\"2024-11-30 09:59:17\",\"verifyTime\":\"2024-11-01\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.updateAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update agile_project          SET project_id = ?,             project_name = ?,             status = ?,             manager_id = ?,             manager_name = ?,             create_time = ?,                          update_time = ?,             verify_time = ?,                          del_flag = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2024-11-30 09:59:17', 30);
INSERT INTO `sys_oper_log` VALUES (157, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"In Progress\",\"updateTime\":\"2024-11-30 09:59:21\",\"verifyTime\":\"2024-11-01\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.updateAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update agile_project          SET project_id = ?,             project_name = ?,             status = ?,             manager_id = ?,             manager_name = ?,             create_time = ?,                          update_time = ?,             verify_time = ?,                          del_flag = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2024-11-30 09:59:21', 4);
INSERT INTO `sys_oper_log` VALUES (158, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"In Progress\",\"updateTime\":\"2024-11-30 09:59:25\",\"verifyTime\":\"2024-11-01\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.updateAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update agile_project          SET project_id = ?,             project_name = ?,             status = ?,             manager_id = ?,             manager_name = ?,             create_time = ?,                          update_time = ?,             verify_time = ?,                          del_flag = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2024-11-30 09:59:25', 5);
INSERT INTO `sys_oper_log` VALUES (159, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"In Progress\",\"updateTime\":\"2024-11-30 09:59:28\",\"verifyTime\":\"2024-11-01\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.updateAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update agile_project          SET project_id = ?,             project_name = ?,             status = ?,             manager_id = ?,             manager_name = ?,             create_time = ?,                          update_time = ?,             verify_time = ?,                          del_flag = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2024-11-30 09:59:28', 8);
INSERT INTO `sys_oper_log` VALUES (160, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"In Progress\",\"updateTime\":\"2024-11-30 09:59:32\",\"verifyTime\":\"2024-11-01\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.updateAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update agile_project          SET project_id = ?,             project_name = ?,             status = ?,             manager_id = ?,             manager_name = ?,             create_time = ?,                          update_time = ?,             verify_time = ?,                          del_flag = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2024-11-30 09:59:32', 0);
INSERT INTO `sys_oper_log` VALUES (161, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 16:07:54\",\"delFlag\":\"0\",\"id\":3,\"managerId\":\"2\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":2,\"projectName\":\"p2\",\"status\":\"On Hold\",\"updateTime\":\"2024-11-30 09:59:37\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.updateAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update agile_project          SET project_id = ?,             project_name = ?,             status = ?,             manager_id = ?,             manager_name = ?,             create_time = ?,                          update_time = ?,                                       del_flag = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2024-11-30 09:59:37', 6);
INSERT INTO `sys_oper_log` VALUES (162, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"2\",\"updateTime\":\"2024-11-30 09:59:50\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 09:59:50', 6);
INSERT INTO `sys_oper_log` VALUES (163, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"updateTime\":\"2024-11-30 10:01:36\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:01:36', 7);
INSERT INTO `sys_oper_log` VALUES (164, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"3\",\"updateTime\":\"2024-11-30 10:07:25\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:07:25', 5);
INSERT INTO `sys_oper_log` VALUES (165, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 16:07:54\",\"delFlag\":\"0\",\"id\":3,\"managerId\":\"2\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":2,\"projectName\":\"p2\",\"status\":\"2\",\"updateTime\":\"2024-11-30 10:07:31\",\"verifyTime\":\"2024-11-03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:07:31', 11);
INSERT INTO `sys_oper_log` VALUES (166, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-29 16:09:00\",\"delFlag\":\"0\",\"id\":4,\"managerId\":\"2\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":1,\"projectName\":\"p3\",\"status\":\"1\",\"updateTime\":\"2024-11-30 10:07:35\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:07:35', 5);
INSERT INTO `sys_oper_log` VALUES (167, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"id\":2,\"params\":{},\"projectId\":1,\"subStatus\":\"1\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 10:14:16\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:14:16', 5);
INSERT INTO `sys_oper_log` VALUES (168, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"id\":2,\"params\":{},\"projectId\":1,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 10:15:20\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:15:20', 5);
INSERT INTO `sys_oper_log` VALUES (169, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"id\":2,\"params\":{},\"projectId\":1,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 10:16:51\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:16:51', 5);
INSERT INTO `sys_oper_log` VALUES (170, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 10:17:12\",\"id\":3,\"params\":{},\"projectId\":1,\"subStatus\":\"2\",\"subprojectId\":\"111\",\"subprojectName\":\"test1\",\"verifyTime\":\"2024-11-29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:17:12', 6);
INSERT INTO `sys_oper_log` VALUES (171, '个人信息', 2, 'com.agile.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15885656565\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:22:14', 14);
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 1, 'com.agile.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"nickName\":\"wanxi\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":3,\"userName\":\"wanxilin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:35:08', 127);
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 4, 'com.agile.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:43:52', 9);
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 4, 'com.agile.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:44:01', 10);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-29 04:21:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"Project Manage\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"project\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:46:55', 20);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/index\",\"createTime\":\"2024-11-29 15:54:44\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"project\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"list\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:47:28', 17);
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 3, 'com.agile.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:54:49', 9);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 1, 'com.agile.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":4,\"userName\":\"wanxi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 10:55:05', 99);
INSERT INTO `sys_oper_log` VALUES (179, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 11:25:04\",\"id\":4,\"params\":{},\"projectId\":2,\"subStatus\":\"1\",\"subprojectId\":\"4\",\"subprojectName\":\"test1\",\"verifyTime\":\"2024-11-06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 11:25:04', 5);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kanban/index\",\"createTime\":\"2024-11-29 05:16:26\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"Task Board\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"kanban\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 11:56:39', 6);
INSERT INTO `sys_oper_log` VALUES (181, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"updateTime\":\"2024-11-30 13:36:03\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 13:36:03', 17);
INSERT INTO `sys_oper_log` VALUES (182, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 13:58:40\",\"id\":5,\"params\":{},\"projectId\":1,\"subStatus\":\"1\",\"subprojectId\":\"11\",\"subprojectName\":\"test123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 13:58:40', 15);
INSERT INTO `sys_oper_log` VALUES (183, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"updateTime\":\"2024-11-30 14:05:29\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:05:29', 7);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kanban/kanban\",\"createTime\":\"2024-11-29 05:16:26\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"Task Board\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"kanban\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:21:17', 11);
INSERT INTO `sys_oper_log` VALUES (185, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":20,\"updateTime\":\"2024-11-30 14:29:36\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:29:36', 22);
INSERT INTO `sys_oper_log` VALUES (186, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":20,\"updateTime\":\"2024-11-30 14:29:41\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:29:41', 8);
INSERT INTO `sys_oper_log` VALUES (187, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":20,\"updateTime\":\"2024-11-30 14:33:03\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:33:03', 9);
INSERT INTO `sys_oper_log` VALUES (188, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":20,\"updateTime\":\"2024-11-30 14:34:15\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:34:15', 6);
INSERT INTO `sys_oper_log` VALUES (189, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":20,\"updateTime\":\"2024-11-30 14:34:21\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:34:21', 8);
INSERT INTO `sys_oper_log` VALUES (190, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":20,\"updateTime\":\"2024-11-30 14:35:29\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:35:29', 5);
INSERT INTO `sys_oper_log` VALUES (191, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"id\":2,\"memberId\":\"11\",\"params\":{},\"projectId\":1,\"storyPoint\":0,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 14:35:56\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:35:56', 12);
INSERT INTO `sys_oper_log` VALUES (192, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":14,\"updateTime\":\"2024-11-30 14:42:48\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:42:48', 7);
INSERT INTO `sys_oper_log` VALUES (193, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:43:41\",\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":123,\"projectName\":\"testest\",\"status\":\"1\",\"totalCycle\":45}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.insertAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into agile_project          ( project_id,             project_name,             status,             manager_id,             manager_name,             create_time,                                                                                           total_cycle )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\n; Field \'current_cycle\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value', '2024-11-30 14:43:41', 7);
INSERT INTO `sys_oper_log` VALUES (194, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:43:48\",\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":123,\"projectName\":\"testest\",\"status\":\"1\",\"totalCycle\":45}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.insertAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into agile_project          ( project_id,             project_name,             status,             manager_id,             manager_name,             create_time,                                                                                           total_cycle )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\n; Field \'current_cycle\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value', '2024-11-30 14:43:48', 0);
INSERT INTO `sys_oper_log` VALUES (195, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:44:14\",\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":123,\"projectName\":\"testest\",\"status\":\"1\",\"totalCycle\":45}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.insertAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into agile_project          ( project_id,             project_name,             status,             manager_id,             manager_name,             create_time,                                                                                           total_cycle )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\n; Field \'current_cycle\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value', '2024-11-30 14:44:14', 1);
INSERT INTO `sys_oper_log` VALUES (196, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:44:57\",\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":123,\"projectName\":\"testest\",\"status\":\"1\",\"totalCycle\":45}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.insertAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into agile_project          ( project_id,             project_name,             status,             manager_id,             manager_name,             create_time,                                                                                           total_cycle )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\n; Field \'current_cycle\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value', '2024-11-30 14:44:57', 4);
INSERT INTO `sys_oper_log` VALUES (197, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:45:10\",\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":123,\"projectName\":\"testest\",\"status\":\"1\",\"totalCycle\":45}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.insertAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into agile_project          ( project_id,             project_name,             status,             manager_id,             manager_name,             create_time,                                                                                           total_cycle )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\n; Field \'current_cycle\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value', '2024-11-30 14:45:10', 3);
INSERT INTO `sys_oper_log` VALUES (198, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:53:13\",\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":11,\"projectName\":\"test1234\",\"status\":\"1\",\"totalCycle\":60}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\11976\\OneDrive\\Desktop\\se\\project\\code\\CS5351-SE-Project\\agile-system\\target\\classes\\mapper\\app\\AgileProjectMapper.xml]\r\n### The error may involve com.agile.app.mapper.AgileProjectMapper.insertAgileProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into agile_project          ( project_id,             project_name,             status,             manager_id,             manager_name,             create_time,                                                                                           total_cycle )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value\n; Field \'current_cycle\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'current_cycle\' doesn\'t have a default value', '2024-11-30 14:53:13', 212578);
INSERT INTO `sys_oper_log` VALUES (199, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":14,\"updateTime\":\"2024-11-30 14:53:42\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:53:42', 25);
INSERT INTO `sys_oper_log` VALUES (200, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":0,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":14,\"updateTime\":\"2024-11-30 14:53:51\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:53:51', 10);
INSERT INTO `sys_oper_log` VALUES (201, '项目', 2, 'com.agile.web.controller.project.AgileProjectController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-19 02:05:04\",\"currentCycle\":4,\"delFlag\":\"0\",\"id\":1,\"managerId\":\"admin\",\"managerName\":\"zicky\",\"params\":{},\"projectId\":111,\"projectName\":\"test1\",\"status\":\"1\",\"totalCycle\":14,\"updateTime\":\"2024-11-30 14:54:50\",\"verifyTime\":\"2024-11-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:54:50', 6);
INSERT INTO `sys_oper_log` VALUES (202, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 14:55:40\",\"currentCycle\":66,\"id\":5,\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":1,\"projectName\":\"231\",\"status\":\"2\",\"totalCycle\":220}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:55:40', 10);
INSERT INTO `sys_oper_log` VALUES (203, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"id\":2,\"memberId\":\"11\",\"params\":{},\"projectId\":1,\"storyPoint\":0,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 14:56:00\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:56:00', 7);
INSERT INTO `sys_oper_log` VALUES (204, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"finishedCycle\":\"123\",\"id\":2,\"memberId\":\"11\",\"params\":{},\"projectId\":1,\"storyPoint\":1,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 14:58:18\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:58:18', 15);
INSERT INTO `sys_oper_log` VALUES (205, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 10:17:12\",\"delFlag\":\"0\",\"id\":3,\"memberId\":\"4\",\"params\":{},\"projectId\":1,\"storyPoint\":0,\"subStatus\":\"2\",\"subprojectId\":\"111\",\"subprojectName\":\"test1\",\"updateTime\":\"2024-11-30 14:58:50\",\"verifyTime\":\"2024-11-29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 14:58:50', 5);
INSERT INTO `sys_oper_log` VALUES (206, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"finishedCycle\":\"123\",\"id\":2,\"memberId\":\"11\",\"params\":{},\"projectId\":1,\"storyPoint\":1,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 15:07:28\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 15:07:28', 8);
INSERT INTO `sys_oper_log` VALUES (207, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 09:24:20\",\"delFlag\":\"1\",\"expectedCycle\":\"56\",\"finishedCycle\":\"123\",\"id\":2,\"memberId\":\"11\",\"params\":{},\"projectId\":1,\"storyPoint\":1,\"subStatus\":\"2\",\"subprojectId\":\"1\",\"subprojectName\":\"1\",\"updateTime\":\"2024-11-30 15:12:26\",\"verifyTime\":\"2024-11-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 15:12:26', 48);
INSERT INTO `sys_oper_log` VALUES (208, '子系统', 2, 'com.agile.web.controller.project.AgileSubprojectController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 10:17:12\",\"delFlag\":\"0\",\"expectedCycle\":\"0\",\"finishedCycle\":\"45\",\"id\":3,\"memberId\":\"4\",\"params\":{},\"projectId\":1,\"storyPoint\":0,\"subStatus\":\"2\",\"subprojectId\":\"111\",\"subprojectName\":\"test1\",\"updateTime\":\"2024-11-30 15:12:33\",\"verifyTime\":\"2024-11-29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 15:12:33', 11);
INSERT INTO `sys_oper_log` VALUES (209, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 15:12:48\",\"expectedCycle\":\"1\",\"finishedCycle\":\"45\",\"id\":6,\"memberId\":\"1\",\"params\":{},\"projectId\":1,\"storyPoint\":1,\"subStatus\":\"1\",\"subprojectId\":\"1\",\"subprojectName\":\"test123124\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 15:12:48', 15);
INSERT INTO `sys_oper_log` VALUES (210, '项目', 3, 'com.agile.web.controller.project.AgileProjectController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/project/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 16:41:08', 15);
INSERT INTO `sys_oper_log` VALUES (211, '项目', 1, 'com.agile.web.controller.project.AgileProjectController.add()', 'POST', 1, 'admin', '研发部门', '/system/project', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 16:55:53\",\"currentCycle\":1,\"id\":6,\"managerId\":\"1\",\"managerName\":\"wanxi\",\"params\":{},\"projectId\":9,\"projectName\":\"test9\",\"status\":\"1\",\"totalCycle\":10,\"verifyTime\":\"2024-11-27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 16:55:53', 2616);
INSERT INTO `sys_oper_log` VALUES (212, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 16:56:49\",\"expectedCycle\":1,\"finishedCycle\":2,\"id\":7,\"memberId\":\"1\",\"params\":{},\"projectId\":9,\"storyPoint\":40,\"subStatus\":\"1\",\"subprojectId\":\"1\",\"subprojectName\":\"id1\",\"verifyTime\":\"2024-11-29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 16:56:49', 25);
INSERT INTO `sys_oper_log` VALUES (213, '子系统', 1, 'com.agile.web.controller.project.AgileSubprojectController.add()', 'POST', 1, 'admin', '研发部门', '/project/subproject', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-30 16:57:29\",\"expectedCycle\":2,\"finishedCycle\":3,\"id\":8,\"memberId\":\"1\",\"params\":{},\"projectId\":9,\"storyPoint\":60,\"subStatus\":\"1\",\"subprojectId\":\"2\",\"subprojectName\":\"id2\",\"verifyTime\":\"2024-11-29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 16:57:29', 11);
INSERT INTO `sys_oper_log` VALUES (214, '子系统', 3, 'com.agile.web.controller.project.AgileSubprojectController.remove()', 'DELETE', 1, 'admin', '研发部门', '/project/subproject/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 16:57:41', 24);
INSERT INTO `sys_oper_log` VALUES (215, '子系统', 3, 'com.agile.web.controller.project.AgileSubprojectController.remove()', 'DELETE', 1, 'admin', '研发部门', '/project/subproject/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 16:57:45', 17);
INSERT INTO `sys_oper_log` VALUES (216, '角色管理', 1, 'com.agile.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2006,2004,2005],\"params\":{},\"roleId\":3,\"roleKey\":\"manager\",\"roleName\":\"xx经理\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 18:06:35', 41);
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 1, 'com.agile.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"我是经理\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":5,\"userName\":\"manager\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 18:08:10', 88);
INSERT INTO `sys_oper_log` VALUES (218, '角色管理', 2, 'com.agile.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-11-30 18:06:35\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2006,2004,2005],\"params\":{},\"roleId\":3,\"roleKey\":\"manager\",\"roleName\":\"xx经理\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 18:09:25', 27);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 2, 'com.agile.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-11-30 18:08:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-11-30 18:08:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"我是经理\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"manager\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 18:09:41', 11);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.agile.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-22 16:11:45\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:11:49', 13);
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 2, 'com.agile.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-11-30 18:08:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"Dev_Team\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-11-30 20:13:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"manager\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"manager\",\"roleName\":\"xx经理\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"manager\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:21:57', 16);
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 2, 'com.agile.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-11-30 18:06:35\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2006,2004,2005],\"params\":{},\"roleId\":3,\"roleKey\":\"manager\",\"roleName\":\"MG\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:22:38', 13);
INSERT INTO `sys_oper_log` VALUES (223, '角色管理', 2, 'com.agile.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-11-28 15:50:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"user\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:23:00', 20);
INSERT INTO `sys_oper_log` VALUES (224, '岗位管理', 2, 'com.agile.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-28 15:50:45\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"CEO\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:29:14', 20);
INSERT INTO `sys_oper_log` VALUES (225, '岗位管理', 2, 'com.agile.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-28 15:50:45\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"MANAGER\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:29:19', 16);
INSERT INTO `sys_oper_log` VALUES (226, '岗位管理', 2, 'com.agile.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-28 15:50:45\",\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postId\":3,\"postName\":\"HR\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:29:25', 16);
INSERT INTO `sys_oper_log` VALUES (227, '岗位管理', 2, 'com.agile.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-28 15:50:45\",\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postId\":4,\"postName\":\"USER\",\"postSort\":4,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-30 22:29:32', 10);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', 'CEO', 1, '0', 'admin', '2024-11-28 15:50:45', 'admin', '2024-11-30 22:29:14', '');
INSERT INTO `sys_post` VALUES (2, 'se', 'MANAGER', 2, '0', 'admin', '2024-11-28 15:50:45', 'admin', '2024-11-30 22:29:19', '');
INSERT INTO `sys_post` VALUES (3, 'hr', 'HR', 3, '0', 'admin', '2024-11-28 15:50:45', 'admin', '2024-11-30 22:29:25', '');
INSERT INTO `sys_post` VALUES (4, 'user', 'USER', 4, '0', 'admin', '2024-11-28 15:50:45', 'admin', '2024-11-30 22:29:32', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-11-28 15:50:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, 'user', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-11-28 15:50:45', 'admin', '2024-11-30 22:23:00', '普通角色');
INSERT INTO `sys_role` VALUES (3, 'MG', 'manager', 0, '1', 1, 1, '0', '0', 'admin', '2024-11-30 18:06:35', 'admin', '2024-11-30 22:22:38', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 2001);
INSERT INTO `sys_role_menu` VALUES (3, 2004);
INSERT INTO `sys_role_menu` VALUES (3, 2005);
INSERT INTO `sys_role_menu` VALUES (3, 2006);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15885656565', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-30 19:14:36', 'admin', '2024-11-28 15:50:45', '', '2024-11-30 19:14:36', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-28 15:50:45', 'admin', '2024-11-28 15:50:45', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 102, 'wanxilin', 'wanxi', '00', '', '', '0', '', '$2a$10$ETlEG8Y89X/HrfyaqRQTgeM//U6hRfWSiRsRi9hTQsA0/TCW3Vp3e', '0', '2', '127.0.0.1', '2024-11-30 10:53:59', 'admin', '2024-11-30 10:35:08', '', '2024-11-30 10:53:59', NULL);
INSERT INTO `sys_user` VALUES (4, NULL, 'wanxi', '1', '00', '', '', '0', '', '$2a$10$x0BhmsyVOxSpPoKo7wiHfutPUQvawieEcb.13JAjblK2tpsescGDS', '0', '0', '127.0.0.1', '2024-11-30 13:39:12', 'admin', '2024-11-30 10:55:05', '', '2024-11-30 13:39:11', NULL);
INSERT INTO `sys_user` VALUES (5, 100, 'manager', 'manager', '00', '', '', '0', '', '$2a$10$1k3IQG.1NfjhIh6tNL9cZO.IVef80sTjGqmEh0AYIjngn5wQcfl2q', '0', '0', '127.0.0.1', '2024-11-30 20:13:24', 'admin', '2024-11-30 18:08:10', 'admin', '2024-11-30 22:21:57', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (5, 3);

SET FOREIGN_KEY_CHECKS = 1;
