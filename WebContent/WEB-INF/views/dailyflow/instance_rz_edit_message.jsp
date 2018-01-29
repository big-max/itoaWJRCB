<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="root" value="${pageContext.request.contextPath}" />
<jsp:include page="../header_easyui.jsp" flush="true" />
<!-- <link type="text/css" title="www" rel="stylesheet" href="/css/easyui.css" />
<link type="text/css" title="www" rel="stylesheet" href="/css/icon.css" />
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script> -->
<title>自动化运维平台</title>
<style type="text/css">
.content {
	position: relative;
	float: right;
	width: calc(100% - 57px);
	margin: 0px;
	height: calc(100vh - 70px);
	overflow-y: no;
}
.checkstyle{
	float:left;width:80px;height:27px;line-height:27px;
}
</style>


<script>

	/******************* 编辑 *******************/ 
	function editTel(){
		$('#add_dialog').dialog('close');//点击编辑的时候，关闭添加窗口 
	    var row = $('#total_table').datagrid('getSelected');//选中一行否
	    if (row == null )
	    {
	       $.messager.alert('提示','您只能选择一行编辑!','error');
	        return;
	    }           
		$('#edit_dialog').dialog('open').dialog('setTitle','编辑员工号');
		$('#edit_form').form('clear');
		$("#edit_form").find("#id").val(row.id);
	    $("#edit_form").find("#task_id").val(row.task_id);
	    $("#edit_form").find("#name").val(row.name);
	    //$("#edit_form").find('#name').combobox('reload','/getLoginInfo.do');
	    //$("#edit_form").find("#name").textbox('setValue',row.name);
	    
	    if (row.status == '' || row.status == null || typeof(row.status) == 'undefined') 
	    {
	    	var status_arr = row.status.split(',');
	    	for(var i = 0 ; i < status_arr.length; i++)
	    	{
	    		$("#edit_form").find("#status").val(status_arr[i])
	    	}
	    }
	    $("#status").val(row.status);
	}
	
	function edit_save(){
		$('#edit_form').form('submit',{
			url: 'updatedailysms.do',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
					$('#edit_dialog').dialog('close');		// close the dialog
					$('#total_table').datagrid('reload');
			}
		});
	}
	
	
	/******************* 添加 *******************/  
	function addTel(){  
		$('#edit_dialog').dialog('close'); 
		$('#add_dialog').dialog('open').dialog('setTitle','添加员工号');
		$('#add_form').form('clear');
		$('#add_form').find('.easyui-combobox').combobox('reload','/getAllTaskID.do');
		$("#add_form").find('#name').combobox('textbox').bind('focus',function(){  
		    $("#add_form").find('#name').combobox('reload','/getLoginInfo.do');
		});
	}
	
	function add_save()
	{
		$('#add_form').form('submit',{
			url: 'adddailysms.do',
			dataType:'json',
			onSubmit: function(){
				
				return $(this).form('validate');
			},
			success: function(result){
				var _result =eval("("+result+")");
				var fail = JSON.stringify(_result.fail);
				if(_result.status == "1"){
						 alert("插入成功:"+_result.sum+"条记录\n"+"插入失败为:"+fail); 
				} 
				$('#add_dialog').dialog('close');		// close the dialog
				$('#total_table').datagrid('reload');	    // reload the user data
			} 
			
		});
	}
	
	/******************* 删除 *******************/  
	function delTel(){
		$('#add_dialog').dialog('close');
		$('#edit_dialog').dialog('close');
		var ids=[];
		var rows = $('#total_table').datagrid('getSelections');
		for(var i = 0 ; i < rows.length;i++)
		{
			ids.push(rows[i].id);
		}
		var rowStr = ids.join(',');
		if (rows){
			$.messager.confirm('Confirm','你确定删除选中的记录吗?',function(r){
				if (r){
					$.post('/deldailysms.do',{ids:rowStr},function(result){
						if (result.status == 1){
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
		<div style="width: 100%; height: 85vh;">
			<table id="total_table" title="日终任务更改手机号" class="easyui-datagrid"
				style="width: 100%; height: 100%" url="getdailysms.do" fit="true" toolbar="#toolbar"
				pagination="true" rownumbers="true" fitColumns="true" >
				<thead>
					<tr>
						<th field="id" checkbox="true">编号</th>
						<th field="task_id" width="21.3%">任务ID</th>
						<th field="name" width="23%">工号</th>
						<th field="tel" width="30%">电话</th>
						<th field="status" width="25%">发送配置</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>

			<div id="toolbar">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addTel()">添加</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editTel()">修改</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delTel()">删除</a>
			</div>

			<!------------------------------- 添加框 ------------------------------->
			<div id="add_dialog" class="easyui-dialog"
				style="width: 400px; height: 300px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
				<form id="add_form" method="post" novalidate>
					<div class="fitem">
						<label>任务ID:</label>
						<input  name="task_id" style="width: 100%" class="easyui-combobox"
							data-options="valueField: 'task_id',textField: 'task_id',editable:false">
					</div>
					<div style="margin-top: 20px;"></div>
					<div>
						<label>工号:</label>
						<input id="name" name="name" style="width: 100%" class="easyui-combobox" multiple="multiple"
							data-options="valueField: 'nametel',textField: 'name',editable:false">
					</div>
					<div style="margin-top: 20px;">
						<label>短信发送类型:</label>
						<div style="float:left;width:20px;">
							<input type="checkbox" name="status" value="1" />
						</div>
						<div class="checkstyle">开始</div>
						
						<div style="float:left;width:20px;">
							<input type="checkbox" name="status" value="2" />
						</div>
						<div class="checkstyle">成功</div>
						
						<div style="float:left;width:20px;">
							<input type="checkbox" name="status" value="3" />
						</div>
						<div class="checkstyle">失败</div>
					</div>
				</form>
				<div style="margin:0 auto;margin-top:45px;width:140px;">
					<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="add_save()">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton" iconCls="icon-no"
						onclick="javascript:$('#add_dialog').dialog('close')">取消</a>
				</div>
			</div>
			


			<!------------------------------- 修改框 ------------------------------->
			<div id="edit_dialog" class="easyui-dialog"
				style="width: 400px; height: 300px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
				<form id="edit_form" method="post" novalidate>
					<div>
						<input id="id" name="id" hidden="true" >
					</div>
					<div class="fitem">
						<label>任务ID:</label>
						<input id="task_id" name="task_id" style="width: 100%" class="easyui-validatebox" readonly="readonly" required="required">
					</div>
					<div style="margin-top: 20px;"></div>
					<div>
						<label>工号:</label>
						<input id="name" name="name" style="width: 100%" class="easyui-validatebox" readonly="readonly">
						<!-- <input id="name" name="name" style="width: 100%" class="easyui-combobox"
							data-options="valueField: 'nametel',textField: 'name'"> -->
					</div>
					<div style="margin-top:20px;">
						<label>短信发送类型:</label>
						<div style="float:left;width:20px;">
							<input type="checkbox" name="status" value="1" />
						</div>
						<div class="checkstyle">开始</div>
						
						<div style="float:left;width:20px;">
							<input type="checkbox" name="status" value="2" />
						</div>
						<div class="checkstyle">成功</div>
						
						<div style="float:left;width:20px;">
							<input type="checkbox" name="status" value="3" />
						</div>
						<div class="checkstyle">失败</div>
					</div>
				</form>
				<div style="margin:0 auto;margin-top:45px;width:140px;">
					<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="edit_save()">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton" iconCls="icon-no"
						onclick="javascript:$('#edit_dialog').dialog('close')">取消</a>
				</div>
			</div>
			

		</div>
	</div>
</body>

</html>