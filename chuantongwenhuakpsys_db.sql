/*
Navicat MySQL Data Transfer

Source Server         : db
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : chuantongwenhuakpsys_db

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2020-11-08 14:21:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `hfcontent` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('1', '3', '经典诗词赏析', '很好', '2020-11-08 14:17:30');

-- ----------------------------
-- Table structure for feiyi
-- ----------------------------
DROP TABLE IF EXISTS `feiyi`;
CREATE TABLE `feiyi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feiyi
-- ----------------------------
INSERT INTO `feiyi` VALUES ('3', '1604815691563.jpg,', '诗词1', '2020-11-08 14:08:12');
INSERT INTO `feiyi` VALUES ('4', '1604815702826.jpg,', '诗词2', '2020-11-08 14:08:23');
INSERT INTO `feiyi` VALUES ('5', '1604815712500.jpg,', '诗词3', '2020-11-08 14:08:33');
INSERT INTO `feiyi` VALUES ('6', '1604815721934.jpg,1604816409352.jpg,', '诗词4', '2020-11-08 14:20:11');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('4', '1604815116573.jpg');
INSERT INTO `img` VALUES ('5', '1604815124051.jpg');
INSERT INTO `img` VALUES ('6', '1604815131526.jpg');
INSERT INTO `img` VALUES ('7', '1604816375417.jpg');

-- ----------------------------
-- Table structure for lanmu
-- ----------------------------
DROP TABLE IF EXISTS `lanmu`;
CREATE TABLE `lanmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lanmu
-- ----------------------------
INSERT INTO `lanmu` VALUES ('1', '手工类', '0');
INSERT INTO `lanmu` VALUES ('2', '人文类', '0');
INSERT INTO `lanmu` VALUES ('3', '建筑类', '0');
INSERT INTO `lanmu` VALUES ('8', '戏曲类', '0');
INSERT INTO `lanmu` VALUES ('11', '测试2测试rrr', '1');
INSERT INTO `lanmu` VALUES ('12', '测试', '1');

-- ----------------------------
-- Table structure for lishi
-- ----------------------------
DROP TABLE IF EXISTS `lishi`;
CREATE TABLE `lishi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lishi
-- ----------------------------
INSERT INTO `lishi` VALUES ('1', '1604816100188.jpg', '杜甫', '杜甫', '2020-11-08 14:15:12');
INSERT INTO `lishi` VALUES ('3', '1604816083533.jpg', '李白', '<p>\r\n	李白\r\n</p>', '2020-11-08 14:15:07');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `savatime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '123', 'w12345', '张丽丽', '女', '136678998763', '1', '', '2020-11-01 22:24:29');
INSERT INTO `member` VALUES ('2', 'lishi', 'w12345', '张三', '女', '13588888888', '1', '', '2020-11-01 22:28:23');
INSERT INTO `member` VALUES ('3', 'xiaoming', 'xiaoming1234', '小明', '男', '123123', '0', '', '2020-11-08 14:16:57');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '经典诗词赏析', '经典诗词赏析', '2020-11-08 14:15:45');
INSERT INTO `news` VALUES ('2', '名诗词欣赏', '名诗词欣赏', '2020-11-08 14:15:34');
INSERT INTO `news` VALUES ('3', '诗词朗诵', '诗词朗诵', '2020-11-08 14:19:48');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `qx` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT '',
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', '系统管理员', 'admin', '123', '王帅', '男', '13588888887', '开', '0', '');

-- ----------------------------
-- Table structure for tedian
-- ----------------------------
DROP TABLE IF EXISTS `tedian`;
CREATE TABLE `tedian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tedian
-- ----------------------------
INSERT INTO `tedian` VALUES ('4', '1604815854518.jpg', '李白', '<p style=\"color:#666666;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:26px;\"><span style=\"font-size:16px;\">李白乘舟将欲行</span></span> \r\n</p>', '2020-11-08 14:11:52');
INSERT INTO `tedian` VALUES ('5', '1604816431147.jpg', '杜甫', '杜甫', '2020-11-08 14:20:35');

-- ----------------------------
-- Table structure for yqlj
-- ----------------------------
DROP TABLE IF EXISTS `yqlj`;
CREATE TABLE `yqlj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yqlj
-- ----------------------------
INSERT INTO `yqlj` VALUES ('2', '百度', 'www.baidu.com');
INSERT INTO `yqlj` VALUES ('3', '淘宝', 'www.taobao.com');
