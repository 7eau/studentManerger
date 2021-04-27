package com.stu.user.service;

import com.stu.user.dao.UserDao;
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

    /**
     * 用户登陆
     * @param role 分为manager（管理员）、student（学生）
     * @param username  用户名
     * @param password  密码
     * @return
     */
    public Map<String,Object> Login(HttpServletRequest request, String role, String username, String password) {
        Map<String,Object> result;
        HttpSession session = request.getSession();

        if("manager".equals(role)) {
            result = adminLogin(session, username, password);
        } else {
            result = studentLogin(session, username, password);
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
        //学生登陆
        //从学生表中查找该用户名的学生
        Map<String,Object> stu = userDao.stuLogin(username);
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
            if(j>0){
                //登陆成功
                result.put("code",true);
                session.setAttribute("userName",stu.get("name"));
                session.setAttribute("userId",stu.get("id"));
                result.put("url","/stuMsg.jsp");
            }else{
                result.put("code",false);
                result.put("msg","用户名或密码错误！");
            }
        }else if(stu==null){
            //从user表中找
            Map<String,Object> stu1 = userDao.studentLogin1(username,password);
            if(stu1==null) {
                result.put("code", false);
                result.put("msg", "用户名或密码错误！");
            }else{
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
        return result;
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
        Map<String,Object>data = new HashMap<>();
        data=userDao.adminLogin(username,password);

        if(data!=null && data.get("id")!=null){
            //登陆成功
            session.setAttribute("adminUserName",data.get("username"));
            session.setAttribute("adminName",data.get("name"));
            session.setAttribute("adminId",data.get("id"));
            result.put("code",true);
            result.put("url","/index.jsp");
        }else{
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
