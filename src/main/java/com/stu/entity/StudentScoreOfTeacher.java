package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class StudentScoreOfTeacher {
    /**
     * stu_course表id
     */
    private Integer id;
    /**
     * 课程名称
     */
    private String courseName;
    /**
     * 学生名称
     */
    private String studentName;
    /**
     * 班级号
     */
    private Integer number;
    /**
     * 入学年份
     */
    private Integer level;
    /**
     * 专业名称
     */
    private String majorName;
    /**
     * 学生成绩
     */
    private Integer score;
    /**
     * 学生ID
     */
    private Integer studentId;
    /**
     * 课程ID
     */
    private Integer courseId;
}
