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
<jsp:include page="../headerpprcgo_report.jsp" flush="true" /> 
<title>自动化运维平台</title>
<style type="text/css">
	body{ margin:0;padding:0; background:url('zbswitchimg/u0.jpg') repeat;}
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
	  
      <div id="u18" class="ax_default" data-left="579" data-top="14" data-width="451" data-height="42">
        <div id="u19" class="ax_default">
          <div id="u19_div"></div>
          <div id="u20" class="text">
            <p><span style="color:#FFFFFF;">核 心 系 统 灾 备 切 换 演 练</span><span>&nbsp; </span></p>
          </div>
        </div>
      </div>
      
      <div id="u51" class="ax_default">
        <img id="u51_img" class="img" src="zbswitchimg/u51.png"/>
      </div>
      <div id="u53" class="ax_default">
        <div id="u53_div"></div>
        <div id="u54" class="text">
          <p><span style="font-size:28px;">吴江农村商业银行</span></p><p><span style="font-size:12px;">WUJIANG RURAL COMMERCIAL BANK</span></p>
        </div>
      </div>
      
      <div id="u47" class="ax_default">
        <div id="u47_div"></div>
        <div id="u48" class="text">
          <p><span>2017 年 11 月 10 日 00:45:00</span></p>
        </div>
      </div>
      
      <div id="u21" class="ax_default">
        <div id="u21_div"></div>
        <div id="u22" class="text">
          <p><span>开始时间</span></p>
        </div>
      </div>
      
      <div id="u49" class="ax_default" data-label="开始时间">
        <div id="u49_div"></div>
        <div id="u50" class="text">
          <p><span>00:30:00</span></p>
        </div>
      </div>

      <div id="u23" class="ax_default">
        <div id="u23_div"></div>
        <div id="u24" class="text">
          <p><span>持 续 时 间</span></p>
        </div>
      </div>
      
      <div id="u45" class="ax_default" data-label="持续时间">
        <div id="u45_div"></div>
        <div id="u46" class="text">
          <p><span>15 Min</span></p>
        </div>
      </div>
      
      
      
      <!-- 环境检查框 -->
      <div id="u29" class="ax_default" data-label="环境检查">   <!-- 框 -->
        <div id="u29_div"></div>
      </div>
      <div id="u31" class="ax_default">		<!-- logo -->
        <img id="u31_img" class="img" src="zbswitchimg/u31.png"/>
      </div>
      <div id="u83" class="ax_default">
        <div id="u83_div"></div>
        <div id="u84" class="text">
          <p><span>环境检查</span></p>
        </div>
      </div>
      <div id="u93" class="ax_default line">   <!-- 垂直线 -->
        <img id="u93_img" class="img" src="zbswitchimg/u93.png"/>
      </div>
      <div id="u103" class="ax_default line">  <!-- 水平线 -->
        <img id="u103_img" class="img" src="zbswitchimg/u103.png"/>
      </div>
      <div id="u105" class="ax_default">
        <div id="u105_div"></div>
        <div id="u106" class="text">
          <p><span>结束时间</span></p>
        </div>
      </div>
      <div id="u123" class="ax_default" data-label="环境检查">
        <div id="u123_div"></div>
        <div id="u124" class="text">
          <p><span>00:45</span></p>
        </div>
      </div>
      
      <!-- 连接线 -->
      <div id="u63" class="ax_default" data-left="395" data-top="130" data-width="44" data-height="15">
        <div id="u64" class="ax_default line">
          <img id="u64_img" class="img" src="zbswitchimg/u64.png"/>
        </div>
        <div id="u66" class="ax_default ellipse">
          <img id="u66_img" class="img" src="zbswitchimg/u66.png"/>
        </div>
      </div>
      
      <!-- 停止业务 -->
      <div id="u25" class="ax_default">    <!-- 框 -->
        <div id="u25_div"></div>
      </div>
      <div id="u27" class="ax_default">    <!-- logo -->
        <img id="u27_img" class="img" src="zbswitchimg/u27.png"/>
      </div>
      <div id="u85" class="ax_default">
        <div id="u85_div"></div>
        <div id="u86" class="text">
          <p><span>停止业务</span></p>
        </div>
      </div>
      <div id="u95" class="ax_default line">  <!-- 垂直线 -->
        <img id="u95_img" class="img" src="zbswitchimg/u93.png"/>
      </div>
      <div id="u107" class="ax_default line">  <!-- 水平线 -->
        <img id="u107_img" class="img" src="zbswitchimg/u107.png"/>
      </div>
      <div id="u109" class="ax_default">
        <div id="u109_div"></div>
        <div id="u110" class="text">
          <p><span>结束时间</span></p>
        </div>
      </div>
      <div id="u330" class="ax_default" data-label="停止业务">
        <div id="u330_div"></div>
        <div id="u331" class="text">
          <p><span>00:45</span></p>
        </div>
      </div>
      
      <!-- 连接线 -->
      <div id="u68" class="ax_default" data-left="649" data-top="130" data-width="44" data-height="15">
        <div id="u69" class="ax_default line">
          <img id="u69_img" class="img" src="zbswitchimg/u64.png"/>
        </div>
        <div id="u71" class="ax_default ellipse">
          <img id="u71_img" class="img" src="zbswitchimg/u66.png"/>
        </div>
      </div>
      
      <!-- 切换 -->
      <div id="u33" class="ax_default">    <!-- 框 -->
        <div id="u33_div"></div>
      </div>
      <div id="u35" class="ax_default">    <!-- logo -->
        <img id="u35_img" class="img" src="zbswitchimg/u35.png"/>
      </div>
      <div id="u87" class="ax_default">
        <div id="u87_div"></div>
        <div id="u88" class="text">
          <p><span>切换</span></p>
        </div>
      </div>
      <div id="u97" class="ax_default line">  <!-- 垂直线 -->
        <img id="u97_img" class="img" src="zbswitchimg/u93.png"/>
      </div>
      <div id="u111" class="ax_default line">  <!-- 水平线 -->
        <img id="u111_img" class="img" src="zbswitchimg/u111.png"/>
      </div>
      <div id="u113" class="ax_default">
        <div id="u113_div"></div>
        <div id="u114" class="text">
          <p><span>结束时间</span></p>
        </div>
      </div>
      <div id="u332" class="ax_default" data-label="切换">
        <div id="u332_div"></div>
        <div id="u333" class="text">
          <p><span>00:45</span></p>
        </div>
      </div>
      
      <!-- 连接线 -->
      <div id="u73" class="ax_default" data-left="903" data-top="130" data-width="44" data-height="15">
        <div id="u74" class="ax_default line">
          <img id="u74_img" class="img" src="zbswitchimg/u64.png"/>
        </div>
        <div id="u76" class="ax_default ellipse">
          <img id="u76_img" class="img" src="zbswitchimg/u66.png"/>
        </div>
      </div>
      
      <!-- 启动业务 -->
      <div id="u37" class="ax_default">   <!-- 框 -->
        <div id="u37_div"></div>
      </div>
      <div id="u39" class="ax_default">   <!-- logo -->
        <img id="u39_img" class="img" src="zbswitchimg/u39.png"/>
      </div>
      <div id="u89" class="ax_default">
        <div id="u89_div"></div>
        <div id="u90" class="text">
          <p><span>启动业务</span></p>
        </div>
      </div>
      <div id="u99" class="ax_default line">  <!-- 垂直线 -->
        <img id="u99_img" class="img" src="zbswitchimg/u93.png"/>
      </div>
      <div id="u115" class="ax_default line">  <!-- 水平线 -->
        <img id="u115_img" class="img" src="zbswitchimg/u115.png"/>
      </div>
      <div id="u117" class="ax_default">
        <div id="u117_div"></div>
        <div id="u118" class="text">
          <p><span>结束时间</span></p>
        </div>
      </div>
      <div id="u334" class="ax_default" data-label="启动业务">
        <div id="u334_div"></div>
        <div id="u335" class="text">
          <p><span>00:45</span></p>
        </div>
      </div>
      
      <!-- 连接线 -->
      <div id="u78" class="ax_default" data-left="1156" data-top="130" data-width="44" data-height="15">
        <div id="u79" class="ax_default line">
          <img id="u79_img" class="img" src="zbswitchimg/u64.png"/>
        </div>
        <div id="u81" class="ax_default ellipse">
          <img id="u81_img" class="img" src="zbswitchimg/u66.png"/>
        </div>
      </div>
      
      <!-- 业务验证 -->
      <div id="u41" class="ax_default">   <!-- 框 -->
        <div id="u41_div"></div>
      </div>
      <div id="u43" class="ax_default">   <!-- logo -->
        <img id="u43_img" class="img" src="zbswitchimg/u43.png"/>
      </div>
      <div id="u91" class="ax_default">
        <div id="u91_div"></div>
        <div id="u92" class="text">
          <p><span>业务验证</span></p>
        </div>
      </div>
      <div id="u101" class="ax_default line">  <!-- 垂直线 -->
        <img id="u101_img" class="img" src="zbswitchimg/u93.png"/>
      </div>
      <div id="u119" class="ax_default line">
        <img id="u119_img" class="img" src="zbswitchimg/u111.png"/>
      </div>
      <div id="u121" class="ax_default">
        <div id="u121_div"></div>
        <div id="u122" class="text">
          <p><span>结束时间</span></p>
        </div>
      </div>
      <div id="u336" class="ax_default" data-label="业务验证">
        <div id="u336_div"></div>
        <div id="u337" class="text">
          <p><span>00:45</span></p>
        </div>
      </div>
      
      <!-- 结构图 -->
      <div id="u131" class="ax_default">
        <div id="u131_div"></div>
      </div>
      
      <div id="u140" class="ax_default" data-left="538" data-top="196" data-width="113" data-height="39">
        <div id="u141" class="ax_default" data-left="538" data-top="196" data-width="113" data-height="39">
          <div id="u142" class="ax_default">
            <img id="u142_img" class="img" src="zbswitchimg/u134.png"/>
          </div>
          <div id="u144" class="ax_default">
            <div id="u144_div"></div>
            <div id="u145" class="text">
              <p><span>架构图</span></p>
            </div>
          </div>
        </div>
        <div id="u146" class="ax_default" data-left="544" data-top="202" data-width="27" data-height="27">
          <div id="u147" class="ax_default">
            <img id="u147_img" class="img" src="zbswitchimg/u147.png"/>
          </div>
        </div>
      </div>
      
      <div id="u149" class="ax_default">
        <div id="u149_div"></div>
        <div id="u150" class="text">
          <p><span>吴</span></p><p><span><br></span></p><p><span>江</span></p>
        </div>
      </div>

      <div id="u151" class="ax_default">
        <div id="u151_div"></div>
        <div id="u152" class="text">
          <p><span>盛</span></p><p><span><br></span></p><p><span>泽</span></p>
        </div>
      </div>
      
      <div id="u2" class="ax_default icon">
        <img id="u2_img" class="img" src="zbswitchimg/u2.png"/>
      </div>
      
      <div id="u4" class="ax_default icon">
        <img id="u4_img" class="img" src="zbswitchimg/u2.png"/>
      </div>

      <div id="u6" class="ax_default icon">
        <img id="u6_img" class="img" src="zbswitchimg/u6.png"/>
      </div>
      
      <div id="u8" class="ax_default icon">
        <img id="u8_img" class="img" src="zbswitchimg/u8.png"/>
      </div>

      <div id="u10" class="ax_default icon">
        <img id="u10_img" class="img" src="zbswitchimg/u10.png"/>
      </div>
      
      <div id="u153" class="ax_default">
        <div id="u153_div"></div>
        <div id="u154" class="text">
          <p><span>P770C1</span></p>
        </div>
      </div>
      
      <div id="u12" class="ax_default">
        <div id="u12_div"></div>
        <div id="u13" class="text">
          <p><span>P770C2</span></p>
        </div>
      </div>

      <div id="u14" class="ax_default">
        <div id="u14_div"></div>
        <div id="u15" class="text">
          <p><span>P770B1</span></p>
        </div>
      </div>
      
      <div id="u204" class="ax_default">
        <div id="u204_div"></div>
        <div id="u205" class="text">
          <p><span>P770A1</span></p>
        </div>
      </div>
      
      <div id="u16" class="ax_default">
        <div id="u16_div"></div>
        <div id="u17" class="text">
          <p><span>P770B2</span></p>
        </div>
      </div>
      
      <div id="u206" class="ax_default">
        <div id="u206_div"></div>
        <div id="u207" class="text">
          <p><span>P770A2</span></p>
        </div>
      </div>
      
      <div id="u55" class="ax_default">
        <img id="u55_img" class="img" src="zbswitchimg/u55.png"/>
      </div>
      
      <div id="u57" class="ax_default">
        <img id="u57_img" class="img" src="zbswitchimg/u55.png"/>
      </div>

      <div id="u59" class="ax_default">
        <img id="u59_img" class="img" src="zbswitchimg/u55.png"/>
      </div>
      
      <div id="u61" class="ax_default">
        <img id="u61_img" class="img" src="zbswitchimg/u61.png"/>
      </div>
      
      <div id="u125" class="ax_default icon">
        <img id="u125_img" class="img" src="zbswitchimg/u10.png"/>
      </div>
      
      <div id="u127" class="ax_default">
        <img id="u127_img" class="img" src="zbswitchimg/u127.png"/>
      </div>
      
      <div id="u155" class="ax_default">
        <img id="u155_img" class="img" src="zbswitchimg/u55.png"/>
      </div>
      
      <div id="u182" class="ax_default">
        <div id="u182_div"></div>
        <div id="u183" class="text">
          <p><span>检查中...</span></p>
        </div>
      </div>

      <div id="u184" class="ax_default">
        <div id="u184_div"></div>
        <div id="u185" class="text">
          <p><span>检查中...</span></p>
        </div>
      </div>

      <div id="u186" class="ax_default">
        <div id="u186_div"></div>
        <div id="u187" class="text">
          <p><span>检查中...</span></p>
        </div>
      </div>

      <div id="u188" class="ax_default">
        <div id="u188_div"></div>
        <div id="u189" class="text">
          <p><span>检查中...</span></p>
        </div>
      </div>
      
      <div id="u190" class="ax_default">
        <img id="u190_img" class="img" src="zbswitchimg/u190.png"/>
      </div>

      <div id="u192" class="ax_default">
        <img id="u192_img" class="img" src="zbswitchimg/u190.png"/>
      </div>
      
      <div id="u194" class="ax_default">
        <img id="u194_img" class="img" src="zbswitchimg/u194.png"/>
      </div>
      
      <div id="u196" class="ax_default">
        <img id="u196_img" class="img" src="zbswitchimg/u55.png"/>
      </div>
      
      <div id="u198" class="ax_default">
        <img id="u198_img" class="img" src="zbswitchimg/u190.png"/>
      </div>

      <div id="u200" class="ax_default">
        <img id="u200_img" class="img" src="zbswitchimg/u55.png"/>
      </div>
      
      <div id="u202" class="ax_default">
        <img id="u202_img" class="img" src="zbswitchimg/u190.png"/>
      </div>
      
      <div id="u208" class="ax_default">
        <img id="u208_img" class="img" src="zbswitchimg/u208.png"/>
      </div>
      
      <div id="u210" class="ax_default">
        <div id="u210_div"></div>
        <div id="u211" class="text">
          <p><span>HACMP</span></p>
        </div>
      </div>
      
      <div id="u212" class="ax_default">
        <img id="u212_img" class="img" src="zbswitchimg/u208.png"/>
      </div>

      <div id="u214" class="ax_default">
        <div id="u214_div"></div>
        <div id="u215" class="text">
          <p><span>HACMP</span></p>
        </div>
      </div>
      
      <div id="u216" class="ax_default icon">
        <img id="u216_img" class="img" src="zbswitchimg/u216.png"/>
      </div>

      <div id="u218" class="ax_default">
        <div id="u218_div"></div>
        <div id="u219" class="text">
          <p><span>LVM</span></p>
        </div>
      </div>
      
      <div id="u220" class="ax_default">
        <img id="u220_img" class="img" src="zbswitchimg/u61.png"/>
      </div>
      
      <div id="u222" class="ax_default">
        <img id="u222_img" class="img" src="zbswitchimg/u61.png"/>
      </div>
      
      
      
      <!-- 甘特图 -->
      <div id="u157" class="ax_default">
        <div id="u157_div"></div>
      </div>
      
      <div id="u159" class="ax_default" data-left="8" data-top="196" data-width="113" data-height="39">
        <div id="u160" class="ax_default" data-left="8" data-top="196" data-width="113" data-height="39">
          <div id="u161" class="ax_default">
            <img id="u161_img" class="img" src="zbswitchimg/u134.png"/>
          </div>
          <div id="u163" class="ax_default">
            <div id="u163_div"></div>
            <div id="u164" class="text">
              <p><span>甘特图</span></p>
            </div>
          </div>
        </div>
        <div id="u165" class="ax_default">
          <img id="u165_img" class="img" src="zbswitchimg/u165.png"/>
        </div>
      </div>
      
      <div id="u167" class="ax_default">
        <img id="u167_img" class="img" src="zbswitchimg/u167.png"/>
      </div>
      
      <div id="u169" class="ax_default">
        <div id="u169_div"></div>
        <div id="u170" class="text">
          <p><span>环境检查</span></p>
        </div>
      </div>
      
      <div id="u171" class="ax_default line">
        <img id="u171_img" class="img" src="zbswitchimg/u171.png"/>
      </div>
      
      <div id="u173" class="ax_default" data-label="时间刻度" data-left="187" data-top="840" data-width="317" data-height="29">
        <div id="u174" class="ax_default line">
          <img id="u174_img" class="img" src="zbswitchimg/u174.png"/>
        </div>
        <div id="u176" class="ax_default">
          <div id="u176_div" ></div>
          <div id="u177" class="text">
            <p><span>00:30</span></p>
          </div>
        </div>
        <div id="u178" class="ax_default">
          <div id="u178_div"></div>
          <div id="u179" class="text">
            <p><span>00:45</span></p>
          </div>
        </div>
        <div id="u180" class="ax_default">
          <div id="u180_div"></div>
          <div id="u181" class="text">
            <p><span>01:00</span></p>
          </div>
        </div>
      </div>
      
      <div id="u225" class="ax_default line">
        <img id="u225_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u227" class="ax_default line">
        <img id="u227_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u229" class="ax_default">
        <div id="u229_div"></div>
      </div>
      
      <div id="u231" class="ax_default">
        <div id="u231_div"></div>
      </div>

      <div id="u233" class="ax_default">
        <div id="u233_div"></div>
      </div>
      
      <div id="u235" class="ax_default">
        <div id="u235_div"></div>
      </div>

      <div id="u237" class="ax_default">
        <div id="u237_div"></div>
      </div>
      
      <div id="u239" class="ax_default">
        <div id="u239_div"></div>
      </div>

      <div id="u241" class="ax_default">
        <div id="u241_div"></div>
      </div>

      <div id="u243" class="ax_default">
        <div id="u243_div"></div>
      </div>
      
      <div id="u245" class="ax_default line">
        <img id="u245_img" class="img" src="zbswitchimg/u245.png"/>
      </div>

      <div id="u247" class="ax_default line">
        <img id="u247_img" class="img" src="zbswitchimg/u245.png"/>
      </div>

      <div id="u249" class="ax_default line">
        <img id="u249_img" class="img" src="zbswitchimg/u245.png"/>
      </div>

      <div id="u251" class="ax_default line">
        <img id="u251_img" class="img" src="zbswitchimg/u245.png"/>
      </div>
      
      <div id="u253" class="ax_default line">
        <img id="u253_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u255" class="ax_default line">
        <img id="u255_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u257" class="ax_default line">
        <img id="u257_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u259" class="ax_default line">
        <img id="u259_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u261" class="ax_default line">
        <img id="u261_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u263" class="ax_default line">
        <img id="u263_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u265" class="ax_default line">
        <img id="u265_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u267" class="ax_default line">
        <img id="u267_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u269" class="ax_default line">
        <img id="u269_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u271" class="ax_default line">
        <img id="u271_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u273" class="ax_default line">
        <img id="u273_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u275" class="ax_default line">
        <img id="u275_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u277" class="ax_default line">
        <img id="u277_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u279" class="ax_default line">
        <img id="u279_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u281" class="ax_default line">
        <img id="u281_img" class="img" src="zbswitchimg/u174.png"/>
      </div>

      <div id="u283" class="ax_default line">
        <img id="u283_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u285" class="ax_default line">
        <img id="u285_img" class="img" src="zbswitchimg/u174.png"/>
      </div>
      
      <div id="u287" class="ax_default">
        <div id="u287_div"></div>
        <div id="u288" class="text">
          <p><span>备份</span><span>workdb</span><span>数据库</span></p>
        </div>
      </div>

      <div id="u289" class="ax_default">
        <div id="u289_div"></div>
        <div id="u290" class="text">
          <p><span>备份</span><span>icsdb</span><span>数据库</span></p>
        </div>
      </div>

      <div id="u291" class="ax_default">
        <div id="u291_div"></div>
        <div id="u292" class="text">
          <p><span>备份</span><span>carddb</span><span>数据库</span></p>
        </div>
      </div>
      
      <div id="u293" class="ax_default">
        <div id="u293_div"></div>
        <div id="u294" class="text">
          <p><span>备份</span><span>cmisdb</span><span>数据库</span></p>
        </div>
      </div>

      <div id="u295" class="ax_default">
        <div id="u295_div"></div>
        <div id="u296" class="text">
          <p><span>检查P770A2 HA状态</span></p>
        </div>
      </div>

      <div id="u297" class="ax_default">
        <div id="u297_div"></div>
        <div id="u298" class="text">
          <p><span>检查P770B2 HA状态</span></p>
        </div>
      </div>

      <div id="u299" class="ax_default">
        <div id="u299_div"></div>
        <div id="u300" class="text">
          <p><span>检查P770B1 HA状态</span></p>
        </div>
      </div>
      
      <div id="u301" class="ax_default">
        <div id="u301_div"></div>
        <div id="u302" class="text">
          <p><span>检查P770A1 HA状态</span></p>
        </div>
      </div>

      <div id="u303" class="ax_default">
        <div id="u303_div"></div>
        <div id="u304" class="text">
          <p><span>停止业务</span></p>
        </div>
      </div>

      <div id="u305" class="ax_default">
        <div id="u305_div"></div>
        <div id="u306" class="text">
          <p><span>P770A2停止HA</span></p>
        </div>
      </div>
      
      <div id="u307" class="ax_default">
        <div id="u307_div"></div>
        <div id="u308" class="text">
          <p><span>P770B2停止HA</span></p>
        </div>
      </div>

      <div id="u309" class="ax_default">
        <div id="u309_div"></div>
        <div id="u310" class="text">
          <p><span>P770A1停止HA</span></p>
        </div>
      </div>

      <div id="u311" class="ax_default">
        <div id="u311_div"></div>
        <div id="u312" class="text">
          <p><span>P770B1停止HA</span></p>
        </div>
      </div>
      
      <div id="u313" class="ax_default">
        <img id="u313_img" class="img" src="zbswitchimg/u167.png"/>
      </div>
      
      <div id="u315" class="ax_default">
        <div id="u315_div"></div>
        <div id="u316" class="text">
          <p><span>切换</span></p>
        </div>
      </div>

      <div id="u317" class="ax_default">
        <img id="u317_img" class="img" src="zbswitchimg/u167.png"/>
      </div>
      
      <div id="u319" class="ax_default">
        <div id="u319_div"></div>
        <div id="u320" class="text">
          <p><span>中断P770A1-&gt;C1复制</span></p>
        </div>
      </div>

      <div id="u321" class="ax_default">
        <div id="u321_div"></div>
        <div id="u322" class="text">
          <p><span>设置P770C1 LUN可读写</span></p>
        </div>
      </div>

      <div id="u323" class="ax_default">
        <div id="u323_div"></div>
        <div id="u324" class="text">
          <p><span>中断P770B1-&gt;C1复制</span></p>
        </div>
      </div>
      
      <div id="u325" class="ax_default">
        <div id="u325_div"></div>
        <div id="u326" class="text">
          <p><span>设置P770C1 LUN可读写</span></p>
        </div>
      </div>

      <div id="u327" class="ax_default">
        <div id="u327_div"></div>
        <div id="u328" class="text">
          <p><span>中断P770A2-&gt;C2复制</span></p>
        </div>
      </div>

	  
	  
	  <!-- 实时日志 -->
      <div id="u129" class="ax_default">
        <div id="u129_div"></div>
      </div>
      
      <div id="u133" class="ax_default" data-left="538" data-top="617" data-width="113" data-height="39">
        <div id="u134" class="ax_default">
          <img id="u134_img" class="img" src="zbswitchimg/u134.png"/>
        </div>
        <div id="u136" class="ax_default">
          <img id="u136_img" class="img" src="zbswitchimg/u136.png"/>
        </div>
        <div id="u138" class="ax_default">
          <div id="u138_div"></div>
          <div id="u139" class="text">
            <p><span>实时日志</span></p>
          </div>
        </div>
      </div>
      
      <div id="u329" class="ax_default text_area">
        <textarea id="u329_input"></textarea>
      </div>
      
	</div>
</body>


</html>