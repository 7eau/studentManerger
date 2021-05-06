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

 Date: 06/05/2021 13:51:10
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
  `type` int(11) NULL DEFAULT NULL COMMENT '管理员类型',
  `teacherId` int(11) NULL DEFAULT NULL COMMENT '教师账户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `管理员类型约束`(`type`) USING BTREE,
  INDEX `教师id约束`(`teacherId`) USING BTREE,
  CONSTRAINT `管理员类型约束` FOREIGN KEY (`type`) REFERENCES `admin_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `教师id约束` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '管理员', '123', 1, NULL);
INSERT INTO `admin` VALUES (2, 'classadmin', '管理员', 'admin', 2, NULL);
INSERT INTO `admin` VALUES (3, 'teacher', '管理员', 'admin', 3, NULL);
INSERT INTO `admin` VALUES (4, 'dormitory', '管理员', 'admin', 4, NULL);
INSERT INTO `admin` VALUES (5, 'teacher1', '管理员', '123', 3, 1);
INSERT INTO `admin` VALUES (6, 'teacher2', '管理员', '123', 3, 2);
INSERT INTO `admin` VALUES (7, 'teacher3', '管理员', '123', 3, 3);
INSERT INTO `admin` VALUES (8, 'teacher4', '管理员', '123', 3, 4);
INSERT INTO `admin` VALUES (9, 'teacher5', '管理员', '123', 3, 5);
INSERT INTO `admin` VALUES (10, 'teacher6', '管理员', '123', 3, 6);
INSERT INTO `admin` VALUES (11, 'teacher7', '管理员', '123', 3, 7);
INSERT INTO `admin` VALUES (12, 'teacher8', '管理员', '123', 3, 8);
INSERT INTO `admin` VALUES (13, 'teacher9', '管理员', '123', 3, 9);
INSERT INTO `admin` VALUES (14, 'teacher10', '管理员', '123', 3, 10);
INSERT INTO `admin` VALUES (15, 'teacher11', '管理员', '123', 3, 11);
INSERT INTO `admin` VALUES (16, 'teacher12', '管理员', '123', 3, 12);
INSERT INTO `admin` VALUES (17, 'teacher13', '管理员', '123', 3, 13);
INSERT INTO `admin` VALUES (18, 'teacher14', '管理员', '123', 3, 14);
INSERT INTO `admin` VALUES (19, 'teacher15', '管理员', '123', 3, 15);
INSERT INTO `admin` VALUES (20, 'teacher16', '管理员', '123', 3, 16);
INSERT INTO `admin` VALUES (21, 'teacher17', '管理员', '123', 3, 17);

-- ----------------------------
-- Table structure for admin_type
-- ----------------------------
DROP TABLE IF EXISTS `admin_type`;
CREATE TABLE `admin_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员类型id',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员类型描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_type
-- ----------------------------
INSERT INTO `admin_type` VALUES (1, '校管理员');
INSERT INTO `admin_type` VALUES (2, '班级管理员');
INSERT INTO `admin_type` VALUES (3, '教师');
INSERT INTO `admin_type` VALUES (4, '宿舍管理员');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `number` int(11) NULL DEFAULT NULL COMMENT '班级名称',
  `majorId` int(11) NULL DEFAULT NULL COMMENT '专业名称',
  `level` int(11) NULL DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `班级-专业约束`(`majorId`) USING BTREE,
  CONSTRAINT `班级-专业约束` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, 1, 1, 17);
INSERT INTO `classes` VALUES (2, 2, 1, 17);
INSERT INTO `classes` VALUES (3, 1, 2, 17);
INSERT INTO `classes` VALUES (4, 2, 2, 17);
INSERT INTO `classes` VALUES (5, 1, 3, 17);
INSERT INTO `classes` VALUES (6, 2, 3, 17);
INSERT INTO `classes` VALUES (7, 1, 4, 17);
INSERT INTO `classes` VALUES (8, 2, 4, 17);
INSERT INTO `classes` VALUES (9, 1, 1, 16);
INSERT INTO `classes` VALUES (10, 2, 1, 16);
INSERT INTO `classes` VALUES (11, 1, 2, 16);
INSERT INTO `classes` VALUES (12, 2, 2, 16);
INSERT INTO `classes` VALUES (13, 1, 3, 16);
INSERT INTO `classes` VALUES (14, 2, 3, 16);
INSERT INTO `classes` VALUES (15, 1, 4, 16);
INSERT INTO `classes` VALUES (16, 2, 4, 16);

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
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '计算机科学与技术');
INSERT INTO `major` VALUES (2, '软件工程');
INSERT INTO `major` VALUES (3, '应用数学');
INSERT INTO `major` VALUES (4, '网络工程');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_afl
-- ----------------------------
INSERT INTO `stu_afl` VALUES (7, 33, '学生会开会', '2018-06-03', '2018-06-06', 1, NULL, NULL);
INSERT INTO `stu_afl` VALUES (8, 33, '考试', '2018-06-03', '2018-06-04', 1, NULL, NULL);
INSERT INTO `stu_afl` VALUES (9, 34, 'huijia', '2018-06-03', '2018-06-05', 1, NULL, NULL);
INSERT INTO `stu_afl` VALUES (10, 33, '测试', '2018-06-03', '2018-06-06', 1, NULL, NULL);
INSERT INTO `stu_afl` VALUES (11, 33, '020230', '2021-04-05', '2021-04-14', 1, NULL, NULL);

-- ----------------------------
-- Table structure for stu_class
-- ----------------------------
DROP TABLE IF EXISTS `stu_class`;
CREATE TABLE `stu_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生_班级表ID',
  `classId` int(11) NULL DEFAULT NULL COMMENT '班级ID',
  `stuId` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `班级约束`(`classId`) USING BTREE,
  INDEX `学生约束`(`stuId`) USING BTREE,
  CONSTRAINT `班级约束` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `学生约束` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_class
-- ----------------------------
INSERT INTO `stu_class` VALUES (1, 1, 34);
INSERT INTO `stu_class` VALUES (2, 1, 36);
INSERT INTO `stu_class` VALUES (3, 2, 35);
INSERT INTO `stu_class` VALUES (7, 4, 37);
INSERT INTO `stu_class` VALUES (8, 1, 38);
INSERT INTO `stu_class` VALUES (9, 2, 33);

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_course
-- ----------------------------
INSERT INTO `stu_course` VALUES (1, 34, 1, 98);
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
INSERT INTO `stu_course` VALUES (33, 33, 11, NULL);
INSERT INTO `stu_course` VALUES (34, 34, 10, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_dormitory
-- ----------------------------
INSERT INTO `stu_dormitory` VALUES (4, 33, 4, '03', '334');
INSERT INTO `stu_dormitory` VALUES (5, 37, 2, '01', '204');
INSERT INTO `stu_dormitory` VALUES (8, 34, 2, '14', '314');
INSERT INTO `stu_dormitory` VALUES (9, 35, 2, '14', '314');

-- ----------------------------
-- Table structure for stu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `stu_teacher`;
CREATE TABLE `stu_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'teacher_stu表Id',
  `teacherId` int(11) NULL DEFAULT NULL COMMENT '教师ID',
  `stuId` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stu_tea表stuId约束`(`stuId`) USING BTREE,
  INDEX `stu_tea表teacherId约束`(`teacherId`) USING BTREE,
  CONSTRAINT `stu_tea表stuId约束` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_tea表teacherId约束` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_teacher
-- ----------------------------
INSERT INTO `stu_teacher` VALUES (1, 2, 33);
INSERT INTO `stu_teacher` VALUES (3, 1, 34);
INSERT INTO `stu_teacher` VALUES (4, 2, 35);
INSERT INTO `stu_teacher` VALUES (5, 1, 36);
INSERT INTO `stu_teacher` VALUES (6, 3, 37);
INSERT INTO `stu_teacher` VALUES (7, 1, 38);

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
INSERT INTO `student` VALUES (36, '刘云海', '11111111111111111', '男', '132xxxxxxx', NULL, 'heatieasy@qq.com', NULL);
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
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师u姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '教师1', '男', '138xxxx0011', 'aabb@163.com');
INSERT INTO `teacher` VALUES (2, '教师1', '男', '138xxxx0011', 'aabb1@163.com');
INSERT INTO `teacher` VALUES (3, '教师2', '男', '138xxxx0012', 'aabb2@163.com');
INSERT INTO `teacher` VALUES (4, '教师3', '男', '138xxxx0013', 'aabb3@163.com');
INSERT INTO `teacher` VALUES (5, '教师4', '女', '138xxxx0014', 'aabb4@163.com');
INSERT INTO `teacher` VALUES (6, '教师5', '男', '138xxxx0015', 'aabb5@163.com');
INSERT INTO `teacher` VALUES (7, '教师6', '女', '138xxxx0016', 'aabb6@163.com');
INSERT INTO `teacher` VALUES (8, '教师7', '男', '138xxxx0017', 'aabb7@163.com');
INSERT INTO `teacher` VALUES (9, '教师8', '女', '138xxxx0018', 'aabb8@163.com');
INSERT INTO `teacher` VALUES (10, '教师9', '男', '138xxxx0019', 'aabb9@163.com');
INSERT INTO `teacher` VALUES (11, '教师10', '女', '138xxxx0021', 'aabb10@163.com');
INSERT INTO `teacher` VALUES (12, '教师11', '女', '138xxxx0022', 'aabb11@163.com');
INSERT INTO `teacher` VALUES (13, '教师12', '女', '138xxxx0023', 'aabb12@163.com');
INSERT INTO `teacher` VALUES (14, '教师13', '女', '138xxxx0024', 'aabb13@163.com');
INSERT INTO `teacher` VALUES (15, '教师14', '女', '138xxxx0025', 'aabb14@163.com');
INSERT INTO `teacher` VALUES (16, '教师15', '男', '138xxxx0026', 'aabb15@163.com');
INSERT INTO `teacher` VALUES (17, '教师16', '男', '138xxxx0027', 'aabb16@163.com');

-- ----------------------------
-- Table structure for teacher_classes
-- ----------------------------
DROP TABLE IF EXISTS `teacher_classes`;
CREATE TABLE `teacher_classes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'teacher_class表id',
  `teacherid` int(11) NULL DEFAULT NULL COMMENT '教师id',
  `classesid` int(11) NULL DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_c表教师id约束`(`teacherid`) USING BTREE,
  INDEX `t_c表班级id越苏`(`classesid`) USING BTREE,
  CONSTRAINT `t_c表班级id越苏` FOREIGN KEY (`classesid`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_c表教师id约束` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_classes
-- ----------------------------
INSERT INTO `teacher_classes` VALUES (1, 1, 1);
INSERT INTO `teacher_classes` VALUES (2, 2, 2);
INSERT INTO `teacher_classes` VALUES (3, 3, 3);
INSERT INTO `teacher_classes` VALUES (4, 2, 1);
INSERT INTO `teacher_classes` VALUES (5, 2, 4);
INSERT INTO `teacher_classes` VALUES (6, 3, 1);
INSERT INTO `teacher_classes` VALUES (7, 3, 2);
INSERT INTO `teacher_classes` VALUES (8, 4, 1);
INSERT INTO `teacher_classes` VALUES (9, 4, 2);
INSERT INTO `teacher_classes` VALUES (10, 4, 3);

-- ----------------------------
-- Table structure for teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `teacher_course`;
CREATE TABLE `teacher_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'teacher_course 表id',
  `teacherId` int(11) NULL DEFAULT NULL COMMENT '教师id',
  `courseId` int(11) NULL DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id约束`(`teacherId`) USING BTREE,
  INDEX `t_c表c id约束`(`courseId`) USING BTREE,
  CONSTRAINT `id约束` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_c表c id约束` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_course
-- ----------------------------
INSERT INTO `teacher_course` VALUES (1, 1, 1);
INSERT INTO `teacher_course` VALUES (2, 2, 2);
INSERT INTO `teacher_course` VALUES (3, 3, 3);
INSERT INTO `teacher_course` VALUES (4, 4, 8);
INSERT INTO `teacher_course` VALUES (5, 5, 9);
INSERT INTO `teacher_course` VALUES (6, 6, 10);
INSERT INTO `teacher_course` VALUES (7, 7, 11);
INSERT INTO `teacher_course` VALUES (8, 8, 12);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (6, '17050506116', '123', 34, '1');
INSERT INTO `user` VALUES (7, '123', '123', 33, '1');
INSERT INTO `user` VALUES (9, '17060606125', '456123', 37, '1');
INSERT INTO `user` VALUES (10, '17050506126', '123456', 35, '0');
INSERT INTO `user` VALUES (11, '456', '123', 38, '0');
INSERT INTO `user` VALUES (12, 'lyh', '123456', 36, '0');

SET FOREIGN_KEY_CHECKS = 1;
