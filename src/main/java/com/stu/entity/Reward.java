package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
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
    /**
     * 奖励时间
     */
    private String time;
}