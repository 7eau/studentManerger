<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(request.getSession().getAttribute("userId")==null)   //没有登陆
	{
		out.print("<script type=\"text/javascript\"> alert(\"请先登陆!\");window.location=\"/login.jsp\" </script>");
	}
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>学生信息管理系统--学生</title>
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
	<link href="plugin/easyui/themes/bootstrap/easyui.css" rel="stylesheet">
	<link href="plugin/easyui/themes/icon.css" rel="stylesheet">
	<style>
		.btn-group>.btn:first-child {
			margin-left: 85px;
		}

		.form-horizontal .form-group {
			margin-right: -100px;
			margin-left: -15px;
		}
	</style>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">学生信息管理系统--学生</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						欢迎您：<%=request.getSession().getAttribute("userName")%><span class="caret"></span></a>
					<input type="hidden" id="userId" value="<%=request.getSession().getAttribute("userId")%>">
					<ul class="dropdown-menu">
						<li><a href="#"><div id="changePassword">修改密码</div></a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/stu/user/userLogout.do">退出系统</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
	<div class="col-md-2">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation"><a href="stuMsg.jsp">个人资料</a></li>
			<li role="presentation"><a href="stuDormitory.jsp">住宿信息</a></li>
			<li role="presentation"><a href="stuChooseClasses.jsp">自主选课</a></li>
			<li role="presentation" class="active"><a href="stuGrade.jsp">成绩信息</a></li>
			<li role="presentation"><a href="stuReward.jsp">奖励信息</a></li>
			<li role="presentation"><a href="stuPunish.jsp">处罚信息</a></li>
			<li role="presentation"><a href="stuAFL.jsp">学生请假</a></li>
		</ul>
	</div>
	<div class="col-md-10">
		<div>
			<ol class="breadcrumb">
				<li><a href="javascript:void(0)">首页</a></li>
				<li class="active">成绩信息</li>
			</ol>
		</div>
		<div id="studentGradeBox">
		</div>
		<div id="toolBar" class="form-horizontal" style="width:100%; margin-bottom:0;vertical-align: middle;">
			<div id="toolBar_btn" class="form-group col-lg-8 col-md-8"  style="margin-bottom:0;">
				<button class="btn btn-default btn-sm" disabled id="MsgBtn">绩点：</button>
				<button class="btn btn-default btn-sm" id="removeKeywords">去除筛选条件</button>
			</div>
			<div id="searchBar" class="form-group" style="margin-bottom:0;">
				<div class="form-group col-lg-4 col-md-4" style="margin-bottom:0;">
					<input type="text" class="form-control form-inline input-sm" placeholder="请输入课程名称、授课教师、课程类型" id="searchBarText">
				</div>
				<div class="btn-group">
					<button id="searchBarBtn" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						搜索
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><button  class="btn btn-default" id="searchByCourseName">按课程名称搜索</button></li>
						<li><button  class="btn btn-default"  id="searchByTeacher">按教师名称搜索</button></li>
						<li><button  class="btn btn-default"  id="searchByCourseType">按课程类型搜索</button></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.js"></script>
<script src="plugin/easyui/jquery.easyui.min.js"></script>
<script src="plugin/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="js/stuGrade.js"></script>
</body>
</html>