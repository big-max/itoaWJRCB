<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<link rel="stylesheet" href="css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="css/style.css">
<!-- Resource style -->
<link href="css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.nano .pane{ 
	background: #888; 
}
.nano .slider{
	background: #111;
}//兼容IE8
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
.mark2 {
	display:none;
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
	var button1 = "<a href='#' id='drawback1'><img src='img/icons/iconfont/threev.png' style='margin-top:8px;'></img></a>";
	var button2 = "<a href='#' id='drawback2'><img src='img/icons/iconfont/threeh.png' style='margin-top:8px;'></img></a>";
	jQuery(document).ready(function () {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
		
		
		//点击缩起来的图标展示相关子菜单
		$("#jquery-accordion-menu").children("div").children("ul").children("li").children(".showsubmenu").bind("click", function(e){
        		  			 
	   			 $(".content").animate({width:"86%"},1,function(){
	   			 $("#jquery-accordion-menu").animate({width:"14%"},1,function(){
	   				 $(".tooltipa1").addClass("notvisible");
	   				 $(".tooltipa2").removeClass("notvisible");
	   				 $(".nosubmenu").addClass("submenu");
	   				  $('.nosubmenu').find('.has-children.selected').removeClass('selected');
	   				  $("#drawback2").replaceWith(button1);
	   				  $(".mark2").removeClass("mark2"); 	
	   				  $(".columnfoot").css("width","82.7%");
	   				  $(".columnfoot").css("left","15%");
	   				 });
	   			 });
   		
		   		 $("#menu11").show();
		   	     $("#menu12").show();
		   		 $("#menu13").show();
		   		 $("#menu14").show();
		   		 $("#menu15").show();
		   		 $("#menu16").show();
		   		 $("#menu17").show();	
		   		 $("#menu18").show();	
		   		 $("#menu19").show();
		   		 $("#menu20").show();
		   		 $("#menu21").show();
		   		 $("#menu22").show();
		   		 $("#menu23").show();
		   		 $("#menu24").show();
		   		 $("#menu25").show();
		   		 $("#menu26").show();
		   		 $("#menu27").show();
		   		 $("#menu28").show();
		   		 $("#menu29").show();
		   		 $("#menu30").show();
		   		 $("#showonce").delay(0).slideDown(300);
		   		$("#forremoveminux").addClass("submenu-indicator-minus");
        	});
		
		//左侧菜单栏的隐藏和显示 开始
		$("body").on("click","#drawback1",function(){
		 	$(".tooltipa1").removeClass("notvisible");
			$(".tooltipa2").addClass("notvisible");
		 	$("#menu11").hide();
		 	$("#menu12").hide();
		 	$("#menu13").hide();
			$("#menu14").hide();
			$("#menu15").hide();
			$("#menu16").hide();
			$("#menu17").hide();
			$("#menu18").hide();
			$("#menu19").hide();
			$("#menu20").hide();
			$("#menu21").hide();
			$("#menu22").hide();
			$("#menu23").hide();
			$("#menu24").hide();
			$("#menu25").hide();
			$("#menu26").hide();
			$("#menu27").hide();
			$("#menu28").hide();
			$("#menu29").hide();
			$("#menu30").hide();
		 	$("#jquery-accordion-menu").animate({width:"56px"},1,function(){
			 	$(".nosubmenu").css("display","none");			//收缩后将三级菜单收起
			 	$('.nosubmenu').find('.has-children.selected').removeClass('selected');	//将三级菜单还原到默认情况
			 	$("#drawback1").replaceWith(button2);			//将收缩绑定的图标替换
			 	$(".submenu-indicator").addClass("mark2");		//去除右侧的加号
			 	$(".content").css("width","calc(100% - 57px)");	//将侧边栏右侧的主页面部分拓宽
		 	 	$(".columnfoot").css("width","92.6%");		//下一页，上一页的拓宽
			 	$(".columnfoot").css("left","5.1%");			//下一页，上一页往左移
		 	});		
		});
	
		$("body").on("click","#drawback2",function(){
			 $(".tooltipa2").removeClass("notvisible");
			 $(".tooltipa1").addClass("notvisible");
			 $(".content").animate({width:"86%"},1,function(){
			 $("#jquery-accordion-menu").animate({width:"14%"},1,function(){
				  $(".nosubmenu").addClass("submenu");
				  $('.nosubmenu').find('.has-children.selected').removeClass('selected');
				  $("#drawback2").replaceWith(button1);
				  $(".mark2").removeClass("mark2"); 
				  $('#forremoveminux').removeClass('submenu-indicator-minus');	
				  $(".columnfoot").css("width","82.7%");
				  $(".columnfoot").css("left","15%");
				 });
		 });
		
		 $("#menu11").show(200);
		 $("#menu12").show(300);
		 $("#menu13").show(300);
		 $("#menu14").show(300);
		 $("#menu15").show(300);
		 $("#menu16").show(200);
		 $("#menu17").show(300);
		 $("#menu18").show(300);
		 $("#menu19").show(300);
		 $("#menu20").show(300);
		 $("#menu21").show(300);
		 $("#menu22").show(300);
		 $("#menu23").show(300);
		 $("#menu24").show(300);
		 $("#menu25").show(300);
		 $("#menu26").show(300);
		 $("#menu27").show(300);
		 $("#menu28").show(300);
		 $("#menu29").show(300);
		 $("#menu30").show(300);
	});
	//左侧菜单栏的隐藏和显示 结束
});
</script>

	<header class="cd-main-header" style="background:url('img/menubg.jpg') repeat-x;height:70px;">
		<nav style="display: block;float: left;height: 100%;">
			<div style="width:500px;height:55px;margin-left:5px;margin-top:7px;">
				<img src="img/navlogo.png">
			</div>
		</nav>  

		<nav class="cd-nav" style="height:50%;margin-top:20px;">
			<span style="margin-right:15px;">
				<a href="getAllServers.do" style="color: white;">
					<img src="img/navhome.png"> 主页
				</a>
			</span>
			<span style="margin-right:15px;">
				<a href="#0" style="color: white;"> 
					<img src="img/navuser.png"> <span>${userName }</span>
				</a>
			</span>
			<span>
				<a href="logout.do" style="color: white;"> 
					<img src="img/navcancel.png"> <span>注销</span>&nbsp;&nbsp;
				</a>
			</span>
		</nav>
	</header>
	<!-- .cd-main-header -->


	<div id="jquery-accordion-menu" class="jquery-accordion-menu red downleft nano" style="z-index: 5;overflow-x:hidden;background:url('img/menubg.jpg');">
	  <div class="nano-content">
		<div style="text-align: center; height:30px;">
			<a href="#" id="drawback1">
				<img src="img/icons/iconfont/threev.png" style="margin-top:8px;"></img>
			</a>
		</div>

		<!-- 自动化部署 -->		
		<c:if test="${role == 1 || role == 3  }">
		<ul>
			<li class="active">
				<a href="#" class="notvisible tooltipa1 showsubmenu" data-toggle="tooltip" data-placement="right" title="自动化部署">
					<img class="img_icon" src="img/icons/iconfont/deploy.png"></img>
				</a>
				<a href="#" class="tooltipa2" id="forremoveminux">
					<img class="img_icon" src="img/icons/iconfont/deploy.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu12" class="top5">自动化部署</span> 
				</a>
				<ul class="submenu nosubmenu" id="showonce">
					<li class="has-children" style="background:rgba(255,255,255,0);">
						<a href="getLogInfo.do"><span>部署历史</span></a>
					</li>
					<!-- <li class="has-children"><a href="#">IBM IHS </a>
						<ul style="width:100px;">
							<li><a href="getIBMAllInstance.do?ptype=ihs">IHS 单节点</a></li>
						</ul>
					</li> -->
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
					<!-- <li class="has-children"><a href="#">IBM ITM </a>
						<ul>
							<li><a href="getIBMAllInstance.do?ptype=itmos">OS Agent</a></li>
						</ul>
					</li> -->
				</ul>
			</li>
		</ul>
		</c:if>
		
		
		<!-- 灾备演练 -->
		<c:if test="${role ==1 || role == 2 }">
		<ul>
			<li>
				<a href="autoswitch.do" class="notvisible tooltipa1" data-toggle="tooltip" data-placement="right" title="灾备切换">
					<img class="img_icon" src="img/icons/iconfont/zaibei.png"></img>
				</a>
				<a href="autoswitch.do" class="tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/zaibei.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu26" class="top5">灾备切换</span> 
			    </a>
			</li>
		</ul>
		</c:if>
		
		
		<!-- 日终流程 -->
		<c:if test="${role == 0 || role == 1 }">
		<ul>		
			<li>
				<a href="dailyflow.do" class="notvisible tooltipa1" data-toggle="tooltip" data-placement="right" title="日终流程">
					<img class="img_icon" src="img/icons/iconfont/dailyflow.png"></img>
				</a>
				<a href="dailyflow.do" class="tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/dailyflow.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu27" class="top5">日终流程</span> 
			    </a>
			</li>
		</ul>
		</c:if>
		
		
		<!-- 自动化发布 -->
		<c:if test="${role == 5 || role == 1 }">
		<ul>
			<li class="active">
				<a href="#" class="notvisible tooltipa1 showsubmenu" data-toggle="tooltip" data-placement="right" title="自动化发布">
					<img class="img_icon" src="img/icons/iconfont/publish.png"></img>
				</a>
				<a href="#" class="tooltipa2" id="forremoveminux">
					<img class="img_icon" src="img/icons/iconfont/publish.png"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu12" class="top5">自动化发布</span> 
				</a>
				<ul class="submenu nosubmenu" id="showonce">
					<li class="has-children">
						<a href="autopublish.do"><span>WAS</span></a>
					</li>
				</ul>
			</li>
		</ul>
		</c:if>
		
		
		<!-- 用户中心 -->
		<c:if test="${role == 1 }">
		<ul>
			<li>
				<a href="accountManage.do" class="notvisible tooltipa1" data-toggle="tooltip" data-placement="right" title="账号管理">
					<img class="img_icon" src="img/icons/iconfont/account.png" id="icon15"></img>
				</a>
				<a href="accountManage.do" class="tooltipa2">
					<img class="img_icon" src="img/icons/iconfont/account.png" id="icon15"></img>&nbsp;&nbsp;&nbsp;
					<span id="menu17" class="top5">账号管理</span> 
			    </a>
			</li>
		</ul>
		</c:if> 
		
	</div>
</div>
	
<script src="js/main.js"></script>
</html>