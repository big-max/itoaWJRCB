<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../header.jsp" flush="true" />
<title>自动化运维平台</title>
<style type="text/css">
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
}
.current1,.current1:hover {
    color: #444444;
}
input[type="text"] {
	height:28px;
}
.input140,label,.mr20 {
	font-size: 13px;
}
.inputb2l{width:200%;}
.form-horizontal .control-label{
	width:32%;
}
.form-horizontal .controls{
	margin-left:37%;
}
.upcon{
	width:26%;margin-left:10px;margin-top:0px;float:left;height:80vh;
}
.downcon{
	width:70%;height:80vh;float:right;margin-top:0px;margin-right:10px;
}
</style>

<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
</script>
</head>

<body>
	<!--header start-->
	<div class="header">
		<jsp:include page="../topleft_close.jsp" flush="true" />
	</div>
	<!--header end-->

	<!--content start-->
	<div class="content">
		<div class="breadcrumb">
			<a href="getAllServers.do" class="current" style="position:relative;top:-3px;">
			<i class="icon-home"></i>自动化发布 WAS</a>
		</div>
		
		<div class="upcon">
			<div style="font-size:14px;"><b>基本信息</b></div>
			<div class="mainmodule">
				<div class="form-horizontal">
					<div class="control-group">
						<label class="control-label">war包路径</label>
						<div class="controls">
							<div class="inputb2l">
								<select style="width: 47.5%; font-size: 13px;" class="w48" id="file_path" name="file_path">
									<option value="" selected="selected">/tmp</option>	
								</select>
							</div>
						</div>
					</div>
					<!-- <div class="control-group">
						<label class="control-label">war包名称</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="file_name" name="file_name" value="" />
							</div>
						</div>
					</div> -->
					<div class="control-group">
						<label class="control-label">was用户名</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="was_user" name="was_user" value="root" />
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">profile路径</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="was_profile_home" name="was_profile_home" value="/opt/IBM/WebSphere/AppServer/profiles/AppSrv02" />
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">was控制台用户名</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="was_username" name="was_username" value="" />
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">was控制台密码</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="was_password" name="was_password" value="" />
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">app名称</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="app_name" name="app_name" value="" />
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">上下文根</label>
						<div class="controls">
							<div class="inputb2l">
								<input type="text" class="w45" id="app_contextroot" name="app_contextroot" value="" />
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">发布类型</label>
						<div class="controls">
							<div class="inputb2l">
								<select style="width: 47.5%; font-size: 13px;" id="deploy_type" class="w48" name="deploy_type">
									<option value="update" selected="selected">update</option>	
									<option value="new">new</option>		
								</select>
							</div>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<div class="inputb2l">
								<button class="btn btn-primary">发起</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		<div class="downcon">
			<div style="font-size:14px;margin-bottom:8px;"><b>实时日志</b></div>
			<textarea id="real_log" style="width:100%;height:69vh;"></textarea>
		</div>
		
	</div>
</body>
</html>
