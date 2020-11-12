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

 Date: 12/11/2020 08:24:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stock_formula
-- ----------------------------
DROP TABLE IF EXISTS `stock_formula`;
CREATE TABLE `stock_formula`  (
  `formula_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公式ID：[1,2147483647]',
  `score` smallint(1) NOT NULL DEFAULT 0 COMMENT '人工得分：[-10,10]正分看涨，负分看跌。',
  `weight_1` smallint(2) NOT NULL DEFAULT 0 COMMENT '1日权重：[-10,10]正分看涨，负分看跌。-3分大跌，-2分看跌，-1分看淡，0分未知，1分看好，2分看涨，3分大涨',
  `weight_4` smallint(2) NOT NULL DEFAULT 0 COMMENT '4日权重：[-10,10]正分看涨，负分看跌。',
  `weight_7` smallint(2) NOT NULL DEFAULT 0 COMMENT '7日权重：[-10,10]正分看涨，负分看跌。',
  `extent_1` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '1日涨跌幅度：[-100,100]取当日所有涨跌之和的平均值',
  `extent_4` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '4日涨跌幅度：[-100,100]取第4日所有涨跌之和的平均值',
  `extent_7` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '7日涨跌幅度：[-100,100]取第7日所有涨跌之和的平均值',
  `num_up_1` int(11) NOT NULL DEFAULT 0 COMMENT '1日上涨数：统计所有股票出现该技术分析的当日涨数',
  `num_up_4` int(11) NOT NULL DEFAULT 0 COMMENT '4日上涨数：统计所有股票出现该技术分析的4日涨数',
  `num_up_7` int(11) NOT NULL DEFAULT 0 COMMENT '7日上涨数：统计所有股票出现该技术分析的7日涨数',
  `num_down_1` int(11) NOT NULL DEFAULT 0 COMMENT '1日下跌数：统计所有股票出现该技术分析的当日跌数',
  `num_down_4` int(11) NOT NULL DEFAULT 0 COMMENT '4日下跌数：统计所有股票出现该技术分析的4日跌数',
  `num_down_7` int(11) NOT NULL DEFAULT 0 COMMENT '7日下跌数：统计所有股票出现该技术分析的7日跌数',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间：',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公式名称：[0,16]技术分析名称',
  `filter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤：[0,16]当出现该技术分析时结果时，其他某个分析结果将无效，所以将其过滤调',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公式简介：[0,255]介绍该公式是什么技术分析的',
  `express` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '股票公式：用于分析走势，返回逻辑值',
  `presage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预兆：今日、近日、后市走势情况',
  PRIMARY KEY (`formula_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票公式：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info`  (
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,12]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '股票名称：[0,16]',
  `bonus` double(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分红频率：1年1次为1.0；2年一次为0.5；3年一次为0.33；不分红为0',
  `pe` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市盈率：',
  `pb` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市净率：',
  `issue_price` double(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '发行价格：',
  `profit` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '公司利润：如果为0或负数，表示公司不盈利',
  `num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发行量：[0,2147483647]单位：万股',
  `time_to_market` date NOT NULL DEFAULT '1970-01-01' COMMENT '上市时间：',
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称：[0,32]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票简介：[0,255]',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票信息：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market
-- ----------------------------
DROP TABLE IF EXISTS `stock_market`;
CREATE TABLE `stock_market`  (
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `score` smallint(2) NOT NULL DEFAULT 0 COMMENT '人工得分：',
  `weight_1` smallint(2) NOT NULL DEFAULT 0 COMMENT '1日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。负5分以上大跌，负3-4分看跌，负1-2分看淡，0分未知，1-2分看好，3-4分看涨，5分以上大涨',
  `weight_4` smallint(2) NOT NULL DEFAULT 0 COMMENT '4日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `weight_7` smallint(2) NOT NULL DEFAULT 0 COMMENT '7日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `extent_1` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '1日涨跌：[-100,100]取当日所有涨跌之和的平均值',
  `extent_4` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '4日涨跌：[-100,100]取第4日所有涨跌之和的平均值',
  `extent_7` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '7日涨跌：[-100,100]取第7日所有涨跌之和的平均值',
  `action_day` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '做T建议：[0,16]买、卖、留',
  `action_week` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长线建议：[0,16]买、卖、留',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合建议：[0,16]买、卖、留',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析，公式的名称集合',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知今日、近日和后市发展情况',
  `ok` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '阶段：(1已抓取，2已分析，3已计算)',
  PRIMARY KEY (`code`, `DATETIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_0
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_0`;
CREATE TABLE `stock_market_0`  (
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `score` smallint(2) NOT NULL DEFAULT 0 COMMENT '人工得分：',
  `weight_1` smallint(2) NOT NULL DEFAULT 0 COMMENT '1日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。负5分以上大跌，负3-4分看跌，负1-2分看淡，0分未知，1-2分看好，3-4分看涨，5分以上大涨',
  `weight_4` smallint(2) NOT NULL DEFAULT 0 COMMENT '4日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `weight_7` smallint(2) NOT NULL DEFAULT 0 COMMENT '7日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `extent_1` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '1日涨跌：[-100,100]取当日所有涨跌之和的平均值',
  `extent_4` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '4日涨跌：[-100,100]取第4日所有涨跌之和的平均值',
  `extent_7` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '7日涨跌：[-100,100]取第7日所有涨跌之和的平均值',
  `action_day` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '做T建议：[0,16]买、卖、留',
  `action_week` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长线建议：[0,16]买、卖、留',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合建议：[0,16]买、卖、留',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析，公式的名称集合',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知今日、近日和后市发展情况',
  `ok` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '阶段：(1已抓取|2已分析|3已计算)',
  PRIMARY KEY (`code`, `DATETIME`) USING BTREE,
  INDEX `action_index`(`action`) USING BTREE,
  INDEX `tip_index`(`tip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_3
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_3`;
CREATE TABLE `stock_market_3`  (
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `score` smallint(2) NOT NULL DEFAULT 0 COMMENT '人工得分：',
  `weight_1` smallint(2) NOT NULL DEFAULT 0 COMMENT '1日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。负5分以上大跌，负3-4分看跌，负1-2分看淡，0分未知，1-2分看好，3-4分看涨，5分以上大涨',
  `weight_4` smallint(2) NOT NULL DEFAULT 0 COMMENT '4日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `weight_7` smallint(2) NOT NULL DEFAULT 0 COMMENT '7日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `extent_1` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '1日涨跌：[-100,100]取当日所有涨跌之和的平均值',
  `extent_4` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '4日涨跌：[-100,100]取第4日所有涨跌之和的平均值',
  `extent_7` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '7日涨跌：[-100,100]取第7日所有涨跌之和的平均值',
  `action_day` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '做T建议：[0,16]买、卖、留',
  `action_week` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长线建议：[0,16]买、卖、留',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合建议：[0,16]买、卖、留',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析，公式的名称集合',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知今日、近日和后市发展情况',
  `ok` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '阶段：(1已抓取|2已分析|3已计算)',
  PRIMARY KEY (`code`, `DATETIME`) USING BTREE,
  INDEX `action_index`(`action`) USING BTREE,
  INDEX `tip_index`(`tip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_market_6
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_6`;
CREATE TABLE `stock_market_6`  (
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '股票代码：[0,16]',
  `DATETIME` date NOT NULL DEFAULT '1970-01-01' COMMENT '交易日期：',
  `HIGH` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最高价：',
  `LOW` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低价：',
  `OPEN` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开盘价：',
  `CLOSE` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收盘价：',
  `LCLOSE` double(8, 2) NOT NULL COMMENT '上个收盘价：',
  `CHG` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '涨跌幅：',
  `TOTAL` double(12, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总成交额：',
  `VOL` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成交量：[0,2147483647]',
  `score` smallint(2) NOT NULL DEFAULT 0 COMMENT '人工得分：',
  `weight_1` smallint(2) NOT NULL DEFAULT 0 COMMENT '1日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。负5分以上大跌，负3-4分看跌，负1-2分看淡，0分未知，1-2分看好，3-4分看涨，5分以上大涨',
  `weight_4` smallint(2) NOT NULL DEFAULT 0 COMMENT '4日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `weight_7` smallint(2) NOT NULL DEFAULT 0 COMMENT '7日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。',
  `extent_1` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '1日涨跌：[-100,100]取当日所有涨跌之和的平均值',
  `extent_4` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '4日涨跌：[-100,100]取第4日所有涨跌之和的平均值',
  `extent_7` double(6, 2) NOT NULL DEFAULT 0.00 COMMENT '7日涨跌：[-100,100]取第7日所有涨跌之和的平均值',
  `action_day` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '做T建议：[0,16]买、卖、留',
  `action_week` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长线建议：[0,16]买、卖、留',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合建议：[0,16]买、卖、留',
  `tip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分析提示：[0,255]技术分析，公式的名称集合',
  `predict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预言：[0,255]告知今日、近日和后市发展情况',
  `ok` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '阶段：(1已抓取|2已分析|3已计算)',
  PRIMARY KEY (`code`, `DATETIME`) USING BTREE,
  INDEX `action_index`(`action`) USING BTREE,
  INDEX `tip_index`(`tip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票行情：' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `stock_subscribe`;
CREATE TABLE `stock_subscribe`  (
  `subscribe_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅ID：',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅用户ID：[1,8388607](user_account.nickname)',
  `time1` time(0) NOT NULL DEFAULT '10:00:00' COMMENT '通知时段1：默认为开盘后半小时，一般通知什么股票要卖',
  `time2` time(0) NOT NULL DEFAULT '13:00:00' COMMENT '通知时段2：默认为下午开盘时间，一般通知什么股票要卖',
  `time3` time(0) NOT NULL DEFAULT '14:30:00' COMMENT '通知时段3：默认为收盘前半小时。一般通知什么股票要买',
  `way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wechat' COMMENT '订阅方式：[0,12]phone手机短信、email邮箱、wechat微信公众号、app应用端',
  `stocks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订阅的股票：[0,255]',
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票订阅：用于记录用户订阅的股票，便于定时通知技术分析和走势' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
