package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class StuDormitory {
    /**
     * 宿舍信息ID
     */
    private Integer id;

    /**
     * 学生ID
     */
    private Integer stuId;

    /**
     * 校区ID
     */
    private Integer zoneId;

    /**
     * 宿舍号（XX栋）
     */
    private String building;

    /**
     * 房间号
     */
    private String room;
}