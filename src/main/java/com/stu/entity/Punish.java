package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
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
    /**
     * 惩罚时间
     */
    private String time;
}