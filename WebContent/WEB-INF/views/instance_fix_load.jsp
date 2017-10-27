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
<jsp:include page="header.jsp" flush="true" />
<title>自动化运维平台</title>
<style type="text/css">
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
.mr20{
	font-size:14px;
}
.black_overlay{
    display: none;
    position: absolute;
    top: -20px;
    left: 0%;
    width: 100%;
    height: 100%; 
    z-index:1001;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);
}
.white_content {
    display: none;
    position: absolute;
    top: -20%;
    left: 10%;
    width: 80%;
    height: 500px;
    border: 2px solid lightblue;
    background-color: white;
    z-index:1002;
    overflow: auto;
    margin:0 auto;
} 
.hand{
    cursor:pointer;
}
.rmline:hover{
    text-decoration:none;
}
.flag{
	height:25px;
	width:25px;
	vertical-align:middle;
	text-align: center;
	border:1px solid #7BBBE5;
	border-radius:5px;
	float:left;
}
#Down{
	cursor:pointer;
}
.input140{
	width:80px;
}
</style>
<script>
	$(document).ready(function() {
		(function($) {
			$('#filter').keyup(function() {
				var rex = new RegExp($(this).val(), 'i');
				$('.searchable tr').hide();
				$('.searchable tr').filter(function() {
					return rex.test($(this).text());
				}).show();
			})
		}(jQuery));
	});
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
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
			<a href="" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>实例一览
			</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 补丁加载</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box collapsible">
						<div class="widget-title">
							<a data-toggle="collapse" href="#collapseOne">
								<span class="icon"> <i class="icon-arrow-right"></i></span>
								<h5>说明：</h5>
							</a>
						</div>
						<div id="collapseOne" class="collapse in">
							<div class="widget-content">补丁加载概要信息.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="widget-box nostyle">
							<div class="col-sm-6 form-inline">
								<input id="filter" type="text" class="form-control" placeholder="请输入过滤项" style="height:28px;">
								<span style="margin-right: 4px;"></span>
								<button class="btn btn-sm" data-toggle="modal" data-target="#fixload" style="background-color: #448FC8;" onclick="fixloadBtn()">
									<font color="white">FTP补丁加载</font>
								</button>
							</div>

							<div style="margin-bottom: 10px;"></div>
							<table id="sel_tab"
								class="table table-bordered data-table with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">IP</th>
										<th style="text-align: center;">执行时间</th>
										<th style="text-align: center;">执行人</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>

								<tbody class="searchable">
									<c:forEach items="${jobs }" var="job" varStatus="status">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="servers"
													value="${job.uuid }" onclick="isSelect(this);" /></td>
										    <td style="text-align: center;">${job.targetIP }</td>								
											<td style="text-align: center;">${job.exeTime }</td>
											<td style="text-align: center;">${job.user }</td>
											<c:if test="${job.status == 0 }">
												<td style="text-align: center;"><button  class="btn btn-info">未运行</button></td>
											</c:if>	
											<c:if test="${job.status == 1 }">
												<td style="text-align: center;"><button  class="btn btn-info">运行中</button></td>
											</c:if>					
											<c:if test="${job.status == 2 }">
												<%-- <td style="text-align: center;"><button id="${job.uuid }" onclick="downloadLogs(this);"  class="btn btn-info">已完成</button></td> --%>
												<td style="text-align: center;"><button id="btn1" name="${job.uuid }" onclick="showWindow('${job.uuid}');"  class="btn btn-info">已完成</button></td>
											</c:if>	
										</tr>
									</c:forEach> 
								</tbody>
							</table>
							
							<!-- 模态框：补丁加载 -->
							<div class="modal fade" id="fixload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 头部 -->
										<div class="modal-header">
											<h5 class="modal-title" id="myModalLabel">
												<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;补丁加载
											</h5>
										</div>
										<!-- 主体内容 -->
										<form action="addFixLoadTask.do" method="post" id="submits_fixload">
											<div class="modal-body">
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20" style="width:150px;">IP：</span>
														<select id="iplist" multiple="multiple" name="iplist" class="w85" style="width: 220px;">
														</select>
													</div>
												</div>																																	
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20" style="width:150px;">选择补丁级别：</span>
														<select id="fixlevel" name="fixlevel" class="w85" style="width: 220px;">
														</select>
													</div>
												</div>									
											</div>
										</form>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
										<button type="button" class="btn" style="background-color: #448FC8;" onclick="CheckInput();">
											<font color="white">提交</font>
										</button>
									</div>
								</div>
							</div>
							<!-- 模态框：补丁加载 -->
							
							<!--背景层-->
							<div id="fade" class="black_overlay"></div>
							
							<!--***********************************step1***********************************-->
							<div id="step1" class="white_content">
							    <div style="width: 100%;height: 20px;">
							        <div style="float: right;" onclick="CloseDiv('step1','fade')"><img src="img/cha.png"></div>
							    </div>
							    
							    <div style="width: 90%;height:35px;margin:-5px auto;font-size:15px;">
							   		<div style="margin-top:10px;">
							       		<div style="height:20px;width:30%;float:left;"> <span class="input140 m20">IP地址：</span><span id="fixip"></span> </div>
							        	<div style="height:20px;width:60%;float:left;"> <span class="input140 m20">补丁名称：</span><span id="fixpatch" style="width:250px;"></span></div>
							        </div>							 								        
							    </div>
							    
							    <div style="width: 90%;height:35px;margin: 0 auto;font-size:15px;">
							       	<div style="height:20px;width:30%;float:left;"> <span class="input140 m20">执行用户：</span><span id="showuser"></span> </div>
							        <div style="height:20px;width:30%;float:left;"> <span class="input140 m20">执行时间：</span><span id="showtime"></span></div>
							        <div style="height:20px;width:30%;float:right;"> <span class="input140 m20">下载文件：</span><span id="Down" style="color:blue" onclick="downloadRunInfo(this);">下载</span></div>
							    </div>
							    
							    <div id="showLog" style="width: 90%;height:380px;padding-left:10px;padding-top:10px;margin: 0 auto;background-color: black;color: white;overflow-y: auto; overflow-x:hidden;"></div>
							</div>
						<!--***********************************step1***********************************-->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>

<script>
	function CheckInput()
	{
		var iplist = $("#iplist").val();
		var fixlevel = $("#fixlevel").val();
		if(iplist == null)
		{
			sweet("请选择IP","warning","确定"); 
        	return;
		}
		$.ajax({
			url : '<%=path%>/addFixLoadTask.do',
			data : $('#submits_fixload').serialize(),
			type : 'post',
			dataType : 'json',
			success : function(result) 
			{
				if(result.msg == 'success'){
				swal({
		            title: "",
		            text: "是否创建补丁加载？", 
		            type: "warning",
		            showCancelButton: true,
		            confirmButtonText: "是",
		            cancelButtonText: "否",  
		        }, 
		        function(isConfirm)
		        {
		        	  if (isConfirm) 
		        	  {
							$("#iplist").val("");
							window.location.href = "fixLoad.do";
		        	  } 
		        	  else 
		        	  {
		        		  window.history.go(0);
		        	  }
		        });
				}
			}
		});
	}
	
	//自动获取IP
	function fixloadBtn()
	{
 		$.ajax({
			url:"<%=path%>/getAllips.do",
			type : 'get',
			dataType : 'json',
			success:function(result)
			{
				var str;
				for (var i = 0; i < result.length; i++) 
				{					
					str += "<option value='" + result[i] + "'>" + result[i]+ "</option>";
				}	
				$("#iplist").append(str); 	
			},
			failure:function(errmsg)
			{
				alert(errmsg)
			}
		}) 
	}
	
	//弹出隐藏层
	function ShowDiv(show_div,bg_div)
	{
	    document.getElementById(show_div).style.display='block';
	    document.getElementById(bg_div).style.display='block' ;
	    var bgdiv = document.getElementById(bg_div);
	    bgdiv.style.width = document.body.scrollWidth;
	    $("#"+bg_div).height($(document).height());
	}
	
	//模态框关闭按钮
	function closeModal()
	{
		window.location.href = "fixLoad.do"; //这里写补丁加载的首页do 
	}
	
	//关闭命令执行窗口 
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    }
</script>


<script type="text/javascript">

function  downloadRunInfo(obj)
{
	id=$("#btn1").attr('name');
	var form = $("<form>");//定义一个form表单
	form.attr("style", "display:none");
	form.attr("target", "download");
	form.attr("method", "post");
	form.attr("action", "patchLoading_download_info.do");
	var input1 = $("<input>");
	input1.attr('name','uuid');
	input1.attr("type", "hidden");
	input1.attr("value", id);
	$("body").append(form);//将表单放置在web中
	form.append(input1);
	form.submit();//表单提交 
}

function loadFixpack()
{
	$.ajax({
		url:"<%=path%>/getfixloadfp.do",
		type : 'get',
		dataType : 'json',
		success:function(result)
		{
			var str="";		
			for (var i = 0; i < result.length; i++) {
				for ( var key in result[i])
					{
					str += "<option value='" + result[i][key] + "'>" + key+ "</option>";}
					}
				$("#fixlevel").append(str);
				
		}})
}

loadFixpack();
</script>


<script type="text/javascript">
	
	function showWindow(uuid){
		 $.ajax({
     		url:'<%=path%>/getPatchLoadingCommandDetails.do?uuid='+uuid,
				type:'get',
				dataType : 'json',
				cache:false,
				success:function(retVal)
				{
					 $("#step1").show();
					 $("#showuser").text(retVal.user);
					 $("#btn1").attr('name',retVal.uuid);
					 $("#showtime").text(retVal.exec_time);
					 var iplist=" ";
					 for(var i = 0 ; i < retVal.ip_list.length;i++)
					 {
						 iplist += retVal.ip_list[i];
					 }
					
					 $("#fixip").text(iplist);
					 $("#fixpatch").text(retVal.fixpack_name);
					 $("#showLog").html("<p style='line-heigth:5px;'>"+retVal.detail.split('\n').join('<br>')+"</p>");
				   /*  var docommand = retVal.command;
			        var douser = retVal.user;
			        var user = retVal.user;
			        var exeTime = retVal.exeTime;
			        var result = retVal.result;
			        var uuid = retVal.uuid;
			        $("#showcommand").text(docommand);
			        $("#showuser").text(douser);
			       
			        $("#showtime").text( timeStamp2String(exeTime*1000));
			      	$("#uuid").text(uuid);
			        $("#showLog").html(result.split('\n').join('<br>')); */
			}
     })
}


</script>

<!-- websocket 动态更新主机信息 -->
<script type="text/javascript">
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
    	websocket = new WebSocket("ws://192.168.80.154:8000/api/v1/ws/fix"); 
    }
    else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
    //    setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
     //   setMessageInnerHTML("WebSocket连接成功");
    	websocket.send("sfasdfadsfasdf");
    }

    
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        setMessageInnerHTML(event.data);
    }

    //连接关闭的回调方法
    websocket.onclose = function () {
     //   setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

  //将消息显示在网页上
    function setMessageInnerHTML(retData) {
    	alert(retData);
    }

    //关闭WebSocket连接
    function closeWebSocket() {
    	if(websocket != null)
    	{
    		websocket.close();
    		websocket = null;
    	}
        
    }
</script>


</html>