package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Reward {
    /**
    * 奖励Id
    */
    private Integer id;

    /**
    * 奖励学生Id
    */
    private Integer studentId;

    /**
    * 奖励内容
    */
    private String content;

    private String time;
}