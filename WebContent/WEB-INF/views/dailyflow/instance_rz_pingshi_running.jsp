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
<jsp:include page="../header_rz_pingshi.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
.stronger-border {
	border-width:2px;
}
body{margin:0;padding:0;}
.content {
	position:relative;
	width:calc(100% - 1px); 
	margin-top:50px;
	height:calc(100vh - 50px); 
	background-color:#F5F3F4;
} 
.connector>img {
	max-width:400px;
}
.hide{display:none }
 .progress{z-index: 2000}
 .mask{position: fixed;top: 0;right: 0;bottom: 0;left: 0; z-index: 1000; background-color: #000000}
 .modal{width:750px;left:43%;}
 .ax_default{cursor:pointer;}
</style>
<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
</head>

<body>
	
	<!-- 日志模态框（Modal） -->
	<div class="modal fade modalframe" id="showlog"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">日志信息</h4>
				</div>
				<div class="modal-body">
					<textarea rows="10" style="width:100%;height:100%;resize:none;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


    <div id="base">
		<div id="u0">
	        <img id="u0_img" class="img" src="dailyimg/u0.jpg"/>
	    </div>
	    
	    <div id="u2" class="ax_default">
	        <div id="u2_div"></div>
	        <div id="u3" class="text">
	          <p><span>5600-501/502</span></p><p><span>检查机构和操作员</span></p>
	        </div>
	    </div>
	    
	    <div id="u4" class="ax_default">
	        <div id="u4_div"></div>
	        <div id="u5" class="text">
	          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
	        </div>
	    </div>

      <div id="u6" class="ax_default">
        <div id="u6_div"></div>
        <div id="u7" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>

      <div id="u8" class="ax_default">
        <div id="u8_div"></div>
        <div id="u9" class="text">
          <p><span>5513</span></p><p><span>存款每日计提</span></p>
        </div>
      </div>

      <div id="u10" class="ax_default">
        <div id="u10_div"></div>
        <div id="u11" class="text">
          <p><span>5528-1</span></p><p><span>work数据采集</span></p>
        </div>
      </div>

      <div id="u12" class="ax_default">
        <div id="u12_div"></div>
        <div id="u13" class="text">
          <p><span>55dj5</span></p><p><span>批量文件传出</span></p>
        </div>
      </div>

      <div id="u14" class="ax_default">
        <div id="u14_div"></div>
        <div id="u15" class="text">
          <p><span>5600-701</span></p><p><span>信贷日终前flashcopy</span></p>
        </div>
      </div>

      <div id="u16" class="ax_default">
        <div id="u16_div"></div>
        <div id="u17" class="text">
          <p><span>5600-702</span></p><p><span>信贷日终前备份</span></p>
        </div>
      </div>

      <div id="u18" class="ax_default">
        <div id="u18_div"></div>
        <div id="u19" class="text">
          <p><span>5555</span></p><p><span>comstar发往核心记账</span></p>
        </div>
      </div>

      <div id="u20" class="ax_default">
        <div id="u20_div"></div>
        <div id="u21" class="text">
          <p><span>5556</span></p><p><span>comstar发往核心对账</span></p>
        </div>
      </div>

      <div id="u22" class="ax_default">
        <div id="u22_div"></div>
        <div id="u23" class="text">
          <p><span>55pj</span></p><p><span>票据日终</span></p>
        </div>
      </div>

      <div id="u24" class="ax_default">
        <div id="u24_div"></div>
        <div id="u25" class="text">
          <p><span>55dj2</span></p><p><span>批量文件导入</span></p>
        </div>
      </div>

      <div id="u26" class="ax_default">
        <div id="u26_div"></div>
        <div id="u27" class="text">
          <p><span>55dj3</span></p><p><span>批量启动菜单</span></p>
        </div>
      </div>

      <div id="u28" class="ax_default">
        <div id="u28_div"></div>
        <div id="u29" class="text">
          <p><span>55ebs</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>

      <div id="u30" class="ax_default">
        <div id="u30_div"></div>
        <div id="u31" class="text">
          <p><span>55vat1</span></p><p><span>查看导数结果</span></p>
        </div>
      </div>

      <div id="u32" class="ax_default">
        <div id="u32_div"></div>
        <div id="u33" class="text">
          <p><span>55vat2</span></p><p><span>VAT日终跑批</span></p>
        </div>
      </div>

      <div id="u34" class="ax_default">
        <div id="u34_div"></div>
        <div id="u35" class="text">
          <p><span>55vat3</span></p><p><span>查看VAT日终结果</span></p>
        </div>
      </div>

      <div id="u36" class="ax_default">
        <div id="u36_div"></div>
        <div id="u37" class="text">
          <p><span>5524</span></p><p><span>信贷cmis日终处理</span></p>
        </div>
      </div>

      <div id="u38" class="ax_default">
        <div id="u38_div"></div>
        <div id="u39" class="text">
          <p><span>5524-2：检查信贷是否具备日终5511条件</span></p>
        </div>
      </div>

      <div id="u40" class="ax_default">
        <div id="u40_div"></div>
        <div id="u41" class="text">
          <p><span>5600-703</span></p><p><span>信贷日终后flashcopy</span></p>
        </div>
      </div>

      <div id="u42" class="ax_default">
        <div id="u42_div"></div>
        <div id="u43" class="text">
          <p><span>5600-704</span></p><p><span>信贷日终后备份</span></p>
        </div>
      </div>

      <div id="u44" class="ax_default">
        <div id="u44_div"></div>
        <div id="u45" class="text">
          <p><span>5600-705</span></p><p><span>信贷数据库导表</span></p>
        </div>
      </div>

      <div id="u46" class="ax_default">
        <div id="u46_div"></div>
        <div id="u47" class="text">
          <p><span>5600-802</span></p><p><span>日终前数据库备份</span></p>
        </div>
      </div>

      <div id="u48" class="ax_defaul">
        <div id="u48_div"></div>
        <div id="u49" class="text">
          <p><span>5511</span></p><p><span>日终周期开始</span></p>
        </div>
      </div>

      <div id="u50" class="ax_default">
        <div id="u50_div"></div>
        <div id="u51" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u52" class="ax_default">
        <div id="u52_div"></div>
        <div id="u53" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u54" class="ax_default">
        <div id="u54_div"></div>
        <div id="u55" class="text">
          <p><span>7972</span></p><p><span>贷记卡约定还款</span></p>
        </div>
      </div>

      <div id="u56" class="ax_default">
        <div id="u56_div"></div>
        <div id="u57" class="text">
          <p><span>5514</span></p><p><span>日终平衡入账</span></p>
        </div>
      </div>

      <div id="u58" class="ax_default">
        <div id="u58_div"></div>
        <div id="u59" class="text">
          <p><span>5501</span></p><p><span>系统日切</span></p>
        </div>
      </div>

      <div id="u60" class="ax_default">
        <div id="u60_div"></div>
        <div id="u61" class="text">
          <p><span>5502</span></p><p><span>系统日启</span></p>
        </div>
      </div>

      <div id="u62" class="ax_default">
        <div id="u62_div"></div>
        <div id="u63" class="text">
          <p><span>7971</span></p><p><span>贷记卡生成清算数据</span></p>
        </div>
      </div>

      <div id="u64" class="ax_default">
        <div id="u64_div"></div>
        <div id="u65" class="text">
          <p><span>5512</span></p><p><span>日终账务处理</span></p>
        </div>
      </div>

      <div id="u66" class="ax_default">
        <div id="u66_div"></div>
        <div id="u67" class="text">
          <p><span>5515</span></p><p><span>日终周期结束</span></p>
        </div>
      </div>

      <div id="u68" class="ax_default">
        <div id="u68_div"></div>
        <div id="u69" class="text">
          <p><span>5506</span></p><p><span>卸载数据至数据中心</span></p>
        </div>
      </div>

      <div id="u70" class="ax_default">
        <div id="u70_div"></div>
        <div id="u71" class="text">
          <p><span>7973</span></p><p><span>贷记卡导入科目明细</span></p>
        </div>
      </div>

      <div id="u72" class="ax_default">
        <div id="u72_div"></div>
        <div id="u73" class="text">
          <p><span>5528-2</span></p><p><span>总账数据迁移</span></p>
        </div>
      </div>

      <div id="u74" class="ax_default">
        <div id="u74_div"></div>
        <div id="u75" class="text">
          <p><span>5528-3</span></p><p><span>VAT供数</span></p>
        </div>
      </div>

      <div id="u76" class="ax_default">
        <div id="u76_div"></div>
        <div id="u77" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u78" class="ax_default">
        <div id="u78_div"></div>
        <div id="u79" class="text">
          <p><span>5600-601</span></p><p><span>清空ics日志表</span></p>
        </div>
      </div>

      <div id="u80" class="ax_default">
        <div id="u80_div"></div>
        <div id="u81" class="text">
          <p><span>5600-803</span></p><p><span>日终后数据库备份</span></p>
        </div>
      </div>

      <div id="u82" class="ax_default">
        <div id="u82_div"></div>
        <div id="u83" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u84" class="ax_default">
        <div id="u84_div"></div>
        <div id="u85" class="text">
          <p><span>5600-503</span></p><p><span>检查workdb日志</span></p>
        </div>
      </div>

      <div id="u86" class="ax_default">
        <div id="u86_div"></div>
        <div id="u87" class="text">
          <p><span>5600-805</span></p><p><span>后台及ics数据库导表</span></p>
        </div>
      </div>

      <div id="u88" class="ax_default">
        <div id="u88_div"></div>
        <div id="u89" class="text">
          <p><span>5525</span></p><p><span>数据中心日终</span></p>
        </div>
      </div>
      
      <div id="u98" class="ax_default">
        <div id="u98_div"></div>
        <div id="u99" class="text">
          <p><span>55pj_2</span></p><p><span>票据日终</span></p>
        </div>
      </div>

      <div id="u90">
        <div id="u90_div"></div>
        <div id="u91" class="text">
          <p><span>未开始</span></p>
        </div>
      </div>

      <div id="u92">
        <div id="u92_div"></div>
        <div id="u93" class="text">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u94">
        <div id="u94_div"></div>
        <div id="u95" class="text">
          <p><span>成功</span></p>
        </div>
      </div>

      <div id="u96">
        <div id="u96_div"></div>
        <div id="u97" class="text">
          <p><span>失败</span></p>
        </div>
      </div>
      
      <div id="u100" class="connector">
        <img id="u100_seg0" class="img" src="dailyimg/u100_seg0.png"/>
        <img id="u100_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u102" class="connector">
        <img id="u102_seg0" class="img" src="dailyimg/u102_seg0.png"/>
        <img id="u102_seg1" class="img" src="dailyimg/u102_seg1.png"/>
        <img id="u102_seg2" class="img" src="dailyimg/u102_seg2.png"/>
        <img id="u102_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u104" class="connector">
        <img id="u104_seg0" class="img" src="dailyimg/u104_seg0.png"/>
        <img id="u104_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u106" class="connector">
        <img id="u106_seg0" class="img" src="dailyimg/u106_seg0.png"/>
        <img id="u106_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u108" class="connector">
        <img id="u108_seg0" class="img" src="dailyimg/u108_seg0.png"/>
        <img id="u108_seg1" class="img" src="dailyimg/u108_seg1.png"/>
        <img id="u108_seg2" class="img" src="dailyimg/u108_seg2.png"/>
        <img id="u108_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u110" class="connector">
        <img id="u110_seg0" class="img" src="dailyimg/u108_seg0.png"/>
        <img id="u110_seg1" class="img" src="dailyimg/u110_seg1.png"/>
        <img id="u110_seg2" class="img" src="dailyimg/u108_seg2.png"/>
        <img id="u110_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u112" class="connector">
        <img id="u112_seg0" class="img" src="dailyimg/u100_seg0.png"/>
        <img id="u112_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u114" class="connector">
        <img id="u114_seg0" class="img" src="dailyimg/u114_seg0.png"/>
        <img id="u114_seg1" class="img" src="dailyimg/u114_seg1.png"/>
        <img id="u114_seg2" class="img" src="dailyimg/u114_seg2.png"/>
        <img id="u114_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u116" class="connector">
        <img id="u116_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u116_seg1" class="img" src="dailyimg/u116_seg1.png"/>
        <img id="u116_seg2" class="img" src="dailyimg/u108_seg2.png"/>
        <img id="u116_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u118" class="connector">
        <img id="u118_seg0" class="img" src="dailyimg/u118_seg0.png"/>
        <img id="u118_seg1" class="img" src="dailyimg/u118_seg1.png"/>
        <img id="u118_seg2" class="img" src="dailyimg/u118_seg2.png"/>
        <img id="u118_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u120" class="connector">
        <img id="u120_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u120_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u122" class="connector">
        <img id="u122_seg0" class="img" src="dailyimg/u122_seg0.png"/>
        <img id="u122_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u124" class="connector">
        <img id="u124_seg0" class="img" src="dailyimg/u124_seg0.png"/>
        <img id="u124_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u126" class="connector">
        <img id="u126_seg0" class="img" src="dailyimg/u126_seg0.png"/>
        <img id="u126_seg1" class="img" src="dailyimg/u126_seg1.png"/>
        <img id="u126_seg2" class="img" src="dailyimg/u126_seg2.png"/>
        <img id="u126_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u128" class="connector">
        <img id="u128_seg0" class="img" src="dailyimg/u128_seg0.png"/>
        <img id="u128_seg1" class="img" src="dailyimg/u128_seg1.png"/>
        <img id="u128_seg2" class="img" src="dailyimg/u128_seg2.png"/>
        <img id="u128_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u130" class="connector">
        <img id="u130_seg0" class="img" src="dailyimg/u128_seg0.png"/>
        <img id="u130_seg1" class="img" src="dailyimg/u130_seg1.png"/>
        <img id="u130_seg2" class="img" src="dailyimg/u128_seg2.png"/>
        <img id="u130_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u132" class="connector">
        <img id="u132_seg0" class="img" src="dailyimg/u132_seg0.png"/>
        <img id="u132_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u134" class="connector">
        <img id="u134_seg0" class="img " src="dailyimg/u120_seg0.png"/>
        <img id="u134_seg1" class="img " src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u136" class="connector">
        <img id="u136_seg0" class="img" src="dailyimg/u136_seg0.png"/>
        <img id="u136_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u138" class="connector">
        <img id="u138_seg0" class="img" src="dailyimg/u138_seg0.png"/>
        <img id="u138_seg1" class="img" src="dailyimg/u138_seg1.png"/>
        <img id="u138_seg2" class="img" src="dailyimg/u118_seg2.png"/>
        <img id="u138_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u140" class="connector">
        <img id="u140_seg0" class="img" src="dailyimg/u140_seg0.png"/>
        <img id="u140_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u142" class="connector">
        <img id="u142_seg0" class="img" src="dailyimg/u142_seg0.png"/>
        <img id="u142_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u144" class="connector">
        <img id="u144_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u144_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u146" class="connector">
        <img id="u146_seg0" class="img" src="dailyimg/u146_seg0.png"/>
        <img id="u146_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u148" class="connector">
        <img id="u148_seg0" class="img" src="dailyimg/u148_seg0.png"/>
        <img id="u148_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u150" class="connector">
        <img id="u150_seg0" class="img" src="dailyimg/u146_seg0.png"/>
        <img id="u150_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u152" class="connector">
        <img id="u152_seg0" class="img" src="dailyimg/u152_seg0.png"/>
        <img id="u152_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u154" class="connector">
        <img id="u154_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u154_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u156" class="connector">
        <img id="u156_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u156_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u158" class="connector">
        <img id="u158_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u158_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u160" class="connector">
        <img id="u160_seg0" class="img" src="dailyimg/u160_seg0.png"/>
        <img id="u160_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u162" class="connector">
        <img id="u162_seg0" class="img" src="dailyimg/u162_seg0.png"/>
        <img id="u162_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u164" class="connector">
        <img id="u164_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u164_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u166" class="connector">
        <img id="u166_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u166_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u168" class="connector">
        <img id="u168_seg0" class="img" src="dailyimg/u136_seg0.png"/>
        <img id="u168_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u170" class="connector">
        <img id="u170_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u170_seg1" class="img" src="dailyimg/u104_seg1.png"/>
      </div>

      <div id="u172" class="connector">
        <img id="u172_seg0" class="img" src="dailyimg/u162_seg0.png"/>
        <img id="u172_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u174" class="connector">
        <img id="u174_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u174_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u176" class="connector">
        <img id="u176_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u176_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u178" class="connector">
        <img id="u178_seg0" class="img" src="dailyimg/u162_seg0.png"/>
        <img id="u178_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u180" class="connector">
        <img id="u180_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u180_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u182" class="connector">
        <img id="u182_seg0" class="img" src="dailyimg/u182_seg0.png"/>
        <img id="u182_seg1" class="img" src="dailyimg/u182_seg1.png"/>
        <img id="u182_seg2" class="img" src="dailyimg/u182_seg2.png"/>
        <img id="u182_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u184" class="connector">
        <img id="u184_seg0" class="img" src="dailyimg/u182_seg0.png"/>
        <img id="u184_seg1" class="img" src="dailyimg/u184_seg1.png"/>
        <img id="u184_seg2" class="img" src="dailyimg/u182_seg2.png"/>
        <img id="u184_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u186" class="connector">
        <img id="u186_seg0" class="img" src="dailyimg/u182_seg0.png"/>
        <img id="u186_seg1" class="img" src="dailyimg/u186_seg1.png"/>
        <img id="u186_seg2" class="img" src="dailyimg/u182_seg2.png"/>
        <img id="u186_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u188" class="connector">
        <img id="u188_seg0" class="img" src="dailyimg/u182_seg0.png"/>
        <img id="u188_seg1" class="img" src="dailyimg/u188_seg1.png"/>
        <img id="u188_seg2" class="img" src="dailyimg/u182_seg2.png"/>
        <img id="u188_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u190" class="connector">
        <img id="u190_seg0" class="img" src="dailyimg/u182_seg0.png"/>
        <img id="u190_seg1" class="img" src="dailyimg/u190_seg1.png"/>
        <img id="u190_seg2" class="img" src="dailyimg/u182_seg2.png"/>
        <img id="u190_seg3" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u192">
        <img id="u192_img" class="img" src="dailyimg/u192.png"/>
      </div>
      
      <div id="u194">
        <div id="u195" class="text">
          <p><span style="font-size:23px;">吴江农村商业银行</span></p><p><span style="font-size:10px;">WUJIANG RURAL COMMERCIAL BANK</span></p>
        </div>
      </div>
      
      <div id="u197">
         <div id="u198" class="text">
           <p><span>日&nbsp; 终&nbsp; 流&nbsp; 程&nbsp;&nbsp; </span></p>
         </div>
      </div>

    </div>
    
    <img id="progressImgage" class="progress hide" style="width:5%;height:5vh;" alt="请稍等，处理中。。。" src="img/process.gif"/>
    <div id="maskOfProgressImage" class="mask hide"></div>
	
	
</body>

</html>