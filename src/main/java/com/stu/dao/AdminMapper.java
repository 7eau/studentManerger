package com.stu.dao;

import com.stu.entity.Admin;
import org.springframework.stereotype.Component;

@Component
public interface AdminMapper {
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
    int insert(Admin record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Admin record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Admin selectByUsername(String username);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Admin selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Admin record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Admin record);
}