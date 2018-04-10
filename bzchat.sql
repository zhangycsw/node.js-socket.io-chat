/*
Navicat MySQL Data Transfer

Source Server         : qnm
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : bzchat

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-08-15 10:22:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chdazhangwei
-- ----------------------------
DROP TABLE IF EXISTS `chdazhangwei`;
CREATE TABLE `chdazhangwei` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `lcon` varchar(20) DEFAULT NULL,
  `isLeft` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chdazhangwei
-- ----------------------------
INSERT INTO `chdazhangwei` VALUES ('1', '4', '14', 'sdfsd fsjdlk ', '下午7:59:06', '2017-08-03 19:59:06', '大张伟', 'lcon5', '1');
INSERT INTO `chdazhangwei` VALUES ('2', '4', '14', 'sdfsdfjsldkjf ', '下午7:59:12', '2017-08-03 19:59:12', '思聪', 'lcon4', '0');
INSERT INTO `chdazhangwei` VALUES ('3', '1', '14', 'sdfsdfjlsd;kfj s', 'null', '2017-08-03 19:59:18', '大张伟', 'lcon5', '1');
INSERT INTO `chdazhangwei` VALUES ('4', '1', '14', 'sdfsdfjsdlfkjsd b ', '下午7:59:23', '2017-08-03 19:59:23', '王尼玛', 'lcon1', '0');
INSERT INTO `chdazhangwei` VALUES ('5', '4', '14', '双方的速度', '下午8:26:34', '2017-08-03 20:26:34', '大张伟', 'lcon5', '1');

-- ----------------------------
-- Table structure for chjindong
-- ----------------------------
DROP TABLE IF EXISTS `chjindong`;
CREATE TABLE `chjindong` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `lcon` varchar(50) DEFAULT NULL,
  `isLeft` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1049 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of chjindong
-- ----------------------------
INSERT INTO `chjindong` VALUES ('979', '1', '12', '\n            <img src=\"img/emoji/10.gif\">\n          ', 'null', '2017-08-05 12:50:36', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('980', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/user1.jpg\"></a>', '下午12:51:03', '2017-08-05 12:51:03', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('981', '1', '12', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 12:51:14', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('982', '1', '12', '索拉卡；加是', 'null', '2017-08-05 12:51:18', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('983', '1', '12', '水电费得数放假了；', 'null', '2017-08-05 12:51:22', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('984', '1', '12', '都是废的 ', '下午12:53:37', '2017-08-05 12:53:37', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('985', '1', '12', '耶耶耶', '下午12:54:43', '2017-08-05 12:54:43', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('986', '1', '12', '是否速度', '下午12:55:41', '2017-08-05 12:55:41', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('987', '1', '12', '是否是', '下午12:56:21', '2017-08-05 12:56:21', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('988', '1', '12', '电风扇粉丝', '下午12:57:00', '2017-08-05 12:57:00', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('989', '1', '12', '水电费速度', '下午12:58:27', '2017-08-05 12:58:27', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('990', '1', '12', '双方的', 'null', '2017-08-05 12:58:53', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('991', '1', '12', '是否大多数 速度发', '下午12:58:59', '2017-08-05 12:58:59', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('992', '1', '12', '放到是', '下午12:59:39', '2017-08-05 12:59:39', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('993', '1', '12', '是电费', '下午1:00:02', '2017-08-05 13:00:02', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('994', '1', '12', '范德萨发得数', '下午1:00:11', '2017-08-05 13:00:11', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('995', '1', '12', '帝国饭店个是', '下午1:00:54', '2017-08-05 13:00:54', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('996', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/pop.gif\"></a>', '下午1:01:49', '2017-08-05 13:01:49', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('997', '1', '12', '水电费是', '下午1:02:29', '2017-08-05 13:02:29', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('998', '1', '12', '电费 电费古典风格', '下午1:02:47', '2017-08-05 13:02:47', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('999', '1', '12', '双方的大苏打发生的故事的', '下午1:03:37', '2017-08-05 13:03:37', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1000', '1', '12', '电费速度', '下午1:04:51', '2017-08-05 13:04:51', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1001', '1', '12', '发生的发发', '下午1:04:58', '2017-08-05 13:04:58', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1002', '1', '12', '速度发生的', 'null', '2017-08-05 13:05:03', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1003', '1', '12', '双方的是', 'null', '2017-08-05 13:05:06', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1004', '1', '12', '收费电视的', '下午1:06:49', '2017-08-05 13:06:49', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1005', '1', '12', '速度粉丝是', '下午1:06:54', '2017-08-05 13:06:54', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1006', '1', '12', '双方的发', 'null', '2017-08-05 13:07:01', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1007', '1', '12', '是 ', 'null', '2017-08-05 13:07:06', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1008', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/vail.png\"></a>', 'null', '2017-08-05 13:07:14', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1009', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/lcon3.jpg\"></a>', 'null', '2017-08-05 13:07:23', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1010', '1', '12', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 13:07:33', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1011', '1', '12', 'sdf ds ', '下午1:13:23', '2017-08-05 13:13:23', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1012', '1', '12', 'sdf ff sd fsd ', '下午1:13:30', '2017-08-05 13:13:30', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1013', '1', '12', '<a href=\"http://127.0.0.1:8081/upload/mobile.docx\"><i class=\"docx\"></i></a>', 'null', '2017-08-05 13:13:48', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1014', '1', '12', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 13:13:56', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1015', '1', '12', '\n            <img src=\"img/emoji/17.gif\">\n          ', 'null', '2017-08-05 13:14:04', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1016', '1', '12', 'sdf sjkl; ', 'null', '2017-08-05 13:14:16', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1017', '1', '12', 'sdf s', 'null', '2017-08-05 13:14:20', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1018', '1', '12', '你好', '下午2:53:08', '2017-08-05 14:53:08', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1019', '1', '12', '嗯呢', '下午2:53:13', '2017-08-05 14:53:13', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1020', '1', '12', '啊似懂非懂撒f', 'null', '2017-08-05 14:53:19', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1021', '1', '12', '发生的发', 'null', '2017-08-05 14:53:25', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1022', '1', '12', '发生的 ', 'null', '2017-08-05 14:53:29', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1023', '1', '12', '发生的是', 'null', '2017-08-05 14:53:35', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1024', '1', '12', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 14:53:44', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1025', '1', '12', '\n            <img src=\"img/emoji/10.gif\">\n          ', 'null', '2017-08-05 14:53:48', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1026', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/lcon2.jpg\"></a>', 'null', '2017-08-05 14:53:54', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1027', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/lcon3.jpg\"></a>', '下午2:54:23', '2017-08-05 14:54:23', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1028', '1', '12', '<a href=\"http://127.0.0.1:8081/upload/angular.docx\"><i class=\"docx\"></i></a>', '下午12:53:57', '2017-08-06 12:53:58', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1029', '1', '12', '<a href=\"http://127.0.0.1:8081/upload/mygw.rar\"><i class=\"zip\"></i></a>', '下午12:54:08', '2017-08-06 12:54:08', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1030', '1', '12', '萨芬的十大就离开', '下午8:22:42', '2017-08-06 20:22:42', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1031', '1', '12', '萨菲隆看电视', '下午8:22:50', '2017-08-06 20:22:50', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1032', '1', '12', '\n            <img src=\"img/emoji/16.gif\">\n          ', 'null', '2017-08-06 20:23:01', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1033', '1', '12', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-06 20:23:06', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1034', '1', '12', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/1.jpg\"></a>', 'null', '2017-08-06 20:23:10', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1035', '1', '12', '<a href=\"http://127.0.0.1:8081/upload/Logo.doc\"><i class=\"docx\"></i></a>', 'null', '2017-08-06 20:23:20', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1036', '1', '12', '司法的说法 ', '上午10:12:03', '2017-08-15 10:12:03', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1037', '1', '12', '电风扇得数 ', '上午10:12:08', '2017-08-15 10:12:08', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1038', '1', '12', '\n            <img src=\"img/emoji/11.gif\">\n          ', 'null', '2017-08-15 10:12:13', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1039', '1', '12', '\n            <img src=\"img/emoji/18.gif\">\n          ', 'null', '2017-08-15 10:12:17', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1040', '1', '12', '法师答复', '上午10:16:50', '2017-08-15 10:16:50', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1041', '1', '12', '你好', '上午10:17:40', '2017-08-15 10:17:40', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1042', '1', '12', '饿呢', '上午10:17:46', '2017-08-15 10:17:46', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1043', '1', '12', '爷爷', 'null', '2017-08-15 10:17:52', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1044', '1', '12', '爱', 'null', '2017-08-15 10:17:57', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1045', '1', '12', '是对方的身份', '上午10:21:03', '2017-08-15 10:21:03', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1046', '1', '12', '水电费得数 ', '上午10:21:08', '2017-08-15 10:21:08', '今冬', 'lcon6', '1');
INSERT INTO `chjindong` VALUES ('1047', '1', '12', '法师答复速度', 'null', '2017-08-15 10:21:11', '王尼玛', 'lcon1', '0');
INSERT INTO `chjindong` VALUES ('1048', '1', '12', '水电费速度', 'null', '2017-08-15 10:21:13', '今冬', 'lcon6', '1');

-- ----------------------------
-- Table structure for chlhh245354431
-- ----------------------------
DROP TABLE IF EXISTS `chlhh245354431`;
CREATE TABLE `chlhh245354431` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `lcon` varchar(50) DEFAULT NULL,
  `isLeft` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of chlhh245354431
-- ----------------------------
INSERT INTO `chlhh245354431` VALUES ('1108', '12', '1', '\n            <img src=\"img/emoji/10.gif\">\n          ', 'null', '2017-08-05 12:50:36', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1109', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/user1.jpg\"></a>', '下午12:51:03', '2017-08-05 12:51:03', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1110', '12', '1', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 12:51:14', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1111', '12', '1', '索拉卡；加是', 'null', '2017-08-05 12:51:18', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1112', '12', '1', '水电费得数放假了；', 'null', '2017-08-05 12:51:22', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1113', '12', '1', '都是废的 ', '下午12:53:37', '2017-08-05 12:53:37', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1114', '12', '1', '耶耶耶', '下午12:54:43', '2017-08-05 12:54:43', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1115', '12', '1', '是否速度', '下午12:55:41', '2017-08-05 12:55:41', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1116', '12', '1', '是否是', '下午12:56:21', '2017-08-05 12:56:21', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1117', '12', '1', '电风扇粉丝', '下午12:57:00', '2017-08-05 12:57:00', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1118', '12', '1', '水电费速度', '下午12:58:27', '2017-08-05 12:58:27', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1119', '12', '1', '双方的', 'null', '2017-08-05 12:58:53', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1120', '12', '1', '是否大多数 速度发', '下午12:58:59', '2017-08-05 12:58:59', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1121', '12', '1', '放到是', '下午12:59:39', '2017-08-05 12:59:39', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1122', '12', '1', '是电费', '下午1:00:02', '2017-08-05 13:00:02', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1123', '12', '1', '范德萨发得数', '下午1:00:11', '2017-08-05 13:00:11', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1124', '12', '1', '帝国饭店个是', '下午1:00:54', '2017-08-05 13:00:54', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1125', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/pop.gif\"></a>', '下午1:01:49', '2017-08-05 13:01:49', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1126', '12', '1', '水电费是', '下午1:02:29', '2017-08-05 13:02:29', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1127', '12', '1', '电费 电费古典风格', '下午1:02:47', '2017-08-05 13:02:47', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1128', '12', '1', '双方的大苏打发生的故事的', '下午1:03:37', '2017-08-05 13:03:37', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1129', '12', '1', '电费速度', '下午1:04:51', '2017-08-05 13:04:51', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1130', '12', '1', '发生的发发', '下午1:04:58', '2017-08-05 13:04:58', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1131', '12', '1', '速度发生的', 'null', '2017-08-05 13:05:03', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1132', '12', '1', '双方的是', 'null', '2017-08-05 13:05:06', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1133', '12', '1', '收费电视的', '下午1:06:49', '2017-08-05 13:06:49', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1134', '12', '1', '速度粉丝是', '下午1:06:54', '2017-08-05 13:06:54', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1135', '12', '1', '双方的发', 'null', '2017-08-05 13:07:01', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1136', '12', '1', '是 ', 'null', '2017-08-05 13:07:06', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1137', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/vail.png\"></a>', 'null', '2017-08-05 13:07:14', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1138', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/lcon3.jpg\"></a>', 'null', '2017-08-05 13:07:23', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1139', '12', '1', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 13:07:33', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1140', '12', '1', 'sdf ds ', '下午1:13:23', '2017-08-05 13:13:23', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1141', '12', '1', 'sdf ff sd fsd ', '下午1:13:30', '2017-08-05 13:13:30', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1142', '12', '1', '<a href=\"http://127.0.0.1:8081/upload/mobile.docx\"><i class=\"docx\"></i></a>', 'null', '2017-08-05 13:13:48', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1143', '12', '1', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 13:13:56', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1144', '12', '1', '\n            <img src=\"img/emoji/17.gif\">\n          ', 'null', '2017-08-05 13:14:04', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1145', '12', '1', 'sdf sjkl; ', 'null', '2017-08-05 13:14:16', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1146', '12', '1', 'sdf s', 'null', '2017-08-05 13:14:20', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1147', '12', '1', '你好', '下午2:53:08', '2017-08-05 14:53:08', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1148', '12', '1', '嗯呢', '下午2:53:13', '2017-08-05 14:53:13', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1149', '12', '1', '啊似懂非懂撒f', 'null', '2017-08-05 14:53:19', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1150', '12', '1', '发生的发', 'null', '2017-08-05 14:53:25', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1151', '12', '1', '发生的 ', 'null', '2017-08-05 14:53:29', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1152', '12', '1', '发生的是', 'null', '2017-08-05 14:53:35', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1153', '12', '1', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-05 14:53:44', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1154', '12', '1', '\n            <img src=\"img/emoji/10.gif\">\n          ', 'null', '2017-08-05 14:53:48', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1155', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/lcon2.jpg\"></a>', 'null', '2017-08-05 14:53:54', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1156', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/lcon3.jpg\"></a>', '下午2:54:23', '2017-08-05 14:54:23', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1157', '12', '1', '<a href=\"http://127.0.0.1:8081/upload/angular.docx\"><i class=\"docx\"></i></a>', '下午12:53:57', '2017-08-06 12:53:58', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1158', '12', '1', '<a href=\"http://127.0.0.1:8081/upload/mygw.rar\"><i class=\"zip\"></i></a>', '下午12:54:08', '2017-08-06 12:54:08', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1159', '12', '1', '萨芬的十大就离开', '下午8:22:42', '2017-08-06 20:22:42', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1160', '12', '1', '萨菲隆看电视', '下午8:22:50', '2017-08-06 20:22:50', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1161', '12', '1', '\n            <img src=\"img/emoji/16.gif\">\n          ', 'null', '2017-08-06 20:23:01', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1162', '12', '1', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-06 20:23:06', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1163', '12', '1', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/1.jpg\"></a>', 'null', '2017-08-06 20:23:10', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1164', '12', '1', '<a href=\"http://127.0.0.1:8081/upload/Logo.doc\"><i class=\"docx\"></i></a>', 'null', '2017-08-06 20:23:20', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1165', '12', '1', '司法的说法 ', '上午10:12:03', '2017-08-15 10:12:03', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1166', '12', '1', '电风扇得数 ', '上午10:12:08', '2017-08-15 10:12:08', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1167', '12', '1', '\n            <img src=\"img/emoji/11.gif\">\n          ', 'null', '2017-08-15 10:12:13', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1168', '12', '1', '\n            <img src=\"img/emoji/18.gif\">\n          ', 'null', '2017-08-15 10:12:17', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1169', '12', '1', '法师答复', '上午10:16:50', '2017-08-15 10:16:50', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1170', '12', '1', '你好', '上午10:17:40', '2017-08-15 10:17:40', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1171', '12', '1', '饿呢', '上午10:17:46', '2017-08-15 10:17:46', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1172', '12', '1', '爷爷', 'null', '2017-08-15 10:17:52', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1173', '12', '1', '爱', 'null', '2017-08-15 10:17:57', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1174', '12', '1', '是对方的身份', '上午10:21:03', '2017-08-15 10:21:03', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1175', '12', '1', '水电费得数 ', '上午10:21:08', '2017-08-15 10:21:08', '今冬', 'lcon6', '0');
INSERT INTO `chlhh245354431` VALUES ('1176', '12', '1', '法师答复速度', 'null', '2017-08-15 10:21:11', '王尼玛', 'lcon1', '1');
INSERT INTO `chlhh245354431` VALUES ('1177', '12', '1', '水电费速度', 'null', '2017-08-15 10:21:13', '今冬', 'lcon6', '0');

-- ----------------------------
-- Table structure for chmozhua
-- ----------------------------
DROP TABLE IF EXISTS `chmozhua`;
CREATE TABLE `chmozhua` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `lcon` varchar(20) DEFAULT NULL,
  `isLeft` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chmozhua
-- ----------------------------
INSERT INTO `chmozhua` VALUES ('54', '1', '13', '水电费是 ', '下午4:16:40', '2017-08-03 16:16:40', '魔爪', 'lcon4', '1');
INSERT INTO `chmozhua` VALUES ('55', '1', '13', '水电费健康； f', 'null', '2017-08-03 16:16:43', '魔爪', 'lcon4', '1');

-- ----------------------------
-- Table structure for chsicong
-- ----------------------------
DROP TABLE IF EXISTS `chsicong`;
CREATE TABLE `chsicong` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `lcon` varchar(20) DEFAULT NULL,
  `isLeft` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chsicong
-- ----------------------------
INSERT INTO `chsicong` VALUES ('19', '1', '4', '哈哈哈哈', '下午7:33:10', '2017-08-03 19:33:10', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('20', '1', '4', '嗯嗯呐', '下午7:33:17', '2017-08-03 19:33:17', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('21', '1', '4', '喜欢你', 'null', '2017-08-03 19:33:22', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('22', '1', '4', '回我啊', 'null', '2017-08-03 19:33:48', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('23', '1', '4', '不喜欢你', 'null', '2017-08-03 19:33:58', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('24', '1', '4', '你怎么', 'null', '2017-08-03 19:34:06', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('25', '12', '4', '可是我喜欢你', 'null', '2017-08-03 19:34:30', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('26', '12', '4', '纳米在你的李开复', '下午7:35:00', '2017-08-03 19:35:00', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('27', '12', '4', '发是副书记来看 ', '下午7:35:05', '2017-08-03 19:35:05', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('28', '12', '4', '第一条怎么回事', 'null', '2017-08-03 19:35:12', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('29', '1', '4', '咳咳', 'null', '2017-08-03 19:35:18', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('30', '1', '4', '酒店客房酒店', '下午7:35:35', '2017-08-03 19:35:35', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('31', '1', '4', '酒店开房间等我', 'null', '2017-08-03 19:36:04', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('32', '1', '4', '耶耶耶', '下午7:36:10', '2017-08-03 19:36:10', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('33', '1', '4', '\n            <img src=\"img/emoji/14.gif\">\n          ', 'null', '2017-08-03 19:38:13', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('34', '1', '4', '斯蒂芬森 速度', '下午7:40:22', '2017-08-03 19:40:22', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('35', '1', '4', '水电费水电费f', '下午7:40:27', '2017-08-03 19:40:27', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('36', '12', '4', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-03 19:40:37', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('37', '1', '4', '叫我个', 'null', '2017-08-03 19:41:38', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('38', '1', '4', '不叫', '下午7:41:44', '2017-08-03 19:41:44', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('39', '1', '4', '咋颇大', 'null', '2017-08-03 19:41:54', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('40', '1', '4', '沙发发生的好看是垃圾啊', '下午7:44:32', '2017-08-03 19:44:32', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('41', '1', '4', '顺丰到付撒旦按时', 'null', '2017-08-03 19:44:37', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('42', '1', '4', '水电费 发生的', 'null', '2017-08-03 19:44:42', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('43', '1', '4', '发生的故事打发时间看的；了', 'null', '2017-08-03 19:44:46', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('44', '12', '4', '是否是否水电费s', 'null', '2017-08-03 19:44:58', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('45', '1', '4', '爱你爱啊你', 'null', '2017-08-03 19:46:11', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('46', '1', '4', '富士达粉丝、', '下午7:47:08', '2017-08-03 19:47:08', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('47', '1', '4', '发生的啊发多少', '下午7:47:12', '2017-08-03 19:47:12', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('48', '12', '4', '爱啊你', 'null', '2017-08-03 19:47:24', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('49', '12', '4', '暗室逢灯撒发多少', 'null', '2017-08-03 19:47:31', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('50', '1', '4', '是否速度数据来看', 'null', '2017-08-03 19:47:38', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('51', '12', '4', '电费是富士康；了k', 'null', '2017-08-03 19:47:43', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('52', '1', '4', '是否是ufso ', 'null', '2017-08-03 19:47:54', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('53', '1', '4', '时代发生的发生的可怕 ', 'null', '2017-08-03 19:47:59', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('54', '1', '4', '双方的', 'null', '2017-08-03 19:48:04', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('55', '12', '4', '\n            <img src=\"img/emoji/15.gif\">\n          ', 'null', '2017-08-03 19:48:10', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('56', '1', '4', '是否速度速度看过了；电费g', 'null', '2017-08-03 19:48:17', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('57', '12', '4', '水电费速度 ', '下午7:48:26', '2017-08-03 19:48:26', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('58', '12', '4', '得数；奥卡福速度', '下午7:55:00', '2017-08-03 19:55:00', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('59', '12', '4', '水电费速度', '下午7:55:05', '2017-08-03 19:55:05', '今冬', 'lcon6', '0');
INSERT INTO `chsicong` VALUES ('60', '1', '4', '爱你哦', '下午7:55:17', '2017-08-03 19:55:17', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('61', '1', '4', '发给双方的 ', '下午7:55:24', '2017-08-03 19:55:24', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('62', '12', '4', '我爱你', 'null', '2017-08-03 19:55:45', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('63', '14', '4', 'sdfsd fsjdlk ', '下午7:59:06', '2017-08-03 19:59:06', '大张伟', 'lcon5', '0');
INSERT INTO `chsicong` VALUES ('64', '14', '4', 'sdfsdfjsldkjf ', '下午7:59:12', '2017-08-03 19:59:12', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('65', '1', '4', '时代发生的', '下午8:25:42', '2017-08-03 20:25:42', '王尼玛', 'lcon1', '0');
INSERT INTO `chsicong` VALUES ('66', '1', '4', '水电费速度', 'null', '2017-08-03 20:25:48', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('67', '1', '4', '法师答复得数', 'null', '2017-08-03 20:26:13', '思聪', 'lcon4', '1');
INSERT INTO `chsicong` VALUES ('68', '14', '4', '双方的速度', '下午8:26:34', '2017-08-03 20:26:34', '大张伟', 'lcon5', '0');
INSERT INTO `chsicong` VALUES ('69', '1', '4', '似懂非懂是', '下午8:31:53', '2017-08-03 20:31:53', '王尼玛', 'lcon1', '0');

-- ----------------------------
-- Table structure for chyangmi
-- ----------------------------
DROP TABLE IF EXISTS `chyangmi`;
CREATE TABLE `chyangmi` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `lcon` varchar(50) DEFAULT NULL,
  `isLeft` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of chyangmi
-- ----------------------------
INSERT INTO `chyangmi` VALUES ('48', '1', '6', '双方的得数', '下午8:30:38', '2017-08-03 20:30:38', null, null, '0');
INSERT INTO `chyangmi` VALUES ('49', '1', '6', '<a href=\"javascript:;\" class=\"picCheck\"><img src=\"http://127.0.0.1:8081/upload/pic-23.jpg\"></a>', '上午10:23:57', '2017-08-05 10:23:57', null, null, '0');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `lcon` varchar(30) DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `sign` varchar(100) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('35', '1', 'lhh245354431', 'lcon1', '王尼玛', '我是超级帅气的王尼玛放到', '4');
INSERT INTO `contacts` VALUES ('36', '4', 'sicong', 'lcon4', '思聪', '国名老公', '1');
INSERT INTO `contacts` VALUES ('37', '12', 'jindong', 'lcon6', '今冬', '我是美丽的今冬的风格的人个', '4');
INSERT INTO `contacts` VALUES ('38', '4', 'sicong', 'lcon4', '思聪', '国名老公', '12');
INSERT INTO `contacts` VALUES ('39', '1', 'lhh245354431', 'lcon1', '王尼玛', '我是超级帅气的王尼玛放到', '12');
INSERT INTO `contacts` VALUES ('40', '12', 'jindong', 'lcon6', '今冬', '我是美丽的今冬的风格的人个', '1');
INSERT INTO `contacts` VALUES ('41', '6', 'yangmi', 'lcon6', '杨幂', 'dj幂', '1');
INSERT INTO `contacts` VALUES ('42', '1', 'lhh245354431', 'lcon1', '王尼玛', '我是超级帅气的王尼玛放到', '6');
INSERT INTO `contacts` VALUES ('43', '6', 'yangmi', 'lcon6', '杨幂', 'dj幂', '12');
INSERT INTO `contacts` VALUES ('44', '12', 'jindong', 'lcon6', '今冬', '我是美丽的今冬的风格的人个', '6');
INSERT INTO `contacts` VALUES ('45', '6', 'yangmi', 'lcon6', '杨幂', 'dj幂', '4');
INSERT INTO `contacts` VALUES ('46', '4', 'sicong', 'lcon4', '思聪', '国名老公', '6');
INSERT INTO `contacts` VALUES ('47', '13', 'mozhua', 'lcon4', '魔爪', '啊不是都会计法速度', '12');
INSERT INTO `contacts` VALUES ('48', '12', 'jindong', 'lcon6', '今冬', '我是美丽的今冬的风格的人个', '13');
INSERT INTO `contacts` VALUES ('49', '13', 'mozhua', 'lcon4', '魔爪', '啊不是都会计法速度', '1');
INSERT INTO `contacts` VALUES ('50', '1', 'lhh245354431', 'lcon1', '王尼玛', '我是超级帅气的王尼玛放到', '13');
INSERT INTO `contacts` VALUES ('51', '6', 'yangmi', 'lcon6', '杨幂', 'dj幂', '13');
INSERT INTO `contacts` VALUES ('52', '13', 'mozhua', 'lcon4', '魔爪', '啊不是都会计法速度', '6');
INSERT INTO `contacts` VALUES ('53', '14', 'dazhangwei', 'lcon5', '大张伟', '', '1');
INSERT INTO `contacts` VALUES ('54', '1', 'lhh245354431', 'lcon1', '王尼玛', '我是超级帅气的王尼玛放到', '14');
INSERT INTO `contacts` VALUES ('55', '14', 'dazhangwei', 'lcon5', '大张伟', '', '4');
INSERT INTO `contacts` VALUES ('56', '4', 'sicong', 'lcon4', '思聪', '国名老公', '14');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `ulcon` varchar(50) DEFAULT NULL,
  `unick` varchar(50) DEFAULT NULL,
  `usign` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lhh245354431', 'ywwd0411', 'lcon1', '王尼玛', '我是超级帅气的王尼玛放到');
INSERT INTO `user` VALUES ('4', 'sicong', 'ywwd04113177', 'lcon4', '思聪', '国名老公');
INSERT INTO `user` VALUES ('6', 'yangmi', 'ywwd04113177', 'lcon6', '杨幂', 'dj幂');
INSERT INTO `user` VALUES ('12', 'jindong', 'ywwd04113177', 'lcon6', '今冬', '我是美丽的今冬的风格的人个');
INSERT INTO `user` VALUES ('13', 'mozhua', 'ywwd04113177', 'lcon4', '魔爪', '啊不是都会计法速度');
INSERT INTO `user` VALUES ('14', 'dazhangwei', 'ywwd04113177', 'lcon5', '大张伟', '');
