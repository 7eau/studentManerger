package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Coursetype {
    /**
    * 类型id
    */
    private Integer id;

    /**
    * 类型名称
    */
    private String name;
}