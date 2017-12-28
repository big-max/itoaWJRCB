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
<jsp:include page="../header_rz_pingshi.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
body{
	margin:0;padding:0;
}
.connector>img { max-width:400px; }
.hide{ display:none; }
.progress{ z-index: 2000; }
.mask{ position: fixed;top: 0;right: 0;bottom: 0;left: 0; z-index: 1000; background-color: #000000; }
.modal{ width:750px;left:43%; }
.ax_default{ cursor:pointer; }
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
      
      <div id="u2" class="ax_default 501502">
        <div id="u2_div"></div>
        <div id="u3" class="text">
          <p><span>5600-501/502</span></p><p><span>检查机构和操作员</span></p>
        </div>
      </div>

      <div id="u4" class="ax_default 706">
        <div id="u4_div"></div>
        <div id="u5" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>

      <div id="u6" class="ax_default 706_2">
        <div id="u6_div"></div>
        <div id="u7" class="text">
          <p><span>5600-706</span></p><p><span>信贷备份检查</span></p>
        </div>
      </div>
      
      <div id="u8" class="ax_default 5513">
        <div id="u8_div"></div>
        <div id="u9" class="text">
          <p><span>5513</span></p><p><span>存款每日计提</span></p>
        </div>
      </div>

      <div id="u10" class="ax_default 5528_1">
        <div id="u10_div"></div>
        <div id="u11" class="text">
          <p><span>5528-1</span></p><p><span>work数据采集</span></p>
        </div>
      </div>

      <div id="u12" class="ax_default 701">
        <div id="u12_div"></div>
        <div id="u13" class="text">
          <p><span>5600-701</span></p><p><span>信贷日终前flashcopy</span></p>
        </div>
      </div>

      <div id="u14" class="ax_default 702">
        <div id="u14_div"></div>
        <div id="u15" class="text">
          <p><span>5600-702</span></p><p><span>信贷日终前备份</span></p>
        </div>
      </div>

      <div id="u16" class="ax_default 5555">
        <div id="u16_div"></div>
        <div id="u17" class="text">
          <p><span>5555</span></p><p><span>comstar发往核心记账</span></p>
        </div>
      </div>
      
      <div id="u18" class="ax_default 5556">
        <div id="u18_div"></div>
        <div id="u19" class="text">
          <p><span>5556</span></p><p><span>comstar发往核心对账</span></p>
        </div>
      </div>

      <div id="u20" class="ax_default 55pj">
        <div id="u20_div"></div>
        <div id="u21" class="text">
          <p><span>55pj</span></p><p><span>票据日终</span></p>
        </div>
      </div>

      <div id="u22" class="ax_default okd_f1">
        <div id="u22_div"></div>
        <div id="u23" class="text">
          <p><span>银联和行内</span></p><p><span>清算文件</span></p>
        </div>
      </div>

      <div id="u24" class="ax_default 55ebs">
        <div id="u24_div"></div>
        <div id="u25" class="text">
          <p><span>55ebs</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>

      <div id="u26" class="ax_default 55vat1">
        <div id="u26_div"></div>
        <div id="u27" class="text">
          <p><span>55vat1</span></p><p><span>查看导数结果</span></p>
        </div>
      </div>
      
      <div id="u28" class="ax_default 55vat2">
        <div id="u28_div"></div>
        <div id="u29" class="text">
          <p><span>55vat2</span></p><p><span>VAT日终跑批</span></p>
        </div>
      </div>

      <div id="u30" class="ax_default 55vat3">
        <div id="u30_div"></div>
        <div id="u31" class="text">
          <p><span>55vat3</span></p><p><span>查看VAT日终结果</span></p>
        </div>
      </div>

      <div id="u32" class="ax_default 5524">
        <div id="u32_div" class=""></div>
        <div id="u33" class="text">
          <p><span>5524</span></p><p><span>信贷cmis日终处理</span></p>
        </div>
      </div>

      <div id="u34" class="ax_default 5524_2">
        <div id="u34_div"></div>
        <div id="u35" class="text">
          <p><span>5524-2：检查信贷是否具备日终5511条件</span></p>
        </div>
      </div>

      <div id="u36" class="ax_default 703">
        <div id="u36_div"></div>
        <div id="u37" class="text">
          <p><span>5600-703</span></p><p><span>信贷日终后flashcopy</span></p>
        </div>
      </div>

      <div id="u38" class="ax_default 704">
        <div id="u38_div"></div>
        <div id="u39" class="text">
          <p><span>5600-704</span></p><p><span>信贷日终后备份</span></p>
        </div>
      </div>

      <div id="u40" class="ax_default 705">
        <div id="u40_div"></div>
        <div id="u41" class="text">
          <p><span>5600-705</span></p><p><span>信贷数据库导表</span></p>
        </div>
      </div>
      
      <div id="u42" class="ax_default 802">
        <div id="u42_div"></div>
        <div id="u43" class="text">
          <p><span>5600-802</span></p><p><span>日终前数据库备份</span></p>
        </div>
      </div>

      <div id="u44" class="ax_default 5511">
        <div id="u44_div"></div>
        <div id="u45" class="text">
          <p><span>5511</span></p><p><span>日终周期开始</span></p>
        </div>
      </div>

      <div id="u46" class="ax_default 801">
        <div id="u46_div"></div>
        <div id="u47" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u48" class="ax_default 806">
        <div id="u48_div"></div>
        <div id="u49" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>

      <div id="u50" class="ax_default 7972">
        <div id="u50_div"></div>
        <div id="u51" class="text">
          <p><span>7972</span></p><p><span>贷记卡约定还款</span></p>
        </div>
      </div>

      <div id="u52" class="ax_default 5514">
        <div id="u52_div"></div>
        <div id="u53" class="text">
          <p><span>5514</span></p><p><span>日终平衡入账</span></p>
        </div>
      </div>
      
      <div id="u54" class="ax_default 5501">
        <div id="u54_div"></div>
        <div id="u55" class="text">
          <p><span>5501</span></p><p><span>系统日切</span></p>
        </div>
      </div>

      <div id="u56" class="ax_default 5502">
        <div id="u56_div"></div>
        <div id="u57" class="text">
          <p><span>5502</span></p><p><span>系统日启</span></p>
        </div>
      </div>

      <div id="u58" class="ax_default 7971">
        <div id="u58_div"></div>
        <div id="u59" class="text">
          <p><span>7971</span></p><p><span>贷记卡生成清算数据</span></p>
        </div>
      </div>

      <div id="u60" class="ax_default 5512">
        <div id="u60_div"></div>
        <div id="u61" class="text">
          <p><span>5512</span></p><p><span>日终账务处理</span></p>
        </div>
      </div>

      <div id="u62" class="ax_default 5515">
        <div id="u62_div"></div>
        <div id="u63" class="text">
          <p><span>5515</span></p><p><span>日终周期结束</span></p>
        </div>
      </div>

      <div id="u64" class="ax_default 5506">
        <div id="u64_div"></div>
        <div id="u65" class="text">
          <p><span>5506</span></p><p><span>卸载数据至数据中心</span></p>
        </div>
      </div>

      <div id="u66" class="ax_default 7973">
        <div id="u66_div"></div>
        <div id="u67" class="text">
          <p><span>7973</span></p><p><span>贷记卡导入科目明细</span></p>
        </div>
      </div>
      
      <div id="u68" class="ax_default 5528_2">
        <div id="u68_div"></div>
        <div id="u69" class="text">
          <p><span>5528-2</span></p><p><span>总账数据迁移</span></p>
        </div>
      </div>

      <div id="u70" class="ax_default 5528_3">
        <div id="u70_div"></div>
        <div id="u71" class="text">
          <p><span>5528-3</span></p><p><span>VAT供数</span></p>
        </div>
      </div>

      <div id="u72" class="ax_default 801_2">
        <div id="u72_div"></div>
        <div id="u73" class="text">
          <p><span>5600-801</span></p><p><span>flashcopy后台及ics</span></p>
        </div>
      </div>

      <div id="u74" class="ax_default 601">
        <div id="u74_div"></div>
        <div id="u75" class="text">
          <p><span>5600-601</span></p><p><span>清空ics日志表</span></p>
        </div>
      </div>

      <div id="u76" class="ax_default 803">
        <div id="u76_div"></div>
        <div id="u77" class="text">
          <p><span>5600-803</span></p><p><span>日终后数据库备份</span></p>
        </div>
      </div>

      <div id="u78" class="ax_default 806_2">
        <div id="u78_div"></div>
        <div id="u79" class="text">
          <p><span>5600-806</span></p><p><span>备份检查</span></p>
        </div>
      </div>
      
      <div id="u80" class="ax_default 503">
        <div id="u80_div"></div>
        <div id="u81" class="text">
          <p><span>5600-503</span></p><p><span>检查workdb日志</span></p>
        </div>
      </div>

      <div id="u82" class="ax_default 805">
        <div id="u82_div"></div>
        <div id="u83" class="text">
          <p><span>5600-805</span></p><p><span>后台及ics数据库导表</span></p>
        </div>
      </div>

      <div id="u84" class="ax_default 5525">
        <div id="u84_div"></div>
        <div id="u85" class="text">
          <p><span>5525</span></p><p><span>数据中心日终</span></p>
        </div>
      </div>
      
      <div id="u94" class="ax_default 55pj_2">
        <div id="u94_div"></div>
        <div id="u95" class="text">
          <p><span>55pj_2</span></p><p><span>票据日终</span></p>
        </div>
      </div>
      
      <div id="u191" class="ax_default 55ebs_2">
        <div id="u191_div"></div>
        <div id="u192" class="text">
          <p><span>55ebs-2</span></p><p><span>提交总控主程序</span></p>
        </div>
      </div>
      
      <div id="u195" class="ax_default rz_start">
        <div id="u195_div"></div>
        <div id="u196" class="text">
          <p><span>开始</span></p>
        </div>
      </div>
      
      <div id="u199" class="ax_default okd_f2">
        <div id="u199_div"></div>
        <div id="u200" class="text">
          <p><span>人民币柜面</span></p><p><span>还款文件</span></p>
        </div>
      </div>
      
      <div id="u203" class="ax_default okd_f3">
        <div id="u203_div"></div>
        <div id="u204" class="text">
          <p><span>人民币自动</span></p><p><span>扣缴回盘文件</span></p>
        </div>
      </div>
      
      <div id="u207" class="ax_default okd_m1">
        <div id="u207_div"></div>
        <div id="u208" class="text">
          <p><span>核心处理检查</span></p><p><span>跑批标志</span></p>
        </div>
      </div>

      <div id="u209" class="ax_default okd_m2">
        <div id="u209_div"></div>
        <div id="u210" class="text">
          <p><span>批前合并清算</span></p><p><span>文件到dat目录</span></p>
        </div>
      </div>

      <div id="u211" class="ax_default okd_m3">
        <div id="u211_div"></div>
        <div id="u212" class="text">
          <p><span>批前检查</span></p><p><span>清算文件长度</span></p>
        </div>
      </div>
      
      <div id="u219" class="ax_default okd_m6">
        <div id="u219_div"></div>
        <div id="u220" class="text">
          <p><span>批后备份</span></p>
        </div>
      </div>

      <div id="u221" class="ax_default okd_m5">
        <div id="u221_div"></div>
        <div id="u222" class="text">
          <p><span>核心批处理</span></p>
        </div>
      </div>

      <div id="u223" class="ax_default okd_m4">
        <div id="u223_div"></div>
        <div id="u224" class="text">
          <p><span>批前备份</span></p>
        </div>
      </div>
      
      <div id="u231" class="ax_default okd_m7">
        <div id="u231_div"></div>
        <div id="u232" class="text">
          <p><span>批后发送文件处理</span></p>
        </div>
      </div>

      <div id="u233" class="ax_default okd_m8">
        <div id="u233_div"></div>
        <div id="u234" class="text">
          <p><span>批后目录清理</span></p>
        </div>
      </div>

      <div id="u235" class="ax_default okd_m9">
        <div id="u235_div"></div>
        <div id="u236" class="text">
          <p><span>释放跑批标志</span></p>
        </div>
      </div>
      
      <div id="u243" class="ax_default okd_t3">
        <div id="u243_div"></div>
        <div id="u244" class="text">
          <p><span>STM文件</span></p>
        </div>
      </div>

      <div id="u245" class="ax_default okd_t2">
        <div id="u245_div"></div>
        <div id="u246" class="text">
          <p><span>PTX文件</span></p>
        </div>
      </div>

      <div id="u247" class="ax_default okd_t1">
        <div id="u247_div"></div>
        <div id="u248" class="text">
          <p><span>PSM文件</span></p>
        </div>
      </div>
      
      <div id="u255" class="ax_default okd_t4">
        <div id="u255_div"></div>
        <div id="u256" class="text">
          <p><span>GL文件</span></p>
        </div>
      </div>

      <div id="u257" class="ax_default okd_t5">
        <div id="u257_div"></div>
        <div id="u258" class="text">
          <p><span>VIP文件</span></p>
        </div>
      </div>

      <div id="u259" class="ax_default okd_t6">
        <div id="u259_div"></div>
        <div id="u260" class="text">
          <p><span>忠诚兑换文件</span></p>
        </div>
      </div>
      
      <div id="u267" class="ax_default okd_t9">
        <div id="u267_div"></div>
        <div id="u268" class="text">
          <p><span>批前备份文件传出</span></p>
        </div>
      </div>

      <div id="u269" class="ax_default okd_t8">
        <div id="u269_div"></div>
        <div id="u270" class="text">
          <p><span>IC卡制卡文件传出</span></p>
        </div>
      </div>

      <div id="u271" class="ax_default okd_t7">
        <div id="u271_div"></div>
        <div id="u272" class="text">
          <p><span>所有文件</span></p>
        </div>
      </div>
      
      <div id="u279" class="ax_default okd_t10">
        <div id="u279_div"></div>
        <div id="u280" class="text">
          <p><span>批后备份文件传出</span></p>
        </div>
      </div>
      
      <div id="u96" class="connector">
        <img id="u96_seg0" class="img" src="dailyimg/u96_seg0.png"/>
        <img id="u96_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u98" class="connector">
        <img id="u98_seg0" class="img" src="dailyimg/u98_seg0.png"/>
        <img id="u98_seg1" class="img" src="dailyimg/u98_seg1.png"/>
        <img id="u98_seg2" class="img" src="dailyimg/u98_seg2.png"/>
        <img id="u98_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u100" class="connector">
        <img id="u100_seg0" class="img" src="dailyimg/u100_seg0.png"/>
        <img id="u100_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u102" class="connector">
        <img id="u102_seg0" class="img" src="dailyimg/u102_seg0.png"/>
        <img id="u102_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u104" class="connector">
        <img id="u104_seg0" class="img" src="dailyimg/u104_seg0.png"/>
        <img id="u104_seg1" class="img" src="dailyimg/u104_seg1.png"/>
        <img id="u104_seg2" class="img" src="dailyimg/u104_seg2.png"/>
        <img id="u104_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u106" class="connector">
        <img id="u106_seg0" class="img" src="dailyimg/u104_seg0.png"/>
        <img id="u106_seg1" class="img" src="dailyimg/u106_seg1.png"/>
        <img id="u106_seg2" class="img" src="dailyimg/u104_seg2.png"/>
        <img id="u106_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u108" class="connector">
        <img id="u108_seg0" class="img" src="dailyimg/u96_seg0.png"/>
        <img id="u108_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u110" class="connector">
        <img id="u110_seg0" class="img" src="dailyimg/u110_seg0.png"/>
        <img id="u110_seg1" class="img" src="dailyimg/u110_seg1.png"/>
        <img id="u110_seg2" class="img" src="dailyimg/u110_seg2.png"/>
        <img id="u110_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u112" class="connector">
        <img id="u112_seg0" class="img" src="dailyimg/u112_seg0.png"/>
        <img id="u112_seg1" class="img" src="dailyimg/u112_seg1.png"/>
        <img id="u112_seg2" class="img" src="dailyimg/u104_seg2.png"/>
        <img id="u112_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u114" class="connector">
        <img id="u114_seg0" class="img" src="dailyimg/u114_seg0.png"/>
        <img id="u114_seg1" class="img" src="dailyimg/u114_seg1.png"/>
        <img id="u114_seg2" class="img" src="dailyimg/u114_seg2.png"/>
        <img id="u114_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u116" class="connector">
        <img id="u116_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u116_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u118" class="connector">
        <img id="u118_seg0" class="img" src="dailyimg/u118_seg0.png"/>
        <img id="u118_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u120" class="connector">
        <img id="u120_seg0" class="img" src="dailyimg/u120_seg0.png"/>
        <img id="u120_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u122" class="connector">
        <img id="u122_seg0" class="img" src="dailyimg/u122_seg0.png"/>
        <img id="u122_seg1" class="img" src="dailyimg/u122_seg1.png"/>
        <img id="u122_seg2" class="img" src="dailyimg/u122_seg2.png"/>
        <img id="u122_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u124" class="connector">
        <img id="u124_seg0" class="img" src="dailyimg/u124_seg0.png"/>
        <img id="u124_seg1" class="img" src="dailyimg/u124_seg1.png"/>
        <img id="u124_seg2" class="img" src="dailyimg/u124_seg2.png"/>
        <img id="u124_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u126" class="connector">
        <img id="u126_seg0" class="img" src="dailyimg/u124_seg0.png"/>
        <img id="u126_seg1" class="img" src="dailyimg/u126_seg1.png"/>
        <img id="u126_seg2" class="img" src="dailyimg/u124_seg2.png"/>
        <img id="u126_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u128" class="connector">
        <img id="u128_seg0" class="img" src="dailyimg/u128_seg0.png"/>
        <img id="u128_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u130" class="connector">
        <img id="u130_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u130_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u132" class="connector">
        <img id="u132_seg0" class="img" src="dailyimg/u132_seg0.png"/>
        <img id="u132_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u134" class="connector">
        <img id="u134_seg0" class="img" src="dailyimg/u134_seg0.png"/>
        <img id="u134_seg1" class="img" src="dailyimg/u134_seg1.png"/>
        <img id="u134_seg2" class="img" src="dailyimg/u114_seg2.png"/>
        <img id="u134_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u136" class="connector">
        <img id="u136_seg0" class="img" src="dailyimg/u136_seg0.png"/>
        <img id="u136_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u138" class="connector">
        <img id="u138_seg0" class="img" src="dailyimg/u138_seg0.png"/>
        <img id="u138_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u140" class="connector">
        <img id="u140_seg0" class="img" src="dailyimg/u140_seg0.png"/>
        <img id="u140_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u142" class="connector">
        <img id="u142_seg0" class="img" src="dailyimg/u142_seg0.png"/>
        <img id="u142_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u144" class="connector">
        <img id="u144_seg0" class="img" src="dailyimg/u144_seg0.png"/>
        <img id="u144_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u146" class="connector">
        <img id="u146_seg0" class="img" src="dailyimg/u142_seg0.png"/>
        <img id="u146_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u148" class="connector">
        <img id="u148_seg0" class="img" src="dailyimg/u148_seg0.png"/>
        <img id="u148_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u150" class="connector">
        <img id="u150_seg0" class="img" src="dailyimg/u150_seg0.png"/>
        <img id="u150_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u152" class="connector">
        <img id="u152_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u152_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u154" class="connector">
        <img id="u154_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u154_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u156" class="connector">
        <img id="u156_seg0" class="img" src="dailyimg/u156_seg0.png"/>
        <img id="u156_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u158" class="connector">
        <img id="u158_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u158_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u160" class="connector">
        <img id="u160_seg0" class="img" src="dailyimg/u160_seg0.png"/>
        <img id="u160_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u162" class="connector">
        <img id="u162_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u162_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u164" class="connector">
        <img id="u164_seg0" class="img" src="dailyimg/u164_seg0.png"/>
        <img id="u164_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u166" class="connector">
        <img id="u166_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u166_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u168" class="connector">
        <img id="u168_seg0" class="img" src="dailyimg/u116_seg0.png"/>
        <img id="u168_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u170" class="connector">
        <img id="u170_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u170_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u172" class="connector">
        <img id="u172_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u172_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u174" class="connector">
        <img id="u174_seg0" class="img" src="dailyimg/u174_seg0.png"/>
        <img id="u174_seg1" class="img" src="dailyimg/u174_seg1.png"/>
        <img id="u174_seg2" class="img" src="dailyimg/u174_seg2.png"/>
        <img id="u174_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u176" class="connector">
        <img id="u176_seg0" class="img" src="dailyimg/u174_seg0.png"/>
        <img id="u176_seg1" class="img" src="dailyimg/u176_seg1.png"/>
        <img id="u176_seg2" class="img" src="dailyimg/u174_seg2.png"/>
        <img id="u176_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u178" class="connector">
        <img id="u178_seg0" class="img" src="dailyimg/u174_seg0.png"/>
        <img id="u178_seg1" class="img" src="dailyimg/u178_seg1.png"/>
        <img id="u178_seg2" class="img" src="dailyimg/u174_seg2.png"/>
        <img id="u178_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u180" class="connector">
        <img id="u180_seg0" class="img" src="dailyimg/u180_seg0.png"/>
        <img id="u180_seg1" class="img" src="dailyimg/u180_seg1.png"/>
        <img id="u180_seg2" class="img" src="dailyimg/u180_seg2.png"/>
        <img id="u180_seg3" class="img" src="dailyimg/u96_seg1.png"/>      
      </div>

      <div id="u182" class="connector">
        <img id="u182_seg0" class="img" src="dailyimg/u174_seg0.png"/>
        <img id="u182_seg1" class="img" src="dailyimg/u182_seg1.png"/>
        <img id="u182_seg2" class="img" src="dailyimg/u174_seg2.png"/>
        <img id="u182_seg3" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u193" class="connector">
        <img id="u193_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u193_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u197" class="connector">
        <img id="u197_seg0" class="img" src="dailyimg/u197_seg0.png"/>
        <img id="u197_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u201" class="connector">
        <img id="u201_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u201_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u205" class="connector">
        <img id="u205_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u205_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u213" class="connector">
        <img id="u213_seg0" class="img" src="dailyimg/u213_seg0.png"/>
        <img id="u213_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u215" class="connector">
        <img id="u215_seg0" class="img" src="dailyimg/u160_seg0.png"/>
        <img id="u215_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u217" class="connector">
        <img id="u217_seg0" class="img" src="dailyimg/u217_seg0.png"/>
        <img id="u217_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>
      
      <div id="u225" class="connector">
        <img id="u225_seg0" class="img" src="dailyimg/u213_seg0.png"/>
        <img id="u225_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u227" class="connector">
        <img id="u227_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u227_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u229" class="connector">
        <img id="u229_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u229_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u237" class="connector">
        <img id="u237_seg0" class="img" src="dailyimg/u213_seg0.png"/>
        <img id="u237_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u239" class="connector">
        <img id="u239_seg0" class="img" src="dailyimg/u160_seg0.png"/>
        <img id="u239_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u241" class="connector">
        <img id="u241_seg0" class="img" src="dailyimg/u217_seg0.png"/>
        <img id="u241_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u249" class="connector">
        <img id="u249_seg0" class="img" src="dailyimg/u156_seg0.png"/>
        <img id="u249_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u251" class="connector">
        <img id="u251_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u251_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>

      <div id="u253" class="connector">
        <img id="u253_seg0" class="img" src="dailyimg/u158_seg0.png"/>
        <img id="u253_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u261" class="connector">
        <img id="u261_seg0" class="img" src="dailyimg/u136_seg0.png"/>
        <img id="u261_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u263" class="connector">
        <img id="u263_seg0" class="img" src="dailyimg/u160_seg0.png"/>
        <img id="u263_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u265" class="connector">
        <img id="u265_seg0" class="img" src="dailyimg/u217_seg0.png"/>
        <img id="u265_seg1" class="img" src="dailyimg/u160_seg1.png"/>
      </div>

      <div id="u273" class="connector">
        <img id="u273_seg0" class="img" src="dailyimg/u156_seg0.png"/>
        <img id="u273_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>

      <div id="u275" class="connector">
        <img id="u275_seg0" class="img" src="dailyimg/u154_seg0.png"/>
        <img id="u275_seg1" class="img" src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u277" class="connector">
        <img id="u277_seg0" class="img " src="dailyimg/u158_seg0.png"/>
        <img id="u277_seg1" class="img " src="dailyimg/u96_seg1.png"/>
      </div>
      
      <div id="u281" class="connector">
        <img id="u281_seg0" class="img" src="dailyimg/u281_seg0.png"/>
        <img id="u281_seg1" class="img" src="dailyimg/u100_seg1.png"/>
      </div>
      
      <div id="u86">
        <div id="u86_div"></div>
        <div id="u87" class="text">
          <p><span>未开始</span></p>
        </div>
      </div>

      <div id="u88">
        <div id="u88_div"></div>
        <div id="u89" class="text">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u90">
        <div id="u90_div"></div>
        <div id="u91" class="text">
          <p><span>成功</span></p>
        </div>
      </div>

      <div id="u92">
        <div id="u92_div"></div>
        <div id="u93" class="text">
          <p><span>失败</span></p>
        </div>
      </div>
      
      <div id="u283">
        <div id="u283_div"></div>
        <div id="u284" class="text">
          <p><span>需要清理</span></p>
        </div>
      </div>
      
      <div id="u184">
        <img id="u184_img" class="img" src="dailyimg/u184.png"/>
      </div>
      
      <div id="u186">
        <div id="u186_div"></div>
        <div id="u187" class="text">
          <p><span style="font-size:23px;">吴江农村商业银行</span></p><p><span style="font-size:10px;">WUJIANG RURAL COMMERCIAL BANK</span></p>
        </div>
      </div>
      
      <div id="u188" data-left="794" data-top="13" data-width="183" data-height="37">
        <div id="u189">
          <div id="u189_div"></div>
          <div id="u190" class="text">
            <p><span>日&nbsp; 终&nbsp; 流&nbsp; 程&nbsp;&nbsp; </span></p>
          </div>
        </div>
      </div>
      
    </div>
    
    <img id="progressImgage" style="width:120px;height:120px;" alt="请稍等，处理中。。。" src="img/process.gif"/>
    <div id="maskOfProgressImage" class="mask hide"></div>
</body>

<script>
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
		
		$('.ax_default').contextPopup({
	          items: [
		            {label:'查看日志', icon:'img/viewlog.png', action:function() 
		            	{ 
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
		           					$("textarea").text(result.msg);
		           				},
		           			})
		            	} 
		            },
		            {label:'清理&续作', icon:'img/cleanbtn.png', action:function() 
		            	{ 
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
		            },
		            {label:'确认成功', icon:'img/comsucc.png', action:function() 
		            	{ 
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
			            						//var task_div = $('.' + obj.task_id);
					        			        //task_div.find("div:eq(0)").css("border-color","#32CD32") ;
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
	$(".ax_default").tooltip({
	    html: true,
	    container: "body",
	});
	
	//var dag_id = "wjrz_dev"; 
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