package com.stu.dao;

import com.stu.entity.StuTeacher;
import org.springframework.stereotype.Component;

@Component
public interface StuTeacherMapper {
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
    int insert(StuTeacher record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(StuTeacher record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    StuTeacher selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(StuTeacher record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(StuTeacher record);
}