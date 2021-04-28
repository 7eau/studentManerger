/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : stumanager

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 28/04/2021 15:18:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员账号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '管理员', 'admin');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程Id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `courseType` int(11) NULL DEFAULT NULL COMMENT '课程类型',
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程学分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CourseType`(`courseType`) USING BTREE,
  CONSTRAINT `FK_CourseType` FOREIGN KEY (`courseType`) REFERENCES `coursetype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '软件工程', 2, '3');
INSERT INTO `course` VALUES (2, '计算机图形学', 2, '4');
INSERT INTO `course` VALUES (3, '计算机网络', 2, '3');
INSERT INTO `course` VALUES (8, '测试课程', 2, '1');
INSERT INTO `course` VALUES (9, 'C语言程序设计', 2, '1');
INSERT INTO `course` VALUES (10, '普通话', 3, '2');
INSERT INTO `course` VALUES (11, '数据结构', 2, '2.0');
INSERT INTO `course` VALUES (12, '高数', 1, '2.0');

-- ----------------------------
-- Table structure for coursetype
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES (1, '工科');
INSERT INTO `coursetype` VALUES (2, '计算机必修');
INSERT INTO `coursetype` VALUES (3, '公共课程');
INSERT INTO `coursetype` VALUES (4, '理科');

-- ----------------------------
-- Table structure for dormi_zone
-- ----------------------------
DROP TABLE IF EXISTS `dormi_zone`;
CREATE TABLE `dormi_zone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dormi_zone
-- ----------------------------
INSERT INTO `dormi_zone` VALUES (1, '芷兰');
INSERT INTO `dormi_zone` VALUES (2, '丰泽');
INSERT INTO `dormi_zone` VALUES (3, '东湖');
INSERT INTO `dormi_zone` VALUES (4, '金岸');

-- ----------------------------
-- Table structure for punish
-- ----------------------------
DROP TABLE IF EXISTS `punish`;
CREATE TABLE `punish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '惩罚id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '惩罚学生Id',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '惩罚内容',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_StudentId_punish`(`student_id`) USING BTREE,
  CONSTRAINT `FK_StudentId_punish` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of punish
-- ----------------------------
INSERT INTO `punish` VALUES (2, 33, '第二节课翘课', '2018-06-12');
INSERT INTO `punish` VALUES (3, 33, '1', '2018-06-04');

-- ----------------------------
-- Table structure for quality
-- ----------------------------
DROP TABLE IF EXISTS `quality`;
CREATE TABLE `quality`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '素质拓展Id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '素质拓展活动名称',
  `score` float NULL DEFAULT NULL COMMENT '素质拓展分数',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '选择学生id',
  `time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_StudentId_quality`(`student_id`) USING BTREE,
  CONSTRAINT `FK_StudentId_quality` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quality
-- ----------------------------
INSERT INTO `quality` VALUES (1, 'a', 1, 38, '2021-03-31');

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '奖励Id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '奖励学生Id',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励内容',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_StudentId_reward`(`student_id`) USING BTREE,
  CONSTRAINT `FK_StudentId_reward` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reward
-- ----------------------------

-- ----------------------------
-- Table structure for stu_afl
-- ----------------------------
DROP TABLE IF EXISTS `stu_afl`;
CREATE TABLE `stu_afl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approve` int(11) NULL DEFAULT 0,
  `approve_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approve_admin_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_StudentId_afl`(`student_id`) USING BTREE,
  CONSTRAINT `FK_StudentId_afl` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_afl
-- ----------------------------
INSERT INTO `stu_afl` VALUES (7, 33, '学生会开会', '2018-06-03', '2018-06-06', 1, NULL, NULL);
INSERT INTO `stu_afl` VALUES (8, 33, '考试', '2018-06-03', '2018-06-04', 1, NULL, NULL);
INSERT INTO `stu_afl` VALUES (9, 34, 'huijia', '2018-06-03', '2018-06-05', 0, NULL, NULL);
INSERT INTO `stu_afl` VALUES (10, 33, '测试', '2018-06-03', '2018-06-06', 1, NULL, NULL);

-- ----------------------------
-- Table structure for stu_course
-- ----------------------------
DROP TABLE IF EXISTS `stu_course`;
CREATE TABLE `stu_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选课Id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程Id',
  `score` int(11) NULL DEFAULT NULL COMMENT '课程成绩',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_StudentId_course`(`student_id`) USING BTREE,
  INDEX `FK_CourseId`(`course_id`) USING BTREE,
  CONSTRAINT `FK_CourseId` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_StudentId_course` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_course
-- ----------------------------
INSERT INTO `stu_course` VALUES (1, 34, 1, 12);
INSERT INTO `stu_course` VALUES (3, 33, 2, 60);
INSERT INTO `stu_course` VALUES (7, 34, 2, NULL);
INSERT INTO `stu_course` VALUES (9, 34, 8, 65);
INSERT INTO `stu_course` VALUES (10, 33, 8, 80);
INSERT INTO `stu_course` VALUES (11, 35, 8, NULL);
INSERT INTO `stu_course` VALUES (12, 35, 1, 87);
INSERT INTO `stu_course` VALUES (14, 35, 3, NULL);
INSERT INTO `stu_course` VALUES (18, 34, 9, 90);
INSERT INTO `stu_course` VALUES (19, 33, 9, 86);
INSERT INTO `stu_course` VALUES (20, 35, 2, NULL);
INSERT INTO `stu_course` VALUES (22, 35, 9, 60);
INSERT INTO `stu_course` VALUES (23, 37, 9, 75);
INSERT INTO `stu_course` VALUES (24, 37, 8, NULL);
INSERT INTO `stu_course` VALUES (25, 37, 3, 90);
INSERT INTO `stu_course` VALUES (26, 37, 1, NULL);
INSERT INTO `stu_course` VALUES (27, 33, 3, NULL);
INSERT INTO `stu_course` VALUES (29, 33, 10, NULL);
INSERT INTO `stu_course` VALUES (30, 35, 11, NULL);
INSERT INTO `stu_course` VALUES (31, 33, 12, NULL);
INSERT INTO `stu_course` VALUES (32, 34, 3, NULL);

-- ----------------------------
-- Table structure for stu_dormitory
-- ----------------------------
DROP TABLE IF EXISTS `stu_dormitory`;
CREATE TABLE `stu_dormitory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `zone_id` int(11) NULL DEFAULT NULL,
  `building` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_stu_id`(`stu_id`) USING BTREE,
  INDEX `FK_zone_id`(`zone_id`) USING BTREE,
  CONSTRAINT `FK_stu_id` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `dormi_zone` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_dormitory
-- ----------------------------
INSERT INTO `stu_dormitory` VALUES (4, 33, 4, '03', '334');
INSERT INTO `stu_dormitory` VALUES (5, 37, 2, '01', '204');
INSERT INTO `stu_dormitory` VALUES (7, 38, 3, '10', '203');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (33, '张三', '11111111111111111', '男', '187xxxxxxxx', '123456789', '4875772fdf58243@qq.com', '湖南省长沙市芙蓉区东湖路');
INSERT INTO `student` VALUES (34, '李四', '22222222222222222', '女', '135XXXXXXX', '123456789', '184dsa8551111165@qq.com', '湖南省长沙市芙蓉区湖南农业大学');
INSERT INTO `student` VALUES (35, '小明', '33333333333333333', '男', '135XXXXXXX', '123456789', '1485697525281547@qq.com', '湖南省长沙市芙蓉区东湖路');
INSERT INTO `student` VALUES (37, '蔡梦婷', '430223199712208325', '女', '187110430821', '', '', '');
INSERT INTO `student` VALUES (38, '颜妃', '430223199612048326', '女', '18711013082', '2659231576', '1485697525281547@qq.com', '');

-- ----------------------------
-- Table structure for switch
-- ----------------------------
DROP TABLE IF EXISTS `switch`;
CREATE TABLE `switch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开关id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开关名称',
  `state` int(11) NULL DEFAULT NULL COMMENT '开关状态(1位打开状态)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of switch
-- ----------------------------
INSERT INTO `switch` VALUES (1, 'studentSwitch', 0);
INSERT INTO `switch` VALUES (2, 'courseSwitch', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `stuId` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `reset` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_StudentId_user`(`stuId`) USING BTREE,
  CONSTRAINT `FK_StudentId_user` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (6, '17050506116', '123456', 34, '0');
INSERT INTO `user` VALUES (7, '123', '123', 33, '1');
INSERT INTO `user` VALUES (9, '17060606125', '456123', 37, '1');
INSERT INTO `user` VALUES (10, '17050506126', '123456', 35, '0');
INSERT INTO `user` VALUES (11, '456', '123456', 38, '0');

SET FOREIGN_KEY_CHECKS = 1;
