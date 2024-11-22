/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50725 (5.7.25-log)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 50725 (5.7.25-log)
 File Encoding         : 65001

 Date: 19/11/2024 04:23:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agile_member
-- ----------------------------
DROP TABLE IF EXISTS `agile_member`;
CREATE TABLE `agile_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `member_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '项目负责人id(user_name)',
  `member_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '负责人名字(nick_name)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agile_member
-- ----------------------------

-- ----------------------------
-- Table structure for agile_project
-- ----------------------------
DROP TABLE IF EXISTS `agile_project`;
CREATE TABLE `agile_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目名',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目状态(1进行中，2已完结)',
  `manager_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '项目负责人id(user_name)',
  `manager_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '负责人名字(nick_name)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记，0正常，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agile_project
-- ----------------------------
INSERT INTO `agile_project` VALUES (1, 111, 'test1', NULL, 'admin', 'zicky', '2024-11-19 02:05:04', NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for agile_subproject
-- ----------------------------
DROP TABLE IF EXISTS `agile_subproject`;
CREATE TABLE `agile_subproject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `subproject_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '子项目id',
  `subproject_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '子项目名字',
  `sub_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '子项目状态(0待处理，1进行中，2已完结)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记，0正常，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agile_subproject
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
