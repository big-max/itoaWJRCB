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
		.input140{
			font-size:13px;
		}
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
	
	<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
	</script>
	
	<script type="text/javascript">
		function modify() 
		{
			var db2insusr = $("#db2_db2insusr").val().trim();
			$("#db2_db2insusr1").val(db2insusr);
		}
	
		function CheckInput() 
		{	
			if($("#db2_version").val()== -1)
			{
				sweet("请选择DB2安装版本 !","warning","确定");
				return;
			}
			/* 
			 if ($("#db2_version").prev().find('a').find('span').text() == '请选择...') 
			 {
				sweet("请选择DB2安装版本 !","warning","确定");
				return;
			 }
			 
			var db2fix=$("#db2fix").val();
			if (db2fix == '-' || db2fix == '')
			{
				swal({
		            title: "",
		            text: "安装DB2必须选择补丁版本",
		            type: "warning",
		            closeOnConfirm: false,
		            confirmButtonText: "确定",
		        });
				return;
			} */
			
			if ($("#db2_db2insusr").val().trim() == "") 
			{
				sweet("请输入DB2实例名 !","warning","确定");
				return;
			}
			
			if ($("#db2_svcename").val().trim() == "") 
			{
				sweet("请输入DB2监听端口 !","warning","确定");
				return;
			}
			
			var version = $("#db2_version").val();
			var db2base = $("#db2_fixpack").val();
			var value = $("#db2_fixpack option:selected").attr("value");
			
			$("#submits").submit();			
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
		                <p class="twotit" style="padding-left: 0px;">
		                    <em class="majornode nodes">主</em>节点<c:out  value="${num.count }"/>
		                </p>
		                <div class="column">
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
                
                
<%--                 <c:forEach items="${servers }" var="ser" varStatus="num">
	                <p class="twotit" style="padding-left: 0px;">
	                	<c:forEach items="${ser.ip}" var="addr">
	                   	  <c:if test="${ha_ip1==addr}">
	                   	  	<c:if test="${ha_hostname1==ha_primaryNode}">
				                <em class="majornode">主</em>节点<c:out  value="${num.count }"/>&nbsp;&nbsp;&nbsp;
	               	        </c:if>
	               	        <c:if test="${ha_hostname1!=ha_primaryNode}">
				                <em class="vicenode">备</em>节点<c:out  value="${num.count }"/>&nbsp;&nbsp;&nbsp;
	               	        </c:if>
	               	      </c:if>
	               	      <c:if test="${ha_ip2==addr}">
	               	      	<c:if test="${ha_hostname2==ha_primaryNode}">
				                <em class="majornode">主</em>节点<c:out  value="${num.count }"/>&nbsp;&nbsp;&nbsp;
	               	        </c:if>
	               	        <c:if test="${ha_hostname2!=ha_primaryNode}">
				                <em class="vicenode">备</em>节点<c:out  value="${num.count }"/>&nbsp;&nbsp;&nbsp;
	               	        </c:if>
	               	      </c:if>
	                    </c:forEach>
		               <b>serviceIP：</b><span>${ha_svcip }</span> 
	                </p>
                <div class="column">
                  <div class="span12">
                     <p>
                      <b>主机名:</b>
                      <span class="column_txt">
	                      <c:forEach items="${ser.ip}" var="addr">
	                     	  <c:if test="${ha_ip1==addr}"> ${ha_hostname1 } </c:if>
	                 	      <c:if test="${ha_ip2==addr}"> ${ha_hostname2 } </c:if>
	                      </c:forEach>
					  </span>
                      <b>IP地址:</b><span class="column_txtl">${ser.ip }</span>
                      <b>操作系统:</b><span class="column_txt">${ser.os}</span>
                    </p>
                    <p>
                      <b>系统配置:</b><span class="column_txt">${ser.hconf }</span>
                      <b>状态:</b><span class="column_txt">${ser.status }</span>
                    </p>
                  </div>
                </div>
                </c:forEach> --%>
              
              
               <form action="toDb2haNextPage.do?serId=${serId}&platform=${platform}&type=${ptype}&status=confirm" 
                     method="post" id="submits" class="form-horizontal">
                    <!-- 常规参数 -->
             	    <input type="hidden" id="serId" name="serId" value="${serId }">
             	    <input type="hidden" id="ptype" name="ptype" value="${ptype}">
					<input type="hidden" id="hostId" name="hostId" value="${hostId}">
					<input type="hidden" id="platform" name="platform" value="${platform}">
					<input type="hidden" id="db2version" name="db2version">
					
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
					
					<input type="hidden" id="db2_ppsize" name="db2_ppsize" value="128">
					
					<c:forEach items="${servers }" var="ser">
				       <input type="hidden" id="all_hostnames" name="all_hostnames" value="${ser.name  }">
				       <input type="hidden" id="all_ips" name="all_ips" value="${ser.ip }">
				    </c:forEach>
             	    
             	    <!-- 其他参数 -->	
             	    <input type="hidden" id="ha_db2instpv" name="ha_db2instpv"/>
                    <input type="hidden" id="ha_db2datapv" name="ha_db2datapv"/>
                    <input type="hidden" id="ha_db2logpv" name="ha_db2logpv"/>
                    <input type="hidden" id="ha_db2archlogpv" name="ha_db2archlogpv"/> 
                    <input type="hidden" id="ha_dataspace1pv" name="ha_dataspace1pv"/>
                    <input type="hidden" id="ha_dataspace2pv" name="ha_dataspace2pv"/>
                    <input type="hidden" id="ha_dataspace3pv" name="ha_dataspace3pv"/>
                    <input type="hidden" id="ha_dataspace4pv" name="ha_dataspace4pv"/>
                    
                    <input type="hidden" id="alldisks" value=""/>
		            <input type="hidden" id="alldisksb" value=""/>
		            <input type="hidden" id="alldisksc" value=""/>
		            <input type="hidden" id="alldisksd" value=""/>
                    													
					<input type="hidden" id="hostId1" name="hostId1" value="${hostId1}">
                  	<input type="hidden" id="hostId2" name="hostId2" value="${hostId2}">
					<input type="hidden" id="hostName" name="hostName" value="${hostName}">
					<input type="hidden" id="hostIp" name="hostIp" value="${hostIp }">
					<input type="hidden" id="serName" name="serName" value="${serName }">
					<input type="hidden" id="serIp" name="serIp" value="${serIp }">
					<input type="hidden" id="perName" name="perName" value="${perName }">
					<input type="hidden" id="perIp" name="perIp" value="${perIp }">
					<input type="hidden" id="hdiskname" name="hdiskname" value="${hdisknames }">
					<input type="hidden" id="hdiskid" name="hdiskid" value="${hdiskids }">
					<input type="hidden" id="vgtype" name="vgtype" value="${vgtypes }">                 	
                  	
                  
            		
              <div class="mainmodule">
              	<h5 class="swapcon"><i class="icon-chevron-down"></i>基本信息</h5>
                 <div class="form-horizontal">
                  
                  <div class="control-group">
					<label class="control-label">DB2安装版本</label>
					<div class="controls">
						<div class="inputb2l">
							<select style="width: 47.5%" class="w48" id="db2_version"
								    name="db2_version" onchange="showfix(this);">
								<option value="-1" selected="selected">请选择...</option>
							</select>
						</div>
						<div class="inputb2l">
							<span class="input140 mr20">DB2版本补丁</span>
							<select class="form-control"  onchange="getVer(this)"
									style="width: 47.5%" name="db2_fixpack" id="db2_fixpack">
								<option value="-1" selected="selected">请选择...</option>
							</select>
							<input type="hidden" id="db2fix" name="db2fix" value="-">
						</div>
					</div>
				</div>
                  
                  <div class="control-group">
					<label class="control-label">DB2安装路径</label>
					<div class="controls">
						<div class="inputb2l">
							<input type="text" class="w45" id="db2_db2base"
								name="db2_db2base" value="" readonly="readonly"/>
						</div>
						<div class="inputb2l">
							<span class="input140 mr20">DB2实例目录</span> 
							<input type="text" class="w45" id="db2_dbpath" name="db2_dbpath"
								value="/data" readonly="readonly"/>
						</div>
					</div>
				 </div>
                  
                  <div class="control-group">
                    <label class="control-label">DB2实例名</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <input type="text" class="w45" id="db2_db2insusr" onblur="modify()"
                             name="db2_db2insusr" value="db2inst1" />
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">监听端口</span>
                        <input type="text" class="w45" id="db2_svcename" name="db2_svcename" value="60000" />
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">DB2数据库名</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <input type="text" class="w45" id="db2_dbname" 
                             name="db2_dbname" value="sample" />
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">字符集</span>
                        <select id="styleSelect" class="w48" style="width: 47.5%"
                                onChange="changeDivShow('styleSelect')" name="db2_codeset">
                        	<option value="GBK" selected="selected">GBK</option>
                          <option value="UTF-8">UTF-8</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">DB2数据目录</label>
                    <div class="controls">
                      <div class="inputb2l">
                      	  <input type="text" class="w45" id="db2_dbdatapath" name="db2_dbdatapath"
								 value="/data" readonly="readonly" />
                      </div>
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
                      <input type="text" id="db2_db2insusr1" name="db2_db2insusr1" 
                             value="db2inst1" readonly="readonly" class="w45"/>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">实例用户组</span>
                        <input type="text" id="db2_db2insgrp" name="db2_db2insgrp" value="db2igrp" class="w45"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">fence用户</label>
                    <div class="controls">
                      <div class="inputb2l">
                     	 <input type="text" id="db2_db2fenusr" class="w45" name="db2_db2fenusr" 
                             value="db2fenc" />
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">fence用户组</span>
                        <input type="text" id="db2_db2fengrp" class="w45"  
                        	   name="db2_db2fengrp"  value="db2fgrp" />
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">DB2COMM</label>
                    <div class="controls">
                      <div class="inputb2l">
                      <input type="text" id="db2_db2comm" class="w45" name="db2_db2comm" 
                             value="tcpip" readonly="readonly"/></div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">DB2CODEPAGE</span>
                        <input type="text" id="db2_db2codepage" class="w45 codeVal" name="db2_db2codepage" 
                               value="1386" readonly="readonly"/>
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
                     	 <input type="text" class="w45" id="db2_db2log" name="db2_db2log" 
                     	        value="/db2log" readonly="readonly"/>
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">归档日志路径</span>
                        <input type="text" id="db2_logarchpath"  class="w45" name="db2_logarchpath" 
                               value="/db2archlog" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">LOCKTIMEOUT</label>
                    <div class="controls">
                      <div class="inputb2l">
                      	<input type="text" id="db2_locktimeout" name="db2_locktimeout" class="w45" value="60" />
                      </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">LOGFILESIZ</span>
                        <select class="w48" name="db2_logfilesize">
                        	<option value="200">200</option>
                            <option value="500">500</option>
                        </select>&nbsp;MB
                      </div>
                    </div>
                  </div>               
                  
                  <div class="control-group">
                    <label class="control-label">LOGPRIMARY</label>
                    <div class="controls">
                      <div class="inputb2l">
                     	 <input type="text" id="db2_logprimary" class="w45" name="db2_logprimary" value="13"/>
                     </div>
                      <div class="inputb2l">
                      	<span class="input140 mr20">LOGSECOND</span>
                        <input type="text" id="db2_logsecond" class="w45"  name="db2_logsecond" value="2" />
                      </div>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">SOFTMAX</label>
                    <div class="controls">
                      <div class="inputb2l">
                     	 <input type="text" id="db2_softmax" class="w45" name="db2_softmax" value="100"/>
                     </div>
                     <div class="inputb2l">
                      	<span class="input140 mr20">TRACKMOD</span>
                        <select class="w48" name="db2_trackmod" style="width: 47.5%">
                          <option value="YES" selected="selected">YES</option>
                          <option value="NO">NO</option>
                        </select>
                       </div>
                    </div>
                  </div>

                  
                   <div class="control-group">
                    <label class="control-label">PAGESIZE</label>
                    <div class="controls">
                      <div class="inputb2l">
                      	<select class="w48" name="db2_pagesize">
                        	<option value="4">4</option>
                            <option value="8" selected="selected">8</option>
                            <option value="16">16</option>
                            <option value="32">32</option>
                        </select>
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
  <div class="columnfoot" style="width: 93%; left: 5%;">
  	<a class="btn btn-info btn-up" onclick="javascript:history.go(-1);">
        <i class="icon-btn-up"></i><span>上一页</span>
    </a>
    <a class="btn btn-info fr btn-down" onclick="CheckInput();">
        <span>下一页</span><i class="icon-btn-next"></i>
    </a>
  </div> 
<!--footer end-->

  
	<script type="text/javascript">
		//显示db2版本补丁
		function showfix(obj) 
		{
			var checkText=$(obj).find("option:selected").text();
			var platform1=$('#platform').val();
						
			$("#db2_db2base").val('/opt/IBM/db2/V'+checkText)
			$.ajax({
				url : "<%=path%>/getDb2Fix.do",
				data : { version : checkText,platform : platform1, pName:'db2'},
				type : 'post',
				dataType : 'json',
				success : function(result) 
				{
					$("#db2_fixpack").empty();
					$("#db2fix").val('-');
					if(result.length==0)
					{
						var str="<option value='-'>"+ "请选择..." + "</option>";
						$("#db2_fixpack").append(str);
						$("#db2version").val(checkText=$(obj).find("option:selected").text());
						return;
					}	
					var str = "<option value='-'>" + "请选择..." + "</option>";
					for (var i = 0; i < result.length; i++) 
					{										
						for ( var key in result[i])
						{
							str += "<option value='" + result[i][key] + "'>" + key+ "</option>";
						}							
					}
					$("#db2_fixpack").append(str);
					$("#db2version").val(checkText=$(obj).find("option:selected").text());
				}
			});
		}

		//自动加载
		function getVer(obj) 
		{
			if ($("#db2_fixpack").find("option:selected").text() == '请选择...') 
			{
				$("#db2fix").val('-');
				$("db2_fixpack").val('-');
			} 
			else
				$("#db2fix").val($("#db2_fixpack").find("option:selected").text());
		}
		
		window.onload = function() {
			var platform1=$('#platform').val();
			$.ajax({
				url : '<%=path%>/getDb2Verion1.do',
				data : {platform : platform1,pName : 'db2'},
				type : 'post',
				dataType : 'json',
				success : function(result) 
				{
					
					var str="";
					for (var i = 0; i < result.length; i++) 
					{
						for ( var key in result[i])
						{
							str += "<option value='" + result[i][key] + "'>" + key+ "</option>";}
						}
					$("#db2_version").append(str);
				},failure:function(err){
					alert(err);
				}
			})
		}
	</script>
</body>
</html>
