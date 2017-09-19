<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fasterxml.jackson.databind.*"%>
<%@ page import="com.fasterxml.jackson.databind.node.*"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<jsp:include page="header.jsp" flush="true"/>
	<title>自动化部署平台</title>
	<style type="text/css">
		.input140{font-size:13px;}
		.sweet-alert button.cancel { background-color: #ec6c62; }
		.sweet-alert button.cancel:hover { background-color: rgb(229,97,88); }
		body{
		overflow:hidden;
		}
		input[type="text"] { 
			height:28px;
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
	
	<script language="javascript" type="text/javascript">
		//操作
		function CheckInput() {
			/* ymPrompt.win({message:'&nbsp;提交任务后是否在目标主机立即运行脚本，创建环境？',title:'创建提示！',handler:function(tp){
							if(tp == "no"){
								window.history.go(0);
								//alert("已经创建脚本！");
								var type = document.getElementById("type");
								type.setAttribute("value", "no");
							}	
							else{
							$("#submits").submit();
						   }
						},btn:[['是','yes'],['否','no']],icoCls:'ymPrompt_alert'}); */
			swal({
	            title: "",
	            text: "是否确认要在目标主机立即执行任务？",
	            type: "warning",
	            showCancelButton: true,
	            closeOnConfirm: false,
	            closeOnCancel: false,
	            confirmButtonText: "是",
	            cancelButtonText: "否",  
	            //confirmButtonColor: "#ec6c62"
	        }, 
	        function(isConfirm)
	        {
	        	  if (isConfirm) 
	        	  {
	        		  $("#submits").submit();
	        	  } 
	        	  else 
	        	  {
	        		  window.history.go(0);
	        	  }
	        });			
		}
	</script>
	
	<script>
		$(document).ready(function(){
			$(".nodes:last").removeClass("majornode");
			$(".nodes:last").addClass("vicenode");
			$(".nodes:last").text("备");
		})
	</script>
</head>

<body>
<!--header start-->
  <div class="header">
  	<jsp:include page="topleft_close.jsp" flush="true"/>
  </div>
<!--header end--> 

<!--content start-->
  <div class="content">
  <div class="breadcrumb">
	    <a href="getAllServers.do" class="current1" style="position:relative;top:-3px;"><i class="icon-home"></i>IBM DB2HA</a>
	    <a class="current" style="position:relative;top:-3px;">实例配置详细</a>
  </div>
  
	<div class="container-fluid">
        <div class="row-fluid">
          <div class="span12">
          	<div class="columnauto">
          	
          	<div class="mainmodule">
          		<h5 class="swapcon">
					<i class="icon-chevron-down icon-chevron-right"></i>拓扑结构
				</h5>
				<div class="form-horizontal" style="display:none;">
				    <c:forEach items="${servers }" var="ser" varStatus="num">
		                <p class="twotit" style="padding-left:0px;">
		                   <em class="majornode nodes">主</em>节点<c:out  value="${num.count }"/>
		                </p>
		                <div class="column" style="padding-left:0px;">
		                  <div class="span12">
			                    <p>
									<b>主机名:</b> <span class="column_txt"> ${ser.name } </span> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>IP地址:</b><span class="column_txt">${ser.ip}</span> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>操作系统:</b><span class="column_txt"><em>${ser.os}</em></span>
								</p>
								<p>
									<b>系统配置:</b><span class="column_txt">${ser.hconf }</span> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>状态:</b><span class="column_txt"><em>${ser.status }</em></span>
								</p>
		                  </div>
		                </div>
	                </c:forEach>
				</div>
			</div>
              
              <form action="installDb2haInfo.do?serId=${serId}&platform=${platform}" 
                    method="post" id="submits" class="form-horizontal">
                    <!-- 常规参数 -->
              		<input type="hidden" id="ptype" name="ptype" value="${ptype}">
					<input type="hidden" id="hostId" name="hostId" value="${hostId}">
             	    <input type="hidden" id="serId" name="serId" value="${serId }">
             	    <input type="hidden" id="platform" name="platform" value="${platform}">
					<input type="hidden" id="db2fix" name="db2fix" value="${db2fix}">
					<input type="hidden" id="db2_binary" name="db2_binary" value="${db2_binary}">
					<input type="hidden" id="all_hostnames" name="all_hostnames" value="${all_hostnames}">
					<input type="hidden" id="all_ips" name="all_ips" value="${all_ips}">
					<input type="hidden" id="allservertotaljson" name="allservertotaljson" value="${allservertotaljson}">
					
					<!-- Host参数 -->
					<input type="hidden" id="haname" name="haname" value="${haname}">
					<input type="hidden" id="ha_primaryNode" name="ha_primaryNode" value="${ha_primaryNode}">
					<input type="hidden" id="ha_ip1" name="ha_ip1" value="${ha_ip1}">
					<input type="hidden" id="ha_hostname1" name="ha_hostname1" value="${ha_hostname1}">
					<input type="hidden" id="ha_bootip1" name="ha_bootip1" value="${ha_bootip1}">
					<input type="hidden" id="ha_bootalias1" name="ha_bootalias1" value="${ha_bootalias1}">
					<input type="hidden" id="ha_ip2" name="ha_ip2" value="${ha_ip2}">
					<input type="hidden" id="ha_hostname2" name="ha_hostname2" value="${ha_hostname2}">
					<input type="hidden" id="ha_bootip2" name="ha_bootip2" value="${ha_bootip2}">
					<input type="hidden" id="ha_bootalias2" name="ha_bootalias2" value="${ha_bootalias2}">
					<input type="hidden" id="ha_svcip" name="ha_svcip" value="${ha_svcip}">
					<input type="hidden" id="ha_svcalias" name="ha_svcalias" value="${ha_svcalias}">
					<input type="hidden" id="ha_netmask" name="ha_netmask" value="${ha_netmask }">
					
					<!-- makevg参数 -->
					<input type="hidden" id="ha_RGName" name="ha_RGName" value="${ha_RGName}">
					<input type="hidden" id="ha_ASName" name="ha_ASName" value="${ha_ASName}">
					<input type="hidden" id="ha_vgdb2inst" name="ha_vgdb2inst" value="${ha_vgdb2inst }">
                  	<input type="hidden" id="ha_vgdb2data" name="ha_vgdb2data" value="${ha_vgdb2data }">
                  	<input type="hidden" id="ha_vgdb2log" name="ha_vgdb2log" value="${ha_vgdb2log }">
                  	<input type="hidden" id="ha_vgdb2archlog" name="ha_vgdb2archlog" value="${ha_vgdb2archlog }">
					<input type="hidden" id="db2_inst_pv" name="db2_inst_pv" value="${db2_inst_pv }">
					<input type="hidden" id="db2_data_pv" name="db2_data_pv" value="${db2_data_pv }">
					<input type="hidden" id="db2_log_pv" name="db2_log_pv" value="${db2_log_pv }">
					<input type="hidden" id="db2_archlog_pv" name="db2_archlog_pv" value="${db2_archlog_pv }">
					<input type="hidden" id="db2_caapvg_pv" name="db2_caapvg_pv" value="${db2_caapvg_pv }">
					<input type="hidden" id="db2_insthome" name="db2_insthome" value="${db2_insthome }">
					<input type="hidden" id="ha_caappv" name="ha_caappv" value="${ha_caappv}">
					<input type="hidden" id="ha_startpolicy" name="ha_startpolicy" value="${ha_startpolicy}">
                  	<input type="hidden" id="ha_fopolicy" name="ha_fopolicy" value="${ha_fopolicy}">
                  	<input type="hidden" id="ha_fbpolicy" name="ha_fbpolicy" value="${ha_fbpolicy}">
					
             	    
             	    <!-- 其他参数 -->
             	    <input type="hidden" id="ha_db2instpv" name="ha_db2instpv"/>
                    <input type="hidden" id="ha_db2datapv" name="ha_db2datapv"/>
                    <input type="hidden" id="ha_db2logpv" name="ha_db2logpv"/>
                    <input type="hidden" id="ha_db2archlogpv" name="ha_db2archlogpv"/> 
                    <input type="hidden" id="ha_dataspace1pv" name="ha_dataspace1pv"/>
                    <input type="hidden" id="ha_dataspace2pv" name="ha_dataspace2pv"/>
                    <input type="hidden" id="ha_dataspace3pv" name="ha_dataspace3pv"/>
                    <input type="hidden" id="ha_dataspace4pv" name="ha_dataspace4pv"/>
                    <input type="hidden" id="db2_caapvg_pv" name="db2_caapvg_pv" value="${db2_caapvg_pv }">
             	    <input type="hidden" id="type" name="type" value="yes">
					<input type="hidden" id="hostId1" name="hostId1" value="${hostId1}">
                  	<input type="hidden" id="hostId2" name="hostId2" value="${hostId2}">
					<input type="hidden" id="hostName" name="hostName" value="${hostName}">
					<input type="hidden" id="hostIp" name="hostIp" value="${hostIp }">
					<input type="hidden" id="serName" name="serName" value="${serName }">
					<input type="hidden" id="serIp" name="serIp" value="${serIp }">
					<input type="hidden" id="perName" name="perName" value="${perName }">
					<input type="hidden" id="perIp" name="perIp" value="${perIp }">
					<input type="hidden" id="hdiskname" name="hdiskname" value="${hdiskname }">
					<input type="hidden" id="hdiskid" name="hdiskid" value="${hdiskid }">
					<input type="hidden" id="vgtype" name="vgtype" value="${vgtype }">
                  	
                  	<!-- DB2 Begin -->
                  	<!-- 基本信息 -->
					<input type="hidden" id="db2_version" name="db2_version" value="${db2_version }">
					<input type="hidden" id="db2_fixpack" name="db2_fixpack" value="${db2_fixpack }">
					<input type="hidden" id="db2_db2base" name="db2_db2base" value="${db2_db2base }">
					<input type="hidden" id="db2_dbpath" name="db2_dbpath" value="${db2_dbpath }">
					<input type="hidden" id="db2_svcename" name="db2_svcename" value="${db2_svcename }">
					<input type="hidden" id="db2_db2insusr" name="db2_db2insusr" value="${db2_db2insusr }">
					<input type="hidden" id="db2_dbname" name="db2_dbname" value="${db2_dbname }">
					<input type="hidden" id="db2_codeset" name="db2_codeset" value="${db2_codeset }">
					<input type="hidden" id="db2_dbdatapath" name="db2_dbdatapath" value="${db2_dbdatapath }">
					<input type="hidden" id="db2_binary" name="db2_binary" value="${db2_binary }">
					<input type="hidden" id="db2_ppsize" name="db2_ppsize" value="${db2_ppsize }">
					<!-- 实例高级属性 -->
					<input type="hidden" id="db2_db2insusr" name="db2_db2insusr" value="${db2_db2insusr }">
					<input type="hidden" id="db2_db2insgrp" name="db2_db2insgrp" value="${db2_db2insgrp }">
					<input type="hidden" id="vgdb2_db2fenusrtype" name="db2_db2fenusr" value="${db2_db2fenusr }">
					<input type="hidden" id="db2_db2fengrp" name="db2_db2fengrp" value="${db2_db2fengrp }">
					<input type="hidden" id="db2_db2comm" name="db2_db2comm" value="${db2_db2comm }">
					<input type="hidden" id="db2_db2codepage" name="db2_db2codepage" value="${db2_db2codepage }">					
					<!-- 数据库高级属性 -->
					<input type="hidden" id="db2_db2log" name="db2_db2log" value="${db2_db2log }">
					<input type="hidden" id="db2_logarchpath" name="db2_logarchpath" value="${db2_logarchpath }">
					<input type="hidden" id="db2_locktimeout" name="db2_locktimeout" value="${db2_locktimeout }">
					<input type="hidden" id="db2_logfilesize" name="db2_logfilesize" value="${db2_logfilesize }">
					<input type="hidden" id="db2_logprimary" name="db2_logprimary" value="${db2_logprimary }">
					<input type="hidden" id="db2_logsecond" name="db2_logsecond" value="${db2_logsecond }">
					<input type="hidden" id="db2_softmax" name="db2_softmax" value="${db2_softmax }">
					<input type="hidden" id="db2_trackmod" name="db2_trackmod" value="${db2_trackmod }">
					<input type="hidden" id="db2_pagesize" name="db2_pagesize" value="${db2_pagesize }">
                  	<!-- DB2 end -->
              
              
              <div class="mainmodule">
              	<h5 class="swapcon"><i class="icon-chevron-down"></i>Host信息</h5>
                 <div class="form-horizontal">
                     <div class="control-group">
						<label class="control-label">HA名称</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${haname }</span>
							</div>
							
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">节点1 IP</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${ha_ip1 }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">节点1 主机名</span> 
								<span class="graytxt">${ha_hostname1 }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">节点1 Boot IP</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${ha_bootip1 }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">节点1 Boot主机别名</span> 
								<span class="graytxt">${ha_bootalias1 }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">节点2 IP</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${ha_ip2 }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">节点2 主机名</span> 
								<span class="graytxt">${ha_hostname2 }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">节点2 Boot IP</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${ha_bootip2 }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">节点2 Boot主机别名</span> 
								<span class="graytxt">${ha_bootalias2 }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">HA Service IP</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${ha_svcip }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">资源组主节点</span> 
								<span class="graytxt">${ha_primaryNode }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">子网掩码</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${ha_netmask }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">Service主机别名</span> 
								<span class="graytxt">${ha_svcalias }</span>
							</div>
						</div>
					</div>
               </div>
              </div>
              <div class="mainmodule">
              	<h5 class="swapcon"><i class="icon-chevron-down icon-chevron-right"></i>VG信息</h5>
                 <div class="form-horizontal" style="display:none;">
                     <div class="control-group groupborder divnfs">
						<div class="controls controls-mini" style="margin-left: 0.7%;">
							<span class="input140 mr20" style="width: 142px;">VG名称</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${ha_vgdb2inst }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">包含PV</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${db2_inst_pv }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">文件系统</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">/db2home</span>
							</div>
						</div>
					</div>
					
					<div class="control-group groupborder divnfs">
						<div class="controls controls-mini" style="margin-left: 0.7%;">
							<span class="input140 mr20" style="width: 142px;">VG名称</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${ha_vgdb2data }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">包含PV</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${db2_data_pv }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">文件系统</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">/data</span>
							</div>
						</div>
					</div>
					
					<div class="control-group groupborder divnfs">
						<div class="controls controls-mini" style="margin-left: 0.7%;">
							<span class="input140 mr20" style="width: 142px;">VG名称</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${ha_vgdb2log }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">包含PV</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${db2_log_pv }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">文件系统</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">/db2log</span>
							</div>
						</div>
					</div>
					
					<div class="control-group groupborder divnfs">
						<div class="controls controls-mini" style="margin-left: 0.7%;">
							<span class="input140 mr20" style="width: 142px;">VG名称</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${ha_vgdb2archlog }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">包含PV</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${db2_archlog_pv }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">文件系统</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">/db2archlog</span>
							</div>
						</div>
					</div>
					
					<div class="control-group groupborder divnfs">
						<div class="controls controls-mini" style="margin-left: 0.7%;">
							<span class="input140 mr20" style="width: 142px;">VG名称</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${ha_caappv }</span>
							</div>
							<span class="input140 mr20" style="width: 128px;">包含PV</span>
							<div class="inputb4" style="width: 20%;">
								<span class="graytxt">${db2_caapvg_pv }</span>
							</div>
						</div>
					</div>
										
                  </div>
               </div>
                	
              <div class="mainmodule">
              	<h5 class="swapcon"><i class="icon-chevron-down icon-chevron-right"></i>基本信息</h5>
                 <div class="form-horizontal" style="display:none;">
                     <div class="control-group">
						<label class="control-label">DB2安装版本</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_version }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">DB2版本补丁</span> 
								<span class="graytxt">${db2fix }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">DB2安装路径</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_db2base }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">DB2实例目录</span> 
								<span class="graytxt">${db2_dbpath }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">DB2实例名</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_db2insusr }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">监听端口</span> 
								<span class="graytxt">${db2_svcename }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">DB2数据库名</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_dbname }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">字符集</span> 
								<span class="graytxt">${db2_codeset }</span>
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">DB2数据目录</label>
						<div class="controls">
							<span class="graytxt">${db2_dbdatapath }</span>
						</div>
					</div>
                  </div>
               </div>
              
              <div class="mainmodule">
              	<h5 class="swapcon"><i class="icon-chevron-down icon-chevron-right"></i>实例高级属性</h5>
                <div class="form-horizontal" style="display:none;">
                  <div class="control-group">
                    <label class="control-label">实例用户</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <span class="graytxt">${db2_db2insusr }</span>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">实例用户组</span>
                        <span class="graytxt">${db2_db2insgrp }</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">fence用户</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <span class="graytxt">${db2_db2fenusr }</span>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">fence用户组</span>
                        <span class="graytxt">${db2_db2fengrp }</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">DB2COMM</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <span class="graytxt">${db2_db2comm }</span>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">DB2CODEPAGE</span>
                        <span class="graytxt">${db2_db2codepage }</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="mainmodule">
              	<h5 class="swapcon"><i class="icon-chevron-down icon-chevron-right"></i>数据库高级属性</h5>
                <div class="form-horizontal" style="display:none;">               
                  <div class="control-group">
                    <label class="control-label">DB2日志路径</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <span class="graytxt">${db2_db2log }</span>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">归档日志路径</span>
                        <span class="graytxt">${db2_logarchpath }</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
						<label class="control-label">LOCKTIMEOUT</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_locktimeout }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">LOGFILESIZ</span> 
								<span class="graytxt">${db2_logfilesize } MB</span>
							</div>
						</div>
					</div>

                  <div class="control-group">
                    <label class="control-label">LOGPRIMARY</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <span class="graytxt">${db2_logprimary }</span>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">LOGSECOND</span>
                        <span class="graytxt">${db2_logsecond }</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
						<label class="control-label">TRACKMOD</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_trackmod }</span>
							</div>
							<div class="inputb2l">
								<span class="input140 mr20">PAGESIZE</span> 
								<span class="graytxt">${db2_pagesize }</span>
							</div>
						</div>
					</div>
					
				  <div class="control-group">
						<label class="control-label">SOFTMAX</label>
						<div class="controls">
							<div class="inputb2l">
								<span class="graytxt">${db2_softmax }</span>
							</div>
						</div>
				  </div>           
              	</div>
              </div>
              
              </form>
              
             
              </div>
            </div>  
          </div>
        </div>
</div>
<!--content end-->
<!--footer start-->
  <div class="columnfoot"  style="width: 93%; left: 5%;">
  	<a class="btn btn-info btn-up" onclick="javascript:history.go(-1);">
      <i class="icon-btn-up"></i><span>上一页</span>
    </a>
    <a class="btn btn-info fr btn-down" onclick="CheckInput();">
      <span>创建</span><i class="icon-btn-next"></i>
    </a>
  </div> 
</body>
</html>
