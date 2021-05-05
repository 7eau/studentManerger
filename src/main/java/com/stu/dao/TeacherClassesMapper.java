package com.stu.dao;

import com.stu.entity.TeacherClasses;
import org.springframework.stereotype.Component;

@Component
public interface TeacherClassesMapper {
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
    int insert(TeacherClasses record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TeacherClasses record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    TeacherClasses selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TeacherClasses record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TeacherClasses record);
}