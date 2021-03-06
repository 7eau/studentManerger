package com.stu.service;

import com.stu.dao.AFLManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */
@Service
@Transactional
public class AFLManagerService {
    @Autowired
    private AFLManagerDao aflManagerDao;

    /**
     * 获取所有请假信息分页、关键词
     * @param keywords
     * @param page
     * @param rows
     * @return
     */
    public Map<String,Object> getAllStuAFL(String username,String keywords, int page, int rows) {
        List<Map<String,Object>> data;
        Map<String,Object> result = new HashMap<>();
        if(keywords==null){
            keywords="";
        }
        int begin = (page-1)*rows;
        data = aflManagerDao.getAllStuAFL(keywords,begin,rows,username);
        int total = data.size();
        result.put("total",total);
        result.put("rows",data);
        return result;
    }

    /**
     * 批准学生请假
     * @param stuId
     * @param aflId
     * @return
     */
    public Map<String,Object> approveStuAFL(int stuId,int aflId)
    {
        Map<String,Object> result = new HashMap<>();
        aflManagerDao.approveStuAFL(stuId,aflId);
        result.put("code",true);
        return result;
    }

    /**
     * 删除学生请假
     * @param stuId
     * @param aflId
     * @return
     */
    public Map<String,Object> delStuAFL(int stuId,int aflId)
    {
        Map<String,Object> result = new HashMap<>();
        aflManagerDao.delStuAFL(stuId,aflId);
        result.put("code",true);
        return result;
    }
}
