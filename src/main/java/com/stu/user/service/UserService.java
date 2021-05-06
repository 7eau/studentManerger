package com.stu.user.service;

import com.stu.dao.AdminMapper;
import com.stu.dao.StudentMapper;
import com.stu.dao.UserMapper;
import com.stu.entity.Admin;
import com.stu.entity.Student;
import com.stu.entity.User;
import com.stu.user.dao.UserDao;
import com.stu.util.PropertiesUtil;
import com.stu.util.RSAHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.*;
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
    private static Logger logger = Logger.getLogger(UserService.class);

    /**
     * 用户登陆
     * @param role 分为manager（管理员）、student（学生）
     * @param username  用户名
     * @param password  密码
     * @return
     */
    public Map<String,Object> Login(HttpServletRequest request, String role, String username, String password, String checkCode) {
        Map<String,Object> result = null;
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

        if (isEquels(password, user.getPassword())) {
            Integer stuId = user.getStuid();
            student = studentMapper.selectByPrimaryKey(stuId);
            if (getPwd(password).equals("123456")) {    //未重置密码
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

        admin = adminMapper.selectByUsername(username);

        if(admin != null && isEquels(password, admin.getPassword())) {// 密码正确
            // 管理员通用设置
            result.put("code",true);
            session.setAttribute("adminUserName",admin.getUsername());
            session.setAttribute("adminName",admin.getName());
            session.setAttribute("adminId",admin.getId());
            session.setAttribute("adminType", admin.getType());

            if(admin.getType() == 3) {//当该管理员是教师
                session.setAttribute("tid", admin.getTeacherid());
                result.put("url","/teacherMsg.jsp");
            } else {//管理员不是教师
                result.put("url","/index.jsp");
            }

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

    public Map<String, Object> getRSAKey(HttpSession session){
        Map<String,Object> result = new HashMap<String,Object>();
        String pubk = PropertiesUtil.readProperty("rsa.public.key");
        result.put("code", true);
        result.put("pubkey", pubk);
        return result;
    }

    public String getPwd(String encryptPwd) {
        return RSAHelper.decryptData(encryptPwd, "UTF-8");
    }

    public Boolean isEquels(String pwd1, String pwd2) {
        return (getPwd(pwd1).equals(getPwd(pwd2)));
    }
}
