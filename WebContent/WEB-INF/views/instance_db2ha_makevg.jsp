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
	.vgcss{
		width:100%;
		height:40px;
		background:#2592e0;
		color:#fff;
		font-size:16px;
		font-weight:bold;
		border:1px solid #2592e0;
		-moz-border-radius: 4px;      /* Gecko browsers */
	    -webkit-border-radius: 4px;   /* Webkit browsers */
	    border-radius:4px;            /* W3C syntax */
	}
	.vgcsst{
		width:100%;
		height:40px;
		background:#b0b0b0;
		color:#fff;
		font-size:16px;
		font-weight:bold;
		border:1px solid #fff;
		-moz-border-radius: 4px;      /* Gecko browsers */
	    -webkit-border-radius: 4px;   /* Webkit browsers */
	    border-radius:4px;            /* W3C syntax */
	}
	.input140,label,.mr20{
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
	
	<script  type="text/javascript">
		//是否为空标记
		var flagN = true;
		function CheckInput() 
		{
			if ($("#ha_RGName").val().trim() == "") 
			{
				sweet("请输入资源组名称 !","warning","确定");
				return;
			}
			
			if ($("#ha_ASName").val().trim() == "") 
			{
				sweet("请输入AS名称 !","warning","确定");
				return;
			}
			
			$("#submits").submit();
		}
		
		//添加VG
		function addMsg(ele)
		{
			var v1 = [];
			$(ele).find("ul").find("li").each(function(index3,ele3)
			{
				if($(ele3).find("div").text() != "")
				{
					var str = $(ele3).find("div").text();
					var strnum =str.lastIndexOf("(");
					v1.push(str.substring(0,strnum));
				}
			});
			if(v1.length == 0)
			{
				flagN = false;
			}
			return v1;
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
                 
                
                <div class="mainmodule"  id="div1">
                  <form action="toDb2haNextPage.do?serId=${serId}&platform=${platform}&type=${ptype}&status=config" 
                        method="post" id="submits" >
                  <h5>资源组名称
                  	<div class="inputb4 ml20">
                  		<input type="text" Id="ha_RGName" name="ha_RGName" value="RG1"/>
                  	</div>
                    <div class="inputb2">
                    	<b class="input140 mr20" style="width:220px;">Application Server(Controller)</b>
                        <input type="text"Id="ha_ASName" name="ha_ASName" value="AS1"/>
                    </div>
                  </h5>    
                 
                  <div class="form-horizontal processInfo">
                    <p class="twotit">资源组共享VG信息 &nbsp;&nbsp;&nbsp;
                  	  <span style="color:#727272">*注：每一特定hdisk能且只能存在于某一VG中。</span>
                    </p>
                    <!-- 常规参数 -->
                  	<input type="hidden" id="serId" name="serId" value="${serId }">
                  	<input type="hidden" id="ptype" name="ptype" value="${ptype }" />
                  	<input type="hidden" id="hostId" name="hostId" value="${hostId}">
                  	<input type="hidden" id="platform" name="platform" value="${platform }">
                  	
                  	<!-- Host参数 -->
                  	<input type="hidden" id="haname" name="haname" value="${haname }">
                  	<input type="hidden" id="ha_primaryNode" name="ha_primaryNode" value="${ha_primaryNode }">                 	
                  	<input type="hidden" id="ha_ip1" name="ha_ip1" value="${ha_ip1 }">
                  	<input type="hidden" id="ha_hostname1" name="ha_hostname1" value="${ha_hostname1 }">
                  	<input type="hidden" id="ha_bootip1" name="ha_bootip1" value="${ha_bootip1 }">
                  	<input type="hidden" id="ha_bootalias1" name="ha_bootalias1" value="${ha_bootalias1 }">                 	
                  	<input type="hidden" id="ha_ip2" name="ha_ip2" value="${ha_ip2 }">
                  	<input type="hidden" id="ha_hostname2" name="ha_hostname2" value="${ha_hostname2 }">
                  	<input type="hidden" id="ha_bootip2" name="ha_bootip2" value="${ha_bootip2 }">
                  	<input type="hidden" id="ha_bootalias2" name="ha_bootalias2" value="${ha_bootalias2 }">                  	
                  	<input type="hidden" id="ha_svcip" name="ha_svcip" value="${ha_svcip }">
                  	<input type="hidden" id="ha_svcalias" name="ha_svcalias" value="${ha_svcalias }">
                  	<input type="hidden" id="ha_netmask" name="ha_netmask" value="${ha_netmask }">
                  	
                  	<!-- 其他参数 -->  
                  	<input type="hidden" id="ppSize" name="ppSize" value="64">
                  	<input type="hidden" id="autoOn" name="autoOn" value="n">
                  	<input type="hidden" id="factor" name="factor" value="1">
                  	<input type="hidden" id="vgType" name="vgType" value="S">
                  	<input type="hidden" id="concurrent" name="concurrent" value="y">
                  	
                  	<input type="hidden" id="ha_db2instpv" name="ha_db2instpv"/>
                    <input type="hidden" id="ha_db2datapv" name="ha_db2datapv"/>
                    <input type="hidden" id="ha_db2logpv" name="ha_db2logpv"/>
                    <input type="hidden" id="ha_db2archlogpv" name="ha_db2archlogpv"/> 
                    <input type="hidden" name="ha_vgcaap" value="ha_vgcaap" />    
                       
                       
                    <input type="hidden" id="instpv1" name="instpv1"/>
                    <input type="hidden" id="datapv1" name="datapv1"/>
                    <input type="hidden" id="logpv1" name="logpv1"/>
                    <input type="hidden" id="archlogpv1" name="archlogpv1"/> 
                    <input type="hidden" id="vgcaap1" name="vgcaap1" />                                            
                       
                    <input type="hidden" id="alldisks" value=""/>
		            <input type="hidden" id="alldisksb" value=""/>
		            <input type="hidden" id="alldisksc" value=""/>
		            <input type="hidden" id="alldisksd" value=""/>
		            
		            <input type="hidden" id="pvs9" value=""/>
		            <input type="hidden" id="falg" value="" />
                  	<input type="hidden" id="hostName" name="hostName" value="${hostName }">
                  	<input type="hidden" id="hostIp" name="hostIp" value="${hostIp}">
                  	<input type="hidden" id="serName" name="serName" value="${serName }">
                  	<input type="hidden" id="serIp" name="serIp" value="${serIp }">
					<input type="hidden" id="perName" name="perName" value="${perName }">
                  	<input type="hidden" id="perIp" name="perIp" value="${perIp }">                  	
                  	<input type="hidden" id="hostId1" name="hostId1" value="${hostId1 }">
                  	<input type="hidden" id="hostId2" name="hostId2" value="${hostId2 }">                 	                  	                                                             		                
					
					
						
                        <div class="control-group groupborder">
	                      <label class="control-label c-lmini"></label>
	                      <div class="controls controls-mini">
	                        <div class="inputb4">
	                        	<input type="text" name="ha_vgdb2inst" value="db2instvg" readonly="readonly" />
	                        </div>
	                        <div class="inputb2">
	                          <select id="se0" class="w85" name="db2_inst_pv"  onchange="freshVGArray(this,'instpv1');">
	                          </select>
	                        </div>
	                        <div class="inputb4">
	                          <input type="text" name="db2_insthome" value="/db2home" readonly="readonly" />
	                        </div>	                        
	                      </div>
	                    </div>
	                    
	                    <div class="control-group groupborder">
	                      <label class="control-label c-lmini"></label>
	                      <div class="controls controls-mini">
	                        <div class="inputb4">
	                        	<input type="text" name="ha_vgdb2data" value="db2datavg" readonly="readonly" />
	                        </div>
	                        <div class="inputb2">
	                          <select id="se0" class="w85" name="db2_data_pv" onchange="freshVGArray(this,'datapv1');"> 
	                          </select>
	                        </div>
	                        <div class="inputb4">
	                          <input type="text" name="db2_insthome" value="/data" readonly="readonly" />
	                        </div>
	                      </div>
	                    </div>
	                    
		                <div class="control-group groupborder">
	                      <label class="control-label c-lmini"></label>
	                      <div class="controls controls-mini">
	                        <div class="inputb4">
	                        	<input  type="text" name="ha_vgdb2log" value="db2logvg" readonly="readonly" />
	                        </div>
	                        <div class="inputb2">
	                          <select id="se0" class="w85" name="db2_log_pv" onchange="freshVGArray(this,'logpv1');">
	                          </select>
	                        </div>
	                        <div class="inputb4">
	                          <input type="text" name="db2_insthome" value="/db2log" readonly="readonly" />
	                        </div>
	                      </div>
	                    </div>
                    
                    	<div class="control-group groupborder">
	                      <label class="control-label c-lmini"></label>
	                      <div class="controls controls-mini">
	                        <div class="inputb4">
	                        	<input type="text" name="ha_vgdb2archlog" value="db2archlogvg" readonly="readonly" />
	                        </div>
	                        <div class="inputb2">
	                          <select id="se0" class="w85" name="db2_archlog_pv" onchange="freshVGArray(this,'archlogpv1');">                         
	                          </select>
	                        </div> 
	                        <div class="inputb4">
	                          <input type="text" name="db2_insthome" value="/db2archlog" readonly="readonly" />
	                        </div>   
	                      </div>
	                    </div>  
                    
	                    <div class="control-group groupborder">
	                      <label class="control-label c-lmini"></label>
	                      <div class="controls controls-mini">
	                        <div class="inputb4">
	                        	<input type="text" name="ha_caappv" value="caapvg" readonly="readonly" />
	                        </div>   
	                        <div class="inputb2">
	                          <select id="se0" class="w85" name="db2_caapvg_pv" onchange="freshVGArray(this,'vgcaap1');">                         
	                          </select>
	                        </div>  
	                      </div>
	                    </div>                                         

                    
                    	
                    <div>
                      <p class="twotit">HA切换策略 &nbsp;&nbsp;&nbsp;<span style="color:#727272"></span></p>
                    </div>	
                    
                    <div class="control-group groupborder">
                      <label class="control-label c-lmini">启动HA策略</label>
                      <div class="controls controls-mini">
                      	<div class="inputb4">
                          <select class="w80" name="ha_startpolicy">
                              <option value="OUDP">online using node distribution policy</option>
	                          <option value="OHN" selected="selected">online on home node only</option>
	                          <option value="OFAN">online on first available node</option>
	                          <option value="OAAN">online on all available nodes</option>
                          </select>
                        </div>
                        <div class="inputb3">
                          <span class="inputbtxt mr20">HA切换策略</span>
                          <select class="w70" name="ha_fopolicy" >
                              <option value="FNPN">fallover to next priority node in the list</option>
                              <option value="FUDNP">fallover using dynamic node priority</option>
                              <option value="BO">bring offline (on error node only)</option>
                          </select>
                        </div>
                        <div class="inputb3">
                          <span class="inputbtxt mr20">HA回切策略</span>
                          <select class="w70" name="ha_fbpolicy">
                              <option value="NFB">never fallback</option>
                              <option value="FBHPN">fallback to higher priority node in the list</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    	
                  	<div style="text-align:center; position:relative; margin-top:20px;">
	                   <span id="spanaddvg" class="pull-login"></span>
	                   <span id="spancutvg" class="pull-login"></span>
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
        <i class="icon-btn-up"></i><span>上一页</span>
    </a>
    <a class="btn btn-info fr btn-next" onclick="CheckInput();">
        <span>下一页</span><i class="icon-btn-next"></i>
    </a>
  </div>
<!--content end-->

<script type="text/javascript">

var totalArray=[];   //包含总的pv 数量，需要从中删除
var removeArray=[];//每次被删除的数据存放的地方 
//获取主节点PV
function getPrimaryNodePVInfo()
{
	var pvArray = [];
	//获取ha_ip1 节点的IP信息，是主节点信息
	var primaryNode = $("#ha_ip1").val().trim();
	$.ajax({
		url : "<%=path%>/getPrimaryNodePVInfo.do",
		data : {primaryNode:primaryNode,platform : "aix"},
		type : 'post',
		dataType : 'json',
		success : function(result) 
		{
			//第一步，将其放入数组
			if(result['allHdisk'] == 0) //获取为0
			{
				
				var str = "<option value='" + 0 + "'>" + "没有获取到disk信息"+ "</option>";
				$(".w85").each(function(index, ele){    //初始化给每个select 都有
					$(ele).next().append(str);
				})
			}else if(result['allHdisk'] == -1)//获取出错
			{
				var str = "<option value='" + 0 + "'>" + "获取disk信息出错"+ "</option>";
				$(".w85").each(function(index, ele){    //初始化给每个select 都有
					$(ele).next().append(str);
				})
			}else{
				pvArray = result['allHdisk'].split(" ");
				totalArray=pvArray;
				var str="<option value='-'>"+ "请选择..." + "</option>";
				for (var i = 0; i < pvArray.length; i++) 
				{										
					str += "<option value='" + pvArray[i] + "'>" + pvArray[i]+ "</option>";
				}

				$(".w85").each(function(index, ele){    //初始化给每个select 都有
					$(ele).next().append(str);
				})
			}
			
			
		},
		failure : function(errmsg)
		{
			
		}
	});
}

//从数组中删除指定值的方法
Array.prototype.removeByValue = function(val) {
	  for(var i=0; i<this.length; i++) {
	    if(this[i] == val) {
	      this.splice(i, 1);
	      break;
	    }
	  }
	}

//当从下拉框选了一个元素后，需要刷新数组，从新选择没有被选择的元素
function freshVGArray(element,hiddenElement){
	//alert($(element).attr('name'));//获取name 字段值
	//alert(element.value);//获取选中value
	//alert(element.text())
	//alert(element.value);
	//如果原来select 是空的直接removeByValue
	//如果原来有值的话，需要把原值加入到totalArray,并且把新值从totalArray 中删除
	removeArray.push(element.value);//保存被删的内容
	totalArray.removeByValue(element.value);
	//totalArray.push($(hiddenElement).val());
	
	var obj = $('#'+hiddenElement).val();
	/*if($('#'+hiddenElement).val() != 'undefined' || $('#'+hiddenElement).val() != '' || $('#'+hiddenElement).val() != null){
		
		totalArray.push($('#'+hiddenElement).val());
	}*/
	
	
	if(obj.length != 0){
		totalArray.push($('#'+hiddenElement).val());
	}
	
	$('#'+hiddenElement).val(element.value);//将对应的select 删除的数据临时保存起来
	
	
	//清空其他的内容
	$(".w85").each(function(index, ele)
		    {
				if($(ele).attr('name') != $(element).attr('name'))
				{
					$(ele).next().empty();  //清空其他元素的内容，然后赋值新数组内容
				}
					
			});
	var str="<option value='-'>"+ "请选择..." + "</option>";
	for (var i = 0; i < totalArray.length; i++) 
	{										
		str += "<option value='" + totalArray[i] + "'>" + totalArray[i]+ "</option>";
	}
	$(".w85").each(function(index, ele){    //初始化给每个select 都有
		if($(ele).attr('name') != $(element).attr('name'))
		{
			$(ele).next().append(str);  //清空其他元素的内容，然后赋值新数组内容
		}
	})
	
	
}
getPrimaryNodePVInfo();

</script>

</body>
</html>
