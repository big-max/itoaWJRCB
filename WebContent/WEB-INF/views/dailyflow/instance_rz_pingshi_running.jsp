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
<jsp:include page="../headerdaily.jsp" flush="true" /> 
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
</style>
<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
</head>

<body>
    <div id="base">
    
      <div id="u2" class="ax_default 5600501502">
        <div id="u2_div"></div><!-- 给边框加颜色 -->
        <div id="u3" class="text">
          <p><span>5600-501/502</span></p><p><span>检查机构和操作员</span></p>
        </div>
      </div>
      
      <div id="u14" class="ax_default 5600701">
        <div id="u14_div"></div>
        <div id="u15" class="text">
          <p><span>5600-701</span></p><p><span>信贷日终前flashcopy</span></p>
        </div>
      </div>
      
      <div id="u16" class="ax_default 5600702">
        <div id="u16_div"></div>
        <div id="u17" class="text">
          <p><span>5600-702</span></p><p><span>信贷日终前备份</span></p>
        </div>
      </div>

      <div id="u4" class="ax_default 5600706">
        <div id="u4_div"></div>
        <div id="u5" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>
      
      <div id="u18" class="ax_default 5555">
        <div id="u18_div"></div>
        <div id="u19" class="text">
          <p><span>5555</span></p><p><span>comstar发往核心记账</span></p>
        </div>
      </div>

      <div id="u20" class="ax_default 5556">
        <div id="u20_div"></div>
        <div id="u21" class="text">
          <p><span>5556</span></p><p><span>comstar发往核心对账</span></p>
        </div>
      </div>
      
      <div id="u22" class="ax_default 55pj">
        <div id="u22_div"></div>
        <div id="u23" class="text">
          <p><span>55pj</span></p><p><span>票据日终</span></p>
        </div>
      </div>
      
      <div id="u52" class="ax_default 55241">
        <div id="u52_div"></div>
        <div id="u53" class="text">
          <p><span>5524-1</span></p><p><span>信贷cmis日终处理</span></p>
        </div>
      </div>

      <div id="u54" class="ax_default 55242">
        <div id="u54_div"></div>
        <div id="u55" class="text">
          <p><span>5524-2：检查信贷是否具备日终5511条件</span></p>
        </div>
      </div>
      
      <div id="u60" class="ax_default 5600703">
        <div id="u60_div"></div>
        <div id="u61" class="text">
          <p><span>5600-703</span></p><p><span>信贷日终后flashcopy</span></p>
        </div>
      </div>

      <div id="u62" class="ax_default 5600704">
        <div id="u62_div"></div>
        <div id="u63" class="text">
          <p><span>5600-704</span></p><p><span>信贷日终后备份</span></p>
        </div>
      </div>
      
      <div id="u6" class="ax_default 5600706">
        <div id="u6_div"></div>
        <div id="u7" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>
      
      <div id="u64" class="ax_default 5600705">
        <div id="u64_div"></div>
        <div id="u65" class="text">
          <p><span>5600-705</span></p><p><span>信贷数据库导表</span></p>
        </div>
      </div>
      
      <div id="u68" class="ax_default 5511">
        <div id="u68_div"></div>
        <div id="u69" class="text">
          <p><span>5511</span></p><p><span>日终周期开始</span></p>
        </div>
      </div>

      <div id="u70" class="ax_default 5600801">
        <div id="u70_div"></div>
        <div id="u71" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>
      
      <div id="u66" class="ax_default 5600802">
        <div id="u66_div"></div>
        <div id="u67" class="text">
          <p><span>5600-802</span></p><p><span>日终前数据库备份</span></p>
        </div>
      </div>

      <div id="u72" class="ax_default 5600806">
        <div id="u72_div"></div>
        <div id="u73" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>
      
      <div id="u104" class="ax_default 5512">
        <div id="u104_div"></div>
        <div id="u105" class="text">
          <p><span>5512</span></p><p><span>日终账务处理</span></p>
        </div>
      </div>
      
      <div id="u102" class="ax_default 7971">
        <div id="u102_div"></div>
        <div id="u103" class="text">
          <p><span>7971</span></p><p><span>贷记卡生成清算数据</span></p>
        </div>
      </div>
      
      <div id="u94" class="ax_default 7972">
        <div id="u94_div"></div>
        <div id="u95" class="text">
          <p><span>7972</span></p><p><span>贷记卡约定还款</span></p>
        </div>
      </div>
      
      <div id="u8" class="ax_default 5513">
        <div id="u8_div"></div>
        <div id="u9" class="text">
          <p><span>5513</span></p><p><span>存款每日计提</span></p>
        </div>
      </div>
      
      <div id="u96" class="ax_default 5514">
        <div id="u96_div"></div>
        <div id="u97" class="text">
          <p><span>5514</span></p><p><span>日终平衡入账</span></p>
        </div>
      </div>
      
      <div id="u98" class="ax_default 5501">
        <div id="u98_div"></div>
        <div id="u99" class="text">
          <p><span>5501</span></p><p><span>系统日切</span></p>
        </div>
      </div>

      <div id="u100" class="ax_default 5502">
        <div id="u100_div"></div>
        <div id="u101" class="text">
          <p><span>5502</span></p><p><span>系统日启</span></p>
        </div>
      </div>
      
      <div id="u106" class="ax_default 5515">
        <div id="u106_div"></div>
        <div id="u107" class="text">
          <p><span>5515</span></p><p><span>日终周期结束</span></p>
        </div>
      </div>

      <div id="u108" class="ax_default 5506">
        <div id="u108_div"></div>
        <div id="u109" class="text">
          <p><span>5506</span></p><p><span>卸载数据至数据中心</span></p>
        </div>
      </div>
      
      <div id="u110" class="ax_default 7973">
        <div id="u110_div"></div>
        <div id="u111" class="text">
          <p><span>7973</span></p><p><span>贷记卡导入科目明细</span></p>
        </div>
      </div>
      
      <div id="u10" class="ax_default 55281">
        <div id="u10_div"></div>
        <div id="u11" class="text">
          <p><span>5528-1</span></p><p><span>work数据采集</span></p>
        </div>
      </div>
      
      <div id="u140" class="ax_default 55282">
        <div id="u140_div"></div>
        <div id="u141" class="text">
          <p><span>5528-2</span></p><p><span>总账数据迁移</span></p>
        </div>
      </div>

      <div id="u142" class="ax_default 55283">
        <div id="u142_div"></div>
        <div id="u143" class="text">
          <p><span>5528-3</span></p><p><span>VAT供数</span></p>
        </div>
      </div>
      
      <div id="u150" class="ax_default 5600801">
        <div id="u150_div"></div>
        <div id="u151" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u152" class="ax_default 5600601">
        <div id="u152_div"></div>
        <div id="u153" class="text">
          <p><span>5600-601</span></p><p><span>清空ics日志表</span></p>
        </div>
      </div>

      <div id="u154" class="ax_default 5600803">
        <div id="u154_div"></div>
        <div id="u155" class="text">
          <p><span>5600-803</span></p><p><span>日终后数据库备份</span></p>
        </div>
      </div>

      <div id="u156" class="ax_default 5600806">
        <div id="u156_div"></div>
        <div id="u157" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>
      
      <div id="u158" class="ax_default 5600503">
        <div id="u158_div"></div>
        <div id="u159" class="text">
          <p><span>5600-503</span></p><p><span>检查workdb日志</span></p>
        </div>
      </div>

      <div id="u160" class="ax_default 5600805">
        <div id="u160_div"></div>
        <div id="u161" class="text">
          <p><span>5600-805</span></p><p><span>后台及ics数据库导表</span></p>
        </div>
      </div>
      
      <div id="u174" class="ax_default 5525">
        <div id="u174_div"></div>
        <div id="u175" class="text">
          <p><span>5525</span></p><p><span>数据中心日终</span></p>
        </div>
      </div>
      
      <div id="u24" class="ax_default 55dj1">
        <div id="u24_div"></div>
        <div id="u25" class="text">
          <p><span>55dj1</span></p><p><span>当前登录操作员-开始跑批</span></p>
        </div>
      </div>

      <div id="u26" class="ax_default 55dj2">
        <div id="u26_div"></div>
        <div id="u27" class="text">
          <p><span>55dj2</span></p><p><span>批量文件导入</span></p>
        </div>
      </div>
      
      <div id="u28" class="ax_default 55dj3">
        <div id="u28_div"></div>
        <div id="u29" class="text">
          <p><span>55dj3</span></p><p><span>批量启动菜单</span></p>
        </div>
      </div>

      <div id="u30" class="ax_default 55dj4">
        <div id="u30_div"></div>
        <div id="u31" class="text">
          <p><span>55dj4</span></p><p><span>批量执行结果</span></p>
        </div>
      </div>
      
      <div id="u12" class="ax_default 55dj5">
        <div id="u12_div"></div>
        <div id="u13" class="text">
          <p><span>55dj5</span></p><p><span>批量文件传出</span></p>
        </div>
      </div>
      
      <div id="u32" class="ax_default 55ebs">
        <div id="u32_div"></div>
        <div id="u33" class="text">
          <p><span>55ebs</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>
      
      <div id="u34" class="ax_default 55vat1">
        <div id="u34_div"></div>
        <div id="u35" class="text">
          <p><span>55vat1</span></p><p><span>查看导数结果</span></p>
        </div>
      </div>

      <div id="u36" class="ax_default 55vat2">
        <div id="u36_div"></div>
        <div id="u37" class="text">
          <p><span>55vat2</span></p><p><span>VAT日终跑批</span></p>
        </div>
      </div>

      <div id="u38" class="ax_default 55vat3">
        <div id="u38_div"></div>
        <div id="u39" class="text">
          <p><span>55vat3</span></p><p><span>查看VAT日终结果</span></p>
        </div>
      </div>
      
      
      <div id="u40" class="ax_default connector">
        <img id="u40_seg0" class="img" src="dailyimg/u40_seg0.png"/>
        <img id="u40_seg1" class="img" src="dailyimg/u40_seg1.png"/>
        <img id="u40_seg2" class="img" src="dailyimg/u40_seg2.png"/>
        <img id="u40_seg3" class="img" src="dailyimg/u40_seg3.png"/>
      </div>

      <div id="u42" class="ax_default connector">
        <img id="u42_seg0" class="img " src="dailyimg/u42_seg0.png"/>
        <img id="u42_seg1" class="img " src="dailyimg/u42_seg1.png"/>
        <img id="u42_seg2" class="img " src="dailyimg/u42_seg2.png"/>
        <img id="u42_seg3" class="img " src="dailyimg/u42_seg3.png"/>
      </div>

      <div id="u44" class="ax_default connector">
        <img id="u44_seg0" class="img " src="dailyimg/u42_seg0.png"/>
        <img id="u44_seg1" class="img " src="dailyimg/u44_seg1.png"/>
        <img id="u44_seg2" class="img " src="dailyimg/u42_seg2.png"/>
        <img id="u44_seg3" class="img " src="dailyimg/u42_seg3.png"/>
      </div>

      <div id="u46" class="ax_default connector">
        <img id="u46_seg0" class="img " src="dailyimg/u46_seg0.png"/>
        <img id="u46_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u48" class="ax_default connector">
        <img id="u48_seg0" class="img " src="dailyimg/u48_seg0.png"/>
        <img id="u48_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u50" class="ax_default connector">
        <img id="u50_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u50_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u56" class="ax_default connector">
        <img id="u56_seg0" class="img " src="dailyimg/u56_seg0.png"/>
        <img id="u56_seg1" class="img " src="dailyimg/u56_seg1.png"/>
        <img id="u56_seg2" class="img " src="dailyimg/u56_seg2.png"/>
        <img id="u56_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u58" class="ax_default connector">
        <img id="u58_seg0" class="img " src="dailyimg/u58_seg0.png"/>
        <img id="u58_seg1" class="img " src="dailyimg/u58_seg1.png"/>
        <img id="u58_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u58_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u74" class="ax_default connector">
        <img id="u74_seg0" class="img " src="dailyimg/u74_seg0.png"/>
        <img id="u74_seg1" class="img " src="dailyimg/u74_seg1.png"/>
        <img id="u74_seg2" class="img " src="dailyimg/u74_seg2.png"/>
        <img id="u74_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u76" class="ax_default connector">
        <img id="u76_seg0" class="img " src="dailyimg/u76_seg0.png"/>
        <img id="u76_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u78" class="ax_default connector">
        <img id="u78_seg0" class="img " src="dailyimg/u78_seg0.png"/>
        <img id="u78_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u80" class="ax_default connector">
        <img id="u80_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u80_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u82" class="ax_default connector">
        <img id="u82_seg0" class="img " src="dailyimg/u82_seg0.png"/>
        <img id="u82_seg1" class="img " src="dailyimg/u82_seg1.png"/>
        <img id="u82_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u82_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u84" class="ax_default connector">
        <img id="u84_seg0" class="img " src="dailyimg/u84_seg0.png"/>
        <img id="u84_seg1" class="img " src="dailyimg/u84_seg1.png"/>
        <img id="u84_seg2" class="img " src="dailyimg/u84_seg2.png"/>
        <img id="u84_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u86" class="ax_default connector">
        <img id="u86_seg0" class="img " src="dailyimg/u86_seg0.png"/>
        <img id="u86_seg1" class="img " src="dailyimg/u86_seg1.png"/>
        <img id="u86_seg2" class="img " src="dailyimg/u86_seg2.png"/>
        <img id="u86_seg3" class="img " src="dailyimg/u84_seg1.png"/>
        <img id="u86_seg4" class="img " src="dailyimg/u84_seg2.png"/>
        <img id="u86_seg5" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u88" class="ax_default connector">
        <img id="u88_seg0" class="img " src="dailyimg/u76_seg0.png"/>
        <img id="u88_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u90" class="ax_default connector">
        <img id="u90_seg0" class="img " src="dailyimg/u78_seg0.png"/>
        <img id="u90_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u92" class="ax_default connector">
        <img id="u92_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u92_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u112" class="ax_default connector">
        <img id="u112_seg0" class="img " src="dailyimg/u112_seg0.png"/>
        <img id="u112_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u114" class="ax_default connector">
        <img id="u114_seg0" class="img " src="dailyimg/u76_seg0.png"/>
        <img id="u114_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u116" class="ax_default connector">
        <img id="u116_seg0" class="img " src="dailyimg/u78_seg0.png"/>
        <img id="u116_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u118" class="ax_default connector">
        <img id="u118_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u118_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u120" class="ax_default connector">
        <img id="u120_seg0" class="img " src="dailyimg/u120_seg0.png"/>
        <img id="u120_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u122" class="ax_default connector">
        <img id="u122_seg0" class="img " src="dailyimg/u122_seg0.png"/>
        <img id="u122_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u124" class="ax_default connector">
        <img id="u124_seg0" class="img " src="dailyimg/u124_seg0.png"/>
        <img id="u124_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u126" class="ax_default connector">
        <img id="u126_seg0" class="img " src="dailyimg/u48_seg0.png"/>
        <img id="u126_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u128" class="ax_default connector">
        <img id="u128_seg0" class="img " src="dailyimg/u122_seg0.png"/>
        <img id="u128_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u130" class="ax_default connector">
        <img id="u130_seg0" class="img " src="dailyimg/u130_seg0.png"/>
        <img id="u130_seg1" class="img " src="dailyimg/u130_seg1.png"/>
        <img id="u130_seg2" class="img " src="dailyimg/u130_seg2.png"/>
        <img id="u130_seg3" class="img " src="dailyimg/u130_seg3.png"/>
      </div>

      <div id="u132" class="ax_default connector">
        <img id="u132_seg0" class="img " src="dailyimg/u132_seg0.png"/>
        <img id="u132_seg1" class="img " src="dailyimg/u132_seg1.png"/>
      </div>

      <div id="u134" class="ax_default connector">
        <img id="u134_seg0" class="img " src="dailyimg/u134_seg0.png"/>
        <img id="u134_seg1" class="img " src="dailyimg/u134_seg1.png"/>
      </div>

      <div id="u136" class="ax_default connector">
        <img id="u136_seg0" class="img " src="dailyimg/u132_seg0.png"/>
        <img id="u136_seg1" class="img " src="dailyimg/u132_seg1.png"/>
      </div>

      <div id="u138" class="ax_default connector">
        <img id="u138_seg0" class="img " src="dailyimg/u138_seg0.png"/>
        <img id="u138_seg1" class="img " src="dailyimg/u138_seg1.png"/>
      </div>

      <div id="u144" class="ax_default connector">
        <img id="u144_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u144_seg1" class="img " src="dailyimg/u144_seg1.png"/>
        <img id="u144_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u144_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u146" class="ax_default connector">
        <img id="u146_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u146_seg1" class="img " src="dailyimg/u146_seg1.png"/>
        <img id="u146_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u146_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u148" class="ax_default connector">
        <img id="u148_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u148_seg1" class="img " src="dailyimg/u148_seg1.png"/>
        <img id="u148_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u148_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u162" class="ax_default connector">
        <img id="u162_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u162_seg1" class="img " src="dailyimg/u162_seg1.png"/>
        <img id="u162_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u162_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u164" class="ax_default connector">
        <img id="u164_seg0" class="img " src="dailyimg/u164_seg0.png"/>
        <img id="u164_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u166" class="ax_default connector">
        <img id="u166_seg0" class="img " src="dailyimg/u166_seg0.png"/>
        <img id="u166_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u168" class="ax_default connector">
        <img id="u168_seg0" class="img " src="dailyimg/u164_seg0.png"/>
        <img id="u168_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u170" class="ax_default connector">
        <img id="u170_seg0" class="img " src="dailyimg/u164_seg0.png"/>
        <img id="u170_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u172" class="ax_default connector">
        <img id="u172_seg0" class="img " src="dailyimg/u172_seg0.png"/>
        <img id="u172_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u176" class="ax_default connector">
        <img id="u176_seg0" class="img " src="dailyimg/u176_seg0.png"/>
        <img id="u176_seg1" class="img " src="dailyimg/u176_seg1.png"/>
        <img id="u176_seg2" class="img " src="dailyimg/u176_seg2.png"/>
        <img id="u176_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u178" class="ax_default connector">
        <img id="u178_seg0" class="img " src="dailyimg/u82_seg0.png"/>
        <img id="u178_seg1" class="img " src="dailyimg/u178_seg1.png"/>
        <img id="u178_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u178_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u180" class="ax_default connector">
        <img id="u180_seg0" class="img " src="dailyimg/u82_seg0.png"/>
        <img id="u180_seg1" class="img " src="dailyimg/u180_seg1.png"/>
        <img id="u180_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u180_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u182" class="ax_default connector">
        <img id="u182_seg0" class="img " src="dailyimg/u182_seg0.png"/>
        <img id="u182_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u184" class="ax_default connector">
        <img id="u184_seg0" class="img " src="dailyimg/u120_seg0.png"/>
        <img id="u184_seg1" class="img " src="dailyimg/u46_seg1.png"/>
      </div>

      <div id="u186" class="ax_default connector">
        <img id="u186_seg0" class="img " src="dailyimg/u186_seg0.png"/>
        <img id="u186_seg1" class="img " src="dailyimg/u186_seg1.png"/>
        <img id="u186_seg2" class="img " src="dailyimg/u186_seg2.png"/>
        <img id="u186_seg3" class="img " src="dailyimg/u56_seg3.png"/>
      </div>

      <div id="u188" class="ax_default">
        <div id="u188_div"></div>
        <div id="u189" class="text">
          <p><span>未开始</span></p>
        </div>
      </div>

      <div id="u190" class="ax_default">
        <div id="u190_div"></div>
        <div id="u191" class="text">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u192" class="ax_default">
        <div id="u192_div"></div>
        <div id="u193" class="text">
          <p><span>成功</span></p>
        </div>
      </div>

      <div id="u194" class="ax_default">
        <div id="u194_div"></div>
        <div id="u195" class="text">
          <p><span>失败</span></p>
        </div>
      </div>
    </div>
    
    
    <script>
    //给每个g添加id
	/*$(document).ready(function(){
		//定义一个数组存放所有id值
		 var arrIdVal = ["pprc_back_start","pprc_back_workdb_backup","pprc_back_icsdb_backup","pprc_back_cardb_backup",
		                "pprc_back_cmisdb_backup","pprc_back_backup_end","pprc_back_p770c2_cardstop",
		                "pprc_back_p770c2_icsstop","pprc_back_p770c1_cmisstop","pprc_back_p770c1_workstop",
		                "pprc_back_ds8k_lunstart","pprc_back_p770a1_lunread_suspend","pprc_back_p770b1_lunread_suspend",
		                "pprc_back_p770a2_lunread_suspend","pprc_back_p770b2_lunread_suspend","pprc_back_p770a1_lunread_recover",
		                "pprc_back_p770b1_lunread_recover","pprc_back_p770a2_lunread_recover","pprc_back_p770b2_lunread_recover",
		                "pprc_back_ds8k_lunstop","pprc_back_active_vg_start","pprc_back_p770a1_activevg",
		                "pprc_back_p770b1_activevg","pprc_back_p770a2_activevg","pprc_back_p770b2_activevg",
		                "pprc_back_active_vg_end","pprc_back_syncha_start","pprc_back_p770a1_syncHA",
		                "pprc_back_p770a2_syncHA","pprc_back_syncha_stop","pprc_back_p770a1ha_start",
		                "pprc_back_p770b1ha_start","pprc_back_p770a2ha_start","pprc_back_p770b2ha_start",
		                "pprc_back_ywcheck","pprc_back_startreplic","pprc_back_p770a1_enable_copy_replicationstart",
		                "pprc_back_p770b1_enable_copy_replicationstart","pprc_back_p770a2_enable_copy_replicationstart",
		                "pprc_back_p770b2_enable_copy_replicationstart","pprc_back_p770a1_replicationstart",
		                "pprc_back_p770b1_replicationstart","pprc_back_p770a2_replicationstart",
		                "pprc_back_p770b2_replicationstart","pprc_back_end"];		
		var nodelen = $("g.node").length;
		//遍历每个g，赋值id
		for(var i = 0 ; i < nodelen ; i++)
		{
			var idname = arrIdVal[i];
			var datatar = "#" + idname;
			$("g.node").eq(i).attr("id",idname);
			$("g.node").eq(i).attr("data-toggle","modal");
		}
		
		//添加执行时间
		var execution_date = getUrlParam('execution_date');
		var execution_date_show = execution_date.replace("T"," ");
		$("#exe_date").text(execution_date_show);
	}) */
	
	
	var taskid;
	$(document).ready(function(){
		$(".ax_default").on("mouseover",function(e){
			taskid = $(this).find("span:eq(0)").html();//获取要点击任务框的id 
		})
		
		$('.ax_default').contextPopup({
	          items: [
	            {label:'查看日志', icon:'img/viewlog.png', action:function() 
	            	{ 
	            		var execution_date = getUrlParam('execution_date'); //获取url 的值
	            		var data ={"dag_id":"dag_pingshi","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
	            		$.ajax({
	           				url : '<%=path%>/getTaskLog.do',
	           				data:data,
	           				type : 'post',
	           				dataType : 'json',
	           				success:function(result) 
	           				{
	           					$("#showlog").modal();
	           					$("textarea").text(result.msg);
	           				},
	           			})
	            	} 
	            },
	            {label:'清理&续作', icon:'img/cleanbtn.png', action:function() 
	            	{ 
		            	var execution_date = getUrlParam('execution_date'); //获取url 的值
		            	var data ={"dag_id":"pprc_back","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
		        		    		   //console.info("running");
		        		    		   img.hide();
		        			           mask.hide();
		        			           var mynode = d3.select('#' + taskid + ' rect');
		        			           mynode.style("stroke", "white") ;
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
		            			var data ={"dag_id":"pprc_back","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
		            						$("#"+taskid).children("rect").css("stroke", "#32CD32");
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
	
	<script type="text/javascript">
	
	$(".ax_default").tooltip({
	      html: true,
	      container: "body",
	    });
	var dag_id = "wjrz_dev";
	//var execution_date = getUrlParam('execution_date');
	var execution_date = "2017-11-21T11:23:28";
	var data ={"dag_id":dag_id,"execution_date":execution_date};
	
	setInterval(function(){getAjax("pingshi_runningData.do",data,"post")},3000);
	
	function update_nodes_states(task_instances) {
			$.each(task_instances,function(idx,obj){
	            var task_div = $('.' + obj.task_id);
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
	                task_div.attr("data-original-title",format_content); 
	                task_div.find("div:eq(0)").css("border-color","#FF4500") ;
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
	                task_div.attr("data-original-title",format_content); 
	                task_div.find("div:eq(0)").css("border-color","#32CD32") ;
	            }else if (obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'upstream_failed'|| obj.state == 'scheduled' || obj.state == 'shutdown')//未开始
	            {
	            	var tipcontent = "预计开始时间：" + obj.expected_starttime + "," +
									 "实际开始时间：" + obj.start_Date         + "," +
									 "预计结束时间：" + obj.expected_endtime   + "," + 
									 "实际结束时间：" + obj.end_Date           + "," +
									 "预计持续时间：" + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
									 "实际持续时间：" + obj.duration           + "&nbsp;&nbsp;秒," +
									 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：未开始";
	                var format_content = tipcontent.split(",").join("<br>");
	                task_div.attr("data-original-title",format_content); 
	                task_div.find("div:eq(0)").css("border-color","white") ;
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
	                task_div.attr("data-original-title",format_content); 
	                task_div.find("div:eq(0)").css("border-color","#3399CC") ;
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
	                task_div.attr("data-original-title",format_content); 
	                task_div.find("div:eq(0)").css("border-color","#FF8C00") ;
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
					console.info(resp.dag_tasks);
					update_nodes_states(resp.dag_tasks);
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
</body>

</html>