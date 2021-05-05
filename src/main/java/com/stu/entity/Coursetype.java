package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
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