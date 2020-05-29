/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : mm

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/05/2020 11:07:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for query_article
-- ----------------------------
DROP TABLE IF EXISTS `query_article`;
CREATE TABLE `query_article`  (
  `article_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID：[1,2147483647]用于查看文章详情时显示相关评论',
  `result_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查询结果ID：[1,32767]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章标题：[0,125]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章描述：[0,255]',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章链接：[0,255]',
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章页面代码：',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询文章：保存查询到的文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for query_article_appraise
-- ----------------------------
DROP TABLE IF EXISTS `query_article_appraise`;
CREATE TABLE `query_article_appraise`  (
  `appraise_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评价ID：[1,2147483647]',
  `task_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务分组ID：[1,32767]用于对应批测任务查询统计',
  `article_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章ID：[1,2147483647]用于查看文章详情时显示相关评论',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '测评人ID：[1,2147483647]用于识别是哪个用户测评的',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价得分：[0,9]-1差劲；0一般；2评良；3优秀；4完美',
  `important` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强调：[0,1]表示测评者觉得该文章需重视，表示该文可能比较有用',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`appraise_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询文章评价：保存对单条文章的测评' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for query_result
-- ----------------------------
DROP TABLE IF EXISTS `query_result`;
CREATE TABLE `query_result`  (
  `result_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '查询结果ID：[1,2147483647]',
  `task_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查询任务ID：[1,32767]用于批测判断',
  `time` time(0) NOT NULL DEFAULT '00:00:00' COMMENT '查询时间点：是什么时候查询的',
  `engine` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '搜索引擎：[0,8]腾讯医典、百度、搜过、360',
  `city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询城市：[0,16]用于记录查询时的城市',
  `query` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询词条：[0,125]用于记录是通过什么内容查询的',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询IP：[0,32]用于记录当前查询所在的IP地址',
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查询结果代码：为搜索结果列表',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`result_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询结果：保存查询结果、用于批测做准备' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for query_result_compare
-- ----------------------------
DROP TABLE IF EXISTS `query_result_compare`;
CREATE TABLE `query_result_compare`  (
  `compare_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '对比ID：[1,2147483647]用于查询判断用户对比测评结果',
  `task_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务ID：[1,32767]用于对应批测任务查询统计',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '测评人ID：[1,2147483647]用于识别是哪个用户测评的',
  `result_id_left` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对比结果1ID：[1,2147483647]用于识别谁和谁对比',
  `result_id_right` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对比结果2ID：[1,2147483647]用于识别谁和谁对比',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价得分：[0,9]-1差劲；0一般；2评良；3优秀；4完美',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`compare_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询结果对比：保存查询词条对比测评数据' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for query_task
-- ----------------------------
DROP TABLE IF EXISTS `query_task`;
CREATE TABLE `query_task`  (
  `task_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '查询任务ID：[1,32767]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,9]1待抓取、2抓取中、3待测评、4已关闭',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID：[1,2147483647]',
  `people_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参与批测人数：[0,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称：[0,16]',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注：',
  `query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查询词条集合：',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`task_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '查询任务：关联多个词条，用于批测' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
