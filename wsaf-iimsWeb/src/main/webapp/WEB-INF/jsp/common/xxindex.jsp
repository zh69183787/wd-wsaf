<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<base href="<%=basePath%>">
<head>
<meta charset="utf-8" />
<title>信息管理首页</title>
<link type="text/css" rel="stylesheet" href="css/formalize.css" />
<link type="text/css" rel="stylesheet" href="css/page.css" />
<link type="text/css" rel="stylesheet" href="css/default/imgs.css" />
<link type="text/css" rel="stylesheet" href="css/reset.css" />
<link type="text/css" rel="stylesheet" href="css/jquery.marquee.min.css" />
<link type="text/css" rel="stylesheet" href="css/flick/jquery-ui-1.8.18.custom.css" />
<link type="text/css" rel="stylesheet" href="css/mopTip-2.2.css" />
<link type="text/css" rel="stylesheet" href="css/common.css" />
  
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/jquery.formalize.js"></script>
<script type="text/javascript" src="js/jquery.pngFix-1.2.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/xxgl_ajax.js"></script>
<script type="text/javascript">
	$(function() {
		var t;

		var tbttId = "1970";//头版头条   
		var dtgzId = "1971";//动态工作
		var aqdtId = "1958";//安全动态
		var zcfgId = "1960";//政策法规
		var qybzId = "1959";//企业标准
		var xxghId = "1956";//信息规划

		var jeecmsUrl = "http://10.1.48.20/jeecms";

		getXWTTPicNews(jeecmsUrl, dtgzId);
		getHeadNews(tbttId);
		getXXGLNews(dtgzId);
		getLatestNews(aqdtId, "0");
		getLatestNews(zcfgId, "1");
		getLatestNews(qybzId, "2");
		getLatestNews(xxghId, "3");
		$(".tabs_3 li").click(
				function() {
					$(this).parent("ul").find("li").attr("class", "");
					$(this).attr("class", "selected");

					$(this).parents("div.tabs_3").next("div.con").find(
							".reportDiv").hide();

					$(this).parents("div.tabs_3").next("div.con").find(
							"#list_" + $(this).prop("id")).show();
				});

		$("#newsCenter").width($(".news").width() - $("#play").width() - 40);

		$(window).resize(
				function() {
					$("#newsCenter").width(
							$(".news").width() - $("#play").width() - 40);
							
							
					$("div.right_main .containerChart").each(function(){

						$(this).width($("div.right_main").width()*0.3);
					});

					
				});

		//loadShow();
		t = setInterval("showAuto()", 6000);

		

		$(".next a").click(
				function() {
					$(this).parent().prev("ul").children(".reportLi").hide();
					for ( var i = cur; i < cur + page; i++) {
						//alert(i);
						$(this).parent().prev("ul").children(".reportLi").eq(
								i + 1).show();
					}
					//$(this).parent().parent().children(".reportLi").eq(cur+1).click();

					if (cur + page == len - 1) {
						$(this).parent().hide();
					} else {
						$(".pre").show();
					}

					cur++;

				});

		$(".pre a").click(
				function() {
					$(this).parent().next("ul").children(".reportLi").hide();
					for ( var i = cur; i < cur + page; i++) {
						$(this).parent().next("ul").children(".reportLi").eq(
								i - 1).show();
					}
					//$(this).parent().parent().children(".reportLi").eq(cur).click();	

					if (cur - 1 == 0) {
						$(this).parent().hide();
					} else {
						$(".next").show();
					}

					cur--;
				});

		$(".pre").hide();
		$(".next a").parent().prev("ul").children(".reportLi:gt(1)").hide();

		$("#play_list").hover(function() {
			clearInterval(t);
		}, function() {
			t = setInterval("showAuto()", 6000);
		});

		$("#play_text li").live("click", function() {
			var pos = $(this).html();
			$("#play_list li").hide();
			$("#play_info li").hide();
			$("#play_text li").removeClass("current");
			$("#play_list li").eq(pos - 1).show();
			$("#play_info li").eq(pos - 1).show();
			$(this).addClass("current");
		});

		// Build the chart
		getData();
		//span
		getSpanData();
		//走马灯
		zoumadeng();
	});
</script>

<style type="text/css">
aside .con p {
	line-height: 20px;
	text-indent: 0px;
	height: 20px;
	overflow: hidden;
	padding: 0px;
	font-size: 12px;
}

.gray_border {
	border-bottom: #d4d2cd 1px solid;
	border-right: #d4d2cd 1px solid;
}

.block {
	background-color: #efeeee;
	border: #fbfaf8 1px solid;
	/*background-image: url(../../css/default/images/panel_8.png);*/
}

.categories a {
	background-image: url(css/default/images/panel_8.png);
	background-position: right -995px;
	padding-right: 12px;
	margin-bottom: 3px;
	margin-right: 12px;
	background-repeat: no-repeat;
}

.lh {
	line-height: 25px;
}

.h125 {
	height: 146px;
}

.mf25 {
	margin-left: 25px;
}

.panel_3 .con li {
	padding-left: 12px;
	line-height: 24px;
	width: 100%;
	float: left;
	margin-left: 10px;
	display: inline;
}

aside ul.xx li {
	width: 64px;
	padding: 0 1px;
	height: 80px;
	float: left;
	display: inline-block;
	text-align: center;
	font-size: 11px;
	line-height: 16px;
}

.panel_3 .con li a {
	width: 65%;
	float: left;
}
.tabs_3 li a {
	padding-right: 23px;
	
}
</style>
</head>

<body>
	<div class="main mw1070"  style="min-width:1300px;">
		<!--Ctrl-->
		<div class="ctrl clearfix">
			<div class="fl">
				<img id="show" onclick="showHide();"
					src="css/default/images/sideBar_arrow_right.jpg" width="46"
					height="30" alt="展开">
			</div>
			<div class="posi fl">
				<ul>
					<li><a
						href="javascript:window.location.href='/iims/jeecms/xxindex'">信息管理</a>
					</li>
					<li class="fin">首页</li>
				</ul>
			</div>
			<div style="display:none;" class="fr lit_nav nwarp">
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
		<div class="clearfix pt45">
			<div class="right_main mb10" >
				<!--News-->
				<div class="news clearfix">
					<div class="news_r">
						<div class="news_l">
							<!--focusPic-->
							<div class="focusPic fl" id="play">
								<ul class="fp_list" id="play_list">
								</ul>
								<ul class="word" id="play_info">
								</ul>
								<ul class="scrollnav" id="play_text">
								</ul>
							</div>
							<!--focusPic End-->
							<!--Txt News-->
							<div class="fl" id="newsCenter">
								<hgroup class="clearfix mb10">
									<h2 class="fl">信息管理</h2>
									<h6 class="fl">News</h6>

									<p class="t_r">
										<a href="#" target="_self" class="more_2">更多</a>
									</p>
								</hgroup>
								<section>
									<a href="#" target="_blank">
										<h5></h5>

										<p></p> </a>
								</section>
								<ul class="txt_list">
									<li><a href="#"></a><span></span>
									</li>

								</ul>
							</div>
							<!--Txt News End-->
						</div>
					</div>
				</div>
				<!--News End-->
			</div>
			<!--Aside-->
			<aside>
				<div class="panel_1">
					<div class="bg_2">
						<div class="bg_3">
							<hgroup>
								<h3>信息化业务办理</h3>
								<a
									href="http://10.1.44.18/software/iims.doc"
									target="_blank" class="more_1">帮助</a>
							</hgroup>
							<div class="con">
								<ul class="xx clearfix mb10">
									<li style="margin-bottom:18px;"><a
										href="/iims/netResource/resourceManageList"
										target="_blank">
											<dl>
												<dt class="d4"></dt>
												<dd>
													信息化<br>资源申请
												</dd>
											</dl> </a>
									</li>

									<li style="margin-bottom:18px;"><a
										href="/iims/securityLevel/securityLevelAdd"
										target="_blank">
											<dl>
												<dt class="d5"></dt>
												<dd>
													等级保护<br>定级申报
												</dd>
											</dl> </a>
									</li>

									<li style="margin-bottom:18px;"><a
										href="http://10.1.44.18/software/stpt_approval.xls"
										target="_blank">
											<dl>
												<dt class="d1"></dt>
												<dd>
													协同后台<br>修改申请
												</dd>
											</dl> </a>
									</li>

									<li style="margin-bottom:18px;"><a
										href="http://10.1.44.18/software/citrix.html" target="_blank">
											<dl>
												<dt
													style="background-image:url('css/default/images/citrix.png')"></dt>
												<dd>
													移动办公<br>应用申请
												</dd>
											</dl> </a>
									</li>

									<li style="margin-bottom:18px;"><a
										href="/iims/projectPlan/projectApplicationEdit"
										target="_blank">
											<dl>
												<dt class="d6"></dt>
												<dd>
													信息化<br>项目申报
												</dd>
											</dl> </a>
									</li>

									<li style="margin-bottom:18px;"><a
										href="http://10.1.44.18/downloadFile.action?fileId=5289536"
										target="_blank">
											<dl>
												<dt class="d8"></dt>
												<dd>
													信息化<br>支出报备
												</dd>
											</dl> </a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</aside>
			<!--Aside End-->
			<div class="clear"></div>
			<div class="clear"></div>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">

				<tr>
					<td colspan="2">
						<table width="100%">
							<tr>
								<td colspan="2">

									<div class="panel_3 mb10" style="margin-left: 10px; ">

										<table width="100%" class="p0">
											<tbody>
												<tr>
													<td>
														<div class="gray_border">
															<div class="block h125" style="height:25px;">
																<div>
																	<div class="mr5">
																		<div class="lh">
																			<ul id="marquee" class="marquee">
																				<li></li>
																			</ul>

																		</div>
																	</div>
																</div>
															</div>
														</div></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="clearfix ">
										<div class="right_main mb10">

											<!--News-->
											<div class="panel_4 panel_8 mb10">
												<header>
													<div class="tit">
														<div class="bg clearfix">
															<h5 class="fl stats">信息安全</h5>
														</div>
													</div>
												</header>
												<div class="con clearfix">
													<!--4panles-->
													<table style="width:100%;" class="p0">
														<tr>
															<td width="33%">
																<div class="gray_border" >
																	<div class="block" >
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">安全计划目标</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor h125" style="height: 209px">
																					<div id="container" class="containerChart"
																						style="width:100%;height: 209px;max-width: 600px; margin: 0 auto"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div></td>
															<td width="33%">
																<div class="gray_border" width="33%">
																	<div class="block" width="33%">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">风险防控管理</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor h125" style="height: 209px">
																					<div id="container2" class="containerChart"
																						style="width:100%;height: 209px;max-width: 600px; margin: 0 auto"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div></td>
															<td width="33%">
																<div class="gray_border" width="33%">
																	<div class="block" width="33%">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">安全事件管理</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor h125" style="height: 209px">
																					<div id="container3" class="containerChart"
																						style="width:100%;height: 209px;max-width: 600px; margin: 0 auto"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div></td>
														</tr>
													</table>
													<!--4panles end-->
												</div>
											</div>
											<div class="panel_4 panel_8 mb10">
												<header>
													<div class="tit">
														<div class="bg clearfix">
															<h5 class="fl stats">信息化项目</h5>
														</div>
													</div>
												</header>
												<div class="con clearfix">
													<!--4panles-->
													<table width="100%" class="p0">
														<tr>
															<td width="60%" style="height:200px;"><div
																	class="gray_border" style="height:200px;">
																	<div class="block" style="height:200px;">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">项目计划指标</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor fl  mr8 w45p h125"
																					style="width:330px; height:175px">
																					<div id="container4"
																						style="width: 100%; height: 100%; max-width: 600px; margin: 0 auto"></div>
																				</div>
																				<div class="fl clearfix lh">
																					<span class="fl mr8">前期策划完成/计划</span> <span
																						class="fr">个</span> <span class="fr mr8" id="qqch"></span>
																					<div class="clear"></div>
																					<span class="fl mr8">签订立项完成/计划</span> <span
																						class="fr">个</span> <span class="fr mr8" id="lx"></span>
																					<div class="clear"></div>
																					<span class="fl mr8">签订合同完成/计划</span> <span
																						class="fr">个</span> <span class="fr mr8" id="ht"></span>
																					<div class="clear"></div>
																					<span class="fl mr8">项目初验(阶段实施)完成/计划</span> <span
																						class="fr">个</span> <span class="fr mr8" id="cy"></span>
																					<div class="clear"></div>
																					<span class="fl mr8">项目验收完成/计划</span> <span
																						class="fr">个</span> <span class="fr mr8" id="ys">6/6</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
															<td style="height:200px;"><div class="gray_border"
																	style="height:200px;">
																	<div class="block" style="height:200px;">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">项目动态</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor fl  mr8 w45p h125"
																					style="width:240px; height:175px">
																					<div id="container5"
																						style="width: 100%; height: 100%; max-width: 600px; margin: 0 auto"></div>
																				</div>
																				<div class="fl clearfix lh">
																					<span class="fl mr8">年度计划</span> <span class="fr">个</span>
																					<span class="fr mr8" id="ndjh"></span>
																					<div class="clear"></div>
																					<span class="fl mr8">正常开展项目</span> <span class="fr">个</span>
																					<span class="fr mr8" id="zckz"></span>
																					<div class="clear"></div>
																					<span class="fl mr8">项目严重延迟</span> <span class="fr">个</span>
																					<span class="fr mr8" id="xmyz"></span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
														</tr>
													</table>
													<!--4panles end-->
												</div>
											</div>
											<div class="panel_4 panel_8 mb10">
												<header>
													<div class="tit">
														<div class="bg clearfix">
															<h5 class="fl stats">资源管理及运维质量</h5>
														</div>
													</div>
												</header>
												<div class="con clearfix">
													<!--4panles-->
													<table width="100%" class="p0">
														<tr>
															<td style="width:320px;height:170px;"><div class="gray_border">
																	<div class="block">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">集团本部网络运行状态</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor h125">
<!--																					<img src="css/default/images/d.jpg" width="311"-->
<!--																						height="148" />-->
																					<div id="container8" class="containerChart" onclick="window.open('http://10.1.14.29/BTIM/login.aspx?nms=Local&user=chenying&pwd=2wsx3edc')">
																						<img src="css/default/images/d.jpg" style="width:300px;height:145px;" />
<!--																							<iframe style="width:300px;height:145px;"  
																							src="http://10.1.14.29/BTIM/login.aspx?nms=Local&user=chenying&pwd=2wsx3edc"  
																							frameborder="no" border="0" framespacing="0"  scrolling="No" noresize="noresize"></iframe>-->
																					</div>
																				
																					
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
															<td width="33%"><div class="gray_border">
																	<div class="block">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">资源申请及办理情况</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor h125">
																					<div id="container6" class="containerChart"
																						style="width: 100%; height: 100%; max-width: 600px; margin: 0 auto"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
															<td><div class="gray_border">
																	<div class="block">
																		<div>
																			<div class="categories t_r mr5">
																				<a href="javascript:void(0);">运维情况</a>
																			</div>
																			<div class="clear"></div>
																			<div class="mr5 clearfix">
																				<div class="bor h125">
																					<div id="container7" class="containerChart"
																						style="width: 100%; height: 100%; max-width: 600px; margin: 0 auto"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
														</tr>
													</table>
													<!--4panles end-->
												</div>
											</div>
											<!--News End-->
										</div>
										<aside>
											<div class="panel_3" style="height:275px">
												<div class="bg_2">
													<div class="bg_3">
														<hgroup>
															<h5>安全动态</h5>
															<a style="display:none" href="#" class="more_1">更 多</a>
														</hgroup>
														<div class="con">
															<div class="reportDiv clearfix" id="1">
																<ul class="columns clearfix mb10">

																</ul>
																<p class="fr"></p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="panel_3" style="margin-top:10px; height:470px">
												<div class="bg_2">
													<div class="bg_3">
														<hgroup>
															<h5>信息化法规与标准</h5>
															<a style="display:none" href="#" class="more_1">更 多</a>
														</hgroup>
														<div class="tabs_3">
															<ul>
																<li class="selected" id="x"><a>政策法规</a></li>
																<li id="y"><a>企业标准</a>
																</li>
																<li id="z"><a>信息规划</a>
																</li>
															</ul>
														</div>
														<div class="con">
															<div class="reportDiv clearfix" id="list_x">
																<ul class="columns clearfix mb10">

																</ul>
																<p class="fr"></p>
															</div>
															<div class="reportDiv clearfix" id="list_y"
																style="display:none">
																<ul class="columns clearfix mb10">

																</ul>
																<p class="fr"></p>

															</div>
															<div class="reportDiv clearfix" id="list_z"
																style="display:none">
																<ul class="columns clearfix mb10">

																</ul>
																<p class="fr"></p>

															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="mb10 clearfix mr8"></div>
										</aside>


										<!--Aside-->

										<!--Aside End-->
									</div> <!--111111 --></td>
							</tr>

						</table></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="exceptionInfo" style="display:none;">
		<div id="workSecludeException"></div>
		<div id="planException"></div>
		<div id="periodException"></div>
		<div id="inPlanNotEndException"></div>
		<div id="inspectHistory"></div>
		<div id="riskHistory"></div>
		<div id="riskIncrease"></div>
		<div id="inspectIncrease"></div>
		<div id="eventException"></div>
	</div>
</body>
</html>
