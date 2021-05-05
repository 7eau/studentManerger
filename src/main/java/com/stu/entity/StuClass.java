package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class StuClass {
    /**
    * 学生_班级表ID
    */
    private Integer id;

    /**
    * 班级ID
    */
    private Integer classid;

    /**
    * 学生ID
    */
    private Integer stuid;
}