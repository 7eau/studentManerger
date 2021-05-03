package com.stu.user.service;

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
    private UserLoginDao userLoginDao;

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
        Map<String, Object> rst = userDao.studentLogin1(username, password);
        if (rst == null) {  //用户名或密码错误！
            result.put("code",false);
            result.put("msg","用户名或密码错误！");
        } else {    //用户名和密码正确

            // 可以使用的代码
            Map<String, Object> stu = userDao.studentLogin1(username,password);
            int stuId = (Integer)rst.get("stuId");
            String name = userDao.getUsername(stuId);

            // 测试使用的代码
//            int stuId = (Integer)rst.get("stuId");
//            Map<String, Object> stu = userLoginDao.getStudentById(stuId);
//            String name = (String) stu.get("name");



            //判断是否重置密码
            if (password.equals("123456")) {    //未重置密码
                session.setAttribute("defaultPass",true);
            }
            session.setAttribute("userName", name);
            session.setAttribute("userId",stuId);
            result.put("code",true);
            result.put("url","/stuMsg.jsp");


        }
        return result;

        // 以下是原代码逻辑
        /*
        Map<String,Object> stu = userDao.stuLogin(username);    //存在这个学生
        if(stu!=null && stu.get("reset").equals("0")){
            //有该用户，并且还没有重新设置过密码
            if(password.equals("123456")){
                //登陆成功
                session.setAttribute("userName",stu.get("name"));
                session.setAttribute("userId",stu.get("id"));
                session.setAttribute("defaultPass",true);
                result.put("code",true);
                result.put("url","/stuMsg.jsp");
            }else{
                result.put("code",false);
                result.put("msg","用户名或密码错误！");
            }
        }else if(stu!=null && stu.get("reset").equals("1")){
            //学生已经重置密码
            int j = userDao.studentLogin(username,password);
            if(j > 0) {
                //登陆成功
                result.put("code",true);
                session.setAttribute("userName",stu.get("name"));
                session.setAttribute("userId",stu.get("id"));
                result.put("url","/stuMsg.jsp");
            } else {
                result.put("code",false);
                result.put("msg","用户名或密码错误！");
            }
        } else if(stu==null) {      //不存在这个学生
            //从user表中找
            Map<String,Object> stu1 = userDao.studentLogin1(username,password);
            if(stu1==null) {
                result.put("code", false);
                result.put("msg", "用户名或密码错误！");
            } else {
                int stuId = (Integer)stu1.get("stuId");
                //查找用户名
                String name = userDao.getUsername(stuId);
                result.put("code", true);
                result.put("url","/stuMsg.jsp");
                session.setAttribute("userName",name);
                session.setAttribute("userId",stuId);
            }
        }else{
            result.put("code", false);
            result.put("msg", "用户名或密码错误！");
        }
        return result;*/
    }

    /**
     * 管理员登录
     * @param session 登录session
     * @param username 用户名
     * @param password 密码
     * @return
     */
    private Map<String, Object> adminLogin(HttpSession session, String username, String password) {
        Map<String,Object> result = new HashMap<String,Object>();
        Map<String,Object>data;

        data=userDao.adminLogin(username,password);

        if(data!=null){ // 去掉原逻辑的 '&& data.get("id")!=null' 判断，我认为是不需要这个的。
            //登陆成功
            session.setAttribute("adminUserName",data.get("username"));
            session.setAttribute("adminName",data.get("name"));
            session.setAttribute("adminId",data.get("id"));
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
