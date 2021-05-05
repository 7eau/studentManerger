package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
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
    * 选择学生id
    */
    private Integer studentId;

    private String time;
}