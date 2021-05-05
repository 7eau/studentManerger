package com.stu.dao;

import com.stu.entity.AdminType;
import org.springframework.stereotype.Component;

@Component
public interface AdminTypeMapper {
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
    int insert(AdminType record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(AdminType record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    AdminType selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(AdminType record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(AdminType record);
}