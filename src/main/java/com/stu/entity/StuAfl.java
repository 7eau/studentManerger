package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class StuAfl {
    private Integer id;

    private Integer studentId;

    private String reason;

    private String startTime;

    private String endTime;

    private Integer approve;

    private String approveTime;

    private Integer approveAdminId;
}