<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<link rel="stylesheet" href="css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="css/style.css">
<!-- Resource style -->
<link href="css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
<!-- easyui -->
<link type="text/css" rel="stylesheet" href="css/easyui.css" />
<link type="text/css" rel="stylesheet" href="css/icon.css" />
<!-- <script type="text/javascript" src="js/jquery.easyui.min.js"></script>  -->

<style type="text/css">
.nano .pane{ 
	background: #888; 
}
.nano .slider{
	background: #111;
}//兼容IE8
.top5 {
	position: relative;
	padding-left:5px; 
	color:red;
}
.img_icon {
	position:relative;
	right:3px;
	top:-2px;
	width:18px;
	height:18px;
	max-width:18px;
}
.tooltip-inner {
	color:white;
	background-color:#413A3A;
}
.tooltip-arrow{
	border-right-color:black;
}
.tooltip {
	font-size:15px;
	line-height:25px;
	height:40px;
	width:125px;
	position:fixed;
}
.notvisible{
	display:none;
}
.isvisible{  
	display:block;
}
.mark1 {
	display:none;
}
#passwd_icon,#passwd_text{
	cursor:pointer;
}
.mr20{
	font-size:14px;
}
input[type="text"],input[type="password"] {
	height:28px;
}
</style>

<script src="js/jquery-accordion-menu.js" type="text/javascript"></script>
<script type="text/javascript">
	 $(function(){
		 $("[data-toggle='tooltip']").tooltip();
	     $(".nano").nanoScroller();
	     });
	 
	 
	 //show last menu
	 jQuery(document).ready(function () {
		 $(".has-children").bind("hover",function(){
			 var offset1 = $(this).offset();
			 var topof = offset1.top;
			 
			 $(this).children("ul").css("top",topof);
			 $(this).children("ul").css("left","14%");
			 $(this).children("ul").css("width","160px");
		 });
	 });
	 
	 
	var button1 = "<a href='#' id='drawback1' style='padding:0px 80px 8px 90px;'><img src='img/icons/iconfont/threev.png' style='margin-top:8px;'></img></a>";
	var button2 = "<a href='#' id='drawback2' style='padding:0px 10px 8px 10px;'><img src='img/icons/iconfont/threeh.png' style='margin-top:8px;'></img></a>";
	jQuery(document).ready(function () {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
		
		//点击缩起来的图标展示相关子菜单
		$("#jquery-accordion-menu").children("div").children("ul").children("li").children(".showsubmenu").bind("click", function(e){
	   			 $(".content").animate({width:"86%"},1,function(){
	   			 $("#jquery-accordion-menu").animate({width:"14%"},1,function(){
	   				 $(".tooltipa1").addClass("notvisible");
	   				 $(".tooltipa2").removeClass("notvisible");
	   				  $('.nosubmenu').find('.has-children.selected').removeClass('selected');
	   				  $("#drawback2").replaceWith(button1);
	   				  $(".mark1").removeClass("mark1"); 	
	   				  $(".columnfoot").css("width","82.7%");
	   				  $(".columnfoot").css("left","15%");
	   				 });
	   			 });
		   		 $("#menu_deploy").show();
		   		 $("#menu_rz").show();	
		   		 $("#menu_zbswitch").show();
		   		 $("#menu_publish").show();
		   		 $("#menu_account").show();
		   		 $("#menu_rz_em").show();
		   		 $("#showonce").delay(0).slideDown(300);
		   		 $("#forremoveminux").addClass("submenu-indicator-minus");
        	});
		
		$("#jquery-accordion-menu").children("div").children("ul").children("li").children(".showsubmenu_ap").bind("click", function(e){
  			 $(".content").animate({width:"86%"},1,function(){
  			 $("#jquery-accordion-menu").animate({width:"14%"},1,function(){
  				 $(".tooltipa1").addClass("notvisible");
  				 $(".tooltipa2").removeClass("notvisible");
  				  $('.nosubmenu').find('.has-children.selected').removeClass('selected');
  				  $("#drawback2").replaceWith(button1);
  				  $(".mark1").removeClass("mark1"); 	
  				  $(".columnfoot").css("width","82.7%");
  				  $(".columnfoot").css("left","15%");
  				 });
  			 });
	   		 $("#menu_deploy").show();
	   		 $("#menu_rz").show();	
	   		 $("#menu_zbswitch").show();
	   		 $("#menu_publish").show();
	   		 $("#menu_account").show();
	   		 $("#menu_rz_em").show();
	   		 $("#showonce_ap").delay(0).slideDown(300);
	   		 $("#forremoveminux").addClass("submenu-indicator-minus");
   	});
		
		//左侧菜单栏的隐藏和显示 开始
		$("body").on("click","#drawback1",function(){
		 	$(".tooltipa1").removeClass("notvisible");
			$(".tooltipa2").addClass("notvisible");
		 	$("#menu_deploy").hide();
			$("#menu_rz").hide();
			$("#menu_zbswitch").hide();
			$("#menu_publish").hide();
			$("#menu_account").hide();
			$("#menu_rz_em").hide();
		 	$("#jquery-accordion-menu").animate({width:"56px"},1,function(){
			 	$(".nosubmenu").css("display","none");			//收缩后将三级菜单收起
			 	$('.nosubmenu').find('.has-children.selected').removeClass('selected');	//将三级菜单还原到默认情况
			 	$("#drawback1").replaceWith(button2);			//将收缩绑定的图标替换
			 	$(".submenu-indicator").addClass("mark1");		//去除右侧的加号
			 	$(".content").css("width","calc(100% - 57px)");	//将侧边栏右侧的主页面部分拓宽
		 	 	$(".columnfoot").css("width","92.6%");		//下一页，上一页的拓宽
			 	$(".columnfoot").css("left","5.1%");			//下一页，上一页往左移
		 	});		
		});
	
		$("body").on("click","#drawback2",function(){
			 $(".content").animate({width:"86%"},1,function(){
			 $("#jquery-accordion-menu").animate({width:"14%"},1,function(){
				 $(".tooltipa1").addClass("notvisible");
				 $(".tooltipa2").removeClass("notvisible");
				  $('.nosubmenu').find('.has-children.selected').removeClass('selected');
				  $("#drawback2").replaceWith(button1);
				  $(".mark1").removeClass("mark1"); 
				  $('#forremoveminux').removeClass('submenu-indicator-minus');	
				  $(".columnfoot").css("width","82.7%");
				  $(".columnfoot").css("left","15%");
				 });
		 });
		 $("#menu_deploy").show();
		 $("#menu_rz").show();
		 $("#menu_zbswitch").show();
		 $("#menu_publish").show();
		 $("#menu_account").show();
		 $("#menu_rz_em").show();
	});
	//左侧菜单栏的隐藏和显示 结束
});
</script>

	<header class="cd-main-header" style="background:url('img/menubg.jpg') repeat-x;height:70px;">
		<nav style="display: block;float: left;height: 100%;">
			<div style="width:500px;height:55px;margin-left:5px;margin-top:4px;">
				<img src="img/navlogo.png">
			</div>
		</nav>  

		<nav class="cd-nav" style="height:50%;margin-top:20px;">
			<div style="margin-right:20px;float:right;height:25px;">
				<div id="passwd_icon" style="float:left;margin-top:1px;"><img src="img/navpasswd.png"></div>
				<div id="passwd_text" style="float:right;color:white;margin-top:2px;margin-left:5px;">修改密码</div>
			</div>
			<div style="margin-right:20px;float:right;height:25px;">
				<div style="float:left;margin-top:1px;"><a href="logout.do"><img src="img/navcancel.png"></a></div>
				<div style="float:right;color:white;margin-top:2px;margin-left:5px;"><a href="logout.do"><font color=white>注销</font></a></div>
			</div>
			<div style="margin-right:25px;float:right;">
				<div style="float:left;margin-top:2px;"><img src="img/navuser.png"></div>
				<div style="float:right;color:white;margin-top:2px;margin-left:5px;font-size:17px;">${alias }</div>
			</div>
			<div style="margin-right:25px;float:right;">
				<a href="getAllServers.do"><img src="img/navhome.png"></a>
				<div style="float:right;color:white;margin-top:2px;margin-left:5px;"><a href="getAllServers.do"><font color=white>主页</font></a></div>
			</div>
		</nav>
	</header>
	<!-- .cd-main-header -->


	<div id="jquery-accordion-menu" class="jquery-accordion-menu red downleft nano" style="z-index: 5;width:56px;overflow-x:hidden;background:url('img/menubg.jpg');">
	<div class="nano-content">
		<div style="text-align: center; height:30px;">
			<a href="#" id="drawback2">
				<img src="img/icons/iconfont/threeh.png" style="margin-top:8px;padding:0px 10px 8px 10px;"></img>
			</a>
		</div>

		<!-- 自动化部署 -->
		<c:if test="${fn:contains(role,3) || fn:contains(role,1) }">
		<ul>
			<li>
				<a href="#" class="tooltipa1 showsubmenu zdhbs">
					<img class="img_icon" src="img/icons/iconfont/deploy.png" ></img>
				</a>
				<a href="#" class="notvisible tooltipa2" id="forremoveminux">
					<img class="img_icon" src="img/icons/iconfont/deploy.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu_deploy" class="top5">自动化部署</span> 
				</a>
				<ul class="nosubmenu submenu" id="showonce">
					<li class="has-children">
						<a href="getLogInfo.do"><span>部署历史</span></a>
					</li>
					<li class="has-children"><a href="#">IBM IHS </a>
						<ul style="width:100px;">
							<li><a href="getIBMAllInstance.do?ptype=ihs">IHS 单节点</a></li>
						</ul>
					</li> 
					<li class="has-children"><a href="#">IBM WAS </a>
						<ul>
							<li><a href="getIBMAllInstance.do?ptype=was">WAS 单节点</a></li>
							<li><a href="getIBMAllInstance.do?ptype=wascluster">WAS 集群</a></li>
						</ul>
					</li>
					<li class="has-children"><a href="#">IBM MQ </a>
						<ul>
							<li><a href="getIBMAllInstance.do?ptype=mq">MQ 单节点</a></li>
							<!-- <li><a href="getIBMAllInstance.do?ptype=mqcluster">MQ 集群</a></li> -->
						</ul>
					</li>
					<li class="has-children"><a href="#">IBM DB2 </a>
						<ul>
							<li><a href="getIBMAllInstance.do?ptype=db2">DB2 单节点</a></li>
							<li><a href="getIBMAllInstance.do?ptype=db2ha&platform=aix">DB2 HA</a></li>
						</ul>
					</li>
				</ul>
			</li> 
		</ul>
		</c:if>
		
		
		
		<!-- 灾备演练 -->
		<c:if test="${fn:contains(role,2) || fn:contains(role,1) }">
		<ul>
			<li>
				<a href="autoswitch.do" class="tooltipa1 zbqh">
					<img class="img_icon" src="img/icons/iconfont/zaibei.png"></img>
				</a>
				<a href="autoswitch.do" class="notvisible tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/zaibei.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu_zbswitch" class="top5">灾备切换</span> 
			    </a>
			</li>
		</ul>
		</c:if>
		
		
		<!-- 日终 -->
		<c:if test="${fn:contains(role,0) || fn:contains(role,1) || fn:contains(role,6) }">
		<ul>
			<li>
				<a href="dailyflow.do" class="tooltipa1 rzlc">
					<img class="img_icon" src="img/icons/iconfont/dailyflow.png"></img>
				</a>
				<a href="dailyflow.do" class="notvisible tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/dailyflow.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu_rz" class="top5">日终流程</span> 
			    </a>
			</li>
		</ul>
		</c:if>
		
		<!-- 日终短信编辑 -->
		<c:if test="${ fn:contains(role,1) }">
		<ul>
			<li>
				<a href="dailyEditMessage.do" class="tooltipa1 rzdx">
					<img class="img_icon" src="img/icons/iconfont/rz_em.png"></img>
				</a>
				<a href="dailyEditMessage.do" class="notvisible tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/rz_em.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu_rz_em" class="top5">日终短信编辑</span> 
			    </a>
			</li>
		</ul>
		</c:if>
		
		
		<!-- 自动化发布 -->
		<c:if test="${fn:contains(role,5) || fn:contains(role,1) }">
		<ul>
			<li>
				<a href="#" class="tooltipa1 showsubmenu_ap zdhfb">
					<img class="img_icon" src="img/icons/iconfont/publish.png" ></img>
				</a>
				<a href="#" class="notvisible tooltipa2" id="forremoveminux">
					<img class="img_icon" src="img/icons/iconfont/publish.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu_publish" class="top5">自动化发布</span> 
				</a>
				<ul class="nosubmenu submenu" id="showonce_ap">
					<li class="has-children">
						<a href="publishLog.do"><span>发布历史</span></a>
					</li>
					<li class="has-children">
						<a href="autopublish.do"><span>WAS</span></a>
					</li>
					<li class="has-children">
						<a href="autopublishEsb.do"><span>ESB</span></a>
					</li>
				</ul>
			</li> 
		</ul>
		</c:if>		
		
		
		<!-- 用户中心 -->
		<c:if test="${fn:contains(role,1) }">
		<ul>
			<li>
				<a href="accountManage.do" class="tooltipa1 zhgl">
					<img class="img_icon" src="img/icons/iconfont/account.png" id="icon15"></img>
				</a>
				<a href="accountManage.do" class="notvisible tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/account.png" id="icon15"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu_account" class="top5">账号管理</span> 
			    </a>
			</li>
		</ul>
		</c:if> 

		</div>
	</div>
	
	<!-- 修改密码模态框 -->
	<div class="modal fade" id="model_passwd" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="myModalLabel">
						<img src="img/plus15.png">&nbsp;&nbsp;修改密码 
					</h5>
				</div>
	
				<div class="modal-body">
					<div class="control-group">
						<div class="controls">
							<span class="input140 mr20">旧密码：</span>
							<input class="form-control" type="password" id="passwd_old" name="passwd_old">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<span class="input140 mr20">新密码：</span>
							<input class="form-control" type="password" id="passwd_new" name="passwd_new">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<span class="input140 mr20">确认密码：</span>
							<input class="form-control" type="password" id="passwd_confirm" name="passwd_confirm">
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
					<button type="button" class="btn" style="background-color: rgb(68, 143, 200);" onclick="submitPasswd();">
						<font color="white">提交</font>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改密码模态框 -->

<script src="js/main.js"></script>
<script>
 	$(document).ready(function(){
		$("#passwd_icon,#passwd_text").click(function(){
			$('#model_passwd').modal('show');
		})
	}) 
	
	//提交修改密码 
	function submitPasswd()
 	{
 		var passwd_old = $("#passwd_old").val().trim();
 		var passwd_new = $("#passwd_new").val().trim();
 		var passwd_confirm = $("#passwd_confirm").val().trim();
 		
 		if((passwd_old == "") || (passwd_new == "") || (passwd_confirm == ""))
 		{
 			sweet("密码均不能为空,请重新输入","warning","确定"); 
 			return;
 		}
 		if(passwd_new != passwd_confirm)
 		{
 			sweet("新密码和确认密码不一致,请重新输入","warning","确定");  
 			return;
 		}
 		
 		$.ajax({
 			url : "<%=path%>/modifyPassword.do",
			data : { "passwd_old":passwd_old,"passwd_new" : passwd_new },
			type : 'post',
			dataType : 'json',
			success : function(result)
			{
				if(result.status == 2)
				{
					swal({
			 			title:"",
			 			text:"旧密码输入错误 ,请重新输入",
			 			type:"warning",
			 			confirmButtonText: "确定", 
			 			},
			 			function(){
			 				$("#passwd_old").val("");
			 		})
				}
				else
				{
					if(result.status == 1)
					{
						swal({
				 			title:"",
				 			text:"密码修改成功",
				 			type:"success",
				 			confirmButtonText: "确定", 
				 			},
				 			function(){
				 				window.location.href = "getAllServers.do";
				 		})
					}
					else
					{
						swal({
				 			title:"",
				 			text:"密码修改失败",
				 			type:"error",
				 			confirmButtonText: "确定",  
				 			},
				 			function(){
				 				$("#passwd_old").val("");
				 				$("#passwd_new").val("");
				 				$("#passwd_confirm").val("");
				 		})
					}
				}
			}
 		})
 	}
</script>

<script>
	function common(cla,txt)
	{
		$(cla).tooltip({
			position: 'right',
			content: '<div style="color:#fff;font-size:15px;text-align:center;">' + txt + '</div>', 
			onShow: function(){
				$(this).tooltip('tip').css({
					backgroundColor: '#666',
					borderColor: '#666'
				});
			}
		});
	}
	
	$(function(){
		common(".zdhbs","自动化部署");
		common(".zbqh","灾备切换");
		common(".rzlc","日终流程");
		common(".rzdx","日终短信编辑");
		common(".zdhfb","自动化发布");
		common(".zhgl","账号管理");
	})    
</script>
</html>