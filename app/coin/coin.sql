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

 Date: 12/11/2020 08:16:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币分析：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_analyse
-- ----------------------------
INSERT INTO `coin_analyse` VALUES (1, 2, '2020-06-21 21:00:10', '1970-01-01 00:00:00', 4, 3, 2, 3, 5, 10, NULL, NULL, NULL, NULL);

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
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发行量：[0,2147483647]单位：万股',
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
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅用户ID：[1,8388607](user_account.nickname)',
  `time1` time(0) NOT NULL DEFAULT '10:00:00' COMMENT '通知时段1：默认为开盘后半小时，一般通知什么数字货币要卖',
  `time2` time(0) NOT NULL DEFAULT '13:00:00' COMMENT '通知时段2：默认为下午开盘时间，一般通知什么数字货币要卖',
  `time3` time(0) NOT NULL DEFAULT '14:30:00' COMMENT '通知时段3：默认为收盘前半小时。一般通知什么数字货币要买',
  `way` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wechat' COMMENT '订阅方式：[0,12]phone手机短信、email邮箱、wechat微信公众号、app应用端',
  `stocks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订阅的数字货币：[0,255]',
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数字货币订阅：用于记录用户订阅的数字货币，便于定时通知技术分析和走势' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
