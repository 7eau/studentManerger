package com.stu.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */
@Component
public interface GradeDao {
    int getTotalGrade(int stuId);

    List<Map<String,Object>> getGrade(int stuId, int begin, int rows, String courseName, String teacher, String courseType);

    List<Map<String,Object>> getAllGrade(int stuId);
}
