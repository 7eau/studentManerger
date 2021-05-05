package com.stu.entity;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Major {
    /**
    * 专业id
    */
    private Integer id;

    /**
    * 专业名称
    */
    private String name;
}