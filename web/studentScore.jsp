<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    if(request.getSession().getAttribute("adminName")==null)   //没有登陆
    {
        out.print("<script type=\"text/javascript\"> alert(\"请先登陆!\");window.location=\"/login.jsp\" </script>");
    }
    if(!request.getSession().getAttribute("adminType").equals(3))
    {
        out.print("<script type=\"text/javascript\"> alert(\"抱歉，您没有权限!\");window.location=\"/login.jsp\" </script>");
    }
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学生管理信息系统--管理员</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="css/update.css" rel="stylesheet">
    <link href="css/mycss.css" rel="stylesheet">
    <link href="plugin/easyui/themes/icon.css" rel="stylesheet">
    <link href="plugin/easyui/themes/bootstrap/easyui.css" rel="stylesheet">
    <link href="css/bootstrap-switch.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">学生信息管理系统--教师</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        欢迎您：<%=request.getSession().getAttribute("adminName")%>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><div id="changePassword">修改密码</div></a></li>
                        <li role="separator" class="divider"></li>
                        <li class="text-warning"><a href="/stu/user/adminLogout.do">退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation"><a href="teacherMsg.jsp">个人资料</a></li>
            <li role="presentation" class="active"><a href="studentScore.jsp">学生成绩信息</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <div>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0)">首页</a></li>
                <li class="active">学生成绩信息</li>
            </ol>
        </div>
        <div id="content">
        </div>
        <div id="toolBar" class="form-horizontal" style="width:100%; margin-bottom:0;vertical-align: middle;">
            <div id="searchBar" class="form-group" style="margin-bottom:0;">
                <div class="form-group col-lg-4 col-md-4" style="margin-bottom:0;">
                    <input type="text" class="form-control form-inline input-sm" placeholder="请输入学生名称" id="searchBarText">
                </div>
                <button id="searchBarBtn" class="btn btn-default btn-sm">搜索</button>
            </div>
        </div>
        <div id="jj" style="padding:20px;display: none;" class="form-horizontal">
            <div class="form-group">
                <label for="grade" class="col-md-3 control-label">成绩:</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" id="grade" name="grade" placeholder="请输入成绩">
                    <input type="hidden" class="form-control" id="tid" name="tid" value="<%=request.getSession().getAttribute("tid")%>">
                    <input type="hidden" class="form-control" id="id" name="id">
                    <input type="hidden" class="form-control" id="score" name="score">
                    <input type="hidden" class="form-control" id="stuName" name="stuName">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-5">
                    <button id="subGrade" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap-switch.min.js"></script>
<script src="plugin/easyui/jquery.easyui.min.js"></script>
<script src="plugin/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="js/studentScore.js"></script>
</body>
</html>