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
			<svg width="100%" height="450">
				<g id='dig' transform="translate(20,60)"/>  
			</svg>
		</div>
	</div>
</body>


<script>
    //给每个g添加id
	$(document).ready(function(){
		//定义一个数组存放所有id值
		var arrIdVal = ["5600501502","5600701","5555","55pj","5600702","5556"];		
		var nodelen = $("g.node").length;
		//遍历每个g，赋值id
		for(var i = 0 ; i < nodelen ; i++)
		{
			var idname = arrIdVal[i];
			var datatar = "#" + idname;
			$("g.node").eq(i).attr("id",idname);
			$("g.node").eq(i).attr("data-toggle","modal");
		}
	})
	
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
            		var data ={"dag_id":"wjrz","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
	            	var data ={"dag_id":"wjrz","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
	            			var data ={"dag_id":"wjrz","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
       "id": "5600501502", 
       "value": {
        	"style": "fill:#f0ede4;", 
        	"labelStyle": "fill:#000;", 
        	"label": "检查机构和操作员"
        }
    },
    {
       "id": "5600701", 
       "value": {
           "style": "fill:#ffefeb;", 
           "labelStyle": "fill:#000;", 
           "label": "信贷日终前flashcopy"
       }
    },
    {
       "id": "5555", 
       "value": {
           "style": "fill:#ffefeb;", 
           "labelStyle": "fill:#000;", 
           "label": "comstar发往核心记账(5555)"
       }
    },
    {
       "id": "55pj", 
       "value": {
           "style": "fill:#ffefeb;", 
           "labelStyle": "fill:#000;", 
           "label": "票据日终"
       }
    },
    {
       "id": "5556", 
       "value": {
           "style": "fill:#ffefeb;", 
           "labelStyle": "fill:#000;", 
           "label": "comstar发往核心对账(5556)"
       }
    },
    {
		"id": "5600702", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷日终前备份"
		}
	},
	{
		"id": "5600706", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷备份检查"
		}
	},
	{
		"id": "5524_1", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷cmis日终处理"
		}
	},
	{
		"id": "5511", 
		"value": {
		  "style": "fill:#f0ede4;", 
		  "labelStyle": "fill:#000;", 
		  "label": "日终周期开始"
		}
	},
	{
		"id": "5600801", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "flashcopy后台及ics"
		}
	},
	{
		"id": "5524_2", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷cmis日终处理"
		}
	 },
	 {
		"id": "5600802", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "日终前数据库备份"
		}
	 },
	 {
		"id": "5600703", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷日终后flashcopy"
		}
	 },
	 {
		"id": "5600704", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷日终后备份"
		}
	 },
	 {
		"id": "5600706_copy", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷备份检查"
		}
	 },
	 {
		"id": "5600705", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "信贷数据库导表"
		}
	 },
	 {
		"id": "5600806", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份检查"
		}
	 },
	 {
		"id": "5512", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "日终账务处理"
		}
	 },
	 {
		"id": "7971", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "贷记卡生成清算数据"
		}
	 },
	 {
		"id": "7972", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "贷记卡约定还款"
		}
	 },
	 {
		"id": "5513", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "存款每日计提"
		}
	 },
	 {
		"id": "55dj1", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "当前登录操作员-开始跑批"
		}
	 },
	 {
		"id": "55dj2", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "批量文件导入"
		}
	 },
	 {
		"id": "55dj3", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "批量启动菜单"
		}
	 },
	 {
		"id": "55dj4", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "批量执行结果"
		}
	 },
	 {
		"id": "55dj5", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "批量文件传出"
		}
	 },
	 {
		"id": "5514", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "日终平衡入账"
		}
	 },
	 {
		"id": "5501", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "系统日切"
		}
	 },
	 {
		"id": "5502", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "系统日启"
		}
	 },
	 {
		"id": "5515", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "日终周期结束"
		}
	 },
	 {
		"id": "5600801_copy", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "flashcopy后台及ics"
		}
	 },
	 {
		"id": "5528_1", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "work数据采集"
		}
	 },
	 {
		"id": "5528_2", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "总账数据迁移"
		}
	 },
	 {
		"id": "5528_3", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "VAT供数"
		}
	 },
	 {
		"id": "5506", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "卸载数据至数据中心"
		}
	 },
	 {
		"id": "5600601", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "清空ics日志表"
		}
	 },
	 {
		"id": "5600803", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "日终后数据库备份"
		}
	 },
	 {
		"id": "5600806_copy", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "备份检查"
		}
	 },
	 {
		"id": "5600503", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "检查workdb日志"
		}
	 },
	 {
		"id": "5600805", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "后台及ics数据库导表"
		}
	 },
	 {
		"id": "55vat1", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "查看导数结果"
		}
	 },
	 {
		"id": "55vat2", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "VAT日终跑批"
		}
	 },
	 {
		"id": "55vat3", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "查看VAT日终结果"
		}
	 },
	 {
		"id": "55ebs", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "提交总控主程序"
		}
	 },
	 {
		"id": "5525", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "数据中心日终"
		}
	 },
	 {
		"id": "7973", 
		"value": {
		  "style": "fill:#ffefeb;", 
		  "labelStyle": "fill:#000;", 
		  "label": "贷记卡导入科目明细"
		}
	 }
 ];
           	
 var edges = [  
 {
	 "u": "5600702", 
	 "v": "5600706"
 },
 {
	 "u":"5506",
	 "v":"5525"
 },
 {
	 "u":"5506",
	 "v":"7973"
 },
 {
	 "u":"5528_2",
	 "v":"55ebs"
 },
 {
	 "u":"5528_3",
	 "v":"55vat1"
 },
 {
	 "u":"55vat1",
	 "v":"55vat2"
 },
 {
	 "u":"55vat2",
	 "v":"55vat3"
 },
 {
	 "u":"5600801_copy",
	 "v":"5600601"
 },
 {
	 "u":"5600601",
	 "v":"5600803"
 },
 {
	 "u":"5600803",
	 "v":"5600806_copy"
 },
 {
	 "u":"5600806_copy",
	 "v":"5600503"
 },
 {
	 "u":"5600503",
	 "v":"5600805"
 },
 {
	 "u":"5515",
	 "v":"5600801_copy"
 },
 {
	 "u":"5515",
	 "v":"5528_1"
 },
 {
	 "u":"5515",
	 "v":"5528_2"
 },
 {
	 "u":"5515",
	 "v":"5528_3"
 },
 {
	 "u":"5515",
	 "v":"5506"
 },
 {
	 "u":"5502",
	 "v":"5515"
 },
 {
	 "u":"5514",
	 "v":"5501"
 },
 {
	 "u":"5501",
	 "v":"5502"
 },
 {
	 "u":"5513",
	 "v":"5514"
 },
 {
	 "u":"55dj1",
	 "v":"55dj2"
 },
 {
	 "u":"55dj2",
	 "v":"55dj3"
 },
 {
	 "u":"55dj3",
	 "v":"55dj4"
 },
 {
	 "u":"55dj4",
	 "v":"55dj5"
 },
 {
	 "u":"7972",
	 "v":"5513"
 },
 {
	 "u":"7972",
	 "v":"55dj1"
 },
 {
	 "u":"7971",
	 "v":"7972"
 },
 {
	 "u":"5512",
	 "v":"7971"
 },
 {
	 "u":"5600806",
	 "v":"5512"
 },
 {
	 "u":"5600802",
	 "v":"5600806"
 },
 {
	 "u":"5600706_copy",
	 "v":"5600705"
 },
 {
	 "u":"5600704",
	 "v":"5600706_copy"
 },
 {
	 "u":"5600703",
	 "v":"5600704"
 },
 {
	 "u":"5524_2",
	 "v":"5600703"
 },
 {
	 "u":"5600801",
	 "v":"5524_2"
 },
 {
	 "u":"5600801",
	 "v":"5600802"
 },
 {
	 "u":"5511",
	 "v":"5600801"
 },
 {
	 "u":"5524_1",
	 "v":"5511"
 },
 {
	 "u":"5556",
	 "v":"5511"
 },
 {
	 "u":"55pj",
	 "v":"5511"
 },
 {
	 "u":"5600706",
	 "v":"5524_1"
 },
 {
    "u": "5600501502", 
    "v": "5600701"
 }, 
 {
    "u": "5600501502", 
    "v": "5555"
 },
 {
    "u": "5600501502", 
    "v": "55pj"
 },
 {
    "u": "5555", 
    "v": "5556"
 },
 {
    "u": "5600701", 
    "v": "5600702"
 }
];
	
    var tasks = {
	  "5600501502": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600701": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600702": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600706": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5555": {
		"task_type": "BashOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5556": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "55pj": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5524_1": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5511": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600801": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600802": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600806": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5524_2": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600703": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600704": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600706_copy": {
		"task_type": "BashOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5600705": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5512": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "7971": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "7972": {
		"task_type": "BashOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5513": {
		"task_type": "BashOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5514": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5501": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5502": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5515": {
		"task_type": "BashOperator", 
		"dag_id": "wjrz"
	  }, 
	  "5506": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5525": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "7973": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55dj1": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55dj2": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55dj3": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55dj4": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55dj5": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5600801_copy": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5600601": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5600803": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5600806_copy": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5600503": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5600805": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5528_3": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55vat1": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55vat2": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55vat3": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5528_2": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "55ebs": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  },
	  "5528_1": {
		"task_type": "PythonOperator", 
		"dag_id": "wjrz"
	  }
	};
	
    var arrange = "LR";
    var g = dagreD3.json.decode(nodes, edges);
    var layout = dagreD3.layout().rankDir(arrange).nodeSep(15).rankSep(15);
    //selection.on(".zoom",null);
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
<%-- $("#btn_log").click(function(){   //查看该失败任务的日志


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