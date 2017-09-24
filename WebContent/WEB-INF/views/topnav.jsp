<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />

	<header class="cd-main-header">
		<nav style="display: block;float: left;height: 100%;">
			<ul style="height:100%;list-style:none;margin:0px">
				<li style="height:100%;display:inline-block;width:56px;padding-top:14px;padding-left:10px;background:#465A96;position:relative;">
					<img src="img/logo.png" style="position: relative; bottom: 5px;"></img>
				</li>
				<li style="height:100%;display:inline-block;position:relative;bottom:30px;left:10px;">
					<a href="#" style="position: relative; top: 25px;">自动化运维平台</a>
				</li>
			</ul>
		</nav>  

		<nav class="cd-nav">
			<ul class="cd-top-nav">
				<li>
					<a href="getAllServers.do" style="color: white;">
						<i class="icon-home icon-white" style="margin: 3px 5px;"></i>主页    
					</a>
				</li>
				<li>
					<a href="#0" style="color: white;"> 
						<i class="icon-user icon-white" style="margin: 5px;"></i> <span>${userName }</span>
					</a>
				</li>
				<li>
					<a href="logout.do" style="color: white;"> 
						<i class="icon-off icon-white" style="margin: 5px;"></i> <span>注销</span>&nbsp;&nbsp;
					</a>
				</li>
			</ul>
		</nav>
	</header>

	<script src="js/main.js"></script>
</html>