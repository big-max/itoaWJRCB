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
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="../header.jsp" flush="true" />
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
.linkexpre{
	float:left;
	margin-left:30px;
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
		<jsp:include page="../topleft_close.jsp" flush="true" />
	</div>
	<!--header end-->
	
	<!--content start-->
	<div class="content">
		<div class="breadcrumb">
			<a href="" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>日终流程
			</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="widget-box nostyle">
							<table id="sel_tab" class="table table-bordered with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;width:20%;">流程名</th>
										<th style="text-align: center;width:15%;">责任人</th>
										<th style="text-align: center;width:20%;">最近运行时间</th>
										<th style="text-align: center;width:20%;">最近任务状态</th>
										<th style="text-align: center;width:25%;">操作链接</th>
									</tr>
								</thead>
								<tbody class="searchable">
								</tbody>
							</table>
							
							<!-- 日终事件处理 -->
							<div style="margin-top:20px;"></div>
							<table id="rz_event" class="table table-bordered data-table with-check table-hover no-search no-select">
								<thead>
									
									<tr>
										<th style="text-align: center;">执行用户</th>
										<!-- <th style="text-align: center;">流程名</th> -->
										<th style="text-align: center;">任务名</th>
										<!-- <th style="text-align: center;">执行时间</th> -->
										<th style="text-align: center;">添加时间</th>
										<th style="text-align: center;">处理记录</th>

								</thead>
								<tbody>

									<c:forEach items="${logRecordList }" var="record">
										<tr>
											<td style="text-align: center;">${record.username }</td>
											<%-- <td style="text-align: center;">${record.dag_id }</td> --%>
											<td style="text-align: center;">${record.task_id }</td>
											<%-- <td style="text-align: center;">${record.execution_date }</td> --%>
											<td style="text-align: center;">${record.add_datetime }</td>
											<td style="text-align: left;">${record.task_detail }</td>
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
<!-- 更新表格状态-->
function update_summary_table_state()
{
	$.ajax({
		url : "<%=path%>/autoswitchData.do",
		type : 'get',
		dataType : 'json',
		success:function(data)
		{
			var html = "";
			for(var i = 0 ; i < data.length ; i++)
			{
				if(data[i].dag_alias.indexOf("日终") >=0 ){ 
				 html += "<tr>";
		         html +=     "<td id=\"dag_id\" hidden=\"\" style=\"text-align: center;\">" + data[i].dag_id + "</td>"
		         html +=     "<td id=\"dag_alias\" style=\"text-align: center;\">" + data[i].dag_alias + "</td>"
		         html +=     "<td style=\"text-align: center;\">" + data[i].owners + "</td>"
		         html +=     "<td id=\"execution_date\" style=\"text-align: center;\">" + data[i].last_run_date + "</td>"
		         html +=     "<td id=\"dag_state\" style=\"text-align: center;\">" + data[i].last_run_status + "</td>"
		              + "<td>" 
		         if(data[i].last_run_status == '' || data[i].last_run_status == 'failed' || data[i].last_run_status == 'success' )  //表示当前没有发起的任务 或者任务有结束的
		         {
		        	  html +=    "<div style=\"margin-left:18%;\">" +                                  //这里加上样式按钮
			         	"<div class=\"linkexpre\">"+
			         	"<i id=\""+data[i].dag_id+"_play\" class=\"_play fa fa-play-circle\" style=\"font-size:26px;color:#0066FF\" data-toggle=\"modal\" data-target=\"#checkpass\"></i>"
						+"</div>"
						+"</div><div class=\"linkexpre\">"+
						"<i id=\""+data[i].dag_id+"_stop\" class=\"_stop fa fa-stop-circle\"  style=\"font-size:26px;display:none;color:#bebebe\" data-toggle=\"tooltip\" title=\"终止流程\"></i>"
						+"</div>"
						+
						"<div class=\"linkexpre\" style=\"margin-top:2px;\">"+
					    "<i id=\""+data[i].dag_id+"_running\" class=\"_running fa fa-telegram\"  style=\"font-size:23px;color:#0066FF\" data-toggle=\"tooltip\" title=\"查看当前运行状态\"></i>"
						+"</div>"
						+"<div class=\"linkexpre\">"+
						"<i id=\""+data[i].dag_id+"_history\" class=\"_history fa fa-clock-o\" style=\"font-size:26px;color:#D4237A\" data-toggle=\"tooltip\" title=\"查看历史\"></i>"
						+"</div>"
						+
						"<div class=\"linkexpre\" style=\"margin-top:2px;\" data-toggle=\"modal\" data-target=\"#edit_dag\">"+
					    "<i id=\""+data[i].dag_id+"_edit\" class=\"_edit fa fa-pencil\"  style=\"font-size:23px;display:none;color:#D4237A\" data-toggle=\"tooltip\"title=\"编辑流程\" ></i>"
						+"</div>"
		         }else if (data[i].last_run_status == 'running')  //如果是运行中
		         {
		        	 if(data[i].is_paused == 0){  // 0 代表开着的,没有暂停
		        		html += "<div style=\"margin-left:18%;\">" +                                  //这里加上样式按钮
				         	"<div class=\"linkexpre\">"+
							"<i id=\""+data[i].dag_id+"_play\" class=\"_play fa fa-pause-circle\" style=\"font-size:26px;color:#0066FF\" data-toggle=\"tooltip\" title=\"暂停流程\"></i>"
							+"</div></div>"
		        	  }else if (data[i].is_paused == 1) //1 代表着暂停中
		        	  {
		        		  html += "<div style=\"margin-left:18%;\">" +                                  //这里加上样式按钮
				         	"<div class=\"linkexpre\">"+
							"<i id=\""+data[i].dag_id+"_play\" class=\"_play fa fa-play-circle\" style=\"font-size:26px;color:#0066FF\" data-toggle=\"tooltip\" title=\"继续流程\"></i>"
							+"</div></div>" 
		        	  }
		        	 	html +=    
						"<div class=\"linkexpre\">"+
						"<i id=\""+data[i].dag_id+"_stop\" class=\"_stop fa fa-stop-circle\" style=\"font-size:26px;display:none;color:red\" data-toggle=\"tooltip\" title=\"终止流程\"></i>"
						+"</div>"
						+
						"<div class=\"linkexpre\" style=\"margin-top:2px;\">"+
					    "<i id=\""+data[i].dag_id+"_running\" class=\"_running fa fa-telegram\" style=\"font-size:23px;color:#0066FF\" data-toggle=\"tooltip\" title=\"查看当前运行状态\"></i>"
						+"</div>"
						+"<div class=\"linkexpre\">"+
						"<i id=\""+data[i].dag_id+"_history\" class=\"_history fa fa-clock-o\" style=\"font-size:26px;color:#D4237A\" data-toggle=\"tooltip\" title=\"查看历史\"></i>"
						+"</div>"
						+
						"<div class=\"linkexpre\" style=\"margin-top:2px;\" data-toggle=\"modal\" data-target=\"#edit_dag\">"+
					    "<i id=\""+data[i].dag_id+"_edit\" class=\"_edit fa fa-pencil\"  style=\"font-size:23px;display:none;color:#D4237A\" data-toggle=\"tooltip\" title=\"编辑流程\"></i>"
						+"</div>"
		         }
		         html += "</td></tr>";
		         $(".searchable").html(html)
				}		
			}
		}
 	})
}

	$(document).ready(function(){ 
		update_summary_table_state();//页面初始化的时候更新一次
	}); 
  
	setInterval('update_summary_table_state()',2000); 

	$(document).click(function(e) { // 在页面任意位置点击而触发此事件
		var id =  $(e.target).attr("id"); // e.target表示被点击的目标
	})
	
	//历史记录的跳转
	$(document).on('click',"._history",function(){
		var dag_id = $(this).parents("tr").find("#dag_id").text();
		var execution_date = $(this).parents("tr").find("#execution_date").text();
		if ( execution_date == '' || execution_date == null || execution_date=='undefined')
		{
			execution_date  = '1969-12-12T12:12:12';
		}
		window.open("dailyHistoryPage.do?dag_id="+ dag_id +"&execution_date="+execution_date.replace(" ","T"));
	})
	
	//当前运行情况的跳转
	$(document).on('click',"._running",function(){
		var dag_id = $(this).parents("tr").find("#dag_id").text()
		var execution_date = $(this).parents("tr").find("#execution_date").text()
		if ( execution_date == '' || execution_date == null || execution_date=='undefined')
		{
			execution_date  = '1969-12-12T12:12:12';
		}
		window.open("dailyRunningPage.do?dag_id="+dag_id+"&execution_date="+execution_date.replace(" ","T"));
	})
	
	//停止一个流
	$(document).on('click',"._stop",function(){
		var current_dag_id = $(this).parents("tr").find("#dag_id").text(); //获取发起的dag_id
		var current_dag_alias = $(this).parents("tr").find("#dag_alias").text(); //获取发起的dag_id中文名
		var current_execution_date = $(this).parents("tr").find("#execution_date").text();//获取执行时间
		swal({
            title: "",
            text: "请再次确认是否立即停止"+current_dag_alias+"流程？",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "是",
            cancelButtonText: "否", 
            confirmButtonColor:"#ec6c62"
        }, function(isConfirm){
        	if(isConfirm)
        	{
        		 $.ajax({
     				url :  'postStopAirflow.do',
     				type : 'post',
     				data:{"dag_id":current_dag_id,"execution_date":current_execution_date},
     				dataType : 'json',
     				success : function(result) {    					
     				},
     				error : function(errmsg) {
     				}
     			})
        	}
        });
	})
	
    //启动和暂停按钮的处理
	$(document).on('click',"._play",function(){
		
		var current_dag_id = $(this).parents("tr").find("#dag_id").text(); //获取发起的dag_id
		var current_dag_alias = $(this).parents("tr").find("#dag_alias").text(); //获取发起的dag_id中文名
		var current_dag_state = $(this).parents("tr").find("#dag_state").text();//获取当前流程的状态便于发起流程
		var is_pause = $(this).hasClass("fa-pause-circle");  //是否有暂停元素
		var is_start = $(this).hasClass("fa-play-circle");  //是否有开始元素
		var Message = "";
		var url = "";   //发给哪个地址
		var isshowBtn=0; //确定在ajax回调成功后修改ICON
		
		console.info(current_dag_id +'---' + is_pause +'--'+is_start + current_dag_state)
		
		if(is_pause == true && current_dag_state == 'running' ){  //如果是暂停按钮亮着，说明在跑，按了以后要变开始就是暂停状态
			Message="请再次确认是否立即暂停"+current_dag_alias+"流程？";
			isshowBtn = 1;
			url="postPauseAirflow.do";
		}else if (is_start == true && current_dag_state == 'running' ) //按了继续，但是dag是运行态
		{
			Message="请再次确认是否立即恢复"+current_dag_alias+"流程？";
			isshowBtn=2;
			url="postResumeAirflow.do";
		}
		else if(is_start == true && (current_dag_state == 'failed' ||  current_dag_state == '' || current_dag_state == 'success'  ) ){ //发起新任务
			Message="请再次确认是否立即启动"+current_dag_alias+"流程？"; 
			isshowBtn=3;
			url = "postRunAirflow.do";
		} 
		/* if(url != "postRunAirflow.do"){
		} */
		/* else{ */
		swal({
	            title: "",
	            text: Message,
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
	        				url :  url,
	        				type : 'post',
	        				data:{"dag_id":current_dag_id,"flag":1},
	        				dataType : 'json',
	        				success : function(result) {
	        					  if(result != 'undefined' || result != null){
	        					  		$("#"+current_dag_id+"_stop").css("color","red");
	        					  		$("#"+current_dag_id+"_running").attr("style","font-size:23px;color:#0066FF");
	        					  }
	        					  else{
		        						alert("发生IO异常");
		        					}
	        					  if (isshowBtn == 1)
	        					  {
	        						  $("#"+current_dag_id+"_play").removeClass("fa-pause-circle").addClass("fa-play-circle");
	        					  }else if ( isshowBtn == 2 )
	        					  {
	        						  $("#"+current_dag_id+"_play").removeClass("fa-play-circle").addClass("fa-pause-circle");
	        					  }else if ( isshowBtn == 3 )
	        					  {
	        						  if(result.status == 3)
	        						  {
	        							  alert(result.msg)
	        						  }
	        						  $("#"+current_dag_id+"_play").removeClass("fa-play-circle").addClass("fa-pause-circle");
	        					  }
	        				},
	        				error : function(errmsg) {
	        				}
	        			})
	        	  } 
	        });
		/* } */
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