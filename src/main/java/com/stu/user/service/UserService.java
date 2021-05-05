package com.stu.user.service;

import com.stu.dao.AdminMapper;
import com.stu.dao.StudentMapper;
import com.stu.dao.UserMapper;
import com.stu.entity.Admin;
import com.stu.entity.Student;
import com.stu.entity.User;
import com.stu.user.dao.UserDao;
import com.stu.user.dao.UserLoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */
@Service
@Transactional
public class UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private Admin admin;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private User user;
    @Autowired
    private Student student;
    @Autowired
    private StudentMapper studentMapper;

    /**
     * 用户登陆
     * @param role 分为manager（管理员）、student（学生）
     * @param username  用户名
     * @param password  密码
     * @return
     */
    public Map<String,Object> Login(HttpServletRequest request, String role, String username, String password, String checkCode) {
        Map<String,Object> result;
        HttpSession session = request.getSession();

        // 1. 验证验证码是否正确
        String realCode = (String) session.getAttribute("checkCode");
        if (!checkCode.equals(realCode)) {//验证码错误
            result = new HashMap<String,Object>();
            result.put("code", false);
            result.put("msg", "验证码错误！");
        } else {
            //2. 验证码正确时，再分角色登录
            if("manager".equals(role)) {
                result = adminLogin(session, username, password);
            } else {
                result = studentLogin(session, username, password);
            }
        }
        return result;
    }

    /**
     * 学生登录
     * @param session   登录session
     * @param username  用户名
     * @param password  密码
     * @return
     */
    private Map<String, Object> studentLogin(HttpSession session, String username, String password) {
        Map<String,Object> result = new HashMap<String,Object>();
        /**
         * 一、存在该学生
         *  原逻辑：存在学生没有账号。。。×
         *  现逻辑：学生必有账号->登录只验证账号、密码即可..
         */

        user = userMapper.selectByUsername(username);

        if (password.equals(user.getPassword())) {
            Integer stuId = user.getStuid();
            student = studentMapper.selectByPrimaryKey(stuId);
            if (password.equals("123456")) {    //未重置密码
                session.setAttribute("defaultPass",true);
            }
            session.setAttribute("userName", student.getName());
            session.setAttribute("userId",stuId);
            result.put("code",true);
            result.put("url","/stuMsg.jsp");
        } else {
            result.put("code",false);
            result.put("msg","用户名或密码错误！");
        }
        return result;
    }

    /**
     * 管理员登录
     * @param session 登录session
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public Map<String, Object> adminLogin(HttpSession session, String username, String password) {
        Map<String,Object> result = new HashMap<String,Object>();

        admin = adminMapper.selectByUsernamne(username);

        if(password.equals(admin.getPassword())) {// 密码正确
            session.setAttribute("adminUserName",admin.getUsername());
            session.setAttribute("adminName",admin.getName());
            session.setAttribute("adminId",admin.getId());
            result.put("code",true);
            result.put("url","/index.jsp");
        } else {
            result.put("code",false);
            result.put("msg","管理员用户名或密码错误！");
        }
        return result;
    }

    public void UserLogout(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpSession session=request.getSession();

        if(session.getAttribute("userName")!=null)
        {
            session.removeAttribute("userName");
            session.invalidate();
        }
        response.sendRedirect("/login.jsp");
    }

    public void AdminLogout(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpSession session=request.getSession();
        if(session.getAttribute("adminName")!=null)
        {
            session.removeAttribute("adminName");
            session.invalidate();
        }
        response.sendRedirect("/login.jsp");
    }

    public void updateAdminPassword(String adminId,String newPasswd)
    {
        userDao.updateAdminPassword(adminId,newPasswd);
    }

    public void UserSignUp(HttpServletRequest request, String username, String password, String ID,String phone,String gender)
    {

    }
}
