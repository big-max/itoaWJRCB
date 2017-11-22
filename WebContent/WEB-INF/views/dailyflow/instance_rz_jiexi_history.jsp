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
<jsp:include page="../headerjiexi.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
body{margin:0;padding:0;}
.content {
	position:relative;
	width:calc(100% - 1px); 
	margin-top:50px;
	height:calc(100vh - 50px); 
	background-color:#F5F3F4;
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
	<div style="margin:10px auto;width:320px;height:70px;line-height:70px;">
		<select id="hisdatetime" style="display:inline;width:200px;">
			<option value="${execution_date}">${execution_date}</option>
		</select>
		<span style="margin-right: 5px;">&nbsp;&nbsp;&nbsp;</span>
		<button id="showlog" class="btn btn-sm" style="background-color: #3399CC;border:1px solid #bbb;">
			<font color="white">查看历史</font>
		</button>
	</div>
	
    <div id="base">
      <div id="u198" class="ax_default 5600501502">
        <div id="u198_div"></div>
        <div id="u199" class="text">
          <p><span>5600-501/502</span></p><p><span>检查机构和操作员</span></p>
        </div>
      </div>

      <div id="u200" class="ax_default 5600706">
        <div id="u200_div"></div>
        <div id="u201" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>

      <div id="u202" class="ax_default 5600706">
        <div id="u202_div"></div>
        <div id="u203" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>

      <div id="u204" class="ax_default 5513">
        <div id="u204_div"></div>
        <div id="u205" class="text">
          <p><span>5513</span></p><p><span>存款每日计提</span></p>
        </div>
      </div>

      <div id="u206" class="ax_default 55281">
        <div id="u206_div"></div>
        <div id="u207" class="text">
          <p><span>5528-1</span></p><p><span>work数据采集</span></p>
        </div>
      </div>

      <div id="u208" class="ax_default 55dj5">
        <div id="u208_div"></div>
        <div id="u209" class="text">
          <p><span>55dj5</span></p><p><span>批量文件传出</span></p>
        </div>
      </div>

      <div id="u210" class="ax_default 5600701">
        <div id="u210_div"></div>
        <div id="u211" class="text">
          <p><span>5600-701</span></p><p><span>信贷日终前flashcopy</span></p>
        </div>
      </div>

      <div id="u212" class="ax_default 5600702">
        <div id="u212_div"></div>
        <div id="u213" class="text">
          <p><span>5600-702</span></p><p><span>信贷日终前备份</span></p>
        </div>
      </div>

      <div id="u214" class="ax_default 5555">
        <div id="u214_div"></div>
        <div id="u215" class="text">
          <p><span>5555</span></p><p><span>comstar发往核心记账</span></p>
        </div>
      </div>

      <div id="u216" class="ax_default 5556">
        <div id="u216_div"></div>
        <div id="u217" class="text">
          <p><span>5556</span></p><p><span>comstar发往核心对账</span></p>
        </div>
      </div>

      <div id="u218" class="ax_default 55pj">
        <div id="u218_div"></div>
        <div id="u219" class="text">
          <p><span>55pj</span></p><p><span>票据日终</span></p>
        </div>
      </div>

      <div id="u220" class="ax_default 55dj1">
        <div id="u220_div"></div>
        <div id="u221" class="text">
          <p><span>55dj1</span></p><p><span>当前登录操作员-开始跑批</span></p>
        </div>
      </div>

      <div id="u222" class="ax_default 55dj2">
        <div id="u222_div"></div>
        <div id="u223" class="text">
          <p><span>55dj2</span></p><p><span>批量文件导入</span></p>
        </div>
      </div>

      <div id="u224" class="ax_default 55dj3">
        <div id="u224_div"></div>
        <div id="u225" class="text">
          <p><span>55dj3</span></p><p><span>批量启动菜单</span></p>
        </div>
      </div>

      <div id="u226" class="ax_default 55dj4">
        <div id="u226_div"></div>
        <div id="u227" class="text">
          <p><span>55dj4</span></p><p><span>批量执行结果</span></p>
        </div>
      </div>

      <div id="u228" class="ax_default 55ebs">
        <div id="u228_div"></div>
        <div id="u229" class="text">
          <p><span>55ebs</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>

      <div id="u230" class="ax_default 55vat1">
        <div id="u230_div"></div>
        <div id="u231" class="text">
          <p><span>55vat1</span></p><p><span>查看导数结果</span></p>
        </div>
      </div>

      <div id="u232" class="ax_default 55vat2">
        <div id="u232_div"></div>
        <div id="u233" class="text">
          <p><span>55vat2</span></p><p><span>VAT日终跑批</span></p>
        </div>
      </div>

      <div id="u234" class="ax_default 55vat3">
        <div id="u234_div"></div>
        <div id="u235" class="text">
          <p><span>55vat3</span></p><p><span>查看VAT日终结果</span></p>
        </div>
      </div>

      <div id="u236" class="ax_default connector">
        <img id="u236_seg0" class="img" src="dailyimg/u40_seg0.png"/>
        <img id="u236_seg1" class="img" src="dailyimg/u40_seg1.png"/>
        <img id="u236_seg2" class="img" src="dailyimg/u40_seg2.png"/>
        <img id="u236_seg3" class="img" src="dailyimg/u40_seg3.png"/>
      </div>

      <div id="u238" class="ax_default connector">
        <img id="u238_seg0" class="img" src="dailyimg/u42_seg0.png"/>
        <img id="u238_seg1" class="img" src="dailyimg/u42_seg1.png"/>
        <img id="u238_seg2" class="img" src="dailyimg/u42_seg2.png"/>
        <img id="u238_seg3" class="img" src="dailyimg/u42_seg3.png"/>
      </div>

      <div id="u240" class="ax_default connector">
        <img id="u240_seg0" class="img" src="dailyimg/u42_seg0.png"/>
        <img id="u240_seg1" class="img" src="dailyimg/u44_seg1.png"/>
        <img id="u240_seg2" class="img" src="dailyimg/u42_seg2.png"/>
        <img id="u240_seg3" class="img" src="dailyimg/u42_seg3.png"/>
      </div>

      <div id="u242" class="ax_default connector">
        <img id="u242_seg0" class="img" src="dailyimg/u46_seg0.png"/>
        <img id="u242_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u244" class="ax_default connector">
        <img id="u244_seg0" class="img" src="dailyimg/u48_seg0.png"/>
        <img id="u244_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u246" class="ax_default connector">
        <img id="u246_seg0" class="img" src="dailyimg/u50_seg0.png"/>
        <img id="u246_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u248" class="ax_default 55241">
        <div id="u248_div"></div>
        <div id="u249" class="text">
          <p><span>5524-1</span></p><p><span>信贷cmis日终处理</span></p>
        </div>
      </div>

      <div id="u250" class="ax_default 55242">
        <div id="u250_div"></div>
        <div id="u251" class="text">
          <p><span>5524-2：检查信贷是否具备日终5511条件</span></p>
        </div>
      </div>

      <div id="u252" class="ax_default connector">
        <img id="u252_seg0" class="img" src="dailyimg/u56_seg0.png"/>
        <img id="u252_seg1" class="img" src="dailyimg/u56_seg1.png"/>
        <img id="u252_seg2" class="img" src="dailyimg/u56_seg2.png"/>
        <img id="u252_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u254" class="ax_default connector">
        <img id="u254_seg0" class="img" src="dailyimg/u58_seg0.png"/>
        <img id="u254_seg1" class="img" src="dailyimg/u58_seg1.png"/>
        <img id="u254_seg2" class="img" src="dailyimg/u58_seg2.png"/>
        <img id="u254_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u256" class="ax_default 5600703">
        <div id="u256_div"></div>
        <div id="u257" class="text">
          <p><span>5600-703</span></p><p><span>信贷日终后flashcopy</span></p>
        </div>
      </div>

      <div id="u258" class="ax_default 5600704">
        <div id="u258_div"></div>
        <div id="u259" class="text">
          <p><span>5600-704</span></p><p><span>信贷日终后备份</span></p>
        </div>
      </div>

      <div id="u260" class="ax_default 5600705">
        <div id="u260_div"></div>
        <div id="u261" class="text">
          <p><span>5600-705</span></p><p><span>信贷数据库导表</span></p>
        </div>
      </div>

      <div id="u262" class="ax_default 5600802">
        <div id="u262_div"></div>
        <div id="u263" class="text">
          <p><span>5600-802</span></p><p><span>日终前数据库备份</span></p>
        </div>
      </div>

      <div id="u264" class="ax_default 5511">
        <div id="u264_div"></div>
        <div id="u265" class="text">
          <p><span>5511</span></p><p><span>日终周期开始</span></p>
        </div>
      </div>

      <div id="u266" class="ax_default 5600801">
        <div id="u266_div"></div>
        <div id="u267" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u268" class="ax_default 5600806">
        <div id="u268_div"></div>
        <div id="u269" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u270" class="ax_default connector">
        <img id="u270_seg0" class="img" src="dailyimg/u74_seg0.png"/>
        <img id="u270_seg1" class="img" src="dailyimg/u74_seg1.png"/>
        <img id="u270_seg2" class="img" src="dailyimg/u74_seg2.png"/>
        <img id="u270_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u272" class="ax_default connector">
        <img id="u272_seg0" class="img" src="dailyimg/u76_seg0.png"/>
        <img id="u272_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u274" class="ax_default connector">
        <img id="u274_seg0" class="img" src="dailyimg/u78_seg0.png"/>
        <img id="u274_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u276" class="ax_default connector">
        <img id="u276_seg0" class="img" src="dailyimg/u50_seg0.png"/>
        <img id="u276_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u278" class="ax_default connector">
        <img id="u278_seg0" class="img" src="dailyimg/u82_seg0.png"/>
        <img id="u278_seg1" class="img" src="dailyimg/u82_seg1.png"/>
        <img id="u278_seg2" class="img" src="dailyimg/u58_seg2.png"/>
        <img id="u278_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u280" class="ax_default connector">
        <img id="u280_seg0" class="img" src="dailyimg/u84_seg0.png"/>
        <img id="u280_seg1" class="img" src="dailyimg/u84_seg1.png"/>
        <img id="u280_seg2" class="img" src="dailyimg/u84_seg2.png"/>
        <img id="u280_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u282" class="ax_default connector">
        <img id="u282_seg0" class="img" src="dailyimg/u86_seg0.png"/>
        <img id="u282_seg1" class="img" src="dailyimg/u86_seg1.png"/>
        <img id="u282_seg2" class="img" src="dailyimg/u86_seg2.png"/>
        <img id="u282_seg3" class="img" src="dailyimg/u84_seg1.png"/>
        <img id="u282_seg4" class="img" src="dailyimg/u84_seg2.png"/>
        <img id="u282_seg5" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u284" class="ax_default connector">
        <img id="u284_seg0" class="img" src="dailyimg/u76_seg0.png"/>
        <img id="u284_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u286" class="ax_default connector">
        <img id="u286_seg0" class="img" src="dailyimg/u78_seg0.png"/>
        <img id="u286_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u288" class="ax_default connector">
        <img id="u288_seg0" class="img" src="dailyimg/u50_seg0.png"/>
        <img id="u288_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u290" class="ax_default 7972">
        <div id="u290_div"></div>
        <div id="u291" class="text">
          <p><span>7972</span></p><p><span>贷记卡约定还款</span></p>
        </div>
      </div>

      <div id="u292" class="ax_default 5514">
        <div id="u292_div"></div>
        <div id="u293" class="text">
          <p><span>5514</span></p><p><span>日终平衡入账</span></p>
        </div>
      </div>

      <div id="u294" class="ax_default 5501">
        <div id="u294_div"></div>
        <div id="u295" class="text">
          <p><span>5501</span></p><p><span>系统日切</span></p>
        </div>
      </div>

      <div id="u296" class="ax_default 5502">
        <div id="u296_div"></div>
        <div id="u297" class="text">
          <p><span>5502</span></p><p><span>系统日启</span></p>
        </div>
      </div>

      <div id="u298" class="ax_default 7971">
        <div id="u298_div"></div>
        <div id="u299" class="text">
          <p><span>7971</span></p><p><span>贷记卡生成清算数据</span></p>
        </div>
      </div>

      <div id="u300" class="ax_default 5512">
        <div id="u300_div"></div>
        <div id="u301" class="text">
          <p><span>5512</span></p><p><span>日终账务处理</span></p>
        </div>
      </div>

      <div id="u302" class="ax_default 5515">
        <div id="u302_div"></div>
        <div id="u303" class="text">
          <p><span>5515</span></p><p><span>日终周期结束</span></p>
        </div>
      </div>

      <div id="u304" class="ax_default 5506">
        <div id="u304_div"></div>
        <div id="u305" class="text">
          <p><span>5506</span></p><p><span>卸载数据至数据中心</span></p>
        </div>
      </div>

      <div id="u306" class="ax_default 7973">
        <div id="u306_div"></div>
        <div id="u307" class="text">
          <p><span>7973</span></p><p><span>贷记卡导入科目明细</span></p>
        </div>
      </div>

      <div id="u308" class="ax_default connector">
        <img id="u308_seg0" class="img" src="dailyimg/u112_seg0.png"/>
        <img id="u308_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u310" class="ax_default connector">
        <img id="u310_seg0" class="img" src="dailyimg/u76_seg0.png"/>
        <img id="u310_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u312" class="ax_default connector">
        <img id="u312_seg0" class="img" src="dailyimg/u78_seg0.png"/>
        <img id="u312_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u314" class="ax_default connector">
        <img id="u314_seg0" class="img" src="dailyimg/u50_seg0.png"/>
        <img id="u314_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u316" class="ax_default connector">
        <img id="u316_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u316_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u318" class="ax_default connector">
        <img id="u318_seg0" class="img" src="dailyimg/u122_seg0.png"/>
        <img id="u318_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u320" class="ax_default connector">
        <img id="u320_seg0" class="img" src="dailyimg/u124_seg0.png"/>
        <img id="u320_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u322" class="ax_default connector">
        <img id="u322_seg0" class="img" src="dailyimg/u48_seg0.png"/>
        <img id="u322_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u324" class="ax_default connector">
        <img id="u324_seg0" class="img" src="dailyimg/u122_seg0.png"/>
        <img id="u324_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u326" class="ax_default connector">
        <img id="u326_seg0" class="img" src="dailyimg/u326_seg0.png"/>
        <img id="u326_seg1" class="img" src="dailyimg/u130_seg1.png"/>
        <img id="u326_seg2" class="img" src="dailyimg/u326_seg2.png"/>
        <img id="u326_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u328" class="ax_default connector">
        <img id="u328_seg0" class="img" src="dailyimg/u132_seg0.png"/>
        <img id="u328_seg1" class="img" src="dailyimg/u132_seg1.png"/>
      </div>

      <div id="u330" class="ax_default connector">
        <img id="u330_seg0" class="img" src="dailyimg/u134_seg0.png"/>
        <img id="u330_seg1" class="img" src="dailyimg/u134_seg1.png"/>
      </div>

      <div id="u332" class="ax_default connector">
        <img id="u332_seg0" class="img" src="dailyimg/u132_seg0.png"/>
        <img id="u332_seg1" class="img" src="dailyimg/u132_seg1.png"/>
      </div>

      <div id="u334" class="ax_default connector">
        <img id="u334_seg0" class="img" src="dailyimg/u138_seg0.png"/>
        <img id="u334_seg1" class="img" src="dailyimg/u138_seg1.png"/>
      </div>

      <div id="u336" class="ax_default 55282">
        <div id="u336_div"></div>
        <div id="u337" class="text">
          <p><span>5528-2</span></p><p><span>总账数据迁移</span></p>
        </div>
      </div>

      <div id="u338" class="ax_default 55283">
        <div id="u338_div"></div>
        <div id="u339" class="text">
          <p><span>5528-3</span></p><p><span>VAT供数</span></p>
        </div>
      </div>

      <div id="u340" class="ax_default connector">
        <img id="u340_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u340_seg1" class="img" src="dailyimg/u340_seg1.png"/>
        <img id="u340_seg2" class="img" src="dailyimg/u144_seg2.png"/>
        <img id="u340_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u342" class="ax_default connector">
        <img id="u342_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u342_seg1" class="img" src="dailyimg/u342_seg1.png"/>
        <img id="u342_seg2" class="img" src="dailyimg/u144_seg2.png"/>
        <img id="u342_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u344" class="ax_default connector">
        <img id="u344_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u344_seg1" class="img" src="dailyimg/u344_seg1.png"/>
        <img id="u344_seg2" class="img" src="dailyimg/u144_seg2.png"/>
        <img id="u344_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u346" class="ax_default 5600801">
        <div id="u346_div"></div>
        <div id="u347" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u348" class="ax_default 5600601">
        <div id="u348_div"></div>
        <div id="u349" class="text">
          <p><span>5600-601</span></p><p><span>清空ics日志表</span></p>
        </div>
      </div>

      <div id="u350" class="ax_default 5600803">
        <div id="u350_div"></div>
        <div id="u351" class="text">
          <p><span>5600-803</span></p><p><span>日终后数据库备份</span></p>
        </div>
      </div>

      <div id="u352" class="ax_default 5600806">
        <div id="u352_div"></div>
        <div id="u353" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u354" class="ax_default 5600503">
        <div id="u354_div"></div>
        <div id="u355" class="text">
          <p><span>5600-503</span></p><p><span>检查workdb日志</span></p>
        </div>
      </div>

      <div id="u356" class="ax_default 5600805">
        <div id="u356_div"></div>
        <div id="u357" class="text">
          <p><span>5600-805</span></p><p><span>后台及ics数据库导表</span></p>
        </div>
      </div>

      <div id="u358" class="ax_default connector">
        <img id="u358_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u358_seg1" class="img" src="dailyimg/u358_seg1.png"/>
        <img id="u358_seg2" class="img" src="dailyimg/u144_seg2.png"/>
        <img id="u358_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u360" class="ax_default connector">
        <img id="u360_seg0" class="img" src="dailyimg/u166_seg0.png"/>
        <img id="u360_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u362" class="ax_default connector">
        <img id="u362_seg0" class="img" src="dailyimg/u164_seg0.png"/>
        <img id="u362_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u364" class="ax_default connector">
        <img id="u364_seg0" class="img" src="dailyimg/u164_seg0.png"/>
        <img id="u364_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u366" class="ax_default connector">
        <img id="u366_seg0" class="img" src="dailyimg/u164_seg0.png"/>
        <img id="u366_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u368" class="ax_default connector">
        <img id="u368_seg0" class="img" src="dailyimg/u172_seg0.png"/>
        <img id="u368_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u370" class="ax_default 5525">
        <div id="u370_div"></div>
        <div id="u371" class="text">
          <p><span>5525</span></p><p><span>数据中心日终</span></p>
        </div>
      </div>

      <div id="u372" class="ax_default connector">
        <img id="u372_seg0" class="img" src="dailyimg/u176_seg0.png"/>
        <img id="u372_seg1" class="img" src="dailyimg/u372_seg1.png"/>
        <img id="u372_seg2" class="img" src="dailyimg/u176_seg2.png"/>
        <img id="u372_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u374" class="ax_default connector">
        <img id="u374_seg0" class="img" src="dailyimg/u374_seg0.png"/>
        <img id="u374_seg1" class="img" src="dailyimg/u374_seg1.png"/>
        <img id="u374_seg2" class="img" src="dailyimg/u374_seg2.png"/>
        <img id="u374_seg3" class="img" src="dailyimg/u374_seg3.png"/>
      </div>

      <div id="u376" class="ax_default connector">
        <img id="u376_seg0" class="img" src="dailyimg/u376_seg0.png"/>
        <img id="u376_seg1" class="img" src="dailyimg/u376_seg1.png"/>
        <img id="u376_seg2" class="img" src="dailyimg/u376_seg2.png"/>
        <img id="u376_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u378" class="ax_default connector">
        <img id="u378_seg0" class="img" src="dailyimg/u182_seg0.png"/>
        <img id="u378_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u380" class="ax_default connector">
        <img id="u380_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u380_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u382" class="ax_default connector">
        <img id="u382_seg0" class="img" src="dailyimg/u186_seg0.png"/>
        <img id="u382_seg1" class="img" src="dailyimg/u186_seg1.png"/>
        <img id="u382_seg2" class="img" src="dailyimg/u186_seg2.png"/>
        <img id="u382_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u390" class="ax_default">
        <div id="u390_div"></div>
        <div id="u391" class="text">
          <p><span>超时</span></p>
        </div>
      </div>

      <div id="u392" class="ax_default 5531">
        <div id="u392_div"></div>
        <div id="u393" class="text">
          <p><span>5531</span></p><p><span>利息计算（存款结息日）</span></p>
        </div>
      </div>

      <div id="u394" class="ax_default 5532">
        <div id="u394_div"></div>
        <div id="u395" class="text">
          <p><span>5532</span></p><p><span>利息入账（存款结息日）</span></p>
        </div>
      </div>

      <div id="u396" class="ax_default connector">
        <img id="u396_seg0" class="img" src="dailyimg/u396_seg0.png"/>
        <img id="u396_seg1" class="img" src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u398" class="ax_default connector">
        <img id="u398_seg0" class="img" src="dailyimg/u176_seg0.png"/>
        <img id="u398_seg1" class="img" src="dailyimg/u398_seg1.png"/>
        <img id="u398_seg2" class="img" src="dailyimg/u176_seg2.png"/>
        <img id="u398_seg3" class="img" src="dailyimg/u56_seg3.png"/>
      </div>
    </div>
</body>

</html>