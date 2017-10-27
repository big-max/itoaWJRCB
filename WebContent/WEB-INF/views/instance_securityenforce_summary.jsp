<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.fasterxml.jackson.databind.*"%>
<%@ page import="com.fasterxml.jackson.databind.node.*"%>
<%@ page import="com.ibm.automation.core.util.StringUtil"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="header.jsp" flush="true" />
<title>自动化运维平台</title>
<style>
body {
	font-size: 13px;
}

.table th, .table td {
	line-height: 15px;
}

.bgc242 {
	background-color: #F2F2F2;
}

.tbc {
	text-align: center;
	background-color: #FFC000;
}

.tbc1 {
	text-align: center;
	background-color: #92D050;
}
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:scroll;
}
.current1,.current1:hover {
    color: #444444;
}
</style>
</head>

<body>
	<!--header start-->
	<div class="header">
		<jsp:include page="topleft_close.jsp" flush="true" />
	</div>
	<!--header end-->

	<!--content start-->
	<div class="content">
		<div class="breadcrumb">
			<a href="getAllsecurityJobs.do" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>实例一览
			</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 安全加固汇总</a>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-bordered">
						<tr id="shuoming" style="font-weight: bolder;">
							<td class="bgc242" style="width:25%;">参数说明</td>
							<td class="bgc242" style="width:30%;">参数值</td>
							<td class="bgc242" style="width:30%;">模板值</td>
							<td class="bgc242" style="width:10%;text-align:center;">是否合格</td>
						</tr>
						<tr>
							<td>文件系统检查/opt</td>
							<td> ${securitytemplate.stdout_detail_opt_value} </td>  
							<td> >= 2G </td>  
							<td style="text-align:center;"> 
								<c:if test="${securitytemplate.stdout_detail_opt_result == 1 }">Y</c:if>
								<c:if test="${securitytemplate.stdout_detail_opt_result != 1 }"><font color="red">N</font></c:if>
							</td>  
						</tr>
						<tr>
							<td>系统用户检查toptea</td>
							<td> ${securitytemplate.stdout_detail_toptea_value} </td>
							<td> uid=10000, group=bomc, gid=20000, home=/toptea </td>     
							<td style="text-align:center;">
								<c:if test="${securitytemplate.stdout_detail_toptea_result == 1 }">Y</c:if>
								<c:if test="${securitytemplate.stdout_detail_toptea_result != 1 }"><font color="red">N</font></c:if>
							</td>  
						</tr>
						<tr>
							<td>是否允许FTP匿名用户登录</td>
							<td> ${securitytemplate.stdout_detail_ano_ftp_value} </td>   
							<td> off </td>  
							<td style="text-align:center;"> 
								<c:if test="${securitytemplate.stdout_detail_ano_ftp_result == 1 }">Y</c:if>
								<c:if test="${securitytemplate.stdout_detail_ano_ftp_result != 1 }"><font color="red">N</font></c:if>
							</td>  
						</tr>
						<tr>
							<td>终端超时退出</td>
							<td> ${securitytemplate.stdout_detail_timeout_value} </td>   
							<td> 180s </td>  
							<td style="text-align:center;"> 
								<c:if test="${securitytemplate.stdout_detail_timeout_result == 1 }">Y</c:if>
								<c:if test="${securitytemplate.stdout_detail_timeout_result != 1 }"><font color="red">N</font></c:if>
							</td>  
						</tr>
						<tr>
							<td>umask设置</td>
							<td> ${securitytemplate.stdout_detail_umask_value} </td>   
							<td> 0027 </td>  
							<td style="text-align:center;"> 
								<c:if test="${securitytemplate.stdout_detail_umask_result == 1 }">Y</c:if>
								<c:if test="${securitytemplate.stdout_detail_umask_result != 1 }"><font color="red">N</font></c:if>
							</td>  
						</tr>
						<tr>
							<td>最大打开文件数</td>
							<td> ${securitytemplate.stdout_detail_nofile_value} </td>  
							<td> 65536 </td>   
							<td style="text-align:center;"> 
								<c:if test="${securitytemplate.stdout_detail_nofile_result == 1 }">Y</c:if>
								<c:if test="${securitytemplate.stdout_detail_nofile_result != 1 }"><font color="red">N</font></c:if>
							</td>  
						</tr>
					</table>


				</div>
			</div>
		</div>

	</div>
</body>


</html>
