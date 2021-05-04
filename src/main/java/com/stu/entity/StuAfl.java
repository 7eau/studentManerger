package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class StuAfl {
    /**
     * 请假ID
     */
    private Integer id;

    /**
     * 学生ID
     */
    private Integer studentId;

    /**
     * 请假理由
     */
    private String reason;

    /**
     * 请假开始时间
     */
    private String startTime;

    /**
     * 请假结束时间
     */
    private String endTime;

    /**
     * 是否批准
     */
    private Integer approve;

    /**
     *  批准时间
     */
    private String approveTime;

    /**
     *  批准管理员
     */
    private Integer approveAdminId;

}