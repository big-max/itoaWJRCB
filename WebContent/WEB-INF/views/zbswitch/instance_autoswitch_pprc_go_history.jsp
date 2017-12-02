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
<jsp:include page="../headerpprcgo.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
body{margin:0;padding:0;}
.connector>img {
	max-width:400px;
}
.modal{width:750px;left:43%;}
.ax_default{cursor:pointer;text-align:center;font-size:13px;}
#u181{left:460px;top:33px;width: 200px;}
</style>
</head>

<body>
	<div id="base">

      <div id="u0">
        <img id="u0_img" class="img" src="zbswitchimg/u0.jpg"/>
      </div>

      <div id="u2" class="ax_default pprc_go_start">
        <div id="u2_div"></div>
        <div id="u3" class="text">
          <p><span>开始</span></p>
        </div>
      </div>

      <div id="u4" class="ax_default pprc_go_workdb_backup">
        <div id="u4_div"></div>
        <div id="u5" class="text">
          <p><span>备份workdb数据库</span></p>
        </div>
      </div>

      <div id="u6" class="ax_default pprc_go_backup_end">
        <div id="u6_div"></div>
        <div id="u7" class="text">
          <p><span>完成备份数据库</span></p>
        </div>
      </div>

      <div id="u8" class="ax_default pprc_go_checkha_start">
        <div id="u8_div"></div>
        <div id="u9" class="text">
          <p><span>开始检查HA状态</span></p>
        </div>
      </div>

      <div id="u10" class="ax_default pprc_go_p770a1_check_hastatus">
        <div id="u10_div"></div>
        <div id="u11" class="text">
          <p><span>检查P770a1上</span></p><p><span>HA状态</span></p>
        </div>
      </div>

      <div id="u20" class="ax_default pprc_go_checkha_stop">
        <div id="u20_div"></div>
        <div id="u21" class="text">
          <p><span>完成检查HA状态</span></p>
        </div>
      </div>

      <div id="u22" class="ax_default pprc_go_cmisdb_backup">
        <div id="u22_div"></div>
        <div id="u23" class="text">
          <p><span>备份cmisdb数据库</span></p>
        </div>
      </div>

      <div id="u24" class="ax_default pprc_go_icsdb_backup">
        <div id="u24_div"></div>
        <div id="u25" class="text">
          <p><span>备份icsdb数据库</span></p>
        </div>
      </div>

      <div id="u26" class="ax_default pprc_go_carddb_backup">
        <div id="u26_div"></div>
        <div id="u27" class="text">
          <p><span>备份carddb数据库</span></p>
        </div>
      </div>

      <div id="u28" class="ax_default pprc_go_p770b1_check_hastatus">
        <div id="u28_div"></div>
        <div id="u29" class="text">
          <p><span>检查P770b1上</span></p><p><span>HA状态</span></p>
        </div>
      </div>

      <div id="u30" class="ax_default pprc_go_p770a2_check_hastatus">
        <div id="u30_div"></div>
        <div id="u31" class="text">
          <p><span>检查P770a2上</span></p><p><span>HA状态</span></p>
        </div>
      </div>

      <div id="u32" class="ax_default pprc_go_p770b2_check_hastatus">
        <div id="u32_div"></div>
        <div id="u33" class="text">
          <p><span>检查P770b2上</span></p><p><span>HA状态</span></p>
        </div>
      </div>

      <div id="u34" class="ax_default pprc_go_p770a2_hastop">
        <div id="u34_div"></div>
        <div id="u35" class="text">
          <p><span>停止P770a2 HA</span></p>
        </div>
      </div>

      <div id="u36" class="ax_default pprc_go_p770b2_hastop">
        <div id="u36_div"></div>
        <div id="u37" class="text">
          <p><span>停止P770b2 HA</span></p>
        </div>
      </div>

      <div id="u38" class="ax_default pprc_go_p770a1_hastop">
        <div id="u38_div"></div>
        <div id="u39" class="text">
          <p><span>停止P770a1 HA</span></p>
        </div>
      </div>

      <div id="u40" class="ax_default pprc_go_p770b1_hastop">
        <div id="u40_div"></div>
        <div id="u41" class="text">
          <p><span>停止P770b1 HA</span></p>
        </div>
      </div>

      <div id="u42" class="ax_default pprc_go_ds8k_lunstart">
        <div id="u42_div"></div>
        <div id="u43" class="text">
          <p><span>开始设置DS8K LUN可读写</span></p>
        </div>
      </div>

      <div id="u44" class="ax_default pprc_go_p770a1_lunread_failover">
        <div id="u44_div"></div>
        <div id="u45" class="text">
          <p><span>停止P770a1 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u46" class="ax_default pprc_go_p770b2_lunread_failover">
        <div id="u46_div"></div>
        <div id="u47" class="text">
          <p><span>停止P770b2 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u48" class="ax_default pprc_go_p770b1_lunread_failover">
        <div id="u48_div"></div>
        <div id="u49" class="text">
          <p><span>停止P770b1 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u50" class="ax_default pprc_go_p770a2_lunread_failover">
        <div id="u50_div"></div>
        <div id="u51" class="text">
          <p><span>停止P770a2 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u52" class="ax_default pprc_go_ds8k_lunstop">
        <div id="u52_div"></div>
        <div id="u53" class="text">
          <p><span>完成设置DS8K LUN可读写</span></p>
        </div>
      </div>

      <div id="u54" class="ax_default pprc_go_p770c1_workstart">
        <div id="u54_div"></div>
        <div id="u55" class="text">
          <p><span>启动P770c1 </span></p><p><span>work应用</span></p>
        </div>
      </div>

      <div id="u56" class="ax_default pprc_go_p770c1_workstartcheck">
        <div id="u56_div"></div>
        <div id="u57" class="text">
          <p><span>验证P770c1 </span></p><p><span>work应用</span></p>
        </div>
      </div>

      <div id="u58" class="ax_default pprc_go_p770c1_cmisstart">
        <div id="u58_div"></div>
        <div id="u59" class="text">
          <p><span>启动P770c1 </span></p><p><span>cmis应用</span></p>
        </div>
      </div>

      <div id="u60" class="ax_default pprc_go_p770c1_cmisstartcheck">
        <div id="u60_div"></div>
        <div id="u61" class="text">
          <p><span>验证P770c1 </span></p><p><span>cmis应用</span></p>
        </div>
      </div>

      <div id="u62" class="ax_default pprc_go_p770c2_icsstart">
        <div id="u62_div"></div>
        <div id="u63" class="text">
          <p><span>启动P770c2 </span></p><p><span>ics应用</span></p>
        </div>
      </div>

      <div id="u64" class="ax_default pprc_go_p770c2_icsstartcheck">
        <div id="u64_div"></div>
        <div id="u65" class="text">
          <p><span>验证P770c2 </span></p><p><span>ics应用</span></p>
        </div>
      </div>

      <div id="u66" class="ax_default pprc_go_p770c2_cardstart">
        <div id="u66_div"></div>
        <div id="u67" class="text">
          <p><span>启动P770c2 </span></p><p><span>card应用</span></p>
        </div>
      </div>

      <div id="u68" class="ax_default pprc_go_p770c2_cardstartcheck">
        <div id="u68_div"></div>
        <div id="u69" class="text">
          <p><span>验证P770c2 </span></p><p><span>card应用</span></p>
        </div>
      </div>

      <div id="u70" class="ax_default pprc_go_ywcheck">
        <div id="u70_div"></div>
        <div id="u71" class="text">
          <p><span>业务验证</span></p>
        </div>
      </div>

      <div id="u72" class="ax_default pprc_go_startfailback">
        <div id="u72_div"></div>
        <div id="u73" class="text">
          <p><span>反向启动PPRC</span></p><p><span>&nbsp;H2:H1复制关系</span></p>
        </div>
      </div>

      <div id="u74" class="ax_default pprc_go_p770a1_failback">
        <div id="u74_div"></div>
        <div id="u75" class="text">
          <p><span>启动P770a1 盛泽到吴江复制关系</span></p>
        </div>
      </div>

      <div id="u76" class="ax_default pprc_go_p770b1_failback">
        <div id="u76_div"></div>
        <div id="u77" class="text">
          <p><span>启动P770b1 盛泽到吴江复制关系</span></p>
        </div>
      </div>

      <div id="u78" class="ax_default pprc_go_p770a2_failback">
        <div id="u78_div"></div>
        <div id="u79" class="text">
          <p><span>启动P770a2 盛泽到吴江复制关系</span></p>
        </div>
      </div>

      <div id="u80" class="ax_default pprc_go_p770b2_failback">
        <div id="u80_div"></div>
        <div id="u81" class="text">
          <p><span>启动P770b2 盛泽到吴江复制关系</span></p>
        </div>
      </div>

      <div id="u82" class="ax_default pprc_go_end">
        <div id="u82_div"></div>
        <div id="u83" class="text">
          <p><span>结束</span></p>
        </div>
      </div>

      <div id="u84" class="connector">
        <img id="u84_seg0" class="img" src="zbswitchimg/u84_seg0.png"/>
        <img id="u84_seg1" class="img" src="zbswitchimg/u84_seg1.png"/>
        <img id="u84_seg2" class="img" src="zbswitchimg/u84_seg2.png"/>
        <img id="u84_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u86" class="connector">
        <img id="u86_seg0" class="img" src="zbswitchimg/u86_seg0.png"/>
        <img id="u86_seg1" class="img" src="zbswitchimg/u86_seg1.png"/>
        <img id="u86_seg2" class="img" src="zbswitchimg/u86_seg2.png"/>
        <img id="u86_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u88" class="connector">
        <img id="u88_seg0" class="img" src="zbswitchimg/u84_seg0.png"/>
        <img id="u88_seg1" class="img" src="zbswitchimg/u88_seg1.png"/>
        <img id="u88_seg2" class="img" src="zbswitchimg/u84_seg2.png"/>
        <img id="u88_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u90" class="connector">
        <img id="u90_seg0" class="img" src="zbswitchimg/u86_seg0.png"/>
        <img id="u90_seg1" class="img" src="zbswitchimg/u90_seg1.png"/>
        <img id="u90_seg2" class="img" src="zbswitchimg/u86_seg2.png"/>
        <img id="u90_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u92" class="connector">
        <img id="u92_seg0" class="img" src="zbswitchimg/u92_seg0.png"/>
        <img id="u92_seg1" class="img" src="zbswitchimg/u92_seg1.png"/>
        <img id="u92_seg2" class="img" src="zbswitchimg/u92_seg2.png"/>
        <img id="u92_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u94" class="connector">
        <img id="u94_seg0" class="img" src="zbswitchimg/u92_seg0.png"/>
        <img id="u94_seg1" class="img" src="zbswitchimg/u94_seg1.png"/>
        <img id="u94_seg2" class="img" src="zbswitchimg/u92_seg2.png"/>
        <img id="u94_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u96" class="connector">
        <img id="u96_seg0" class="img" src="zbswitchimg/u96_seg0.png"/>
        <img id="u96_seg1" class="img" src="zbswitchimg/u96_seg1.png"/>
        <img id="u96_seg2" class="img" src="zbswitchimg/u96_seg2.png"/>
        <img id="u96_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u98" class="connector">
        <img id="u98_seg0" class="img" src="zbswitchimg/u96_seg0.png"/>
        <img id="u98_seg1" class="img" src="zbswitchimg/u98_seg1.png"/>
        <img id="u98_seg2" class="img" src="zbswitchimg/u96_seg2.png"/>
        <img id="u98_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u100" class="connector">
        <img id="u100_seg0" class="img" src="zbswitchimg/u100_seg0.png"/>
        <img id="u100_seg1" class="img" src="zbswitchimg/u100_seg1.png"/>
      </div>

      <div id="u102" class="connector">
        <img id="u102_seg0" class="img" src="zbswitchimg/u102_seg0.png"/>
        <img id="u102_seg1" class="img" src="zbswitchimg/u102_seg1.png"/>
        <img id="u102_seg2" class="img" src="zbswitchimg/u102_seg2.png"/>
        <img id="u102_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u104" class="connector">
        <img id="u104_seg0" class="img" src="zbswitchimg/u104_seg0.png"/>
        <img id="u104_seg1" class="img" src="zbswitchimg/u104_seg1.png"/>
        <img id="u104_seg2" class="img" src="zbswitchimg/u104_seg2.png"/>
        <img id="u104_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u106" class="connector">
        <img id="u106_seg0" class="img" src="zbswitchimg/u102_seg0.png"/>
        <img id="u106_seg1" class="img" src="zbswitchimg/u96_seg1.png"/>
        <img id="u106_seg2" class="img" src="zbswitchimg/u102_seg2.png"/>
        <img id="u106_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u108" class="connector">
        <img id="u108_seg0" class="img" src="zbswitchimg/u104_seg0.png"/>
        <img id="u108_seg1" class="img" src="zbswitchimg/u94_seg1.png"/>
        <img id="u108_seg2" class="img" src="zbswitchimg/u104_seg2.png"/>
        <img id="u108_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u110" class="connector">
        <img id="u110_seg0" class="img" src="zbswitchimg/u110_seg0.png"/>
        <img id="u110_seg1" class="img" src="zbswitchimg/u86_seg1.png"/>
        <img id="u110_seg2" class="img" src="zbswitchimg/u110_seg2.png"/>
        <img id="u110_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u112" class="connector">
        <img id="u112_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u112_seg1" class="img" src="zbswitchimg/u84_seg1.png"/>
        <img id="u112_seg2" class="img" src="zbswitchimg/u112_seg2.png"/>
        <img id="u112_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u114" class="connector">
        <img id="u114_seg0" class="img" src="zbswitchimg/u110_seg0.png"/>
        <img id="u114_seg1" class="img" src="zbswitchimg/u114_seg1.png"/>
        <img id="u114_seg2" class="img" src="zbswitchimg/u110_seg2.png"/>
        <img id="u114_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u116" class="connector">
        <img id="u116_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u116_seg1" class="img" src="zbswitchimg/u116_seg1.png"/>
        <img id="u116_seg2" class="img" src="zbswitchimg/u112_seg2.png"/>
        <img id="u116_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u118" class="connector">
        <img id="u118_seg0" class="img" src="zbswitchimg/u118_seg0.png"/>
        <img id="u118_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u120" class="connector">
        <img id="u120_seg0" class="img" src="zbswitchimg/u120_seg0.png"/>
        <img id="u120_seg1" class="img" src="zbswitchimg/u120_seg1.png"/>
      </div>

      <div id="u122" class="connector">
        <img id="u122_seg0" class="img" src="zbswitchimg/u122_seg0.png"/>
        <img id="u122_seg1" class="img" src="zbswitchimg/u122_seg1.png"/>
        <img id="u122_seg2" class="img" src="zbswitchimg/u122_seg2.png"/>
        <img id="u122_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u124" class="connector">
        <img id="u124_seg0" class="img" src="zbswitchimg/u124_seg0.png"/>
        <img id="u124_seg1" class="img" src="zbswitchimg/u124_seg1.png"/>
        <img id="u124_seg2" class="img" src="zbswitchimg/u124_seg2.png"/>
        <img id="u124_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u126" class="connector">
        <img id="u126_seg0" class="img" src="zbswitchimg/u126_seg0.png"/>
        <img id="u126_seg1" class="img" src="zbswitchimg/u126_seg1.png"/>
        <img id="u126_seg2" class="img" src="zbswitchimg/u126_seg2.png"/>
        <img id="u126_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u128" class="connector">
        <img id="u128_seg0" class="img" src="zbswitchimg/u124_seg0.png"/>
        <img id="u128_seg1" class="img" src="zbswitchimg/u128_seg1.png"/>
        <img id="u128_seg2" class="img" src="zbswitchimg/u124_seg2.png"/>
        <img id="u128_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u130" class="connector">
        <img id="u130_seg0" class="img" src="zbswitchimg/u126_seg0.png"/>
        <img id="u130_seg1" class="img" src="zbswitchimg/u130_seg1.png"/>
        <img id="u130_seg2" class="img" src="zbswitchimg/u126_seg2.png"/>
        <img id="u130_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u132" class="connector">
        <img id="u132_seg0" class="img" src="zbswitchimg/u132_seg0.png"/>
        <img id="u132_seg1" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u134" class="connector">
        <img id="u134_seg0" class="img" src="zbswitchimg/u134_seg0.png"/>
        <img id="u134_seg1" class="img" src="zbswitchimg/u134_seg1.png"/>
        <img id="u134_seg2" class="img" src="zbswitchimg/u134_seg2.png"/>
        <img id="u134_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u136" class="connector">
        <img id="u136_seg0" class="img" src="zbswitchimg/u134_seg0.png"/>
        <img id="u136_seg1" class="img" src="zbswitchimg/u136_seg1.png"/>
        <img id="u136_seg2" class="img" src="zbswitchimg/u134_seg2.png"/>
        <img id="u136_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u138" class="connector">
        <img id="u138_seg0" class="img" src="zbswitchimg/u138_seg0.png"/>
        <img id="u138_seg1" class="img" src="zbswitchimg/u138_seg1.png"/>
        <img id="u138_seg2" class="img" src="zbswitchimg/u138_seg2.png"/>
        <img id="u138_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u140" class="connector">
        <img id="u140_seg0" class="img" src="zbswitchimg/u138_seg0.png"/>
        <img id="u140_seg1" class="img" src="zbswitchimg/u140_seg1.png"/>
        <img id="u140_seg2" class="img" src="zbswitchimg/u138_seg2.png"/>
        <img id="u140_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u142" class="connector">
        <img id="u142_seg0" class="img" src="zbswitchimg/u142_seg0.png"/>
        <img id="u142_seg1" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u144" class="connector">
        <img id="u144_seg0" class="img" src="zbswitchimg/u144_seg0.png"/>
        <img id="u144_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u146" class="connector">
        <img id="u146_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u146_seg1" class="img" src="zbswitchimg/u146_seg1.png"/>
        <img id="u146_seg2" class="img" src="zbswitchimg/u146_seg2.png"/>
        <img id="u146_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u148" class="connector">
        <img id="u148_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u148_seg1" class="img" src="zbswitchimg/u148_seg1.png"/>
        <img id="u148_seg2" class="img" src="zbswitchimg/u146_seg2.png"/>
        <img id="u148_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u150" class="connector">
        <img id="u150_seg0" class="img" src="zbswitchimg/u150_seg0.png"/>
        <img id="u150_seg1" class="img" src="zbswitchimg/u94_seg1.png"/>
        <img id="u150_seg2" class="img" src="zbswitchimg/u150_seg2.png"/>
        <img id="u150_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u152" class="connector">
        <img id="u152_seg0" class="img" src="zbswitchimg/u110_seg0.png"/>
        <img id="u152_seg1" class="img" src="zbswitchimg/u92_seg1.png"/>
        <img id="u152_seg2" class="img" src="zbswitchimg/u110_seg2.png"/>
        <img id="u152_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u154" class="connector">
        <img id="u154_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u154_seg1" class="img" src="zbswitchimg/u154_seg1.png"/>
        <img id="u154_seg2" class="img" src="zbswitchimg/u112_seg2.png"/>
        <img id="u154_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u156" class="connector">
        <img id="u156_seg0" class="img" src="zbswitchimg/u110_seg0.png"/>
        <img id="u156_seg1" class="img" src="zbswitchimg/u156_seg1.png"/>
        <img id="u156_seg2" class="img" src="zbswitchimg/u110_seg2.png"/>
        <img id="u156_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u158" class="connector">
        <img id="u158_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u158_seg1" class="img" src="zbswitchimg/u158_seg1.png"/>
        <img id="u158_seg2" class="img" src="zbswitchimg/u112_seg2.png"/>
        <img id="u158_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u160" class="connector">
        <img id="u160_seg0" class="img" src="zbswitchimg/u150_seg0.png"/>
        <img id="u160_seg1" class="img" src="zbswitchimg/u160_seg1.png"/>
        <img id="u160_seg2" class="img" src="zbswitchimg/u150_seg2.png"/>
        <img id="u160_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u162" class="connector">
        <img id="u162_seg0" class="img" src="zbswitchimg/u162_seg0.png"/>
        <img id="u162_seg1" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u164" class="connector">
        <img id="u164_seg0" class="img" src="zbswitchimg/u164_seg0.png"/>
        <img id="u164_seg1" class="img" src="zbswitchimg/u120_seg1.png"/>
      </div>

      <div id="u166" class="connector">
        <img id="u166_seg0" class="img" src="zbswitchimg/u164_seg0.png"/>
        <img id="u166_seg1" class="img" src="zbswitchimg/u120_seg1.png"/>
      </div>

      <div id="u168" class="connector">
        <img id="u168_seg0" class="img" src="zbswitchimg/u168_seg0.png"/>
        <img id="u168_seg1" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u170" class="connector">
        <img id="u170_seg0" class="img" src="zbswitchimg/u170_seg0.png"/>
        <img id="u170_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u172" class="connector">
        <img id="u172_seg0" class="img" src="zbswitchimg/u172_seg0.png"/>
        <img id="u172_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u174" class="connector">
        <img id="u174_seg0" class="img" src="zbswitchimg/u174_seg0.png"/>
        <img id="u174_seg1" class="img" src="zbswitchimg/u174_seg1.png"/>
        <img id="u174_seg2" class="img" src="zbswitchimg/u96_seg2.png"/>
        <img id="u174_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u176">
        <img id="u176_img" class="img" src="zbswitchimg/u176.png"/>
      </div>
      
      <div id="u183" class="connector">
        <img id="u183_seg0" class="img" src="zbswitchimg/u183_seg0.png"/>
        <img id="u183_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u185" class="connector">
        <img id="u185_seg0" class="img" src="zbswitchimg/u185_seg0.png"/>
        <img id="u185_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u178">
        <div id="u179" class="text">
          <p><span style="font-size:23px;">吴江农村商业银行</span></p>
          <p><span style="font-size:10px;">WUJIANG RURAL COMMERCIAL BANK</span></p>
        </div>
      </div>

      <div id="u181">
          <select id="hisdatetime" style="width:200px;">
				<option value="${execution_date}">${execution_date}</option>
		  </select>
      </div>
      
      <div id="uu3">
          <p><span style="font-size:15px;">PPRC+LVM 切换</span></p>
      </div>
      
      <div id="uu4">
          <button id="showlog" class="btn btn-sm" style="background-color: #3399CC;">
				<font color="white">查看历史</font>
		  </button>
      </div>
      
    </div>
</body>

<script>
var dag_id = getUrlParam('dag_id');
var execution_date = getUrlParam('execution_date');
var execution_date_show = execution_date.split("T")[0];
var data ={"dag_id":dag_id,"execution_date":execution_date};

function update_nodes_states(task_instances) {
	$.each(task_instances,function(idx,obj){
        var mynode = d3.select('#' + obj.task_id + ' rect');
        if(obj.state == 'failed') //如果失败
        {
        	var tipcontent ="预计开始时间：" +  obj.expected_starttime + "," +
        					"实际开始时间：" +  obj.start_Date         + "," +
        					"预计结束时间：" +  obj.expected_endtime   + "," + 
        					"实际结束时间：" +  obj.end_Date           + "," +
        					"预计持续时间："   + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
        					"实际持续时间："  + obj.duration           + "&nbsp;&nbsp;秒," +
        					"任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败";
            var format_content = tipcontent.split(",").join("<br>");
            $("#"+obj.task_id).attr("data-original-title",format_content); 
            mynode.style("stroke", "#FF0000") ;
        }else if (obj.state == 'success') //如果成功
        {
        	var tipcontent = "预计开始时间：" +  obj.expected_starttime + "," +
							 "实际开始时间：" +  obj.start_Date         + "," +
							 "预计结束时间：" +  obj.expected_endtime   + "," + 
							 "实际结束时间：" +  obj.end_Date           + "," +
							 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
							 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;秒," +
							 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：成功";
            var format_content = tipcontent.split(",").join("<br>");
            $("#"+obj.task_id).attr("data-original-title",format_content); 
             mynode.style("stroke", "#32cc00") ;
        }else if (obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'upstream_failed')//未开始
        {
        	var tipcontent = "预计开始时间：" +  obj.expected_starttime + "," +
							 "实际开始时间：" +  obj.start_Date         + "," +
							 "预计结束时间：" +  obj.expected_endtime   + "," + 
							 "实际结束时间：" +  obj.end_Date           + "," +
							 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
							 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;秒," +
							 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：未开始";
            var format_content = tipcontent.split(",").join("<br>");
            $("#"+obj.task_id).attr("data-original-title",format_content); 
        	mynode.style("stroke", "#ffffff") ; 
        }else if (obj.state == 'running')
        {
        	var tipcontent = "预计开始时间：" +  obj.expected_starttime + "," +
							 "实际开始时间：" +  obj.start_Date         + "," +
							 "预计结束时间：" +  obj.expected_endtime   + "," + 
							 "实际结束时间：" +  obj.end_Date           + "," +
							 "预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;秒," + 
							 "实际持续时间："  + obj.duration           + "&nbsp;&nbsp;秒," +
							 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：运行中";
            var format_content = tipcontent.split(",").join("<br>");
            $("#"+obj.task_id).attr("data-original-title",format_content); 
        	mynode.style("stroke", "#0000ff") ; 
        }else if (obj.state == 'done') //如果处于做完待确认的状态
        {
        	var tipcontent = "预计开始时间：" +  obj.expected_starttime + "," +
							 "实际开始时间：" +  obj.start_Date         + "," +
							 "预计结束时间：" +  obj.expected_endtime   + "," + 
							 "实际结束时间：" +  obj.end_Date           + "," +
							 "预计持续时间：" +  obj.expected_duration  + "&nbsp;&nbsp;秒," + 
							 "实际持续时间：" +  obj.duration           + "&nbsp;&nbsp;秒," +
							 "任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：待确认";
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