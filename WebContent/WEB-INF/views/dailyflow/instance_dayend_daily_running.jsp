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
    
      <div id="u2" class="ax_default box_1">
        <div id="u2_div" class=""></div>
        <div id="u3" class="text">
          <p><span>5600-501/502</span></p><p><span>检查机构和操作员</span></p>
        </div>
      </div>
      
      <div id="u14" class="ax_default box_1">
        <div id="u14_div" class=""></div>
        <div id="u15" class="text">
          <p><span>5600-701</span></p><p><span>信贷日终前flashcopy</span></p>
        </div>
      </div>
      
      <div id="u16" class="ax_default box_1">
        <div id="u16_div" class=""></div>
        <div id="u17" class="text">
          <p><span>5600-702</span></p><p><span>信贷日终前备份</span></p>
        </div>
      </div>

      <div id="u4" class="ax_default box_1">
        <div id="u4_div" class=""></div>
        <div id="u5" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>
      
      <div id="u18" class="ax_default box_1">
        <div id="u18_div" class=""></div>
        <div id="u19" class="text">
          <p><span>5555</span></p><p><span>comstar发往核心记账</span></p>
        </div>
      </div>

      <div id="u20" class="ax_default box_1">
        <div id="u20_div" class=""></div>
        <div id="u21" class="text">
          <p><span>5556</span></p><p><span>comstar发往核心对账</span></p>
        </div>
      </div>
      
      <div id="u22" class="ax_default box_1">
        <div id="u22_div" class=""></div>
        <div id="u23" class="text">
          <p><span>55pj</span></p><p><span>票据日终</span></p>
        </div>
      </div>
      
      <div id="u52" class="ax_default box_1">
        <div id="u52_div" class=""></div>
        <div id="u53" class="text">
          <p><span>5524-1</span></p><p><span>信贷cmis日终处理</span></p>
        </div>
      </div>

      <div id="u54" class="ax_default box_1">
        <div id="u54_div" class=""></div>
        <div id="u55" class="text">
          <p><span>5524-2：检查信贷是否具备日终5511条件</span></p>
        </div>
      </div>
      
      <div id="u60" class="ax_default box_1">
        <div id="u60_div" class=""></div>
        <div id="u61" class="text">
          <p><span>5600-703</span></p><p><span>信贷日终后flashcopy</span></p>
        </div>
      </div>

      <div id="u62" class="ax_default box_1">
        <div id="u62_div" class=""></div>
        <div id="u63" class="text">
          <p><span>5600-704</span></p><p><span>信贷日终后备份</span></p>
        </div>
      </div>
      
      <div id="u6" class="ax_default box_1">
        <div id="u6_div" class=""></div>
        <div id="u7" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>
      
      <div id="u64" class="ax_default box_1">
        <div id="u64_div" class=""></div>
        <div id="u65" class="text">
          <p><span>5600-705</span></p><p><span>信贷数据库导表</span></p>
        </div>
      </div>
      
      <div id="u68" class="ax_default box_1">
        <div id="u68_div" class=""></div>
        <div id="u69" class="text">
          <p><span>5511</span></p><p><span>日终周期开始</span></p>
        </div>
      </div>

      <div id="u70" class="ax_default box_1">
        <div id="u70_div" class=""></div>
        <div id="u71" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>
      
      <div id="u66" class="ax_default box_1">
        <div id="u66_div" class=""></div>
        <div id="u67" class="text">
          <p><span>5600-802</span></p><p><span>日终前数据库备份</span></p>
        </div>
      </div>

      <div id="u72" class="ax_default box_1">
        <div id="u72_div" class=""></div>
        <div id="u73" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>
      
      <div id="u104" class="ax_default box_1">
        <div id="u104_div" class=""></div>
        <div id="u105" class="text">
          <p><span>5512</span></p><p><span>日终账务处理</span></p>
        </div>
      </div>
      
      <div id="u102" class="ax_default box_1">
        <div id="u102_div" class=""></div>
        <div id="u103" class="text">
          <p><span>7971</span></p><p><span>贷记卡生成清算数据</span></p>
        </div>
      </div>
      
      <div id="u94" class="ax_default box_1">
        <div id="u94_div" class=""></div>
        <div id="u95" class="text">
          <p><span>7972</span></p><p><span>贷记卡约定还款</span></p>
        </div>
      </div>
      
      <div id="u8" class="ax_default box_1">
        <div id="u8_div" class=""></div>
        <div id="u9" class="text">
          <p><span>5513</span></p><p><span>存款每日计提</span></p>
        </div>
      </div>
      
      <div id="u96" class="ax_default box_1">
        <div id="u96_div" class=""></div>
        <div id="u97" class="text">
          <p><span>5514</span></p><p><span>日终平衡入账</span></p>
        </div>
      </div>
      
      <div id="u98" class="ax_default box_1">
        <div id="u98_div" class=""></div>
        <div id="u99" class="text">
          <p><span>5501</span></p><p><span>系统日切</span></p>
        </div>
      </div>

      <div id="u100" class="ax_default box_1">
        <div id="u100_div" class=""></div>
        <div id="u101" class="text">
          <p><span>5502</span></p><p><span>系统日启</span></p>
        </div>
      </div>
      
      <div id="u106" class="ax_default box_1">
        <div id="u106_div" class=""></div>
        <div id="u107" class="text">
          <p><span>5515</span></p><p><span>日终周期结束</span></p>
        </div>
      </div>

      <div id="u108" class="ax_default box_1">
        <div id="u108_div" class=""></div>
        <div id="u109" class="text">
          <p><span>5506</span></p><p><span>卸载数据至数据中心</span></p>
        </div>
      </div>
      
      <div id="u110" class="ax_default box_1">
        <div id="u110_div" class=""></div>
        <div id="u111" class="text">
          <p><span>7973</span></p><p><span>贷记卡导入科目明细</span></p>
        </div>
      </div>
      
      <div id="u10" class="ax_default box_1">
        <div id="u10_div" class=""></div>
        <div id="u11" class="text">
          <p><span>5528-1</span></p><p><span>work数据采集</span></p>
        </div>
      </div>
      
      <div id="u140" class="ax_default box_1">
        <div id="u140_div" class=""></div>
        <div id="u141" class="text">
          <p><span>5528-2</span></p><p><span>总账数据迁移</span></p>
        </div>
      </div>

      <div id="u142" class="ax_default box_1">
        <div id="u142_div" class=""></div>
        <div id="u143" class="text">
          <p><span>5528-3</span></p><p><span>VAT供数</span></p>
        </div>
      </div>
      
      <div id="u150" class="ax_default box_1">
        <div id="u150_div" class=""></div>
        <div id="u151" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u152" class="ax_default box_1">
        <div id="u152_div" class=""></div>
        <div id="u153" class="text">
          <p><span>5600-601</span></p><p><span>清空ics日志表</span></p>
        </div>
      </div>

      <div id="u154" class="ax_default box_1">
        <div id="u154_div" class=""></div>
        <div id="u155" class="text">
          <p><span>5600-803</span></p><p><span>日终后数据库备份</span></p>
        </div>
      </div>

      <div id="u156" class="ax_default box_1">
        <div id="u156_div" class=""></div>
        <div id="u157" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>
      
      <div id="u158" class="ax_default box_1">
        <div id="u158_div" class=""></div>
        <div id="u159" class="text">
          <p><span>5600-503</span></p><p><span>检查workdb日志</span></p>
        </div>
      </div>

      <div id="u160" class="ax_default box_1">
        <div id="u160_div" class=""></div>
        <div id="u161" class="text">
          <p><span>5600-805</span></p><p><span>后台及ics数据库导表</span></p>
        </div>
      </div>
      
      <div id="u174" class="ax_default box_1">
        <div id="u174_div" class=""></div>
        <div id="u175" class="text">
          <p><span>5525</span></p><p><span>数据中心日终</span></p>
        </div>
      </div>
      
      <div id="u24" class="ax_default box_1">
        <div id="u24_div" class=""></div>
        <div id="u25" class="text">
          <p><span>55dj1</span></p><p><span>当前登录操作员-开始跑批</span></p>
        </div>
      </div>

      <div id="u26" class="ax_default box_1">
        <div id="u26_div" class=""></div>
        <div id="u27" class="text">
          <p><span>55dj2</span></p><p><span>批量文件导入</span></p>
        </div>
      </div>
      
      <div id="u28" class="ax_default box_1">
        <div id="u28_div" class=""></div>
        <div id="u29" class="text">
          <p><span>55dj3</span></p><p><span>批量启动菜单</span></p>
        </div>
      </div>

      <div id="u30" class="ax_default box_1">
        <div id="u30_div" class=""></div>
        <div id="u31" class="text">
          <p><span>55dj4</span></p><p><span>批量执行结果</span></p>
        </div>
      </div>
      
      <div id="u12" class="ax_default box_1">
        <div id="u12_div" class=""></div>
        <div id="u13" class="text">
          <p><span>55dj5</span></p><p><span>批量文件传出</span></p>
        </div>
      </div>
      
      <div id="u32" class="ax_default box_1">
        <div id="u32_div" class=""></div>
        <div id="u33" class="text">
          <p><span>55ebs</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>
      
      <div id="u34" class="ax_default box_1">
        <div id="u34_div" class=""></div>
        <div id="u35" class="text">
          <p><span>55vat1</span></p><p><span>查看导数结果</span></p>
        </div>
      </div>

      <div id="u36" class="ax_default box_1">
        <div id="u36_div" class=""></div>
        <div id="u37" class="text">
          <p><span>55vat2</span></p><p><span>VAT日终跑批</span></p>
        </div>
      </div>

      <div id="u38" class="ax_default box_1">
        <div id="u38_div" class=""></div>
        <div id="u39" class="text">
          <p><span>55vat3</span></p><p><span>查看VAT日终结果</span></p>
        </div>
      </div>
      
      
      <div id="u40" class="ax_default connector">
        <img id="u40_seg0" class="img" src="dailyimg/u40_seg0.png"/>
        <img id="u40_seg1" class="img" src="dailyimg/u40_seg1.png"/>
        <img id="u40_seg2" class="img" src="dailyimg/u40_seg2.png"/>
        <img id="u40_seg3" class="img" src="dailyimg/u40_seg3.png"/>
        <div id="u41" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u42" class="ax_default connector">
        <img id="u42_seg0" class="img " src="dailyimg/u42_seg0.png"/>
        <img id="u42_seg1" class="img " src="dailyimg/u42_seg1.png"/>
        <img id="u42_seg2" class="img " src="dailyimg/u42_seg2.png"/>
        <img id="u42_seg3" class="img " src="dailyimg/u42_seg3.png"/>
        <div id="u43" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u44" class="ax_default connector">
        <img id="u44_seg0" class="img " src="dailyimg/u42_seg0.png"/>
        <img id="u44_seg1" class="img " src="dailyimg/u44_seg1.png"/>
        <img id="u44_seg2" class="img " src="dailyimg/u42_seg2.png"/>
        <img id="u44_seg3" class="img " src="dailyimg/u42_seg3.png"/>
        <div id="u45" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u46" class="ax_default connector">
        <img id="u46_seg0" class="img " src="dailyimg/u46_seg0.png"/>
        <img id="u46_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u47" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u48" class="ax_default connector">
        <img id="u48_seg0" class="img " src="dailyimg/u48_seg0.png"/>
        <img id="u48_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u49" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u50" class="ax_default connector">
        <img id="u50_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u50_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u51" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u56" class="ax_default connector">
        <img id="u56_seg0" class="img " src="dailyimg/u56_seg0.png"/>
        <img id="u56_seg1" class="img " src="dailyimg/u56_seg1.png"/>
        <img id="u56_seg2" class="img " src="dailyimg/u56_seg2.png"/>
        <img id="u56_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u57" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u58" class="ax_default connector">
        <img id="u58_seg0" class="img " src="dailyimg/u58_seg0.png"/>
        <img id="u58_seg1" class="img " src="dailyimg/u58_seg1.png"/>
        <img id="u58_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u58_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u59" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u74" class="ax_default connector">
        <img id="u74_seg0" class="img " src="dailyimg/u74_seg0.png"/>
        <img id="u74_seg1" class="img " src="dailyimg/u74_seg1.png"/>
        <img id="u74_seg2" class="img " src="dailyimg/u74_seg2.png"/>
        <img id="u74_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u75" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u76" class="ax_default connector">
        <img id="u76_seg0" class="img " src="dailyimg/u76_seg0.png"/>
        <img id="u76_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u77" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u78" class="ax_default connector">
        <img id="u78_seg0" class="img " src="dailyimg/u78_seg0.png"/>
        <img id="u78_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u79" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u80" class="ax_default connector">
        <img id="u80_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u80_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u81" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u82" class="ax_default connector">
        <img id="u82_seg0" class="img " src="dailyimg/u82_seg0.png"/>
        <img id="u82_seg1" class="img " src="dailyimg/u82_seg1.png"/>
        <img id="u82_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u82_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u83" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u84" class="ax_default connector">
        <img id="u84_seg0" class="img " src="dailyimg/u84_seg0.png"/>
        <img id="u84_seg1" class="img " src="dailyimg/u84_seg1.png"/>
        <img id="u84_seg2" class="img " src="dailyimg/u84_seg2.png"/>
        <img id="u84_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u85" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u86" class="ax_default connector">
        <img id="u86_seg0" class="img " src="dailyimg/u86_seg0.png"/>
        <img id="u86_seg1" class="img " src="dailyimg/u86_seg1.png"/>
        <img id="u86_seg2" class="img " src="dailyimg/u86_seg2.png"/>
        <img id="u86_seg3" class="img " src="dailyimg/u84_seg1.png"/>
        <img id="u86_seg4" class="img " src="dailyimg/u84_seg2.png"/>
        <img id="u86_seg5" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u87" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u88" class="ax_default connector">
        <img id="u88_seg0" class="img " src="dailyimg/u76_seg0.png"/>
        <img id="u88_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u89" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u90" class="ax_default connector">
        <img id="u90_seg0" class="img " src="dailyimg/u78_seg0.png"/>
        <img id="u90_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u91" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u92" class="ax_default connector">
        <img id="u92_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u92_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u93" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u112" class="ax_default connector">
        <img id="u112_seg0" class="img " src="dailyimg/u112_seg0.png"/>
        <img id="u112_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u113" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u114" class="ax_default connector">
        <img id="u114_seg0" class="img " src="dailyimg/u76_seg0.png"/>
        <img id="u114_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u115" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u116" class="ax_default connector">
        <img id="u116_seg0" class="img " src="dailyimg/u78_seg0.png"/>
        <img id="u116_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u117" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u118" class="ax_default connector">
        <img id="u118_seg0" class="img " src="dailyimg/u50_seg0.png"/>
        <img id="u118_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u119" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u120" class="ax_default connector">
        <img id="u120_seg0" class="img " src="dailyimg/u120_seg0.png"/>
        <img id="u120_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u121" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u122" class="ax_default connector">
        <img id="u122_seg0" class="img " src="dailyimg/u122_seg0.png"/>
        <img id="u122_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u123" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u124" class="ax_default connector">
        <img id="u124_seg0" class="img " src="dailyimg/u124_seg0.png"/>
        <img id="u124_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u125" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u126" class="ax_default connector">
        <img id="u126_seg0" class="img " src="dailyimg/u48_seg0.png"/>
        <img id="u126_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u127" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u128" class="ax_default connector">
        <img id="u128_seg0" class="img " src="dailyimg/u122_seg0.png"/>
        <img id="u128_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u129" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u130" class="ax_default connector">
        <img id="u130_seg0" class="img " src="dailyimg/u130_seg0.png"/>
        <img id="u130_seg1" class="img " src="dailyimg/u130_seg1.png"/>
        <img id="u130_seg2" class="img " src="dailyimg/u130_seg2.png"/>
        <img id="u130_seg3" class="img " src="dailyimg/u130_seg3.png"/>
        <div id="u131" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u132" class="ax_default connector">
        <img id="u132_seg0" class="img " src="dailyimg/u132_seg0.png"/>
        <img id="u132_seg1" class="img " src="dailyimg/u132_seg1.png"/>
        <div id="u133" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u134" class="ax_default connector">
        <img id="u134_seg0" class="img " src="dailyimg/u134_seg0.png"/>
        <img id="u134_seg1" class="img " src="dailyimg/u134_seg1.png"/>
        <div id="u135" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u136" class="ax_default connector">
        <img id="u136_seg0" class="img " src="dailyimg/u132_seg0.png"/>
        <img id="u136_seg1" class="img " src="dailyimg/u132_seg1.png"/>
        <div id="u137" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u138" class="ax_default connector">
        <img id="u138_seg0" class="img " src="dailyimg/u138_seg0.png"/>
        <img id="u138_seg1" class="img " src="dailyimg/u138_seg1.png"/>
        <div id="u139" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u144" class="ax_default connector">
        <img id="u144_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u144_seg1" class="img " src="dailyimg/u144_seg1.png"/>
        <img id="u144_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u144_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u145" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u146" class="ax_default connector">
        <img id="u146_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u146_seg1" class="img " src="dailyimg/u146_seg1.png"/>
        <img id="u146_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u146_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u147" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u148" class="ax_default connector">
        <img id="u148_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u148_seg1" class="img " src="dailyimg/u148_seg1.png"/>
        <img id="u148_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u148_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u149" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u162" class="ax_default connector">
        <img id="u162_seg0" class="img " src="dailyimg/u144_seg0.png"/>
        <img id="u162_seg1" class="img " src="dailyimg/u162_seg1.png"/>
        <img id="u162_seg2" class="img " src="dailyimg/u144_seg2.png"/>
        <img id="u162_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u163" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u164" class="ax_default connector">
        <img id="u164_seg0" class="img " src="dailyimg/u164_seg0.png"/>
        <img id="u164_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u165" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u166" class="ax_default connector">
        <img id="u166_seg0" class="img " src="dailyimg/u166_seg0.png"/>
        <img id="u166_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u167" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u168" class="ax_default connector">
        <img id="u168_seg0" class="img " src="dailyimg/u164_seg0.png"/>
        <img id="u168_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u169" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u170" class="ax_default connector">
        <img id="u170_seg0" class="img " src="dailyimg/u164_seg0.png"/>
        <img id="u170_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u171" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u172" class="ax_default connector">
        <img id="u172_seg0" class="img " src="dailyimg/u172_seg0.png"/>
        <img id="u172_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u173" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u176" class="ax_default connector">
        <img id="u176_seg0" class="img " src="dailyimg/u176_seg0.png"/>
        <img id="u176_seg1" class="img " src="dailyimg/u176_seg1.png"/>
        <img id="u176_seg2" class="img " src="dailyimg/u176_seg2.png"/>
        <img id="u176_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u177" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u178" class="ax_default connector">
        <img id="u178_seg0" class="img " src="dailyimg/u82_seg0.png"/>
        <img id="u178_seg1" class="img " src="dailyimg/u178_seg1.png"/>
        <img id="u178_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u178_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u179" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u180" class="ax_default connector">
        <img id="u180_seg0" class="img " src="dailyimg/u82_seg0.png"/>
        <img id="u180_seg1" class="img " src="dailyimg/u180_seg1.png"/>
        <img id="u180_seg2" class="img " src="dailyimg/u58_seg2.png"/>
        <img id="u180_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u181" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u182" class="ax_default connector">
        <img id="u182_seg0" class="img " src="dailyimg/u182_seg0.png"/>
        <img id="u182_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u183" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u184" class="ax_default connector">
        <img id="u184_seg0" class="img " src="dailyimg/u120_seg0.png"/>
        <img id="u184_seg1" class="img " src="dailyimg/u46_seg1.png"/>
        <div id="u185" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u186" class="ax_default connector">
        <img id="u186_seg0" class="img " src="dailyimg/u186_seg0.png"/>
        <img id="u186_seg1" class="img " src="dailyimg/u186_seg1.png"/>
        <img id="u186_seg2" class="img " src="dailyimg/u186_seg2.png"/>
        <img id="u186_seg3" class="img " src="dailyimg/u56_seg3.png"/>
        <div id="u187" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <div id="u188" class="ax_default box_1">
        <div id="u188_div" class=""></div>
        <div id="u189" class="text">
          <p><span>未开始</span></p>
        </div>
      </div>

      <div id="u190" class="ax_default box_1">
        <div id="u190_div" class=""></div>
        <div id="u191" class="text">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u192" class="ax_default box_1">
        <div id="u192_div" class=""></div>
        <div id="u193" class="text">
          <p><span>成功</span></p>
        </div>
      </div>

      <div id="u194" class="ax_default box_1">
        <div id="u194_div" class=""></div>
        <div id="u195" class="text">
          <p><span>失败</span></p>
        </div>
      </div>
    </div>
</body>

</html>