package com.stu.dao;

import com.stu.entity.TeacherCourse;
import org.springframework.stereotype.Component;

@Component
public interface TeacherCourseMapper {
    /**
     * delete by primary key
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TeacherCourse record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TeacherCourse record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    TeacherCourse selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TeacherCourse record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TeacherCourse record);
}