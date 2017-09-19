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
.current1,.current1:hover {
    color: #444444;
}
.mr20,.ftSi{
	font-size:14px;
}
.input140{
	width:180px;
}
.modelcontent{
	padding-top: 5px;width:450px;margin:0 auto;
}
#temp2{
	cursor:pointer;
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
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 安全模板</a>
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
							<div class="widget-content">安全模板概要信息.</div>
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
								<input id="filter" type="text" class="form-control" placeholder="请输入过滤项" style="height:30px;">
								<span style="margin-right: 4px;"></span>
								<button class="btn btn-sm" data-toggle="modal" data-target="#securitymodle" style="background-color: #448FC8;">
									<font color="white">编辑模板</font>
								</button>
								<button class="btn btn-sm" data-toggle="modal" data-target="#editenforce" style="background-color: #448FC8;">
									<font color="white">编辑脚本</font>
								</button>
							</div>

							<div style="margin-bottom: 10px;"></div>
							<table id="sel_tab" class="table table-bordered data-table with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">名称</th>
										<th style="text-align: center;">创建时间</th>
										<th style="text-align: center;">创建人</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>

								<tbody id="tablebody" class="searchable">
									<c:forEach items="${securitytemplate }" var="setmp" varStatus="status">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="servers"
													value="${setmp.uuid }" onclick="isSelect(this);" /></td>
										    <td style="text-align: center;">${setmp.template_name }</td>								
											<td style="text-align: center;">${setmp.create_time }</td>
											<td style="text-align: center;">${setmp.user }</td>
											<td style="text-align: center;"><a href="" onclick="showdetail(this)" style="color:#08c;">详情</a></td>
										</tr>
									</c:forEach> 
								</tbody>
							</table>
							
							
							<!-- 模态框：编辑安全加固模板  -->
							<div class="modal fade" id="securitymodle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 头部 -->
										<div class="modal-header">
											<h5 class="modal-title" id="myModalLabel">
												<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;编辑安全加固模板
											</h5>
										</div>
										<!-- 主体内容 -->
										<form id="modle_submit">
											<div class="modal-body">
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">模块名称：</span>
														<span id="modelname" class="mr20" style="background-color:green;"><font color="white">Template1</font></span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">文件系统检查/opt：</span>
														<span id="fileoscheck" class="mr20"> >=2G</span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">系统用户检查toptea：</span>
														<span class="ftSi">uid=</span><span id="uid" class="mr20">10000</span>&nbsp;&nbsp;&nbsp;&nbsp;
														<span class="ftSi">group=</span><span id="group" class="mr20">bomc</span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20"></span>
														<span class="ftSi">gid=</span><span id="gid" class="mr20">20000</span>&nbsp;&nbsp;&nbsp;&nbsp;
														<span class="ftSi">home=</span><span id="home" class="mr20">/toptea</span> 
													</div>
												</div>
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">是否允许FTP匿名用户登录：</span>
														<span id="ftplogin" class="mr20">off</span>
													</div>
												</div>
												
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">终端超时退出：</span>
														<span id="timeout" class="mr20">180s</span>
													</div>
												</div>
												
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">umask设置：</span>
														<span id="setumask" class="mr20">0027</span>
													</div>
												</div>
												
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">最大打开文件数：</span>
														<span id="maxopenfile" class="mr20">65536</span>
													</div>
												</div>
												
												<div class="control-group" id="choiceAdd">
													<div class="controls modelcontent">
														<span class="input140 mr20">是否添加新属性：</span>
														<div class="inblock mr20">
															<label><input type="radio" value="yes" name="select" onClick="sortRadio1()">是</label>
														</div>
														&nbsp;&nbsp;
														<div class="inblock mr20">
															<label><input type="radio" checked value="no" name="select" onClick="sortRadio2()">否</label>
														</div>
													</div>
												</div>
												
												<div class="control-group" id="newAttr" style="display:none;">
													<div class="controls modelcontent">
														<span class="input140 mr20">
															<input class="form-control" type="text" name="newAttrName" id="newAttrName" value="" style="height:28px;width: 110px;"/>： 
														</span>
													  	<input class="form-control" type="text" name="newAttrVal" id="newAttrVal"
														       value="" style="height:28px;width: 220px;"/> 
													</div>
												</div>
												
											</div>
										</form>
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
										<button type="button" class="btn" style="background-color: #448FC8;" onclick="CheckInputModel();">
											<font color="white">提交</font>
										</button>
									</div>
								</div>
							</div>
							<!-- 模态框：编辑安全加固模板 -->
							
							
							<!-- 模态框：脚本编辑 -->
							<div class="modal fade" id="editenforce" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 头部 -->
										<div class="modal-header">
											<h5 class="modal-title" id="myModalLabel">
												<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;脚本编辑
											</h5>
										</div>
										<!-- 主体内容 -->
										<form id="modle_submit">
											<div class="modal-body" style="margin-top:10px;">
												<textarea style="width:525px;height:250px;">
													
												</textarea>
											</div>
										</form>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
										<button type="button" class="btn" style="background-color: #448FC8;" onclick="CheckInputShell();">
											<font color="white">提交</font>
										</button>
									</div>
								</div>
							</div>
							<!-- 模态框：脚本编辑 -->
							

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	function temp2(){
		$("#securitymodle").modal();
		$("#choiceAdd").hide();
	}
	
	function sortRadio1()
	{
		$("#newAttr").css("display","block");
	}
	function sortRadio2()
	{
		$("#newAttr").css("display","none");
	}
	
	function closeModal()
	{
		$("#newAttrName").val("");
		$("#newAttrVal").val("");
	}
	
	//提交安全模板
	function CheckInputModel() 
	{
		 var param = $("#newAttrName").val();
		 var param_value = $("#newAttrVal").val();
		 var table =document.getElementById("tablebody");
		 var tableCount = table.rows.length;
		 if(param != "" && param_value != "") {  
			 var datas = {"newkey":param,"newvalue":param_value,"key":tableCount};
			 $.ajax({
				 	url:'<%=path%>/addItem.do',
					type:'post',
					dataType : 'json',
					data:datas,
					success:function(data){
						swal({
							title : "",
							text : "确认是否提交模板？", 
							type : "warning",
							showCancelButton : true,
							closeOnConfirm : false,
							closeOnCancel : false,
							confirmButtonText : "是",
							cancelButtonText : "否", 
							confirmButtonColor : "#ec6c62"
						}, function(isConfirm) {
							if (isConfirm) {
								window.location.href = "getAllsecurityTemplate.do";
							} else {
								window.history.go(0);
							}
						}); 
					}
			 })
		  }  
		 else {
			 var datas = {"newkey":"null","newvalue":"null","key":tableCount};
			 $.ajax({
				 	url:'<%=path%>/addItem.do',
					type:'post',
					dataType : 'json',
					data:datas,
					success:function(data){
						swal({
							title : "",
							text : "确认是否提交模板？", 
							type : "warning",
							showCancelButton : true,
							closeOnConfirm : false,
							closeOnCancel : false,
							confirmButtonText : "是",
							cancelButtonText : "否", 
							confirmButtonColor : "#ec6c62"
						}, function(isConfirm) {
							if (isConfirm) {
								window.location.href = "getAllsecurityTemplate.do";
							} else {
								window.history.go(0);
							}
						}); 
					}
			 })
	     } 
	}
	
	//点击详情显示模板内容
	function showdetail(obj)
	{
		$.ajax({
			url:'<%=path%>/getAllsecurityTemplate.do', 
			type:'post',
			success:function(on){
				alert(on);
			}
		})
	}
</script>

</html>