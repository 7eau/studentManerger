package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class StuCourse {
    /**
    * 选课Id
    */
    private Integer id;

    /**
    * 学生id
    */
    private Integer studentId;

    /**
    * 课程Id
    */
    private Integer courseId;

    /**
    * 课程成绩
    */
    private Integer score;
}