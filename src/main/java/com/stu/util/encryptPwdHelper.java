package com.stu.util;

import com.stu.entity.Admin;
import com.stu.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class encryptPwdHelper {

    public static void adminPWDEnrypt(SqlSession session) {
        for(int id = 4; id <= 4; id++) {
            Admin admin = new Admin();
            Integer aid = (Integer) id;
            admin = session.selectOne("com.stu.dao.AdminMapper.selectByPrimaryKey", aid);
            String pwd = admin.getPassword();
//            String encrypt = RSAHelper.encryptData(pwd, "UTF-8");
//            admin.setPassword(encrypt);
//            int rst = session.update("com.stu.dao.AdminMapper.updateByPrimaryKeySelective", admin);
//            session.commit();
//            if (rst > 0) {
//                System.out.println("更新 【" + admin.getUsername() + "】成功！");
//            }
            String realPwd = RSAHelper.decryptData(pwd, "UTF-8");
            System.out.println(admin.getUsername() + "密码为: " + realPwd);
        }
    }




    public static void studentPWDEncrypt(SqlSession session) {
        List<Integer> ids = new ArrayList<Integer>();
        ids.add(6);
        ids.add(7);
        ids.add(9);
        ids.add(10);
        ids.add(11);
        ids.add(12);
        for (Integer uid:ids) {
            User user= session.selectOne("com.stu.dao.UserMapper.selectByPrimaryKey", uid);
            String pwd = user.getPassword();
//                String encrypted = RSAHelper.encryptData(pwd, "UTF-8");
//                user.setPassword(encrypted);
//                int rst = session.update("com.stu.dao.UserMapper.updateByPrimaryKeySelective", user);
//                session.commit();
//                if (rst > 0) {
//                    System.out.println("更新 【" + user.getUsername() + "】成功！");
//                }
            String password = RSAHelper.decryptData(pwd,"UTF-8");
            System.out.println(user.getUsername() + ": " + password);
        }
    }

    public static void main(String[] args) throws IOException {
        // 根据 mybatis-config.xml 配置的信息得到 sqlSessionFactory
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // 然后根据 sqlSessionFactory 得到 session. 官方推荐如下写法, 保证session被及时关闭
        try(SqlSession session = sqlSessionFactory.openSession()) {
            adminPWDEnrypt(session);

        }
    }
}
