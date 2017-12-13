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
<jsp:include page="../headerpprcback.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
body{margin:0;padding:0;}
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

      <div id="u187">
        <img id="u187_img" class="img" src="zbswitchimg/u0.jpg"/>
      </div>

      <div id="u189" class="ax_default pprc_back_start">
        <div id="u189_div"></div>
        <div id="u190" class="text">
          <p><span>开始</span></p>
        </div>
      </div>

      <div id="u191" class="ax_default pprc_back_workdb_backup">
        <div id="u191_div"></div>
        <div id="u192" class="text">
          <p><span>备份workdb数据库</span></p>
        </div>
      </div>

      <div id="u193" class="ax_default pprc_back_backup_end">
        <div id="u193_div"></div>
        <div id="u194" class="text">
          <p><span>完成备份数据库</span></p>
        </div>
      </div>

      <div id="u195" class="ax_default pprc_back_p770c2_cardstop">
        <div id="u195_div"></div>
        <div id="u196" class="text">
          <p><span>停止P770c2</span></p><p><span>card应用</span></p>
        </div>
      </div>

      <div id="u205" class="ax_default pprc_back_p770c2_icsstop">
        <div id="u205_div"></div>
        <div id="u206" class="text">
          <p><span>停止P770c2</span></p><p><span>ics应用</span></p>
        </div>
      </div>

      <div id="u207" class="ax_default pprc_back_cmisdb_backup">
        <div id="u207_div"></div>
        <div id="u208" class="text">
          <p><span>备份cmisdb数据库</span></p>
        </div>
      </div>

      <div id="u209" class="ax_default pprc_back_icsdb_backup">
        <div id="u209_div"></div>
        <div id="u210" class="text">
          <p><span>备份icsdb数据库</span></p>
        </div>
      </div>

      <div id="u211" class="ax_default pprc_back_carddb_backup">
        <div id="u211_div"></div>
        <div id="u212" class="text">
          <p><span>备份carddb数据库</span></p>
        </div>
      </div>

      <div id="u213" class="ax_default pprc_back_p770c2_cardstopcheck">
        <div id="u213_div"></div>
        <div id="u214" class="text">
          <p><span>检查P770c2 card业务是否停止成功</span></p>
        </div>
      </div>

      <div id="u215" class="ax_default pprc_back_p770c2_icsstopcheck">
        <div id="u215_div"></div>
        <div id="u216" class="text">
          <p><span>检查P770c2 ics</span></p><p><span>业务是否停止成功</span></p>
        </div>
      </div>

      <div id="u217" class="ax_default pprc_back_p770c1_cmisstopcheck">
        <div id="u217_div"></div>
        <div id="u218" class="text">
          <p><span>检查P770c1 cmis</span></p><p><span>业务是否停止成功</span></p>
        </div>
      </div>

      <div id="u219" class="ax_default pprc_back_p770c1_workstop">
        <div id="u219_div"></div>
        <div id="u220" class="text">
          <p><span>停止P770c1</span></p><p><span>work应用</span></p>
        </div>
      </div>

      <div id="u221" class="ax_default pprc_back_p770c1_workstopcheck">
        <div id="u221_div"></div>
        <div id="u222" class="text">
          <p><span>检查P770c1 work</span></p><p><span>业务是否停止成功</span></p>
        </div>
      </div>

      <div id="u223" class="ax_default pprc_back_ds8k_lunstart">
        <div id="u223_div"></div>
        <div id="u224" class="text">
          <p><span>开始设置DS8K LUN可读写</span></p>
        </div>
      </div>

      <div id="u225" class="ax_default pprc_back_p770a1_lunread_failover">
        <div id="u225_div"></div>
        <div id="u226" class="text">
          <p><span>停止P770a1 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u227" class="ax_default pprc_back_p770b2_lunread_failover">
        <div id="u227_div"></div>
        <div id="u228" class="text">
          <p><span>停止P770b2 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u229" class="ax_default pprc_back_p770b1_lunread_failover">
        <div id="u229_div"></div>
        <div id="u230" class="text">
          <p><span>停止P770b1 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u231" class="ax_default pprc_back_p770a2_lunread_failover">
        <div id="u231_div"></div>
        <div id="u232" class="text">
          <p><span>停止P770a2 </span></p><p><span>复制关系</span></p>
        </div>
      </div>

      <div id="u233" class="ax_default pprc_back_ds8k_lunstop">
        <div id="u233_div"></div>
        <div id="u234" class="text">
          <p><span>完成设置DS8K LUN可读写</span></p>
        </div>
      </div>

      <div id="u235" class="ax_default pprc_back_syncha_start">
        <div id="u235_div"></div>
        <div id="u236" class="text">
          <p><span>开始同步HA</span></p>
        </div>
      </div>

      <div id="u237" class="ax_default pprc_back_p770a1_syncHA">
        <div id="u237_div"></div>
        <div id="u238" class="text">
          <p><span>同步P770a1 HA</span></p>
        </div>
      </div>

      <div id="u239" class="ax_default pprc_back_p770a2_syncHA">
        <div id="u239_div"></div>
        <div id="u240" class="text">
          <p><span>同步P770a2 HA</span></p>
        </div>
      </div>

      <div id="u241" class="ax_default pprc_back_p770b1ha_check">
        <div id="u241_div"></div>
        <div id="u242" class="text">
          <p><span>验证P770b1 HA</span></p>
        </div>
      </div>

      <div id="u243" class="ax_default pprc_back_p770b1ha_start">
        <div id="u243_div"></div>
        <div id="u244" class="text">
          <p><span>启动P770b1 HA</span></p>
        </div>
      </div>

      <div id="u245" class="ax_default pprc_back_p770b2ha_check">
        <div id="u245_div"></div>
        <div id="u246" class="text">
          <p><span>验证P770b2 HA</span></p>
        </div>
      </div>

      <div id="u247" class="ax_default pprc_back_startfailback">
        <div id="u247_div"></div>
        <div id="u248" class="text">
          <p><span>启动PPRC</span></p><p><span>&nbsp;H1:H2复制关系</span></p>
        </div>
      </div>

      <div id="u249" class="ax_default pprc_back_p770a1_failback">
        <div id="u249_div"></div>
        <div id="u250" class="text">
          <p><span>启动P770a1 吴江到盛泽复制关系</span></p>
        </div>
      </div>

      <div id="u251" class="ax_default pprc_back_p770b1_failback">
        <div id="u251_div"></div>
        <div id="u252" class="text">
          <p><span>启动P770b1 吴江到盛泽复制关系</span></p>
        </div>
      </div>

      <div id="u253" class="ax_default pprc_back_p770a2_failback">
        <div id="u253_div"></div>
        <div id="u254" class="text">
          <p><span>启动P770a2 吴江到盛泽复制关系</span></p>
        </div>
      </div>

      <div id="u255" class="ax_default pprc_back_p770b2_failback">
        <div id="u255_div"></div>
        <div id="u256" class="text">
          <p><span>启动P770b2 吴江到盛泽复制关系</span></p>
        </div>
      </div>

      <div id="u257" class="ax_default pprc_back_end">
        <div id="u257_div"></div>
        <div id="u258" class="text">
          <p><span>结束</span></p>
        </div>
      </div>
      
      <div id="u318" class="ax_default pprc_back_p770c1_cmisstop">
        <div id="u318_div"></div>
        <div id="u319" class="text">
          <p><span>停止P770c1</span></p><p><span>cmis应用</span></p>
        </div>
      </div>

      <div id="u320" class="ax_default pprc_back_syncha_stop">
        <div id="u320_div"></div>
        <div id="u321" class="text">
          <p><span>结束同步HA</span></p>
        </div>
      </div>
      
      <div id="u342" class="ax_default pprc_back_p770a1ha_start">
        <div id="u342_div"></div>
        <div id="u343" class="text">
          <p><span>启动P770a1 HA</span></p>
        </div>
      </div>

      <div id="u344" class="ax_default pprc_back_p770b2ha_start">
        <div id="u344_div"></div>
        <div id="u345" class="text">
          <p><span>启动P770b2 HA</span></p>
        </div>
      </div>
      
      <div id="u354" class="ax_default pprc_back_p770a1ha_check">
        <div id="u354_div"></div>
        <div id="u355" class="text">
          <p><span>验证P770a1 HA</span></p>
        </div>
      </div>
      
      <div id="u360" class="ax_default pprc_back_p770a2ha_start">
        <div id="u360_div"></div>
        <div id="u361" class="text">
          <p><span>启动P770a2 HA</span></p>
        </div>
      </div>
      
      <div id="u366" class="ax_default pprc_back_p770a2ha_check">
        <div id="u366_div"></div>
        <div id="u367" class="text">
          <p><span>验证P770a2 HA</span></p>
        </div>
      </div>
      
      <div id="u372" class="ax_default pprc_back_ywcheck">
        <div id="u372_div"></div>
        <div id="u373" class="text">
          <p><span>业务验证</span></p>
        </div>
      </div>

      <div id="u259" class="connector">
        <img id="u259_seg0" class="img" src="zbswitchimg/u84_seg0.png"/>
        <img id="u259_seg1" class="img" src="zbswitchimg/u84_seg1.png"/>
        <img id="u259_seg2" class="img" src="zbswitchimg/u84_seg2.png"/>
        <img id="u259_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u261" class="connector">
        <img id="u261_seg0" class="img" src="zbswitchimg/u86_seg0.png"/>
        <img id="u261_seg1" class="img" src="zbswitchimg/u86_seg1.png"/>
        <img id="u261_seg2" class="img" src="zbswitchimg/u86_seg2.png"/>
        <img id="u261_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u263" class="connector">
        <img id="u263_seg0" class="img" src="zbswitchimg/u84_seg0.png"/>
        <img id="u263_seg1" class="img" src="zbswitchimg/u88_seg1.png"/>
        <img id="u263_seg2" class="img" src="zbswitchimg/u84_seg2.png"/>
        <img id="u263_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u265" class="connector">
        <img id="u265_seg0" class="img" src="zbswitchimg/u86_seg0.png"/>
        <img id="u265_seg1" class="img" src="zbswitchimg/u90_seg1.png"/>
        <img id="u265_seg2" class="img" src="zbswitchimg/u86_seg2.png"/>
        <img id="u265_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u267" class="connector">
        <img id="u267_seg0" class="img" src="zbswitchimg/u267_seg0.png"/>
        <img id="u267_seg1" class="img" src="zbswitchimg/u92_seg1.png"/>
        <img id="u267_seg2" class="img" src="zbswitchimg/u267_seg2.png"/>
        <img id="u267_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u269" class="connector">
        <img id="u269_seg0" class="img" src="zbswitchimg/u267_seg0.png"/>
        <img id="u269_seg1" class="img" src="zbswitchimg/u94_seg1.png"/>
        <img id="u269_seg2" class="img" src="zbswitchimg/u267_seg2.png"/>
        <img id="u269_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u271" class="connector">
        <img id="u271_seg0" class="img" src="zbswitchimg/u96_seg0.png"/>
        <img id="u271_seg1" class="img" src="zbswitchimg/u96_seg1.png"/>
        <img id="u271_seg2" class="img" src="zbswitchimg/u96_seg2.png"/>
        <img id="u271_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u273" class="connector">
        <img id="u273_seg0" class="img" src="zbswitchimg/u96_seg0.png"/>
        <img id="u273_seg1" class="img" src="zbswitchimg/u98_seg1.png"/>
        <img id="u273_seg2" class="img" src="zbswitchimg/u96_seg2.png"/>
        <img id="u273_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u275" class="connector">
        <img id="u275_seg0" class="img" src="zbswitchimg/u275_seg0.png"/>
        <img id="u275_seg1" class="img" src="zbswitchimg/u275_seg1.png"/>
        <img id="u275_seg2" class="img" src="zbswitchimg/u146_seg2.png"/>
        <img id="u275_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u277" class="connector">
        <img id="u277_seg0" class="img" src="zbswitchimg/u277_seg0.png"/>
        <img id="u277_seg1" class="img" src="zbswitchimg/u124_seg1.png"/>
        <img id="u277_seg2" class="img" src="zbswitchimg/u277_seg2.png"/>
        <img id="u277_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u279" class="connector">
        <img id="u279_seg0" class="img" src="zbswitchimg/u279_seg0.png"/>
        <img id="u279_seg1" class="img" src="zbswitchimg/u126_seg1.png"/>
        <img id="u279_seg2" class="img" src="zbswitchimg/u279_seg2.png"/>
        <img id="u279_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u281" class="connector">
        <img id="u281_seg0" class="img" src="zbswitchimg/u277_seg0.png"/>
        <img id="u281_seg1" class="img" src="zbswitchimg/u128_seg1.png"/>
        <img id="u281_seg2" class="img" src="zbswitchimg/u277_seg2.png"/>
        <img id="u281_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u283" class="connector">
        <img id="u283_seg0" class="img" src="zbswitchimg/u279_seg0.png"/>
        <img id="u283_seg1" class="img" src="zbswitchimg/u130_seg1.png"/>
        <img id="u283_seg2" class="img" src="zbswitchimg/u279_seg2.png"/>
        <img id="u283_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u285" class="connector">
        <img id="u285_seg0" class="img" src="zbswitchimg/u134_seg0.png"/>
        <img id="u285_seg1" class="img" src="zbswitchimg/u134_seg1.png"/>
        <img id="u285_seg2" class="img" src="zbswitchimg/u279_seg2.png"/>
        <img id="u285_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u287" class="connector">
        <img id="u287_seg0" class="img" src="zbswitchimg/u134_seg0.png"/>
        <img id="u287_seg1" class="img" src="zbswitchimg/u136_seg1.png"/>
        <img id="u287_seg2" class="img" src="zbswitchimg/u279_seg2.png"/>
        <img id="u287_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u289" class="connector">
        <img id="u289_seg0" class="img" src="zbswitchimg/u289_seg0.png"/>
        <img id="u289_seg1" class="img" src="zbswitchimg/u138_seg1.png"/>
        <img id="u289_seg2" class="img" src="zbswitchimg/u277_seg2.png"/>
        <img id="u289_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u291" class="connector">
        <img id="u291_seg0" class="img" src="zbswitchimg/u289_seg0.png"/>
        <img id="u291_seg1" class="img" src="zbswitchimg/u140_seg1.png"/>
        <img id="u291_seg2" class="img" src="zbswitchimg/u277_seg2.png"/>
        <img id="u291_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u293" class="connector">
        <img id="u293_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u293_seg1" class="img" src="zbswitchimg/u146_seg1.png"/>
        <img id="u293_seg2" class="img" src="zbswitchimg/u146_seg2.png"/>
        <img id="u293_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u295" class="connector">
        <img id="u295_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u295_seg1" class="img" src="zbswitchimg/u148_seg1.png"/>
        <img id="u295_seg2" class="img" src="zbswitchimg/u146_seg2.png"/>
        <img id="u295_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u297" class="connector">
        <img id="u297_seg0" class="img" src="zbswitchimg/u150_seg0.png"/>
        <img id="u297_seg1" class="img" src="zbswitchimg/u94_seg1.png"/>
        <img id="u297_seg2" class="img" src="zbswitchimg/u150_seg2.png"/>
        <img id="u297_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u299" class="connector">
        <img id="u299_seg0" class="img" src="zbswitchimg/u110_seg0.png"/>
        <img id="u299_seg1" class="img" src="zbswitchimg/u92_seg1.png"/>
        <img id="u299_seg2" class="img" src="zbswitchimg/u110_seg2.png"/>
        <img id="u299_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u301" class="connector">
        <img id="u301_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u301_seg1" class="img" src="zbswitchimg/u154_seg1.png"/>
        <img id="u301_seg2" class="img" src="zbswitchimg/u112_seg2.png"/>
        <img id="u301_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u303" class="connector">
        <img id="u303_seg0" class="img" src="zbswitchimg/u110_seg0.png"/>
        <img id="u303_seg1" class="img" src="zbswitchimg/u156_seg1.png"/>
        <img id="u303_seg2" class="img" src="zbswitchimg/u110_seg2.png"/>
        <img id="u303_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u305" class="connector">
        <img id="u305_seg0" class="img" src="zbswitchimg/u112_seg0.png"/>
        <img id="u305_seg1" class="img" src="zbswitchimg/u158_seg1.png"/>
        <img id="u305_seg2" class="img" src="zbswitchimg/u112_seg2.png"/>
        <img id="u305_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u307" class="connector">
        <img id="u307_seg0" class="img" src="zbswitchimg/u150_seg0.png"/>
        <img id="u307_seg1" class="img" src="zbswitchimg/u160_seg1.png"/>
        <img id="u307_seg2" class="img" src="zbswitchimg/u150_seg2.png"/>
        <img id="u307_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u309">
        <img id="u309_img" class="img" src="zbswitchimg/u176.png"/>
      </div>

      <div id="u316" class="connector">
        <img id="u316_seg0" class="img" src="zbswitchimg/u316_seg0.png"/>
        <img id="u316_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u322" class="connector">
        <img id="u322_seg0" class="img" src="zbswitchimg/u322_seg0.png"/>
        <img id="u322_seg1" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u324" class="connector">
        <img id="u324_seg0" class="img" src="zbswitchimg/u324_seg0.png"/>
        <img id="u324_seg1" class="img" src="zbswitchimg/u120_seg1.png"/>
      </div>

      <div id="u326" class="connector">
        <img id="u326_seg0" class="img" src="zbswitchimg/u326_seg0.png"/>
        <img id="u326_seg1" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u328" class="connector">
        <img id="u328_seg0" class="img" src="zbswitchimg/u316_seg0.png"/>
        <img id="u328_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u330" class="connector">
        <img id="u330_seg0" class="img" src="zbswitchimg/u330_seg0.png"/>
        <img id="u330_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u332" class="connector">
        <img id="u332_seg0" class="img" src="zbswitchimg/u332_seg0.png"/>
        <img id="u332_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u334" class="connector">
        <img id="u334_seg0" class="img" src="zbswitchimg/u334_seg0.png"/>
        <img id="u334_seg1" class="img" src="zbswitchimg/u334_seg1.png"/>
        <img id="u334_seg2" class="img" src="zbswitchimg/u334_seg2.png"/>
        <img id="u334_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u336" class="connector">
        <img id="u336_seg0" class="img" src="zbswitchimg/u336_seg0.png"/>
        <img id="u336_seg1" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u338" class="connector">
        <img id="u338_seg0" class="img" src="zbswitchimg/u289_seg0.png"/>
        <img id="u338_seg1" class="img" src="zbswitchimg/u338_seg1.png"/>
        <img id="u338_seg2" class="img" src="zbswitchimg/u338_seg2.png"/>
        <img id="u338_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u340" class="connector">
        <img id="u340_seg0" class="img" src="zbswitchimg/u340_seg0.png"/>
        <img id="u340_seg1" class="img" src="zbswitchimg/u340_seg1.png"/>
        <img id="u340_seg2" class="img" src="zbswitchimg/u340_seg2.png"/>
        <img id="u340_seg3" class="img" src="zbswitchimg/u122_seg3.png"/>
      </div>

      <div id="u346" class="connector">
        <img id="u346_seg0" class="img" src="zbswitchimg/u346_seg0.png"/>
        <img id="u346_seg1" class="img" src="zbswitchimg/u120_seg1.png"/>
      </div>

      <div id="u348" class="connector">
        <img id="u348_seg0" class="img" src="zbswitchimg/u348_seg0.png"/>
        <img id="u348_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u350" class="connector">
        <img id="u350_seg0" class="img" src="zbswitchimg/u350_seg0.png"/>
        <img id="u350_seg1" class="img" src="zbswitchimg/u350_seg1.png"/>
        <img id="u350_seg2" class="img" src="zbswitchimg/u350_seg2.png"/>
        <img id="u350_seg3" class="img" src="zbswitchimg/u350_seg3.png"/>
        <img id="u350_seg4" class="img" src="zbswitchimg/u350_seg4.png"/>
      </div>

      <div id="u352" class="connector">
        <img id="u352_seg0" class="img" src="zbswitchimg/u350_seg0.png"/>
        <img id="u352_seg1" class="img" src="zbswitchimg/u352_seg1.png"/>
        <img id="u352_seg2" class="img" src="zbswitchimg/u350_seg2.png"/>
        <img id="u352_seg3" class="img" src="zbswitchimg/u350_seg3.png"/>
        <img id="u352_seg4" class="img" src="zbswitchimg/u350_seg4.png"/>
      </div>

      <div id="u356" class="connector">
        <img id="u356_seg0" class="img" src="zbswitchimg/u356_seg0.png"/>
        <img id="u356_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u358" class="connector">
        <img id="u358_seg0" class="img" src="zbswitchimg/u358_seg0.png"/>
        <img id="u358_seg1" class="img" src="zbswitchimg/u358_seg1.png"/>
      </div>

      <div id="u362" class="connector">
        <img id="u362_seg0" class="img" src="zbswitchimg/u362_seg0.png"/>
        <img id="u362_seg1" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u364" class="connector">
        <img id="u364_seg0" class="img" src="zbswitchimg/u346_seg0.png"/>
        <img id="u364_seg1" class="img" src="zbswitchimg/u120_seg1.png"/>
      </div>

      <div id="u368" class="connector">
        <img id="u368_seg0" class="img" src="zbswitchimg/u168_seg0.png"/>
        <img id="u368_seg1" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u370" class="connector">
        <img id="u370_seg0" class="img" src="zbswitchimg/u356_seg0.png"/>
        <img id="u370_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u374" class="connector">
        <img id="u374_seg0" class="img" src="zbswitchimg/u356_seg0.png"/>
        <img id="u374_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>

      <div id="u376" class="connector">
        <img id="u376_seg0" class="img" src="zbswitchimg/u275_seg0.png"/>
        <img id="u376_seg1" class="img" src="zbswitchimg/u376_seg1.png"/>
        <img id="u376_seg2" class="img" src="zbswitchimg/u376_seg2.png"/>
        <img id="u376_seg3" class="img" src="zbswitchimg/u84_seg3.png"/>
      </div>

      <div id="u378" class="connector">
        <img id="u378_seg0" class="img" src="zbswitchimg/u378_seg0.png"/>
        <img id="u378_seg1" class="img" src="zbswitchimg/u118_seg1.png"/>
      </div>
      
      <div id="u197">
        <div id="u197_div"></div>
        <div id="u198">
          <p><span>未开始</span></p>
        </div>
      </div>

      <div id="u199">
        <div id="u199_div"></div>
        <div id="u200">
          <p><span>运行中</span></p>
        </div>
      </div>

      <div id="u201">
        <div id="u201_div"></div>
        <div id="u202">
          <p><span>成功</span></p>
        </div>
      </div>

      <div id="u203">
        <div id="u203_div"></div>
        <div id="u204">
          <p><span>失败</span></p>
        </div>
      </div>
      
      <!-- <div id="uu1">
        <div id="uu1_div"></div>
        <div id="uu2">
          <p><span>已完成待检查</span></p>
        </div>
      </div> -->
      
      <div id="u311">
        <div id="u312" class="text">
          <p><span style="font-size:23px;">吴江农村商业银行</span></p><p><span style="font-size:10px;">WUJIANG RURAL COMMERCIAL BANK</span></p>
        </div>
      </div>

      <div id="u314">
        <div id="u315a" class="text">
          <p><span>核 心 系 统 灾 备 回 切 演 练 - 模 拟</span><span>&nbsp; </span></p>
        </div>
        <div id="uu6" style="font-size:16px;">执行时间</div>
        <div id="uu5" style="font-size:16px;"></div>
      </div>
    </div>

	<img id="progressImgage"  style="width:120px;height:120px;" alt="请稍等，处理中。。。" src="img/process.gif"/>
    <div id="maskOfProgressImage" class="mask hide"></div>
</body>

<script>
	//获取url中的参数
	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	}

	var taskid;
	var execution_date_time = getUrlParam('execution_date');//2017-12-01T15:24:28
	var execution_date_time1 = execution_date_time.replace("T"," ");
	
	$(document).ready(function(){
		
		$("#uu5").text(execution_date_time1);
		
		$(".ax_default").on("mouseover",function(e){ //获取要点击任务框的id
			var classes = $(this).attr("class");
			taskid = classes.split(" ")[1];
		})
		
		$('.ax_default').contextPopup({
	          items: [
		            {label:'查看日志', icon:'img/viewlog.png', action:function() 
		            	{ 
		            		var execution_date = getUrlParam('execution_date'); //获取url 的值
		            		console.info("taskid is " + taskid + "; execution_date is " + execution_date);
		            		var data ={"dag_id":"pprc_back_simu","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
			            	console.info("taskid is " + taskid + "; execution_date is " + execution_date);
			            	var data ={"dag_id":"pprc_back_simu","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
			            			var data ={"dag_id":"pprc_back_simu","task_id":taskid,"execution_date":execution_date}  //这3个值决定唯一一条task_instance 一条记录
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
			            						var task_div = $('.' + task_id);
					        			        task_div.find("div:eq(0)").css("border-color","#32CD32") ;
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
	
	var dag_id = "pprc_back_simu";
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
            					"预计持续时间："  + obj.expected_duration  + "&nbsp;&nbsp;," + 
            					"实际持续时间："  + obj.duration           + "&nbsp;&nbsp;," +
            					"任务状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：失败</p>";
                var format_content = tipcontent.split(",").join("<br>");
                task_div.attr("data-original-title",format_content); 
                task_div.find("div:eq(0)").css("border-color","#FF0000");
            }else if (obj.state == 'success') //如果成功
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
            }else if (obj.state == '' || obj.state == 'skipped' || obj.state == 'undefined'|| obj.state == 'upstream_failed'|| obj.state == 'scheduled' || obj.state == 'shutdown')//未开始
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
            }else if (obj.state == 'running')
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
                task_div.find("div:eq(0)").css("border-color","#0000ff");
            }else if (obj.state == 'done') //如果处于做完待确认的状态
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
                task_div.find("div:eq(0)").css("border-color","#FF8C00");
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
			}, function(err){
				//失败回调
				console.log(err); // 打印状态码
				});
			}
		handleAjax(url,param,type);
	}
</script>

</html>