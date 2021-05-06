package com.stu.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public interface UserLoginDao {
    Map<String, Object> getStudentById(int stuId);
}
