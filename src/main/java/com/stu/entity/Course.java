package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
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