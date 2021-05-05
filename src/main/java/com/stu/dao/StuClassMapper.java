package com.stu.dao;

import com.stu.entity.StuClass;
import org.springframework.stereotype.Component;

@Component
public interface StuClassMapper {
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
    int insert(StuClass record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(StuClass record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    StuClass selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(StuClass record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(StuClass record);
}