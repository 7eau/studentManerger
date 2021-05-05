package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
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