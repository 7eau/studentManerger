package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
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
}