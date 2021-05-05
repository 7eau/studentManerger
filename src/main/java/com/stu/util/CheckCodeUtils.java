package com.stu.util;

import org.springframework.stereotype.Component;

import java.awt.*;

@Component
public class CheckCodeUtils {

    public static int WIDTH = 70;
    public static int HEIGHT = 30;


    public static char[] generateCheckCode() {
        //定义验证码的字符表
        String chars = "0123456789abcdefghijklmnopqrstuvwxyz";
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++) {
            int rand = (int)(Math.random() * 36);
            rands[i] = chars.charAt(rand);
        }
        return rands;
    }

    public static void drawRands(Graphics g, char[] rands) {
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC|Font.BOLD, 28));
        //在不同高度上输出验证码的每个字符
        g.drawString("" + rands[0], 1, 24);
        g.drawString("" + rands[1], 18, 27);
        g.drawString("" + rands[2], 34, 26);
        g.drawString("" + rands[3], 54, 24);
//        System.out.println(rands);
    }

    public static void drawBackground(Graphics g) {
        //画背景
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, WIDTH, HEIGHT);
        //随机产生120个干扰
        for (int i = 0; i < 120; i++) {
            int x = (int)(Math.random() * WIDTH);
            int y = (int)(Math.random() * HEIGHT);
            int red = (int)(Math.random() * 255);
            int green = (int)(Math.random() * 255);
            int blue = (int)(Math.random() * 255);
            g.setColor(new Color(red, green, blue));
            g.drawOval(x, y, 1, 0);
        }
    }
}
