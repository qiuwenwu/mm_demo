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

 Date: 29/05/2020 11:19:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_action_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_action_log`;
CREATE TABLE `activity_action_log`  (
  `action_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '操作行为ID：[1,2147483647]',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `func_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参操函数名：[0,32]',
  `uin_action` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者uin：[0,65]',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法：[0,255]',
  `log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作记录：',
  PRIMARY KEY (`action_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动操作日志：记录谁操作过什么' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_info`;
CREATE TABLE `activity_info`  (
  `activity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动ID：[1,2147483647]',
  `period_num` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '活动周期数：[0,999]即多少天或多少年为一个周期',
  `period_unit` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '活动周期单位：[0,16]1为日、2为周、3为月、4为年',
  `prize_1` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一等奖：[0,32767]为奖品item_id',
  `prize_2` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二等奖：[0,32767]为奖品item_id',
  `prize_3` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三等奖：[0,32767]为奖品item_id',
  `prize_t` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '特等奖：[0,32767]为奖品item_id',
  `num_people` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参与人数：[0,2147483647]',
  `num_winner` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中奖人数：[0,2147483647]',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `time_start` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '开始时间：',
  `time_end` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '结束时间：',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动名称：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动类型：[0,16]',
  `uin_creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者uin：[0,64]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动标题：[0,125]',
  `descrtption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动描述：[0,255]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动详情：',
  `num_applicant` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请次数统计：[0,2147483647]',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动信息：用来编辑添加活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_item
-- ----------------------------
DROP TABLE IF EXISTS `activity_item`;
CREATE TABLE `activity_item`  (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '物品ID：[1,2147483647]',
  `price` double(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '物品价值：',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '物品剩余数量：[0,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物品名称：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品类型：[0,16]',
  `creator_uin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者uin：[0,64]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品标题：[0,125]',
  `descrtption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品描述：[0,255]',
  `img_cover` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面图：传base64',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动奖品：用来办法给用户的奖品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_user_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_user_info`;
CREATE TABLE `activity_user_info`  (
  `info_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表单ID：[1,2147483647]填表时的ID，用于查改表单',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户验证状态：[0,9]1待审核，2已认证，3未通过，4黑名单',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码：[0,11]',
  `liaison_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人号码：[0,11]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参与人姓名：[0,16]',
  `idcard` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证号：[0,32]',
  `liaison_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人姓名：[0,16]',
  `uin_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户唯一标识：[0,64]用来识别用户',
  `uin_checker` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人uin：[0,64]',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在位置：[0,255]用户所在位置，同时用来接收快递，传省市区',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址：[0,64]',
  `idcard_img_a` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '身份证正面照：传base64字符串',
  `idcard_img_b` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '身份证反面照：传base64字符串',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他补充信息：',
  `img_prove` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院证明：',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参与者信息：用来记录参与的用户的个人信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for activity_user_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_user_log`;
CREATE TABLE `activity_user_log`  (
  `log_id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '参与者记录：[1,2147483647]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '领取状态：[0,9]1待抽奖，2待派送，3已寄出，4已签收，5已领奖',
  `prize_1` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一等奖：[0,32767]为奖品item_id',
  `prize_2` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二等奖：[0,32767]为奖品item_id',
  `prize_3` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三等奖：[0,32767]为奖品item_id',
  `prize_t` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '特等奖：[0,32767]为奖品item_id',
  `activity_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动ID：[1,2147483647]用来识别是那个活动',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `uin_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户唯一标识：[0,64]',
  `uin_prize winners` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颁奖者uin：[0,64]',
  `img_prove` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动证明：',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动参与记录：用来记录参与活动的人和中奖情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbs_config
-- ----------------------------
DROP TABLE IF EXISTS `bbs_config`;
CREATE TABLE `bbs_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbs_thread
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread`;
CREATE TABLE `bbs_thread`  (
  `thread_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该主题',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[1,5]1正常，2推荐，3认证，4官方，5违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主题分类ID：[1,1000]用来搜索指定类型的主题',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该主题所属频道，仅该频道列表可以看到该主题',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,10000]决定主题显示的顺序',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方主题，可以通过该ID筛看',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑这篇主题到本站的用户ID',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇主题的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `collect_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '采集规则ID：[1,1000000000]如果主题是通过采集的方式获得，那么具有采集ID',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题：[0,125]用于主题和html的<title>标签中',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于主题提纲和搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于主题列表页，多个封面图用换行分隔',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该主题的网站',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注主题所属相关内容，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：主题的主体内容',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`thread_id`, `title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区主题：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbs_thread_channel
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread_channel`;
CREATE TABLE `bbs_thread_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'article' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、article主题、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和主题都使用的样式',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题板块：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbs_thread_comment
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread_comment`;
CREATE TABLE `bbs_thread_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `thread_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属主题id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题评论：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbs_thread_type
-- ----------------------------
DROP TABLE IF EXISTS `bbs_thread_type`;
CREATE TABLE `bbs_thread_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题分类：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `article_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该文章',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[1,5]1正常，2推荐，3认证，4官方，5违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章分类ID：[1,1000]用来搜索指定类型的文章',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,10000]决定文章显示的顺序',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该文章所属频道，仅该频道列表可以看到该文章',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑这篇文章到本站的用户ID',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方文章，可以通过该ID筛看',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇文章的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `collect_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '采集规则ID：[1,1000000000]如果文章是通过采集的方式获得，那么具有采集ID',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `author` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者：[0,16]写出该文章的人',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题：[0,125]用于文章和html的<title>标签中',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于文章提纲和搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于文章列表页，多个封面图用换行分隔',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：文章的主体内容',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`article_id`, `title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章：用于内容管理系统的文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_article_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_channel`;
CREATE TABLE `cms_article_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'article' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、article文章、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和文章都使用的样式',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章频道：用于汇总浏览文章，在不同频道下展示不同文章。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_comment`;
CREATE TABLE `cms_article_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `article_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属文章id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章评论：用于记录读者对某文章的评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_article_section
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_section`;
CREATE TABLE `cms_article_section`  (
  `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '内容模块ID：[1,2147483647]',
  `article_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对应文章ID：[1,2147483647]',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节标题：[0,255]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '章节内容：',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '章节图片：',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '章节标签：[0,255]',
  PRIMARY KEY (`content_id`, `title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章章节：文章的正文是单独一块保存的，一个个章节保存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_article_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_type`;
CREATE TABLE `cms_article_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类：将文章归类，可选看不同类型的文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_analyse
-- ----------------------------
DROP TABLE IF EXISTS `coin_analyse`;
CREATE TABLE `coin_analyse`  (
  `analyse_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分析ID：[1,2147483647]用来查询和修改结果',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重得分：[-99,99]',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `datetime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '当日时间：指数字货币当天',
  `policy_buy` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策买入：分值越高，别是越应该买入',
  `policy_hold` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策留守：分值越高，别是越应该留守',
  `policy_sell` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策卖出：分值越高，别是越应该卖出',
  `presage_today` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示今日：[-99,99]今日涨跌评分，负分看跌，正分看涨',
  `presage_recently` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示近日：[-99,99]近3日涨跌评分，负分看跌，正分看涨',
  `presage_next` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示后市：[-99,99]之后涨跌走势评分，负分看跌，正分看涨',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数字货币代码：[0,16]',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析名称',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行方式：[0,16]买、卖、留',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知近日和将来走势',
  PRIMARY KEY (`analyse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币分析：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_formula
-- ----------------------------
DROP TABLE IF EXISTS `coin_formula`;
CREATE TABLE `coin_formula`  (
  `formula_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公式ID：[1,2147483647]',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重：[0,99]权重决定买卖和看涨看跌',
  `policy` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方针：[0,4]只想操作方式',
  `tense` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析时态：[0,8]同时过去还是今时、今日数据分析。now今时、today今日、past昔日',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公式名称：[0,16]技术分析名称',
  `filter` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤：[0,16]当出现该技术分析时结果时，其他某个分析结果将无效，所以将其过滤调',
  `presage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预示：[0,255]今日、近日、之后走势的看涨、看跌',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公式简介：[0,255]介绍该公式是什么技术分析的',
  `express` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数字货币公式：用于分析走势，返回逻辑值',
  PRIMARY KEY (`formula_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币公式：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_info
-- ----------------------------
DROP TABLE IF EXISTS `coin_info`;
CREATE TABLE `coin_info`  (
  `coin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数字货币ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数字货币名称：[0,16]',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数字货币代码：[0,12]',
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数字货币简介：[0,255]',
  `bonus` double(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分红频率：1年1次为1.0；2年一次为0.5；3年一次为0.33；不分红为0',
  `issue_price` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '：',
  `pe` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市盈率：',
  `pb` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市净率：',
  `profit` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '公司利润：如果为0或负数，表示公司不盈利',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发行量：[0,2147483647]单位(万股)',
  `time_to_market` date NOT NULL DEFAULT '1970-01-01' COMMENT '上市时间：',
  PRIMARY KEY (`coin_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_market
-- ----------------------------
DROP TABLE IF EXISTS `coin_market`;
CREATE TABLE `coin_market`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数字货币代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `coin_subscribe`;
CREATE TABLE `coin_subscribe`  (
  `subscribe_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅ID：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅用户ID：[1,8388607]',
  `time1` time(0) NOT NULL DEFAULT '10:00:00' COMMENT '通知时段1：默认为开盘后半小时，一般通知什么数字货币要卖',
  `time2` time(0) NOT NULL DEFAULT '13:00:00' COMMENT '通知时段2：默认为下午开盘时间，一般通知什么数字货币要卖',
  `time3` time(0) NOT NULL DEFAULT '14:30:00' COMMENT '通知时段3：默认为收盘前半小时。一般通知什么数字货币要买',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wechat' COMMENT '订阅方式：[0,12]phone手机短信、email邮箱、wechat微信公众号、app应用端',
  `stocks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订阅的数字货币：[0,255]',
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币订阅：用于记录用户订阅的数字货币，便于定时通知技术分析和走势' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_config
-- ----------------------------
DROP TABLE IF EXISTS `mall_config`;
CREATE TABLE `mall_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_product
-- ----------------------------
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product`  (
  `product_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该产品',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,5]1出售中，2预售中，3已下架，4已删除，5已违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品分类ID：[1,1000]用来搜索指定类型的产品',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,10000]决定产品显示的顺序',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该产品所属频道，仅该频道列表可以看到该产品',
  `shop_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID：[1,8388607]该商品所属的店铺',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方产品，可以通过该ID筛看',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇产品的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `price` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '卖价：[1]',
  `price_old` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价：[1]',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题：[0,125]用于产品和html的<title>标签中',
  `keywords` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,125]用于搜索引擎收录',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于产品提纲和搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于产品列表页，多个封面图用换行分隔',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注产品所属相关内容，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：产品的主体内容',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  `brand` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌：[0,18]商品的品牌',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_product_channel
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_channel`;
CREATE TABLE `mall_product_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` mediumint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'product' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、product产品、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和产品都使用的样式',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '频道图标：',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品专区：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_comment`;
CREATE TABLE `mall_product_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `product_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属产品id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_product_property
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_property`;
CREATE TABLE `mall_product_property`  (
  `property_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`property_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_product_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_type`;
CREATE TABLE `mall_product_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_shop
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop`;
CREATE TABLE `mall_shop`  (
  `shop_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺id：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后前台才会显示该店铺',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,5]1营业中，2已歇业，3已关店，4已删除，5已违规',
  `type_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺分类ID：[1,1000]用来搜索指定类型的店铺',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序：[0,1000]决定店铺显示的顺序',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '频道ID：[1,10000]该店铺所属频道，仅该频道列表可以看到该店铺',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]对于一些地方店铺，可以通过该ID筛看',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所属人ID：[1,8388607]即该店铺是属于哪个用户的',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度：[0,1000000000]访问这篇店铺的人次',
  `praise` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞次数：[0,1000000000]',
  `time_create` datetime(0) NOT NULL DEFAULT '1997-01-01 00:00:00' COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题：[0,125]用于店铺和html的<title>标签中',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]用于店铺提纲和搜索引擎收录',
  `keywords` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,64]用于搜索引擎收录',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图：[0,255]用于显示于店铺列表页，多个封面图用换行分隔',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注店铺所属相关内容，多个标签用空格隔开',
  `collecter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏者：多个收藏者用”,“分隔',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_shop_channel
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop_channel`;
CREATE TABLE `mall_shop_channel`  (
  `channel_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID：[1,10000]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用后才可以看到该频道',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：[0,1]隐藏非管理员该频道无法查看. 0为不隐藏，1为隐藏',
  `can_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可评论：[0,1]不可评论则用户只能看，无法点评。0为不可评论，1为可评论',
  `display` mediumint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定频道显示的先后顺序',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,10000]在频道列表操作时，当上级频道展开时，才显示该频道',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市：[1,8388607]一些地方频道，可以通过该条判断是否可查看',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'shop' COMMENT '频道类型：[0,16]question问答、info资讯、news新闻、shop店铺、activity活动',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '频道名称：[2,16]',
  `template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风格模板：[0,64]频道和店铺都使用的样式',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '频道图标：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该频道是跳转到其他网站的情况下，就在该URL上设置',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该频道的作用',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺专区：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_shop_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop_comment`;
CREATE TABLE `mall_shop_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id：[1,2147483647]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：[0,1]启用则显示该评论',
  `score` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分：[0,5]最低1分、最多5分',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示排序：[0,1000]决定显示的顺序',
  `shop_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '所属店铺id：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]编辑评论的用户ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者姓名：[2,16]用于实名回复',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签：[0,64]评论人给的标签，多个标签用空格隔开',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文：评论内容',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论回复：对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺评论：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_shop_type`;
CREATE TABLE `mall_shop_type`  (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺分类ID：[1,30000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `channel_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '频道ID：[1,10000]',
  `father_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[1,32767]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称：[0,16]',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类图标：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述：[0,255]',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺分类：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for number_info
-- ----------------------------
DROP TABLE IF EXISTS `number_info`;
CREATE TABLE `number_info`  (
  `number_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '号码ID',
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '私有：私有号码为公司专有号码',
  `heYue` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '合约',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `kid` smallint(6) UNSIGNED NOT NULL DEFAULT 1 COMMENT '号码种类：手机号码、固话、400号码、QQ号码、车牌号码',
  `yid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '寓意',
  `tid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '套餐ID',
  `cityID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市ID',
  `gid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商ID',
  `sid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '制式：联通、移动、电信s',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '处理者用户ID',
  `rid` mediumint(9) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日推荐ID',
  `average` int(11) NOT NULL DEFAULT 1000 COMMENT '均价',
  `score` int(11) NOT NULL DEFAULT 100 COMMENT '质量得分',
  `huaFei` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '话费',
  `maiJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '卖价',
  `daiLiJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理价',
  `diJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '底价',
  `order` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态：1为待售中, 2为已预约, 3为已售出，4为已下架, 5为已删除',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度',
  `collection` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏',
  `display` int(11) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `createTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `topTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '置顶时间：只保留年、月、日、小时',
  `updateTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  `number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '号码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '格式',
  `activity` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动：有推荐、特价、包邮等',
  `group` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组',
  `desc` varchar(126) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `diXiao` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最低消费：0为无最低消费',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作日志',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`number_id`) USING BTREE,
  INDEX `cityID`(`cityID`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `kid`(`kid`) USING BTREE,
  INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82518590 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for number_info_copy1
-- ----------------------------
DROP TABLE IF EXISTS `number_info_copy1`;
CREATE TABLE `number_info_copy1`  (
  `number_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '号码ID',
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '私有：私有号码为公司专有号码',
  `heYue` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '合约',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `kid` smallint(6) UNSIGNED NOT NULL DEFAULT 1 COMMENT '号码种类：手机号码、固话、400号码、QQ号码、车牌号码',
  `yid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '寓意',
  `tid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '套餐ID',
  `cityID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市ID',
  `gid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商ID',
  `sid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '制式：联通、移动、电信s',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '处理者用户ID',
  `rid` mediumint(9) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日推荐ID',
  `average` int(11) NOT NULL DEFAULT 1000 COMMENT '均价',
  `score` int(11) NOT NULL DEFAULT 100 COMMENT '质量得分',
  `huaFei` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '话费',
  `maiJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '卖价',
  `daiLiJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理价',
  `diJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '底价',
  `order` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态：1为待售中, 2为已预约, 3为已售出，4为已下架, 5为已删除',
  `hot` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度',
  `collection` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏',
  `display` int(11) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `createTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `topTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '置顶时间：只保留年、月、日、小时',
  `updateTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  `number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '号码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '格式',
  `activity` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动：有推荐、特价、包邮等',
  `group` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组',
  `desc` varchar(126) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `diXiao` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最低消费：0为无最低消费',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作日志',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`number_id`) USING BTREE,
  INDEX `cityID`(`cityID`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `kid`(`kid`) USING BTREE,
  INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82518590 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pay_account
-- ----------------------------
DROP TABLE IF EXISTS `pay_account`;
CREATE TABLE `pay_account`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：[0,10]1为正常，2为异常，3为冻结，4为注销',
  `bank` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网银账户：[0,32]',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网银名称：[0,255]含支行',
  `bank_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `wechat` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款微信账户：[0,32]',
  `wechat_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `alipay` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款支付宝账户：[0,32]',
  `alipay_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `btc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比特币地址：[0,255]',
  `btc_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '比特币地址认证：[0,1]0未认证，1已认证',
  `eth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '以太币地址：[0,255]',
  `eth_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '以太币地址认证：[0,1]0未认证，1已认证',
  `eos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '柚子币地址：[0,255]',
  `eos_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '柚子币地址认证：[0,1]0未认证，1已认证',
  `mm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '美眉币地址：[0,255]',
  `mm_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '美眉币地址认证：[0,1]0未认证，1已认证',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付账户：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_account_discount
-- ----------------------------
DROP TABLE IF EXISTS `pay_account_discount`;
CREATE TABLE `pay_account_discount`  (
  `discount_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '提现申请ID：[1,2147483647]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '提现状态：[0,10]1申请中，2转帐中，3已完成，4已拒绝',
  `to_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收款人：[1,8388607]如果是商户收款，可选填',
  `seller_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID：[1,8388607]商户收款的ID',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审批人：[1,8388607]转账申请处理负责人，即由谁放款的',
  `amount` decimal(17, 8) NOT NULL DEFAULT 0.00000000 COMMENT '提现金额：',
  `fee` decimal(16, 8) NOT NULL DEFAULT 0.00000000 COMMENT '手续费：',
  `time_create` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：',
  `pay_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '转账支付时间：',
  `time_end` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '资金到账时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后编辑时间：用于判断提现申请是否异常',
  `platform` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用平台：[0,12]pc电脑版网站、moblie移动版网站、wechat微信公众号、app手机应用',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款方式：[0,12]third第三方支付、bank网银、digiccy数字货币',
  `institution` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转账机构：[0,16]第三方填支付宝、微信，银行填银行名称例如建设银行，数字货币填数字货币名称，例如比特币',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起提现时的IP：[0,32]',
  `from_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账户：[0,128]',
  `to_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账户：[0,128]',
  `cause` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒绝原因：[0,255]告知商户为什么拒绝本次提现',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户备注：[0,255]提现完成后的商户备注信息，便于商户查询',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户提现：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_config`;
CREATE TABLE `pay_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_seller
-- ----------------------------
DROP TABLE IF EXISTS `pay_seller`;
CREATE TABLE `pay_seller`  (
  `seller_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户ID：[1,8388607]',
  `institution_state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '认证状态：[0,10]1为未认证，2为认证中，3为已认证，4为认证失败',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户持有人：[1,8388607]',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,2147483647]用户所在地的省份',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在城市ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商户名称：[0,16]',
  `institution` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册企业名：[0,64]',
  `institution_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构码：[0,64]',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址：[0,255]商户办公地的详细地址',
  `business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营范围：[0,255]',
  `institution_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '营业执照图片：',
  PRIMARY KEY (`seller_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商户信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_trade
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade`;
CREATE TABLE `pay_trade`  (
  `trade_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '交易序号：[1,2147483647]',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款状态：[0,10]1待付款，2待确认，3已完成，4已取消',
  `from_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款人：[1,8388607]',
  `to_user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收款人：[1,8388607]如果是商户收款，可选填',
  `seller_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID：[1,8388607]商户收款的ID',
  `total` decimal(16, 8) NOT NULL DEFAULT 0.00000000 COMMENT '付款总计金额：',
  `amount` decimal(16, 8) NOT NULL DEFAULT 0.00000000 COMMENT '实际付款金额：',
  `fee` decimal(16, 8) NOT NULL DEFAULT 0.00000000 COMMENT '手续费：',
  `pay_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '转账支付时间：',
  `platform` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用平台：[0,12]pc电脑版网站、moblie移动版网站、wechat微信公众号、app手机应用',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式：[0,12]third第三方支付、bank网银、digiccy数字货币',
  `app` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款应用：[0,16]cms内容管理系统、mall商城、bbs论坛，可自定义',
  `institution` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转账机构：[0,16]第三方填支付宝、微信，银行填银行名称例如建设银行，数字货币填数字货币名称，例如比特币',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款标题：[0,16]',
  `transaction_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易ID：[0,32]类似合同编号，可用来查询该笔交易明细',
  `ip` varchar(67) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转账时的用户IP：[0,67]',
  `from_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账户：[0,128]',
  `to_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账户：[0,128]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款描述：[0,255]告知用户付款的原因',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款人备注：[0,255]付款完成后的用户备注信息，便于用户查询',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '付款内容：根据应用定格式，一般为json格式',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '订单创建时间：',
  `end_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '付款到账时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后编辑时间：用于判断订单是否异常',
  PRIMARY KEY (`trade_id`, `transaction_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易信息：' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for stock_analyse
-- ----------------------------
DROP TABLE IF EXISTS `stock_analyse`;
CREATE TABLE `stock_analyse`  (
  `analyse_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分析ID：[1,2147483647]用来查询和修改结果',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重得分：[-99,99]',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `datetime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '当日时间：指股票当天',
  `policy_buy` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策买入：分值越高，别是越应该买入',
  `policy_hold` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策留守：分值越高，别是越应该留守',
  `policy_sell` smallint(2) NOT NULL DEFAULT 0 COMMENT '决策卖出：分值越高，别是越应该卖出',
  `presage_today` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示今日：[-99,99]今日涨跌评分，负分看跌，正分看涨',
  `presage_recently` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示近日：[-99,99]近3日涨跌评分，负分看跌，正分看涨',
  `presage_next` smallint(2) NOT NULL DEFAULT 0 COMMENT '预示后市：[-99,99]之后涨跌走势评分，负分看跌，正分看涨',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票代码：[0,16]',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析名称',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行方式：[0,16]买、卖、留',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知近日和将来走势',
  PRIMARY KEY (`analyse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票分析：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_formula
-- ----------------------------
DROP TABLE IF EXISTS `stock_formula`;
CREATE TABLE `stock_formula`  (
  `formula_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公式ID：[1,2147483647]',
  `weight` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重：[0,99]权重决定买卖和看涨看跌',
  `policy` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方针：[0,4]只想操作方式',
  `tense` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析时态：[0,8]同时过去还是今时、今日数据分析。now今时、today今日、past昔日',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公式名称：[0,16]技术分析名称',
  `filter` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤：[0,16]当出现该技术分析时结果时，其他某个分析结果将无效，所以将其过滤调',
  `presage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预示：[0,255]今日、近日、之后走势的看涨、看跌',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公式简介：[0,255]介绍该公式是什么技术分析的',
  `express` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '股票公式：用于分析走势，返回逻辑值',
  PRIMARY KEY (`formula_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票公式：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info`  (
  `stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '股票ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '股票名称：[0,16]',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,12]',
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票简介：[0,255]',
  `bonus` double(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分红频率：1年1次为1.0；2年一次为0.5；3年一次为0.33；不分红为0',
  `issue_price` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '：',
  `pe` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市盈率：',
  `pb` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市净率：',
  `profit` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '公司利润：如果为0或负数，表示公司不盈利',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发行量：[0,2147483647]单位(万股)',
  `time_to_market` date NOT NULL DEFAULT '1970-01-01' COMMENT '上市时间：',
  PRIMARY KEY (`stock_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market
-- ----------------------------
DROP TABLE IF EXISTS `stock_market`;
CREATE TABLE `stock_market`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_0
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_0`;
CREATE TABLE `stock_market_0_0`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12789 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_1
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_1`;
CREATE TABLE `stock_market_0_1`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17312 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_2
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_2`;
CREATE TABLE `stock_market_0_2`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15588 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_3
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_3`;
CREATE TABLE `stock_market_0_3`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16936 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_4
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_4`;
CREATE TABLE `stock_market_0_4`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8729 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_5
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_5`;
CREATE TABLE `stock_market_0_5`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12032 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_6
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_6`;
CREATE TABLE `stock_market_0_6`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 791 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_7
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_7`;
CREATE TABLE `stock_market_0_7`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17666 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_8
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_8`;
CREATE TABLE `stock_market_0_8`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16967 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0_9
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0_9`;
CREATE TABLE `stock_market_0_9`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15466 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_0
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_0`;
CREATE TABLE `stock_market_3_0`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_1
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_1`;
CREATE TABLE `stock_market_3_1`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8857 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_2
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_2`;
CREATE TABLE `stock_market_3_2`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_3
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_3`;
CREATE TABLE `stock_market_3_3`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_4
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_4`;
CREATE TABLE `stock_market_3_4`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6520 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_5
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_5`;
CREATE TABLE `stock_market_3_5`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6072 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_6
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_6`;
CREATE TABLE `stock_market_3_6`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_7
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_7`;
CREATE TABLE `stock_market_3_7`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_8
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_8`;
CREATE TABLE `stock_market_3_8`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8421 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3_9
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3_9`;
CREATE TABLE `stock_market_3_9`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6357 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_0
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_0`;
CREATE TABLE `stock_market_6_0`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_1
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_1`;
CREATE TABLE `stock_market_6_1`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20541 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_2
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_2`;
CREATE TABLE `stock_market_6_2`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17833 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_3
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_3`;
CREATE TABLE `stock_market_6_3`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23580 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_4
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_4`;
CREATE TABLE `stock_market_6_4`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10487 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_5
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_5`;
CREATE TABLE `stock_market_6_5`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24556 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_6
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_6`;
CREATE TABLE `stock_market_6_6`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32884 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_7
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_7`;
CREATE TABLE `stock_market_6_7`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_8
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_8`;
CREATE TABLE `stock_market_6_8`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45284 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6_9
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6_9`;
CREATE TABLE `stock_market_6_9`  (
  `market_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '行情ID：[1,2147483647]',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36734 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `stock_subscribe`;
CREATE TABLE `stock_subscribe`  (
  `subscribe_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅ID：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅用户ID：[1,8388607]',
  `time1` time(0) NOT NULL DEFAULT '10:00:00' COMMENT '通知时段1：默认为开盘后半小时，一般通知什么股票要卖',
  `time2` time(0) NOT NULL DEFAULT '13:00:00' COMMENT '通知时段2：默认为下午开盘时间，一般通知什么股票要卖',
  `time3` time(0) NOT NULL DEFAULT '14:30:00' COMMENT '通知时段3：默认为收盘前半小时。一般通知什么股票要买',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wechat' COMMENT '订阅方式：[0,12]phone手机短信、email邮箱、wechat微信公众号、app应用端',
  `stocks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订阅的股票：[0,255]',
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票订阅：用于记录用户订阅的股票，便于定时通知技术分析和走势' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_ad
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad`  (
  `ad_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告ID：[1,32767]',
  `display` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,10000]数值越小，越优先显示',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投放城市ID：[1,8388607]',
  `area_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投放地区：[1,8388607]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告主ID：[1,8388607]表示是谁打的广告',
  `times_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访客数：[0,2147483647]',
  `times_max` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '次数上限：[0,2147483647]表示点击或展现达多少次后不再打该广告',
  `times_show` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '展现量：[0,2147483647]',
  `times_click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量：[0,2147483647]',
  `fee` double(5, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '费用：每次点击或展现、增加访客所需的费用',
  `fee_max` double(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '费用上限：表示打广告消费到多少钱后不再打广告',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告名称：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型：[0,16]text文字、img图片、video视频、flash交互动画',
  `location` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投放位置：[0,16]',
  `fee_way` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付费方式：[0,16]click点击付费、show展现付费、user访客付费',
  `app` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展现应用：[0,16]将在指定的应用下才展现广告',
  `trade` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业：[0,24]可以根据不同的行业定制不同的投放',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告描述：[0,255]',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告图：[0,255]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转链接：[0,255]',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词：[0,255]在出现于关键词相关的情况下才打广告，多个关键词用空格分隔',
  PRIMARY KEY (`ad_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_address_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_area`;
CREATE TABLE `sys_address_area`  (
  `area_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '地区ID：[1,8388607]',
  `show` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属城市ID：[1,8388607]',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区名称：[0,16]',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_address_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_city`;
CREATE TABLE `sys_address_city`  (
  `city_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市ID：[1,8388607]',
  `show` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属省份ID：[1,8388607]',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市名称：[0,16]',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_address_province
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_province`;
CREATE TABLE `sys_address_province`  (
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,8388607]',
  `show` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可见：[0,2]0为仅表单可见，1为仅表单和搜索时可见 ，2为均可见',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省份名称：[0,16]',
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省份：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app`  (
  `app_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用序号：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可用：[0,1]在未审核状态下， 该应用授权为不可用',
  `encrypt` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '加解密方式：[0,10]0明文模式，1兼容模式，2安全模式',
  `times_allow` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日允许请求次数：[0,32767]用于限制应用每日可授权次数',
  `times_today` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '今日请求次数：[0,32767]用于记录今日请求授权次数，判断授权次数是否超限',
  `max_age` smallint(5) UNSIGNED NOT NULL DEFAULT 1825 COMMENT '有效期时长：[0,32767]授权应用可以使用的时长，超时需重新申请（单位：天）',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '持有者ID：[1,8388607]该客户端所有人的ID',
  `times_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求总次数：[0,2147483647]用于记录授权总次数',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次使用时间：用于记录上次授权时间，防止频繁操作',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称：[0,16]用于用户登陆时显示授权应用',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]用于应用授权访问时的账号',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问令牌：[0,32]用于访问应用时验证身份',
  `encoding_aes_key` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息加密钥匙：[16,43]用于给应用发送消息时的加密钥匙',
  `appsecret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用密钥：[0,64]用于应用授权访问时的密码',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应用图标：[0,255]用于用户登录时显示',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问地址：[0,255]当接收到用户所发消息后回访该地址',
  `bind_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '访问绑定IP：网站授权时确认重定向网址为已授权IP',
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '允许使用的接口：多个接口用”，“分隔',
  `scope_not` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '不允许使用的接口：“多个接口用”，“分隔',
  `users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '授权的用户：',
  PRIMARY KEY (`app_id`, `appid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_app_refresh
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_refresh`;
CREATE TABLE `sys_app_refresh`  (
  `refresh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '刷新Token的ID：[1,2147483647]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]表示当前Token绑定的用户uid',
  `time_create` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：用来判断刷新令牌有效期',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：用来判断是否频繁刷新访问牌',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '刷新令牌：[0,32]用来刷新访问牌，保留30天',
  PRIMARY KEY (`refresh_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用刷新：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID：[1,2147483647]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '变量名：[0,16]',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型：[0,16]string文本型、number数字型、boolean布尔型',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量标题：[0,16]可以用中文名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值：[0,255]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述：[0,255]描述该变量的作用',
  `model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据模型：json格式，用于单选、多选模式',
  PRIMARY KEY (`config_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `sex` tinyint(255) NULL DEFAULT NULL,
  `kouhao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for url_info
-- ----------------------------
DROP TABLE IF EXISTS `url_info`;
CREATE TABLE `url_info`  (
  `url_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '网址ID',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址键',
  `url_redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`url_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for url_log
-- ----------------------------
DROP TABLE IF EXISTS `url_log`;
CREATE TABLE `url_log`  (
  `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '网址ID',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址键',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询参数：用来校验推广者身份，平台等',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问源IP：用来判断是否刷的流量',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for url_share
-- ----------------------------
DROP TABLE IF EXISTS `url_share`;
CREATE TABLE `url_share`  (
  `share_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分享ID',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID：一般为经纪人ID',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由键：用于匹配路由做跳转',
  `url_redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转发网址：',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for url_share_log
-- ----------------------------
DROP TABLE IF EXISTS `url_share_log`;
CREATE TABLE `url_share_log`  (
  `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '网址ID',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址键',
  `time_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `time_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '分享者ID：一般为网红的账号',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询参数：用来校验推广者身份，平台等',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问源IP：用来判断是否刷的流量',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID：[1,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账户状态：[0,10]1为可用，2为异常，3为已冻结，4为已注销',
  `vip` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员级别：[0,10]用于确定用户访问权限',
  `gm` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员级别：[0,10]用于确定用户管理权限',
  `mc` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家级别：[0,10]用于确定商家用户的管理权限',
  `referee_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐人ID：[1,8388607]用于推荐注册时积分奖级',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次登录时间：',
  `salt` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短验证：[0,6]',
  `invite_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邀请注册码：[0,8]随着用户注册而生成',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '手机号码认证：[0,1]0为未认证，1为认证通过',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邮箱认证：[0,1]0为未认证，1为认证通过',
  `user_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在用户组：[0,64]多个用户组用“,“分隔',
  `user_admin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在管理组：[0,64]多个管理组用“,“分隔',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次登录时的IP地址：[0,128]',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名：[0,255]',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址：[0,255]',
  `friends` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '好友：多个好友ID用“,”分隔',
  `admin_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在管理组：[0,64]多个管理组用“,“分隔',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账户：用于保存用户登录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin`  (
  `admin_id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理组ID：[1,1000]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类：[0,12]用于区分用户组使用范围',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理组名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理组：用于判断用户后台管理鉴权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[1,8388607]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `level` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级划分：[0,1000]用于识别级别分组',
  `next_group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下级用户组ID：[1,8388607]决定用户升级后所属用户组',
  `exp` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '升级所需经验：[0,2147483647]用于确定用户的升级',
  `discount` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '折扣：用于确定用户的消费折扣',
  `bonus` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '奖励比例：用于确定用户的积分奖励',
  `app` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用：[0,12]用于区分用户组使用范围，cms内容管理系统、bbs社区、mall商城',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户组：用于用户前端身份和鉴权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `sex` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别：[0,2]0未设置、1男、2女',
  `idcard_state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '身份实名认证：[0,10]1为未认证，2为认证中，3为认证通过',
  `age` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄：[0,150]',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,2147483647]用户所在地的省份',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在城市ID：[1,2147483647]',
  `birthday` date NOT NULL DEFAULT '1970-01-01' COMMENT '生日：',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名：[2,16]',
  `job` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业：[0,16]',
  `school` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业学校：[0,16]',
  `major` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所学专业：[0,16]',
  `idcard` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号：[0,64]',
  `company_address` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址：[0,125]用户当前就职的公司地址',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址：[0,255]用户居住地的详细地址',
  `job_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作范围：[0,255]',
  `company_business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司经营范围：[0,255]',
  `idcard_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '身份证图片：保存json格式',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息：用于保存用户个人信息，如年龄、住址等' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_sns
-- ----------------------------
DROP TABLE IF EXISTS `user_sns`;
CREATE TABLE `user_sns`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `qq` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号：[5,12]',
  `qq_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'QQ认证：[0,1]0未认证，1已认证',
  `wechat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号：[5,16]',
  `wechat_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1]0未认证，1已认证',
  `mm` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MM号：[5,16]',
  `mm_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'MM认证：[0,1]0未认证，1已认证',
  `baidu` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '百度账号：[5,14]',
  `baidu_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '百度认证：[0,1]0未认证，1已认证',
  `taobao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝账号：[5,10]',
  `taobao_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '淘宝认证：[0,1]0未认证，1已认证',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社交账户：用于保存用的社交平台账户，方便同步登录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wechat_app
-- ----------------------------
DROP TABLE IF EXISTS `wechat_app`;
CREATE TABLE `wechat_app`  (
  `app_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用序号：[1,8388607]',
  `available` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可用：[0,1]在未审核状态下， 该应用授权为不可用',
  `encrypt` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '加解密方式：[0,10]0明文模式，1兼容模式，2安全模式',
  `times_allow` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日允许请求次数：[0,32767]用于限制应用每日可授权次数',
  `times_today` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '今日请求次数：[0,32767]用于记录今日请求授权次数，判断授权次数是否超限',
  `max_age` smallint(5) UNSIGNED NOT NULL DEFAULT 1825 COMMENT '有效期时长：[0,32767]授权应用可以使用的时长，超时需重新申请（单位：天）',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '持有者ID：[1,8388607]该客户端所有人的ID',
  `times_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求总次数：[0,2147483647]用于记录授权总次数',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称：[0,16]用于用户登陆时显示授权应用',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]用于应用授权访问时的账号',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问令牌：[0,32]用于访问应用时验证身份',
  `encoding_aes_key` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息加密钥匙：[16,43]用于给应用发送消息时的加密钥匙',
  `appsecret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用密钥：[0,64]用于应用授权访问时的密码',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应用图标：[0,255]用于用户登录时显示',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息访问地址：[0,255]当接收到用户所发消息后回访该地址',
  `bind_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '访问绑定IP：网站授权时确认重定向网址为已授权IP',
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '允许使用的接口：多个接口用”，“分隔',
  `scope_not` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '不允许使用的接口：“多个接口用”，“分隔',
  `users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '授权的用户：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次使用时间：用于记录上次授权时间，防止频繁操作',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信应用：用于管理微信公众号、小程序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wechat_app_refresh
-- ----------------------------
DROP TABLE IF EXISTS `wechat_app_refresh`;
CREATE TABLE `wechat_app_refresh`  (
  `refresh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '刷新Token的ID：[1,2147483647]',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]表示当前Token绑定的用户uid',
  `appid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID：[0,16]',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '刷新令牌：[0,32]用来刷新访问牌，保留30天',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间：用来判断刷新令牌有效期',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：用来判断是否频繁刷新访问牌',
  PRIMARY KEY (`refresh_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信刷新访问牌：用于微信公众号Oauth2.0刷新临时访问牌Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wechat_contact
-- ----------------------------
DROP TABLE IF EXISTS `wechat_contact`;
CREATE TABLE `wechat_contact`  (
  `contact_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '联系人ID',
  `appid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人账户',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人头像',
  PRIMARY KEY (`contact_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `wechat_message`;
CREATE TABLE `wechat_message`  (
  `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '消息ID：[1,2147483647]',
  `end` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束会话：[0,1]1已结束,0为未结束会话,如果未结束则查询当前正文',
  `stage` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '阶段：[null,9]第1阶段用于补全信息，第二阶段用于校验信息',
  `msgid` bigint(20) NULL DEFAULT NULL COMMENT '微信消息ID：来自微信公众号的消息ID',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '会话更新时间：',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '会话创建时间：',
  `group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户群组：[0,64]',
  `msg_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型：[0,16]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发信人名称',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '会话类型：[0,16]一般情况下，1永久会话/群、2临时会话/群',
  `cmd` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所使用的指令：[0,24]',
  `appid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用ID：绑定到该服务下的应用',
  `from_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会话发起人：[0,64]',
  `to_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会话接收人：[0,64]',
  `robot` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务的机器人：[0,64]',
  `chatid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聊天ID：用于消息回复和推送消息',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发信人头像',
  `check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复查指令：[0,255]当用户再驱动指令而缺少参数时，执行该语句',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词句：[0,255]除指令外，过滤、抽取后的词句',
  `form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单：用于记录用户已填参数',
  `content_last` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最后会话：记录用户最后一次会话内容',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会话正文：',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注信息：',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信消息：用于查询和保存聊天记录' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
