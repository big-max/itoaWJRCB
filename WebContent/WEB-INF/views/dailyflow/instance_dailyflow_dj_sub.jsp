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
<meta name="viewport" content="width=device-width,initial-scale=1" />
<jsp:include page="../header_rz_dj_sub.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
body{
	margin:0;padding:0;
	background:url('dailyimg/u0.jpg') repeat;
}
.connector>img { max-width:400px; }
.hide{ display:none; }
.progress{ z-index: 2000; }
.mask{ position: fixed;top: 0;right: 0;bottom: 0;left: 0; z-index: 1000; background-color: #000000; }
.modal{ width:750px;left:43%; }
.ax_default{ cursor:pointer; }
#progressImgage{display:none;}
</style>

<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
</head>

<body>
	
	<!-- 日志模态框（Modal） -->
	<div class="modal fade modalframe" id="showlog"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">日志信息</h4>
				</div>
				<div class="modal-body">
					<textarea id="logarea" rows="10" style="width:100%;height:100%;resize:none;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 记录问题模态框（Modal） -->
	<div class="modal fade modalframe" id="recordproblem"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">记录问题</h4>
				</div>
				<div class="modal-body">
					<textarea id="problemarea" rows="10" style="width:100%;height:100%;resize:none;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">关闭</button>
					<button type="button" class="btn" style="background-color: rgb(68, 143, 200);"
						onclick="SubmitInput();"><font color="white">提交</font>
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div style="height:80px;width:100%;">
		<div style="float:left;">
			<img src="dailyimg/WJRCB_logo.png">
		</div>
		<div style="height:80px;line-height:70px;font-size:30px;margin-left:60%;">
			<span><font color="white">日&nbsp;终&nbsp;(贷&nbsp;记&nbsp;卡)</font></span>
		</div>
	</div>
	
	<div>
	  <div id="u961">
        <div id="u961_div"></div>
        <div id="u962" class="text">
          <p><span>需要清理</span></p>
        </div>
      </div>
      
      <div id="u904">
        <div id="u904_div"></div>
        <div id="u905" class="text">
          <p><span>未开始</span></p>
        </div>
      </div>

      <div id="u906">
        <div id="u906_div"></div>
        <div id="u907" class="text">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u908">
        <div id="u908_div"></div>
        <div id="u909" class="text">
          <p><span>成功</span></p>
        </div>
      </div>

      <div id="u910">
        <div id="u910_div"></div>
        <div id="u911" class="text">
          <p><span>失败</span></p>
        </div>
      </div>
	</div>


    <div id="mainflow" style="height:620px;width:970px;position:absolute;top:10px;">

      <div id="u902" class="ax_default okd_f1">
        <div id="u902_div"></div>
        <div id="u903" class="text">
          <p><span>银联和行内</span></p><p><span>清算文件</span></p>
        </div>
      </div>
      
      <div id="u919" class="ax_default okd_f2">
        <div id="u919_div"></div>
        <div id="u920" class="text">
          <p><span>人民币柜面</span></p><p><span>还款文件</span></p>
        </div>
      </div>

      <div id="u921" class="ax_default okd_f3">
        <div id="u921_div"></div>
        <div id="u922" class="text">
          <p><span>人民币自动</span></p><p><span>扣缴回盘文件</span></p>
        </div>
      </div>

      <div id="u923" class="ax_default okd_m1">
        <div id="u923_div"></div>
        <div id="u924" class="text">
          <p><span>核心处理检查</span></p><p><span>跑批标志</span></p>
        </div>
      </div>

      <div id="u925" class="ax_default okd_m2">
        <div id="u925_div"></div>
        <div id="u926" class="text">
          <p><span>批前合并清算</span></p><p><span>文件到dat目录</span></p>
        </div>
      </div>

      <div id="u927" class="ax_default okd_m3">
        <div id="u927_div"></div>
        <div id="u928" class="text">
          <p><span>批前检查</span></p><p><span>清算文件长度</span></p>
        </div>
      </div>
      
      <div id="u933" class="ax_default okd_m4">
        <div id="u933_div"></div>
        <div id="u934" class="text">
          <p><span>批前备份</span></p>
        </div>
      </div>
      
      <div id="u931" class="ax_default okd_m5">
        <div id="u931_div"></div>
        <div id="u932" class="text">
          <p><span>核心批处理</span></p>
        </div>
      </div>

      <div id="u929" class="ax_default okd_m6">
        <div id="u929_div"></div>
        <div id="u930" class="text">
          <p><span>批后备份</span></p>
        </div>
      </div>

      <div id="u935" class="ax_default okd_m7">
        <div id="u935_div"></div>
        <div id="u936" class="text">
          <p><span>批后发送文件处理</span></p>
        </div>
      </div>

      <div id="u937" class="ax_default okd_m8">
        <div id="u937_div"></div>
        <div id="u938" class="text">
          <p><span>批后目录清理</span></p>
        </div>
      </div>

      <div id="u939" class="ax_default okd_m9">
        <div id="u939_div"></div>
        <div id="u940" class="text">
          <p><span>释放跑批标志</span></p>
        </div>
      </div>
      
      <div id="u945" class="ax_default okd_t1">
        <div id="u945_div"></div>
        <div id="u946" class="text">
          <p><span>PSM文件</span></p>
        </div>
      </div>
      
      <div id="u943" class="ax_default okd_t2">
        <div id="u943_div"></div>
        <div id="u944" class="text">
          <p><span>PTX文件</span></p>
        </div>
      </div>

      <div id="u941" class="ax_default okd_t3">
        <div id="u941_div"></div>
        <div id="u942" class="text">
          <p><span>STM文件</span></p>
        </div>
      </div>

      <div id="u947" class="ax_default okd_t4">
        <div id="u947_div"></div>
        <div id="u948" class="text">
          <p><span>GL文件</span></p>
        </div>
      </div>

      <div id="u949" class="ax_default okd_t5">
        <div id="u949_div"></div>
        <div id="u950" class="text">
          <p><span>VIP文件</span></p>
        </div>
      </div>

      <div id="u951" class="ax_default okd_t6">
        <div id="u951_div"></div>
        <div id="u952" class="text">
          <p><span>忠诚兑换文件</span></p>
        </div>
      </div>
      
      <div id="u957" class="ax_default okd_t7">
        <div id="u957_div"></div>
        <div id="u958" class="text">
          <p><span>所有文件</span></p>
        </div>
      </div>
      
      <div id="u955" class="ax_default okd_t8">
        <div id="u955_div"></div>
        <div id="u956" class="text">
          <p><span>IC卡制卡文件传出</span></p>
        </div>
      </div>

      <div id="u953" class="ax_default okd_t9">
        <div id="u953_div"></div>
        <div id="u954" class="text">
          <p><span>批前备份文件传出</span></p>
        </div>
      </div>

      <div id="u959" class="ax_default okd_t10">
        <div id="u959_div"></div>
        <div id="u960" class="text">
          <p><span>批后备份文件传出</span></p>
        </div>
      </div>

      <div id="u963" class="connector">
        <img id="u963_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u963_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u965" class="connector">
        <img id="u965_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u965_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u967" class="connector">
        <img id="u967_seg0" class="img" src="dailyimg/u967_seg0.png"/>
        <img id="u967_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u969" class="connector">
        <img id="u969_seg0" class="img" src="dailyimg/u969_seg0.png"/>
        <img id="u969_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u971" class="connector">
        <img id="u971_seg0" class="img" src="dailyimg/u971_seg0.png"/>
        <img id="u971_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u973" class="connector">
        <img id="u973_seg0" class="img" src="dailyimg/u969_seg0.png"/>
        <img id="u973_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u975" class="connector">
        <img id="u975_seg0" class="img" src="dailyimg/u967_seg0.png"/>
        <img id="u975_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u977" class="connector">
        <img id="u977_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u977_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u979" class="connector">
        <img id="u979_seg0" class="img" src="dailyimg/u979_seg0.png"/>
        <img id="u979_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u981" class="connector">
        <img id="u981_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u981_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u983" class="connector">
        <img id="u983_seg0" class="img" src="dailyimg/u967_seg0.png"/>
        <img id="u983_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u985" class="connector">
        <img id="u985_seg0" class="img" src="dailyimg/u969_seg0.png"/>
        <img id="u985_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u987" class="connector">
        <img id="u987_seg0" class="img" src="dailyimg/u971_seg0.png"/>
        <img id="u987_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u989" class="connector">
        <img id="u989_seg0" class="img" src="dailyimg/u969_seg0.png"/>
        <img id="u989_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u991" class="connector">
        <img id="u991_seg0" class="img" src="dailyimg/u967_seg0.png"/>
        <img id="u991_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u993" class="connector">
        <img id="u993_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u993_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u995" class="connector">
        <img id="u995_seg0" class="img" src="dailyimg/u979_seg0.png"/>
        <img id="u995_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u997" class="connector">
        <img id="u997_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u997_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u999" class="connector">
        <img id="u999_seg0" class="img" src="dailyimg/u971_seg0.png"/>
        <img id="u999_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u1001" class="connector">
        <img id="u1001_seg0" class="img" src="dailyimg/u1001_seg0.png"/>
        <img id="u1001_seg1" class="img" src="dailyimg/u1001_seg1.png"/>
        <img id="u1001_seg2" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u1003" class="connector">
        <img id="u1003_seg0" class="img" src="dailyimg/u963_seg0.png"/>
        <img id="u1003_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
    </div>
    
    <img id="progressImgage" style="width:120px;height:120px;" alt="请稍等，处理中。。。" src="img/process.gif"/>
    <div id="maskOfProgressImage" class="mask hide"></div>
    
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div iconCls="icon-search" onclick="rz_showLog()">查看日志</div>
        <div iconCls="icon-edit" onclick="rz_record()">记录问题</div>
        <div iconCls="icon-reload" onclick="rz_clear()">清理&续作</div>
        <div iconCls="icon-ok" onclick="rz_makesuccess()">确认成功</div>
    </div>
    
    <div id="mm1" class="easyui-menu" style="width:120px;">
        <div iconCls="icon-search" onclick="rz_showLog()">查看日志</div>
        <div iconCls="icon-edit" onclick="rz_record()">记录问题</div>
        <div iconCls="icon-ok" onclick="rz_makesuccess()">确认成功</div>
    </div>
</body>

<script>
	$(document).ready(function(){
		var wid = document.documentElement.clientWidth;
		var widTr = (wid - 970) / 2;
		$("#mainflow").css("left",widTr);
	})

	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	}
	
	var taskid;
	var execution_date_time = getUrlParam('execution_date');//2017-12-01T15:24:28
	var execution_date_time1 = execution_date_time.replace("T"," ");
	
	$(document).ready(function(){
		$(".ax_default").on("mouseover",function(e){ //获取要点击任务框的id
			var classes = $(this).attr("class");
			taskid = classes.split(" ")[1];
		})
	})
	
	$(function(){
		$(".ax_default").bind('contextmenu',function(e){
			e.preventDefault();
			var id = $(this).find("div:eq(0)").attr("id");
			var borderColor = document.getElementById(id).style.borderColor;
			if(borderColor == "rgb(50, 204, 0)" || borderColor == "rgb(0, 0, 255)")//如果是成功或进行中，右键没有清理操作
			{
				$('#mm1').menu('show', {
					left: e.pageX, 
					top: e.pageY
				});
			}
			else{
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			}
		});
	});
	
	function rz_showLog()
	{
		$("#mm").menu('hide');
		var execution_date = getUrlParam('execution_date'); //获取url 的值
		//var dag_id = getUrlParam('dag_id'); //获取url 的值
		var subdag_id = getUrlParam('subdag_id');//获取子流程名
		var dag_id = subdag_id;//复用代码
		var data ={"dag_id":dag_id,"task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
		$.ajax({
				url : '<%=path%>/getTaskLog.do',
				data:data,
				type : 'post',
				dataType : 'json',
				success:function(result) 
				{
					$("#showlog").modal();
					$("#logarea").text(result.msg);
				},
			})
	}
	
	function rz_record()
	{
		$("#mm").menu('hide');
		$("#recordproblem").modal();//打开模态框 
		var execution_date = getUrlParam('execution_date'); 
		var dag_id = getUrlParam('dag_id'); //获取url 的值
		var content = $("#problemarea").text();//获取提交的问题内容 
		var data ={"dag_id":dag_id,"task_id":taskid,"execution_date":execution_date,"content":content}
		$("#subBtn").click(function(){
			if(content == "")
			{
				sweet("问题记录不能为空!","warning","确定"); 
   				return;
			}
			else{
				$.ajax({
					url : '<%=path%>/postLogRecord.do',
					data:data,
					type : 'post',
					dataType : 'json',
					success:function(result)
					{
					}
				})
			}
		})
	}
	
	function rz_makesuccess()
	{
		$("#mm").menu('hide');
		var execution_date = getUrlParam('execution_date'); //获取url 的值
    	//var dag_id = getUrlParam('dag_id'); //获取流程名
    	var subdag_id = getUrlParam('subdag_id');
    	var dag_id = subdag_id;//这里把子流程名给dag_id 复用代码
    	swal({ 
    	    title: "", 
    	    text: "您确定要将任务置为成功?", 
    	    type: "warning", 
    	    showCancelButton: true, 
    	    closeOnConfirm: false, 
    	    confirmButtonText: "确认",  
    	    cancelButtonText: "取消",  
    	    confirmButtonColor: "#ec6c62" 
    	}, function(isConfirm) { 
    		if(isConfirm)
    		{
    			var data ={"dag_id":dag_id,"task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
    			$.ajax({
    				url : '<%=path%>/markTaskSuccess.do',
    				data:data,
    				type : 'post',
    				dataType : 'json',
    				success:function(result)
    				{
    					if(result.status == 0)
    					{
    						swal.close();
    					} 
    				},
    			})
    		}
    	});
	}
	
	function rz_clear()
	{
		$("#mm").menu('hide');
		var execution_date = getUrlParam('execution_date'); //获取url 的值
    	var dag_id = getUrlParam('dag_id'); //获取url 的值
    	var subdag_id = getUrlParam('subdag_id');
    	var fathertask_id = getUrlParam('fathertask_id');//子任务的父任务task_id
    	var data ={"dag_id":dag_id,"subdag_id":subdag_id,"fathertask_id":fathertask_id,"task_id":taskid,"execution_date":execution_date}
		var img = $("#progressImgage");
	      	var mask = $("#maskOfProgressImage");
    	img.show().css({
	           "position": "fixed",
	           "top": "50%",
	           "left": "50%",
	           "margin-top": function () { return -1 * img.height() / 2; },
	           "margin-left": function () { return -1 * img.width() / 2; }
	       });
	       mask.show().css("opacity", "0.1");
	      $.ajax({
	    	  url : '<%=path%>/makeNodeClear.do',
			data:data,
			type : 'post',
			dataType : 'json',
			success:function(data)
			{
				console.info(data);
			}
	       });
	       var makeClear = setInterval(function(){$.ajax({
  			url : '<%=path%>/queryTaskState.do',
			data:data,
			type : 'post',
			dataType : 'json',
			async:false,
			success:function(data)
			{
				if(data.TaskState == "null" || data.TaskState == "shutdown" || data.TaskState == "queued" || data.TaskState =="scheduled"){
		    		   img.hide();
			           mask.hide();
			           var task_div = $('.' + data.task_id);
			           task_div.find("div:eq(0)").css("border-color","#797979") ;
			           clearInterval(makeClear);
		    	   }
			},
			error:function(data)
			{
				 console.info("请检查应用服务器是否正常！");
		    	 img.hide();
		         mask.hide();
			},
			complete:function()
			{
				 img.hide();
		         mask.hide();
			}
	   })},3000);
	}
</script>

<script>
	/* $(".ax_default").tooltip({
	    html: true,
	    container: "body",
	}); */
	
	//var dag_id = "wjrz_dev"; 
	//var dag_id = getUrlParam('dag_id'); 
	var subdag_id = getUrlParam('subdag_id'); 
	var dag_id = subdag_id; //复用获取流程信息的代码
	var execution_date = getUrlParam('execution_date');
	var execution_date_show = execution_date.split("T")[0];
	var data ={"dag_id":dag_id,"execution_date":execution_date};
	
	setInterval(function(){getAjax("runningData.do",data,"post")},3000);
	
	function update_nodes_states(task_instances) {
		$.each(task_instances,function(idx,obj){
            var task_div = $('.' + obj.task_id);
            if(obj.state == 'failed') //如果失败
            {
            	/* var tipcontent ="<p align='left'> 预计开始时间：" +  obj.expected_starttime + "," +
            									 "实际开始时间：" +  obj.start_Date         + "," +
            									 "预计结束时间：" +  obj.expected_endtime   + "," + 
            									 "实际结束时间：" +  obj.end_Date           + "," +
            									 "预计持续时间：" +  obj.expected_duration  + "&nbsp;&nbsp;," + 
            									 "实际持续时间：" +  obj.duration           + "&nbsp;&nbsp;," +
            					"任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FF0000"); */
                
	            var tipcontent = '<span style="color:#fff">预计开始时间：' + obj.expected_starttime + '<br>' +
								 '实际开始时间：' + obj.start_Date + '<br>' +
								 '预计结束时间：' + obj.expected_endtime + '<br>' +
								 '实际结束时间：' + obj.end_Date + '<br>' +
								 '预计持续时间：' + obj.expected_duration + '<br>' +
								 '实际持续时间：' + obj.duration + '<br>' +
								 '任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败</span>';
				$(task_div).tooltip({
					position: 'top',
					content: tipcontent,
					onShow: function(){
						$(this).tooltip('tip').css({
							backgroundColor: '#676161',
							borderColor: '#676161'
						});
					}
				});
				task_div.find("div:eq(0)").css("border-color","#FF0000");
            }
            else if (obj.state == 'success') //如果成功
            {
            	/* var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 			 	 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：成功</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#32cc00"); */
                
            	var tipcontent = '<span style="color:#fff">预计开始时间：' + obj.expected_starttime + '<br>' +
								 '实际开始时间：' + obj.start_Date + '<br>' +
								 '预计结束时间：' + obj.expected_endtime + '<br>' +
								 '实际结束时间：' + obj.end_Date + '<br>' +
								 '预计持续时间：' + obj.expected_duration + '<br>' +
								 '实际持续时间：' + obj.duration + '<br>' +
								 '任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：成功</span>';
				$(task_div).tooltip({
					position: 'top',
					content: tipcontent,
					onShow: function(){
						$(this).tooltip('tip').css({
							backgroundColor: '#676161',
							borderColor: '#676161'
						});
					}
				});
				task_div.find("div:eq(0)").css("border-color","#32cc00");
            }
            else if (obj.state == '' || obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'scheduled' )//未开始
            {
            	/* var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：未开始</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#ffffff"); */
                
            	var tipcontent = '<span style="color:#fff">预计开始时间：' + obj.expected_starttime + '<br>' +
								 '实际开始时间：' + obj.start_Date + '<br>' +
								 '预计结束时间：' + obj.expected_endtime + '<br>' +
								 '实际结束时间：' + obj.end_Date + '<br>' +
								 '预计持续时间：' + obj.expected_duration + '<br>' +
								 '实际持续时间：' + obj.duration + '<br>' +
								 '任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：未开始</span>';
				$(task_div).tooltip({
					position: 'top',
					content: tipcontent,
					onShow: function(){
						$(this).tooltip('tip').css({
							backgroundColor: '#676161',
							borderColor: '#676161'
						});
					}
				});
				task_div.find("div:eq(0)").css("border-color","#ffffff");
            }
            else if (obj.state == 'running')
            {
            	/* var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：运行中</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#0000ff") ; */
                
            	var tipcontent = '<span style="color:#fff">预计开始时间：' + obj.expected_starttime + '<br>' +
								 '实际开始时间：' + obj.start_Date + '<br>' +
								 '预计结束时间：' + obj.expected_endtime + '<br>' +
								 '实际结束时间：' + obj.end_Date + '<br>' +
								 '预计持续时间：' + obj.expected_duration + '<br>' +
								 '实际持续时间：' + obj.duration + '<br>' +
								 '任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：运行中</span>';
				$(task_div).tooltip({
					position: 'top',
					content: tipcontent,
					onShow: function(){
						$(this).tooltip('tip').css({
							backgroundColor: '#676161',
							borderColor: '#676161'
						});
					}
				});
				task_div.find("div:eq(0)").css("border-color","#0000ff");
            }
            else if (obj.state == 'done') //如果处于做完待确认的状态
            {
            	/* var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FF8C00") ; */
                
            	var tipcontent = '<span style="color:#fff">预计开始时间：' + obj.expected_starttime + '<br>' +
								 '实际开始时间：' + obj.start_Date + '<br>' +
								 '预计结束时间：' + obj.expected_endtime + '<br>' +
								 '实际结束时间：' + obj.end_Date + '<br>' +
								 '预计持续时间：' + obj.expected_duration + '<br>' +
								 '实际持续时间：' + obj.duration + '<br>' +
								 '任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认</span>';
				$(task_div).tooltip({
					position: 'top',
					content: tipcontent,
					onShow: function(){
						$(this).tooltip('tip').css({
							backgroundColor: '#676161',
							borderColor: '#676161'
						});
					}
				});
				task_div.find("div:eq(0)").css("border-color","#FF8C00");
            }
            else if (obj.state == 'upstream_failed' || obj.state == 'shutdown') //需要清理 
            {
            	/* var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FFCC33") ; */
                
            	var tipcontent = '<span style="color:#fff">预计开始时间：' + obj.expected_starttime + '<br>' +
								 '实际开始时间：' + obj.start_Date + '<br>' +
								 '预计结束时间：' + obj.expected_endtime + '<br>' +
								 '实际结束时间：' + obj.end_Date + '<br>' +
								 '预计持续时间：' + obj.expected_duration + '<br>' +
								 '实际持续时间：' + obj.duration + '<br>' +
								 '任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认</span>';
				$(task_div).tooltip({
					position: 'top',
					content: tipcontent,
					onShow: function(){
						$(this).tooltip('tip').css({
							backgroundColor: '#676161',
							borderColor: '#676161'
						});
					}
				});
				task_div.find("div:eq(0)").css("border-color","#FFCC33");
            }
		})
    }
	
	function ajax(url, param, type) {
	    return $.ajax({
	    url: url,
	    data: param || {},
	    type: type || 'GET',
	    cache:false
	    });
	}
	
	function getAjax(url,param,type){
		function handleAjax(url, param, type) {
		 return ajax(url, param, type).then(function(resp){
				// 成功回调
				if(resp){
					console.info(resp.dag_tasks);
					update_nodes_states(resp.dag_tasks);
				}
				else{
					return $.Deferred().reject(resp); // 返回一个失败状态的deferred对象，把错误代码作为默认参数传入之后fail()方法的回调
				}
			}, function(err){ //失败回调
				console.log(err); // 打印状态码
				});
			}
		handleAjax(url,param,type);
	}
</script>

</html>