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
<!-- <link type="text/css" title="www" rel="stylesheet" href="/css/easyui.css" />
<link type="text/css" title="www" rel="stylesheet" href="/css/icon.css" />
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script> --> 
<title>自动化运维平台</title> 
<style type="text/css">
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:no;
} 
</style>
<script>
	/******************* 编辑 *******************/ 
	var url;
	function editTel(){
	    var row = $('#total_table').datagrid('getSelected');//选中一行否
	    if (row == null )
	    {
	       $.messager.alert('提示','您只能选择一行编辑!','error');
	        return;
	    }           
		$('#edit_dialog').dialog('open').dialog('setTitle','编辑员工号');
		$('#edit_form').form('clear');
	    
	    $('#edit_form').form('load',row);
		url = 'save_user.php';
	}
	
	function edit_save(){
		$('#edit_form').form('submit',{
			url: 'updatedailysms.do',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
				alert(result)
				if (result ){
					$('#edit_form').datagrid('reload');
					$('#edit_dialog').dialog('close');		// close the dialog
					//$('#dg').datagrid('reload');	// reload the user data
				} else {
					$.messager.show({
						title: 'Error',
						msg: result.sum
					});
				}
			}
		});
	}
	
	function removeTel(){
		var row = $('#total_table').datagrid('getSelected');
		if (row){
			$.messager.confirm('Confirm','Are you sure you want to remove this user?',function(r){
				if (r){
					$.post('remove_user.php',{id:row.id},function(result){
						if (result.success){
							$('#total_table').datagrid('reload');	// reload the user data
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
	
	/******************* 添加 *******************/  
	function addTel(){  
		$('#add_dialog').dialog('open').dialog('setTitle','添加员工号'); 
		$('#add_form').find('#task_id').combobox('reload','/getAllTaskID.do');
		url = '';
	}
	
	function add_save()
	{
		$('#add_form').form('submit',{
			url: 'adddailysms.do',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
				
				if (result.success){
					$('#add_dialog').dialog('close');		// close the dialog
					$('#total_table').datagrid('reload');	    // reload the user data
				} else {
					$.messager.show({
						title: 'Error',
						msg: result.msg
					});
				}
			}
		});
	}
	
	/******************* 删除 *******************/  
	function delTel(){
		var row = $('#total_table').datagrid('getSelected');//选中一行否
		if (row == null )
		{
			$.messager.alert('提示','请选择一行删除!','error'); 
			return ;
		}
		else{
			$('#del_dialog').dialog('open');
		}
		url = '';
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
			<table id="total_table" title="日终任务更改手机号" class="easyui-datagrid" style="width:100%;height:100%"
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
		            <tr>
		            	<td><input type="checkbox"></td>
		            	<td>501</td>
		            	<td>0889</td>
		            	<td>18251899178</td>
		            </tr>
		        </tbody>
			</table>
			
			<div id="toolbar">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addTel()">添加</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editTel()">修改</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delTel()">删除</a>
			</div>
			
			<!------------------------------- 添加框 ------------------------------->
			<div id="add_dialog" class="easyui-dialog" style="width:400px;height:240px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
				<form id="add_form" method="post" novalidate>
					<div class="fitem">
						<label>任务ID:</label>
						<input id="task_id" name="task_id" style="width:100%" class="easyui-combobox" data-options="valueField: 'task_id',textField: 'task_id'">
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
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="add_save()">保存</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-no" onclick="javascript:$('#add_dialog').dialog('close')">取消</a>
			</div>
			
			
			<!------------------------------- 修改框 ------------------------------->
			<div id="edit_dialog" class="easyui-dialog" style="width:400px;height:240px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
				<form id="edit_form" method="post" novalidate>
					<div class="fitem">
						<label>任务ID:</label>
						<input name="task_id" style="width:100%" class="easyui-validatebox" required="true" readonly>
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
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="edit_save()">保存</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-no" onclick="javascript:$('#edit_dialog').dialog('close')">取消</a>
			</div>
			
			
			<!------------------------------- 删除框 ------------------------------->
			<div id="del_dialog" class="easyui-dialog" title="删除员工号" style="width:400px;height:200px;padding:10px"
				data-options="
					closed: true,
					buttons: [
					{
						text:'确认',
						iconCls:'icon-ok',
						handler:function(){
							//alert('ok');
							$.ajax({
							})
						}
					},
					{
						text:'取消',
						iconCls:'icon-no',
						handler:function(){
							$('#del_dialog').dialog('close');
						}
					}]
				">
			请确认是否立即删除所选行？
		</div>
			
		</div>
	</div>
</body>

</html>