package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class StuDormitory {
    private Integer id;

    private Integer stuId;

    private Integer zoneId;

    private String building;

    private String room;
}