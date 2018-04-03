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
	/* overflow-y:scroll; */
}
.current1,.current1:hover {
    color: #444444;
}
.addSerMain{width:100%;height:40px;margin-bottom:10px;}
.addSerSub1{width:22%;height:40px;line-height:35px;float:left;text-align:right;}
.addSerSub2{width:250px;height:40px;line-height:30px;float:left;}
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
			<a class="current" style="position:relative;top:-3px;">一键恢复</a>
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
							<div class="widget-content">自动化备份恢复一览表.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid" style="height:56vh;">
			<div id="toolbar" style="margin-bottom:5px;margin-top:5px;">
				<button class="easyui-linkbutton" iconCls="icon-edit" onclick="openWin()">备份服务器</button>
			</div>
			
			<table class="easyui-datagrid" id="total_table" title="自动化备份恢复" style="width: 100%;height:95%;">
				<thead>
	                <tr>
	                    <th data-options="field:'total_id',width:'1%',checkbox:true">序号</th>
	                    <th data-options="field:'total_ywtype',width:'19%'">业务类型</th>
	                    <th data-options="field:'total_baktype',width:'20%'">备份类型</th>
	                    <th data-options="field:'total_target',width:'20%'">备份对象</th>
	                    <th data-options="field:'total_version',width:'20%'">数据库版本</th>
	                    <th data-options="field:'total_ip',width:'20%'">IP</th>
	                </tr>
				</thead>
				<tbody>
					<tr>
	                    <th>序号</th>
	                    <th>类型</th>
	                    <th>IP</th>
	                    <th>备份对象</th>
	                    <th>数据库版本</th>
	                </tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--content end-->
	
	<!--footer start-->
	<div class="columnfoot" style="width: 93%; left: 5%;">
		<a class="btn btn-info fr btn-down" onclick="CheckRecover();">
			<span>一键恢复</span> <i class="icon-btn-next"></i>
		</a>
	</div>
	<!--footer start-->
	
	
	
	<!-- 备份服务器弹出框 -->
	<div id="backServer" class="easyui-window" title="管理TSM服务" style="width:70%;height:400px;padding:10px;"
			data-options="closed:true,modal:true,minimizable:false,maximizable:false">
		<div style="margin-bottom:10px;">
			<button class="easyui-linkbutton" iconCls="icon-add" onclick="addServer()">添加服务器</button>
			<button class="easyui-linkbutton" iconCls="icon-cut" onclick="delServer()">删除服务器</button>
		</div>
		<table class="easyui-datagrid" id="bakser_table" style="width: 100%;height:300px;">
			<thead>
                <tr>
                    <th data-options="field:'id',width:'1%',checkbox:true">选择</th>
                    <th data-options="field:'type',width:'15%'">Server类型</th>
                    <th data-options="field:'ip',width:'18%'">IP</th>
                    <th data-options="field:'version',width:'15%'">版本</th>
                    <th data-options="field:'lastSycTime',width:'20%'">上次同步时间</th>
                    <th data-options="field:'lastSycMode',width:'16%'">上次同步方式</th>
                    <th data-options="field:'manageUrl',width:'15%',formatter:formatOper">管理操作</th>
                </tr>
			</thead>
		</table>
	</div>
	
	<!-- 添加服务器弹出框 -->
 	<div id="addServer" class="easyui-window" title="添加服务器" style="width:30%;height:350px;padding:10px;"
			data-options="modal:true,closed:true,minimizable:false,maximizable:false"> 
		<form id="addServer_form" method="post">
			<div class="addSerMain">
				<div class="addSerSub1">Server类型&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_type" style="width:100%" data-options="required:true">
				</div>
			</div>
			<div class="addSerMain">
				<div class="addSerSub1">IP&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_ip" style="width:100%" data-options="required:true">
				</div>
			</div>
			<div class="addSerMain">
				<div class="addSerSub1">版本&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_version" style="width:100%" data-options="required:true">
				</div>
			</div>
			<div class="addSerMain">
				<div class="addSerSub1">用户名&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_user" style="width:100%" data-options="required:true">
				</div>
			</div>
			<div class="addSerMain">
				<div class="addSerSub1">密码&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_passwd" style="width:100%" data-options="required:true">
				</div>
			</div>
		</form>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
		</div>
	</div>
</body>

<script>
	////点击“备份服务器弹出框”的刷新按钮 
	function formatOper(val,row,index){ 
	  return '<a href="#" rel="external nofollow" style="color:#000" onclick="editUser('+index+')">刷新</a>'; 
	}
	function editUser(){
		alert("hhh ");
	};

	//点击“删除服务器”，对应的操作
	function delServer(){
		var checked = $('#bakser_table').datagrid('getChecked');
		var ids = [];
        
        $.each(checked, function(index, item){
            ids.push(item.id);
        });
        
        $.ajax({
        	url: '/delBackupServer.do',
        	type: 'post',
        	data: {
        		'ids': ids
        	},
        	dataType: 'json',
        	success: function(data){
        		if(data.msg=="success"){
        			if(data.notdel!=0){
            			$.messager.alert('提示信息',"删除成功"+data.delRecords+"条，失败"+data.notdel+"条",'error');
            		}else{
            			$.messager.alert('提示信息',"成功删除"+data.delRecords+"条记录",'info');
            		}
        		}else{
        			$.messager.alert("发送参数错误，请重新删除");
        		}
        		
        		$('#bakser_table').datagrid({  
	        	    url: '/showBackupServer.do'  
	        	});
                $('#bakser_table').datagrid("reload");
        	}
        });
	}
	
	//点击“备份服务器”，弹出框 加载数据
	function openWin()
	{
		$('#backServer').window('open');
		//打开备份服务器弹出框的时候，加载数据并显示
		$('#bakser_table').datagrid({  
	        url: '/showBackupServer.do'  
	    });		  
	}
	
	//点击“备份服务器弹出框”的“添加服务器”按钮 
	function addServer()
	{
		$('#addServer').window('open');
	}
	
	//“添加服务器”提交按钮
	function submitForm()
	{
		$('#addServer_form').form('submit', {  
	            url: "<%=path%>/addBackupServer.do",  
	            onSubmit: function () {               //表单提交前的回调函数  
	                var isValid = $(this).form('validate');//验证表单中的一些控件的值是否填写正确，比如某些文本框中的内容必须是数字  
	                if (!isValid) {  
	                }  
	                var strIP = $("input[name='addServer_ip']").val();
	                if(!isIP(strIP)){
	                	 $.messager.alert('提示信息', 'IP格式不对，请检查！', 'warning'); 
	                }
	                return (isValid&&isIP(strIP)); // 如果验证不通过，返回false终止表单提交  
	            },  
	            success: function (data) {    //表单提交成功后的回调函数，里面参数data是我们调用/BasicClass/ModifyClassInfo方法的返回值。
	                var ret_value = eval('(' + data + ')');
	            	if (ret_value.msg == "1") {  
	                    $.messager.show({  
	                        title: '提示消息',  
	                        msg: '添加成功',  
	                        showType: 'show', 
	                        timeout: '500',
	                        style: {  
	                            right: '',  
	                            bottom: ''  
	                        }  
	                    });  
	                    $('#addServer_form').form('clear');    // 重新载入当前页面数据    
	                    $('#addServer').window('close');  //关闭窗口  
	                    $('#bakser_table').datagrid({  
		        	        url: '/showBackupServer.do'  
		        	    });
	                    $('#bakser_table').datagrid("reload");
	                }  
	                else {  
	                    $.messager.alert('提示信息', '提交失败！', 'warning');  
	            	}  
	            }
    	});  
	}
	
	//“一键恢复”按钮
	function CheckRecover()
	{
		window.location.href = "BackRecover.do";
	}
	
	function isIP(strIP) {
		var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g; //匹配IP地址的正则表达式
		if(re.test(strIP))
		{
			if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) {
				return true;
			}
		}
		return false;
	}
</script>
</html>
