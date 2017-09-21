<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="header.jsp" flush="true" />
<title>自动化部署平台</title>
<style type="text/css">
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:scroll;
}
.linkexpre{
	float:left;
	margin-right:10px;
}
i:hover{
	cursor:pointer;
}
</style>
<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
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
				<i class="icon-home"></i>灾备切换
			</a>
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
							<div class="widget-content">灾备切换场景一览表</div>
							
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

							<table id="sel_tab" class="table table-bordered with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th hidden="" style="text-align: center;width:20%;">流程名</th>
										<th style="text-align: center;width:20%;">流程名</th>
										<th style="text-align: center;width:15%;">责任人</th>
										<th style="text-align: center;width:20%;">最近运行时间</th>
										<th style="text-align: center;width:20%;">最近任务状态</th>
										<th style="text-align: center;width:25%;">操作链接</th>
									</tr>
								</thead>

								<tbody class="searchable">
								<c:forEach items="${ taskList }" var="task">
									<tr>
										<td id="dag_id" hidden="">${task.dag_id }</td>
										<td style="text-align: center;">${task.dag_alias }</td>
										<td style="text-align: center;">${task.owners }</td>
										<td id="dag_time" style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${task.last_run_date }"/></td>
										<td style="text-align: center;">${task.last_run_status }</td>
										<td>
										<c:if test="${ task.dag_status eq 0}"> <!--0 未开始 -->
											<div style="margin-left:18%;">
												<div class="linkexpre" >
													<i id="${task.dag_id}_play" class="_play fa fa-play-circle" style="font-size:26px;color:#0066FF"></i>
												</div>
												
												<div class="linkexpre">
													<i id="${task.dag_id}_stop" class="_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe"></i>
												</div>
												<div class="linkexpre" style="margin-top:2px;">
													<i id="${task.dag_id}_running" class="_running fa fa-telegram" style="font-size:23px;color:#bebebe"></i>
												</div>
												<div class="linkexpre">
													<i id="${task.dag_id}_history" class="_history fa fa-clock-o" style="font-size:26px;color:#D4237A"></i>
												</div>
																																																				
											</div>
											</c:if>
											
											<c:if test="${ task.dag_status eq 1}"> <!-- 1运行中 -->
											<div style="margin-left:18%;">
												<div class="linkexpre" >
													<i id="${task.dag_id}_play" class="_play fa fa-pause-circle" style="font-size:26px;color:#0066FF"></i>
												</div>
												
												<div class="linkexpre">
													<i id="${task.dag_id}_stop" class="_stop fa fa-stop-circle" style="font-size:26px;color:red"></i>
												</div>
												<div class="linkexpre" style="margin-top:2px;">
													<i id="${task.dag_id}_running" class="_running fa fa-telegram" style="font-size:23px;color:#0066FF"></i>
												</div>
												<div class="linkexpre">
													<i id="${task.dag_id}_history" class="_history fa fa-clock-o" style="font-size:26px;color:#D4237A"></i>
												</div>
																																																				
											</div>
											</c:if>
											
											<c:if test="${ task.dag_status eq 2}"> <!-- 2暂停 -->
											<div style="margin-left:18%;">
												<div class="linkexpre" >
													<i id="${task.dag_id}_play" class="_play fa fa-pause-circle" style="font-size:26px;color:#0066FF"></i>
												</div>
												
												<div class="linkexpre">
													<i id="${task.dag_id}_stop" class="_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe"></i>
												</div>
												<div class="linkexpre" style="margin-top:2px;">
													<i id="${task.dag_id}_running" class="_running fa fa-telegram" style="font-size:23px;color:#bebebe"></i>
												</div>
												<div class="linkexpre">
													<i id="${task.dag_id}_history" class="_history fa fa-clock-o" style="font-size:26px;color:#D4237A"></i>
												</div>
																																																				
											</div>
											</c:if>
											<c:if test="${ task.dag_status eq 3}"> <!-- 3 失败|停止 -->
											<div style="margin-left:18%;">
												<div class="linkexpre" >
													<i id="${task.dag_id}_play" class="_play fa fa-pause-circle" style="font-size:26px;color:#0066FF"></i>
												</div>
												
												<div class="linkexpre">
													<i id="${task.dag_id}_stop" class="_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe"></i>
												</div>
												<div class="linkexpre" style="margin-top:2px;">
													<i id="${task.dag_id}_running" class="_running fa fa-telegram" style="font-size:23px;color:#bebebe"></i>
												</div>
												<div class="linkexpre">
													<i id="${task.dag_id}_history" class="_history fa fa-clock-o" style="font-size:26px;color:#D4237A"></i>
												</div>
																																																				
											</div>
											</c:if>
											<c:if test="${ task.dag_status eq 4}"> <!--4 成功 -->
											<div style="margin-left:18%;">
												<div class="linkexpre" >
													<i id="${task.dag_id}_play" class="_play fa fa-pause-circle" style="font-size:26px;color:#0066FF"></i>
												</div>
												
												<div class="linkexpre">
													<i id="${task.dag_id}_stop" class="_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe"></i>
												</div>
												<div class="linkexpre" style="margin-top:2px;">
													<i id="${task.dag_id}_running" class="_running fa fa-telegram" style="font-size:23px;color:#bebebe"></i>
												</div>
												<div class="linkexpre">
													<i id="${task.dag_id}_history" class="_history fa fa-clock-o" style="font-size:26px;color:#D4237A"></i>
												</div>
																																																				
											</div>
											</c:if>
										</td>
									</tr>
								
								</c:forEach>
									
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>


<script type="text/javascript">
	
$(document).click(function(e) { // 在页面任意位置点击而触发此事件
	 var id =  $(e.target).attr("id");       // e.target表示被点击的目标
	 //alert(id)
	})

	
	//历史记录的跳转
	$("._history").click(function(){
		var dagid = $(this).parents("tr").find("#dag_id").text()
		//console.log(dagid+";"+dagtime)
		//alert(dagid+";"+dagtime)
		window.open("historyPage.do?dagid="+ dagid);
	})
	
	//运行记录的跳转
	$("._running").click(function(){
		window.open("runningPage.do");
	})
	
	
    //启动和暂停按钮的处理
	$("._play").click(function(){
		swal({
            title: "",
            text: "请再次确认是否立即启动此灾备切换流程？",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "是",
            cancelButtonText: "否", 
            confirmButtonColor:"#ec6c62"
        }, 
        function(isConfirm)
        {
        	  if (isConfirm) 
        	  {
        		  $.ajax({
        				url : "<%=path%>/postRunAirflow.do",
        				type : 'post',
        				data:{dag_id:"pprc_go"},
        				dataType : 'json',
        				success : function(result) {
        					  if(result != 'undefined' || result != null)
        					{
        					  $("#pprc_go_play").css("color","#bebebe");
        					  $("#pprc_go_play").removeClass("fa-play-circle").addClass("fa-pause-circle");
        	        		  $("#pprc_go_stop").css("color","red");
        	        		  $("#pprc_go_running").css("color","#0066FF");
        	        		  $("#pprc_go_play").unbind("click");
        					}else{
        						alert("发生IO异常");
        					}
        				},
        				error : function(errmsg) {

        				}
        			})
        	  } 
        	  else 
        	  {
        		 // window.location.href = "";
        	  }
        });
	})
	

function ajax(url, param, type) {
         return $.ajax({
         url: url,
         data: param || {},
         type: type || 'GET'
         });
}

function handleAjax(url, param, type) {
	 return ajax(url, param, type).then(function(resp){
	 // 成功回调
    if(resp.result){
    return resp.data; // 直接返回要处理的数据，作为默认参数传入之后done()方法的回调
    }
    else{
    return $.Deferred().reject(resp.msg); // 返回一个失败状态的deferred对象，把错误代码作为默认参数传入之后fail()方法的回调
    }
}, function(err){
//失败回调
	console.log(err.status); // 打印状态码
	});
}
	
	
	
</script>
</html>