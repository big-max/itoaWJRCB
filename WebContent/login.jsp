<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>自动化运维平台</title>
<meta name=”renderer” content=”webkit|ie-comp|ie-stand”>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="自动化运维平台">
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=path%>/css/unicorn.login.css" />
<script src="<%=path%>/js/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var errorMessageFlag = $("#errorMessageFlag").val();
		if (errorMessageFlag == "fail") {
			$("#errorMessage").css("display", "block");
			$("#pwd").val('');
		}
		if (errorMessageFlag == "networkfail") {
			$("#networkerrorMessage").css("display", "block");
			$("#pwd").val('');
		}
		if (errorMessageFlag == "paramfail") {
			$("#paramerrorMessage").css("display", "block");
			$("#pwd").val('');
		}
		$(document).keypress(function(event) {
			var keyCode = event.keyCode;
			if (keyCode == 13) {
				checkFormat();
			} else {
				var ecode = event.which;
				if (ecode == 13) {
					checkFormat();
				}
			}
		});
	});

	//校验用户名和密码格式
	function checkFormat() {
		if ($("#userName").val() == '') {
			$("#errorMessage").html("请输入用户名！");
			$("#errorMessage").css("display", "block");
			return;
		} else if ($("#pwd").val() == '') {
			$("#errorMessage").html("请输入密码！");
			$("#errorMessage").css("display", "block");
			return;
		} else {
			$("#errorMessage").css("display", "none");
		//	$("#pwd").val(window.btoa($("#pwd").val()));
			$("#pwd").val($("#pwd").val());
			$("#loginform").submit();
		}
	}
</script>

<style type="text/css">
body{
	margin:0;
	padding:0;
}
#header span {
	margin-left:10px;
	padding-left: 5px;
	font-size:21px;
	font-family:Microsoft YaHei; 
}
.logobox{
	margin-bottom: 20px;
}
#loginbox p {
    margin-top: 30px;
}
#loginbox{
	height:360px;
}
.box{
	width:80%;height:400px;
	margin-left:10%;margin-top:9%;
	background:url('img/menubg.jpg');
	position:relative;
	background-position: center center;
}
.box2{
	width:80%;height:20px;line-height:20px;
	margin-left:10%;margin-top:15px;
	text-align:center;
}
.box3{
	width:80%;height:20px;line-height:20px;
	margin-left:10%;margin-top:3px;
	text-align:center;
}
#loginbox h4{ font-size:16px; }
</style>
</head>

<body>

	<div class="box">
	
	<div style="width:400px;height:78px;">
		<img src="img/loginlogo.png">
	</div>
	
	<!-- 用户名&密码输入框 -->
	<div id="loginbox" style="height:270px;position:absolute;top:20px;right:20px;border-radius:5px;">
		<form id="loginform" method="post" class="form-vertical" action="login.do">
			<div class="logobox" style="margin-bottom:30px;">
				<h4>用户登录</h4>
			</div>
			
			<div class="control-group">
				<input id="errorMessageFlag" type="hidden" value="${errorMessageFlag}" />
				<div id="errorMessage" class="prompt" style="display: none;">${errorMessage}</div>
				<div id="networkerrorMessage" class="prompt" style="display: none;">${errorMessage}</div>
				<div id="paramerrorMessage" class="prompt" style="display: none;">${errorMessage}</div>	
				
				<div class="controls">
					<div class="input-prepend">
						<div class="similarinput">
							<i class="icon-user"></i><input id="userName" name="userName"
								type="text" placeholder="用户名" class="loginTxt nobottom" />
						</div>
						<div class="similarinput">
							<i class="icon-lock"></i><input id="password" name="password"
								type="password" placeholder="密码" class="loginTxt notopradius"  />
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-actions">
				<span class="pull-login">
					<input type="button" onclick="checkFormat();" 
					       class="btn btn-login" value="登录" style="font-weight: normal;"/>
				</span>
			</div>
			
		</form>
	</div>
	
	</div>
	
	<div class="box2"><font color="#666666">总行地址：江苏省苏州市吴江区中山南路1777号&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：215200</font></div>
	<div class="box3"><font color="#666666">Copyright©&nbsp;1996-2008&nbsp;WJRCB.COM&nbsp;&nbsp;许可证：苏ICP备06012538号</font></div>
</body>
</html>