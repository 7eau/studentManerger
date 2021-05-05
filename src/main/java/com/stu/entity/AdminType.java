package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class AdminType {
    /**
    * 管理员类型id
    */
    private Integer id;

    /**
    * 管理员类型描述
    */
    private String describe;
}