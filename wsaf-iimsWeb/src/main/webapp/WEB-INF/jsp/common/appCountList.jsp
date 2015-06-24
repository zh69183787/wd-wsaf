<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.OutputStream"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<meta charset="utf-8" />
<title>申通地铁集团信息管理中心</title>
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
<link rel="stylesheet" href="css/invalid.css" type="text/css"
	media="screen" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<link rel="stylesheet" href="css/uploadify.css" type="text/css" />
<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.uploadify-3.1.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/json2.js"></script>
<script src="js/projectPlan.js"></script>
<script src="js/appAcount.js"></script>
<script type="text/javascript">

var SelectObj,power;
var Iframenow=0;
	$(document).ready(function() {
		var obj;
	
		InitSelect();
		
		$("#searchbtn").click(function() {
			$("#table_1 tbody").empty();
			$.showObjectOption();
		});
		$("#renewbtn").click(function() {
			$("#searchform tbody input,#searchform tbody select").val("");
			checkPower();
		});
	  // minute("123","123123","yes","opsys");
	  
	  	$("#xz").click(function(){
		 
 	       window.location.href="${pageContext.request.contextPath}/appVersion/AppVersionAdd?backpage=1";
		});
	$("#dr").click(function(){
		  $("#dr_div").fadeIn();
		});
	  $("#dc").click(function(){
	   $("#dept").attr("disabled",false);
		   var content =$("#searchform").serialize();
 	       window.location.href="${pageContext.request.contextPath}/basicCrud/appCount/export2Excel?"+content+"&type=appCount";
		 $("#dept").attr("disabled",true);
		});
		
			$("#xzmb").click(function(){
 window.location.href="${pageContext.request.contextPath}/static/正版化台账模板.xls";
		});

	});	
	
	 function checkPower(){
  
        $.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/ca/getCurrentLoginInfo",
					data :"",
					dataType : 'json',
					cache : false,
					error : function() {
					//	alert('系统连接失败，请稍后再试1！');
					},
					success : function(user) {
					 //alert(JSON.stringify(user.cookies.deptId!="2549"));
				     // alert(JSON.stringify(user.cookies.deptId));
				     if(user.cookies.deptId!="2549"){
				        power="no";
				        $("#dept").find("option[value='"+user.cookies.deptId+"']").attr("selected",true);
				     }else{
				        power="yes";
				     }
				     $.showObjectOption();
				     
					}
					
				});
		    
				 
   }
	
	
	
	
	  $(function(){

	$("#uploadify").uploadify({
		   'auto' : false,
	       'method' : "post",
	       'height' : 20,
	       'width' : 100,
	       'swf' : 'js/uploadify.swf', 
	       'uploader' : '<%=basePath%>basicCrud/appVersion/importExcel?type=appVersion_title_1',
	     'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',		//描述
	       'fileTypeExts' : '*.xls;*.xlsx;',			//文件类型
	       'fileSizeLimit' : '30000KB',			//文件大小
	       'buttonText' : '选择文件',			//按钮名称
	       'fileObjName'	:'uploadify',
	       'multi' :false,
	       'successTimeout' : 5,
	       'requeueErrors' : false,
	       'removeTimeout' : 1,
	       'removeCompleted' : true,
       'onSelectError' : function(file,errorCode,errorMsg) {
       		if(errorCode==-110){
       			this.queueData.errorMsg = "文件太大，无法上传！";
       		}
        }, 
       'onUploadSuccess' : function(file, data, response){
    	   var attach = jQuery.parseJSON(data);
       		$("#fileTable").show();
       		var addHtml = "<a href='<%=basePath%>/attach/downloadAttach.action?attachId="+attach.id+"'>"+attach.filename+"."+attach.fileextname+"</a>";				
       		$("#showTR").show();
       		$("#showId").html(addHtml);
       		$.showObjectOption();
       		if (confirm("上传成功！是否继续上传?")){
       		  
       		}else{
       		    close();
       		}
    	}
	});
});


	function minute(Dept, DeviceNum, Authorize, AppType) {
		window.location.href = "${pageContext.request.contextPath}/appVersion/AppVersionList?backpage=1&dept="
				+ Dept
				+ "&deviceNum="
				+ DeviceNum
				+ "&authorize="
				+ Authorize
				+ "&appType=" + AppType;

	}

	function del(id) {
		if (confirm("确认删除？")) {
			$
					.ajax({

						type : 'POST',
						url : "${pageContext.request.contextPath}/basicCrud/appCount/del/"
								+ id,
						data : "",
						dataType : 'json',
						cache : false,
						error : function() {
							alert('系统连接失败，请稍后再试4！');
						},
						success : function(obj) {
							//alert(JSON.stringify(obj.result.pageInfo));
							if (obj.success) {
								//alert(0);
								$.showObjectOption();

							}
						}
					});
		}

	}

	$.showObjectOption = function(_page) {
		//alert($("#searchform").serialize());
		// alert(0);
		  $("#dept").attr("disabled",false);
		$.ajax({

					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appCount/page?pageSize=18&pageNum="+ _page,
					data : $("#searchform").serialize(),
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						//alert(JSON.stringify(obj.result.pageInfo));
						if (obj.success) {
							//alert(0);
								
							loadinformation(obj);
							  $.setBtn();
						}
					}
				});
				
				if(power=="no"){
				 $("#dept").attr("disabled",true);
				}
	}

	$.setBtn = function() {
		$(".topage").click(function() {
			$.showObjectOption($(this).text());

		});

		$(".prepage").click(function() {
			var nowpage = parseInt($("#page>.selected  a").text());
			if (nowpage > 1) {
				var topage = nowpage - 1;
				$.showObjectOption(topage);
			}
		});

		$(".nextpage").click(function() {
			//alert(0);
			var nextpage = parseInt($("#page>.selected  a").text()) + 1;

			if (nextpage <= parseInt($("#gopage").attr("max")))
				$.showObjectOption(nextpage);

		});

		$("#gopagebtn").click(function() {
			var topage = parseInt($("#gopage").val());

			if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
				$.showObjectOption(topage);
			} else {
				alert("超出索引值");
			}
		});
	}

	function InitSelect() {
		$
				.ajax({

					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/getEntityProperty",
					data : "",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						if (obj.success) {
							SelectObj = obj;
							$.each(obj.result.fieldProperties, function(index,
									obj) {
								if (obj.path == "dept") {
									$.each(obj.option, function(i, o) {
										if (i == "") {
											$("#dept").append(
													"<option value=\""+i+"\" selected>"
															+ o + "</option>");
										} else {
											$("#dept").append(
													"<option value=\""+i+"\" >"
															+ o + "</option>");
										}
									});
								}
							});
							checkPower();
							
						}
					}
				});
	}
	
	
	function close(){
	 $("#dr_div").fadeOut();
	}
	
</script>

<style type="text/css">
.red {
	color: red;
}
</style>



</head>

<body>

	<div id="dr_div" class="f_window" 
		style="width:400px; display:none;   margin:10% 0% 0 36%;">

		<div class="con">
			<table id="table_2" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="table_2">

				<thead>

					<th colspan="4">

						<h5 class="fl">文件导入</h5> <a 
						 	class="fr pt5 mr5" href="javascript:close();">关闭</a> </th>

				</thead>
				<tbody>
    <tr> <td>	<input
									class="fr" type="button" value="取消"
									onclick="$('#uploadify').uploadify('stop');">
									<input class="fr"type="button" value="上传"
									onclick="$('#uploadify').uploadify('upload','*');"> 
						<input type="file" name="uploadify" class="fr"
									id="uploadify" value="浏览"/> 
    </td></tr>
				</tbody>

			</table>


		</div>


	</div>
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
					<li><a href="#">正版化管理</a>
					</li>
					<li class="fin">正版化台账</li>
				</ul>
			</div>
			<div class="fr lit_nav nwarp">
				<ul>
					<li class="selected"><a class="print" href="javascript:;">打印</a>
					</li>
					<li><a class="express" href="javascript:;">导出数据</a>
					</li>
					<li class="selected"><a class="table" href="javascript:;">表格模式</a>
					</li>
					<li><a class="treeOpen" href="javascript:;">打开树</a>
					</li>
					<li><a class="filterClose" href="javascript:;">关闭过滤</a>
					</li>
				</ul>
			</div>
		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Tabs_2-->
			<div class="tabs_2 nwarp">
				<ul class="nwarp">
					<li class="selected"><a href="#"><span>正版化台账-设备类别</span>
					</a>
					</li>

				</ul>
			</div>
			<!--Tabs_2 End-->
			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<form id="searchform">
							<table class="nwarp" width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tbody>


									<tr id="tr_1">


										<td width="10%" class="t_r">部门</td>
										<td width="12%"><select name="dept" id="dept"
											class="input_large">

										</select></td>

										<td width="1%" class="t_r">设备编号</td>
										<td width="12%"><input name="deviceNum" type="text"
											class="input_large" />
										</td>


									</tr>

								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" class="t_c"><input type="button"
											id="searchbtn" value="搜索" /> &nbsp; <input type="button"
											id="renewbtn" value="重 置" />
									</tr>
								</tfoot>

							</table>
						</form>
					</div>
				</div>
				<div class="fn clearfix">
					<h5 class="fl">
						<a href="#" class="colSelect fl"></a>
					</h5>
					<input type="button" class="fr" id="xzmb" value="下载模板" />
					 <input	type="button" name="button1" id="xz" value="新 增" class="fr" /> 
						<input type="button" name="button2" id="dc" value="导 出" class="fr" /> 
					<input type="button" name="button2" id="dr" value="导 入" class="fr" /> 
				</div>
			</div>
			<!--Filter End-->
			<!--Table-->
			<div class="mb10">
				<table width="100%" id="table_1" class="table_1" id="maintable">
					<thead>
						<tr class="tit">

							<td><a href="javascript:;"><span class="fl">ID</span><i></i>
							</a></td>
							<td><a href="javascript:;"><span class="fl">部门</span><i></i>
							</a></td>
							<td><a href="javascript:;"><span class="fl">设备编号</span><i></i>
							</a></td>
							<td><a href="javascript:;"><span class="fl">操作系统</span><i></i>
							</a></td>
							<td><a href="javascript:;"><span class="fl">办公软件</span><i></i>
							</a></td>

							<td><a href="javascript:;"><span class="fl">应用软件</span><i></i>
							</a></td>

							<td><a href="javascript:;"><span class="fl">操作</span> </a></td>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="9">
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
