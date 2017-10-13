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

<jsp:include page="../header3.jsp" flush="true" />

<title>自动化部署平台</title>
<style type="text/css">
body{margin:0;padding:0;}
.content {
	position:relative;
	width:calc(100% - 1px); 
	margin-top:50px;
	height:calc(100vh - 50px); 
	background-color:#F5F3F4;
}
.explogo{
	float:left;
	width:70px;
	height:40px;
	background-color:#F0EDE4;
	border-radius:10px;
	text-align:center;
	line-height:35px;
	font-size:14px;
	margin-top:15px;
}
.btn_block{
	width:80%;
	margin:0 auto;

</style>
<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
</head>

<body>
	<!-- 模态框（Modal） -->
<!-- 	<div class="modal fade modalframe" id=""  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					  <button id="btn_log" type="button" class="btn btn-block" style="background-color:rgb(0,92,102);"><font color="white">查看日志</font></button>
					   <div style="margin-top: 5px;"></div>
					  <button id="btn_clear" type="button" class="btn btn-block" style="background-color:rgb(0,92,102);" data-toggle="tooltip" data-placement="top" title="清理当前出错任务，并让调度器重新发起此任务"><font color="white">清理&续作</font></button>
					  <div style="margin-top: 5px;"></div>
           			  <button id="btn_success" type="button" class="btn btn-block" style="background-color:rgb(0,92,102);"><font color="white">确认成功</font></button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>/.modal-content
		</div>/.modal
	</div> -->
	
	<!--header start-->
	<div class="header">
		<jsp:include page="../topnav.jsp" flush="true" />
	</div>
	<!--header end-->
	
	<!--content start-->
	<div class="content">
		<!-- 图例说明 -->
		<div style="height:70px;width:300px;margin-left:10px;">
			<div class="explogo"  style="border:2px solid white;position:fixed;">未开始</div>
			<div class="explogo"  style="margin-left:75px;border:2px solid #0000ff;position:fixed;">运行中</div>
			<div class="explogo"  style="margin-left:150px;border:2px solid #00ff00;position:fixed;">成功</div>
			<div class="explogo"  style="margin-left:225px;border:2px solid red;position:fixed;">失败</div>
			<div class="explogo"  style="margin-left:300px;border:2px solid #ff7f00;position:fixed;">已确认</div>
		</div>
		<div style="margin-bottom:10px;"></div>
		
		<div id="svg_container" style="margin-left:10px;margin-right:10px;">
			<svg width="100%" height="350">
				<g id='dig' transform="translate(20,60)"/>  
			</svg>
		</div>
	</div>
</body>


<script>
    //给每个g添加id
	$(document).ready(function(){
		//定义一个数组存放所有id值
		var arrIdVal = ["pprc_go_start","pprc_go_workdb_backup","pprc_go_icsdb_backup","pprc_go_cardb_backup",
						"pprc_go_cmisdb_backup","pprc_go_backup_end","pprc_go_p770a2_check_hastatus",
						"pprc_go_p770b2_check_hastatus","pprc_go_p770b1_check_hastatus","pprc_go_p770a1_check_hastatus",
						"pprc_go_p770a2_hastop","pprc_go_p770b2_hastop","pprc_go_p770b1_hastop","pprc_go_p770a1_hastop",
						"pprc_go_ds8k_lunstart","pprc_go_p770c1_lunread","pprc_go_p770c2_lunread","pprc_go_p770c1_workstart",
						"pprc_go_p770c1_cmisstart","pprc_go_p770c2_icsstart","pprc_go_p770c2_cardstart","pprc_go_ywcheck",
						"pprc_go_startreplic","pprc_go_p770c1_replicationstart","pprc_go_p770c2_replicationstart",
						"pprc_go_end"];		
		var nodelen = $("g.node").length;
		//遍历每个g，赋值id
		for(var i = 0 ; i < nodelen ; i++)
		{
			var idname = arrIdVal[i];
			var datatar = "#" + idname;
			$("g.node").eq(i).attr("id",idname);
			$("g.node").eq(i).attr("data-toggle","modal");
			/* $("g.node").eq(i).attr("data-target",datatar); */
		}
	})
	
	//模态框处理 
	/* $(document).ready(function(){
		$("g.node").click(function(){
			var nodename = $(this).find("tspan").text();//获取任务中文名
			var nodeid = $(this).attr("id");//获取任务id
			$(".modalframe").attr("id",nodeid);//给模态框动态赋值id
			$("#myModalLabel").text(nodename);//每个模态框获取该任务名 
		});
	}) */ 
	var taskid;
	$(document).ready(function(){

		$("g.node").on("mouseover",function(e){
			taskid = $(this).attr("id");//获取要点击任务框的id 
		})
		
		$('g.node').contextPopup({
          items: [
            {label:'查看日志', icon:'img/viewlog.png', action:function() 
            	{ 
            		var execution_date = getUrlParam('execution_date'); //获取url 的值
            		var data ={"dag_id":"pprc_go","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
            			$.ajax({
            				url : '<%=path%>/getTaskLog.do',
            				data:data,
            				type : 'post',
            				dataType : 'json',
            				success:function(result)
            				{
            					alert(result.msg);
            				},
            			})
            	} 
            },
            {label:'清理&续作', icon:'img/cleanbtn.png', action:function() 
            	{ 
	            	var execution_date = getUrlParam('execution_date'); //获取url 的值
	            	var data ={"dag_id":"pprc_go","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
	            		$.ajax({
	            			url : '<%=path%>/makeNodeClear.do',
	            			data:data,
	            			type : 'post',
	            			dataType : 'json',
	            			success:function(result)
	            			{
	            				//alert(result.msg);
	            			},
	            		})
            	} 
            },
            {label:'确认成功', icon:'img/comsucc.png', action:function() 
            	{ 
	            	var execution_date = getUrlParam('execution_date'); //获取url 的值
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
	            			var data ={"dag_id":"pprc_go","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
	            						$("#"+taskid).children("rect").css("stroke", "green");
	            					} 
	            				},
	            			})
	            		}
	            	});
          	 	} 
            } 
          ]
        });
	})

</script>

<script>
    var highlight_color = "#000000";
    var upstream_color = "#2020A0";
    var downstream_color = "#0000FF";

    var nodes = [
	  {
		"id": "pprc_go_start", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "开始"
		}
	  },
	  {
		"id": "pprc_go_workdb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份数据库workdb"
		}
	  },
	  {
		"id": "pprc_go_icsdb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份数据库icsdb"
		}
	  },
	  {
		"id": "pprc_go_cardb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份数据库cardb"
		}
	  },
	  {
		"id": "pprc_go_cmisdb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份数据库cmisdb"
		}
	  },
	  {
		"id": "pprc_go_backup_end", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "完成备份"
		}
	  },
	  {
		"id": "pprc_go_p770a2_check_hastatus", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "检查P770a2HA状态"
		}
	  },
	  {
		"id": "pprc_go_p770b2_check_hastatus", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "检查P770b2HA状态"
		}
	  },
	  {
		"id": "pprc_go_p770b1_check_hastatus", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "检查P770b1HA状态"
		}
	  },
	  {
		"id": "pprc_go_p770a1_check_hastatus", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "检查P770a1HA状态"
		}
	  },
	  {
		"id": "pprc_go_p770a2_hastop", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "P770a2主机停止HA"
		}
	  },
	  {
		"id": "pprc_go_p770b2_hastop", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "P770b2主机停止HA"
		}
	  },
	  {
		"id": "pprc_go_p770b1_hastop", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "P770b1主机停止HA"
		}
	  },
	  {
		"id": "pprc_go_p770a1_hastop", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "P770a1主机停止HA"
		}
	  },
	  {
		"id": "pprc_go_ds8k_lunstart", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置DS8K LUN可读写"
		}
	  },
	  {
		"id": "pprc_go_p770c1_lunread", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置p770c1 LUN可读写"
		}
	  }, 
	  {
		"id": "pprc_go_p770c2_lunread", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置p770c2 LUN可读写"
		}
	  }, 
	  {
		"id": "pprc_go_p770c1_workstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "P770c1启动work数据库"
		}
	  }, 
	  {
		"id": "pprc_go_p770c1_cmisstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "p770c1启动cmis数据库"
		}
	  },
	  {
		"id": "pprc_go_p770c2_icsstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "p770c2启动ics数据库"
		}
	  },
	  {
		"id": "pprc_go_p770c2_cardstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "p770c2启动card数据库"
		}
	  }, 
	  {
		"id": "pprc_go_ywcheck", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "业务验证"
		}
	  },
	  {
		"id": "pprc_go_startreplic", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动PPRC复制"
		}
	  }, 
	  {
		"id": "pprc_go_p770c1_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动P770c1复制"
		}
	  }, 
	  {
		"id": "pprc_go_p770c2_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动P770c2复制"
		}
	  },
	  {
		"id": "pprc_go_end", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "结束"
		}
	  }	
	];
	
    var edges = [
	  {
		"u": "pprc_go_p770c1_replicationstart", 
		"v": "pprc_go_end"
	  }, 
	  {
		"u": "pprc_go_startreplic", 
		"v": "pprc_go_p770c1_replicationstart"
	  }, 
	  {
		"u": "pprc_go_ywcheck", 
		"v": "pprc_go_startreplic"
	  }, 
	  {
		"u": "pprc_go_p770c2_cardstart", 
		"v": "pprc_go_ywcheck"
	  }, 
	  {
		"u": "pprc_go_p770c2_icsstart", 
		"v": "pprc_go_p770c2_cardstart"
	  }, 
	  {
		"u": "pprc_go_p770c1_cmisstart", 
		"v": "pprc_go_p770c2_icsstart"
	  }, 
	  {
		"u": "pprc_go_p770c1_workstart", 
		"v": "pprc_go_p770c1_cmisstart"
	  }, 
	  {
		"u": "pprc_go_p770c1_lunread", 
		"v": "pprc_go_p770c1_workstart"
	  }, 
	  {
		"u": "pprc_go_ds8k_lunstart", 
		"v": "pprc_go_p770c1_lunread"
	  }, 
	  {
		"u": "pprc_go_p770a1_hastop", 
		"v": "pprc_go_ds8k_lunstart"
	  }, 
	  {
		"u": "pprc_go_p770b1_hastop", 
		"v": "pprc_go_p770a1_hastop"
	  }, 
	  {
		"u": "pprc_go_p770b2_hastop", 
		"v": "pprc_go_p770b1_hastop"
	  }, 
	  {
		"u": "pprc_go_p770a2_hastop", 
		"v": "pprc_go_p770b2_hastop"
	  }, 
	  {
		"u": "pprc_go_p770a2_check_hastatus", 
		"v": "pprc_go_p770a2_hastop"
	  }, 
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770a2_check_hastatus"
	  }, 
	  {
		"u": "pprc_go_workdb_backup", 
		"v": "pprc_go_backup_end"
	  }, 
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_workdb_backup"
	  }, 
	  {
		"u": "pprc_go_icsdb_backup", 
		"v": "pprc_go_backup_end"
	  }, 
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_icsdb_backup"
	  }, 
	  {
		"u": "pprc_go_cardb_backup", 
		"v": "pprc_go_backup_end"
	  }, 
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_cardb_backup"
	  }, 
	  {
		"u": "pprc_go_cmisdb_backup", 
		"v": "pprc_go_backup_end"
	  }, 
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_cmisdb_backup"
	  }, 
	  {
		"u": "pprc_go_p770b2_check_hastatus", 
		"v": "pprc_go_p770a2_hastop"
	  }, 
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770b2_check_hastatus"
	  }, 
	  {
		"u": "pprc_go_p770b1_check_hastatus", 
		"v": "pprc_go_p770a2_hastop"
	  }, 
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770b1_check_hastatus"
	  }, 
	  {
		"u": "pprc_go_p770a1_check_hastatus", 
		"v": "pprc_go_p770a2_hastop"
	  }, 
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770a1_check_hastatus"
	  }, 
	  {
		"u": "pprc_go_p770c2_lunread", 
		"v": "pprc_go_p770c1_workstart"
	  }, 
	  {
		"u": "pprc_go_ds8k_lunstart", 
		"v": "pprc_go_p770c2_lunread"
	  }, 
	  {
		"u": "pprc_go_p770c2_replicationstart", 
		"v": "pprc_go_end"
	  }, 
	  {
		"u": "pprc_go_startreplic", 
		"v": "pprc_go_p770c2_replicationstart"
	  }
	];
	
    var tasks = {
	  "pprc_go_ywcheck": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_cmisdb_backup": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c1_workstart": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770a2_check_hastatus": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_end": {
		"task_type": "BashOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_cardb_backup": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c1_lunread": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770b2_hastop": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770a2_hastop": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c2_cardstart": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_icsdb_backup": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c2_icsstart": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c1_replicationstart": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c2_lunread": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770b1_check_hastatus": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_start": {
		"task_type": "BashOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770b2_check_hastatus": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c2_replicationstart": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770b1_hastop": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_ds8k_lunstart": {
		"task_type": "BashOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_backup_end": {
		"task_type": "BashOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770a1_check_hastatus": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770c1_cmisstart": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_workdb_backup": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_startreplic": {
		"task_type": "BashOperator", 
		"dag_id": "pprc_go"
	  }, 
	  "pprc_go_p770a1_hastop": {
		"task_type": "PythonOperator", 
		"dag_id": "pprc_go"
	  }
	};
	
    var arrange = "LR";
    var g = dagreD3.json.decode(nodes, edges);
    var layout = dagreD3.layout().rankDir(arrange).nodeSep(15).rankSep(15);
    var renderer = new dagreD3.Renderer();
    renderer.layout(layout).run(g, d3.select("#dig"));
    inject_node_ids(tasks);
    
    
    
    
    
    //update_nodes_states(task_instances);


    function highlight_nodes(nodes, color) {
        nodes.forEach (function (nodeid) {
            my_node = d3.select('#' + nodeid + ' rect');
            my_node.style("stroke", color) ;
        })
    }
/*
    d3.selectAll("g.node").on("mouseover", function(d){
        d3.select(this).selectAll("rect").style("stroke", highlight_color) ;
        highlight_nodes(g.predecessors(d), upstream_color)
        highlight_nodes(g.successors(d), downstream_color)

    });

    d3.selectAll("g.node").on("mouseout", function(d){
        d3.select(this).selectAll("rect").style("stroke", null) ;
        highlight_nodes(g.predecessors(d), null)
        highlight_nodes(g.successors(d), null)
    });   
*/
    $("g.node").tooltip({
      html: true,
      container: "body",
    });

    function inject_node_ids(tasks) {
        $.each(tasks, function(task_id, task) {
            $('tspan').filter(function(index) { return $(this).text() === task_id; })
                    .parent().parent().parent()
                    .attr("id", task_id);
        });
    }
</script>


<script type="text/javascript">
<!-- 这个ajax 是更新实时状态 -->
var dag_id = getUrlParam('dag_id');
var execution_date = getUrlParam('execution_date');
var data ={"dag_id":dag_id,"execution_date":execution_date};

//handleAjax("runningData.do",data,"post");

setInterval(function(){getAjax("runningData.do",data,"post")},3000);
function update_nodes_states(task_instances) {
		$.each(task_instances,function(idx,obj){
            var mynode = d3.select('#' + obj.task_id + ' rect');
            if(obj.state == 'failed') //如果失败
            {
            	var tipcontent ="预计开始时间：" + obj.expected_starttime + "," +
            					"实际开始时间：" + obj.start_Date         + "," +
            					"预计结束时间：" + obj.expected_endtime   + "," + 
            					"实际结束时间：" + obj.end_Date           + "," +
            					"预计持续时间：" + obj.expected_duration  + "," + 
            					"实际持续时间：" + obj.duration           + "," +
            					"任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
                mynode.style("stroke", "red") ;
            }else if (obj.state == 'success') //如果成功
            {
            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
								 "实际开始时间：" + obj.start_Date         + "," +
								 "预计结束时间：" + obj.expected_endtime   + "," + 
								 "实际结束时间：" + obj.end_Date           + "," +
								 "预计持续时间：" + obj.expected_duration  + "," + 
								 "实际持续时间：" + obj.duration           + "," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：成功";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
                 mynode.style("stroke", "green") ;
            }else if (obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'upstream_failed')//未开始
            {
            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
								 "实际开始时间：" + obj.start_Date         + "," +
								 "预计结束时间：" + obj.expected_endtime   + "," + 
								 "实际结束时间：" + obj.end_Date           + "," +
								 "预计持续时间：" + obj.expected_duration  + "," + 
								 "实际持续时间：" + obj.duration           + "," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：未开始";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
            	mynode.style("stroke", "white") ; 
            }else if (obj.state == 'running')
            {
            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
								 "实际开始时间：" + obj.start_Date         + "," +
								 "预计结束时间：" + obj.expected_endtime   + "," + 
								 "实际结束时间：" + obj.end_Date           + "," +
								 "预计持续时间：" + obj.expected_duration  + "," + 
								 "实际持续时间：" + obj.duration           + "," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：运行中";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
            	mynode.style("stroke", "blue") ; 
            }
		})
    }
    
//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
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
				update_nodes_states(resp.dag_tasks)
			}
			else{
				return $.Deferred().reject(resp); // 返回一个失败状态的deferred对象，把错误代码作为默认参数传入之后fail()方法的回调
			}
		}, function(err){
	//失败回调
			console.log(err); // 打印状态码
			});
		}
	handleAjax(url,param,type);
}
</script>

<script type="text/javascript">
<!-- 模态对话框的所有操作方法在这里-->
<%-- $("#btn_log").click(function(){   //查看该失败任务的日志
	var task_id = getTaskID($(this));
	var task_name = getTaskName($(this));
	var execution_date = getUrlParam('execution_date'); //获取url 的值
//	var boolena = confirmMakeSuccess(task_name);
	var data ={"dag_id":"pprc_go","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
		$.ajax({
			url : '<%=path%>/getTaskLog.do',
			data:data,
			type : 'post',
			dataType : 'json',
			success:function(result)
			{
				alert(result.msg);
			},
		})
	
});
 
$("#btn_clear").click(function(){   //将出错任务进行清理
	var task_id = getTaskID($(this));
	var task_name = getTaskName($(this));
	var execution_date = getUrlParam('execution_date'); //获取url 的值
//	var boolena = confirmMakeSuccess(task_name);
	var data ={"dag_id":"pprc_go","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
		$.ajax({
			url : '<%=path%>/makeNodeClear.do',
			data:data,
			type : 'post',
			dataType : 'json',
			success:function(result)
			{
				//alert(result.msg);
			},
		})
	
});

$("#btn_success").click(function(){    //将任务标记位成功的ajax
	var task_id = getTaskID($(this));
	var task_name = getTaskName($(this));
	var execution_date = getUrlParam('execution_date'); //获取url 的值
	swal({ 
	    title: "", 
	    text: "您确定要将任务： '"+task_name+"' 置为成功?", 
	    type: "warning", 
	    showCancelButton: true, 
	    closeOnConfirm: false, 
	    confirmButtonText: "确认",  
	    cancelButtonText: "取消",  
	    confirmButtonColor: "#ec6c62" 
	}, function(isConfirm) { 
		if(isConfirm)
		{
			var data ={"dag_id":"pprc_go","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
						$(".modalframe").modal("hide");
						$("#"+task_id).children("rect").style("stroke", "green");
					} 
				},
			})
		}
	});
}); --%>


function getTaskID(dom) //获取当前模态框的任务id
{
	var reg = new RegExp(",","g");  //将逗号删掉， g代表全局
	var parents1 = $(dom).parents();  //获取父类所有div+id
	var task_id_array = getTagsInfo(parents1);
	var task_id = task_id_array.join(",").replace(reg,""); //将task_id_array 转换为字符串，然后删除,
	return task_id;
}
function getTaskName(dom){ //获取当前模态框的任务中文名
	var text = $(dom).parent().prev().find(".modal-title").text();  //获取标题名称
	return text;
}
function getTagsInfo($doms){   //获取点击按钮的顶层容器的id
    return $doms.map(function(){
        return  this.id ;
    }).get();
}


function confirmMakeSuccess(task_id){
          return confirm("您确定要将任务： '"+task_id+"' 置为成功?");
      }

/* function confirmMakeSuccess(task_id){
     return confirm("您确定要将任务： '"+task_id+"' 置为成功?");
} */ 
 
 $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>
</html>