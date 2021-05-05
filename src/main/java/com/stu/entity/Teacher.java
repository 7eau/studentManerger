package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Teacher {
    /**
    * 教师id
    */
    private Integer id;

    /**
    * 教师u姓名
    */
    private String name;

    /**
    * 教师性别
    */
    private String sex;

    /**
    * 教师手机号
    */
    private String phone;

    /**
    * 教师邮箱
    */
    private String email;
}