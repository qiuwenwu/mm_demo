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

 Date: 29/05/2020 11:06:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
