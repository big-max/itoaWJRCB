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
<jsp:include page="header3.jsp" flush="true" />  
<title>自动化部署平台</title>
<style type="text/css">
body{margin:0;padding:0;}
.content {
	position:relative;
	float:right;
	/* width:calc(100% - 57px); */
	 width:100%;
	margin:0px;
	/* height:calc(100vh - 70px); */
	height:100%;
	overflow-y:scroll;
	background-color:#F5F3F4;
}
.explogo{
	float:right;
	width:70px;
	height:40px;
	background-color:rgb(255,0,0);
	border-radius:10px;
	text-align:center;
	line-height:35px;
	font-size:14px;
}
</style>
<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
</head>

<body>
	<!--header start-->
	<div class="header">
		<%--  <jsp:include page="topleft_close.jsp" flush="true" /> --%>
	</div>
	<!--header end-->
	
	<!--content start-->
	<div class="content">
		<div style="margin:20px auto;width:320px;">
			<select style="display:inline;width:200px;">
				<option value="">2017-09-18 15:20:30</option>
				<option value="">2017-09-17 15:20:30</option>
				<option value="">2017-09-16 15:20:30</option>
			</select>
			<span style="margin-right: 5px;">&nbsp;&nbsp;&nbsp;</span>
			<button class="btn btn-sm" style="background-color: #448FC8;">
				<font color="white">查看历史</font>
			</button>
		</div>
	
		<div style="float:left;font-size:14px;margin-top:5px;margin-left:20px;">
			<span><b>流程名：</b></span>
			<span>pprc</span>
			<span style="margin-right: 5px;">&nbsp;&nbsp;&nbsp;</span>
			<span><b>责任人：</b></span>
			<span>root</span>
			<span style="margin-right: 5px;">&nbsp;&nbsp;&nbsp;</span>
			<span><b>运行时间：</b></span>
			<span>2017-09-18 13:23:20</span>
		</div>
		<!-- 图例说明 -->
		<div class="explogo" style="margin-right:10px;margin-top:5px;border:2px solid red;">
			<font color="white">超时任务</font>
		</div>
		
		<div id="svg_container" style="margin-left:10px;">
			<svg width="100%" height="350">
				<g id='dig' transform="translate(20,50)"/>  
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
			$("g.node").eq(i).attr("id",idname);
		}
	})
	
	$(document).ready(function(){
		var virstrtime = "xxxxxxxx"; //预计开始时间
		var virendtime = "xxxxxxxx"; //预计结束时间
		var virdurtime = "xxxxxxxx"; //预计持续时间
		var relstrtime = "xxxxxxxx"; //实际开始时间
		var relendtime = "xxxxxxxx"; //实际结束时间
		var reldurtime = "xxxxxxxx"; //实际持续时间
		var taskstatus = "success"; //任务状态
		
		var tipcontent = "预计开始时间："+virstrtime+","+"预计结束时间："+virendtime+","+"预计持续时间："+virdurtime+","+
						 "实际开始时间："+relstrtime+","+"实际结束时间："+relendtime+","+"实际持续时间："+reldurtime+","+
						 "任务状态："+taskstatus;
		var newvalue = tipcontent.split(",").join("<br>");
		$("#pprc_go_workdb_backup").attr("data-original-title",newvalue);
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
	
    var task_instances = {
	  "pprc_go_workdb_backup": {
		"hostname": "automas", 
		"task_id": "pprc_go_workdb_backup", 
		"end_date": "2017-09-11T15:04:20.701897", 
		"execution_date": "2017-09-11T00:00:00", 
		"queued_dttm": "2017-09-11T15:03:59.773084", 
		"job_id": 4, 
		"try_number": 1, 
		"queue": "default", 
		"operator": "PythonOperator", 
		"state": "failed", 
		"pool": null, 
		"duration": 8.6541, 
		"priority_weight": 22, 
		"start_date": "2017-09-11T15:04:12.047795", 
		"dag_id": "pprc_go", 
		"unixname": "root"
	  }
	};
    
    var arrange = "LR";
    var g = dagreD3.json.decode(nodes, edges);
    var layout = dagreD3.layout().rankDir(arrange).nodeSep(15).rankSep(15);
    var renderer = new dagreD3.Renderer();
    renderer.layout(layout).run(g, d3.select("#dig"));
    inject_node_ids(tasks);
    update_nodes_states(task_instances);


    function highlight_nodes(nodes, color) {
        nodes.forEach (function (nodeid) {
            my_node = d3.select('#' + nodeid + ' rect');
            my_node.style("stroke", color) ;
        })
    }

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

    // Assigning css classes based on state to nodes
    function update_nodes_states(task_instances) {
        $.each(task_instances, function(task_id, ti) {
          $('tspan').filter(function(index) { return $(this).text() === task_id; })
            .parent().parent().parent()
            .attr("class", "node enter " + ti.state)
            .attr("data-toggle", "tooltip")
            .attr("data-original-title", function(d) {
              // Tooltip
              task = tasks[task_id];
              tt =  "Task_id: " + ti.task_id + "<br>";
              tt += "Run: " + ti.execution_date + "<br>";
              if(ti.run_id != undefined){
                tt += "run_id: <nobr>" + ti.run_id + "</nobr><br>";
              }
              tt += "Operator: " + task.task_type + "<br>";
              tt += "Started: " + ti.start_date + "<br>";
              tt += "Ended: " + ti.end_date + "<br>";
              tt += "Duration: " + ti.duration + "<br>";
              tt += "State: " + ti.state + "<br>";
              return tt;
            });
        });
    }
</script>
</html>