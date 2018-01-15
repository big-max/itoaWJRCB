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
<jsp:include page="../header_rz.jsp" flush="true" /> 
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
.ax_default , .ax_default1{ cursor:pointer; }
#progressImgage{display:none;}
</style>

<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
</head>

<body style="width:100%;">
	
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
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="subBtn" type="button" class="btn btn-primary" style="background-color: rgb(68, 143, 200);">
						<font color="white">提交</font>
					</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div style="height:80px;width:100%;">
		<div style="float:left;">
			<img src="dailyimg/WJRCB_logo.png">
		</div>
		<div style="height:80px;line-height:70px;font-size:30px;margin-left:50%;">
			<span><font color="white">日&nbsp; 终&nbsp; 流&nbsp; 程</font></span>
		</div>
	</div>
	
	<div>
	  <div id="u745">
        <div id="u745_div"></div>
        <div id="u746" class="text">
          <p><span>未开始</span></p>
        </div>
      </div>
      
      <div id="u747">
        <div id="u747_div"></div>
        <div id="u748" class="text">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u749">
        <div id="u749_div"></div>
        <div id="u750" class="text">
          <p><span>成功</span></p>
        </div>
      </div>
      
      <div id="u751">
        <div id="u751_div"></div>
        <div id="u752" class="text">
          <p><span>失败</span></p>
        </div>
      </div>
      
      <div id="u798">
        <div id="u798_div"></div>
        <div id="u799" class="text">
          <p><span>需要清理</span></p>
        </div>
      </div>
      
      <div id="u11" style="top:105px;left:183px;">
        <div id="u11_div"></div>
        <div id="u12" class="text">
          <p><span>子流程</span></p>
        </div>
      </div>
	</div>

    <div id="mainflow" style="height:770px;width:1270px;position:absolute;top:10px;">
    
      <div id="u697" class="ax_default 501502">
        <div id="u697_div"></div>
        <div id="u698" class="text">
          <p><span>5600-501/502</span></p><p><span>检查机构和操作员</span></p>
        </div>
      </div>

      <div id="u699" class="ax_default 706">
        <div id="u699_div"></div>
        <div id="u700" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>

      <div id="u701" class="ax_default 706_2">
        <div id="u701_div"></div>
        <div id="u702" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>
      
      <div id="u703" class="ax_default 5513">
        <div id="u703_div"></div>
        <div id="u704" class="text">
          <p><span>5513</span></p><p><span>存款每日计提</span></p>
        </div>
      </div>

      <div id="u705" class="ax_default 701">
        <div id="u705_div"></div>
        <div id="u706" class="text">
          <p><span>5600-701</span></p><p><span>信贷日终前flashcopy</span></p>
        </div>
      </div>

      <div id="u707" class="ax_default 702">
        <div id="u707_div"></div>
        <div id="u708" class="text">
          <p><span>5600-702</span></p><p><span>信贷日终前备份</span></p>
        </div>
      </div>
      
      <div id="u709" class="ax_default 5555">
        <div id="u709_div"></div>
        <div id="u710" class="text">
          <p><span>5555</span></p><p><span>comstar发往核心记账</span></p>
        </div>
      </div>

      <div id="u711" class="ax_default 5556">
        <div id="u711_div"></div>
        <div id="u712" class="text">
          <p><span>5556</span></p><p><span>comstar发往核心对账</span></p>
        </div>
      </div>

      <div id="u713" class="ax_default 55pj">
        <div id="u713_div"></div>
        <div id="u714" class="text">
          <p><span>55pj</span></p><p><span>票据日终</span></p>
        </div>
      </div>
      
      <div id="u715" class="ax_default 5524">
        <div id="u715_div"></div>
        <div id="u716" class="text">
          <p><span>5524</span></p><p><span>信贷cmis日终处理</span></p>
        </div>
      </div>

      <div id="u717" class="ax_default 5524_2">
        <div id="u717_div"></div>
        <div id="u718" class="text">
          <p><span>5524-2：检查信贷是否具备日终5511条件</span></p>
        </div>
      </div>
      
      <div id="u719" class="ax_default 703">
        <div id="u719_div"></div>
        <div id="u720" class="text">
          <p><span>5600-703</span></p><p><span>信贷日终后flashcopy</span></p>
        </div>
      </div>

      <div id="u721" class="ax_default 704">
        <div id="u721_div"></div>
        <div id="u722" class="text">
          <p><span>5600-704</span></p><p><span>信贷日终后备份</span></p>
        </div>
      </div>
      
      <div id="u723" class="ax_default 705">
        <div id="u723_div"></div>
        <div id="u724" class="text">
          <p><span>5600-705</span></p><p><span>信贷数据库导表</span></p>
        </div>
      </div>

      <div id="u725" class="ax_default 802">
        <div id="u725_div"></div>
        <div id="u726" class="text">
          <p><span>5600-802</span></p><p><span>日终前数据库备份</span></p>
        </div>
      </div>
      
      <div id="u727" class="ax_default 5511">
        <div id="u727_div"></div>
        <div id="u728" class="text">
          <p><span>5511</span></p><p><span>日终周期开始</span></p>
        </div>
      </div>

      <div id="u729" class="ax_default 801">
        <div id="u729_div"></div>
        <div id="u730" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>
      
      <div id="u731" class="ax_default 806">
        <div id="u731_div"></div>
        <div id="u732" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u733" class="ax_default 7972">
        <div id="u733_div"></div>
        <div id="u734" class="text">
          <p><span>7972</span></p><p><span>贷记卡约定还款</span></p>
        </div>
      </div>
      
      <div id="u735" class="ax_default 5514">
        <div id="u735_div"></div>
        <div id="u736" class="text">
          <p><span>5514</span></p><p><span>日终平衡入账</span></p>
        </div>
      </div>

      <div id="u737" class="ax_default 5501">
        <div id="u737_div"></div>
        <div id="u738" class="text">
          <p><span>5501</span></p><p><span>系统日切</span></p>
        </div>
      </div>
      
      <div id="u739" class="ax_default 5502">
        <div id="u739_div" ></div>
        <div id="u740" class="text">
          <p><span>5502</span></p><p><span>系统日启</span></p>
        </div>
      </div>

      <div id="u741" class="ax_default 7971">
        <div id="u741_div"></div>
        <div id="u742" class="text">
          <p><span>7971</span></p><p><span>贷记卡生成清算数据</span></p>
        </div>
      </div>
      
      <div id="u743" class="ax_default 5512">
        <div id="u743_div"></div>
        <div id="u744" class="text">
          <p><span>5512</span></p><p><span>日终账务处理</span></p>
        </div>
      </div>
      
      <div id="u753" class="ax_default 55pj_2">
        <div id="u753_div"></div>
        <div id="u754" class="text">
          <p><span>55pj_2</span></p><p><span>票据日终核心确认</span></p>
        </div>
      </div>
      
      <div id="u800" class="ax_default1 55dj">
        <div id="u800_div" style="background-color:#5a78ab;"></div>
        <div id="u801" class="text" style="text-align:center;">
          <p><span>贷记卡</span></p>
        </div>
      </div>
      
      <div id="u796" class="ax_default rz_start">
        <div id="u796_div" class=""></div>
        <div id="u797" class="text">
          <p><span>开始</span></p>
        </div>
      </div>
      
      <div id="u818" class="ax_default 5515">
        <div id="u818_div"></div>
        <div id="u819" class="text">
          <p><span>5515</span></p><p><span>日终周期结束</span></p>
        </div>
      </div>
      
      <div id="u822" class="ax_default 5528_1">
        <div id="u822_div"></div>
        <div id="u823" class="text">
          <p><span>5528-1</span></p><p><span>work数据采集</span></p>
        </div>
      </div>

      <div id="u824" class="ax_default 5506">
        <div id="u824_div"></div>
        <div id="u825" class="text">
          <p><span>5506</span></p><p><span>卸载数据至数据中心</span></p>
        </div>
      </div>
      
      <div id="u826" class="ax_default 5528_2">
        <div id="u826_div"></div>
        <div id="u827" class="text">
          <p><span>5528-2</span></p><p><span>总账数据迁移</span></p>
        </div>
      </div>

      <div id="u828" class="ax_default 5528_3">
        <div id="u828_div"></div>
        <div id="u829" class="text">
          <p><span>5528-3</span></p><p><span>VAT供数</span></p>
        </div>
      </div>
      
      <div id="u830" class="ax_default 801_2">
        <div id="u830_div"></div>
        <div id="u831" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>
      
      <div id="u842" class="ax_default 601">
        <div id="u842_div"></div>
        <div id="u843" class="text">
          <p><span>5600-601</span></p><p><span>清空ics日志表</span></p>
        </div>
      </div>

      <div id="u844" class="ax_default 803">
        <div id="u844_div"></div>
        <div id="u845" class="text">
          <p><span>5600-803</span></p><p><span>日终后数据库备份</span></p>
        </div>
      </div>
      
      <div id="u846" class="ax_default 806_2">
        <div id="u846_div"></div>
        <div id="u847" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u848" class="ax_default 503">
        <div id="u848_div"></div>
        <div id="u849" class="text">
          <p><span>5600-503</span></p><p><span>检查workdb日志</span></p>
        </div>
      </div>
      
      <div id="u850" class="ax_default 805">
        <div id="u850_div"></div>
        <div id="u851" class="text">
          <p><span>5600-805</span></p><p><span>后台及ics数据库导表</span></p>
        </div>
      </div>
      
      <div id="u862" class="ax_default 55vat1">
        <div id="u862_div"></div>
        <div id="u863" class="text">
          <p><span>55vat1</span></p><p><span>查看导数结果</span></p>
        </div>
      </div>

      <div id="u864" class="ax_default 55vat2">
        <div id="u864_div"></div>
        <div id="u865" class="text">
          <p><span>55vat2</span></p><p><span>VAT日终跑批</span></p>
        </div>
      </div>
      
      <div id="u866" class="ax_default 55vat3">
        <div id="u866_div"></div>
        <div id="u867" class="text">
          <p><span>55vat3</span></p><p><span>查看VAT日终结果</span></p>
        </div>
      </div>
      
      <div id="u872" class="ax_default 55ebs">
        <div id="u872_div"></div>
        <div id="u873" class="text">
          <p><span>55ebs</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>

      <div id="u874" class="ax_default 55ebs_2">
        <div id="u874_div"></div>
        <div id="u875" class="text">
          <p><span>55ebs-2</span></p><p><span>检查跑批状态</span></p>
        </div>
      </div>
      
      <div id="u880" class="ax_default 5525">
        <div id="u880_div"></div>
        <div id="u881" class="text">
          <p><span>5525</span></p><p><span>数据中心日终</span></p>
        </div>
      </div>

      <div id="u882" class="ax_default 7973">
        <div id="u882_div"></div>
        <div id="u883" class="text">
          <p><span>7973</span></p><p><span>贷记卡导入科目明细</span></p>
        </div>
      </div>
      
      <div id="u755" class="connector">
        <img id="u755_seg0" class="img" src="dailyimg/u755_seg0.png"/>
        <img id="u755_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u757" class="connector">
        <img id="u757_seg0" class="img" src="dailyimg/u757_seg0.png"/>
        <img id="u757_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u759" class="connector">
        <img id="u759_seg0" class="img" src="dailyimg/u118_seg0.png"/>
        <img id="u759_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u761" class="connector">
        <img id="u761_seg0" class="img" src="dailyimg/u761_seg0.png"/>
        <img id="u761_seg1" class="img" src="dailyimg/u104_seg1.png"/>
        <img id="u761_seg2" class="img" src="dailyimg/u761_seg2.png"/>
        <img id="u761_seg3" class="img" src="dailyimg/u761_seg3.png"/>
      </div>

      <div id="u763" class="connector">
        <img id="u763_seg0" class="img" src="dailyimg/u761_seg0.png"/>
        <img id="u763_seg1" class="img" src="dailyimg/u106_seg1.png"/>
        <img id="u763_seg2" class="img" src="dailyimg/u761_seg2.png"/>
        <img id="u763_seg3" class="img" src="dailyimg/u761_seg3.png"/>
      </div>
      
      <div id="u765" class="connector">
        <img id="u765_seg0" class="img" src="dailyimg/u755_seg0.png"/>
        <img id="u765_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u767" class="connector">
        <img id="u767_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u767_seg1" class="img" src="dailyimg/u767_seg1.png"/>
        <img id="u767_seg2" class="img" src="dailyimg/u767_seg2.png"/>
        <img id="u767_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u769" class="connector">
        <img id="u769_seg0" class="img" src="dailyimg/u769_seg0.png"/>
        <img id="u769_seg1" class="img" src="dailyimg/u769_seg1.png"/>
        <img id="u769_seg2" class="img" src="dailyimg/u769_seg2.png"/>
        <img id="u769_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u771" class="connector">
        <img id="u771_seg0" class="img" src="dailyimg/u771_seg0.png"/>
        <img id="u771_seg1" class="img" src="dailyimg/u771_seg1.png"/>
        <img id="u771_seg2" class="img" src="dailyimg/u771_seg2.png"/>
        <img id="u771_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u773" class="connector">
        <img id="u773_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u773_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u775" class="connector">
        <img id="u775_seg0" class="img" src="dailyimg/u118_seg0.png"/>
        <img id="u775_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u777" class="connector">
        <img id="u777_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u777_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u779" class="connector">
        <img id="u779_seg0" class="img" src="dailyimg/u779_seg0.png"/>
        <img id="u779_seg1" class="img" src="dailyimg/u122_seg1.png"/>
        <img id="u779_seg2" class="img" src="dailyimg/u779_seg2.png"/>
        <img id="u779_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u781" class="connector">
        <img id="u781_seg0" class="img" src="dailyimg/u128_seg0.png"/>
        <img id="u781_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u783" class="connector">
        <img id="u783_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u783_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u785" class="connector">
        <img id="u785_seg0" class="img" src="dailyimg/u785_seg0.png"/>
        <img id="u785_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u787" class="connector">
        <img id="u787_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u787_seg1" class="img" src="dailyimg/u134_seg1.png"/>
        <img id="u787_seg2" class="img" src="dailyimg/u767_seg2.png"/>
        <img id="u787_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u804" class="connector">
        <img id="u804_seg0" class="img" src="dailyimg/u156_seg0.png"/>
        <img id="u804_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u806" class="connector">
        <img id="u806_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u806_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u808" class="connector">
        <img id="u808_seg0" class="img" src="dailyimg/u808_seg0.png"/>
        <img id="u808_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u810" class="connector">
        <img id="u810_seg0" class="img" src="dailyimg/u810_seg0.png"/>
        <img id="u810_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u812" class="connector">
        <img id="u812_seg0" class="img" src="dailyimg/u812_seg0.png"/>
        <img id="u812_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u814" class="connector">
        <img id="u814_seg0" class="img" src="dailyimg/u757_seg0.png"/>
        <img id="u814_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u816" class="connector">
        <img id="u816_seg0" class="img" src="dailyimg/u816_seg0.png"/>
        <img id="u816_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u820" class="connector">
        <img id="u820_seg0" class="img" src="dailyimg/u820_seg0.png"/>
        <img id="u820_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u832" class="connector">
        <img id="u832_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u832_seg1" class="img" src="dailyimg/u832_seg1.png"/>
        <img id="u832_seg2" class="img" src="dailyimg/u832_seg2.png"/>
        <img id="u832_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u834" class="connector">
        <img id="u834_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u834_seg1" class="img" src="dailyimg/u834_seg1.png"/>
        <img id="u834_seg2" class="img" src="dailyimg/u832_seg2.png"/>
        <img id="u834_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u836" class="connector">
        <img id="u836_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u836_seg1" class="img" src="dailyimg/u836_seg1.png"/>
        <img id="u836_seg2" class="img" src="dailyimg/u832_seg2.png"/>
        <img id="u836_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u838" class="connector">
        <img id="u838_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u838_seg1" class="img" src="dailyimg/u838_seg1.png"/>
        <img id="u838_seg2" class="img" src="dailyimg/u832_seg2.png"/>
        <img id="u838_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u840" class="connector">
        <img id="u840_seg0" class="img" src="dailyimg/u767_seg0.png"/>
        <img id="u840_seg1" class="img" src="dailyimg/u840_seg1.png"/>
        <img id="u840_seg2" class="img" src="dailyimg/u832_seg2.png"/>
        <img id="u840_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u852" class="connector">
        <img id="u852_seg0" class="img" src="dailyimg/u852_seg0.png"/>
        <img id="u852_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u854" class="connector">
        <img id="u854_seg0" class="img" src="dailyimg/u213_seg0.png"/>
        <img id="u854_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u856" class="connector">
        <img id="u856_seg0" class="img" src="dailyimg/u856_seg0.png"/>
        <img id="u856_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u858" class="connector">
        <img id="u858_seg0" class="img" src="dailyimg/u858_seg0.png"/>
        <img id="u858_seg1" class="img" src="dailyimg/u858_seg1.png"/>
      </div>

      <div id="u860" class="connector">
        <img id="u860_seg0" class="img" src="dailyimg/u860_seg0.png"/>
        <img id="u860_seg1" class="img" src="dailyimg/u858_seg1.png"/>
      </div>
      
      <div id="u868" class="connector">
        <img id="u868_seg0" class="img" src="dailyimg/u852_seg0.png"/>
        <img id="u868_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u870" class="connector">
        <img id="u870_seg0" class="img" src="dailyimg/u856_seg0.png"/>
        <img id="u870_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u876" class="connector">
        <img id="u876_seg0" class="img" src="dailyimg/u852_seg0.png"/>
        <img id="u876_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u878" class="connector">
        <img id="u878_seg0" class="img" src="dailyimg/u856_seg0.png"/>
        <img id="u878_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u884" class="connector">
        <img id="u884_seg0" class="img" src="dailyimg/u860_seg0.png"/>
        <img id="u884_seg1" class="img" src="dailyimg/u858_seg1.png"/>
      </div>

      <div id="u886" class="connector">
        <img id="u886_seg0" class="img" src="dailyimg/u886_seg0.png"/>
        <img id="u886_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u888" class="connector">
        <img id="u888_seg0" class="img" src="dailyimg/u888_seg0.png"/>
        <img id="u888_seg1" class="img" src="dailyimg/u888_seg1.png"/>
        <img id="u888_seg2" class="img" src="dailyimg/u858_seg1.png"/>
      </div>

      <div id="u890" class="connector">
        <img id="u890_seg0" class="img" src="dailyimg/u890_seg0.png"/>
        <img id="u890_seg1" class="img" src="dailyimg/u890_seg1.png"/>
        <img id="u890_seg2" class="img" src="dailyimg/u890_seg2.png"/>
        <img id="u890_seg3" class="img" src="dailyimg/u890_seg3.png"/>
        <img id="u890_seg4" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u892" class="connector">
        <img id="u892_seg0" class="img" src="dailyimg/u771_seg0.png"/>
        <img id="u892_seg1" class="img" src="dailyimg/u98_seg1.png"/>
        <img id="u892_seg2" class="img" src="dailyimg/u892_seg2.png"/>
        <img id="u892_seg3" class="img" src="dailyimg/u892_seg3.png"/>
      </div>

      <div id="u894" class="connector">
        <img id="u894_seg0" class="img" src="dailyimg/u894_seg0.png"/>
        <img id="u894_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u896" class="connector">
        <img id="u896_seg0" class="img" src="dailyimg/u896_seg0.png"/>
        <img id="u896_seg1" class="img" src="dailyimg/u124_seg1.png"/>
        <img id="u896_seg2" class="img" src="dailyimg/u896_seg2.png"/>
        <img id="u896_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u898" class="connector">
        <img id="u898_seg0" class="img" src="dailyimg/u896_seg0.png"/>
        <img id="u898_seg1" class="img" src="dailyimg/u126_seg1.png"/>
        <img id="u898_seg2" class="img" src="dailyimg/u896_seg2.png"/>
        <img id="u898_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
    </div>
    
    <img id="progressImgage" style="width:120px;height:120px;" alt="请稍等，处理中。。。" src="img/process.gif"/>
    <div id="maskOfProgressImage" class="mask hide"></div>
    
    <div id="mm1" class="easyui-menu" style="width:120px;">
        <div iconCls="icon-search" onclick="rz_showLog()">查看日志</div>
        <div iconCls="icon-edit" onclick="rz_record()">记录问题</div>
        <div iconCls="icon-reload" onclick="rz_clear()">清理&续作</div>
        <div iconCls="icon-ok" onclick="rz_makesuccess()">确认成功</div>
    </div>
    <div id="mm2" class="easyui-menu" style="width:120px;"><!-- 针对贷记卡 -->
        <div iconCls="icon-search" onclick="rz_showLog()">查看日志</div>
        <div iconCls="icon-edit" onclick="rz_record()">记录问题</div>
        <div iconCls="icon-ok" onclick="rz_makesuccess()">确认成功</div>
    </div>
</body>

<script>
	$(document).ready(function(){
		var wid = window.screen.availWidth;
		var widTr = (wid - 1270) / 2;
		$("#mainflow").css("left",widTr);
	})

	$(document).ready(function(){
		$(".55dj").click(function(){
			var dag_id = getUrlParam('dag_id');
			var subdag_id = dag_id + ".55dj";
			var fathertask_id = "55dj";
			var execution_date = getUrlParam('execution_date');
			window.open("getSubPage.do?dag_id="+dag_id+"&subdag_id="+subdag_id+"&fathertask_id="+fathertask_id+"&execution_date="+execution_date);
		})
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
			$('#mm1').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		});
	});
		
	$(function(){
		$(".ax_default1").bind('contextmenu',function(e){
			e.preventDefault();
			$('#mm2').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		});
	});

	function rz_showLog()
	{
		$("#mm1").menu('hide');
		$("#mm2").menu('hide');
		var execution_date = getUrlParam('execution_date'); //获取url 的值
   		var dag_id = getUrlParam('dag_id'); //获取url 的值
   		console.info("taskid is " + taskid + "; execution_date is " + execution_date);
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
		$("#mm1").menu('hide');
		$("#mm2").menu('hide');
		$("#recordproblem").modal();//打开模态框 
       	$("#problemarea").val("");//清空数据
   		var execution_date = getUrlParam('execution_date'); 
   		var dag_id = getUrlParam('dag_id'); //获取url 的值
   		$("#subBtn").click(function(){
   			var content = $("#problemarea").val();
   			if(content == "")
   			{
   				sweet("问题记录不能为空!","warning","确定"); 
   				return;
   			}
   			else{
   				var data ={"dag_id":dag_id,"task_id":taskid,"execution_date":execution_date,"task_detail":content}
   	   			$.ajax({
   	   				url : '<%=path%>/postLogRecord.do',
   	   				data:data,
   	   				type : 'post',
   	   				dataType : 'json',
   	   				success:function(result)
   	   				{
   	   					alert("添加成功！")
   	   				},
   	                   error: function(XMLHttpRequest, textStatus, errorThrown) {
   	   					 $("#subBtn").unbind("click");
   	   				},
   	   				complete: function(XMLHttpRequest, textStatus) {
   	   					$("#subBtn").unbind("click");
   	   				}
   	   			})
   			}
   		})
	}
		
	function rz_makesuccess()
	{
		$("#mm1").menu('hide');
		$("#mm2").menu('hide');
		var execution_date = getUrlParam('execution_date'); //获取url 的值
       	var dag_id = getUrlParam('dag_id'); //获取url 的值
       	console.info("taskid is " + taskid + "; execution_date is " + execution_date);
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
		$("#mm1").menu('hide');
		var execution_date = getUrlParam('execution_date'); //获取url 的值
       	var dag_id = getUrlParam('dag_id'); //获取url 的值
       	console.info("taskid is " + taskid + "; execution_date is " + execution_date);
       	var data ={"dag_id":dag_id,"task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
   			success:function(data)
   			{
   				if(data.TaskState == "shutdown" || data.TaskState == "queued" || data.TaskState =="scheduled"){
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
   			}
	   })},3000);
	}
</script>

<script>
	$(".ax_default").tooltip({
	    html: true,
	    container: "body",
	});
	
	var dag_id = getUrlParam('dag_id'); 
	var execution_date = getUrlParam('execution_date');
	var execution_date_show = execution_date.split("T")[0];
	var data ={"dag_id":dag_id,"execution_date":execution_date};
	
	setInterval(function(){getAjax("runningData.do",data,"post")},3000);
	
	function update_nodes_states(task_instances) {
		$.each(task_instances,function(idx,obj){
            var task_div = $('.' + obj.task_id);
            if(obj.state == 'failed') //如果失败
            {
            	var tipcontent ="<p align='left'> 预计开始时间：" +  obj.expected_starttime + "," +
            									 "实际开始时间：" +  obj.start_Date         + "," +
            									 "预计结束时间：" +  obj.expected_endtime   + "," + 
            									 "实际结束时间：" +  obj.end_Date           + "," +
            									 "预计持续时间：" +  obj.expected_duration  + "&nbsp;&nbsp;," + 
            									 "实际持续时间：" +  obj.duration           + "&nbsp;&nbsp;," +
            					"任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FF0000");
            }
            else if (obj.state == 'success') //如果成功
            {
            	var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 			 	 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：成功</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#32cc00");
            }
            else if (obj.state == '' || obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'scheduled' || obj.state == 'shutdown')//未开始
            {
            	var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：未开始</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#ffffff");
            }
            else if (obj.state == 'running')
            {
            	var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：运行中</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#0000ff") ;
            }
            else if (obj.state == 'done') //如果处于做完待确认的状态
            {
            	var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FF8C00") ;
            }
            else if (obj.state == 'upstream_failed') //需要清理 
            {
            	var tipcontent = "<p align='left'>预计开始时间：" +  obj.expected_starttime + "," +
								 				 "实际开始时间：" +  obj.start_Date         + "," +
								 				 "预计结束时间：" +  obj.expected_endtime   + "," + 
								 				 "实际结束时间：" +  obj.end_Date           + "," +
								 				 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
								 				 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
								 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FFCC33") ;
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