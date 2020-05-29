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

 Date: 29/05/2020 11:20:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
