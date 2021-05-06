package com.stu.controller;

import com.stu.entity.StuCourse;
import com.stu.entity.Teacher;
import com.stu.service.TeacherService;
import com.stu.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping(value = "/teacher",method = {RequestMethod.POST,RequestMethod.GET})
public class TeacherController {
    @Autowired
    TeacherService teacherService;
    Map<String,Object> result;

    @RequestMapping("getTeacherMsg.do")
    public void getTeacherMsg(Integer tid, HttpServletRequest request, HttpServletResponse response) throws IOException {
        result = teacherService.getTeacherMsg(tid, request);
        ResponseUtil.returnJson(result, response);
    }

    @RequestMapping("updateTeacher.do")
    public void updateTeacher(Teacher teacher, HttpServletResponse response) throws IOException {
        result = teacherService.updateTeacherMsg(teacher);
        ResponseUtil.returnJson(result, response);
    }

    @RequestMapping("getStudentScore.do")
    public void getStudentSore(Integer tid, Integer page, Integer rows, HttpServletResponse response) throws IOException {
        result = teacherService.getAllStudentScore(tid, page, rows);
        ResponseUtil.returnJson(result, response);
    }

    @RequestMapping("updateStudentScore.do")
    public void updateStudentScore(StuCourse stuCourse, HttpServletResponse response) throws IOException {
        result = teacherService.updateStudentScore(stuCourse);
        ResponseUtil.returnJson(result, response);
    }
}
