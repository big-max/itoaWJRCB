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
</style>

<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
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
			//获取状态的值，Error或者Active
			var status = $(s).parents("tr").find("b").text().trim();
			if(status == "Error")
			{
				sweet("被选择的目标系统中包含状态为Error的主机，建议查看原因（注：AIX系统添加后状态同步需要时间稍长）","warning","确定"); 
				$(s).prop("checked", false);
				return;
			}
			infoId.push(s.value);
			ips.push($(s).parents('td').next().next().text());
		} else {
			var index = 0;
			for (var i = 0; i < infoId.length; i++) {
				if (s.value == infoId[i]) {
					index = i;
				}
			}
			infoId.splice(index, 1);
			ips.splice(index,1);
		}
		console.log(infoId);
		console.log(ips);
	}

	function judge(arr)
	{
	    for(var i = 1 ; i < arr.length;i++)
		{
		     if (arr[i].toLowerCase() == arr[i-1].toLowerCase())
			    continue;
			 else return false;
		}			
		return true;
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
	function checkServer()
	{
		if(infoId.length != 1 )
		{
			sweet("请选择一台主机!","warning","确定");
		}
		else
		{
			swal({
				title: "", 
				text: "检测中...",
				type: "warning",
				timer: 1000,
				showConfirmButton: false
			}, function() {
				$.ajax({
					url : "<%=path%>/checkServerStatus.do",
					data : { selectedServers : transData(ips)},
					type : 'post',
					dataType : 'json',
					timeout : 10000, //超时时间设置，单位毫秒
				}).done(function(retdata) {
					if(retdata['status']==1)
					{
						var  out=[];
					  	for( key in retdata['msg'])
					  	{
					  		if(retdata['msg'][key] != 1)
					  		{
					  			out.push(key);
					  		}
					  	}
					  	var finalStringOut;
					  	var type;
					  	if (out.length == 0){
					  		finalStringOut="检查完成";
					  		type="success";
					  	}else{
					  		finalStringOut="检查完成,该主机网络不可达";
					  		type="error";
					  	}
					  	swal({title: "",text:finalStringOut ,  type: type,confirmButtonText: "返回",confirmButtonColor: "rgb(174,222,244)"},
								function(isConfirm)
								{
									  if (isConfirm) 
									  {
										  //window.location.href = "getAllServers.do";
										  window.location.href = "getIBMAllInstance.do?ptype=db2";
									  } 
								})
					}
				});
			})	
		}
	}
	function checkDB2Select() {
		var infoId = [];
		var osId=[];
		$("input[name='servers']").each(function() {
			if ($(this).attr("checked")) 
			{
				infoId.push($(this).val());
				osId.push($(this).parent().parent().parent().parent().parent().next().next().next().next().text());
			}
		});
		 if (infoId.length != 1 ) 
		 {
			sweet("请选择一条实例 !","warning","确定");
			return;
		 }
		 else {
			 swal({ 
				  title: "安装前是否满足如下条件？", 
				  text: "<p style='text-align:left;margin:0 120px;'>AIX需预安装unzip;</br> </p>" + 
					"<p style='text-align:left;margin:0 120px;'>/tmp目录保证5G剩余空间;</br></p>"+
					   "<p style='text-align:left;margin:0 120px;'>/opt目录保证5G剩余空间;</br></p>"+
					"<p style='text-align:left;margin:0 120px;'>AIX OpenSSL版本1.0.1.513</p>",
				  type: "",
				  showCancelButton: true, 
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "继续", 
				  closeOnConfirm: false,
				  html: true,
				  cancelButtonText:"取消"
				},
				function(){
					var  arr  = [];
					if(osId[0].toLowerCase().indexOf('aix')==0)
					{
						location.href = "getInstanceDetial.do?serId=" + infoId + "&ptype=db2&platform=aix";
					}
					else if(osId[0].toLowerCase().indexOf('windows')==0)
					{
						sweet("DB2暂时不支持windows操作系统 !","warning","确定");
						return;
					}
					else
						location.href = "getInstanceDetial.do?serId=" + infoId + "&ptype=db2&platform=linux";
				});
			
		}
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
			<a href="getAllServers.do" class="current" style="position:relative;top:-3px;"><i class="icon-home"></i>实例一览</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM DB2</a>
		</div>
		<div class="container-fluid">
			<div class="widget-title">
				<a data-toggle="collapse" href="#collapseOne">
					<span class="icon"> <i class="icon-arrow-right"></i>
					</span>
					<h5>说明：所有DB2实例信息.</h5>
				</a>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="widget-box nostyle">
							<div class="col-sm-6 form-inline">
								<!-- <button onclick="checkServer();" id="check_button" class="btn btn-sm"
									style="background-color: #448FC8;">
									<font color="white">检查主机状态</font>
								</button> -->
							</div>
							<div style="margin-bottom: 5px"></div>
							<table id="mytable" name="data-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th style="text-align: center;">选择</th>
										<th style="text-align: center;">主机名</th>
										<th style="text-align: center;">IP地址</th>
										<th style="text-align: center;">主机配置</th>
										<th style="text-align: center;">操作系统</th>
										<th style="text-align: center;">所属产品组</th>
										<th style="text-align: center;">健康状态</th>
									</tr>
								</thead>
								<tbody class="searchable">
									<c:forEach items="${servers }" var="ser">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="servers"
													value="${ser.uuid }" onclick="isSelect(this);" /></td>
											<td style="text-align: center;">${ser.name }</td>
											<td style="text-align: center;">${ser.ip }</td>
											<td style="text-align: center;">${ser.hconf}</td>
											<td style="text-align: center;">${ser.os}</td>
											<td style="text-align: center;">${fn:replace(ser.product,' ','&nbsp;&nbsp;')} </td>
											<td style="text-align: center;" name="state">
												<c:if test="${ser.status eq 'Active' }">
													&nbsp;&nbsp;<img src="img/icon_success.png"></img>
													<b>${ser.status}</b>
												</c:if> 
												<c:if test="${ser.status eq 'Error' }">
													<img src="img/icon_error.png"></img>
													<b>${ser.status}</b>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div style="margin-bottom: 55px"></div>

					<div class="columnfoot" style="width: 93%; left: 5%;">
						<a class="btn btn-info fr btn-next" onclick="checkDB2Select();">
							<span>下一页</span> <i class="icon-btn-next"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
	    $('#mytable').DataTable({
	    	"oLanguage":{
	    		"sLengthMenu": "每页显示 _MENU_ 条记录",
	    		"sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_条记录",
	    		"sInfoFiltered": "(数据表中共有 _MAX_ 条记录)", 
	    		"sSearch": "搜索",
	    		"oPaginate": {
	    			"sFirst": "第一页",
	    			"sPrevious":" 上一页 ",
	    			"sNext": " 下一页 ",
	    			"sLast": " 最后一页 "
	    		 },
	    	}
	    });
	});
</script>
</html>