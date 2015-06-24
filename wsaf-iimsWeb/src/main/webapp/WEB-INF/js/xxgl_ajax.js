//	//显示头版头条新闻图片
var portalUrl = "http://10.1.48.30/portal";

function setShortTitle(shortTitle, title) {
	var val;
	if (shortTitle != null) {
		val = title;
	} else {
		val = shortTitle;
	}
	return val;
}

// head cms
// 头条新闻
function getHeadNews(channelID) {
	$.ajax({
		async : false,
		dataType : 'json',
		url : "/iims/jeecms/getJeecmsInfo?random=" + Math.random(),
		type : 'post',
		data : {
			method : "JEECMS.GET_CONTENT_LIST",
			channelId : channelID,
			hasTitleImg : "0,1",
			typeId : '1,2,3,4',
			rownum : '1'
		},
		success : function(data, status, xhr) {
			if (data != null && data != "undefined") {
				var obj = eval('(' + data + ')');
				$("#newsCenter hgroup a").attr(
						"href",
						portalUrl + "/jeecms/findByPage.action?channelId="
								+ channelID);

				$("#newsCenter section a").attr(
						"href",
						portalUrl + "/jeecms/contentDetail.jsp?content="
								+ obj.params.param.contentId);

				$("#newsCenter section a h5").html(obj.params.param.title);

				if (obj.params.param.description != null) {
					$("#newsCenter section a p").html(
							obj.params.param.description);
					$("#newsCenter section a").attr("title",
							obj.params.param.description);
				}
			}
		},
		error : function() {
			alert("系统连接失败，请稍后再试！");
		}

	});
}

// xxgl cms
function getXXGLNews(channelID) {
	$.ajax({
		url : '/iims/jeecms/getJeecmsInfo?random=' + Math.random(),
		type : "post",
		dataType : 'json',
		cache : false,
		data : {
			method : "JEECMS.GET_CONTENT_LIST",
			channelId : channelID,
			hasTitleImg : "0,1",
			typeId : '1,2,3,4',
			rownum : '6'
		},
		error : function() {
			alert("系统连接失败，请稍后再试！");
		},
		success : function(data, status, xhr) {
			if (data != null && data != "undefined") {
				var newsLi = "";
				var obj = eval('(' + data + ')');
				$.each(obj.params, function(entryIndex, entry) {
					newsLi += "<li><a target='_blank' ";
					newsLi += "title='"
							+ setShortTitle(entry.shortTitle, entry.title)
							+ "'";
					newsLi += "href='" + portalUrl
							+ "/jeecms/contentDetail.jsp?content="
							+ entry.contentId + "'>" + entry.title + "</a>";
					newsLi += "<span>" + entry.releaseDate + "</span></li>";
				});

				$("#newsCenter ul").html(newsLi);
			}
		}
	});
}

function getXWTTPicNews(cmsUrl, channelID) {
	$.ajax({
		url : '/iims/jeecms/getJeecmsInfo?random=' + Math.random(),
		type : 'post',
		dataType : 'json',
		cache : false,
		data : {
			method : 'JEECMS.GET_CONTENT_LIST',
			channelId : channelID,
			hasTitleImg : 1,
			typeId : 2,
			rownum : 5
		},
		error : function() {
			alert("系统连接失败，请稍后再试!");
		},
		success : function(data, status, xhr) {
			var playList = "";
			var playText = "";
			var playInfo = "";

			if (data != null && data != "undefined") {
				var obj = eval('(' + data + ')');
				$.each(obj.params, function(entryIndex, entry) {
					playList += "<li><a target='_blank' title='"
							+ setShortTitle(entry.shortTitle, entry.title)
							+ "' href='" + portalUrl
							+ "/jeecms/contentDetail.jsp?content="
							+ entry.contentId + "'>" + "<img src='" + cmsUrl
							+ entry.titleImg.replace("/jeecms/u/", "/u/")
							+ "' title='" + entry.title + "'></img></a></li>";
					playInfo += "<li><a target='_blank' title='"
							+ setShortTitle(entry.shortTitle, entry.title)
							+ "' href='" + portalUrl
							+ "/jeecms/contentDetail.jsp?content="
							+ entry.contentId + "'>" + entry.title
							+ "</a></li>";

					playText += "<li>" + (entryIndex + 1) + "</li>";
				});
				$("#play_list").html(playList);
				$("#play_info").html(playInfo);
				$("#play_text").html(playText);
				$("#play_list li").hide();
				$("#play_info li").hide();
				$("#play_list li").eq(0).show();
				$("#play_info li").eq(0).show();
				$("#play_text li").eq(0).addClass("current");
			}
		}
	});
}

// cms
function getLatestNews(channelID, pos) {
	$
			.ajax({
				url : "/iims/jeecms/getJeecmsInfo?random=" + Math.random(),
				type : "post",
				dataType : 'json',
				cache : false,
				data : {
					method : "JEECMS.GET_CONTENT_LIST",
					channelId : channelID,
					hasTitleImg : "0,1",
					typeId : '1,2,3,4',
					rownum : '6'
				},
				error : function() {
					alert("系统连接失败，请稍后再试！");
				},
				success : function(data, status, xhr) {

					var newsLi = "";
					var newsP = "";

					if (data != null && data != "undefined") {
						var obj = eval('(' + data + ')');
						$
								.each(
										obj.params,
										function(entryIndex, entry) {
											newsLi += "<li class='clearfix'><a target='_blank' title='"
													+ setShortTitle(
															entry.shortTitle,
															entry.title) + "'";
											newsLi += " href='"
													+ portalUrl
													+ "/jeecms/contentDetail.jsp?content="
													+ entry.contentId + "'>"
													+ entry.title
													+ "</a><span>"
													+ entry.releaseDate
													+ "</span></li>";
											newsP = portalUrl
													+ "/jeecms/findByPage.action?channelId="
													+ entry.channelId;
										});

						$(".reportDiv:eq(" + pos + ") ul").html(newsLi);
						$(".reportDiv:eq(" + pos + ") p").html(
								"<a target='_self' class='more_3' href='"
										+ newsP + "'>更多</a>");

						if (obj.params == "[]") {
							$(".reportDiv:eq(" + pos + ") ul").html(
									"&nbsp;&nbsp;无相关信息。");
							$(".reportDiv:eq(" + pos + ") p a").hide();
						}
					}

				}
			});
}

function showAuto() { // 自动显示
	var listTmp = $("#play_list li").filter(function() {
		return $(this).css("display") != "none";
	});
	var infoTmp = $("#play_info li").filter(function() {
		return $(this).css("display") != "none";
	});
	var textTmp = $("#play_text li.current");
	// alert(listTmp.html());
	$("#play_list li").hide();
	$("#play_info li").hide();
	$("#play_text li").removeClass("current");
	if (listTmp.next().length == 0) {
		$("#play_list li").eq(0).show();
		$("#play_info li").eq(0).show();
		$("#play_text li").eq(0).addClass("current");
	} else {
		listTmp.fadeOut(500).next().fadeIn(1000);
		infoTmp.fadeOut(500).next().fadeIn(1000);
		textTmp.next().addClass("current");
	}
}

// 获取图表数据信息
// 安全计划
var aqjhXset = [];
var aqjhYset1 = [];
var aqjhYset2 = [];
// 风险防控
var fxfkXset = [];
var fxfkYset1 = [];
var fxfkYset2 = [];
var fxfkYset3 = [];
// 安全事件
var aqsjXset = [];
var aqsjYset = [];
// 项目计划
var xmjhYset1 = [];
var xmjhYset2 = [];
// 项目动态
var xmdtYset = [];
// 资源申请
var zysqYset1 = [];
var zysqYset2 = [];
// 运维情况
var ywqkYset1 = [];
var ywqkYset2 = [];
function getData() {
	$.ajax({
		async : false,
		url : "/iims/basicCrud/target/all",
		type : "post",
		dataType : 'json',
		cache : false,
		success : function(data, status, xhr) {
			if (data.success == true && data.result != "[]") {
				var aqjhKey = [];
				var fxfkKey = [];
				var aqsjKey = [];
				$.each(data.result,
						function(entryIndex, entry) {
							// 安全计划
							if (entry.type == "safePlanTarget") {
								aqjhKey.push(entry.key);
								if (aqjhKey.length == 10) {
									aqjhXset = [ "等保测评", "技术检测", "教育培训",
											"应急演练", "专项整改" ];
								}

								if (entry.key == "dbcp_planNum"
										|| entry.key == "jsjc_planNum"
										|| entry.key == "jypx_planNum"
										|| entry.key == "yjyl_planNum"
										|| entry.key == "zxzg_planNum") {
									aqjhYset1.push(entry.value);
								} else {
									aqjhYset2.push(entry.value);
								}
							}
							// 风险防控
							if (entry.type == "riskManagement") {
								fxfkKey.push(entry.key);
								if (fxfkKey.length == 6) {
									fxfkXset = [ "安全风险", "安全问题" ];
								}

								if (entry.key == "aqfx_total"
										|| entry.key == "aqwt_total") {
									fxfkYset1.push(entry.value);
								} else if (entry.key == "fxxcqk_total"
										|| entry.key == "wtzgqk_total") {
									fxfkYset2.push(entry.value);
								} else {
									fxfkYset3.push(entry.value);
								}
							}
							// 安全事件
							if (entry.type == "securityEventManagement") {
								aqsjKey.push(entry.key);
								if (aqsjKey.length == 3) {
									aqsjXset = [ "年度安全事件总数", "年度较大安全事件总数",
											"当月事件发生总数" ];
								}
								aqsjYset.push(entry.value);

							}
							// 项目计划
							if (entry.type == "projectPlanTarget") {
								if (entry.key == "qqce_planNum"
										|| entry.key == "lx_planNum"
										|| entry.key == "ht_planNum"
										|| entry.key == "cyjdss_planNum"
										|| entry.key == "ys_planNum") {
									xmjhYset1.push(entry.value);
								} else {
									xmjhYset2.push(entry.value);
								}
							}
							// 项目动态
							if (entry.type == "projectDynamic") {

								xmdtYset.push(entry.value);

							}
							// 资源申请
							if (entry.type == "resourceApplyAndHandle") {
								if (entry.time == "year") {
									if (entry.key == "zysq_total"
											|| entry.key == "ybj_total") {
										zysqYset1.push(entry.value);
									} 
								}else {
									zysqYset2.push(entry.value);
								}
							}
							// 运维情况
							if (entry.type == "operationSituation") {
								if (entry.time == "year") {
									if (entry.key == "gzjb_total"
											|| entry.key == "wc_total") {
										ywqkYset1.push(entry.value);
									}
								} else {
									ywqkYset2.push(entry.value);
								}
							}

						});
				aqjhChart(aqjhXset, aqjhYset1, aqjhYset2);
				fxfkChart(fxfkXset, fxfkYset1, fxfkYset2, fxfkYset3);
				aqsjChart(aqsjXset, aqsjYset);
				xmjhChart(xmjhYset1, xmjhYset2);
				xmdtChart(xmdtYset);
				zysqChart(zysqYset1, zysqYset2);
				ywqkChart(ywqkYset1, ywqkYset2);
			}
		},
		error : function() {
			alert("系统连接失败，请稍后再试！");
		}
	});
}

// Build the chart
function aqjhChart(aqjhXset, aqjhYset1, aqjhYset2) {
	Highcharts.setOptions({
		colors : [ '#87CEEB', '#9F79EE' ]
	});
	$('#container')
			.highcharts(
					{
						chart : {
							type : 'column'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},

						xAxis : {
							categories : aqjhXset,
							labels : {
								formatter : function() {
									var value1 = this.value;
									var value2 = this.value;
									if (value1.length > 4) {

										value2 = value1.substr(0, 2)
												+ "<br/>"
												+ value1.substring(2, 5)
												+ "<br/>"
												+ value1.substring(5,
														value1.length);

									}
									return value2;
								},
								style : {

									fontSize : '1'
								}

							}

						},
						yAxis : {
							min : 0,
							title : {
								text : '',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								}
							}
						},
						legend : {
							layout : 'horizontal',
							align : 'right',
							verticalAlign : 'top',
							x : -8,
							y : 10,
							floating : true,
							borderWidth : 1,
							backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [
								{
									name : '计划',
									data : [ parseFloat(aqjhYset1[0]),
											parseFloat(aqjhYset1[1]),
											parseFloat(aqjhYset1[2]),
											parseFloat(aqjhYset1[3]),
											parseFloat(aqjhYset1[4]) ]
								},
								{
									name : '完成',
									data : [ parseFloat(aqjhYset2[0]),
											parseFloat(aqjhYset2[1]),
											parseFloat(aqjhYset2[2]),
											parseFloat(aqjhYset2[3]),
											parseFloat(aqjhYset2[4]) ]
								} ]
					});
}

function fxfkChart(fxfkXset, fxfkYset1, fxfkYset2, fxfkYset3) {
	Highcharts.setOptions({
		colors : [ '#87CEEB', '#9F79EE', '#ED561B' ]
	});
	$('#container2')
			.highcharts(
					{
						chart : {
							type : 'column'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},

						xAxis : {
							categories : fxfkXset,
							labels : {
								formatter : function() {
									var value1 = this.value;
									var value2 = this.value;
									if (value1.length > 4) {

										value2 = value1.substr(0, 2)
												+ "<br/>"
												+ value1.substring(2, 5)
												+ "<br/>"
												+ value1.substring(5,
														value1.length);

									}
									return value2;
								},
								style : {

									fontSize : '1'
								}

							}

						},
						yAxis : {
							min : 0,
							title : {
								text : '',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								}
							}
						},
						legend : {
							layout : 'horizontal',
							align : 'right',
							verticalAlign : 'top',
							x : -8,
							y : 10,
							floating : true,
							borderWidth : 1,
							backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [
								{
									name : '总数',
									data : [ parseFloat(fxfkYset1[0]),
											parseFloat(fxfkYset1[1]) ]
								},
								{
									name : '消除',
									data : [ parseFloat(fxfkYset2[0]),
											parseFloat(fxfkYset2[1]) ]
								},
								{
									name : '新增',
									data : [ parseFloat(fxfkYset3[0]),
											parseFloat(fxfkYset3[1]) ]
								} ]
					});
}
function aqsjChart(aqsjXset, aqsjYset) {
	$('#container3')
			.highcharts(
					{
						chart : {
							type : 'column'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},
						xAxis : {
							type : 'category',
							categories : aqsjXset,
							labels : {
								formatter : function() {
									var value1 = this.value;
									var value2 = this.value;
									if (value1.length > 3) {

										value2 = value1.substr(0, 6)
												+ "<br/>"
												+ value1.substring(6,
														value1.length);

									}
									return value2;
								}

							}
						},
						yAxis : {
							min : 0,
							title : {
								text : ''
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						legend : {
							enabled : false
						},

						series : [ {
							name : '数量',
							data : [ parseFloat(aqsjYset[0]),
									parseFloat(aqsjYset[1]),
									parseFloat(aqsjYset[2]) ],
							dataLabels : {
								enabled : true,
								rotation : -90,
								color : '#FFFFFF',
								align : 'right',
								x : 4,
								y : 10,
								style : {
									fontSize : '10px',
									fontFamily : 'Verdana, sans-serif',
									textShadow : '0 0 3px black'
								}
							}
						} ]
					});

}
function zysqChart(zysqYset1, zysqYset2) {
	Highcharts.setOptions({
		colors : [ '#87CEEB', '#9F79EE' ]
	});
	$('#container6')
			.highcharts(
					{
						chart : {
							type : 'column'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},

						xAxis : {
							categories : [ '年度', '当月' ]

						},
						yAxis : {
							min : 0,
							title : {
								text : '',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								}
							}
						},
						legend : {
							layout : 'horizontal',
							align : 'right',
							verticalAlign : 'top',
							x : 4,
							y : 5,
							floating : true,
							borderWidth : 1,
							backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [
								{
									name : '资源申请总数',
									data : [ parseFloat(zysqYset1[0]),
											parseFloat(zysqYset2[0]) ]
								},
								{
									name : '已办理',
									data : [ parseFloat(zysqYset1[1]),
											parseFloat(zysqYset2[1]) ]
								} ]
					});

}
function ywqkChart(ywqkYset1, ywqkYset2) {
	Highcharts.setOptions({
		colors : [ '#87CEEB', '#9F79EE' ]
	});
	$('#container7')
			.highcharts(
					{
						chart : {
							type : 'bar'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},

						xAxis : {
							categories : [ '当月', '年度' ],
							title : {
								text : null
							}
						},
						yAxis : {
							min : 0,
							title : {
								text : '',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								}
							}
						},
						legend : {
							layout : 'horizontal',
							align : 'right',
							verticalAlign : 'top',
							x : 0,
							y : -10,
							floating : true,
							borderWidth : 1,
							backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [
								{
									name : '接报数量',
									data : [ parseFloat(ywqkYset2[0]),
											parseFloat(ywqkYset1[0]) ]
								},
								{
									name : '完成数量',
									data : [ parseFloat(ywqkYset2[1]),
											parseFloat(ywqkYset1[1])

									]
								} ]
					});
}
function xmdtChart(xmdtYset) {
	Highcharts.setOptions({
		colors : [ '#87CEEB', '#9F79EE', '#ED561B' ]
	});
	$('#container5')
			.highcharts(
					{
						chart : {
							type : 'bar'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},

						xAxis : {
							categories : [ '项目动态' ],
							labels : {
								formatter : function() {
									var value1 = this.value;
									var value2 = this.value;
									if (value1.length > 0) {

										value2 = value1.substring(0, 1)
												+ "<br/>"
												+ value1.substring(1, 2)
												+ "<br/>"
												+ value1.substring(2, 3)
												+ "<br/>"
												+ value1.substring(3, 4)
												+ "<br/>";

									}
									return value2;
								}
							}
						},
						yAxis : {
							min : 0,
							title : {
								text : '',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								}
							}
						},
						legend : {
							layout : 'horizontal',
							align : 'right',
							verticalAlign : 'top',
							x : 10,
							y : -8,
							floating : true,
							borderWidth : 1,
							backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [ {
							name : '计划',
							data : [ parseFloat(xmdtYset[0]) ]
						}, {
							name : '正常',
							data : [ parseFloat(xmdtYset[1]) ]
						}, {
							name : '延迟',
							data : [ parseFloat(xmdtYset[2]) ]
						} ]
					});
}
function xmjhChart(xmjhYset1, xmjhYset2) {
	Highcharts.setOptions({
		colors : [ '#87CEEB', '#9F79EE' ]
	});
	$('#container4')
			.highcharts(
					{

						chart : {
							type : 'column'
						},
						title : {
							text : ''
						},
						exporting : {
							enabled : false
						},
						credits : {
							enabled : false
						},

						xAxis : {
							categories : [ '前期策划', '立项', '合同', '初验', '验收' ],
							labels : {
								formatter : function() {
									var value1 = this.value;
									var value2 = this.value;
									if (value1.length > 4) {

										value2 = value1.substr(0, 2)
												+ "<br/>"
												+ value1.substring(2, 5)
												+ "<br/>"
												+ value1.substring(5,
														value1.length);

									}
									return value2;
								},
								style : {

									fontSize : '1'
								}

							}

						},
						yAxis : {
							min : 0,
							title : {
								text : '',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} </b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								}
							}
						},
						legend : {
							layout : 'horizontal',
							align : 'left',
							verticalAlign : 'top',
							x : -8,
							y : 10,
							floating : true,
							borderWidth : 1,
							backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [
								{
									name : '计划',
									data : [ parseFloat(xmjhYset1[0]),
											parseFloat(xmjhYset1[1]),
											parseFloat(xmjhYset1[2]),
											parseFloat(xmjhYset1[3]),
											parseFloat(xmjhYset1[4]) ]
								},
								{

									name : '完成',
									data : [ parseFloat(xmjhYset2[0]),
											parseFloat(xmjhYset2[1]),
											parseFloat(xmjhYset2[2]),
											parseFloat(xmjhYset2[3]),
											parseFloat(xmjhYset2[4]) ]
								} ]
					});

}

function getSpanData() {
	$.ajax({
		async : false,
		url : "/iims/basicCrud/target/all",
		type : "post",
		dataType : 'json',
		cache : false,
		success : function(data, status, xhr) {
			if (data.success == true && data.result != "[]") {

				$.each(data.result, function(entryIndex, entry) {
					if (entry.type == "projectPlanTarget") {
						if (entry.key == "qqce_planNum"
								|| entry.key == "qqce_finishNum") {
							$("#qqch").text(entry.value + "/" + entry.value);
						} else if (entry.key == "lx_planNum"
								|| entry.key == "lx_finishNum") {
							$("#lx").text(entry.value + "/" + entry.value);
						} else if (entry.key == "ht_planNum"
								|| entry.key == "ht_lx_finishNum") {
							$("#ht").text(entry.value + "/" + entry.value);
						} else if (entry.key == "cyjdss_planNum"
								|| entry.key == "cyjdss_finishNum") {
							$("#cy").text(entry.value + "/" + entry.value);
						} else if (entry.key == "ys_planNum"
								|| entry.key == "ys_finishNum") {
							$("#ys").text(entry.value + "/" + entry.value);
						}
					} else if (entry.type == "projectDynamic") {
						if (entry.key == "ndxm_planNum") {
							$("#ndjh").text(entry.value);
						} else if (entry.key == "zckzxm_total") {
							$("#zckz").text(entry.value);
						} else if (entry.key == "xmyzyc_total") {
							$("#xmyz").text(entry.value);
						}
					}
				});
			}
		}
	});
}

// 走马灯
function zoumadeng() {
	var html = "【信息化项目推进情况】资源开发管理系统完成项目验收      【信息化项目】信息化业务管理系统项目第一阶段试运行上线";
	html += "【信息化项目推进情况】资源开发管理系统完成项目验收      【信息化项目】信息化业务管理系统项目第一阶段试运行上线";
	html += "【信息化项目推进情况】资源开发管理系统完成项目验收    【信息化项目】信息化业务管理系统项目第一阶段试运行上线";

	$("#marquee > li").append(html);
	$("#marquee").marquee({
		scrollSpeed : 12,
		yScroll : "bottom"
	});
}
