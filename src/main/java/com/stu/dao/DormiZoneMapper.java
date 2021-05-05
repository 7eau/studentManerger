package com.stu.dao;

import com.stu.entity.DormiZone;
import org.springframework.stereotype.Component;

@Component
public interface DormiZoneMapper {
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
    int insert(DormiZone record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(DormiZone record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    DormiZone selectByPrimaryKey(Integer id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(DormiZone record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(DormiZone record);
}