<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="plugin/easyui/themes/bootstrap/easyui.css" rel="stylesheet">
    <link href="css/mycss.css" rel="stylesheet">
    <style>
        body{
            background-image: url("image/bg _gray.jpg");
        }
        /*.login-box {*/
        /*    background:;*/
        /*}*/
        .form-group input {
            background: transparent;
            border-color: rgba(0, 0, 0, 6);
            color: #000;
        }
        .login-box legend {
            text-align: center;
        }
        .form-group button {
            letter-spacing: .1125rem;
        }
        .form-group #login {
            width: 60%;
            margin-right: 2rem;
        }

    </style>
</head>
<body>

<div class="login-box">
    <fieldset>
        <legend><h2>学生信息管理系统登陆</h2></legend>
        <fieldset>
            <div class="form-horizontal mybox">
                <div class="form-group">
                    <lebel for="username" class="col-md-3 control-label">用户名：</lebel>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="username" placeholder="请输入登陆名">
                    </div>
                </div>
                <div class="form-group">
                    <lebel for="password" class="col-md-3 control-label">密码：</lebel>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        <input type="hidden" class="form-control" id="pubkey" name="pubkey">
                    </div>
                </div>
                <div class="form-group">
                    <lebel for="checkCode" class="col-md-3 control-label">验证码：</lebel>
                    <div class="col-md-6">
                        <div class="input-group">
                            <input type="text" class="form-control" id="checkCode" placeholder="请输入验证码">
                            <span class="input-group-btn">
                                <a href="#" title="点击更换验证码"><img id="checkImg" alt="验证码" src="/stu/user/checkCode.do"></a>
                            </span>
                        </div>
                    </div>
<%--                    <lebel for="checkCode" class="col-md-2" style="padding: 2px;"></lebel>--%>
                </div>
                <div class="form-group">
                    <lebel for="password" class="col-md-3 control-label">身份：</lebel>
                    <div class="col-md-8">
                        <label class="radio-inline">
                            <input type="radio" name="role" value="student" checked> 学生
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="role" value="manager"> 管理员
                        </label>
                    </div>
                </div>
                <div class="form-group" style="margin-top: 30px;">
                    <div class="col-md-offset-2">
                        <button class="btn btn-primary" id="login">登陆</button>
                        <button class="btn btn-default" id="reset">重置</button>
<%--                        <button class="btn btn-warning" id="signup">注册</button>--%>
                    </div>
                </div>
            </div>
        </fieldset>
    </fieldset>
</div>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="plugin/easyui/jquery.easyui.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jsencrypt.js"></script>
<script src="js/login.js"></script>
</body>
</html>