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
<jsp:include page="../header_easyui.jsp" flush="true" />
<link type="text/css" title="www" rel="stylesheet" href="/css/easyui.css" />
<link type="text/css" title="www" rel="stylesheet" href="/css/icon.css" />
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
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
</style>
<script>
	var url;
	function editTel(){
	    var row = $('#dg').datagrid('getSelected');//选中一行否
	    if (row == null )
	    {
	       $.messager.alert('提示','您只能选择一行编辑!','error');
	        return;
	    }           
		$('#dlg').dialog('open').dialog('setTitle','编辑员工号');
		$('#fm').form('clear');
	    
	    $('#fm').form('load',row);
		url = 'save_user.php';
	}

	function saveTel(){
		$('#fm').form('submit',{
			url: 'updatedailysms.do',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					$('#dlg').dialog('close');		// close the dialog
					$('#dg').datagrid('reload');	// reload the user data
				} else {
					$.messager.show({
						title: 'Error',
						msg: result.msg
					});
				}
			}
		});
	}
	
	function removeTel(){
		var row = $('#dg').datagrid('getSelected');
		if (row){
			$.messager.confirm('Confirm','Are you sure you want to remove this user?',function(r){
				if (r){
					$.post('remove_user.php',{id:row.id},function(result){
						if (result.success){
							$('#dg').datagrid('reload');	// reload the user data
						} else {
							$.messager.show({	// show error message
								title: 'Error',
								msg: result.msg
							});
						}
					},'json');
				}
			});
		}
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
		<div style="width:100%;height:85vh;">
			<table id="dg" title="日终任务更改手机号" class="easyui-datagrid" style="width:100%;height:100%"
					url="getdailysms.do" fit="true" toolbar="#toolbar" pagination="true"
					rownumbers="true" fitColumns="true" singleSelect="true">
				<thead>
					<tr>
						<th field="id" width="10%">编号</th>
						<th field="task_id" width="20%">任务ID</th>
						<th field="name" width="20%">工号</th>
						<th field="tel" width="50%">电话</th>
					</tr>
				</thead>
		        <tbody>
		            
		        </tbody>
			</table>
			
			<div id="toolbar">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="editTel()">修改</a>
			</div>
			
			<div id="dlg" class="easyui-dialog" style="width:400px;height:240px;padding:10px 20px"
				closed="true" buttons="#dlg-buttons">
				<form id="fm" method="post" novalidate>
					<div class="fitem">
						<label>任务ID:</label>
						<input name="task_id" style="width:100%" class="easyui-validatebox" required="true">
					</div>
					<div style="margin-top:20px;"></div>
					<div>
						<select class="easyui-combobox" name="name" multiple="true" multiline="true" label="选择工号:" labelPosition="top" style="width:100%;height:50px;">
						    <option value="14761176422">0000</option>
							<option value="13064792652">0889</option>
							<option value="13064792712">0990</option> 
						</select>
					</div>
				</form>
			</div>
			<div id="dlg-buttons">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveTel()">Save</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
		$(".tooltipa1").removeClass("tooltip-f");
</script>

</html>