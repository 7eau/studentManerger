package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Admin {
    /**
    * 管理员id
    */
    private Integer id;

    /**
    * 管理员账号
    */
    private String username;

    /**
    * 管理员姓名
    */
    private String name;

    /**
    * 密码
    */
    private String password;

    /**
    * 管理员类型
    */
    private Integer type;

    /**
    * 教师账户id
    */
    private Integer teacherid;
}