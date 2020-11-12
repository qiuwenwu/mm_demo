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

 Date: 12/11/2020 08:24:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for number_info
-- ----------------------------
DROP TABLE IF EXISTS `number_info`;
CREATE TABLE `number_info`  (
  `number_id` int(11) NOT NULL AUTO_INCREMENT,
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否私有：私有号码为公司专有号码(0否|1是)',
  `heYue` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否合约号：(0否|1是)',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏：(0否|1是)',
  `kid` smallint(6) UNSIGNED NOT NULL DEFAULT 1 COMMENT '号码种类：(1手机号码|2固定电话号码|3企业电话号码|4QQ号码|5车牌号码)',
  `yid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '寓意',
  `tid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '套餐ID',
  `cityID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市ID',
  `gid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商ID',
  `sid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '制式：(1移动|2联通|3电信)',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '处理人ID：(user_account.nickname)',
  `rid` mediumint(9) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日推荐ID',
  `average` int(11) NOT NULL DEFAULT 1000 COMMENT '均价',
  `score` int(11) NOT NULL DEFAULT 100 COMMENT '质量得分',
  `huaFei` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '话费',
  `maiJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '卖价',
  `daiLiJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理价',
  `diJia` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '底价',
  `order` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态：(1待售中|2已预约|3已售出|4已下架|5已删除)',
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
  INDEX `cityid_index`(`cityID`) USING BTREE,
  INDEX `orderby_index`(`average`, `display`, `updateTime`) USING BTREE,
  INDEX `rid_index`(`rid`) USING BTREE,
  INDEX `where_index`(`sid`, `kid`) USING BTREE,
  INDEX `number_index`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1076187 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '号码信息' ROW_FORMAT = Compact STORAGE MEMORY;

SET FOREIGN_KEY_CHECKS = 1;
