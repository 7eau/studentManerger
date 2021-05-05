package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Course {
    /**
    * 课程Id
    */
    private Integer id;

    /**
    * 课程名称
    */
    private String name;

    /**
    * 课程类型
    */
    private Integer coursetype;

    /**
    * 课程学分
    */
    private String score;
}