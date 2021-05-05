package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class TeacherCourse {
    /**
    * teacher_course 表id
    */
    private Integer id;

    /**
    * 教师id
    */
    private Integer teacherid;

    /**
    * 课程id
    */
    private Integer courseid;
}