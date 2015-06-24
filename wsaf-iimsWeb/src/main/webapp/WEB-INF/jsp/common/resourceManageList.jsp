<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

<title>网络接入申请</title>
<meta charset="utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="X-UA-Compatible" content="IE=8" />
	
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
<script src="js/resourceManager.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
						$(".closewindow").click(function() {
							$(".f_window").css("display", "none");
							$("#bt").css("display", "none");
						});
						var isleader = $.isleader("${pageContext.request.contextPath}");
						//$.getMenu("${pageContext.request.contextPath}","resourceManage");

						if (isleader == "不是领导") {
							$("#addbtn").css("display", "");
							$("#auditBtn").css("display", "none");
						} else if (isleader == "信息管理中心方政") {
							$("#addbtn").css("display", "");
						}else if (isleader=="江啸栋") {
							$("#addbtn").css("display", "");
						}else {
							$("#addbtn").css("display", "none");
						}
						var isInfoLeader = $.isInfoLeader("${pageContext.request.contextPath}");
						if(isInfoLeader==true){
							$("#virtual").attr("href","/iims/virtualResource/virtualResourceInfoLeaderList");
						}else{
							if (isleader == "不是领导") {
								$("#virtual").attr("href","/iims/virtualResource/virtualResourceApplyList");
							} else if (isleader == "信息管理中心方政") {
								$("#virtual").attr("href","/iims/virtualResource/virtualResourceInfoManageList");
							}else if (isleader=="江啸栋") {
								$("#virtual").attr("href","/iims/virtualResource/virtualResourceApplyList");
							}else {
								$("#virtual").attr("href","/iims/virtualResource/virtualResourceInnerList");
							}
						}
						$.postSearchForm("${pageContext.request.contextPath}",
								"&pageSize=16&pageNum=1", isleader);
						window.onfocus = function() {
							var _page = "1";
							if ($(".selected a").length > 0
									&& $(".selected a").text() != "")
								_page = $(".selected a").text();

							$.postSearchForm(
									"${pageContext.request.contextPath}",
									"&pageSize=16&pageNum=" + _page, isleader);
						}
						$("#searchbtn")
								.click(
										function() {
											if ($("[name=date1]").val() != ""
													&& $("[name=date2]").val() != "") {
												if ($("[name=date1]").val() > $(
														"[name=date2]").val()) {
													alert("申请使用时间的开始时间大于结束时间 错误！");
													return false;
												}
											}
											$
													.postSearchForm(
															"${pageContext.request.contextPath}",
															"&pageSize=16&pageNum=1",
															isleader);
										});

						$("#renewbtn")
								.click(
										function() {
											$(
													"#projectAppform input,#projectAppform select")
													.not("input[type=button]")
													.val("");
											$
													.postSearchForm(
															"${pageContext.request.contextPath}",
															"&pageSize=16&pageNum=1",
															isleader);
										});


						$(function() {
							$("[name=date1]").datepicker({
								dateFormat : "yy-mm-dd"
							});
							$("[name=date2]").datepicker({
								dateFormat : "yy-mm-dd"
							});
						});

						var i = 0;
						$.postResourceManageDetail = function(firUrl, id,
								isread, isPreliminaryPersonnel) {
							if (firUrl != "") {
								$
										.ajax({
											async : false,
											url : firUrl
													+ "/basicCrud/netResource/get/"
													+ id,
											type : 'post',
											success : function(data, status,
													xhr) {
												if (status == "success"
														&& data != null) {
													if (data.success == true
															&& data.result
															&& JSON
																	.stringify(data.result) != "[]") {
														var entry = data.result;
														var _str3 = "";
														$("[name=btnISPass]")
																.click(
																		function() {

																			var _str = "", _str2 = "";
																			switch ($(
																					"input[name=btnISPass]:checked")
																					.val()) {
																			case "pass":
																				_str = "通过。";
																				switch (entry.status) {
																				case "innerApproval":
																					_str2 = "提交到信息中心审核";
																					break;
																				case "infoDeptApproval":
																					_str2 = "提交至维保中心审核或自行处理";
																					break;
																				case "serviceDeptApproval":
																					_str2 = "待实施";
																					break;
																				case "waitForImplement":
																					_str2 = "处理完毕";
																					break;
																				case "selfDealWith":
																					_str2 = "处理完毕";
																					break;
																				}

																				if (entry.status == "innerApproval") {
																					// var _str3="<tr class=\"reviewPerson\"><td colspan=\"2\">审核人</td></tr><tr class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" name=\"cbReview\" value=\"G001000002232549\"/>&nbsp;黄天印</td></tr>";
																					//	_str3+="<tr  class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" value=\"G020001000492549\" name=\"cbReview\"/>&nbsp;金涛</td></tr><tr  class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td>";

																					// $("#mysug").after(_str3);

																				}

																				if (entry.status == "infoDeptApproval") {
																					i += 1;

																					if (_str3 == "") {
																						_str3 += "<tr name="+i+" class=\"reviewPerson\"><td colspan=\"2\">下一步操作</td></tr><tr  name="+i+" class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" name=\"cbReview\" value=\"serviceDeptApproval\"/>&nbsp;给维保公司处理</td></tr>";
																						_str3 += "<tr  name="+i+" class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" value=\"selfDealWith\" name=\"cbReview\"/>&nbsp;自行处理</td></tr><tr name="+i+"  class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td>";
																						$(
																								"#mysug")
																								.after(
																										_str3);
																					}
																					$(
																							"[name="
																									+ i
																									+ "]")
																							.css(
																									"display",
																									"");
																					if (i > 1) {
																						for ( var a = 2; a <= i; a++) {
																							$(
																									"[name="
																											+ i
																											+ "]")
																									.css(
																											"display",
																											"none");
																						}
																					}
																					if ($(
																							"[name=cbReview]")
																							.val() == "") {
																						alert("请选择一种操作");
																					}

																				}
																				if (entry.status == "serviceDeptApproval") {

																				}

																				$(
																						"#btnSubmit2")
																						.val(
																								"提交审核");
																				break;

																			case "notPass":
																				_str = "不通过。";
																				switch (entry.status) {

																				case "innerApproval":
																				case "infoDeptApproval":
																					_str2 = "返回申报人修改";
																					break;
																				case "serviceDeptApproval":
																					_str2 = "退回至信息中心审核";
																					break;

																				}
																				$(
																						"[name="
																								+ (i - 1)
																								+ "]")
																						.css(
																								"display",
																								"none");

																				$(
																						"#btnSubmit2")
																						.val(
																								"返回修改");
																				break;

																			}
																			$(
																					"[name=suggestion]")
																					.val(
																							_str);
																			$(
																					"#nextDo")
																					.val(
																							_str2);

																		});

														$("#btnSubmit2")
																.click(
																		function() {

																			if ($(
																					"input[name=btnISPass]:checked")
																					.val() == "pass") {
																				var otherData = "", isReviewPersonnel = $
																						.isReviewPersonnel("${pageContext.request.contextPath}");
																				var d = new Date();

																				if (entry.status == "innerApproval") {
																					otherData += "&id="
																							+ id
																							+ $
																									.getPerson("${pageContext.request.contextPath}")
																							+ "&handler=方政&handlerLoginname=G01007000383&status=infoDeptApproval";
																					otherData += "&suggestion="
																							+ $(
																									"[name=suggestion]")
																									.val();

																				} else if (entry.status == "infoDeptApproval") {
																					var caozuo = "", cbReview = $("input[name=cbReview]:checked");

																					if (cbReview.length <= 0) {
																						alert("至少选择一个操作");
																						return false;
																					}
																					switch (cbReview
																							.val()) {
																					case "serviceDeptApproval":
																						caozuo = "待维保公司审核";
																						break;
																					case "selfDealWith":
																						caozuo = "自行处理";
																						break;
																					}

																					if (cbReview
																							.val() == "serviceDeptApproval") {
																						otherData += "&id="
																								+ id
																								+ "&initiator=方政&initiatorLoginname=G010070003832549&handler=&handlerLoginname=&status=serviceDeptApproval";
																						otherData += "&suggestion="
																								+ $(
																										"[name=suggestion]")
																										.val()
																								+ "&initiateTime="
																								+ d
																										.getTime();
																					} else {
																						otherData += "&id="
																								+ id
																								+ "&initiator=方政&initiatorLoginname=G010070003832549&handler=方政&handlerLoginname=G010070003832549&status=selfDealWith";
																						otherData += "&suggestion="
																								+ $(
																										"[name=suggestion]")
																										.val()
																								+ "&initiateTime="
																								+ d
																										.getTime();
																					}
																				} else if (entry.status == "serviceDeptApproval") {
																					otherData += "&id="
																							+ id
																							+ $
																									.getPerson("${pageContext.request.contextPath}")
																							+ "&handler=&handlerLoginname=&status=waitForImplement";
																					otherData += "&suggestion="
																							+ $(
																									"[name=suggestion]")
																									.val()
																							+ "&initiateTime="
																							+ d
																									.getTime();
																				} else if (entry.status == "selfDealWith") {

																					otherData += "&id="
																							+ id
																							+ "&initiator=方政&initiatorLoginname=G010070003832549&handler=&handlerLoginname=&status=finish";
																					otherData += "&suggestion="
																							+ $(
																									"[name=suggestion]")
																									.val()
																							+ "&initiateTime="
																							+ d
																									.getTime();
																				}

																				else if (entry.status == "waitForImplement") {
																					otherData += "&id="
																							+ id
																							+ $
																									.getPerson("${pageContext.request.contextPath}")
																							+ "&handler=&handlerLoginname=&status=finish";
																					otherData += "&suggestion="
																							+ $(
																									"[name=suggestion]")
																									.val()
																							+ "&initiateTime="
																							+ d
																									.getTime();
																				}

																				if ($(
																						"[name=suggestion]")
																						.val().length > 50) {
																					alert("输入意见超过50个字");
																					return false;
																				}
																				$(
																						this)
																						.attr(
																								"disabled",
																								true);
																				//alert(otherData);
																				$.postsave2(firUrl,"projectPlanForm",otherData);
																				//var d = new Date($("[name=applyTime]").val());
																				//$.postsave(firUrl,"projectPlanForm",otherData+"&applyTime="+d.getTime()+"&suggestion="+$("[name=suggestion]").val());

																			} else if ($(
																					"input[name=btnISPass]:checked")
																					.val() == "notPass") {
																				var otherData = "", isleader = $
																						.isleader("${pageContext.request.contextPath}");
																				var d = new Date();

																				if (isleader == "本部门领导") {
																					var data = $
																							.getPerson(firUrl);
																					otherData += data
																							+ "&handler=胡波&handlerLoginname=G002000000332549&status=innerTurnBack";
																				} else if (isleader == "信息管理中心方政") {
																					otherData += "&initiator=方政&initiatorLoginname=G010070003832549&handler=胡波&handlerLoginname=G002000000332549&status=turnBack";
																				} else if (isleader == "维保部门") {
																					otherData += $
																							.getPerson("${pageContext.request.contextPath}")
																							+ "&handler=胡波&handlerLoginname=G002000000332549&status=serviceDeptBack";
																				}

																				if (id != null) {
																					otherData += "&id="
																							+ id
																							+ "&suggestion="
																							+ $(
																									"[name=suggestion]")
																									.val()
																							+ "&initiateTime="
																							+ d
																									.getTime();
																				}
																				if ($(
																						"[name=suggestion]")
																						.val().length > 50
																						|| $(
																								"[name=suggestion]")
																								.val().length < 5) {
																					alert("输入意见5~50个字");
																					return false;
																				}
																				$(
																						this)
																						.attr(
																								"disabled",
																								true);
																				//alert(otherData);
																				$.postsave2(firUrl,"projectPlanForm",otherData);

																			}

																			else {
																				alert("请选择是否通过");
																			}
																		});

													}
												}
											}
										});
							}
						};

						$("#auditBtn")
								.click(
										function() {
											
											var id = "";var a = document.getElementsByName("checkbox");
											for ( var i = 0; i < a.length; i++) {
												if (a[i].checked) {
													id = a[i].value;
													if ($("#" + id).text() == "待内部审核"&& isleader == "本部门领导") {
														$("[name=suggestion]").val("");
														$("#bt").height($(document).height());
														$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/ 2+ $(document).scrollTop());
														$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth()) / 2);
														$(".f_window").css("display","block");
														$("#bt").css("display","block");
														var isPreliminaryPersonnel = $.isPreliminaryPersonnel("${pageContext.request.contextPath}");
														$.postResourceManageDetail("${pageContext.request.contextPath}",id,true,isPreliminaryPersonnel);
													}
													if ($("#" + id).text() == "待信息中心审核"&& isleader == "信息管理中心方政") {
														$("[name=suggestion]").val("");$("#bt").height($(document).height());
														$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/ 2+ $(document).scrollTop());
														$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth()) / 2);
														$(".f_window").css("display","block");
														$("#bt").css("display","block");
														var isPreliminaryPersonnel = $.isPreliminaryPersonnel("${pageContext.request.contextPath}");
														$.postResourceManageDetail("${pageContext.request.contextPath}",id,true,isPreliminaryPersonnel);
													}
													if ($("#" + id).text() == "待维保公司审核"&& isleader == "江啸栋") {
														$("[name=suggestion]").val("");
														$("#bt").height($(document).height());
														$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/ 2+ $(document).scrollTop());
														$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth()) / 2);
														$(".f_window").css("display","block");
														$("#bt").css("display","block");
														var isPreliminaryPersonnel = $.isPreliminaryPersonnel("${pageContext.request.contextPath}");
														$.postResourceManageDetail("${pageContext.request.contextPath}",id,true,isPreliminaryPersonnel);
													}
												}
											}
										});

					});
	function add() {
		window.open("/iims/netResource/resourceManageAdd");
	}
	function checkAll($obj) {
		var elms = document.getElementsByName("checkbox");
		for ( var i = 0; i < elms.length; i++) {
			elms[i].checked = $obj.checked;
		}
	}
</script>

</head>

<body class="Flow">
	<div id="bt" class="transparent" style="display:none"></div>
	<div class="f_window" style="display:none">
		<h3 class="clearfix mb10">
			<span class="fl">业务办理</span>
			<div class="fr close">
				<a class="closewindow">关闭窗口</a>
			</div>
		</h3>
		<div class="con">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="td_1" colspan="2">业务栏</td>
				</tr>
				<tr>
					<td class="td_1">&nbsp;</td>
					<td><div class="red">*</div>审核意见：<input readonly
						name="btnISPass" type="radio" value="pass"
						style="margin-left:20px">通过<input readonly
						name="btnISPass" type="radio" value="notPass"
						style="margin-left:10px">不通过</td>
				</tr>
				<tr>
					<td class="td_1">&nbsp;</td>
					<td><div class="red">*</div>意见</td>
				</tr>
				<tr id="mysug">
					<td class="td_1">&nbsp;</td>
					<td><textarea name="suggestion" rows="4" placeholder="请输入意见"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_1" colspan="2">操作栏</td>
				</tr>
				<tr>
					<td class="td_1">&nbsp;</td>
					<td><textarea rows="2" id="nextDo" disabled></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="button t_c">
			<input readonly type="button" id="btnSubmit2" value="提交审核" />
		</div>
	</div>

	<div class="main">

		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="收起">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li><a>首页</a>
					</li>
					<li><a>资源管理</a>
					</li>
					<li><a>资源申报</a>
					</li>
					<li class="fin">日常资源申请</li>
				</ul>
			</div>
		</div>
		<div class="pt45">


			<div class="tabs_2">
				<ul>
					<li class="selected"><a><span>网络接入</span>
					</a>
					</li>
					<li><a href="/iims/accountResource/systemAccountList"><span>系统账户申请</span>
					</a>
					</li>
					<li><a href="/iims/vpnResource/vpnList"><span>VPN访问</span>
					</a>
					</li>
					<li><a href="/iims/wirelessResource/wirelessNetList"><span>无线网络</span>
					</a>
					</li>
					<li><a href="/iims/internetResource/internetAccessList"><span>特定互联网访问</span>
					</a>
					</li>
					<li><a id="virtual"><span>虚拟化资源</span></a></li>
				</ul>
			</div>


			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<form id="projectAppform">
							<table class="nwarp" width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td class="t_r">使用人姓名</td>
									<td><input type="text" id="lreportUnit"
										class="input_large" name="userName" />
									</td>

									

									<td class="t_r">申请状态</td>
									<td><select name="status" class="input_large">
											<option value="">请选择</option>
											<option value="draft">草稿</option>
											<option value="innerApproval">待内部审核</option>
											<option value="infoDeptApproval">待信息中心审核</option>
											<option value="innerTurnBack">内部领导退回</option>
											<option value="turnBack">信息中心领导退回</option>
											<option value="serviceDeptApproval">待维保公司审核</option>
											<option value="serviceDeptBack">维保公司退回</option>
											<option value="waitForImplement">待实施</option>
											<option value="selfDealWith">自行处理</option>
											<option value="finish">处理完毕</option>
									</select>
									</td>

									<td class="t_r">申请使用时间</td>
									<td><input type="text" id="date1" name="date1" /> 至 <input
										type="text" id="date2" name="date2" />
									</td>
								</tr>
								<tr>
									<td class="t_r">位置</td>
									<td><input type="text" id="lreportUnit"
										class="input_large" name="usePlace" />
									</td>
								</tr>

								<tr>
									<td colspan="10" class="t_c"><input type="button"
										id="searchbtn" value="搜 索" />&nbsp;<input type="button"
										id="renewbtn" value="重 置" />
								</tr>
							</table>
						</form>
					</div>
				</div>

				<div class="fn clearfix">
					<!--xinxi-->
					<div class="fr">
					<input type="button" id="auditBtn" value="批 量 审 核"  style="margin:0 15px"> &nbsp; 
					<input type="button" id="oututBtn" value="导 出"  style="margin:0 15px"> &nbsp;
					<input type="button" id="addbtn" value="新 增" onclick="add();"  style="margin:0 15px">
					</div>
				</div>
			</div>
			<!--Filter End-->
			<!--Table-->
			<div class="mb10">
				<table width="100%" class="table_1">
					<tbody id="tbody">
						<tr class="tit">
							<td class=" t_c"><input type="checkbox" id="checkboxAll"
								name="checkboxAll" onClick="checkAll(this)" />
							</td>
							<td class="sort"><a><span class="fl">序号</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">使用人姓名</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">申请部门</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">业务类型</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">申请状态</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">位置</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">申请使用时间</span>
							</a>
							</td>
							<td class="sort"><a><span class="fl">操作</span>
							</a>
							</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
					<tr class="tfoot">
						<td colspan="10">
							<div class="clearfix">
								<span class="fl">当前无记录显示</span>
								<ul id="page" class="fr clearfix pager">
									<li>Pages:1/1 <input type="number" id="number"
										name="number" min="0" max="999" step="1" class="input_tiny" />
										<input type="submit" name="button" id="button" value="Go">
									</li>
									<li><a>&gt;&gt;</a>
									</li>

									<li class="selected"><a>1</a>
									</li>
									<li><a>&lt;&lt;</a>
									</li>
								</ul>
							</div></td>
					</tr>
				</table>
			</div>
			<!--Table End-->
		</div>
	</div>
</body>
</html>
