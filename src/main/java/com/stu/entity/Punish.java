package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Punish {
    /**
    * 惩罚id
    */
    private Integer id;

    /**
    * 惩罚学生Id
    */
    private Integer studentId;

    /**
    * 惩罚内容
    */
    private String content;

    private String time;
}