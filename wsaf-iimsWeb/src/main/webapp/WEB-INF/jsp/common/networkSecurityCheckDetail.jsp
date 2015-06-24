<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>安全自查</title>
<link rel="stylesheet" href="css/formalize.css" />

<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/default/imgs.css" />
<link rel="stylesheet" href="css/reset.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<!--[if IE 6.0]>
           <script src="js/iepng.js" type="text/javascript"></script>
           <script type="text/javascript">
                EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
           </script>
       <![endif]-->

<style>
.box a {
	display: block;
}
</style>

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/jquery-1.3.2.min.js"></script>
<script src="js/securityCheck.js"></script>
<script type="text/javascript">
$(function(){
	QueryString.Initial();
	$.getListDetail("${pageContext.request.contextPath}");
	$.getTitle("${pageContext.request.contextPath}");
	$.postResourceManageDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'),true);
	
	$("#btnSubmit").click(function(){
		var otherData = $.getOtherData();
		if(QueryString.GetValue('id')!=null)
		   {
		   otherData+="&id="+QueryString.GetValue('id');
		   }
		$.postsave("${pageContext.request.contextPath}","projectPlanForm",otherData+"&status=review");
	});
	$("#btnSave").click(function(){
		var otherData = $.getOtherData();
		if(QueryString.GetValue('id')!=null)
		   {
		   otherData+="&id="+QueryString.GetValue('id');
		   }
		$.postsave("${pageContext.request.contextPath}","projectPlanForm",otherData+"&status=draft");
	});
	$("#btnDele").click(function(){
		if(confirm("你确认删除吗？")){
            var id="";
	         if(QueryString.GetValue('id')!=null)
         		   {
         		   id+=QueryString.GetValue('id');
         		   }
	         	$.postDele("${pageContext.request.contextPath}",id);
          }
	});
	$("#btnClose").click(function(){
		window.close();
	});
	
	$(":input").attr("disabled","");
	$("#company").attr("disabled","disabled");
});

</script>
<style type="text/css">
td {
	vertical-align: 
}

.xiahuaxian {
	text-decoration: underline;
}

.red {
	color: #F30;
}

.inline {
	display: inline;
}

#table_2 td {
 	text-align:center;
}
#table_3 #title {
 	text-align:center;
}
#table_3 .t_r {
text-align: left;
}
</style>


</head>

<body>




	<div class="button t_c"></div>



	<div class="main">
		<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="收起">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li><a>首页</a>
					</li>
					<li><a>安全管理</a>
					</li>
					<li class="fin">安全自查</li>
				</ul>
			</div>
			<div class="fr lit_nav nwarp">
				<ul>
					<li class="selected"><a class="print" href="#">打印</a>
					</li>
					<li><a class="express" href="#">导出数据</a>
					</li>
					<li class="selected"><a class="table" href="#">表格模式</a>
					</li>
					<li><a class="treeOpen" href="#">打开树</a>
					</li>
					<li><a class="filterClose" href="#">关闭过滤</a>
					</li>
				</ul>
			</div>
		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Tabs_2-->
			<div class="tabs_2 nwarp">
				<ul class="nwarp">
					<li class="selected" id="1" onclick="t1();"><a><span>网络安全检查</span> </a>
					</li>
					<li id="2" onclick="t2();"><a><span>网络安全自评</span> </a>
					</li>
					<li id="3" onclick="t3();"><a><span>安全总结报告</span> </a>
					</li>
				</ul>
			</div>
			<!--Tabs_2 End-->
			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<table class="nwarp" width="100%" border="0" cellspacing="0"
							cellpadding="0">

							<tr>
								<td colspan="6" class="t_r">
									<!-- <input type="reset" value="导 入" /><input type="button" value="下载模板"/></td>-->
							</tr>
						</table>
					</div>
				</div>
				<div class="mb10">
					<form id="projectPlanForm">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table_2" id="table_1">
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a1">部门基本情况</a>
									</h5></th>
							</thead>
							<tbody id="tb1">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>基本情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;">单位名称</td>
									<td colspan="3">
									<input disabled type="text" class="input_large" id="company" />
									<input type="hidden" class="input_large" name="company" />
									<input type="hidden" class="input_large" name="companyId" />
									<input type="hidden" name="applyer">
									<input type="hidden" name="applyerLoginname">
									<input type="hidden" name="initiator">
									<input type="hidden" name="initiatorLoginname">
									
									</td>
								</tr>

								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>分管网络安全的领导</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">姓名</td>
									<td><input type="text" class="input_large"
										name="leaderName" />
									</td>
									<td class="lableTd t_r">职务</td>
									<td><input type="text" class="input_large"
										name="leaderPost" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>网络安全管理机构</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">名称</td>
									<td><input type="text" class="input_large"
										name="officeName" />
									</td>
									<td class="lableTd t_r">负责人</td>
									<td><input type="text" class="input_large"
										name="officeLeader" /></td>
								</tr>

								<tr>
									<td class="lableTd t_r">职务</td>
									<td><input type="text" class="input_large"
										name="officeLeaderPost" /></td>
									<td class="lableTd t_r">联系人</td>
									<td><input type="text" class="input_large"
										name="officeLinkman" /></td>

								</tr>

								<tr>
									<td class="lableTd t_r">办公电话</td>
									<td><input type="text" class="input_large"
										name="officePhone" />
									</td>
									<td class="lableTd t_r">移动电话</td>
									<td><input type="text" class="input_large"
										name="officeMobile" /></td>
								</tr>


								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>网络安全专职工作机构</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">名称</td>
									<td><input type="text" class="input_large"
										name="jobOfficeName" /></td>
									<td class="lableTd t_r">负责人</td>
									<td><input type="text" class="input_large"
										name="jobOfficeLeader" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">联系电话</td>
									<td><input type="text" class="input_large"
										name="jobOfficePhone" /></td>
									<td class="lableTd t_r">移动电话</td>
									<td><input type="text" class="input_large"
										name="jobOfficeMobile" />
									</td>
								</tr>
							</tbody>

							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a2">信息系统基本情况</a>
									</h5></th>
							</thead>
							<tbody id="tb2" class="tb2">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>信息系统情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">信息系统总数</td>
									<td><input type="text" class="input_large"
										id="infoSysSummaryCount" />
									</td>
									<td class="lableTd t_r" style="text-decoration:inline;">面向社会公众提供服务的系统数量</td>
									<td><input type="text" class="input_large"
										id="infoSysSummaryPublic">
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;">本年度经过安全测评的系统数量</td>
									<td><input type="text" id="infoSysSummaryCheckPass"
										class="input_large">
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>网络连接情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">可以通过互联网访问的系统数量</td>
									<td><input type="text" class="input_large"
										id="infoSysSummaryInternet" />
									</td>
									<td class="lableTd t_r">不通过互联网访问的数量</td>
									<td><input type="text" class="input_large"
										id="infoSysSummaryNoInternet" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>网络接入情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">互联网接入口总数</td>
									<td><input type="text" class="input_large"
										id="internetAccessCount" />
									</td>

								</tr>

								<tr>
									<td class="lableTd t_r"><h4>
											<input type="radio" name="internetAccessRadio" value="unicom" id="unicom">接入中国联通
										</h4>
									</td>
									<td class="lableTd t_r"></td>
								</tr>
								</tbody>
								<tbody id="tunicom" style="display:none">
								<tr>
									<td class="lableTd t_r">接入口数量</td>
									<td><input type="text" class="input_large" id="unicomNum" />
									</td>
									<td class="lableTd t_r">接入带宽</td>
									<td><input type="text" class="input_large" id="unicomBw" />MB
									</td>
								</tr>
								</tbody>
								<tbody class="tb2">
								<tr>
									<td class="lableTd t_r"><h4>
											<input type="radio" name="internetAccessRadio" value="mobile" id="mobile">接入中国电信
										</h4>
									</td>
									<td class="lableTd t_r"></td>
								</tr>
								</tbody>
								<tbody id="tmobile" style="display:none">
								<tr>
									<td class="lableTd t_r">接入口数量</td>
									<td><input type="text" class="input_large" id="mobileNum" />
									</td>
									<td class="lableTd t_r">接入带宽</td>
									<td><input type="text" class="input_large" id="mobileBw" />MB
									</td>
								</tr>
								</tbody>
								<tbody class="tb2">
								<tr>
									<td class="lableTd t_r"><h4>
											<input type="radio" name="internetAccessRadio" value="other" id="otherRadio">其他 
										</h4></td>
									
								</tr>
								</tbody>
								<tbody id="tother" style="display:none">
								<tr>
									<td class="lableTd t_r">其他接入口名称</td>
									<td><input type="text" class="input_large" id="otherName" /></td>
								</tr>
								<tr>
									<td class="lableTd t_r">接入口数量</td>
									<td><input type="text" class="input_large" id="otherNum" />
									</td>
									<td class="lableTd t_r">接入带宽</td>
									<td><input type="text" class="input_large" id="otherBw" />MB
									</td>
								</tr>
								</tbody>
								<tbody class="tb2">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>系统定级情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">第一级</td>
									<td><input type="text" class="input_large" id="lv1" />个</td>
									<td class="lableTd t_r">第二级</td>
									<td><input type="text" class="input_large" id="lv2" />个</td>
								</tr>
								<tr>
									<td class="lableTd t_r">第三级</td>
									<td><input type="text" class="input_large" id="lv3" />个</td>
									<td class="lableTd t_r">第四级</td>
									<td><input type="text" class="input_large" id="lv4" />个</td>
								</tr>
								<tr>
									<td class="lableTd t_r">未定级</td>
									<td><input type="text" class="input_large" id="no" />个</td>
								</tr>
								<tr>
									<td class="lableTd t_r">岗位网络安全责任制度</td>
									<td><select class="input_large" name="staffResponsibilitySys">
											<option value="">请选择</option>
											<option value="YES">已建立</option>
											<option value="NO">未建立</option>
									</select>
									</td>
									<td class="lableTd t_r">重点岗位人员安全保密协议</td>
									<td><select class="input_large" name="staffSecrecyAgreement">
											<option value="">请选择</option>
											<option value="all">全部签订</option>
											<option value="part">部分签订</option>
											<option value="none">均未签订</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">人员离岗离职安全管理规定</td>
									<td><select class="input_large" name="staffLeaveRule">
											<option value="">请选择</option>
											<option value="YES">已制定</option>
											<option value="NO">未制定</option>
									</select>
									</td>
									<td class="lableTd t_r">外部人员访问机房等重要区域审批制度</td>
									<td><select class="input_large" name="staffVisitAudit">
											<option value="">请选择</option>
											<option value="YES">已建立</option>
											<option value="NO">未建立</option>
									</select>
									</td>
								</tr>

								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>资产管理</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>

								<tr>
									<td class="lableTd t_r">资产管理制度</td>
									<td><select class="input_large" name="assetManageSystem">
											<option value="">请选择</option>
											<option value="YES">已建立</option>
											<option value="NO">未建立</option>
									</select>
									</td>
									<td class="lableTd t_r">设备维修维护和报废管理</td>
									<td><select class="input_large" name="assetDeviceMaintain">
											<option value="">请选择</option>
											<option value="all">已建立管理制度，且记录完整</option>
											<option value="part">已建立管理制度，但记录不完整</option>
											<option value="none">未建立管理制度</option>
									</select>
									</td>
								</tr>
							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a3">网络安全日常管理情况</a>
									</h5></th>
							</thead>
							<tbody id="tb3">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>人员管理</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">岗位网络安全责任制度</td>
									<td><select class="input_large"
										name="staffResponsibilitySys">
											<option value="">请选择</option>
											<option value="YES">已建立</option>
											<option value="NO">未建立</option>
									</select></td>
									<td class="lableTd t_r">重点岗位人员安全保密协议</td>
									<td><select class="input_large"
										name="staffSecrecyAgreement">
											<option value="">请选择</option>
											<option value="all">全部签订</option>
											<option value="part">部分签订</option>
											<option value="none">均未签订</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r">人员离岗离职安全管理规定</td>
									<td><select class="input_large" name="staffLeaveRule">
											<option value="">请选择</option>
											<option value="YES">已制定</option>
											<option value="NO">未制定</option>
									</select></td>
									<td class="lableTd t_r">外部人员访问机房等重要区域审批制度</td>
									<td><select class="input_large" name="staffVisitAudit">
											<option value="">请选择</option>
											<option value="YES">已建立</option>
											<option value="NO">未建立</option>
									</select></td>
								</tr>


								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>资产管理</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">资产管理制度</td>
									<td><select class="input_large" name="assetManageSystem">
											<option value="">请选择</option>
											<option value="YES">已建立</option>
											<option value="NO">未建立</option>
									</select></td>
									<td class="lableTd t_r">设备维修维护和报废管理</td>
									<td><select class="input_large" name="assetDeviceMaintain">
											<option value="">请选择</option>
											<option value="all">已建立管理制度，且记录完整</option>
											<option value="part">已建立管理制度，但记录不完整</option>
											<option value="none">未建立管理制度</option>
									</select></td>
								</tr>
							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a4">网络安全防护情况</a>
									</h5></th>
							</thead>
							<tbody id="tb4" class="tb4">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>网络边界安全防护</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">网络安全防护设备部署</td>
									<td><select class="input_large" name="netProtectDevice">
											<option value="">请选择</option>
											<option value="fireWall">防火墙</option>
											<option value="invadeCheck">入侵检测设备</option>
											<option value="safeAudit">安全审计设备</option>
											<option value="antivirusGateway">防病毒网关</option>
											<option value="antiAttackDevice">抗拒绝服务攻击设备</option>
											<option value="other">其它</option>
									</select></td>
									<td class="lableTd t_r">设备安全策略配置</td>
									<td><select class="input_large"
										name="netSafestrategyConfig">
											<option value="">请选择</option>
											<option value="default">使用默认配置</option>
											<option value="config">根据需要配置</option>
									</select></td>
								</tr>
								</tbody>
								<tbody id="netProtectDeviceOther" style="display:none" class="tb4">
								<tr>
									<td class="lableTd t_r">网络安全防护设备部署：其他</td>
									<td><input type="text" class="input_large"
										name="netProtectDeviceOther">
									</td>
								</tr>
								</tbody>
								<tbody class="tb4">
								<tr>
									<td class="lableTd t_r">网络访问日志</td>
									<td><select class="input_large" name="netVisitLog">
											<option value="">请选择</option>
											<option value="hasLog">留存日志</option>
											<option value="noLog">未留存日志</option>
									</select></td>
									<td class="lableTd t_r">云计算服务设施位置</td>
									<td><select class="input_large" name="netCloudDevice">
											<option value="">请选择</option>
											<option value="no">未使用</option>
											<option value="innerSide">本单位</option>
											<option value="outerSide">外部单位</option>
											<option value="foreign">境外</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r">外包服务工程中数据提交</td>
									<td><select class="input_large"
										name="netEpibolyDataCommit">
											<option value="">请选择</option>
											<option value="no">未提交</option>
											<option value="outerSide">外部单位</option>
											<option value="foreign">境外机构</option>
									</select></td>
									<td class="lableTd t_r">系统远程控制/维护</td>
									<td><select class="input_large"
										name="netRemoteControl">
											<option value="">请选择</option>
											<option value="no">无</option>
											<option value="outerSide">外部单位</option>
											<option value="foreign">境外机构</option>
									</select></td>


								</tr>
								</tbody>
								<tbody id="netRemoteControlSys" style="display:none">
								<tr>
									<td class="lableTd t_r"></td>
									<td class="lableTd t_r"></td>
									<td class="lableTd t_r">远程控制/维护系统
										<input type="button" value="增加" id="addSys">
										<input type="button" value="减少" id="reduceSys">
									</td>
									<td id="sysName">
										<div id="sysName_1" style="display:inline">系统名称：<input type="text" class="input_large" id="netRemoteControlSys_1" style="width:170px;"></div>
									</td>
								</tr>
								</tbody>
								<tbody class="tb4">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>无线网络安全防护</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">本单位使用无线路由器数量</td>
									<td><input type="text" class="input_large"
										 name="routerCount">个</td>
									<td class="lableTd t_r">无线路由器用途</td>
									<td><select class="input_large" name="routerUse_select">
											<option value="">请选择</option>
											<option value="visitInternet">访问互联网</option>
											<option value="visitBusinessNet">访问业务/办公网络</option>
									</select>
									<div id="internet" style="display:none">访问互联网<input type="text" class="input_large" id="visitInternet" style="width:120px;">个</div>
									<div id="businessNet" style="display:none">访问业务/办公网络<input type="text" class="input_large" id="visitBusinessNet" style="width:120px;">个</div>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">安全防护策略（可多选）</td>
									<td><input type="checkbox" name="securityDefense_c" value="idDefense"/>采取身份鉴别措施 &nbsp;&nbsp;
										<input type="checkbox" name="securityDefense_c" value="ipDefense"/>采取地址过滤措施&nbsp;&nbsp; 
										<input type="checkbox" name="securityDefense_c" value="noDefense"/>未设置安全防护策略
									</td>
									<td class="lableTd t_r">无线路由器使用默认管理地址情况</td>
									<td><select class="input_large" name="routerDfaultAddress">
											<option value="">请选择</option>
											<option value="YES">存在</option>
											<option value="NO">不存在</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r">无线路由器使用默认管理口令情况</td>
									<td><select class="input_large" name="routerDfaultPwd">
											<option value="">请选择</option>
											<option value="YES">存在</option>
											<option value="NO">不存在</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>
											门户网站安全防护</h3></td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">门户网站域名</td>
									<td><input type="text" name="siteDomain"
										class="input_large" />
									</td>
									<td class="lableTd t_r">门户网站IP地址</td>
									<td><input type="text" name="siteIp" class="input_large" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">网页防篡改措施</td>
									<td><select class="input_large" name="sitePageAntitamper">
											<option value="">请选择</option>
											<option value="YES">采用</option>
											<option value="NO">未采用</option>
									</select></td>
									<td class="lableTd t_r">漏洞扫描</td>
									<td><select class="input_large" name="siteLeakScan">
											<option value="">请选择</option>
											<option value="regular">定期扫描</option>
											<option value="irregular">不定期</option>
											<option value="noScan">未进行</option>
									</select>
									<div id="siteLeakScanPeriod" style="display:none">漏洞扫描周期<input type="text" name="siteLeakScanPeriod" class="input_large" /></div>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">信息发布管理</td>
									<td><select class="input_large" name="sitePublish">
											<option value="">请选择</option>
											<option value="all">已建立审核制度，且记录完整</option>
											<option value="part">已建立审核制度，但记录不完整</option>
											<option value="none">未建立审核制度</option>
									</select></td>
									<td class="lableTd t_r">运维方式</td>
									<td><select class="input_large" name="siteMaintain">
											<option value="">请选择</option>
											<option value="self">自行运维</option>
											<option value="thirdParty">委托第三方运维</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>
											电子邮件安全防护</h3></td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								
								<tr>
									<td class="lableTd t_r">电子邮件建设方式</td>
									<td><select class="input_large" name="emailBuild">
											<option value="">请选择</option>
											<option value="self">自行建设</option>
											<option value="thirdParty">使用第三方服务</option>
									</select></td>
									<td class="lableTd t_r">电子邮件账户数量</td>
									<td><input type="text" name="emailAccount"
										class="input_large">个</td>
								</tr>
								</tbody>
								<tbody id="emailSupplier" style="display:none">
								<tr>
									<td class="lableTd t_r">电子邮件服务提供商</td>
									<td><input type="text" name="emailSupplier"
										class="input_large" /></td>
								</tr>
								</tbody>
								<tbody class="tb4">
								<tr>
									<td class="lableTd t_r">电子邮件注册管理</td>
									<td><select class="input_large" name="emailRegister">
											<option value="">请选择</option>
											<option value="mustAudit">须经审批</option>
											<option value="anyRegister">任意注册</option>
									</select></td>
									<td class="lableTd t_r">电子邮件口令管理</td>
									<td><select class="input_large" name="emailPwd">
											<option value="">请选择</option>
											<option value="technicalControl">使用技术措施控制口令强度</option>
											<option value="noTechnicalControl">没有采取技术措施控制口令强度</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r">电子邮件安全防护</td>
									<td colspan="3">
										<input type="checkbox" value="antivirus"name="emailProtect_c" />采取病毒木马防护措施&nbsp;&nbsp; 
										<input type="checkbox" value="fireWall" name="emailProtect_c" />部署防火墙、入侵检测等设备&nbsp;&nbsp;
										<input type="checkbox" value="antiJunkMail" name="emailProtect_c" />采取反应垃圾邮件措施&nbsp;&nbsp; 
										<input type="checkbox" value="other" id="other" name="emailProtect_c" onclick="email();"/>其他&nbsp;&nbsp;
										</td>
								</tr>
								</tbody>
								<tbody id="emailProtectOther" style="display:none">
								<tr>
								<td class="lableTd t_r">电子邮件安全防护_其他</td>
									<td><input type="text" class="input_large" name="emailProtectOther" style="width:100px;"></td>
								</tr>
								</tbody>
								<tbody class="tb4">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>
											终端计算机安全防护</h3></td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">终端计算机安全管理</td>
									<td colspan="3">
									<select class="input_large" name="terminalManage">
											<option value="">请选择</option>
											<option value="unifiedManage">集中统一管理</option>
											<option value="decentralizedManage">分散管理</option>
									</select> &nbsp;&nbsp; 
									<input type="checkbox" name="terminalUnifiedManage_c" value="appInstall"/>规范软硬件安装&nbsp;&nbsp; 
									<input type="checkbox" name="terminalUnifiedManage_c" value="patchInstall"/>统一补丁升级 &nbsp;&nbsp; 
									<input type="checkbox" name="terminalUnifiedManage_c" value="antivirus"/>统一病毒防护&nbsp;&nbsp;
									<input type="checkbox" name="terminalUnifiedManage_c" value="safeAudit"/>统一安全审计&nbsp;&nbsp; 
									<input type="checkbox" name="terminalUnifiedManage_c" value="UDIskControl"/>对移动存储介质接入实施控制&nbsp;&nbsp; 
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">终端计算机接入互联网安全控制措施</td>
									<td><select class="input_large"
										name="terminalLinkInternet">
											<option value="">请选择</option>
											<option value="hasControl">有控制措施（如实名接入、绑定计算机IP和MAC地址等）</option>
											<option value="noControl">无控制措施</option>
									</select></td>
									<td class="lableTd t_r">终端计算机接入办公系统安全控制措施</td>
									<td><select class="input_large" name="terminalLinkOa">
											<option value="">请选择</option>
											<option value="hasControl">有控制措施（如实名接入、绑定计算机IP和MAC地址等）</option>
											<option value="noControl">无控制措施</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>移动存储介质安全防护</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">移动存储介质管理方式</td>
									<td><select class="input_large" name="storageManage">
											<option value="">请选择</option>
											<option value="unifiedManage">集中管理，统一登记、配发、收回、维修、报废、销毁</option>
											<option value="noUnifiedManage">未采取集中管理方式</option>
									</select></td>
									<td class="lableTd t_r">移动存储介质信息销毁</td>
									<td><select class="input_large" name="storageDestory">
											<option value="">请选择</option>
											<option value="hasDestoryDevice">已配备信息消除和销毁设备</option>
											<option value="noDestoryDevice">未配备信息消除和销毁设备</option>
									</select></td>
								</tr>
							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a5">网络安全应急工作情况</a>
									</h5></th>
							</thead>
							<tbody id="tb5" class="tb5">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>应急预案</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">应急预案制定情况</td>
									<td><select class="input_large" name="emergencyPlanJob">
											<option value="">请选择</option>
											<option value="YES">已制定</option>
											<option value="NO">未制定</option>
									</select></td>
									<td class="lableTd t_r">应急预案本年度修订情况</td>
									<td><select class="input_large" name="emergencyPlanEdit">
											<option value="">请选择</option>
											<option value="YES">修订</option>
											<option value="NO">未修订</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>应急演练</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">应急演练开展情况</td>
									<td><select class="input_large" name="emergencyTrainJob">
											<option value="">请选择</option>
											<option value="trainThisYear">本年度已开展</option>
											<option value="noTrainThisYear">本年度未开展</option>
									</select></td>
								</tr>
								</tbody>
								<tbody id="emergencyTrainTime" style="display:none">
								<tr>
									<td class="lableTd t_r">应急演练时间</td>
									<td><input type="text" name="emergencyTrainTime" class="input_large" />
									</td>
								</tr>
								</tbody>
								<tbody class="tb5">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>灾难备份</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">灾难数据备份</td>
									<td><select class="input_large" name="emergencyDataback">
											<option value="">请选择</option>
											<option value="hasDataBack">采取备份措施</option>
											<option value="noDataBack">未采取备份措施</option>
									</select></td>
									<td class="lableTd t_r">灾难数据备份周期</td>
									<td><select class="input_large"
										name="emergencyDatabackPeriod">
											<option value="">请选择</option>
											<option value="inTime">实时</option>
											<option value="day">日</option>
											<option value="week">周</option>
											<option value="month">月</option>
											<option value="aperiodicity">不定期</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r">系统备份</td>
									<td colspan="3">采取实时备份措施的系统数量：<input type="text"
										name="emergencySysback" class="input_large">
										&nbsp;&nbsp; 未采取实时备份措施的系统数量：<input type="text"
										name="emergencyNoSysback" class="input_large"></td>
								</tr>
								<tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>应急技术队伍</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">应急技术队伍</td>
									<td><select class="input_large"
										name="emergencyTechnicalTeam">
											<option value="">请选择</option>
											<option value="innerSider">本部门所属</option>
											<option value="outerSider">外部服务机构</option>
											<option value="no">无</option>
									</select></td>
								</tr>
							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a6">网络安全教育培训情况</a>
									</h5></th>
							</thead>
							<tbody id="tb6">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>培训次数</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">本年度开展网络安全教育培训的次数</td>
									<td><input type="text" class="input_large"
										name="educationTrainNum" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>培训人数</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">本年度参加网络安全教育培训的人数</td>
									<td><input type="text" class="input_large"
										name="educationTrainStaff" />
									</td>
									<td class="lableTd t_r">占本单位总人数的比例</td>
									<td><input type="text" class="input_large"
										name="educationTrainPercent" />%</td>
								</tr>
							</tbody>

							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a7">信息技术产品应用情况</a>
									</h5></th>
							</thead>
							<tbody id="tb7" class="tb7">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>服务器</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总台数</td>
									<td><input type="text" class="input_large"
										id="productServerCount" />
									</td>
									<td class="lableTd t_r">品牌情况：国内品牌台数:</td>
									<td><input type="text" class="input_large" id="productServerBrandInternal" style="width:135px;" />
									 其中，使用国产CPU的台数：<input type="text" class="input_large" id="productServerBrandInternalCpu" style="width:135px;" /> 
									 国外品牌台数：<input type="text" class="input_large" id="productServerBrandForeign" style="width:135px;" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">操作系统情况：使用国产操作系统的台数：</td>
									<td><input type="text" class="input_large"
										id="productServerSysInternal" /></td>
									<td class="lableTd t_r">使用国外操作系统的台数：</td>
									<td><input type="text" class="input_large"
										id="productServerSysForeign" />
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>终端计算机（含笔记本）</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总台数</td>
									<td><input type="text" class="input_large"
										id="productTerminalCount" />
									</td>
									<td class="lableTd t_r">品牌情况：国内品牌台数:</td>
									<td><input type="text" class="input_large" id="productTerminalBrandInternal" style="width:135px;" /> 
									其中，使用国产CPU的台数：<input type="text" class="input_large" id="productTerminalBrandInternalCpu" style="width:135px;" />
									国外品牌台数：<input type="text" class="input_large" id="productTerminalForeign" style="width:135px;" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">操作系统情况：使用国产操作系统的台数：</td>
									<td><input type="text" class="input_large"
										id="productTerminalSysInternal" /></td>
									<td class="lableTd t_r">使用国外操作系统的台数：</td>
									<td><input type="text" class="input_large"
										id="productTerminalSysForeign" /> 其中，使用WindowsXP的台数：<input type="text"
										class="input_large" id="productTerminalSyswinXp" /></td>
								</tr>
								<tr>
									<td class="lableTd t_r">WindowsXP停止服务后的安全加固措施：</td>
									<td><select class="input_large" style="width:200px;" id="afterWinXpStop">
											<option value="">请选择</option>
											<option value="uninstallApp">卸载与工作无关的应用程序</option>
											<option value="closeService">关闭不必要服务和端口</option>
											<option value="useThirdPartyPatch">采取第三方安全补丁更新</option>
											<option value="isolateInternet">与互联网隔离</option>
											<option value="other">其他</option>
											<option value="no">未加固</option>

									</select>
									</td>
									
								</tr>
								</tbody>
								<tbody id="afterWinXpStopOther" style="display:none">
								<tr>
								<td class="lableTd t_r">WindowsXP停止服务后的安全加固措施_其他</td>
									<td><input type="text" class="input_large"
										name="afterWinXpStopOther" />
									</td>
								</tr>
								</tbody>
								<tbody class="tb7">
								<tr>
									<td class="lableTd t_r">安装国产字处理软件的终端计算机台数</td>
									<td><input type="text" class="input_large"
										id="internalWord" />
									</td>
									<td class="lableTd t_r">安装国产防病毒软件的终端计算机台数</td>
									<td><input type="text" class="input_large"
										id="internalFireWall" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>路由器</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总台数</td>
									<td><input type="text" class="input_large"
										id="productRouterCount" />
									</td>
									<td class="lableTd t_r">品牌情况：国内品牌台数:</td>
									<td><input type="text" class="input_large" id="productRouterBrandInternal" style="width:135px;" /> 
									国外品牌台数：<input type="text" class="input_large" id="productRouterBrandForeign" style="width:135px;" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>交换机</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总台数</td>
									<td><input type="text" class="input_large"
										id="productSwitchCount" />
									</td>
									<td class="lableTd t_r">品牌情况：国内品牌台数:</td>
									<td><input type="text" class="input_large"
										id="productSwitchBrandInternal" style="width:135px;" /> 国外品牌台数：<input
										type="text" class="input_large" id="productSwitchBrandForeign"
										style="width:135px;" /></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>存储设备</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总台数</td>
									<td><input type="text" class="input_large"
										id="productStorageCount" />
									</td>
									<td class="lableTd t_r">品牌情况：国内品牌台数:</td>
									<td><input type="text" class="input_large"
										id="productStorageBrandInternal" style="width:135px;" /> 国外品牌台数：<input
										type="text" class="input_large" id="productStorageBrandForeign"
										style="width:135px;" /></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>数据库管理系统</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总台数</td>
									<td><input type="text" class="input_large"
										id="productDbCount" />
									</td>
									<td class="lableTd t_r">品牌情况：国内品牌台数:</td>
									<td><input type="text" class="input_large"
										id="productDbBrandInternal" style="width:135px;" /> 国外品牌台数：<input
										type="text" class="input_large" id="productDbBrandForeign"
										style="width:135px;" /></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>邮件系统</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总数</td>
									<td><input type="text" class="input_large"
										id="productEmailCount" />
									</td>
									<td class="lableTd t_r">品牌数量
									<input type="button" value="增加" id="emailAdd">
									<input type="button" value="减少" id="emailReduce">
									</td>
									<td id="email">
									<div id="email_1" style="display:inline">
									品牌：<input type="text" class="input_large" id="productEmailBrand_1" style="width:80px;" /> 
									数量：<input type="text" class="input_large" id="productEmailNum_1" style="width:80px;" /> 
									</div>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>负载均衡设备</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总数</td>
									<td><input type="text" class="input_large"
										id="productLbCount" />
									</td>
									<td class="lableTd t_r">品牌数量
									<input type="button" value="增加" id="productLbAdd">
									<input type="button" value="减少" id="productLbReduce">
									</td>
									<td id="productLb">
									<div id="productLb_1" style="display:inline">
									品牌：<input type="text" class="input_large" id="productLbBrand_1" style="width:80px;" /> 
									数量：<input type="text" class="input_large" id="productLbNum_1" style="width:80px;" /> 
									</div>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>防火墙</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总数</td>
									<td><input type="text" class="input_large"
										id="productFirewallCount" />
									</td>
									<td class="lableTd t_r">品牌数量
									<input type="button" value="增加" id="productFirewallAdd">
									<input type="button" value="减少" id="productFirewallReduce">
									</td>
									<td id="productFirewall">
									<div id="productFirewall_1" style="display:inline">
									品牌：<input type="text" class="input_large" id="productFirewallBrand_1" style="width:80px;" /> 
									数量：<input type="text" class="input_large" id="productFirewallNum_1" style="width:80px;" /> 
									</div>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>入侵检测设备（入侵防御）</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总数</td>
									<td><input type="text" class="input_large"
										id="productInvadeCheckCount" />
									</td>
									<td class="lableTd t_r">品牌数量
									<input type="button" value="增加" id="productInvadeCheckAdd">
									<input type="button" value="减少" id="productInvadeCheckReduce">
									</td>
									<td id="productInvadeCheck">
									<div id="productInvadeCheck_1" style="display:inline">
									品牌：<input type="text" class="input_large" id="productInvadeCheckBrand_1" style="width:80px;" /> 
									数量：<input type="text" class="input_large" id="productInvadeCheckNum_1" style="width:80px;" /> 
									</div>
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>安全审计设备</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">总数</td>
									<td><input type="text" class="input_large"
										id="productSecurityAuditCount" />
									</td>
									<td class="lableTd t_r">品牌数量
									<input type="button" value="增加" id="productSecurityAuditAdd">
									<input type="button" value="减少" id="productSecurityAuditReduce">
									</td>
									<td id="productSecurityAudit">
									<div id="productSecurityAudit_1" style="display:inline">
									品牌：<input type="text" class="input_large" id="productSecurityAuditBrand_1" style="width:80px;" /> 
									数量：<input type="text" class="input_large" id="productSecurityAuditNum_1" style="width:80px;" /> 
									</div>
									</td>
								</tr>

							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a8">网络安全经费预算投入情况</a>
									</h5></th>
							</thead>
							<tbody id="tb8">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>经费预算</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">本年度网络安全经费预算额：</td>
									<td><input type="text" class="input_large"
										name="fundsBudget" />万元</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>经费投入</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">上一年度网络安全经费实际投入额：</td>
									<td><input type="text" class="input_large"
										name="fundsUsed" />万元</td>
								</tr>

							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a9">本年度技术检测及网络安全事件情况</a>
									</h5></th>
							</thead>
							<tbody id="tb9">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h2>技术检测情况</h2>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>渗透测试</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">进行渗透测试的系统数量：</td>
									<td><input type="text" class="input_large"
										id="checkSeepTestCount" />
									</td>
									<td class="lableTd t_r">其中，可以成功控制的系统数量：</td>
									<td><input type="text" class="input_large"
										id="checkSeepTestSuccess" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>恶意代码
											检测</h3></td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">进行过病毒木马等恶意代码检测的服务器台数：</td>
									<td><input type="text" class="input_large"
										id="checkBadcodeTestServerCount" />台</td>
									<td class="lableTd t_r">其中，存在恶意代码的服务器台数：</td>
									<td><input type="text" class="input_large"
										id="checkBadcodeTestServerFailure" />台</td>
								</tr>
								<tr>
									<td class="lableTd t_r">进行过病毒木马等恶意代码检测的终端计算机台数：</td>
									<td><input type="text" class="input_large"
										id="checkBadcodeTestTerminalCount" />台</td>
									<td class="lableTd t_r">其中，存在恶意代码的终端计算机台数：</td>
									<td><input type="text" class="input_large"
										id="checkBadcodeTestTerminalFailure" />台</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>安全漏洞检测结果</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">进行过漏洞扫描的服务器台数：</td>
									<td><input type="text" class="input_large"
										id="checkLeakTestServerCount" />台</td>
									<td class="lableTd t_r">其中，存在高风险漏洞 的服务器台数：</td>
									<td><input type="text" class="input_large"
										id="checkLeakTestServerFailure" />台</td>
								</tr>
								<tr>
									<td class="lableTd t_r">进行过漏洞扫描的终端计算机台数：</td>
									<td><input type="text" class="input_large"
										id="checkLeakTestTerminalCount" />台</td>
									<td class="lableTd t_r">其中，存在高风险漏洞的终端计算机台数：</td>
									<td><input type="text" class="input_large"
										id="checkLeakTestTerminalFailure" />台</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h2>网络安全事件情况</h2>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>门户网站受攻击情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">安全防护设备检测到的门户网站受攻击次数：</td>
									<td><input type="text" class="input_large"
										name="eventAttackNum" />次</td>
								</tr>
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>网页被篡改情况</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">门户网站网页被篡改（含内嵌恶意代码）次数：</td>
									<td><input type="text" class="input_large"
										name="eventTamperNum" />次</td>
								</tr>
							</tbody>
							<!--////////////////////////////////////////////////////////////////////////////////// -->

							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">
										<a style="cursor:hand" id="a10">信息技术外包服务机构情况（包括参与技术检测的外部专业机构）</a>
									</h5></th>
							</thead>
							<tbody id="tb10" class="tb10">
							<tr>
									<td class="lableTd t_r" style="text-decoration:inline;">
									<input type="button" value="增加" id="epibolyOrganAdd">
									<input type="button" value="减少" id="epibolyOrganReduce">
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								</tbody>
								
								<tbody id="epibolyOrgan_1" class="tb10">
								<tr>
									<td class="lableTd t_r" style="text-decoration:inline;"><h3>外包服务机构</h3>
									</td>
									<td colspan="3" class="lableTd t_r"
										style="text-decoration:inline;"></td>
								</tr>
								<tr>
									<td class="lableTd t_r">机构名称</td>
									<td><input type="text" class="input_large"
										id="epibolyOrganName_1" />
									</td>
									<td class="lableTd t_r">机构性质</td>
									<td><select class="input_large" id="epibolyOrganNature_1">
											<option value="">请选择</option>
											<option value="state">国有单位</option>
											<option value="private">民营企业</option>
											<option value="foreign">外资企业</option>
									</select></td>
								</tr>
								<tr>
									<td class="lableTd t_r">服务内容</td>
									<td><select class="input_large" id="epibolyOrganService_1">
											<option value="">请选择</option>
											<option value="integration">系统集成</option>
											<option value="maintain">系统运维</option>
											<option value="risk">风险评估</option>
											<option value="check">安全检测</option>
											<option value="fasten">安全加固</option>
											<option value="support">应急支持</option>
											<option value="store">数据存储</option>
											<option value="backup">灾难备份</option>
											<option value="other">其他</option>
									</select></td>
									<td class="lableTd t_r">服务内容_其他</td>
									<td><input type="text" class="input_large"
										id="epibolyOrganotherService_1" />
									</td>
								</tr>
								<tr>
									<td class="lableTd t_r">信息安全管理体系认证情况</td>
									<td><select class="input_large" id="epibolyOrganCe_1">
											<option value="">请选择</option>
											<option value="yes">已通过认证</option>
											<option value="no">未通过认证</option>
									</select></td>
									<td class="lableTd t_r">认证机构</td>
									<td><input type="text" class="input_large"
										id="epibolyOrganotherCeCenter_1" />
									</td>
								</tr>
								<tr>
								<td class="lableTd t_r">网络安全与保密协议</td>
									<td><select class="input_large" id="epibolyOrganProtocol_1">
											<option value="">请选择</option>
											<option value="yes">已签订</option>
											<option value="no">未签订</option>
									</select></td>
								</tr>
							</tbody>
							
						</table>
						
		<table width="100%" border="1" cellspacing="0" cellpadding="0" class="table_2" id="table_2" style="display:none">
			<thead>
              <th colspan="10" class="f1"><h5 class="fl" id="tableTitle">网络安全管理工作自评估表</h5></th>
            </thead>
            <tbody>
            <tr class="tit">
				<td class="sort" colspan="2">评估指标</td>
				<td class="sort">评价要素</td>
				<td class="sort">评价标准</td>
				<td class="sort">权重（V）</td>
				<td class="sort">指标属性</td>
				<td class="sort">量化方法（P为量化值）</td>
				<td class="sort">评估得分（V×P）</td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="3" colspan="2">网络安全组织管理</td>
				<td class="sort">网络安全主管领导</td>
				<td class="sort">明确一名主管领导负责本部门网络安全工作（主管领导应为本部门正职或副职领导）</td>
				<td class="sort">3</td>
				<td class="sort">定性</td>
				<td class="sort">已明确，本年度就网络安全工作作出批示或主持召开专题会议，P = 1；
				已明确，本年度未就网络安全工作作出批示或主持召开专题会议，P = 0.5；尚未明确，P = 0。</td>
				<td class="sort"><input type="text" name="organLeader"></td>
			</tr>
			<tr class="tit">
				<td class="sort">网络安全管理机构</td>
				<td class="sort">指定一个机构具体承担网络安全管理工作（管理机构应为本部门二级机构）。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">已指定，并以正式文件等形式明确其职责，P = 1；未指定，P = 0。</td>
				<td class="sort"><input type="text" name="organManage"></td>
			</tr>
			<tr class="tit">
				<td class="sort">网络安全员</td>
				<td class="sort">各内设机构指定一名专职或兼职网络安全员。</td>
				<td class="sort">2</td>
				<td class="sort">定量</td>
				<td class="sort">P = 指定网络安全员的内设机构数量与内设机构总数的比率。</td>
				<td class="sort"><input type="text" name="organGuard"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="16">网络安全日常管理</td>
				<td class="sort" rowspan="2">规章制度</td>
				<td class="sort">制度完整性</td>
				<td class="sort">建立网络安全管理制度体系，涵盖人员管理、资产管理、采购管理、外包管理、教育培训等方面。</td>
				<td class="sort">3</td>
				<td class="sort">定性</td>
				<td class="sort">制度完整，P = 1；制度不完整，P = 0.5；无制度，P = 0。</td>
				<td class="sort"><input type="text" name="dailyRuleIntegrity"></td>
			</tr>
			<tr class="tit">
				<td class="sort">制度发布</td>
				<td class="sort">安全管理制度以正式文件等形式发布。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyRulePublish"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="3">人员管理</td>
				<td class="sort">重点岗位人员签订安全保密协议</td>
				<td class="sort">重点岗位人员（系统管理员、网络管理员、网络安全员等）签订网络安全与保密协议。</td>
				<td class="sort">2</td>
				<td class="sort">定量</td>
				<td class="sort">P = 重点岗位人员中签订网络安全与保密协议的比率。</td>
				<td class="sort"><input type="text" name="dailyStaffKey"></td>
			</tr>
			<tr class="tit">
				<td class="sort">人员离岗离职管理措施</td>
				<td class="sort">人员离岗离职时，收回其相关权限，签署安全保密承诺书。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyStaffLeave"></td>
			</tr>
			<tr class="tit">
				<td class="sort">外部人员访问管理措施</td>
				<td class="sort">外部人员访问机房等重要区域时采取审批、人员陪同、进出记录等安全管理措施。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyStaffVisit"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="4">资产管理</td>
				<td class="sort">责任落实</td>
				<td class="sort">指定专人负责资产管理，并明确责任人职责。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyAssetDuty"></td>
			</tr>
			<tr class="tit">
				<td class="sort">建立台账</td>
				<td class="sort">建立完整资产台账，统一编号、统一标识、统一发放。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyAssetBook"></td>
			</tr>
			<tr class="tit">
				<td class="sort">账物符合度</td>
				<td class="sort">资产台账与实际设备相一致。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyAssetConform"></td>
			</tr>
			<tr class="tit">
				<td class="sort">设备维修维护和报废管理措施</td>
				<td class="sort">完整记录设备维修维护和报废信息（时间、地点、内容、责任人等）。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">记录完整，P = 1；记录基本完整，P = 0.5；记录不完整或无记录，P = 0。</td>
				<td class="sort"><input type="text" name="dailyAssetMaintain"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="4">外包管理</td>
				<td class="sort">外包服务协议</td>
				<td class="sort">与信息技术外包服务提供商签订网络安全与保密协议，或在服务合同中明确网络安全与保密责任。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyEpibolyAggrement"></td>
			</tr>
			<tr class="tit">
				<td class="sort">现场服务管理</td>
				<td class="sort">现场服务过程中安排专人管理，并记录服务过程。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">记录完整，P = 1；记录不完整，P = 0.5；无记录，P = 0。</td>
				<td class="sort"><input type="text" name="dailyEpibolyService"></td>
			</tr>
			<tr class="tit">
				<td class="sort">外包开发管理</td>
				<td class="sort">外包开发的系统、软件上线前通过信息安全测评。</td>
				<td class="sort">2</td>
				<td class="sort">定量</td>
				<td class="sort">P =外包开发的系统、软件上线前通过信息安全测评的比率。</td>
				<td class="sort"><input type="text" name="dailyEpibolyDevelop"></td>
			</tr>
			<tr class="tit">
				<td class="sort">运维服务方式</td>
				<td class="sort">原则上不得采用远程在线方式，确需采用时采取书面审批、访问控制、在线监测、日志审计等安全防护措施。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyEpibolyMaintain"></td>
			</tr>
			<tr class="tit">
				<td class="sort">经费保障</td>
				<td class="sort">经费预算</td>
				<td class="sort">将网络安全设施运维、日常管理、教育培训、检查评估等费用纳入年度预算。</td>
				<td class="sort">3</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyFundsBudget"></td>
			</tr>
			<tr class="tit">
				<td class="sort">网站内容管理</td>
				<td class="sort">网站信息发布</td>
				<td class="sort">网站信息发布前采取内容核查、审批等安全管理措施。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailySitePublish"></td>
			</tr>
			<tr class="tit">
				<td class="sort">电子信息管理</td>
				<td class="sort">介质销毁和信息消除</td>
				<td class="sort">配备必要的电子信息消除和销毁设备，对变更用途的存储介质进行信息消除，对废弃的存储介质进行销毁。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="dailyInfoDestory"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="24">信息安全防护管理</td>
				<td class="sort" rowspan="2">物理环境安全</td>
				<td class="sort">机房安全</td>
				<td class="sort">具备防盗窃、防破坏、防雷击、防火、防水、防潮、防静电及备用电力供应、温湿度控制、电磁防护等安全措施。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldPhysicalRoom"></td>
			</tr>
			<tr class="tit">
				<td class="sort">物理访问控制</td>
				<td class="sort">机房配备门禁系统或有专人值守。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldPhysicalVisit"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="4">网络边界安全</td>
				<td class="sort">访问控制</td>
				<td class="sort">网络边界部署访问控制设备，能够阻断非授权访问。</td>
				<td class="sort">3</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；有设备，但未配置策略，P = 0.5；无设备，P = 0。</td>
				<td class="sort"><input type="text" name="shieldNetVisit"></td>
			</tr>
			<tr class="tit">
				<td class="sort">入侵检测</td>
				<td class="sort">网络边界部署入侵检测设备，定期更新检测规则库。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；有设备，但未定期更新，P = 0.5；无设备，P = 0。</td>
				<td class="sort"><input type="text" name="shieldNetInvade"></td>
			</tr>
			<tr class="tit">
				<td class="sort">安全审计</td>
				<td class="sort">网络边界部署安全审计设备，对网络访问情况进行定期分析审计并记录审计情况。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；有设备，但未定期分析，P = 0.5；无设备，P = 0。</td>
				<td class="sort"><input type="text" name="shieldNetAudit"></td>
			</tr>
			<tr class="tit">
				<td class="sort">互联网接入口数量</td>
				<td class="sort">各单位同一办公区域内互联网接入口不超过2个。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldNetPoint"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="8">设备安全</td>
				<td class="sort">恶意代码防护</td>
				<td class="sort">部署防病毒网关或统一安装防病毒软件，并定期更新恶意代码库。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1； 有设备，但未定期更新，P = 0.5；无设备，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDeviceBadcode"></td>
			</tr>
			<tr class="tit">
				<td class="sort">设备漏洞扫描</td>
				<td class="sort">定期对服务器、网络设备、安全设备等进行安全漏洞扫描。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1； 不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDeviceLeak"></td>
			</tr>
			<tr class="tit">
				<td class="sort">服务器口令策略</td>
				<td class="sort">配置口令策略保证服务器口令强度和更新频率。</td>
				<td class="sort">1</td>
				<td class="sort">定量</td>
				<td class="sort">P = 配置了口令策略的服务器比率。</td>
				<td class="sort"><input type="text" name="shieldDevicePasswd"></td>
			</tr>
			<tr class="tit">
				<td class="sort">服务器安全审计</td>
				<td class="sort">启用安全审计功能并进行定期分析。</td>
				<td class="sort">1</td>
				<td class="sort">定量</td>
				<td class="sort">P = 对安全审计日志进行定期分析的服务器比率。</td>
				<td class="sort"><input type="text" name="shieldDeviceAudit"></td>
			</tr>
			<tr class="tit">
				<td class="sort">服务器补丁更新</td>
				<td class="sort">及时对服务器操作系统补丁和数据库管理系统补丁进行更新。</td>
				<td class="sort">2</td>
				<td class="sort">定量</td>
				<td class="sort">P = 补丁得到及时更新的服务器比率。</td>
				<td class="sort"><input type="text" name="shieldDevicePatch"></td>
			</tr>
			<tr class="tit">
				<td class="sort">网络设备和安全设备口令策略</td>
				<td class="sort">配置口令策略保证网络设备和安全设备口令强度和更新频率。</td>
				<td class="sort">1</td>
				<td class="sort">定量</td>
				<td class="sort">P = 网络设备和安全设备（指重要设备）中配置了口令策略的比率。</td>
				<td class="sort"><input type="text" name="shieldDeviceNetPwd"></td>
			</tr>
			<tr class="tit">
				<td class="sort">终端计算级统一防护</td>
				<td class="sort">采取集中统一管理方式对终端进行防护，统一软件下发、安装系统补丁。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDeviceProtect"></td>
			</tr>
			<tr class="tit">
				<td class="sort">终端计算机接入控制</td>
				<td class="sort">采取技术措施（如部署集中管理系统、将IP地址与MAC地址绑定等）对接入本单位网络的终端计算机进行控制。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDeviceControl"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="6">应用系统安全</td>
				<td class="sort">应用系统安全漏洞扫描</td>
				<td class="sort">定期对服务器、网络设备、安全设备等进行安全漏洞扫描。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">扫描周期小于一个月，P = 1；扫描周期为2-3个月，P=0.5；扫描周期为4-6个月，P=0.2；其他，P = 0。</td>
				<td class="sort"><input type="text" name="shieldAppLeak"></td>
			</tr>
			<tr class="tit">
				<td class="sort">门户网站防篡改措施</td>
				<td class="sort">门户网站采取网页防篡改措施。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldAppAntitamper"></td>
			</tr>
			<tr class="tit">
				<td class="sort">门户网站抗拒绝服务攻击措施</td>
				<td class="sort">门户网站采取抗拒绝服务攻击措施。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldAppAntiattack"></td>
			</tr>
			<tr class="tit">
				<td class="sort">电子邮件账号注册审批</td>
				<td class="sort">建立邮件账号开通审批程序，防止邮件账号任意注册使用。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldAppEmailRegister"></td>
			</tr>
			<tr class="tit">
				<td class="sort">电子邮箱账户口令策略</td>
				<td class="sort">配置口令策略保证电子邮箱口令强度和更新频率。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldAppEmailPasswd"></td>
			</tr>
			<tr class="tit">
				<td class="sort">邮件清理</td>
				<td class="sort">定期清理工作邮件。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldAppEmailClear"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="4">数据安全</td>
				<td class="sort">数据存储保护</td>
				<td class="sort">采取技术措施（如加密、分区存储等）对存储的重要数据进行保护。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDataStore"></td>
			</tr>
			<tr class="tit">
				<td class="sort">数据传输保护</td>
				<td class="sort">采取技术措施对传输的重要数据进行加密和校验。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDataTransfer"></td>
			</tr>
			<tr class="tit">
				<td class="sort">数据和系统备份</td>
				<td class="sort">采取技术措施对重要数据和系统进行定期备份。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDataBackup"></td>
			</tr>
			<tr class="tit">
				<td class="sort">数据中心、灾备中心设立</td>
				<td class="sort">数据中心、灾备中心应设立在境内。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="shieldDataCenter"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="3" colspan="2">网络安全应急管理</td>
				<td class="sort">应急预案</td>
				<td class="sort">制定网络安全事件应急预案（为单位级预案，非单个信息系统的安全应急预案），并使相关人员熟悉应急预案。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="emergencyPlan"></td>
			</tr>
			<tr class="tit">
				<td class="sort">应急演练</td>
				<td class="sort">开展应急演练，并留存演练计划、方案、记录、总结等文档。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="emergencyTrain"></td>
			</tr>
			<tr class="tit">
				<td class="sort">应急资源</td>
				<td class="sort">指定应急技术支援队伍，配备必要的备机、备件等应急物资。</td>
				<td class="sort">1</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="emergencyResource"></td>
			</tr>
			<tr class="tit">
				<td class="sort" colspan="2">网络安全应急管理</td>
				<td class="sort">事件处置</td>
				<td class="sort">发生网络安全事件后，及时向主管领导报告，按照预案开展处置工作；重大事件及时通报网络安全主管部门。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">发生过事件并按要求处置，或者未发生过安全事件，P = 1；发生过事件但未按要求处置，P = 0。</td>
				<td class="sort"><input type="text" name="emergencyEventHandle"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="2" colspan="2">网络安全教育培训</td>
				<td class="sort">意识教育</td>
				<td class="sort">面向全体人员开展网络安全形势与警示教育、基本技能培训等活动。</td>
				<td class="sort">3</td>
				<td class="sort">定量</td>
				<td class="sort">本年度开展活动的次数≥3，P = 1；次数=2，P = 0.7；次数=1，P = 0.3；次数=0，P = 0。</td>
				<td class="sort"><input type="text" name="educationMentality"></td>
			</tr>
			<tr class="tit">
				<td class="sort">专业培训</td>
				<td class="sort">定期开展网络安全管理人员和技术人员专业培训</td>
				<td class="sort">3</td>
				<td class="sort">定量</td>
				<td class="sort">P = 本年度网络安全管理和技术人员中参加专业培训的比率。</td>
				<td class="sort"><input type="text" name="educationTrain"></td>
			</tr>
			<tr class="tit">
				<td class="sort" rowspan="4" colspan="2">网络安全检查</td>
				<td class="sort">工作部署</td>
				<td class="sort">下发检查工作相关文件或者组织召开专题会议，对年度检查工作进行部署。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="checkWorkDeploy"></td>
			</tr>
			<tr class="tit">
				<td class="sort">工作机制</td>
				<td class="sort">明确检查工作负责人，落实检查机构和检查人员。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="checkWorkRule"></td>
			</tr>
			<tr class="tit">
				<td class="sort">技术检测</td>
				<td class="sort">使用技术手段进行安全检测。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="checkTechnicalDetecton"></td>
			</tr>
			<tr class="tit">
				<td class="sort">检查经费</td>
				<td class="sort">安排并落实检查工作经费。</td>
				<td class="sort">2</td>
				<td class="sort">定性</td>
				<td class="sort">符合，P = 1；不符合，P = 0。</td>
				<td class="sort"><input type="text" name="checkFunds"></td>
			</tr>
			</tbody>	
		</table>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="table_3" style="display:none">
			<thead>
              <th colspan="10" class="f1"><h5 class="fl" id="tableTitle">网络安全总结报告</h5></th>
            </thead>
            
            <tbody>
            	<tr><td class="lableTd t_r" id="title" colspan="2">2015年信息安全检查总结报告</td></tr>
				
				<tr><td class="lableTd t_r" colspan="2"><h4>主报告内容要求</h4></td></tr>
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">信息安全检查工作组织开展情况</td>
					<td>
						<textarea  rows="4" 
						placeholder="概述此次安全检查工作组织开展情况、所检查的重要网络与信息系统基本情况" name="lunchSituation" 
                  	 	style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea>
					</td>
				</tr>
				
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">本年度信息安全主要工作情况</td>
					<td>
						<textarea  rows="4" 
						placeholder="详细描述本单位2015年信息安全管理、技术防护、应急管理、教育培训等方面工作的开展情况" name="workSituation" 
                  	 	style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea>
					</td>
				</tr>
				
				<tr><td class="lableTd t_r" colspan="2"><h4>检查发现的主要问题和面临的威胁分析</h4></td></tr>
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">发现的主要问题和薄弱环节<br/>
						<input type="button" value="增加" id="problemAdd">
						<input type="button" value="减少" id="problemReduce">
					</td>
					<td id="problem">
						<div id="problemDiv">
						<textarea  rows="4" id="problem_1" style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea>
						</div>
					</td>
				</tr>
            	
            	<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">面临的安全威胁与风险<br/>
						<input type="button" value="增加" id="riskAdd">
						<input type="button" value="减少" id="riskReduce">
					</td>
					<td id="risk">
						<div id="riskDiv">
						<textarea  rows="4" id="risk_1" style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">整体安全状况的基本判断<br/>
						<input type="button" value="增加" id="judgeAdd">
						<input type="button" value="减少" id="judgeReduce">
					</td>
					<td id="judge">
						<div id="judgeDiv">
						<textarea  rows="4" id="judge_1" style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea>
						</div>
					</td>
				</tr>
            	
            	<tr><td class="lableTd t_r" colspan="2"><h4>整改措施与整改效果</h4></td></tr>
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">改进措施<br/>
					</td>
					<td>
						<div><textarea  rows="4" name="improveMeasure" style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea></div>
					</td>
				</tr>
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;">整体效果<br/>
					</td>
					<td>
						<div><textarea  rows="4" name="overallEffect" style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea></div>
					</td>
				</tr>
				<tr>
					<td class="lableTd t_r" style="text-decoration:inline;"><h4>关于加强信息安全工作的意见和建议</h4><br/>
					</td>
					<td>
						<div><textarea  rows="4" name="summarySuggestion" style="margin-top:0px;margin-bottom:0px;height:89px;"></textarea></div>
					</td>
				</tr>
            	
            </tbody>
		</table>

					</form>
				</div>
				<div class="fn clearfix t_c">
					<h5 class="fl">
						<a href="#" class="colSelect fl"></a>
					</h5>
					<input type="button" id="btnSubmit" value="提 交" /> &nbsp; 
					<input type="button" id="btnSave" value="保存草稿" /> &nbsp;
					<input type="button" id="btnDele" value="删除草稿" /> &nbsp; 
					<input type="button" id="btnClose" value="关 闭" />
				</div>
			</div>
			<!--Filter End-->

		</div>
	</div>
</body>
</html>
