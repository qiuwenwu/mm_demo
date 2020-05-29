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

 Date: 29/05/2020 11:06:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (1, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:26:59', NULL, '张三', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_article` VALUES (2, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:27:06', NULL, '李四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_article` VALUES (3, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:27:11', NULL, '王五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_article` VALUES (4, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, '1997-01-01 00:00:00', '2020-03-21 11:27:15', NULL, '十五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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

SET FOREIGN_KEY_CHECKS = 1;
