<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.fasterxml.jackson.databind.*"%>
<%@ page import="com.fasterxml.jackson.databind.node.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include page="header.jsp" flush="true" />
<title>自动化运维平台</title>
<style type="text/css">
.sweet-alert button.cancel {
	background-color: #ec6c62;
}
.sweet-alert button.cancel:hover {
	background-color: #E56158;
}
.tooltip {
	width: 105px;
	word-wrap: break-word;
}
.comm95 {
	width: 93px;
}
.mr20{
	font-size:13px;
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
	$(document).ready(function(){
		$(".select2-input").css("height","20px"); 
	})
</script>
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
</script>
<script type="text/javascript">
var infoId = [];
var ips=[];
//操作
function isSelect(s) {
	if ($(s).attr("checked")) {
		infoId.push(s.value);
	} else {
		var index = 0;
		for (var i = 0; i < infoId.length; i++) {
			if (s.value == infoId[i]) {
				index = i;
			}
		}
		infoId.splice(index, 1);
	}
	console.log(infoId);
}
function transData(infoId){
	var data="";
	for(var i = 0 ; i < infoId.length;i++)
	{
   	    data+=infoId[i]+',';
	}
	var length=data.lastIndexOf(',')	
	return data.substr(0,length)
}
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
		<jsp:include page="topleft_close.jsp" flush="true" />
	</div>
	<!--header end-->

	<!--content start-->
	<div class="content">
		<div class="breadcrumb">
			<a href="" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>实例一览
			</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 日志抓取</a>
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
							<div class="widget-content">日志抓取概要信息.</div>
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
								<button class="btn btn-sm" data-toggle="modal" data-target="#log"
									style="background-color: #448FC8;">
									<font color="white">日志抓取</font>
								</button>
									<button onclick="deleteLog();" id="delete_button" class="btn btn-sm"
										style="background-color: #448FC8;">
										<font color="white">删除日志</font>
									</button>
							</div>

							<div style="margin-bottom: 10px;"></div>
							<table id="sel_tab"
								class="table table-bordered data-table with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">IP</th>
										<th style="text-align: center;">产品</th>
										<th style="text-align: center;">版本</th>
										<th style="text-align: center;">抓取时间</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>

								<tbody class="searchable">
									<c:forEach items="${jobs }" var="job" varStatus="status">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="servers"
													value="${job._id }" onclick="isSelect(this);" /></td>
										    <td style="text-align: center;">${job.ip }</td>								
											<td style="text-align: center;">${job.product }</td>
											<td style="text-align: center;">${job.version }</td>
											<td style="text-align: center;">${job.task_timestamp }</td>
											<td style="text-align: center;"><a href="${job.url}" style="color:#08c;">${job.operation }</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 模态框：日志抓取 -->
							<div class="modal fade" id="log" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 头部 -->
										<div class="modal-header">
											<h5 class="modal-title" id="myModalLabel">
												<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;日志抓取
											</h5>
										</div>

										<!-- 主体内容 -->
										<form action="addLogCatch" method="post" id="submits_jobs">
											<div class="modal-body">
												<div class="control-group">
													<div class="controls" style="padding-top: 5px;">
														<span class="input140 mr20">IP：</span>
														<select id="ip" multiple="multiple" name="ip" class="w85" style="width: 220px;"
														onchange="showIPInfo(this)">
															<c:forEach items="${totalIPList }" var="ip">
																<option value="${ip }">${ip}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="control-group">
													<div class="controls" style="padding-top: 5px;">
														<span class="input140 mr20">产品：</span>
														<select class="comm95" id="product" name="product" onchange="showParam(this,'version','version')">
															<option value="-" selected="selected">请选择</option>
														</select>
														&nbsp;—&nbsp;
														<select class="comm95" id="version" name="version" onchange="showParam(this,'instance','instance')">
															<option value="-" selected="selected">请选择</option>
														</select>
													</div>
												</div>

												<div class="control-group">
													<div class="controls" style="padding-top: 5px;">
														<span class="input140 mr20">实例：</span>
														<select id="instance" class="w85" style="width: 220px;" name="instance"
															onchange="showParam(this,'database','db')">
															<option value="-" selected="selected">请选择</option>
														</select>
													</div>
												</div>

												<div class="control-group" id="database" style="display:none;">
													<div class="controls" style="padding-top: 5px;">
														<span class="input140 mr20">数据库：</span>
														<select id="db" class="w85" style="width: 220px;" name="db">
															<option value="-" selected="selected">请选择</option>
														</select>
													</div>
												</div>

											</div>
										</form>
									</div>
									<div id="message"></div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
										<button type="button" class="btn" style="background-color: #448FC8;"
											onclick="CheckInput();">
											<font color="white">提交</font>
										</button>
									</div>
								</div>
							</div>
							<!-- 模态框：日志抓取 -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		//模态弹框，关闭按钮功能 
		function closeModal() {
			//window.location.href = ".do";
		}
	</script>
	
	<script>
	function showParam(obj,type,nextObj)
	{
		
		var obj1 = $(obj).val(); //获取下拉框选定的值
		if(obj1 == '-')  //如果选择请选择，相应的后面的都要变成请选择
		{
			 product_left();
			 deleteHTMLElement(nextObj);
			 return;
		}
		if(obj1  ==  'db2' ||  obj1 != 'db2')
		{
			product_left();
		}
		var ip = $("#ip").find("option:selected").text();
		var product=$("#product").find("option:selected").text();
		//ip 和product 决定版本
		var info={ip:ip,product:product,type:type};
		console.log(info);
	//	this,'target','db','targetDB'
		if(product == 'db2' && type== 'database')
		{
				callAjax(info,nextObj);    
		}
		else if(type == 'database' && product != 'db2')
		{
			//如果通过instance 发现不是DB2 并且类型是db 什么都不做
			return;
		}else if(product=='请选择')
		{
			 
		}
		else
			callAjax(info,nextObj);   
	}
	
	
	function product_left()
	{
		var product = $("#product").val().trim();
		if(product == "db2")  
		{
			$("#database").show();
		}
		else
			$("#database").hide();
	}
	
	function callAjax(info,obj) //obj 是哪个组件
	{
		$.ajax({
			url : '<%=path%>/getIPConfigInfo.do',
			type : 'post',
			data:info,
			dataType : 'json',
			traditional:true,
			success:function(result){
				if(result.length != 0)
				{
					$("#"+obj).empty();
					 $("#"+obj).append('<option value="-" selected="selected">请选择</option>');
					var regExp=/^\d{4}(0[1-9]|1[1-2])(0[1-9]|2[0-9]|3[0-1])([0-2][0-9])([0-5][0-9])$/;
					 for(var i = 0 ; i < result.length;i++)  
					{
						if(regExp.test(result[i]))
							{
								$("#"+obj).append('<option value='+result[i]+'>'+convertDatetime(result[i])+'</option>')
							}
						else
							$("#"+obj).append('<option value='+result[i]+'>'+result[i]+'</option>')
					} 
				}
				else{
					//swal("", "没有查询到相关数据", "warning");
					//如果是空的话，要进行select 复位
				}
			},
			failure:function(err)
			{
				
			}
		});
	}
	
	function deleteHTMLElement(nextObj)
	{
		var totalArray;
		totalArray = new Array("product","version","instance","db");
		var k=0;
		//先搜索到这个nextObj
		for ( var i in totalArray)
		{
			if (nextObj != totalArray[i])
				k++;
			else
				break;
		}
		for (k;k<totalArray.length;k++)
		{
			$("#"+totalArray[k]).empty();
			 $("#"+totalArray[k]).append('<option value="-" selected="selected">请选择</option>');
			 $("#"+totalArray[k]).parent().find('a').find('span').text('请选择');
		}	
	}
	
	function showIPInfo(obj)  // 显示目标IP 的产品版本信息
	{
		var json;//返回的信息包括版本、产品名、实例名
		//var ip = ;//获取IP
		var info={type:'all',ip:$(obj).val()};
		var ip = $(obj).val();     //如果ip 不为空才发请求
		if(ip != null)
		{
		$.ajax({
			url : '<%=path%>/getIPConfigInfo.do',
			type : 'post',
			data:info,
			dataType : 'json',
			traditional:true,
			success:function(result){
				if(result.length != 0)
				{
				   // json= jQuery.parseJSON(result['msg']);// str to json
				    //alert(json)
				    $("#product").empty();  //要先清空
				    $("#product").append('<option value="-" selected="selected">请选择</option>');
					for(var i = 0 ; i < result.length;i++)  
					{
						
						$("#product").append('<option value='+result[i]+'>'+result[i]+'</option>')
					}
				}
				else{
					//swal("", "没有查询到相关数据", "warning");
					//如果是空的话，要进行select 复位
					 $("#product").empty();  //要先清空
					//    $("#srcProduct").append('<option value="-" selected="selected">请选择</option>');
				}
			},
			failure:function(err)
			{
				
			}
		});
		}else{ 
			//如果是反选要清空
			 $("#product").empty();  //要先清空
			 $("#version").empty();
			 $("#instance").empty();
			 $("#db").empty();
			
			 $("#product").append('<option value="-" selected="selected">请选择</option>');
			 $("#version").append('<option value="-" selected="selected">请选择</option>');
			 $("#instance").append('<option value="-" selected="selected">请选择</option>');
			 $("#db").append('<option value="-" selected="selected">请选择</option>');
			 $("#product").parent().find('a').find('span').text('请选择');
			 $("#instance").parent().find('a').find('span').text('请选择');
			 $("#db").parent().find('a').find('span').text('请选择');
			 product_left();
		
		}
	}
	</script>
	
	
	<!-- 提交 -->
	<script type="text/javascript">
	
	function CheckInput()
	{
		var confComp_target = $("#ip").val();  //判断为null 表示没选IP
		if ( ( confComp_target == null) )
		{
			swal({
				title : "",
				text : "ip不能为空！",
				type : "warning",
				confirmButtonText : "确定",
			});
			return;
		}
		//如果选择了组的话		
 		$.ajax({
			url : '<%=path%>/addLogCatch.do',
				data : $('#submits_jobs').serialize(),
				type : 'post',
				dataType : 'json',
				success : function(result) {
					if (result.msg == 'success') {
						swal({
							title : "",
							text : "创建成功!",
							type : "success",
							confirmButtonText : "确定",
						},function(isConfirm){
							if (isConfirm) {
								window.location.href = "logCatch.do";
							}
						})
					} else {
						swal({
							title : "",
							text : "创建失败!",
							type : "error",
							showCancelButton : true,
							cancelButtonText : "取消",
						})
					}
				},
				failure : function(err) {
					alert(err)
				}
			}) 
		}
	
	</script>
	
	<script type="text/javascript">
	//删除日志
		function deleteLog()
{
	if (infoId.length>=1)
	{
		swal({
			title:'',text: "是否删除本条日志？", type: "warning",showCancelButton: true,closeOnConfirm: false,confirmButtonText: "是",cancelButtonText: "否",}, function() {
			$.ajax({
				url : "<%=path%>/deleteLog.do",
				data : { job_uuid :transData(infoId),operType:'deleteJob' },
				type : 'post',
				dataType : 'json'
			}).done(function(result) {
				if(result.status==1)
				{
					swal({
						title: "",
						text: "删除成功！", 
						type: "success",
						confirmButtonText: "确定",  
						confirmButtonColor: "rgb(174,222,244)"
					},
					function(isConfirm)
					{
						  if (isConfirm) 
						  {
							  window.location.href = "logCatch.do";
						  } 
					});				
				}
			}).error(function(result) {
				swal({
					title: "",
					text: "删除失败！", 
					type: "error",
					confirmButtonText: "确定",  
					confirmButtonColor: "rgb(174,222,244)"
				});
			});
		})
	}
	else
	{
		sweet("请至少选择一个任务!","warning","确定");
	}
}
	
	
	
	</script>
	
</body>
</html>