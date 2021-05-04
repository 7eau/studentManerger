package com.stu.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class DormiZone {
    /**
     * 校区ID
     */
    private Integer id;
    /**
     * 校区名称
     */
    private String zoneName;
}