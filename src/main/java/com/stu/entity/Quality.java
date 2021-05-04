package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Quality {
    /**
    * 素质拓展Id
    */
    private Integer id;

    /**
    * 素质拓展活动名称
    */
    private String name;

    /**
    * 素质拓展分数
    */
    private Double score;

    /**
    * 学生id
    */
    private Integer studentId;
    /**
     * 时间
     */
    private String time;
}