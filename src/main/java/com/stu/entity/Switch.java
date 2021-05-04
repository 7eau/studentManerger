package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Switch {
    /**
    * 开关id
    */
    private Integer id;

    /**
    * 开关名称
    */
    private String name;

    /**
    * 开关状态(1位打开状态)
    */
    private Integer state;
}