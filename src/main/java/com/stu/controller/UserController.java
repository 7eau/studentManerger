package com.stu.controller;

import com.stu.service.UserService;
import com.stu.util.CheckCodeUtils;
import com.stu.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */
@Controller
@RequestMapping(value = "/stu/user",method = {RequestMethod.POST,RequestMethod.GET})
public class UserController {
    @Autowired
    private UserService userService;
    private Map<String,Object> result;
    /**
     * 用户登陆
     * @param role
     * @param username
     * @param password
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/userLogin.do")
    public void userLogin(String checkCode, String role , String username, String password , HttpServletRequest request, HttpServletResponse response) throws IOException {

        result = userService.Login(request,role,username,password, checkCode);
        ResponseUtil.returnJson(result,response);
    }

    /**
     * 用户注销
     */
    @RequestMapping("/userLogout.do")
    public void userLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userService.UserLogout(true,request,response);
    }

    /**
     * 管理员注销
     */
    @RequestMapping("/adminLogout.do")
    public void adminLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userService.AdminLogout(true,request,response);
    }

    /**
     * 管理员密码修改
     */
    @RequestMapping("/updateAdminPassword.do")
    public void updateAdminPassword(String adminId,String newPassword,HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String,Object> result = new HashMap<String,Object>();
        userService.updateAdminPassword(adminId,newPassword);
        result.put("msg","密码修改成功! 请使用新密码登陆!");
        result.put("code",true);
        ResponseUtil.returnJson(result,response);
        userService.AdminLogout(false,request, response);
    }

    /**
     * 学生密码修改
     */
    @RequestMapping("/updateStudentPassword.do")
    public void updateStudentPassword(String stuId,String newPassword,HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String,Object> result = new HashMap<String,Object>();
        userService.updateStudentPassword(stuId, newPassword);
        result.put("msg","密码修改成功! 请使用新密码登陆!");
        result.put("code",true);
        ResponseUtil.returnJson(result,response);
        userService.UserLogout(false, request, response);
    }

    /**
     * 验证学生账号密码
     * @param username
     * @param password
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/checkStuPwd.do")
    public void checkStudentPassword(String username, String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
        result = userService.studentLogin(request.getSession(), username, password);
        ResponseUtil.returnJson(result, response);
    }


    @RequestMapping("/checkCode.do")
    public void getCheckCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        response.setContentType("image/jpeg");

        //浏览器不要缓存此图片
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        //获取输出流
        ServletOutputStream sos = response.getOutputStream();
        ByteArrayOutputStream bos = new ByteArrayOutputStream();

        try {
            BufferedImage image =
                    new BufferedImage(CheckCodeUtils.WIDTH, CheckCodeUtils.HEIGHT, BufferedImage.TYPE_INT_RGB);
            Graphics g = image.getGraphics();
            //产生随机的认证码
            char[] rands = CheckCodeUtils.generateCheckCode();
            //产生图像
            CheckCodeUtils.drawBackground(g);
            CheckCodeUtils.drawRands(g, rands);
            //结束绘制过程
            g.dispose();
            //将图像输出到客户端
            ImageIO.write(image, "JPEG", bos);
            byte[] buf = bos.toByteArray();
            response.setContentLength(buf.length);
            sos.write(buf);
            //将当前验证码存入Session中
            session.setAttribute("checkCode", new String(rands));
        } finally {
            bos.close();
            sos.close();
        }

    }

    @RequestMapping("/getRSAKey.do")
    public void getRSAKey(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
        result = userService.getRSAKey(request.getSession());
        ResponseUtil.returnJson(result, response);
    }

}
