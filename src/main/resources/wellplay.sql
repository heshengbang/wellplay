/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : wellplay

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-10-23 17:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL,
  `describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('00000000001', 'ROLE_ADMIN', 'administrator');
INSERT INTO `role` VALUES ('00000000002', 'ROLE_USER', 'ordinary user');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enable` int(1) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('00000000001', 'admin', 'admin', '1', '');
INSERT INTO `user` VALUES ('00000000002', 'user', 'user', '1', '');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('00000000001', '1', 'admin', '1', 'ROLE_ADMIN');
INSERT INTO `user_role` VALUES ('00000000002', '1', 'admin', '2', 'ROLE_USER');
INSERT INTO `user_role` VALUES ('00000000003', '2', 'user', '2', 'ROLE_USER');
