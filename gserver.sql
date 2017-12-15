/*
Navicat MySQL Data Transfer

Source Server         : 10.204.37.192-消息服务器web3
Source Server Version : 50629
Source Host           : 10.204.37.192:3306
Source Database       : gserver

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-12-15 17:17:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company_info
-- ----------------------------
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `company_name` varchar(256) DEFAULT NULL,
  `recordid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `desc_info` varchar(256) DEFAULT NULL COMMENT 'desc',
  `pass` varchar(64) DEFAULT NULL COMMENT 'pass',
  `accountid` varchar(32) DEFAULT NULL COMMENT 'userid',
  `ip_desc` varchar(256) DEFAULT NULL COMMENT 'ip_desc',
  `ip_refresh_interval` varchar(256) DEFAULT NULL COMMENT '出口IP刷新周期',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  KEY `Index_1` (`recordid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='公司账号';

-- ----------------------------
-- Records of company_info
-- ----------------------------
INSERT INTO `company_info` VALUES ('测试k公司', '3', '测试', '123321', 'c1', '192.168.1.1-192.1681.33', '132', '2017-12-01 15:30:44', '2017-12-04 17:32:32');
INSERT INTO `company_info` VALUES ('汉庭有限公司', '4', '1111', '123321', 'c2', '222.11-123123', '55', '2017-12-01 15:42:03', '2017-12-04 11:47:44');
INSERT INTO `company_info` VALUES ('1111111111', '5', '11111111', '123321', 'c33', '1', '33', '2017-12-04 17:19:19', null);
INSERT INTO `company_info` VALUES ('123123', '6', '13', '1231231', 'p333', '', '123', '2017-12-14 15:15:18', null);

-- ----------------------------
-- Table structure for company_proxyserver
-- ----------------------------
DROP TABLE IF EXISTS `company_proxyserver`;
CREATE TABLE `company_proxyserver` (
  `proxyserver_id` varchar(128) NOT NULL COMMENT '中转服务器id',
  `companyid` varchar(64) DEFAULT NULL COMMENT '公司id',
  `ipdesc` varchar(128) DEFAULT '0' COMMENT 'ip段',
  KEY `Index_1` (`proxyserver_id`,`companyid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司-中转服务器关联表';

-- ----------------------------
-- Records of company_proxyserver
-- ----------------------------
INSERT INTO `company_proxyserver` VALUES ('p1', 'c1', '192.168.1.10-192.168.1.100');
INSERT INTO `company_proxyserver` VALUES ('p2', 'c1', '192.168.1.101-192.168.1.200');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerid` varchar(30) DEFAULT NULL,
  `managername` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `annotation` varchar(50) DEFAULT NULL,
  `createby` varchar(30) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedby` varchar(30) DEFAULT NULL,
  `updateddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', 'admin', 'C8837B23FF8AAA8A2DDE915473CE0991', '0', '0', '2016-10-17 18:52:07', '', '2016-05-12 15:38:55');
INSERT INTO `manager` VALUES ('root', 'root', 'C8837B23FF8AAA8A2DDE915473CE0991', '0', '0', '2016-10-17 18:52:07', '', '2016-05-12 15:38:55');

-- ----------------------------
-- Table structure for manager_role
-- ----------------------------
DROP TABLE IF EXISTS `manager_role`;
CREATE TABLE `manager_role` (
  `manager_id` varchar(50) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`manager_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员-角色对应关系';

-- ----------------------------
-- Records of manager_role
-- ----------------------------
INSERT INTO `manager_role` VALUES ('root', 'root');

-- ----------------------------
-- Table structure for menu_info
-- ----------------------------
DROP TABLE IF EXISTS `menu_info`;
CREATE TABLE `menu_info` (
  `menu_id` varchar(20) NOT NULL,
  `menu_orderid` varchar(10) DEFAULT NULL,
  `menu_parentid` varchar(20) DEFAULT NULL,
  `menu_name` varchar(30) DEFAULT NULL,
  `menu_url` varchar(120) DEFAULT NULL,
  `menu_ico` varchar(100) DEFAULT NULL,
  `menu_group` varchar(50) DEFAULT NULL COMMENT '菜单分组名称-同组的列在一个下拉分组',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_info
-- ----------------------------
INSERT INTO `menu_info` VALUES ('company', '1', 'p1', '公司账号管理', 'page/company/', null, '');
INSERT INTO `menu_info` VALUES ('device', '1', 'p2', '路由器管理', 'page/device/', null, '');
INSERT INTO `menu_info` VALUES ('p1', '1', null, '账号管理', null, null, null);
INSERT INTO `menu_info` VALUES ('p2', '2', null, '设备管理', null, null, null);
INSERT INTO `menu_info` VALUES ('p3', '3', null, '日志服务', null, null, null);
INSERT INTO `menu_info` VALUES ('pccount', '2', 'p1', '子账号管理', 'page/pccount/', null, '');
INSERT INTO `menu_info` VALUES ('pccountM', '5', null, '子账号管理', 'page/pccountM/', null, '');
INSERT INTO `menu_info` VALUES ('privilege', '5', null, '角色管理', 'page/privilege/', null, '');
INSERT INTO `menu_info` VALUES ('proxyserver', '2', 'p2', '中转服务器管理', 'page/proxyserver', null, null);
INSERT INTO `menu_info` VALUES ('proxyserverroute', '3', 'p2', '中转服务器路由分配概况', 'page/proxysrroute', null, null);
INSERT INTO `menu_info` VALUES ('routecompletelog', '3', 'p3', '路由服务完成记录', null, null, null);
INSERT INTO `menu_info` VALUES ('routelog', '2', 'p3', '路由上下线日志', null, null, null);
INSERT INTO `menu_info` VALUES ('set', '6', null, '账号设置', 'page/set/', null, '');
INSERT INTO `menu_info` VALUES ('translog', '1', 'p3', '路由转发流量日志', 'page/translog/', null, '');

-- ----------------------------
-- Table structure for phoneaccount_info
-- ----------------------------
DROP TABLE IF EXISTS `phoneaccount_info`;
CREATE TABLE `phoneaccount_info` (
  `recordid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `accountid` varchar(32) NOT NULL COMMENT 'userid',
  `pass` varchar(64) DEFAULT NULL COMMENT 'pass',
  `ip_refresh_interval` varchar(256) DEFAULT NULL COMMENT '出口IP刷新周期',
  `city` varchar(64) DEFAULT NULL COMMENT '出口位置',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `company_userid` varchar(256) DEFAULT NULL COMMENT '所属公司user_id',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`recordid`),
  KEY `Index_1` (`recordid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='手机账号';

-- ----------------------------
-- Records of phoneaccount_info
-- ----------------------------
INSERT INTO `phoneaccount_info` VALUES ('2', 'tsets11', '123', '11', '上海', '192.168.1.187', 'c1', '2017-12-01 16:21:25', '2017-12-06 11:37:55');
INSERT INTO `phoneaccount_info` VALUES ('8', 'test1', '123321', '33', '上海', '192.168.1.14', 'c1', '2017-12-01 17:09:48', '2017-12-06 11:40:30');
INSERT INTO `phoneaccount_info` VALUES ('11', '1231', '231', '231', '长沙', '192.168.1.22', 'c1', '2017-12-01 17:39:04', '2017-12-07 17:36:19');
INSERT INTO `phoneaccount_info` VALUES ('12', 'ccc1', '123321', 'null', '南京', '192.168.1.29', 'c1', '2017-12-04 16:32:47', '2017-12-06 11:27:18');
INSERT INTO `phoneaccount_info` VALUES ('13', 'xxxx', '1', '123', '天津', '192.168.1.24', 'c1', '2017-12-06 11:36:33', '2017-12-07 11:11:46');
INSERT INTO `phoneaccount_info` VALUES ('14', 'dfsd', 'fsdf', '33', '无锡', '192.168.1.57', 'c1', '2017-12-06 11:36:45', null);

-- ----------------------------
-- Table structure for proxyserver_info
-- ----------------------------
DROP TABLE IF EXISTS `proxyserver_info`;
CREATE TABLE `proxyserver_info` (
  `recordid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `port` varchar(32) DEFAULT NULL COMMENT '端口',
  `maxphones` varchar(64) DEFAULT NULL COMMENT '可分配最大手机数',
  `assignphones` varchar(64) DEFAULT NULL COMMENT '已分配手机数',
  KEY `Index_1` (`recordid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='中转服务器记录表';

-- ----------------------------
-- Records of proxyserver_info
-- ----------------------------
INSERT INTO `proxyserver_info` VALUES ('1', 'p1', '192.168.1.4', '4444', '500', '0');
INSERT INTO `proxyserver_info` VALUES ('2', 'p2', '192.168.1.5', '4888', '100', '0');

-- ----------------------------
-- Table structure for proxyserver_route
-- ----------------------------
DROP TABLE IF EXISTS `proxyserver_route`;
CREATE TABLE `proxyserver_route` (
  `proxyserver_id` varchar(128) NOT NULL COMMENT '服务器id',
  `city` varchar(64) DEFAULT NULL COMMENT '出口城市',
  `online_route_num` int(11) DEFAULT '0' COMMENT '在线路由数',
  `plan_route_num` int(11) DEFAULT '0' COMMENT '计划路由数',
  `phone_num` int(11) DEFAULT NULL COMMENT '分配的手机数',
  KEY `Index_1` (`proxyserver_id`,`city`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中转服务器-路由器关联表';

-- ----------------------------
-- Records of proxyserver_route
-- ----------------------------
INSERT INTO `proxyserver_route` VALUES ('p1', '无锡', '0', '1', '1');
INSERT INTO `proxyserver_route` VALUES ('p1', '长沙', '0', '1', '1');
INSERT INTO `proxyserver_route` VALUES ('p2', '上海', '0', '1', '1');
INSERT INTO `proxyserver_route` VALUES ('p1', '南京', '0', '1', '1');
INSERT INTO `proxyserver_route` VALUES ('p1', '上海', '1', '1', '1');
INSERT INTO `proxyserver_route` VALUES ('p1', '天津', '0', '1', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_en` varchar(50) NOT NULL,
  `role_zh` varchar(50) DEFAULT NULL,
  `role_desc` varchar(250) DEFAULT NULL,
  `createby` varchar(30) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedby` varchar(30) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`role_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('admin', '管理员', '222', 'admin', '2017-12-15 11:13:43', null, '2017-12-15 17:13:05');
INSERT INTO `role` VALUES ('company', '公司角色', '管理公司自己的信息及下属手机账号', 'admin', '2017-12-15 11:27:25', null, '2017-12-15 15:09:43');
INSERT INTO `role` VALUES ('root', '超级管理员', '超级管理员-站位', 'root', '2017-12-15 15:25:37', null, null);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_id` varchar(50) NOT NULL COMMENT '角色id,',
  `menu_id` varchar(200) DEFAULT NULL COMMENT '角色可见菜单id集合  逗号分隔'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单角色-菜单对应关系';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('company', 'p1');
INSERT INTO `role_menu` VALUES ('company', 'pccount');
INSERT INTO `role_menu` VALUES ('company', 'set');
INSERT INTO `role_menu` VALUES ('admin', 'p1');
INSERT INTO `role_menu` VALUES ('admin', 'company');
INSERT INTO `role_menu` VALUES ('admin', 'pccount');
INSERT INTO `role_menu` VALUES ('admin', 'p2');
INSERT INTO `role_menu` VALUES ('admin', 'device');
INSERT INTO `role_menu` VALUES ('admin', 'proxyserver');
INSERT INTO `role_menu` VALUES ('admin', 'proxyserverroute');
INSERT INTO `role_menu` VALUES ('admin', 'p3');
INSERT INTO `role_menu` VALUES ('admin', 'translog');
INSERT INTO `role_menu` VALUES ('admin', 'routelog');
INSERT INTO `role_menu` VALUES ('admin', 'routecompletelog');
INSERT INTO `role_menu` VALUES ('admin', 'privilege');

-- ----------------------------
-- Table structure for route_info
-- ----------------------------
DROP TABLE IF EXISTS `route_info`;
CREATE TABLE `route_info` (
  `recordid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `routeid` varchar(32) NOT NULL COMMENT 'id',
  `proxyserver_id` varchar(32) DEFAULT '' COMMENT '分配的中转服务器id',
  `ip` varchar(128) DEFAULT NULL COMMENT '路由器出口ip',
  `city` varchar(32) DEFAULT NULL COMMENT '所在城市',
  `onlinetime` varchar(64) DEFAULT NULL COMMENT '上线时间',
  `offlinetime` varchar(64) DEFAULT NULL COMMENT '下线时间',
  `flag` varchar(32) DEFAULT '0' COMMENT '分配标记  -1：不在线  0:未分配  1:已分配未连接 、2:已连接中转服务器 ',
  `free` varchar(32) DEFAULT '0' COMMENT '是否空闲  0：空闲   1：不空闲',
  `assigntime` varchar(64) DEFAULT NULL COMMENT '服务器分配中转服务器的时间，',
  KEY `Index_1` (`recordid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='路由器记录表';

-- ----------------------------
-- Records of route_info
-- ----------------------------
INSERT INTO `route_info` VALUES ('5', 'hh444', 'p1', '192.268.2.212', '义乌', '2017-12-13 10:54:00', null, '2', '0', '2017-12-13 10:56:00');
INSERT INTO `route_info` VALUES ('19', 'hh444333', '', '192.268.2.2', '上海', '2017-12-13 10:54:00', null, '-1', '0', '');
INSERT INTO `route_info` VALUES ('20', 'r1', 'p1', '58.67.101.3', '上海', '2017-12-13 9:54:00', null, '2', '1', '2017-12-13 10:56:00');
INSERT INTO `route_info` VALUES ('21', 'hh44433113', '', '192.268.2.3', '上海', '2017-12-13 10:54:00', null, '-1', '0', '');
INSERT INTO `route_info` VALUES ('22', 'testroute1', '', '/127.0.0.1:60693', '上海', '2017-12-15 09:00:46', '2017-12-15 09:40:52', '-1', '0', '2017-12-15 09:00:46');
INSERT INTO `route_info` VALUES ('23', 'testroute2', 'p2', '/127.0.0.1:61225', '上海', '2017-12-15 09:43:08', '', '1', '0', '2017-12-15 09:43:16');

-- ----------------------------
-- Table structure for server_complete_route
-- ----------------------------
DROP TABLE IF EXISTS `server_complete_route`;
CREATE TABLE `server_complete_route` (
  `proxyserver_id` varchar(128) NOT NULL COMMENT '服务器id',
  `route_id` varchar(128) DEFAULT NULL COMMENT '路由器id',
  `time` varchar(64) DEFAULT '' COMMENT '结束时间',
  KEY `Index_1` (`proxyserver_id`,`route_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路由器服务结束表';

-- ----------------------------
-- Records of server_complete_route
-- ----------------------------

-- ----------------------------
-- Table structure for trans_log
-- ----------------------------
DROP TABLE IF EXISTS `trans_log`;
CREATE TABLE `trans_log` (
  `recordid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `phone_account_use_id` varchar(32) DEFAULT NULL COMMENT '手机账号',
  `phone_ip` varchar(64) DEFAULT NULL COMMENT '手机ip',
  `route_id` varchar(256) DEFAULT NULL COMMENT '出口路由器id',
  `route_ip` varchar(256) DEFAULT NULL COMMENT '出口路由器ip',
  `city` varchar(64) DEFAULT NULL COMMENT '出口城市',
  `time` varchar(64) DEFAULT NULL COMMENT '时间',
  KEY `Index_1` (`recordid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='流量转发日志';

-- ----------------------------
-- Records of trans_log
-- ----------------------------
INSERT INTO `trans_log` VALUES ('1', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 09:57:16');
INSERT INTO `trans_log` VALUES ('2', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 09:58:16');
INSERT INTO `trans_log` VALUES ('3', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 09:59:16');
INSERT INTO `trans_log` VALUES ('4', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:00:16');
INSERT INTO `trans_log` VALUES ('5', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:01:16');
INSERT INTO `trans_log` VALUES ('6', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:02:16');
INSERT INTO `trans_log` VALUES ('7', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:03:16');
INSERT INTO `trans_log` VALUES ('8', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:04:16');
INSERT INTO `trans_log` VALUES ('9', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:05:16');
INSERT INTO `trans_log` VALUES ('10', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:06:16');
INSERT INTO `trans_log` VALUES ('11', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:07:16');
INSERT INTO `trans_log` VALUES ('12', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:08:16');
INSERT INTO `trans_log` VALUES ('13', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:09:16');
INSERT INTO `trans_log` VALUES ('14', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:10:16');
INSERT INTO `trans_log` VALUES ('15', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:11:16');
INSERT INTO `trans_log` VALUES ('16', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:12:16');
INSERT INTO `trans_log` VALUES ('17', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:13:16');
INSERT INTO `trans_log` VALUES ('18', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:14:16');
INSERT INTO `trans_log` VALUES ('19', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:15:16');
INSERT INTO `trans_log` VALUES ('20', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:16:16');
INSERT INTO `trans_log` VALUES ('21', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:17:16');
INSERT INTO `trans_log` VALUES ('22', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:18:16');
INSERT INTO `trans_log` VALUES ('23', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:19:16');
INSERT INTO `trans_log` VALUES ('24', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:20:16');
INSERT INTO `trans_log` VALUES ('25', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:21:16');
INSERT INTO `trans_log` VALUES ('26', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:22:16');
INSERT INTO `trans_log` VALUES ('27', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:23:16');
INSERT INTO `trans_log` VALUES ('28', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:24:16');
INSERT INTO `trans_log` VALUES ('29', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:25:16');
INSERT INTO `trans_log` VALUES ('30', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:26:16');
INSERT INTO `trans_log` VALUES ('31', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:27:16');
INSERT INTO `trans_log` VALUES ('32', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:28:16');
INSERT INTO `trans_log` VALUES ('33', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:29:16');
INSERT INTO `trans_log` VALUES ('34', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:30:16');
INSERT INTO `trans_log` VALUES ('35', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:31:16');
INSERT INTO `trans_log` VALUES ('36', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:32:16');
INSERT INTO `trans_log` VALUES ('37', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:33:16');
INSERT INTO `trans_log` VALUES ('38', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:34:16');
INSERT INTO `trans_log` VALUES ('39', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:35:16');
INSERT INTO `trans_log` VALUES ('40', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:36:16');
INSERT INTO `trans_log` VALUES ('41', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:37:16');
INSERT INTO `trans_log` VALUES ('42', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:38:16');
INSERT INTO `trans_log` VALUES ('43', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:39:16');
INSERT INTO `trans_log` VALUES ('44', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:40:16');
INSERT INTO `trans_log` VALUES ('45', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:41:16');
INSERT INTO `trans_log` VALUES ('46', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:42:16');
INSERT INTO `trans_log` VALUES ('47', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:43:16');
INSERT INTO `trans_log` VALUES ('48', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:44:16');
INSERT INTO `trans_log` VALUES ('49', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:45:16');
INSERT INTO `trans_log` VALUES ('50', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:46:16');
INSERT INTO `trans_log` VALUES ('51', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:47:16');
INSERT INTO `trans_log` VALUES ('52', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:48:16');
INSERT INTO `trans_log` VALUES ('53', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:49:16');
INSERT INTO `trans_log` VALUES ('54', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:50:16');
INSERT INTO `trans_log` VALUES ('55', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:51:16');
INSERT INTO `trans_log` VALUES ('56', 'yxr', '10.42.18.12', 'xxxxxxxx', '10.42.18.12', 'nanjing', '2017-12-07 10:52:16');

-- ----------------------------
-- Table structure for user_token
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `token` varchar(50) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL,
  `info` varchar(1024) DEFAULT NULL,
  UNIQUE KEY `token_UNIQUE` (`token`) USING BTREE,
  UNIQUE KEY `userid_UNIQUE` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_token
-- ----------------------------
INSERT INTO `user_token` VALUES ('17vbd5ihqwp4e10un8xdhf13r7', 'admin', '2017-12-15 17:12:37', 'admin|2');
INSERT INTO `user_token` VALUES ('1by6kplwmxbj7q00u5vru0hmz', 'root', '2017-12-15 16:59:57', 'root|2');
