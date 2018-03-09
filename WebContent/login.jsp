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
	background:url('img/menubg.jpg') repeat;
	position:relative;
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
.foot{
	font-size:18px; position:absolute;bottom:40px;margin:auto;width: 100%;
}
#loginform .nobottom , #loginform .notopradius{
	background-color:rgba(255,255,255,0);
}
::-webkit-input-placeholder { /* WebKit browsers */
    color: white;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color: white;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
    color: white;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
    color: white;
}
#loginbox span{ font-size:20px; }
#userName:focus , #password:focus{
	border-color: #00008B; 
}
</style>
</head>

<body>
	
	<div style="width:400px;height:80px;">
		<img src="img/login_jxbank.png">
	</div>
	
	<!-- 用户名&密码输入框 -->
	<div id="loginbox" style="height:270px;border-radius:5px;margin:0 auto;margin-top:50px;background-color:rgba(255,255,255,0.3);">
		<form id="loginform" method="post" class="form-vertical" action="login.do">
			<div class="logobox" style="margin-bottom:30px;margin-top:20px;">
				<span><font color="white">自动化运维平台</font></span>
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
						<div class="similarinput" style="margin-top:20px;">
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
	<div style="width:80%;height:30px;line-height:30px;text-align:center;margin:0 auto;">
		<font color="white">Powered by IBM</font>
	</div>
	
	<div class="foot">
		<div style="text-align: center;margin-top: 10px"><font color="white">Copyright 2008 版权所有 江西银行 赣ICP备14006678号</font></div>
	</div>
</body>
</html>