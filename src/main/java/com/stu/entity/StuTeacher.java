package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class StuTeacher {
    /**
    * teacher_stu表Id
    */
    private Integer id;

    /**
    * 教师ID
    */
    private Integer teacherid;

    /**
    * 学生ID
    */
    private Integer stuid;
}