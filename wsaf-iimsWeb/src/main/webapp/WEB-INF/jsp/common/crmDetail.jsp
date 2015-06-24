<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>上海申通地铁集团信息管理_设备台帐</title>
<meta charset="utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/formalize.css" />
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/default/imgs.css" />
<link rel="stylesheet" href="css/reset.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/json2.js"></script>
<script src="js/projectPlan.js"></script>

<script type="text/javascript">  
      $(function(){
         var serialNo='${serialNo}';
         $.ajax({  
		    url :'<%=basePath%>crmInfo/showDetail?serialNo='+serialNo,
			type : 'post',
			dataType:'json',
			success: function(data) {
			    if(data.success==true){
			       //crmDatail
			       if(data.crmInfo!=null){
			          var crmInfo=data.crmInfo;
			          $("#serialNo").text(crmInfo.serialNo);
			          $("#recordTime").text("(建账时间/记录时间："+crmInfo.recordTime+")");
			          $("#equipType1").val(crmInfo.name2);
			          $("#equipType2").val(crmInfo.name);
			          $("#assetOwner").val(crmInfo.assetOwner);
			          $("#assetNo").val(crmInfo.assetNo);
			          $("#lineNo").val(crmInfo.lineNo);
			          $("#buildAddress").val(crmInfo.buildAddress);
			          $("#address").val(crmInfo.address);
			          $("#department").val(crmInfo.department);
			          $("#department2").val(crmInfo.department2);
			          $("#userName").val(crmInfo.userName);
			          $("#userPhone1").val(crmInfo.userPhone1);
			          $("#userPhone2").val(crmInfo.userPhone2);
			          $("#brand").val(crmInfo.brand);
			          $("#styleNo").val(crmInfo.styleNo);
			          $("#computerSn").val(crmInfo.computerSn);
			          $("#serviceL").val(crmInfo.serviceL);
			          $("#corePro").val(crmInfo.corePro);
			          $("#coreFire").val(crmInfo.coreFire);
			          $("#hdRev").val(crmInfo.hdRev);
			          $("#hdSize").val(crmInfo.hdSize);
			          $("#ramStyle").val(crmInfo.ramStyle);
			          $("#ram").val(crmInfo.ram);
			          $("#disSlotType").val(crmInfo.disSlotType);
			          $("#disChip").val(crmInfo.disChip);
			          $("#screenStyle").val(crmInfo.screenStyle);
			          $("#screenSize").val(crmInfo.screenSize);
			          $("#macAddress").val(crmInfo.macAddress);
			          $("#ipAddress").val(crmInfo.ipAddress);
			          $("#wifiMacAddress").val(crmInfo.wifiMacAddress);
			          $("#os").val(crmInfo.os);
			          $("#virWare").val(crmInfo.virWare);
			          $("#licL").val(crmInfo.licL);
			          $("#appL").text(crmInfo.appL);
			          $("#ass1").val(crmInfo.ass1);
			          $("#ass2").val(crmInfo.ass2);
			          $("#ass3").val(crmInfo.ass3);
			          $("#beizhu").text(crmInfo.beizhu);
			          $("#mainDep").val(crmInfo.mainDep); 
			       }
			       //history
			       if(data.crmInfoHises!=null && data.crmInfoHises.length>0){
			           for(var i=0;i<data.crmInfoHises.length;i++){
			              var crmHistory=data.crmInfoHises[i];
			              var trItem="<tr>";
			              trItem+="<td>"+(i+1)+"</td>";
			              trItem+="<td>"+crmHistory.faciClass+"-"+crmHistory.serialNo+"</td>";
			              trItem+="<td>"+crmHistory.assetNo+"</td>";  
			              trItem+="<td>"+crmHistory.department+"</td>";
			              trItem+="<td>"+crmHistory.department2+"</td>";
			              trItem+="<td>"+crmHistory.userName+"</td>";
			              trItem+="<td>"+crmHistory.userPhone1+"</td>";
			              trItem+="<td>"+crmHistory.brand+"</td>";
			              trItem+="<td>"+crmHistory.styleNo+"</td>";
			              trItem+="<td>"+crmHistory.coreFire+"</td>";
			              trItem+="<td>"+crmHistory.ram+"</td>";
			              trItem+="<td>"+crmHistory.hdSize+"</td>";
			              trItem+="<td>"+crmHistory.screenSize+"</td>";
			              trItem+="<td>"+crmHistory.macAddress+"</td>";
			              trItem+="<td>"+crmHistory.ipAddress+"</td>";
			              trItem+="<td>"+crmHistory.os+"</td>";
			              trItem+="</tr>";
			              $("#crmHistory tbody").append(trItem);
			           }
			       }
			       
			    }
				
			}	
		});
    });
</script>
<script src="js/equipMent.js"></script>
<style type="text/css">
	.red{
	 color: red;
	}
</style>
</head>
<body>
	<div class="main">
		<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="收起">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li><a href="#">首页</a>
					</li>
					<li><a href="#">运维和质量管理</a>
					</li>
					<li class="fin">CRM设备台账详情</li>
				</ul>
			</div>
		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Table-->
			<div class="mb10">
				<table width="100%"  class="table_1" style="border-color: grey" id="maintable">
					<thead>
					</thead>
					<tbody>
						<tr><td colspan="6" style="background-color: #DFDFDF"><p align="center">设施设备详情</p><a href="<%=basePath%>crmInfo/toCrmList" style="display: inline;color: blue" >返回前页</a></td></tr>
						<tr>
						    <td colspan="2" ><b>设备编号：</b><span id="serialNo" style="display: inline;"></span><span id="recordTime" style="display: inline;"></span></td>
						    <td colspan="3" ><b>设备类别：&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" id="equipType1" style="width: 100px"/>&nbsp;<input type="text" readonly="readonly" id="equipType2" style="width: 100px" /></td>
						</tr>
						<tr>
						   <td><b>资产归属信息</b></td>
						   <td>资产所属单位：<input type="text" readonly="readonly" id="assetOwner" /></td>
						   <td colspan="3">资产编号：　&nbsp;&nbsp;<input type="text" readonly="readonly" id="assetNo" /></td>
						</tr>
						<tr>
						  <td><b>地理位置信息</b></td>
						  <td>线路：　　　　<input type="text" readonly="readonly" id="lineNo"/></td>
						  <td>建筑物：　　&nbsp;&nbsp;<input type="text" readonly="readonly" id="buildAddress" /></td>
						  <td colspan="2">房间号：　　　<input type="text" readonly="readonly" id="address" /></td>
						</tr>
						<tr>
						   <td rowspan="2" style="vertical-align: middle;"><b>设备使用信息</b></td>
						   <td>使用单位：　　<input type="text" readonly="readonly" id="department" /></td>
						   <td>部&nbsp;&nbsp;&nbsp;&nbsp;门：　　&nbsp;&nbsp;<input type="text" readonly="readonly" id="department2" /></td>
						   <td colspan="2">使用人：　　　<input type="text" readonly="readonly" id="userName"/> </td>
						</tr>
						<tr>
						   <td>联系电话：　　<input type="text" readonly="readonly" id="userPhone1" /></td>
						   <td colspan="3" >备用电话：　&nbsp;&nbsp;<input type="text" readonly="readonly" id="userPhone2" /></td>
						</tr>
						<tr>
						     <td rowspan="2"><b>基本信息</b></td>
						     <td>品牌：　　　　<input type="text" readonly="readonly" id="brand" /></td>
						     <td colspan="2">序列号(S/N)：&nbsp;<input type="text" readonly="readonly" id="computerSn" /></td>
						</tr>
						<tr>
						    <td >型号：　　　　<input type="text" readonly="readonly" id="styleNo" /></td>
						    <td colspan="3">出保日期：　&nbsp;&nbsp;<input type="text" readonly="readonly" id="serviceL" /></td>
						</tr>
						<tr>
						  <td rowspan="7" style="vertical-align: middle;"><b>硬件规格</b></td>
						  <td >CPU型号：　　<input type="text" readonly="readonly" id="corePro" /></td>
						  <td >CPU主频(G)：<input type="text" readonly="readonly" id="coreFire" /></td>
						  <td colspan="2">硬盘转速：　　<input type="text" readonly="readonly" id="hdRev" /></td>
						</tr>
						<tr>
						   <td>硬盘容量(G)：&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" id="hdSize" /></td>
						   <td>内存容量(G)：&nbsp;<input type="text" readonly="readonly" id="ram" /></td>
						   <td colspan="2">内存类型：　　<input type="text" readonly="readonly" id="ramStyle" /></td>
						</tr>
						<tr>
						   
						</tr>
						<tr>
						   <td>显卡插槽类型：&nbsp;<input type="text" readonly="readonly" id="disSlotType" /></td>
						   <td>显示器类型：&nbsp;&nbsp;<input type="text" readonly="readonly" id="screenStyle" /></td>
						   <td colspan="2">显卡芯片：　　<input type="text" readonly="readonly" id="disChip" /></td>
						</tr>
						<tr>
						   <td>显示器尺寸：　<input type="text" readonly="readonly" id="screenSize" /></td>
						   <td>MAC地址：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" id="macAddress" /></td>
						   <td colspan="2">IP地址：　　&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" id="ipAddress" /></td>
						</tr>
						<tr>
						   
						</tr>
						<tr>
						   <td colspan="4">无线mac地址：<input type="text" readonly="readonly" id="wifiMacAddress" /></td>
						</tr>
						<tr>
						    <td rowspan="2" style="vertical-align: middle;"><b>软件情况</b></td>
						    <td >操作系统：　　<input type="text" id="os" readonly="readonly" ></td>
						    <td >防病毒软件：<input type="text" id="virWare" readonly="readonly" ></td>
						    <td colspan="2">Licence到期时间：<input type="text" id="licL" readonly="readonly" style="width: 160px"></td>
						</tr>
						<tr>
						   <td colspan="6" > <span>应用软件信息：</span></span><textarea rows="5" id="appL" readonly="readonly"></textarea></td>
						</tr>
						<tr>
						   <td style="vertical-align: middle;"><b>关联设备</b></td>
						   <td>关联设备1：　<input type="text" id="ass1" readonly="readonly" ></td>
						   <td>关联设备2：<input type="text" id="ass2" readonly="readonly" ></td>
						   <td colspan="2">关联设备3：　<input type="text" id="ass3" readonly="readonly" value="关联设备3"></td>
						</tr>
						<tr>
						    <td style="vertical-align: middle;"><b>备注</b></td>
						    <td colspan="5"><textarea id="beizhu" cols="20" rows="5" readonly="readonly"></textarea></td>
						</tr>
						<tr>
						    <td style="vertical-align: middle;"><b>维护单位</b></td>
						    <td colspan="5"><input type="text" id="mainDep" readonly="readonly" style="width: 200px" ></td>
						</tr>
						<tr><td colspan="6" style="background-color: #DFDFDF"><p align="center">设施设备历史</p><a href="<%=basePath%>crmInfo/toCrmList" style="display: inline;color: blue"onclick ="javascript:history.back();">返回前页</a></td></tr>
						<tr>
						    <td colspan="6">
								  <table width="100%"  class="table_1" id="crmHistory">
									<thead>
										<tr style="background-color: #F1F1F4">
											<td rowspan="3" style="vertical-align:middle;"><a href="#"><span class="fl">序号</span><i></i></a></td>
											<td rowspan="3" style="vertical-align:middle;"><a href="#"><span class="fl">设备编号</span><i></i></a></td>
											<td  rowspan="3" style="vertical-align:middle;"><a href="#"><span class="fl">资产编号</span><i></i></a></td>
											<td colspan="4"><a href="#"><span class="fl">使用信息</span><i></i></a></td>
											<td colspan="2"><a href="#"><span class="fl">产品信息</span><i></i></a></td>
											<td colspan="6"><a href="#"><span class="fl">硬件配置</span><i></i></a></td>
											<td rowspan="2" style="vertical-align:middle;"><a href="#"><span class="fl">软件配置</span><i></i></a></td>
										</tr>
										<tr style="background-color: #F1F1F4">
										    <td rowspan="2">单位</td>
										    <td rowspan="2">部门</td>
										    <td rowspan="2">使用人</td>
										    <td rowspan="2">电话</td>
										    <td rowspan="2">品牌</td>
										    <td rowspan="2">型号</td>
										    <td>CPU</td>
										    <td>内存</td>
										    <td>硬盘</td>
										    <td>显示</td>
										    <td colspan="2">网络</td>
										</tr>
										<tr style="background-color: #F1F1F4">
										    <td>主频</td>
										    <td>容量</td>
										    <td>容量</td>
										    <td>尺寸</td>
										    <td>mac地址</td>
										    <td>ip地址</td>
										    <td>操作系统</td>
										</tr>
									</thead>
									<tbody></tbody>
									<tfoot></tfoot>
								</table> 
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="17">
								<div class="clearfix">
									<span class="fl"></span>
									<ul id="page" class="fr clearfix pager"></ul>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				 

			</div>
			<!--Table End-->
		</div>
	</div>
</body>
</html>
