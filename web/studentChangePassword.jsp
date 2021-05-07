<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
    if(request.getSession().getAttribute("userId")==null)
    {
        out.print("<script type=\"text/javascript\"> alert(\"请先登陆再访问本功能!\");window.location=\"/login.jsp\" </script>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生密码修改</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="plugin/easyui/themes/bootstrap/easyui.css" rel="stylesheet">
    <link href="css/mycss.css" rel="stylesheet">
</head>
<body>
<div class="signup-box">
    <fieldset>
        <fieldset>
            <div class="form-horizontal mybox">
                <div class="form-group hidden">
                    <div class="col-md-8">
                        <input type="hidden" id="stuId" value="<%=request.getSession().getAttribute("userId")%>">
                        <input type="hidden" class="form-control"  disabled id="userName" value="<%=request.getSession().getAttribute("userName")%>">
                    </div>
                </div>

                <div class="form-group hidden">
                    <div class="col-md-8">
                        <input type="hidden" class="form-control" disabled id="stuUsername" value="<%=request.getSession().getAttribute("stuUsername")%>">
                    </div>
                </div>

                <div class="form-group">
                    <lebel for="currentPassword" class="col-md-3 control-label">当前密码：</lebel>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="currentPassword">
                        <input type="hidden" class="form-control" id="pubkey" name="pubkey">
                    </div>
                </div>

                <div class="form-group">
                    <lebel for="newPassword" class="col-md-3 control-label">新密码：</lebel>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="newPassword">
                    </div>
                </div>

                <div class="form-group">
                    <lebel for="confirmPassword" class="col-md-3 control-label">确认密码：</lebel>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="confirmPassword">
                    </div>
                </div>

                <div class="form-group" style="margin-top: 30px;">
                    <div class="col-md-offset-5">
                        <button class="btn btn-primary" id="update">修改</button>
                        <button class="btn btn-default" id="reset">重置</button>
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
<script src="js/studentChangePassword.js"></script>
</body>
</html>