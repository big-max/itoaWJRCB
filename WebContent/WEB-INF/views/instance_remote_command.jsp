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
<link href="css/tab.css" rel="stylesheet" type="text/css" />
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
.black_overlay{
    display: none;
    position: absolute;
    top: 0%;
    left: 0%;
    width: 100%;
    height: 100%;
    background-color: black;
    z-index:1001;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);
}
.white_content {
    display: none;
    position: absolute;
    top: 5%;
    left: 10%;
    width: 80%;
    height: 90%;
    border: 2px solid lightblue;
    background-color: white;
    z-index:1002;
    overflow: auto;
    margin:0 auto;
}
.hand{
    cursor:pointer;
}
.rmline:hover{
    text-decoration:none;
}
.content_flag{
	height:60px;
	margin:0 auto;
	background-color: rgb(248,251,253);
	border: 1px solid #cee3f0;
}
.flag{
	height:25px;
	width:25px;
	vertical-align:middle;
	text-align: center;
	border:1px solid #7BBBE5;
	border-radius:5px;
	float:left;
}
#Down{
	cursor:pointer;
}
</style>

<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
	
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
	
	$(document).ready(function() {
        (function($) {
            $('#step1filter').keyup(function() {
                var rex = new RegExp($(this).val(), 'i');
                $('.step1Searchable tr').hide();
                $('.step1Searchable tr').filter(function() {
                    return rex.test($(this).text());
                }).show();
            })
        }(jQuery));
    });
	
	/*步骤1处linux,aix,mq,was,db2标签，点击显示对应的条目*/
    $(document).ready(function(){
        $("#showlin").click(function(){
       		var rex = new RegExp(/redhat|suse|ubuntu|centos|linux|fedora/, 'i');
               $('.step1Searchable tr').hide();
               $('.step1Searchable tr').filter(function() {
                   return rex.test($(this).text());
               }).show();
        })
    });

    $(document).ready(function(){
        $("#showaix").click(function(){
       		var rex = new RegExp("aix", 'i');
               $('.step1Searchable tr').hide();
               $('.step1Searchable tr').filter(function() {
                   return rex.test($(this).text());
               }).show();
        })
    });

    $(document).ready(function(){
        $("#showmq").click(function(){
       		var rex = new RegExp("mq", 'i');
               $('.step1Searchable tr').hide();
               $('.step1Searchable tr').filter(function() {
                   return rex.test($(this).text());
               }).show();
        })
    });

    $(document).ready(function(){
        $("#showwas").click(function(){
       		var rex = new RegExp("was", 'i');
               $('.step1Searchable tr').hide();
               $('.step1Searchable tr').filter(function() {
                   return rex.test($(this).text());
               }).show();
        })
    });

    $(document).ready(function(){
        $("#showdb2").click(function(){
       		var rex = new RegExp("db2", 'i');
               $('.step1Searchable tr').hide();
               $('.step1Searchable tr').filter(function() {
                   return rex.test($(this).text());
               }).show();    
        })
    });
</script>

<script  type="text/javascript">
	var infoId = [];
	var ips=[];
	function isSelect(s){
		if ($(s).attr("checked")) {
			infoId.push(s.value);
			ips.push($(s).parents('td').next().next().text());
		}
		else {
			var index = 0;
			for (var i = 0; i < infoId.length; i++) {
				if (s.value == infoId[i]) {
					index = i;
				}
			}
			infoId.splice(index, 1);
			ips.splice(index,1);
		}
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
		var length=data.lastIndexOf(',');	
		return data.substr(0,length);
	}
	function StepOneNext()
	{
		if(infoId.length < 1 )
		{
			sweet("请至少选择一台主机","warning","确定"); 
		}
		else
		{
			$("#step1").hide();
		    $("#step2").show();
		}   
		
		$.ajax({
			url:'<%=path%>/toRemoteCommandNextPage.do',
			type:'post',
			dataType : 'json',
			data:{step:'selectMachine',iplist:transData(ips)},
			success:function(retVal)
			{
			}
		})	
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
		<div style="margin-bottom:10px;"></div>
		
		<div class="content_flag" style="width:97.5%;">
		    <div style="width:33%;display: inline-block;padding-top: 17px;">
		    	<div style="width:40%;margin:0 auto;">
		        	<div class="flag"><font color="#7BBBE5">1</font></div>
		        	&nbsp;&nbsp;<font color="#7BBBE5">选择目标系统</font>
		        </div>
		    </div>
		    <div style="width:33%;display: inline-block;padding-top: 13px;">
		        <div style="width:40%;margin:0 auto;">
		        	<div class="flag"><font color="#7BBBE5">2</font></div>
		        	&nbsp;&nbsp;<font color="#7BBBE5">输入执行命令</font>
		        </div>
		    </div>
		    <div style="width:33%;display: inline-block;padding-top: 13px;">
		        <div style="width:40%;margin:0 auto;">
		        	<div class="flag"><font color="#7BBBE5">3</font></div>
		        	&nbsp;&nbsp;<font color="#7BBBE5">远程执行命令</font>
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
								<span style="margin-right: 5px;">&nbsp;&nbsp;&nbsp;</span>
								<button onclick="ShowDiv('step1','fade')" class="btn" style="background-color: #448FC8;">
									<font color="white">批量执行命令</font>
								</button>
								<button onclick="UnsafeCommand()" class="btn btn-sm" data-toggle="modal" data-target="#commandmanaged" style="background-color: #448FC8;">
									<font color="white">风险命令管理</font>
								</button>
								<div id="showcomputer" name="showcomputer" style="float:right;">
									<span style="position:relative;top:10px;">共有<font size="3">${logsSize }</font>条记录</span>
								</div>
							</div>
							
							<div style="margin-bottom: 5px"></div>
							<table class="table table-bordered data-table  with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">执行目标</th>
										<th style="text-align: center;">执行用户</th>
										<th style="text-align: center;">执行命令</th>
										<th style="text-align: center;">执行时间</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody class="searchable">
									 <c:forEach items="${logs }" var="log">
										<tr>
											<td style="text-align: center;"><input type="checkbox"
												name="logvers" value="${log.uuid }" onclick="isSelect(this);" />
											</td>
											<td style="text-align: center;">${log.targetIP }</td>
											<td style="text-align: center;">${log.user}</td>
											<td style="text-align: center;">${log.command}</td>
											<td style="text-align: center;">${log.exeTime}</td>	
											<c:if test="${log.status == 1 }">
												<td style="text-align: center;"><button  class="btn btn-info" id="${log.uuid }" onclick="StepTwoNext('ajax','${log.uuid}');">运行中</button></td>
											</c:if>						
											<c:if test="${log.status == 2 }">
												<td style="text-align: center;"><button  class="btn btn-info" id="${log.uuid }" onclick="StepTwoNext('ajax','${log.uuid}');">已完成</button></td>
											</c:if>	
										</tr>
									</c:forEach> 
								</tbody>
							</table>
						</div>
					</div>		
				</div>
			</div>
		</div>
		
		<div id="fade" class="black_overlay"></div><!--背景层-->
		
		<!--***********************************step1***********************************-->
		<div id="step1" class="white_content">
		    <div style="width: 100%;height: 20px;">
		        <div style="float: right;" onclick="CloseDiv('step1','fade')"><img src="img/cha.png"></div>
		    </div>
		
		    <div class="content_flag" style="width:90%;">
		        <div style="width:33%;display: inline-block;padding-top: 17px;">
		            <div style="width:45%;margin:0 auto;">
		        		<div style="height:25px;width:25px;vertical-align:middle;text-align: center;border-radius:5px;background-color:rgb(106,175,225);float:left;"><font color="white">1</font></div>
		        		&nbsp;&nbsp;<font color="#7BBBE5">选择目标系统</font>
		       		</div>
		        </div>
		        <div style="width:33%;display: inline-block;padding-top: 15px;">
		            <div style="width:45%;margin:0 auto;">
			        	<div class="flag"><font color="#7BBBE5">2</font></div>
			        	&nbsp;&nbsp;<font color="#7BBBE5">输入执行命令</font>
			        </div>
		        </div>
		        <div style="width:33%;display: inline-block;padding-top: 15px;">
		            <div style="width:45%;margin:0 auto;">
			        	<div class="flag"><font color="#7BBBE5">3</font></div>
			        	&nbsp;&nbsp;<font color="#7BBBE5">远程执行命令</font>
			        </div>
		        </div>
		    </div>
		
		    <div style="margin-bottom: 10px"></div>
		    <div style="width:90%;height:35px;margin:0 auto;">
		        <input id="step1filter" type="text" class="form-control" placeholder="请输入搜索项" style="height: 28px;">
		    </div>
		
		    <div style="margin-bottom: 5px"></div>
		    <div style="width: 90%;margin: 0 auto;">
		        <table class="table table-bordered table-hover data-table with-check no-search no-select">
		            <thead>
		                <tr>
		                    <th style="text-align: center;">序号</th>
		                    <th style="text-align: center;">主机名</th>
		                    <th style="text-align: center;">IP地址</th>
		                    <th style="text-align: center;">主机配置</th>
		                    <th style="text-align: center;">操作系统</th>
		                    <th style="text-align: center;">所属产品组</th>
		                    <th style="text-align: center;">健康状态</th>
		                </tr>
		            </thead>
		            <tbody class="step1Searchable">
		                <c:forEach items="${servers }" var="ser">
							<tr>				
								<td style="text-align: center;">
									<input type="checkbox" name="servers" value="${ser.uuid }" onclick="isSelect(this);" />
								</td>
								<td style="text-align: center;">${ser.name }</td>
								<td style="text-align: center;">${ser.ip }</td>
								<td style="text-align: center;">${ser.hconf}</td>
								<td style="text-align: center;">${ser.os}</td> 
								<td style="text-align: center;">${fn:replace(ser.product,' ','&nbsp;&nbsp;')} </td>
								<td style="text-align: center;" name="state">
									<c:if test="${ser.status eq 'Active' }">
										&nbsp;&nbsp;<img src="img/icon_success.png"></img>&nbsp;
										<b>${ser.status}</b>
									</c:if> 
									<c:if test="${ser.status eq 'Error' }">
										<img src="img/icon_error.png"></img>
										&nbsp;<b>${ser.status}</b>
									</c:if>
								</td>
							</tr>
						</c:forEach>		        
		            </tbody>
		        </table>
		    </div>
		
		    <div style="margin-bottom: 40px"></div>
		    <div style="width: 90%;margin: 0 auto;text-align: center;margin-bottom: 20px;">
		        <button class="btn btn-info" onclick="StepOneNext()">
		            <span>下一步</span>
		        </button>
		    </div>
		</div>
		<!--***********************************step1***********************************-->
		
		<!--***********************************step2***********************************-->
		<div id="step2" class="white_content" style="display: none;">
		    <div style="width: 100%;height: 20px;">
		        <div style="float: right;" onclick="CloseDiv('step2','fade')"><img src="img/cha.png"></div>
		    </div>
		
		    <div class="content_flag" style="width:90%;">
		    	<div style="width:33%;display: inline-block;padding-top: 17px;">
		            <div style="width:45%;margin:0 auto;">
		        		<div class="flag"><font color="#7BBBE5">1</font></div>
		        		&nbsp;&nbsp;<font color="#7BBBE5">选择目标系统</font>
		       		</div>
		        </div>
		        <div style="width:33%;display: inline-block;padding-top: 15px;">
		            <div style="width:45%;margin:0 auto;">
			        	<div style="height:25px;width:25px;vertical-align:middle;text-align: center;border-radius:5px;background-color:rgb(106,175,225);float:left;"><font color="white">2</font></div>
			        	&nbsp;&nbsp;<font color="#7BBBE5">输入执行命令</font>
			        </div>
		        </div>
		        <div style="width:33%;display: inline-block;padding-top: 15px;">
		            <div style="width:45%;margin:0 auto;">
			        	<div class="flag"><font color="#7BBBE5">3</font></div>
			        	&nbsp;&nbsp;<font color="#7BBBE5">远程执行命令</font>
			        </div>
		        </div>		    
		    </div>
		
		    <div style="margin-bottom: 15px"></div>
		    <div style="width: 90%;margin: 0 auto;background-color: rgb(248,251,253);border: 1px solid #cee3f0;text-align: center;">
		        <div style="height: 50px;margin-top: 20px;font-size:15px;">执行命令：
		        	<input id="docommand" type="text" value="" style="height: 28px;" onblur="checkcommandsafe()"/>
		        </div>
		        <div style="height: 50px;font-size:15px;">执行用户：
		        	<input id="douser" type="text" value="" style="height: 28px;"/>
		        </div>
		    </div>
		
		    <div style="margin-bottom: 20px"></div>
		    <div style="width: 90%;margin: 0 auto;text-align: center;">
		        <button class="btn btn-info" onclick="StepTwoPre()">
		            <span>上一步</span>
		        </button>
		        <button class="btn btn-info" onclick="StepTwoNext('page','nouuid')">
		            <span>执行</span>
		        </button>
		    </div>
		</div>
		<!--***********************************step2***********************************-->
		
		<!--***********************************step3***********************************-->
		<div id="step3" class="white_content" style="display: none;">
		    <div style="width: 100%;height: 20px;">
		        <div style="float: right;" onclick="CloseDiv('step3','fade')"><img src="img/cha.png"></div>
		    </div>
		
		    <div class="content_flag" style="width:90%;">
		    	<div style="width:33%;display: inline-block;padding-top: 17px;">
		            <div style="width:45%;margin:0 auto;">
		        		<div class="flag"><font color="#7BBBE5">1</font></div>
		        		&nbsp;&nbsp;<font color="#7BBBE5">选择目标系统</font>
		       		</div>
		        </div>
		        <div style="width:33%;display: inline-block;padding-top: 15px;">
		            <div style="width:45%;margin:0 auto;">
			        	<div class="flag"><font color="#7BBBE5">2</font></div>
			        	&nbsp;&nbsp;<font color="#7BBBE5">输入执行命令</font>
			        </div>
		        </div>
		        <div style="width:33%;display: inline-block;padding-top: 15px;">
		            <div style="width:45%;margin:0 auto;">
			        	<div style="height:25px;width:25px;vertical-align:middle;text-align: center;border-radius:5px;background-color:rgb(106,175,225);float:left;"><font color="white">3</font></div>
			        	&nbsp;&nbsp;<font color="#7BBBE5">远程执行命令</font>
			        </div>
		        </div>		    
		    </div>
		
		    <div style="margin-bottom: 5px"></div>
		    <div style="width: 90%;margin: 0 auto;font-size:15px;">
		   		<span id="uuid" hidden></span>
		   		<div style="margin-top:10px;">
		       		<div style="height:30px;width:50%;float:left;"> 执行命令：<span id="showcommand"></span> </div>
		        	<div style="height:30px;width:50%;float:right;"> 执行时间：<span id="showtime"></span></div>
		        </div>
		        <div>
		        	<div style="height:30px;width:50%;float:left;"> 执行用户：<span id="showuser"></span></div>
		      		<div style="height:30px;width:50%;float:right;"> 下载文件：<span id="Down" style="color:blue" onclick="downloadRunInfo();">下载</span></div>
		        </div>		        
		        <div id="showLog" style="width: 100%;height:330px;margin: 0 auto;padding-left:10px;padding-top:10px;background-color: black;color: white;overflow-y: auto; overflow-x:hidden;">
		        </div>
		    </div>
		</div>
		<!--***********************************step3***********************************-->
		
		<!-- 模态框：风险命令管理 -->
		<div class="modal fade" id="commandmanaged" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 头部 -->
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;风险命令管理
						</h5>
					</div>
					<!-- 主体内容 -->
					<form id="modle_submit">
						<div class="modal-body">
							<div class="demo" style="width:80%;">	
								<div class="plus-tag tagbtn clearfix" id="myTags"></div>
								<div class="plus-tag-add" style="width:80%;margin-left:-4%;">
									<form id="nocommand" action="nocommand.do" class="login">
										<ul class="Form FancyForm" style="margin-top: 10px;">
											<li>
												<input id="" name="" type="text" class="stext" maxlength="20" style="width:400px;height:35px;"/>
												<label>输入需禁止命令</label>
												<span class="fff"></span>
											</li>
											<li>
												<button type="button" class="Button RedButton Button18" style="font-size:14px;">添加命令</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
					<button type="button" class="btn" style="background-color: #448FC8;" onclick="InputNoCommand();">
						<font color="white">提交</font>
					</button>
				</div>
			</div>
		</div>
		<!-- 模态框：风险命令管理 -->
	</div>
</body>

<script type="text/javascript">
	//点击“风险命令管理”按钮获取禁止命令，并显示到模态框
	function UnsafeCommand()
	{
		$("#myTags").css("display","block");
		$("#myTags").empty();
		$.ajax({
			url:'<%=path%>/getCommands.do',
			type:'post',
			dataType : 'json',
			success:function(result){
				var arr = [];
				for(var key in result)
				{
					arr.push(result[key]);
				}
				for(var i=0;i<arr.length;i++)
				{
					$("#myTags").append("<a value='-1' title='"+arr[i]+"' href='javascript:void(0);'><span>"+arr[i]+"</span><em></em></a>");
				}
			}
		})
	}
	
	//输入执行命令之后，判断该命令是否为禁止命令 
	function checkcommandsafe()
	{
		var docommand = $("#docommand").val();
        $.ajax({
			url:'<%=path%>/getCommands.do',
			type:'post',
			dataType : 'json',
			success:function(result){
				for(var key in result)
				{
					if(result[key].indexOf(docommand) >= 0)
					{
						sweet("该命令是禁止命令，请重新输入","error","确定"); 
						$("#docommand").val("");
					}
				} 
			}
		})
	}

	function InputNoCommand()
	{
		var a = $("#myTags a").length;
		var commandString = "";
		for(var i=0;i<a;i++)
		{
			commandString += $("#myTags a:eq("+i+")").text() + ",";
		}
		$.ajax({
			url:'<%=path%>/nocommand.do',
			type:'get',
			dataType:'json',
			data:{"commandString":commandString},
			/* success:function(result){
				if(result.msg == "success"){
					swal({
						title : "",
						text : "确认是否提交该禁止命令",  
						type : "warning",
						showCancelButton : true,
						closeOnConfirm : false,
						closeOnCancel : false,
						confirmButtonText : "是",
						cancelButtonText : "否", 
						confirmButtonColor : "#ec6c62"
					}, function(isConfirm) {
						if (isConfirm) {
							window.location.href = "remoteCommand.do";
						} else {
							window.history.go(0);
						}
					});	
				}
			}  */
		})
		sweet("禁止命令提交成功","success","确定");
		$("#commandmanaged").modal('hide');
	}
	
	//弹出隐藏层
	function ShowDiv(show_div,bg_div)
	{
	    document.getElementById(show_div).style.display='block';
	    document.getElementById(bg_div).style.display='block' ;
	    var bgdiv = document.getElementById(bg_div);
	    bgdiv.style.width = document.body.scrollWidth;
	    $("#"+bg_div).height($(document).height());
	}
	
	//关闭弹出层
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    }

    function StepTwoPre()
    {
        $("#step1").show();
        $("#step2").hide();
    }
    
    function StepTwoNext(source,hasUUID)
    {
    	if(source == 'page')   //如果是页面跳转
    	{ 
    		    var docommand = $("#docommand").val();
    	        var douser = $("#douser").val();
    	        
    	        if(docommand == "")
    	        {
    	        	sweet("请输入执行命令","warning","确定"); 
    	        	return;
    	        } 
    	        if(douser == "")
    	        {
    	        	sweet("请输入执行用户","warning","确定"); 
    	        	return;
    	        }
    	        $("#showcommand").text(docommand);
    	        $("#showuser").text(douser);
    	        //获取当前时间
    	        var date = new Date();
    	        var seperator1 = "-";
    	        var seperator2 = ":";
    	        var month = date.getMonth() + 1;
    	        var strDate = date.getDate();
    	        if (month >= 1 && month <= 9) {
    	            month = "0" + month;
    	        }
    	        if (strDate >= 0 && strDate <= 9) {
    	            strDate = "0" + strDate;
    	        }
    	        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
    	                + " " + date.getHours() + seperator2 + date.getMinutes()
    	                + seperator2 + date.getSeconds();
    	        $("#showtime").text(currentdate);

    	        $("#step2").hide();
    	      //$("#step3").show();
    	        
    	        $.ajax({
    	        	url:'<%=path%>/toRemoteCommandNextPage.do',
    				type:'post',
    				dataType : 'json',
    				data:{step:'inputData',user:douser,command:docommand,iplist:transData(ips)},
    				success:function(retVal)
    				{
    					Complete();
    					swal({
    						title : "",
    						text : "是否确认要在目标主机立即执行任务？",
    						type : "warning",
    						showCancelButton : true,
    						closeOnConfirm : false,
    						closeOnCancel : false,
    						confirmButtonText : "是",
    						cancelButtonText : "否", 
    						confirmButtonColor : "#ec6c62"
    					}, function(isConfirm) {
    						if (isConfirm) {
    							window.location.href = "remoteCommand.do";
    						} else {
    							window.history.go(0);
    						}
    					});
    				}
    	        })
    	}else if(source == 'ajax') //如果是做好了在看详细的日志就去调用ajax
    	{
    		 $.ajax({
    	        	url:'<%=path%>/getRemoteCommandDetails.do?uuid='+hasUUID,
    				type:'get',
    				dataType : 'json',
    				success:function(retVal)
    				{
    					    var docommand = retVal.command;
    				        var douser = retVal.user;
    				        var user = retVal.user;
    				        var exeTime = retVal.exeTime;
    				        var result = retVal.result;
    				        var uuid = retVal.uuid;
    				        $("#showcommand").text(docommand);
    				        $("#showuser").text(douser);
    				       
    				        $("#showtime").text( timeStamp2String(exeTime*1000));
    				      	$("#uuid").text(uuid);
    				        $("#showLog").html(result.split('\n').join('<br>'));
    				}
    	        })
    	        $("#step3").show();
    	       return;
    	}
      
    }
    
    function Complete()
    {
        CloseDiv('step3','fade');
    }
</script>

<!-- 以下用于保存选择的IP -->
<p id="selectedIPS" hidden></p>
<script type="text/javascript">
	function downloadRunInfo()
	{
		var uuid = $("#uuid").html();
		var form = $("<form>");//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "download");
		form.attr("method", "post");
		form.attr("action", "remoteCommand_download_info.do");
		var input1 = $("<input>");
		input1.attr('name','uuid');
		input1.attr("type", "hidden");
		input1.attr("value", uuid);
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.submit();//表单提交 
	}
	
	
	function timeStamp2String (time){
        var datetime = new Date();
         datetime.setTime(time);
         var year = datetime.getFullYear();
         var month = datetime.getMonth() + 1;
         var date = datetime.getDate();
         var hour = datetime.getHours();
         var minute = datetime.getMinutes();
         var second = datetime.getSeconds();
         var mseconds = datetime.getMilliseconds();
         return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second+"."+mseconds;
};
</script>
<script src="js/tab.js" type="text/javascript"></script>
</html>
