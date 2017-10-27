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
	<title>自动化运维平台</title>
		<style type="text/css">
		.input140,label{
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
		.inputb4{ width:40%;}
		.inputb25{ width:25%; display:inline-block;}
	</style>
	
	<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
	</script>
	
	<script language="javascript" type="text/javascript">
		/* $(document).ready(function()
		{
			$("#selectmy").append("<option selected='selected' value=" + $("#ha_hostname1").val() + ">" + $("#ha_hostname1").val() + "</option>");
			var o1 = $("#selectmy").find("option:first");
			if(o1.attr("selected") == "selected")
			{
				$("#selectmy").prev().find("a:first").find("span:first").html($("#ha_hostname1").val());
			}
			$("#selectmy").append("<option value=" + $("#ha_hostname2").val() + ">" + $("#ha_hostname2").val() + "</option>");
		}); */ 
		
		//节点1(节点2) IP,主机名,Boot IP,Boot主机名
		$(document).ready(function(){
			var ip1 = $(".ser_ip:first").text().trim();
			var ip2 = $(".ser_ip:last").text().trim();
			var name1 = $(".ser_name:first").text().trim();
			var name2 = $(".ser_name:last").text().trim();
			$("#ha_ip1").val(ip1);
			$("#ha_bootip1").val(ip1);
			$("#ha_ip2").val(ip2);
			$("#ha_bootip2").val(ip2);			
			$("#ha_hostname1").val(name1);
			$("#ha_bootalias1").val(name1 + "-BOOT");
			$("#ha_hostname2").val(name2);
			$("#ha_bootalias2").val(name2 + "-BOOT");

			$("select").append("<option selected='selected'>"+name1+"</option>");
			$("select").append("<option>"+name2+"</option>");			
			
			//$("#selectmy").replaceWith("<select id='selectmy' class='w85 select2-choice' style='width:47.5%' name='ha_primaryNode' onchange='sel_priNode()'><option selected='selected'>"+name1+"</option><option>"+name2+"</option></select>");
		})
		
		//根据资源组主节点的选择，改变节点1和节点2 
		function sel_priNode()
		{
			var priNode = $("#selectmy").val().trim();//资源组主节点的值 
			var ip1 = $("#ha_ip1").val().trim();//第一个IP
			var name1 = $("#ha_hostname1").val().trim();//第一个主机名 
			var ip2 = $("#ha_ip2").val().trim();//第一个IP
			var name2 = $("#ha_hostname2").val().trim();//第一个主机名 
			if(priNode == name2)
			{
				$("#ha_ip1").val(ip2);
				$("#ha_bootip1").val(ip2);
				$("#ha_ip2").val(ip1);
				$("#ha_bootip2").val(ip1);			
				$("#ha_hostname1").val(name2);
				$("#ha_bootalias1").val(name2 + "-BOOT");
				$("#ha_hostname2").val(name1);
				$("#ha_bootalias2").val(name1 + "-BOOT");
			}
			if(priNode == name1)
			{
				$("#ha_ip1").val(ip1);
				$("#ha_bootip1").val(ip1);
				$("#ha_ip2").val(ip2);
				$("#ha_bootip2").val(ip2);			
				$("#ha_hostname1").val(name1);
				$("#ha_bootalias1").val(name1 + "-BOOT");
				$("#ha_hostname2").val(name2);
				$("#ha_bootalias2").val(name2 + "-BOOT");
			}
		}
	
		function CheckInput() 
		{	
 			//var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;//正则表达式
 			var reg =  /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
 			var HAserviceIP = $("#HAserviceIP").val().trim();
 			var ha_netmask = $("#ha_netmask").val().trim();
 			
 			if($("#haname").val()== "")
			{ 
				sweet("请输入HA名称 !","warning","确定");
		    	return;	
			}
 						
 			if(HAserviceIP == "请确保设置的IP未被占用")
 			{ 
 				sweet("请输入HA Service IP !","warning","确定");
		    	return;
 			}
 		    if(HAserviceIP == $("#ha_ip1").val().trim() || HAserviceIP == $("#ha_bootip1").val().trim()  
 			   || HAserviceIP == $("#ha_ip2").val().trim() || HAserviceIP == $("#ha_bootip2").val().trim())
			{ 
				sweet("HA Service IP不能和节点 IP或节点 Boot IP 相同 !","warning","确定");
				return;
			}
 			if(!reg.test(HAserviceIP))
 			{
 				sweet("请输入正确格式的Service IP,例(127.0.0.1) !","warning","确定");
				return;
 			}	

			if ($("#HAserviceName").val() == "") 
			{ 
				sweet("请输入Service主机别名 !","warning","确定");
				return;
			} 
			
			if ($("#ha_netmask").val() == "") 
			{
				sweet("请输入子网掩码 !","warning","确定");
				return;
			}
			if(!reg.test(ha_netmask))
 			{ 
 				sweet("请输入正确格式的子网掩码,例(127.0.0.1) !","warning","确定");
				return;
 			}

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
  	<jsp:include page="topleft_close.jsp" flush="true" />
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
	                <p class="twotit" style="padding-left: 15px;">
	                	<em class="majornode nodes">主</em>节点<c:out  value="${num.count }"/>
	                </p>
	                <div class="column" style="margin-left:15px;">
	                  <div class="span12">
		                    <p>
								<b>主机名:</b> <span class="column_txt ser_name">${ser.name } </span> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<b>IP地址:</b><span class="column_txt ser_ip">${ser.ip}</span> 
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

                <div class="mainmodule">
                  <h5>Host信息完善</h5>
                  <form action="toDb2haNextPage.do?ptype=db2ha&status=makevg" method="post" id="submits" class="form-horizontal">
                  	<input type="hidden" id="serId" name="serId" value="${serId }">
                  	<input type="hidden" id="ptype"  class="w45" name="ptype" value="${ptype }" />
	                <input type="hidden" id="platform"  class="w45" name="platform" value="${platform }" />
	                
	                <div class="control-group">
	                    <label class="control-label">HA名称</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                      	  <input class="w45" type="text" id="haname" name="haname" value=""/>
	                      </div>	                     
	                    </div>
                    </div>

                  	<div class="control-group">
	                    <label class="control-label">节点1 IP</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                         <input id="ha_ip1" type="text" class="w45" name="ha_ip1" value="" readonly="readonly" />
	                      </div>
	                      <div class="inputb2l">
	                      	<span class="input140 mr20">节点1  主机名</span>
	                        <input id="ha_hostname1" type="text" class="w45"  value=""
	                               name="ha_hostname1" onblur="changeBoot(1,this)"/>
	                      </div>
	                    </div>
	                </div>
	                  
	                  <div class="control-group">
	                    <label class="control-label">节点1  Boot IP</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                          <input id="ha_bootip1" type="text" class="w45" value="" name="ha_bootip1" readonly="readonly" />
	                      </div>
	                      <div class="inputb2l">
	                      	<span class="input140 mr20">节点1 Boot主机别名</span>
	                        <input type="text" class="w45"  id="ha_bootalias1"  value="" name="ha_bootalias1" />
	                      </div>
	                    </div>
	                  </div>

                  	<div class="control-group">
	                    <label class="control-label">节点2 IP</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                          <input id="ha_ip2" type="text" class="w45" name="ha_ip2" value="" readonly="readonly" />
	                      </div>
	                      <div class="inputb2l">
	                      	<span class="input140 mr20">节点2  主机名</span>
	                        <input id="ha_hostname2" type="text" class="w45" name="ha_hostname2" value=""  onblur="changeBoot(2,this)"/>
	                      </div>
	                    </div>
	                  </div>
	                  
	                  <div class="control-group">
	                    <label class="control-label">节点2 Boot IP</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                          <input id="ha_bootip2" type="text" class="w45" name="ha_bootip2" value="" readonly="readonly" />
	                      </div>
	                      <div class="inputb2l">
	                      	<span class="input140 mr20">节点2 Boot主机别名</span>
	                        <input type="text" class="w45" id="ha_bootalias2"  name="ha_bootalias2" value="" />
	                      </div>
	                    </div>
	                  </div>

                    <div class="control-group">
	                    <label class="control-label">HA Service IP</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                          <input id="HAserviceIP" type="text" style="color: #C0C0C0" 
	                                 class="w45" name="ha_svcip" value="请确保设置的IP未被占用"
	                                 onfocus='if(this.value=="请确保设置的IP未被占用"){this.value="";$("#HAserviceIP").attr("style","color: #000000");}else{$("#HAserviceIP").attr("style","color: #000000");}' 
	                                 onblur='if(this.value==""){this.value="请确保设置的IP未被占用";$("#HAserviceIP").attr("style","color: #C0C0C0");};'/>
	                      </div>
	                      <div class="inputb2l">
	                      	<span class="input140 mr20">资源组主节点</span>
	                        <select id="selectmy" class="w85" style="width:47.5%" name="ha_primaryNode" onchange="sel_priNode()">
                            </select>
	                      </div>	               
	                    </div>
                    </div>
                    
                     <div class="control-group">
	                    <label class="control-label">子网掩码</label>
	                    <div class="controls">
	                      <div class="inputb2l">
	                          <input id="ha_netmask" type="text" class="w45" name="ha_netmask" value="255.255.255.0" />
	                      </div>
	                      <div class="inputb2l">
	                      	<span class="input140 mr20">Service主机别名</span>
	                        <input id="HAserviceName" type="text" class="w45" name="ha_svcalias" value="" />
	                      </div>
	                    </div>
	                  </div>
                     
                  </form>
                </div>
                
              </div>
            </div>   
          </div>
        </div>
        
      </div>
  
  <div class="columnfoot" style="width: 93%; left: 5%;">
    <a class="btn btn-info btn-up" onclick="javascript:history.go(-1);">
      <i class="icon-btn-up"></i>
      <span>上一页</span>
    </a>
    <a class="btn btn-info fr btn-next" onclick="CheckInput();">
        <span>下一页</span>
      <i class="icon-btn-next"></i>
    </a>
  </div>
<!--content end-->

  <script type="text/javascript">
		 function changeBoot(flag,q)
		 {
			 if("1"==flag)
			 {
				var a =  q.value+"-BOOT";
				$("#ha_bootalias1").val(a);
				var o1 = $("#selectmy").find("option:first");
				o1.val($("#ha_hostname1").val());
				o1.html($("#ha_hostname1").val());
				if(o1.attr("selected") == "selected")
				{
					$("#selectmy").prev().find("a:first").find("span:first").html($("#ha_hostname1").val());
				}
			 }
			 else if ("2"==flag)
			 {
				 var a =  q.value+"-BOOT";
				 $("#ha_bootalias2").val(a);
				 var o2 = $("#selectmy").find("option:last");
				 o2.val($("#ha_hostname2").val());
				 o2.html($("#ha_hostname2").val());
				 if(o2.attr("selected") == "selected")
				 {
					$("#selectmy").prev().find("a:first").find("span:first").html($("#ha_hostname2").val());
				 }
			 }								
		} 	
  </script>
</body>
</html>
