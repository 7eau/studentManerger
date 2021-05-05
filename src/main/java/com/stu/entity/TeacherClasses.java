package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class TeacherClasses {
    /**
    * teacher_class表id
    */
    private Integer id;

    /**
    * 教师id
    */
    private Integer teacherid;

    /**
    * 班级id
    */
    private Integer classesid;
}