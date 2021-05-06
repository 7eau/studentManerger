package com.stu.service;

import com.stu.dao.StuCourseMapper;
import com.stu.dao.TeacherMapper;
import com.stu.entity.StuCourse;
import com.stu.entity.StudentScoreOfTeacher;
import com.stu.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class TeacherService {
    @Autowired
    Teacher teacher;
    @Autowired
    TeacherMapper teacherMapper;
    @Autowired
    StuCourseMapper stuCourseMapper;

    public  Map<String, Object> getTeacherMsg(int tid, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        teacher = teacherMapper.selectByPrimaryKey(tid);
        if (teacher.getName() != null) {
            request.getSession().setAttribute("adminName", teacher.getName());
            result.put("code", true);
            result.put("data", teacher);
        } else {
            result.put("code", false);
            result.put("msg", "获取教师信息失败");
        }
        return result;
    }

    public Map<String, Object> updateTeacherMsg(Teacher t) {
        Map<String, Object> result = new HashMap<String, Object>();
        int rst = teacherMapper.updateByPrimaryKeySelective(t);
        if (rst > 0) {
            result.put("code", true);
            result.put("msg", "更新个人信息成功！信息更新可能延迟，请保持耐心！");
        } else {
            result.put("code", false);
            result.put("msg", "信息更新失败！");
        }
        return result;
    }

    public Map<String, Object> getAllStudentScore(int tid, int page, int rows) {
        Map<String, Object> result = new HashMap<String, Object>();
        /**
         * 1. 找到教师所授课程， 获得课程id、课程名称
         * 2。找到所有选了这门课的学生
         * 3. 找到教师所教授的班级
         * 4. 验证学生是否是该教师的学生，得到所有是该教师、是这门课的学生
         * 5. 获得学生名字、及其班级
         * 6. 由学生id、课程id得到其成绩
         */
        int begin = (page - 1) * rows;
        List<StudentScoreOfTeacher> data = teacherMapper.getStudentScoreOfTeacher(tid, begin, rows);
        if(data != null) {
          result.put("total", data.size());
          result.put("rows", data);
        } else {
            result.put("code", false);
            result.put("msg", "查询失败！请检查传参是否正确、完整");
        }
        return result;
    }

    public Map<String, Object> updateStudentScore(StuCourse stuCourse) {
        Map<String, Object> result = new HashMap<String, Object>();
        int rst = stuCourseMapper.updateByPrimaryKeySelective(stuCourse);
        if (rst > 0) {
            result.put("code", true);
            result.put("msg", "更新成绩成功！");
        } else {
            result.put("code", false);
            result.put("msg", "更新成绩失败！");
        }
        return result;
    }

}
