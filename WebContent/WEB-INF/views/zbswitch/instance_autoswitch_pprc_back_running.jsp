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
	<!-- 模态框（Modal） -->
	<div class="modal fade modalframe" id=""  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<!--header start-->
	<div class="header">
		<jsp:include page="../topnav.jsp" flush="true" />
	</div>
	<!--header end-->
	
	<!--content start-->
	<div class="content">
		<!-- 图例说明 -->
		<div style="height:70px;width:300px;margin-left:10px;">
			<div class="explogo" style="border:2px solid white;position:fixed;">未开始</div>
			<div class="explogo" style="margin-left:75px;border:2px solid #0000ff;position:fixed;">运行中</div>
			<div class="explogo" style="margin-left:150px;border:2px solid #00ff00;position:fixed;">成功</div>
			<div class="explogo" style="margin-left:225px;border:2px solid red;position:fixed;">失败</div>
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
		var arrIdVal = ["pprc_back_start","pprc_back_workdb_backup","pprc_back_icsdb_backup","pprc_back_cardb_backup",
		                "pprc_back_cmisdb_backup","pprc_back_backup_end","pprc_back_p770c2_cardstop",
		                "pprc_back_p770c2_icsstop","pprc_back_p770c1_cmisstop","pprc_back_p770c1_workstop",
		                "pprc_back_ds8k_lunstart","pprc_back_p770a1b1_lunread","pprc_back_p770a2b2_lunread",
		                "pprc_back_ds8k_lunstop","pprc_back_active_vg_start","pprc_back_p770a1_activevg",
		                "pprc_back_p770b1_activevg","pprc_back_p770a2_activevg","pprc_back_p770b2_activevg",
		                "pprc_back_active_vg_end","pprc_back_syncha_start","pprc_back_p770a1_syncHA",
		                "pprc_back_p770a2_syncHA","pprc_back_syncha_stop","pprc_back_p770a1ha_start",
		                "pprc_back_p770b1ha_start","pprc_back_p770a2ha_start","pprc_back_p770b2ha_start",
		                "pprc_back_ywcheck","pprc_back_startreplic","pprc_back_p770a1_replicationstart",
		                "pprc_back_p770a2_replicationstart","pprc_back_end"];		
		var nodelen = $("g.node").length;
		//遍历每个g，赋值id
		for(var i = 0 ; i < nodelen ; i++)
		{
			var idname = arrIdVal[i];
			var datatar = "#" + idname;
			$("g.node").eq(i).attr("id",idname);
			$("g.node").eq(i).attr("data-toggle","modal");
			$("g.node").eq(i).attr("data-target",datatar);
		}
	})
	
	//模态框处理 
	$(document).ready(function(){
		$("g.node").click(function(){
			var nodename = $(this).find("tspan").text();//获取任务中文名
			var nodeid = $(this).attr("id");//获取任务id
			$(".modalframe").attr("id",nodeid);//给模态框动态赋值id
			$("#myModalLabel").text(nodename);//每个模态框获取该任务名 
		});

	})
</script>

<script>
    var highlight_color = "#000000";
    var upstream_color = "#2020A0";
    var downstream_color = "#0000FF";

    var nodes = [
	  {
	    "id": "pprc_back_start", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "备份数据库" 
	    }
	  },
	  {
		    "id": "pprc_back_workdb_backup", 
		    "value": {
		      "style": "fill:#ffefeb;", 
		      "labelStyle": "fill:#000;", 
		      "label": "备份workdb数据库"
		    }
		  },
	  {
	    "id": "pprc_back_icsdb_backup", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "备份icsdb数据库"
	    }
	  },
	  {
	    "id": "pprc_back_cardb_backup", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "备份carddb数据库"
	    }
	  },   
	  {
	    "id": "pprc_back_cmisdb_backup", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "备份cmisdb数据库"
	    }
	  },
	  {
	    "id": "pprc_back_backup_end", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "完成备份" 
	    }
	  }, 
	  {
	    "id": "pprc_back_p770c2_cardstop", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "P770c2停止应用(card)"
	    }
	  },
	  {
	    "id": "pprc_back_p770c2_icsstop", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "P770c2停止应用(ics)"
	    }
	  },
	  {
	    "id": "pprc_back_p770c1_cmisstop", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "P770c1停止应用(cmis)"
	    }
	  }, 
	  {
	    "id": "pprc_back_p770c1_workstop", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "P770c1停止应用(work)"
	    }
	  },
	  {
	    "id": "pprc_back_ds8k_lunstart", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "设置DS8K LUN可读写"
	    }
	  },
	  {
	    "id": "pprc_back_p770a1b1_lunread", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "设置P770a1b1 LUN可读写"
	    }
	  },
	  {
	    "id": "pprc_back_p770a2b2_lunread", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "设置P770a2b2 LUN可读写"
	    }
	  },
	  {
	    "id": "pprc_back_ds8k_lunstop", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "停止DS8K LUN可读写"
	    }
	  },
	  {
	    "id": "pprc_back_active_vg_start", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "开始激活生产主机VG"
	    }
	  },
	  {
	    "id": "pprc_back_p770a1_activevg", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "激活P770a1生产主机VG"
	    }
	  },
	  {
	    "id": "pprc_back_p770b1_activevg", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "激活P770b1生产主机VG"
	    }
	  },  
	  {
	    "id": "pprc_back_p770a2_activevg", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "激活P770a2生产主机VG"
	    }
	  }, 
	  {
	    "id": "pprc_back_p770b2_activevg", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "激活P770b2生产主机VG"
	    }
	  }, 
	  {
	    "id": "pprc_back_active_vg_end", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "结束激活生产主机VG" 
	    }
	  },
	  {
	    "id": "pprc_back_syncha_start", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "同步生产HA" 
	    }
	  },
	  {
	    "id": "pprc_back_p770a1_syncHA", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "同步P770a1 HA"
	    }
	  },
	  {
	    "id": "pprc_back_p770a2_syncHA", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "同步P770a2 HA"
	    }
	  },
	  {
	    "id": "pprc_back_syncha_stop", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "结束同步HA" 
	    }
	  },
	  {
	    "id": "pprc_back_p770a1ha_start", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动P770a1 HA串行"
	    }
	  },
	  {
	    "id": "pprc_back_p770b1ha_start", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动P770b1 HA串行"
	    }
	  },
	  {
	    "id": "pprc_back_p770a2ha_start", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动P770a2 HA串行"
	    }
	  },
	  {
	    "id": "pprc_back_p770b2ha_start", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动P770b2 HA串行"
	    }
	  },
	  {
	    "id": "pprc_back_ywcheck", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "业务验证"
	    }
	  },
	  {
	    "id": "pprc_back_startreplic", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动PPRC复制关系"
	    }
	  },
	  {
	    "id": "pprc_back_p770a1_replicationstart", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动P770a1复制关系"
	    }
	  },
	  {
	    "id": "pprc_back_p770a2_replicationstart", 
	    "value": {
	      "style": "fill:#ffefeb;", 
	      "labelStyle": "fill:#000;", 
	      "label": "启动P770a2复制关系"
	    }
	  },   
	  {
	    "id": "pprc_back_end", 
	    "value": {
	      "style": "fill:#f0ede4;", 
	      "labelStyle": "fill:#000;", 
	      "label": "结束" 
	    }
	  }  
	];
	
    var edges = [
	  {
	    "u": "pprc_back_p770a1_replicationstart", 
	    "v": "pprc_back_end"
	  }, 
	  {
	    "u": "pprc_back_startreplic", 
	    "v": "pprc_back_p770a1_replicationstart"
	  }, 
	  {
	    "u": "pprc_back_ywcheck", 
	    "v": "pprc_back_startreplic"
	  }, 
	  {
	    "u": "pprc_back_p770b2ha_start", 
	    "v": "pprc_back_ywcheck"
	  }, 
	  {
	    "u": "pprc_back_p770a2ha_start", 
	    "v": "pprc_back_p770b2ha_start"
	  }, 
	  {
	    "u": "pprc_back_p770b1ha_start", 
	    "v": "pprc_back_p770a2ha_start"
	  }, 
	  {
	    "u": "pprc_back_p770a1ha_start", 
	    "v": "pprc_back_p770b1ha_start"
	  }, 
	  {
	    "u": "pprc_back_syncha_stop", 
	    "v": "pprc_back_p770a1ha_start"
	  }, 
	  {
	    "u": "pprc_back_p770a1_syncHA", 
	    "v": "pprc_back_syncha_stop"
	  }, 
	  {
	    "u": "pprc_back_syncha_start", 
	    "v": "pprc_back_p770a1_syncHA"
	  }, 
	  {
	    "u": "pprc_back_active_vg_end", 
	    "v": "pprc_back_syncha_start"
	  }, 
	  {
	    "u": "pprc_back_p770a1_activevg", 
	    "v": "pprc_back_active_vg_end"
	  }, 
	  {
	    "u": "pprc_back_active_vg_start", 
	    "v": "pprc_back_p770a1_activevg"
	  }, 
	  {
	    "u": "pprc_back_ds8k_lunstop", 
	    "v": "pprc_back_active_vg_start"
	  }, 
	  {
	    "u": "pprc_back_p770a1b1_lunread", 
	    "v": "pprc_back_ds8k_lunstop"
	  }, 
	  {
	    "u": "pprc_back_ds8k_lunstart", 
	    "v": "pprc_back_p770a1b1_lunread"
	  }, 
	  {
	    "u": "pprc_back_p770c1_workstop", 
	    "v": "pprc_back_ds8k_lunstart"
	  }, 
	  {
	    "u": "pprc_back_p770c1_cmisstop", 
	    "v": "pprc_back_p770c1_workstop"
	  }, 
	  {
	    "u": "pprc_back_p770c2_icsstop", 
	    "v": "pprc_back_p770c1_cmisstop"
	  }, 
	  {
	    "u": "pprc_back_p770c2_cardstop", 
	    "v": "pprc_back_p770c2_icsstop"
	  }, 
	  {
	    "u": "pprc_back_backup_end", 
	    "v": "pprc_back_p770c2_cardstop"
	  }, 
	  {
	    "u": "pprc_back_workdb_backup", 
	    "v": "pprc_back_backup_end"
	  }, 
	  {
	    "u": "pprc_back_start", 
	    "v": "pprc_back_workdb_backup"
	  }, 
	  {
	    "u": "pprc_back_icsdb_backup", 
	    "v": "pprc_back_backup_end"
	  }, 
	  {
	    "u": "pprc_back_start", 
	    "v": "pprc_back_icsdb_backup"
	  }, 
	  {
	    "u": "pprc_back_cardb_backup", 
	    "v": "pprc_back_backup_end"
	  }, 
	  {
	    "u": "pprc_back_start", 
	    "v": "pprc_back_cardb_backup"
	  }, 
	  {
	    "u": "pprc_back_cmisdb_backup", 
	    "v": "pprc_back_backup_end"
	  }, 
	  {
	    "u": "pprc_back_start", 
	    "v": "pprc_back_cmisdb_backup"
	  }, 
	  {
	    "u": "pprc_back_p770a2b2_lunread", 
	    "v": "pprc_back_ds8k_lunstop"
	  }, 
	  {
	    "u": "pprc_back_ds8k_lunstart", 
	    "v": "pprc_back_p770a2b2_lunread"
	  }, 
	  {
	    "u": "pprc_back_p770a2_activevg", 
	    "v": "pprc_back_active_vg_end"
	  }, 
	  {
	    "u": "pprc_back_active_vg_start", 
	    "v": "pprc_back_p770a2_activevg"
	  }, 
	  {
	    "u": "pprc_back_p770b1_activevg", 
	    "v": "pprc_back_active_vg_end"
	  }, 
	  {
	    "u": "pprc_back_active_vg_start", 
	    "v": "pprc_back_p770b1_activevg"
	  }, 
	  {
	    "u": "pprc_back_p770b2_activevg", 
	    "v": "pprc_back_active_vg_end"
	  }, 
	  {
	    "u": "pprc_back_active_vg_start", 
	    "v": "pprc_back_p770b2_activevg"
	  }, 
	  {
	    "u": "pprc_back_p770a2_syncHA", 
	    "v": "pprc_back_syncha_stop"
	  }, 
	  {
	    "u": "pprc_back_syncha_start", 
	    "v": "pprc_back_p770a2_syncHA"
	  }, 
	  {
	    "u": "pprc_back_p770a2_replicationstart", 
	    "v": "pprc_back_end"
	  }, 
	  {
	    "u": "pprc_back_startreplic", 
	    "v": "pprc_back_p770a2_replicationstart"
	  }
	];
	
    var tasks = {
 		"pprc_back_p770a2_syncHA": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_syncha_stop": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_ywcheck": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770c1_cmisstop": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_cmisdb_backup": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770c1_workstop": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a1ha_start": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_ds8k_lunstart": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_ds8k_lunstop": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a1_syncHA": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_backup_end": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770b2ha_start": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_cardb_backup": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_active_vg_start": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_startreplic": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770c2_icsstop": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_end": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a1b1_lunread": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a1_replicationstart": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a2b2_lunread": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_active_vg_end": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_workdb_backup": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_start": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_icsdb_backup": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a2ha_start": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_syncha_start": {
 		    "task_type": "BashOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a2_activevg": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770b2_activevg": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770b1ha_start": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770b1_activevg": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770c2_cardstop": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a1_activevg": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }, 
 		  "pprc_back_p770a2_replicationstart": {
 		    "task_type": "PythonOperator", 
 		    "dag_id": "pprc_back"
 		  }
	};
	
    var arrange = "LR";
    var g = dagreD3.json.decode(nodes, edges);
    var layout = dagreD3.layout().rankDir(arrange).nodeSep(15).rankSep(15);
    var renderer = new dagreD3.Renderer();
    renderer.layout(layout).run(g, d3.select("#dig"));
    inject_node_ids(tasks);

    function highlight_nodes(nodes, color) {
        nodes.forEach (function (nodeid) {
            my_node = d3.select('#' + nodeid + ' rect');
            my_node.style("stroke", color) ;
        })
    }

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
            }else if (obj.state == 'skipped' || obj.state == 'undefined')//未开始
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
$("#btn_log").click(function(){   //查看该失败任务的日志
	var task_id = getTaskID($(this));
	var task_name = getTaskName($(this));
	var execution_date = getUrlParam('execution_date'); //获取url 的值
	var data ={"dag_id":"pprc_back","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
	var data ={"dag_id":"pprc_back","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
			var data ={"dag_id":"pprc_back","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
});

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

function confirmMakeSuccess(task_id)
{
    return confirm("您确定要将任务： '"+task_id+"' 置为成功?");
}
 
 $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>
</html>