package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Student {
    /**
    * 学生id
    */
    private Integer id;

    /**
    * 学生姓名
    */
    private String name;

    /**
    * 身份证
    */
    private String idcard;

    /**
    * 性别
    */
    private String sex;

    /**
    * 电话
    */
    private String phone;

    /**
    * QQ
    */
    private String qq;

    /**
    * 邮箱
    */
    private String email;

    /**
    * 家庭住址
    */
    private String address;
}