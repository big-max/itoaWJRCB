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
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="../header_easyui2.jsp" flush="true" />
<title>自动化运维平台</title>
<style type="text/css">
body{
	overflow:hidden;
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
.newmain{width:40%;height:30px;float:left;}
.newmain1{width:30%;height:30px;line-height:30px;text-align:right;float:left;}
.newmain2{width:65%;height:30px;line-height:28px;float:right;}
</style>
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
			<a href="getAllServers.do" class="current1" style="position:relative;top:-3px;"><i class="icon-home"></i>IBM TSM</a> 
			<a class="current" style="position:relative;top:-3px;">选择目标环境</a>
		</div>
		
		<div class="container-fluid">
			<div class="widget-title">
				<a data-toggle="collapse" href="#collapseOne">
					<span class="icon"> <i class="icon-arrow-right"></i></span>
					<h5>步骤2：自动化备份恢复 -> 选择目标环境</h5>
				</a>
			</div>
		</div>
		
		<div class="container-fluid" style="margin-top:10px;">
			<div id="" class="easyui-panel" title="" style="width:100%;height:125px;padding:5px;">
				<div>
					<div class="newmain">
						<div class="newmain1">IP地址</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="target_ip" name="target_ip" style="width:100%;"> 
						</div>
					</div>
					<div class="newmain"></div>
				</div>
				<div>
					<div class="newmain" style="margin-top:10px;">
						<div class="newmain1">数据路径</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="data_path" name="data_path" style="width:100%;"> 
						</div>
					</div>
					<div class="newmain" style="margin-top:10px;">
						<div class="newmain1">实例名</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="inst_name" name="inst_name" style="width:100%;"> 
						</div>
					</div>
				</div>
				<div>
					<div class="newmain" style="margin-top:10px;">
						<div class="newmain1">前滚日志路径</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="log_path" name="log_path" style="width:100%;"> 
						</div>
					</div>
					<div class="newmain" style="margin-top:10px;">
						<div class="newmain1">数据库名</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="dbase_name" name="dbase_name" style="width:100%;"> 
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid" style="margin-top:10px;">
			<table class="easyui-datagrid" id="targetEnv_table" style="width:100%;height:100px;">
				<thead>
	                <tr>
	                    <th data-options="field:'bakser_type',width:'25%'">表空间名</th>
	                    <th data-options="field:'bakser_ip',width:'25%'">表空间类型</th>
	                    <th data-options="field:'bakser_version',width:'26.5%',editor:'text'">容器路径</th>
	                    <th data-options="field:'bakser_synctime',width:'25%',editor:'text'">容器大小</th>
	                </tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td><td>1</td><td>1</td><td>1</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--content end-->
	
	<!--footer start-->
	<div class="columnfoot" style="width: 93%; left: 5%;">
		<a class="btn btn-info fr btn-down" onclick="Next();">
			<span>下一步</span> <i class="icon-btn-next"></i>
		</a>
	</div>
	<!--footer start-->
</body>

<script>
	//下一步
	function Next()
	{
		window.location.href = "toTargetEnv.do";
	}
</script>

<script type="text/javascript">
	//让表格的后2列可编辑 
	$.extend($.fn.datagrid.methods, {
		editCell: function(jq,param){
			return jq.each(function(){
				var opts = $(this).datagrid('options');
				var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
				for(var i=0; i<fields.length; i++){
					var col = $(this).datagrid('getColumnOption', fields[i]);
					col.editor1 = col.editor;
					if (fields[i] != param.field){
						col.editor = null;
					}
				}
				$(this).datagrid('beginEdit', param.index);
                   var ed = $(this).datagrid('getEditor', param);
                   if (ed){
                       if ($(ed.target).hasClass('textbox-f')){
                           $(ed.target).textbox('textbox').focus();
                       } else {
                           $(ed.target).focus();
                       }
                   }
				for(var i=0; i<fields.length; i++){
					var col = $(this).datagrid('getColumnOption', fields[i]);
					col.editor = col.editor1;
				}
			});
		},
           enableCellEditing: function(jq){
               return jq.each(function(){
                   var dg = $(this);
                   var opts = dg.datagrid('options');
                   opts.oldOnClickCell = opts.onClickCell;
                   opts.onClickCell = function(index, field){
                       if (opts.editIndex != undefined){
                           if (dg.datagrid('validateRow', opts.editIndex)){
                               dg.datagrid('endEdit', opts.editIndex);
                               opts.editIndex = undefined;
                           } else {
                               return;
                           }
                       }
                       dg.datagrid('selectRow', index).datagrid('editCell', {
                           index: index,
                           field: field
                       });
                       opts.editIndex = index;
                       opts.oldOnClickCell.call(this, index, field);
                   }
               });
           }
	});

	$(function(){
		$('#targetEnv_table').datagrid().datagrid('enableCellEditing');
	})
</script>
</html>
