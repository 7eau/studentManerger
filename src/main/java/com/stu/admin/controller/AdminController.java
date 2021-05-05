package com.stu.admin.controller;

import com.stu.user.service.UserService;
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
@RequestMapping(value = "/admin",method = {RequestMethod.POST,RequestMethod.GET})
public class AdminController {
    @Autowired
    private UserService userService;


    @RequestMapping("/checkAdminPwd.do")
    public void checkAdminPwd(String username, String password , HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String,Object> result;
        result = userService.adminLogin(request.getSession(), username,password);
        ResponseUtil.returnJson(result,response);
    }
}
