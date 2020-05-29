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

 Date: 29/05/2020 11:08:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of url_info
-- ----------------------------
INSERT INTO `url_info` VALUES (1, '22226223', 'http://github.com/123', '2020-05-06 21:57:44', '2020-05-06 21:57:44');
INSERT INTO `url_info` VALUES (2, '77823314', 'http://github.com/1234', '2020-05-06 21:57:44', '2020-05-06 21:57:44');
INSERT INTO `url_info` VALUES (3, '11413133', 'http://github.com/12345', '2020-05-06 21:57:44', '2020-05-06 21:57:44');
INSERT INTO `url_info` VALUES (4, '27282711', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.74.13b56fbeNGaSLa&id=613832301513&ns=1&abbucket=8&sku_properties=10004:7195672376;5919063:6536025', '2020-05-06 21:57:44', '2020-05-06 21:57:44');
INSERT INTO `url_info` VALUES (5, '27627228', 'https://detail.tmall.com', '2020-05-10 18:19:23', '2020-05-10 18:19:23');

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
-- Records of url_log
-- ----------------------------
INSERT INTO `url_log` VALUES (1, '22226223', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL);
INSERT INTO `url_log` VALUES (2, '77823314', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL);
INSERT INTO `url_log` VALUES (3, '11413133', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL);
INSERT INTO `url_log` VALUES (4, '27282711', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL);
INSERT INTO `url_log` VALUES (5, '27282711', '2020-05-06 01:14:15', '2020-05-06 01:14:15', NULL, NULL);
INSERT INTO `url_log` VALUES (6, '27282711', '2020-05-06 01:16:59', '2020-05-06 01:16:59', NULL, NULL);
INSERT INTO `url_log` VALUES (7, '27282711', '2020-05-06 01:17:23', '2020-05-06 01:17:23', NULL, NULL);
INSERT INTO `url_log` VALUES (8, '27282711', '2020-05-06 01:20:11', '2020-05-06 01:20:11', '', NULL);
INSERT INTO `url_log` VALUES (9, '27282711', '2020-05-06 01:20:46', '2020-05-06 01:20:46', '', NULL);
INSERT INTO `url_log` VALUES (10, '27282711', '2020-05-06 01:20:59', '2020-05-06 01:20:59', 'mm=123', NULL);
INSERT INTO `url_log` VALUES (11, '27282711', '2020-05-06 01:24:26', '2020-05-06 01:24:26', '', NULL);
INSERT INTO `url_log` VALUES (12, '27282711', '2020-05-06 01:24:33', '2020-05-06 01:24:33', 'gg=321', NULL);
INSERT INTO `url_log` VALUES (13, '27282711', '2020-05-06 01:29:05', '2020-05-06 01:29:05', 'gg=321', '::1');
INSERT INTO `url_log` VALUES (14, '27282711', '2020-05-06 01:30:16', '2020-05-06 01:30:16', '', '::1');

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
-- Records of url_share_log
-- ----------------------------
INSERT INTO `url_share_log` VALUES (1, '22226223', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (2, '77823314', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (3, '11413133', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (4, '27282711', '2020-05-06 01:11:19', '2020-05-06 01:11:19', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (5, '27282711', '2020-05-06 01:14:15', '2020-05-06 01:14:15', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (6, '27282711', '2020-05-06 01:16:59', '2020-05-06 01:16:59', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (7, '27282711', '2020-05-06 01:17:23', '2020-05-06 01:17:23', NULL, NULL, NULL);
INSERT INTO `url_share_log` VALUES (8, '27282711', '2020-05-06 01:20:11', '2020-05-06 01:20:11', NULL, '', NULL);
INSERT INTO `url_share_log` VALUES (9, '27282711', '2020-05-06 01:20:46', '2020-05-06 01:20:46', NULL, '', NULL);
INSERT INTO `url_share_log` VALUES (10, '27282711', '2020-05-06 01:20:59', '2020-05-06 01:20:59', NULL, 'mm=123', NULL);
INSERT INTO `url_share_log` VALUES (11, '27282711', '2020-05-06 01:24:26', '2020-05-06 01:24:26', NULL, '', NULL);
INSERT INTO `url_share_log` VALUES (12, '27282711', '2020-05-06 01:24:33', '2020-05-06 01:24:33', NULL, 'gg=321', NULL);
INSERT INTO `url_share_log` VALUES (13, '27282711', '2020-05-06 01:29:05', '2020-05-06 01:29:05', NULL, 'gg=321', '::1');
INSERT INTO `url_share_log` VALUES (14, '27282711', '2020-05-06 01:30:16', '2020-05-06 01:30:16', NULL, '', '::1');

SET FOREIGN_KEY_CHECKS = 1;
