/*
 Navicat Premium Data Transfer

 Source Server         : ExamDBCloud
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 47.97.51.81:3306
 Source Schema         : trainTicketer

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 04/10/2022 18:50:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminInfo
-- ----------------------------
DROP TABLE IF EXISTS `adminInfo`;
CREATE TABLE `adminInfo`  (
  `accountNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账户名称',
  `accountPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户密码',
  `isCancelled` tinyint(1) NULL DEFAULT 0 COMMENT '是否注销',
  PRIMARY KEY (`accountNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for areaCode
-- ----------------------------
DROP TABLE IF EXISTS `areaCode`;
CREATE TABLE `areaCode`  (
  `code` bigint(0) UNSIGNED NOT NULL COMMENT '区划代码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint(1) NOT NULL COMMENT '级别1-5,省市县镇村',
  `pcode` bigint(0) NULL DEFAULT NULL COMMENT '父级区划代码',
  PRIMARY KEY (`code`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `pcode`(`pcode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '行政区划划分表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for customerInfo
-- ----------------------------
DROP TABLE IF EXISTS `customerInfo`;
CREATE TABLE `customerInfo`  (
  `phoneNum` bigint(0) NOT NULL COMMENT '乘客电话',
  `idCardNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '乘客身份证号码',
  `customerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '乘客姓名',
  PRIMARY KEY (`phoneNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for permissionApply
-- ----------------------------
DROP TABLE IF EXISTS `permissionApply`;
CREATE TABLE `permissionApply`  (
  `permissionId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '申请Id',
  `customerPhone` bigint(0) NOT NULL COMMENT '申请人手机号 电话号码',
  `trainLicense` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '火车代码',
  `carriageNum` int(0) NULL DEFAULT NULL COMMENT '车厢号',
  `seatNum` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '座位号',
  `cityId` bigint(0) NOT NULL COMMENT '目的城市Id',
  `originLocation` int(0) NOT NULL COMMENT '始发地数据代码',
  `habitualResidence` int(0) NOT NULL COMMENT '经常居住地',
  `bookTime` datetime(0) NOT NULL COMMENT '计划到达时间精确到天',
  `applyStatus` int(0) NOT NULL DEFAULT 0 COMMENT '申请状态 0已申请但未处理 1同意 2不同意',
  `dealTime` datetime(0) NULL DEFAULT NULL COMMENT '请求处理时间',
  PRIMARY KEY (`permissionId`) USING BTREE,
  INDEX `customerPhone`(`customerPhone`) USING BTREE,
  CONSTRAINT `permissionApply_ibfk_1` FOREIGN KEY (`customerPhone`) REFERENCES `customerInfo` (`phoneNum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for seatInfo
-- ----------------------------
DROP TABLE IF EXISTS `seatInfo`;
CREATE TABLE `seatInfo`  (
  `trainId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '火车Id',
  `trainCarriage` int(0) NULL DEFAULT NULL COMMENT '车厢号',
  `trainSeat` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '座位号',
  `seatAvailable` tinyint(1) NULL DEFAULT NULL COMMENT '座位是否可用',
  PRIMARY KEY (`trainId`) USING BTREE,
  CONSTRAINT `seatInfo_ibfk_1` FOREIGN KEY (`trainId`) REFERENCES `trainInfo` (`trainId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stationInfo
-- ----------------------------
DROP TABLE IF EXISTS `stationInfo`;
CREATE TABLE `stationInfo`  (
  `stationId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '火车站唯一代码',
  `stationName` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '火车站名字',
  `stationPlace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '火车站地址',
  `cityCode` bigint(0) NULL DEFAULT NULL COMMENT '城市代码',
  PRIMARY KEY (`stationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1241 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for traceList
-- ----------------------------
DROP TABLE IF EXISTS `traceList`;
CREATE TABLE `traceList`  (
  `trainId` bigint(0) NULL DEFAULT NULL COMMENT '火车Id',
  `traceId` bigint(0) NOT NULL COMMENT '车次编号',
  `stationId` bigint(0) NULL DEFAULT NULL COMMENT '火车站编号',
  `stopNum` int(0) NULL DEFAULT NULL COMMENT '第几站',
  PRIMARY KEY (`traceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trainInfo
-- ----------------------------
DROP TABLE IF EXISTS `trainInfo`;
CREATE TABLE `trainInfo`  (
  `trainId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '火车编号',
  `trainStartPlace` bigint(0) NULL DEFAULT NULL COMMENT '火车始发地代号',
  `trainEndPlace` bigint(0) NULL DEFAULT NULL COMMENT '火车结束地代号',
  `firstSeatNum` int(0) NULL DEFAULT NULL COMMENT '火车一等座数量',
  `secondSeatNum` int(0) NULL DEFAULT NULL COMMENT '火车二等座数量',
  `thirdSeatNum` int(0) NULL DEFAULT NULL COMMENT '火车三等座数量',
  PRIMARY KEY (`trainId`) USING BTREE,
  INDEX `trainStartPlace`(`trainStartPlace`) USING BTREE,
  INDEX `trainEndPlace`(`trainEndPlace`) USING BTREE,
  CONSTRAINT `trainInfo_ibfk_1` FOREIGN KEY (`trainStartPlace`) REFERENCES `stationInfo` (`stationId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `trainInfo_ibfk_2` FOREIGN KEY (`trainEndPlace`) REFERENCES `stationInfo` (`stationId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
