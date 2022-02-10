/*
 Navicat Premium Data Transfer

 Source Server         : Spring_2021
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : forest_films

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 15/04/2021 13:51:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `Client_Id` int NOT NULL,
  `Client_Name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Client_Contact` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Client_Email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Client_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (101, 'Epom Motors', '+8801622146788', 'epommotors@gmail.com');
INSERT INTO `client` VALUES (102, 'Ministry of Agriculture,Fisheries and Food', '+8801310274019', 'ministryag@gmail.com');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `Location_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Location_Name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Location_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('L401', 'Millwall Park, Isle of Dogs, London');
INSERT INTO `location` VALUES ('L402', 'Windsor Castle, Grounds');
INSERT INTO `location` VALUES ('L403', 'Orford Ness, Suffolk');
INSERT INTO `location` VALUES ('L404', 'Rancid Attic Studio');
INSERT INTO `location` VALUES ('L405', 'St James\'s Park, London');

-- ----------------------------
-- Table structure for production
-- ----------------------------
DROP TABLE IF EXISTS `production`;
CREATE TABLE `production`  (
  `Production_Id` int NOT NULL,
  `No_of_Days` int NULL DEFAULT NULL,
  `Client_Id` int NULL DEFAULT NULL,
  `Production_Type_Code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Production_Id`) USING BTREE,
  INDEX `FK_1`(`Client_Id`) USING BTREE,
  INDEX `FK_2`(`Production_Type_Code`) USING BTREE,
  CONSTRAINT `FK_1` FOREIGN KEY (`Client_Id`) REFERENCES `client` (`Client_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_2` FOREIGN KEY (`Production_Type_Code`) REFERENCES `production_type` (`Production_Type_Code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of production
-- ----------------------------
INSERT INTO `production` VALUES (2, 5, 101, 'PT101');
INSERT INTO `production` VALUES (6, 1, 102, 'PT102');
INSERT INTO `production` VALUES (7, 2, 102, 'PT103');

-- ----------------------------
-- Table structure for production_location
-- ----------------------------
DROP TABLE IF EXISTS `production_location`;
CREATE TABLE `production_location`  (
  `Production_Id` int NOT NULL,
  `Location_Code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Production_Id`, `Location_Code`) USING BTREE,
  INDEX `FK_8`(`Location_Code`) USING BTREE,
  CONSTRAINT `FK_7` FOREIGN KEY (`Production_Id`) REFERENCES `production` (`Production_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_8` FOREIGN KEY (`Location_Code`) REFERENCES `location` (`Location_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of production_location
-- ----------------------------
INSERT INTO `production_location` VALUES (2, 'L401');
INSERT INTO `production_location` VALUES (2, 'L402');
INSERT INTO `production_location` VALUES (6, 'L403');
INSERT INTO `production_location` VALUES (6, 'L404');
INSERT INTO `production_location` VALUES (7, 'L405');

-- ----------------------------
-- Table structure for production_property
-- ----------------------------
DROP TABLE IF EXISTS `production_property`;
CREATE TABLE `production_property`  (
  `Production_Id` int NOT NULL,
  `Property_Id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Production_Id`, `Property_Id`) USING BTREE,
  INDEX `FK_6`(`Property_Id`) USING BTREE,
  CONSTRAINT `FK_5` FOREIGN KEY (`Production_Id`) REFERENCES `production` (`Production_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6` FOREIGN KEY (`Property_Id`) REFERENCES `property` (`Property_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of production_property
-- ----------------------------
INSERT INTO `production_property` VALUES (2, '501');
INSERT INTO `production_property` VALUES (2, '502');
INSERT INTO `production_property` VALUES (6, '503');
INSERT INTO `production_property` VALUES (7, '504');

-- ----------------------------
-- Table structure for production_staff_type
-- ----------------------------
DROP TABLE IF EXISTS `production_staff_type`;
CREATE TABLE `production_staff_type`  (
  `Production_Id` int NOT NULL,
  `Staff_Type_Code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`Production_Id`, `Staff_Type_Code`) USING BTREE,
  INDEX `FK_10`(`Staff_Type_Code`) USING BTREE,
  CONSTRAINT `FK_10` FOREIGN KEY (`Staff_Type_Code`) REFERENCES `staff_type` (`Staff_Type_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_9` FOREIGN KEY (`Production_Id`) REFERENCES `production` (`Production_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of production_staff_type
-- ----------------------------
INSERT INTO `production_staff_type` VALUES (2, 'A204', 3);
INSERT INTO `production_staff_type` VALUES (2, 'CC201', 2);
INSERT INTO `production_staff_type` VALUES (2, 'P203', 1);
INSERT INTO `production_staff_type` VALUES (2, 'R202', 1);
INSERT INTO `production_staff_type` VALUES (6, 'CC201', 2);
INSERT INTO `production_staff_type` VALUES (6, 'P203', 1);
INSERT INTO `production_staff_type` VALUES (6, 'R202', 1);
INSERT INTO `production_staff_type` VALUES (6, 'VA205', 1);
INSERT INTO `production_staff_type` VALUES (7, 'CC201', 2);
INSERT INTO `production_staff_type` VALUES (7, 'P203', 1);
INSERT INTO `production_staff_type` VALUES (7, 'R202', 1);
INSERT INTO `production_staff_type` VALUES (7, 'VA205', 1);

-- ----------------------------
-- Table structure for production_type
-- ----------------------------
DROP TABLE IF EXISTS `production_type`;
CREATE TABLE `production_type`  (
  `Production_Type_Code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Production_Type_Name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Production_Type_Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of production_type
-- ----------------------------
INSERT INTO `production_type` VALUES ('PT101', 'Advertisement');
INSERT INTO `production_type` VALUES ('PT102', 'Information Film');
INSERT INTO `production_type` VALUES ('PT103', 'Training Film');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `Property_Id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Property_Name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Property_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('501', 'Featured Vehicle');
INSERT INTO `property` VALUES ('502', 'Wrecked Car');
INSERT INTO `property` VALUES ('503', 'None');
INSERT INTO `property` VALUES ('504', 'Tractor');

-- ----------------------------
-- Table structure for property_location
-- ----------------------------
DROP TABLE IF EXISTS `property_location`;
CREATE TABLE `property_location`  (
  `Location_Code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Property_Id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Location_Code`, `Property_Id`) USING BTREE,
  INDEX `FK_4`(`Property_Id`) USING BTREE,
  CONSTRAINT `FK_3` FOREIGN KEY (`Location_Code`) REFERENCES `location` (`Location_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_4` FOREIGN KEY (`Property_Id`) REFERENCES `property` (`Property_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property_location
-- ----------------------------
INSERT INTO `property_location` VALUES ('L401', '501');
INSERT INTO `property_location` VALUES ('L401', '502');
INSERT INTO `property_location` VALUES ('L402', '501');
INSERT INTO `property_location` VALUES ('L403', '503');
INSERT INTO `property_location` VALUES ('L404', '503');
INSERT INTO `property_location` VALUES ('L405', '504');

-- ----------------------------
-- Table structure for staff_type
-- ----------------------------
DROP TABLE IF EXISTS `staff_type`;
CREATE TABLE `staff_type`  (
  `Staff_Type_Code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Staff_Type_Name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Per_Day_Cost` int NULL DEFAULT NULL,
  PRIMARY KEY (`Staff_Type_Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff_type
-- ----------------------------
INSERT INTO `staff_type` VALUES ('A204', 'Actor', 10000);
INSERT INTO `staff_type` VALUES ('CC201', 'Camera Crew', 8000);
INSERT INTO `staff_type` VALUES ('P203', 'Producer', 7500);
INSERT INTO `staff_type` VALUES ('R202', 'Runner', 3000);
INSERT INTO `staff_type` VALUES ('VA205', 'Voice Actor', 2500);

SET FOREIGN_KEY_CHECKS = 1;
