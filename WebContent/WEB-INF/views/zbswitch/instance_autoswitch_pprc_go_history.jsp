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
.select2-container{
	vertical-align: middle;
}
.select2-container .select2-choice{
	height:35px;
}
.select2-container .select2-choice span{
	line-height:30px;
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
		<jsp:include page="../topnav.jsp" flush="true" /> 
	</div>
	<!--header end-->
	
	<!--content start-->
	<div class="content">
		<div style="margin:20px auto;width:320px;height:70px;line-height:70px;">
			<select id="hisdatetime" style="display:inline;width:200px;">
				<option value="${execution_date}">${execution_date}</option>
			</select>
			<span style="margin-right: 5px;">&nbsp;&nbsp;&nbsp;</span>
			<button id="showlog" class="btn btn-sm" style="background-color: #3399CC;border:1px solid #bbb;">
				<font color="white">查看历史</font>
			</button>
		</div>
	
		<div style="float:left;font-size:14px;margin-top:5px;margin-left:20px;">
			<span><b>切换场景名：</b></span>
			<span>PPRC+LVM 切换</span>
		</div>
		
		<div id="svg_container" style="margin-left:10px;margin-right:10px;"> 
			<svg width="100%" style="height:70vh">
				<g id='dig' transform="translate(20,50)"/>  
			</svg>
		</div>
	</div>
</body>


<script>
    //给每个g添加id
	$(document).ready(function(){
		//定义一个数组存放所有id值
		var arrIdVal = ["pprc_go_start","pprc_go_workdb_backup","pprc_go_icsdb_backup","pprc_go_cardb_backup","pprc_go_cmisdb_backup","pprc_go_backup_end",
						"pprc_go_p770a2_check_hastatus","pprc_go_p770b2_check_hastatus",
						"pprc_go_p770b1_check_hastatus","pprc_go_p770a1_check_hastatus","pprc_go_checkha_stop",
						"pprc_go_p770a2_hastop","pprc_go_p770b2_hastop","pprc_go_p770a1_hastop","pprc_go_p770b1_hastop",
						"pprc_go_ds8k_lunstart",
						"pprc_go_p770a1_lunread_suspend","pprc_go_p770b1_lunread_suspend",
						"pprc_go_p770a2_lunread_suspend","pprc_go_p770b2_lunread_suspend",
						"pprc_go_p770a1_lunread_recover","pprc_go_p770b1_lunread_recover",
						"pprc_go_p770a2_lunread_recover","pprc_go_p770b2_lunread_recover","pprc_go_ds8k_lunstop",
						"pprc_go_p770c1_workstart","pprc_go_p770c1_cmisstart","pprc_go_p770c2_icsstart","pprc_go_p770c2_cardstart",
						"pprc_go_ywcheck","pprc_go_startreplic",
						"pprc_go_p770a1_enable_copy_replicationstart","pprc_go_p770b1_enable_copy_replicationstart",
						"pprc_go_p770a2_enable_copy_replicationstart","pprc_go_p770b2_enable_copy_replicationstart",
						"pprc_go_p770a1_replicationstart","pprc_go_p770b1_replicationstart",
						"pprc_go_p770a2_replicationstart","pprc_go_p770b2_replicationstart","pprc_go_end"];		
		var nodelen = $("g.node").length;
		//遍历每个g，赋值id
		for(var i = 0 ; i < nodelen ; i++)
		{
			var idname = arrIdVal[i];
			$("g.node").eq(i).attr("id",idname);
		}
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
		  "label": "备份数据库" 
		}
	  },
	  {
		"id": "pprc_go_workdb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份workdb数据库"
		}
	  },
	  {
		"id": "pprc_go_icsdb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份icsdb数据库"
		}
	  },
	  {
		"id": "pprc_go_cardb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份cardb数据库"
		}
	  },
	  {
		"id": "pprc_go_cmisdb_backup", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份cmisdb数据库"
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
		"id": "pprc_go_checkha_stop", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "完成检查HA状态" 
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
		"id": "pprc_go_p770a1_hastop", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "P770a1主机停止HA"
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
		"id": "pprc_go_ds8k_lunstart", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置DS8K LUN可读写"
		}
	  }, 
	  {
		"id": "pprc_go_p770a1_lunread_suspend", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c1上P770a1 LUN可读写挂起"
		}
	  },
	  {
		"id": "pprc_go_p770b1_lunread_suspend", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c1上P770b1 LUN可读写挂起"
		}
	  },
	  {
		"id": "pprc_go_p770a2_lunread_suspend", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c2上P770a2 LUN可读写挂起"
		}
	  },
	  {
		"id": "pprc_go_p770b2_lunread_suspend", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c2上P770b2 LUN可读写挂起"
		}
	  },
	  {
		"id": "pprc_go_p770a1_lunread_recover", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c1上P770a1 LUN可读写恢复" 
		}
	  },
	  {
		"id": "pprc_go_p770b1_lunread_recover", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c1上P770b1 LUN可读写恢复" 
		}
	  },
	  {
		"id": "pprc_go_p770a2_lunread_recover", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c2上P770a2 LUN可读写恢复" 
		}
	  },
	  {
		"id": "pprc_go_p770b2_lunread_recover", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "设置P770c2上P770b2 LUN可读写恢复" 
		}
	  },
	  {
		"id": "pprc_go_ds8k_lunstop", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "完成设置DS8K LUN可读写"
		}
	  },
	  {
		"id": "pprc_go_p770c1_workstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "启动P770c1 work应用" 
		}
	  }, 
	  {
		"id": "pprc_go_p770c1_cmisstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "启动P770c1 cmis应用"
		}
	  },
	  {
		"id": "pprc_go_p770c2_icsstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "启动P770c2 ics应用"
		}
	  },
	  {
		"id": "pprc_go_p770c2_cardstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "启动P770c2 card应用" 
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
		  "label": "反向启动PPRC H2:H1复制关系" 
		}
	  }, 
	  {
		"id": "pprc_go_p770a1_enable_copy_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "确认反向启动P770c1上P770a1复制关系" 
		}
	  },
	  {
		"id": "pprc_go_p770b1_enable_copy_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "确认反向启动P770c1上P770b1复制关系" 
		}
	  },
	  {
		"id": "pprc_go_p770a2_enable_copy_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "确认反向启动P770c2上P770a2复制关系" 
		}
	  },
	  {
		"id": "pprc_go_p770b2_enable_copy_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "确认反向启动P770c2上P770b2复制关系" 
		}
	  },
	  {
		"id": "pprc_go_p770a1_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动P770c1上P770a1复制关系"
		}
	  },
	  {
		"id": "pprc_go_p770b1_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动P770c1上P770b1复制关系"
		}
	  },
	  {
		"id": "pprc_go_p770a2_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动P770c2上P770a2复制关系"
		}
	  },
	  {
		"id": "pprc_go_p770b2_replicationstart", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "反向启动P770c2上P770b2复制关系"
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
		"u": "pprc_go_start", 
		"v": "pprc_go_workdb_backup"
	  },
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_icsdb_backup"
	  },
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_cardb_backup"
	  },
	  {
		"u": "pprc_go_start", 
		"v": "pprc_go_cmisdb_backup"
	  },
	  {
		"u": "pprc_go_workdb_backup", 
		"v": "pprc_go_backup_end"
	  },
	  {
		"u": "pprc_go_icsdb_backup", 
		"v": "pprc_go_backup_end"
	  },
	  {
		"u": "pprc_go_cardb_backup", 
		"v": "pprc_go_backup_end"
	  },
	  {
		"u": "pprc_go_cmisdb_backup", 
		"v": "pprc_go_backup_end"
	  },
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770a2_check_hastatus"
	  }, 
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770b2_check_hastatus"
	  },
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770b1_check_hastatus"
	  },
	  {
		"u": "pprc_go_backup_end", 
		"v": "pprc_go_p770a1_check_hastatus"
	  },
	  {
		"u": "pprc_go_p770a2_check_hastatus", 
		"v": "pprc_go_checkha_stop"
	  },
	  {
		"u": "pprc_go_p770b2_check_hastatus", 
		"v": "pprc_go_checkha_stop"
	  },
	  {
		"u": "pprc_go_p770b1_check_hastatus", 
		"v": "pprc_go_checkha_stop"
	  },
	  {
		"u": "pprc_go_p770a1_check_hastatus", 
		"v": "pprc_go_checkha_stop"
	  },
	  {
		 "u":"pprc_go_checkha_stop",
		 "v":"pprc_go_p770a2_hastop"
	  },
	  {
		"u": "pprc_go_p770a2_hastop", 
		"v": "pprc_go_p770b2_hastop"
	  },
	  {
		"u": "pprc_go_p770b2_hastop", 
		"v": "pprc_go_p770a1_hastop"
	  },
	  {
		"u": "pprc_go_p770a1_hastop", 
		"v": "pprc_go_p770b1_hastop"
	  },
	  {
		"u": "pprc_go_p770b1_hastop", 
		"v": "pprc_go_ds8k_lunstart"
	  },
	  {
		"u": "pprc_go_ds8k_lunstart", 
		"v": "pprc_go_p770a1_lunread_suspend"
	  }, 
	  {
		"u": "pprc_go_ds8k_lunstart", 
		"v": "pprc_go_p770b1_lunread_suspend"
	  },
	  {
		"u": "pprc_go_ds8k_lunstart", 
		"v": "pprc_go_p770a2_lunread_suspend"
	  },
	  {
		"u": "pprc_go_ds8k_lunstart", 
		"v": "pprc_go_p770b2_lunread_suspend"
	  },
	  {
		"u":"pprc_go_p770a1_lunread_suspend",
		"v":"pprc_go_p770a1_lunread_recover"
	  },
	  {
		"u":"pprc_go_p770b1_lunread_suspend",
		"v":"pprc_go_p770b1_lunread_recover"
	  },
	  {
		"u":"pprc_go_p770a2_lunread_suspend",
		"v":"pprc_go_p770a2_lunread_recover"  
	  },
	  {
		"u":"pprc_go_p770b2_lunread_suspend",
		"v":"pprc_go_p770b2_lunread_recover"  
	  },
	  {
		"u":"pprc_go_p770a1_lunread_recover",
		"v":"pprc_go_ds8k_lunstop"
	  },
	  {
		"u":"pprc_go_p770b1_lunread_recover",
		"v":"pprc_go_ds8k_lunstop"
	  },
	  {
		"u":"pprc_go_p770a2_lunread_recover",
		"v":"pprc_go_ds8k_lunstop"
	  },
	  {
		"u":"pprc_go_p770b2_lunread_recover",
		"v":"pprc_go_ds8k_lunstop"
	  },
	  {
		 "u":"pprc_go_ds8k_lunstop",
		 "v":"pprc_go_p770c1_workstart"
	  },
	  {
		"u": "pprc_go_p770c1_workstart", 
		"v": "pprc_go_p770c1_cmisstart"
	  },
	  {
		"u": "pprc_go_p770c1_cmisstart", 
		"v": "pprc_go_p770c2_icsstart"
	  },
	  {
		"u": "pprc_go_p770c2_icsstart", 
		"v": "pprc_go_p770c2_cardstart"
	  },
	  {
		"u": "pprc_go_p770c2_cardstart", 
		"v": "pprc_go_ywcheck"
	  },
	  {
		"u": "pprc_go_ywcheck", 
		"v": "pprc_go_startreplic"
	  },
	  {
		"u": "pprc_go_startreplic", 
		"v": "pprc_go_p770a1_enable_copy_replicationstart"
	  },
	  {
		"u": "pprc_go_startreplic", 
		"v": "pprc_go_p770b1_enable_copy_replicationstart"
	  },
	  {
		"u": "pprc_go_startreplic", 
		"v": "pprc_go_p770a2_enable_copy_replicationstart"
	  },
	  {
		"u": "pprc_go_startreplic", 
		"v": "pprc_go_p770b2_enable_copy_replicationstart"
	  },
	  {
		 "u":"pprc_go_p770a1_enable_copy_replicationstart",
		 "v":"pprc_go_p770a1_replicationstart"
	  },
	  {
		 "u":"pprc_go_p770b1_enable_copy_replicationstart",
		 "v":"pprc_go_p770b1_replicationstart"
	  },
	  {
		 "u":"pprc_go_p770a2_enable_copy_replicationstart",
		 "v":"pprc_go_p770a2_replicationstart"
	  },
	  {
		 "u":"pprc_go_p770b2_enable_copy_replicationstart",
		 "v":"pprc_go_p770b2_replicationstart"
	  },
	  {
		"u": "pprc_go_p770a1_replicationstart", 
		"v": "pprc_go_end"
	  },                    
	  {
		"u": "pprc_go_p770b1_replicationstart", 
		"v": "pprc_go_end"
	  },
	  {
		"u": "pprc_go_p770a2_replicationstart", 
		"v": "pprc_go_end"
	  },
	  {
		"u": "pprc_go_p770b2_replicationstart", 
		"v": "pprc_go_end"
	  }
	];
	
    var tasks = {
   		"pprc_go_start": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		}, 
   	    "pprc_go_workdb_backup": {
   	    	"task_type": "PythonOperator", 
   	    	"dag_id": "pprc_go"
   	    }, 
   		"pprc_go_icsdb_backup": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		}, 
   	    "pprc_go_cardb_backup": {
   	    	"task_type": "PythonOperator", 
   	    	"dag_id": "pprc_go"
   	    }, 
   	    "pprc_go_cmisdb_backup": {
   	    	"task_type": "BashOperator", 
   	    	"dag_id": "pprc_go"
   	    }, 
   	    "pprc_go_backup_end": {
   	    	"task_type": "PythonOperator", 
   	    	"dag_id": "pprc_go"
   	    }, 
   		  "pprc_go_p770a2_check_hastatus": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770b2_check_hastatus": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770b1_check_hastatus": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770a1_check_hastatus": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_checkha_stop": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770a2_hastop": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  },  
   		  "pprc_go_p770b2_hastop": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770a1_hastop": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770b1_hastop": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_ds8k_lunstart": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770a1_lunread_suspend": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770b1_lunread_suspend": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770a2_lunread_suspend": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770b2_lunread_suspend": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770a1_lunread_recover": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770b1_lunread_recover": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770a2_lunread_recover": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770b2_lunread_recover": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_ds8k_lunstop": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770c1_workstart": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  },
   		  "pprc_go_p770c1_cmisstart": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770c2_icsstart": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770c2_cardstart": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_ywcheck": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_startreplic": {
   			"task_type": "BashOperator", 
   			"dag_id": "pprc_go"
   		  }, 
   		  "pprc_go_p770a1_enable_copy_replicationstart": {
   			"task_type": "PythonOperator", 
   			"dag_id": "pprc_go"
   		  },
   	  	  "pprc_go_p770b1_enable_copy_replicationstart": {
   	  		"task_type": "PythonOperator", 
   	  		"dag_id": "pprc_go"
   	  	  },
   	 	  "pprc_go_p770a2_enable_copy_replicationstart": {
   	  		"task_type": "PythonOperator", 
   	  		"dag_id": "pprc_go"
   	  	  },
   	      "pprc_go_p770b2_enable_copy_replicationstart": {
   	   		"task_type": "PythonOperator", 
   	   		"dag_id": "pprc_go"
   	   	  },
   	   	 "pprc_go_p770a1_replicationstart": {
   	   		"task_type": "PythonOperator", 
   	   		"dag_id": "pprc_go"
   	   	  },
   	   	  "pprc_go_p770b1_replicationstart": {
   	   		"task_type": "PythonOperator", 
   	   		"dag_id": "pprc_go"
   	   	  },
   	   	  "pprc_go_p770a2_replicationstart": {
   	   		"task_type": "PythonOperator", 
   	   		"dag_id": "pprc_go"
   	   	  },
   	      "pprc_go_p770b2_replicationstart": {
   	   		"task_type": "PythonOperator", 
   	   		"dag_id": "pprc_go"
   	   	  },
   	   	  "pprc_go_end": {
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
//模态框处理 
$(document).ready(function(){
	$("g.node").click(function(){
		//var nodename = $(this).find("tspan").text();//获取任务中文名
		var task_id = $(this).attr("id");//获取任务id
		var execution_date = getUrlParam('execution_date'); //获取url 的值
		var data ={"dag_id":"pprc_go","task_id":task_id,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
		var ajaxTimeoutTest = $.ajax({
			url : '<%=path%>/getTaskLog.do',
			data:data,
			type : 'post',
			dataType : 'json',
			timeout:5000,
			success:function(result)
			{
				alert(result.msg);
			},
			complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
				if(status == 'timeout')
				{
					 ajaxTimeoutTest.abort();
					 alert("超时");
				}
			}
		})
	});

})
//handleAjax("runningData.do",data,"post");
//setInterval(function(){getAjax("historyData.do",data,"post")},3000);
function update_nodes_states(task_instances) {
		$.each(task_instances,function(idx,obj){
            var mynode = d3.select('#' + obj.task_id + ' rect');
            if(obj.state == 'failed') //如果失败
            {
            	var tipcontent ="预计开始时间：" + obj.expected_starttime + "," +
            					"实际开始时间：" + obj.start_Date         + "," +
            					"预计结束时间：" + obj.expected_endtime   + "," + 
            					"实际结束时间：" + obj.end_Date           + "," +
            					"预计持续时间：" + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
            					"实际持续时间：" + obj.duration           + "&nbsp;&nbsp;秒," +
            					"任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
                mynode.style("stroke", "#FF4500") ;
            }else if (obj.state == 'success') //如果成功
            {
            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
								 "实际开始时间：" + obj.start_Date         + "," +
								 "预计结束时间：" + obj.expected_endtime   + "," + 
								 "实际结束时间：" + obj.end_Date           + "," +
								 "预计持续时间：" + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
								 "实际持续时间：" + obj.duration           + "&nbsp;&nbsp;秒," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：成功";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
                 mynode.style("stroke", "#32CD32") ;
            }else if (obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'upstream_failed')//未开始
            {
            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
								 "实际开始时间：" + obj.start_Date         + "," +
								 "预计结束时间：" + obj.expected_endtime   + "," + 
								 "实际结束时间：" + obj.end_Date           + "," +
								 "预计持续时间：" + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
								 "实际持续时间：" + obj.duration           + "&nbsp;&nbsp;秒," +
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
								 "预计持续时间：" + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
								 "实际持续时间：" + obj.duration           + "&nbsp;&nbsp;秒," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：运行中";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
            	mynode.style("stroke", "#3399CC") ; 
            }else if (obj.state == 'done') //如果处于做完待确认的状态
            {
            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
								 "实际开始时间：" + obj.start_Date         + "," +
								 "预计结束时间：" + obj.expected_endtime   + "," + 
								 "实际结束时间：" + obj.end_Date           + "," +
								 "预计持续时间：" + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
								 "实际持续时间：" + obj.duration           + "&nbsp;&nbsp;秒," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认";
                var format_content = tipcontent.split(",").join("<br>");
                $("#"+obj.task_id).attr("data-original-title",format_content); 
                 mynode.style("stroke", "#FF8C00") ;
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
$(document).ready(function(){
	//更新最新一次的流程跑跑的数据
	getAjax("historyData.do",data,"post");
	//更新下拉框的日期数据
	getDagHisRecord("historyDatatime.do",data,"get");
});

function getDagHisRecord(url,param,type){
	 $.ajax({
	        timeout: 3000,
	        async: false,
	        url: url,
	        dataType: "json",
	        data: param || {},
	        type: type || 'GET',
	        cache:false,
	        success: function (data) {
	        	var array = data.dag_hisdatetime;
	        	for (var i = 0; i < array.length; i++) {
                $("#hisdatetime").append("<option>" + array[i] + "</option>");
	            } 
	        }
	    });
}

//查看历史操作
$("#showlog").click(function(){
		//首先获取下拉框的值
		var curDatetime = $("#hisdatetime").val();
		curdata={"dag_id":"pprc_go","execution_date":curDatetime};
		getAjax("historyData.do",curdata,"post");
		
	})

</script>
</html>