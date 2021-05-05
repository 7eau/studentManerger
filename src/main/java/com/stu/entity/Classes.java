package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Classes {
    /**
    * 班级id
    */
    private Integer id;

    /**
    * 班级名称
    */
    private Integer number;

    /**
    * 专业名称
    */
    private Integer majorid;

    /**
    * 级别
    */
    private Integer level;
}