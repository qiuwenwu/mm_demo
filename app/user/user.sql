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

 Date: 12/11/2020 08:18:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID：[1,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `vip` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员级别：[0,10]用于确定用户访问权限',
  `gm` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员级别：[0,10]用于确定用户管理权限',
  `mc` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家级别：[0,10]用于确定商家用户的管理权限',
  `group_id` smallint(6) NOT NULL COMMENT '所在用户组：决定用户身份和权限(user_group)',
  `admin_id` smallint(6) NOT NULL COMMENT '所在管理组：决定用户身份和权限(user_admin)',
  `referee_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐人ID：[1,8388607]用于推荐注册时积分奖级(user_account.nickname.user_id)',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次登录时间：',
  `salt` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短验证：[0,6]',
  `invite_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邀请注册码：[0,8]随着用户注册而生成',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次登录时的IP地址：[0,128]',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名：[0,255]',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址：[0,255]',
  `friends` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '好友：多个好友ID用“,”分隔',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账户：用于保存用户登录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (1, 1, 5, 5, 5, 5, 1, 0, '2020-11-07 16:24:51', 'mm2019', 'df91d1', '15817188815', 2, 'admin', '管理员', 'd1d3ca239d5fb1703e8cdb39b4df91d1', '573242395@qq.com', 0, '127.0.0.1', NULL, ' ', NULL, '2020-06-20 09:01:56');
INSERT INTO `user_account` VALUES (2, 2, 4, 0, 0, 3, 2, 0, '2020-10-18 01:00:59', '', '', '13728891819', 0, 'test', '测试', '', '', 0, NULL, NULL, NULL, NULL, '2020-06-20 09:01:56');
INSERT INTO `user_account` VALUES (3, 3, 3, 0, 0, 1, 3, 0, '2020-10-18 01:00:57', '', '', '15817188816', 0, 'tencs', '请问阿斯顿', '', '', 0, NULL, NULL, NULL, NULL, '2020-06-20 09:01:56');
INSERT INTO `user_account` VALUES (4, 4, 2, 0, 0, 1, 4, 0, '2020-10-18 01:00:55', '', '', '13223112388', 0, 'taable', '特色让他', '', '', 0, NULL, NULL, NULL, NULL, '2020-06-20 09:01:56');
INSERT INTO `user_account` VALUES (5, 2, 1, 0, 0, 2, 5, 0, '2020-10-18 01:00:54', '', '', '15819712331', 0, 'lande', '阿尔发', '', '', 0, NULL, NULL, NULL, NULL, '2020-06-20 09:01:56');
INSERT INTO `user_account` VALUES (6, 1, 0, 0, 0, 3, 6, 0, '2020-03-09 00:14:03', '', '', '18928814799', 0, 'aerce', '发呃呃', '', '', 0, NULL, NULL, NULL, NULL, '2020-06-20 09:01:56');

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin`  (
  `admin_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理组ID：[1,1000]',
  `father_id` smallint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID：[1,32767](user_admin.name.admin_id)',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `department` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门：[0,12]用于区分管理组织结构',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理组：用于判断用户后台管理鉴权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES (1, 0, 100, '站长', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (2, 1, 100, '管理员', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (3, 4, 100, '财务经理', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (4, 0, 100, '总经理', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (5, 4, 100, '营销经理', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (6, 5, 100, '推广员', NULL, NULL, '测');
INSERT INTO `user_admin` VALUES (7, 2, 100, '运维', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (8, 5, 100, '策划', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (9, 4, 100, '业务经理', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (10, 9, 100, '业务员', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (11, 5, 100, '文案', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (12, 3, 100, '会计', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (13, 3, 100, '审计', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (14, 3, 100, '出纳', NULL, NULL, NULL);
INSERT INTO `user_admin` VALUES (15, 2, 100, '客服', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_count
-- ----------------------------
DROP TABLE IF EXISTS `user_count`;
CREATE TABLE `user_count`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `level` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级：[0,1000]',
  `iq` smallint(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT 'IQ智商：[80,200]用于激励用户评论和发帖',
  `credit` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '信用度：[0,2147483647]用于评估用户信誉',
  `credit_points` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分：[0,2147483647]用于代金消费或兑换商品',
  `exp` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '经验值：[0,2147483647]',
  `extcredits1` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分1：[0,2147483647]',
  `extcredits2` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分2：[0,2147483647]',
  `extcredits3` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分3：[0,2147483647]',
  `extcredits4` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分4：[0,2147483647]',
  `extcredits5` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分5：[0,2147483647]',
  `extcredits6` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分6：[0,2147483647]',
  `extcredits7` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分7：[0,2147483647]',
  `extcredits8` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拓展积分8：[0,2147483647]',
  `money` double(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '钱：用于现金业务',
  `coin` decimal(16, 8) NOT NULL DEFAULT 0.00000000 COMMENT '货币：用于游戏或数字货币业务',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户统计：用于统计用户等级、经验、积分等' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_count
-- ----------------------------
INSERT INTO `user_count` VALUES (0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, 0.00000000);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[1,8388607]',
  `display` smallint(4) UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `level` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级划分：[0,1000]用于识别级别分组',
  `next_group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下级用户组ID：[1,8388607]决定用户升级后所属用户组(user_group.name.group_id)',
  `exp` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '升级所需经验：[0,2147483647]用于确定用户的升级',
  `discount` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '折扣：用于确定用户的消费折扣',
  `bonus` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '奖励比例：用于确定用户的积分奖励',
  `app` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用：[0,12]用于区分用户组使用范围，cms内容管理系统、bbs社区、mall商城',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标：[0,255]用于标识用户组',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户组：用于用户前端身份和鉴权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 0, 1, 2, 0, 0.00, 0.00, 'mall', '普通会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (2, 0, 2, 3, 5000, 0.98, 0.00, 'mall', '白银会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (3, 0, 3, 4, 20000, 0.97, 1.50, 'mall', '黄金会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (4, 0, 4, 5, 100000, 0.95, 2.00, 'mall', '铂金会员', '通过消费积分评估，用于激励用户消费', NULL);
INSERT INTO `user_group` VALUES (5, 0, 5, 0, 500000, 0.90, 3.00, 'mall', '钻石会员', '通过消费积分评估，用于激励用户消费', NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `sex` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别：[0,2](0未设置|1男|2女)',
  `idcard_state` smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '身份实名认证：[0,10](1未认证|2认证中|3认证通过)',
  `age` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄：[0,150]',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID：[1,2147483647]用户所在地的省份(sys_address_province)',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在城市ID：[1,2147483647](sys_address_city)',
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
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (0, 0, 0, 0, 0, 0, '1970-01-01', NULL, NULL, NULL, NULL, '441532146', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (1, 0, 0, 0, 0, 0, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_sns
-- ----------------------------
DROP TABLE IF EXISTS `user_sns`;
CREATE TABLE `user_sns`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID：[1,8388607]',
  `qq` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号：[5,12]',
  `qq_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'QQ认证：[0,1](0未认证|1已认证)',
  `wechat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号：[5,16]',
  `wechat_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '微信认证：[0,1](0未认证|1已认证)',
  `mm` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MM号：[5,16]',
  `mm_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'MM认证：[0,1](0未认证|1已认证)',
  `baidu` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '百度账号：[5,14]',
  `baidu_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '百度认证：[0,1](0未认证|1已认证)',
  `taobao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝账号：[5,10]',
  `taobao_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '淘宝认证：[0,1](0未认证|1已认证)',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社交账户：用于保存用的社交平台账户，方便同步登录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_sns
-- ----------------------------
INSERT INTO `user_sns` VALUES (1, '573242395', 0, 'qiuwenwu91', 0, 'qiuwenwu91', 0, NULL, 0, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
