<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
System.out.println(basePath);
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<base href="<%=basePath%>" />
	<title>FRAME-2222</title>

<!-- 	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> -->
<!-- <script type="text/javascript" language="javascript" src="js/jquery-1.4.2.min.js"></script> -->
<!-- <script type="text/javascript" language="javascript" src="js/swfobject.js"></script> -->
<!-- <script type="text/javascript" language="javascript" src="js/jquery.uploadify.v2.1.4.min.js"></script> -->
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
	<script type="text/javascript" src="js/me.js"></script>
	<script type="text/javascript">
	//关闭窗口
	function shut(){
			  window.opener=null;
			  window.open("","_self");
			  window.close();
			}

	$(function(){
		$("#uploadify_one").uploadify({
			'auto' : false,
		       'method' : "post",
		       'height' : 20,
		       'width' : 100,
		       'swf' : 'js/uploadify.swf', 
		       'uploader' : '<%=basePath%>/basicCrud/attach/uploadify',
		     'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',		//描述
		       'fileTypeExts' : '*.txt;*.xls;*.xlsx;*.doc;*.docx;*.rar;*.zip;*.jpg;*.png;*.pdf',			//文件类型
		       'fileSizeLimit' : '30000KB',			//文件大小
		       'buttonText' : '选择文件',			//按钮名称
		       'fileObjName'	:'uploadify',
		       'multi' :true,
		       'successTimeout' : 5,
		       'requeueErrors' : false,
		       'removeTimeout' : 1,
		       'removeCompleted' : true,
	       'onSelectError' : function(file,errorCode,errorMsg) {
	       		if(errorCode==-110){
	       			this.queueData.errorMsg = "文件太大，无法上传！";
	       		}
	        }, 
	        'onUploadStart' : function(file) {
	            $("#uploadify").uploadify("settings", "formData",{'attachMemo' : '附件1'});
	        },
	        'onUploadSuccess' : function(file, data, response){
	    	  	var attach = jQuery.parseJSON(data);
	    		alert(attach);
	    	  	alert(attach.filename);
//		       		var attach = eval('(' + data + ')');
	       		$("#fileTable_one").show();
	       		var addHtml = "<tr style='word-break:break-all; word-wrap:break-word;'>"+
	       						"<td class='t_l' style='width:200px;'>"+
	       							"<a href='<%=basePath%>/basicCrud/attach/downloadAttach?attachId="+attach.id+"'>"+attach.filename+"</a>"+
	       						"</td>"+
	       						"<td class='t_r'>"+attach.filesize+"</td>"+
	       						"<td class='t_c'>"+attach.uploaddate+"</td>"+
	       						"<td class='t_c'><a href='<%=basePath%>/basicCrud/attach/downloadAttach?attachId="+attach.id+"'>下载</a></td>"+
	       						"<td class='t_c'><a href='#' id="+attach.id+" name='attach_id_one' onclick='removeFile_one(this); return false;'>取消</a></td>"+
	       					  "</tr>";
	       		$("#fileBody_one").find("tr").each(function(){
	       			if($.trim($(this).find("td:first").text())==(attach.filename)){
	       				var $target = $(this).find("td:last a");
	       				$.ajax({
	       					url			: 	"<%=basePath%>/basicCrud/attach/deleteAttach",
	       					async: false,
	       					dataType	: 	"json",
	       					type		:	'post',
	       					data: {
	       						id:$target.attr("id")
	       					},
	       					error:function(XMLHttpRequest, textStatus, errorThrown){
	       						alert(XMLHttpRequest.status);
	       		                alert(XMLHttpRequest.readyState);
	       		                alert(textStatus);
//	       		 				alert("系统连接失败请稍后再试！");
	       					},
	       					success: function( data ) {
	       						$target.parent().parent().remove();
	       						var trLength = $("#fileTable_one").find("tr").length;
	       						if(trLength==1){
	       							$("#fileTable_one").hide();
	       						}
	       					}
	       				});
	       			}
	       		});
	       		$("#fileBody_one").append(addHtml);
	       		$("#fileBody_one").show();
	    	}
		});
	});

	$(function(){
		$("#uploadify_two").uploadify({
			'auto' : false,
		       'method' : "post",
		       'height' : 20,
		       'width' : 100,
		       'swf' : 'js/uploadify.swf', 
		       'uploader' : '<%=basePath%>/basicCrud/attach/uploadify',
		     'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',		//描述
		       'fileTypeExts' : '*.txt;*.xls;*.xlsx;*.doc;*.docx;*.rar;*.zip;*.jpg;*.png;*.pdf',			//文件类型
		       'fileSizeLimit' : '30000KB',			//文件大小
		       'buttonText' : '选择文件',			//按钮名称
		       'fileObjName'	:'uploadify',
		       'multi' :true,
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
	    		alert(attach);
	    	  	alert(attach.filename);
//		       		var attach = eval('(' + data + ')');
	       		$("#fileTable_two").show();
	       		var addHtml = "<tr style='word-break:break-all; word-wrap:break-word;'>"+
	       						"<td class='t_l' style='width:200px;'>"+
	       							"<a href='<%=basePath%>/basicCrud/attach/downloadAttach?attachId="+attach.id+"'>"+attach.filename+"</a>"+
	       						"</td>"+
	       						"<td class='t_r'>"+attach.filesize+"</td>"+
	       						"<td class='t_c'>"+attach.uploaddate+"</td>"+
	       						"<td class='t_c'><a href='<%=basePath%>/basicCrud/attach/downloadAttach?attachId="+attach.id+"'>下载</a></td>"+
	       						"<td class='t_c'><a href='#' id="+attach.id+" name='attach_id_two' onclick='removeFile_two(this); return false;'>取消</a></td>"+
	       					  "</tr>";
	       		$("#fileBody_two").find("tr").each(function(){
	       			if($.trim($(this).find("td:first").text())==(attach.filename)){
	       				var $target = $(this).find("td:last a");
	       				$.ajax({
	       					url			: 	"<%=basePath%>/basicCrud/attach/deleteAttach",
	       					async: false,
	       					dataType	: 	"json",
	       					type		:	'post',
	       					data: {
	       						id:$target.attr("id")
	       					},
	       					error:function(XMLHttpRequest, textStatus, errorThrown){
	       						alert(XMLHttpRequest.status);
	       		                alert(XMLHttpRequest.readyState);
	       		                alert(textStatus);
//	       		 				alert("系统连接失败请稍后再试！");
	       					},
	       					success: function( data ) {
	       						$target.parent().parent().remove();
	       						var trLength = $("#fileTable_two").find("tr").length;
	       						if(trLength==1){
	       							$("#fileTable_two").hide();
	       						}
	       					}
	       				});
	       			}
	       		});
	       		$("#fileBody_two").append(addHtml);
	       		$("#fileBody_two").show();
	    	}
		});
	});

	function checkForm(){
		// 	检查第一个附件表单
		var attachIds_one ="";
		$("#fileBody_one").find("a[name=attach_id_one]").each(function(){
			attachIds_one += $(this).attr("id")+",";
		});
		
		if(attachIds_one!=null && attachIds_one!="" && attachIds_one.length>1){
			attachIds_one = attachIds_one.substring(0,attachIds_one.length-1);
		}
		$("#attachIds_one").val(attachIds_one);
		
		// 	检查第二个附件表单
		var attachIds_two ="";
		$("#fileBody_two").find("a[name=attach_id_two]").each(function(){
			attachIds_two += $(this).attr("id")+",";
		});
		
		if(attachIds_two!=null && attachIds_two!="" && attachIds_two.length>1){
			attachIds_two = attachIds_two.substring(0,attachIds_two.length-1);
		}
		$("#attachIds_two").val(attachIds_two);
		
		return true;
	}

	//删除上传的附件1
	function removeFile_one(paramObj){
		if(confirm("是否删除")){	
			var $target = $(paramObj);
			$.ajax({
				url			: 	"<%=basePath%>/basicCrud/attach/deleteAttach",
				async: false,
				dataType	: 	"json",
				type		:	'post',
				data: {
					id:$target.attr("id")
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(XMLHttpRequest.status);
	                alert(XMLHttpRequest.readyState);
	                alert(textStatus);
//	 				alert("系统连接失败请稍后再试！");
				},
				success: function( data ) {
					$target.parent().parent().remove();
					var trLength = $("#fileTable_one").find("tr").length;
					if(trLength==1){
						$("#fileTable)_one").hide();
					}
				}
			});
		}
	}
	//删除上传的附件2
	function removeFile_two(paramObj){
		if(confirm("是否删除")){	
			var $target = $(paramObj);
			$.ajax({
				url			: 	"<%=basePath%>/basicCrud/attach/deleteAttach",
				async: false,
				dataType	: 	"json",
				type		:	'post',
				data: {
					id:$target.attr("id")
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(XMLHttpRequest.status);
	                alert(XMLHttpRequest.readyState);
	                alert(textStatus);
//	 				alert("系统连接失败请稍后再试！");
				},
				success: function( data ) {
					$target.parent().parent().remove();
					var trLength = $("#fileTable_two").find("tr").length;
					if(trLength==1){
						$("#fileTable_two").hide();
					}
				}
			});
		}
	}
	
	</script>
	
	<link rel="stylesheet" href="css/jquery-ui-1.8.18.custom.css" type="text/css" />
	<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/uploadify.css" type="text/css" />
</head>

<body id="${entity.cnName}-form">
<div id="main-content">
	<div class="clear"></div>
	<div class="content-box">
		<div class="content-box-content">
			<div class="content-box-header">
				<h3>&nbsp;${entity.cnName}</h3>
				<div class="clear"></div>
			</div>
			<form:form commandName="${entity.name}" action="${entity.name}/save">
			<c:if test="${hasErrors}">
			<div class="notification error png_bg">
				<a class="close" style="cursor: pointer;"><img src="images/icons/cross_grey_small.png"/></a>
				<div>
					<form:errors path="*" />
				</div>
			</div>
			</c:if>
			
			<table id="table1" border="0">
				<tbody>
				<c:forEach items="${entity.fieldProperties}" var="pageField" varStatus="s">
					<c:if test="${pageField.operate=='hidden'}">	
						<form:hidden path="${pageField.path}"/>
					</c:if>
					<c:if test="${pageField.operate=='input'}">	
					<tr>
						<td>${pageField.name}</td>
						<td><form:input path="${pageField.path}" class="text-input small-input"/></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</c:if>

					<c:if test="${fn:startsWith(pageField.operate,'range')}">		
					<tr>
						<td>${pageField.name}</td>
						<td><form:input path="${pageField.path}" class="text-input small-input"/></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</c:if>
					<c:if test="${pageField.operate=='select'}">	
					<tr>
						<td>${pageField.name}</td>
						<td><form:select path="${pageField.path}" items="${pageField.option}"/></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</c:if>	
				</c:forEach>

				<input type="hidden" name="attachIds_one" id="attachIds_one">
				<input type="hidden" name="attachIds_two" id="attachIds_two">
				<input type="hidden" name="crudObjId" id="crudObjId" value="${crudObjId}" >
					<table id="table1" border="0">
						<tbody>
			<tr>
				<td class="t_r lableTd">附件1<br/>(上传最大为10Mb)</td>
				<td colspan="3">
					<input type="file" name="uploadify_one" id="uploadify_one" />
					<input type="button" value="上传" onclick="$('#uploadify_one').uploadify('upload','*');">
					<input type="button" value="取消" onclick="$('#uploadify_one').uploadify('stop');">
					<table id="fileTable_one">
					<c:choose>
						<c:when test="${attachList_one !=null}">
							<tbody style="width: 550px;border: solid;border-color: #D0D0D3;" id="fileBody_one">
								<tr style="border: solid;border: #D0D0D3;">
									<td width="200px;" class="t_c">文件名</td>
									<td width="100px;" class="t_c">大小(KB)</td>
									<td width="150px;" class="t_c">上传时间</td>
									<td width="100px;" class="t_c" colspan="2">操作</td>
								</tr>
								<c:forEach var="attach" items="${attachList_one}">
								 <c:choose>
									<c:when test="${attach.status!=null} && ${attach.status=='eam'}">
										<tr style="word-break:break-all; word-wrap:break-word;">
											<td class="t_l"  style="width:200px;">
												<a href="javascript:void(0);" onclick="window.open(${attach.path})">
													${attach.filename}
												</a>
											</td>
											<td class="t_r">
												<c:choose>
												<c:when test="(attach.filesize/1024.0+'').substring((attach.filesize/1024.0+'').indexOf('.'),(attach.filesize/1024.0+'').length()).length()<=3">
													${attach.filesize}
												</c:when>
												<c:otherwise>
													${attach.filesize}
												</c:otherwise>
											 </c:choose>
											</td>
											<td class="t_c">${attach.uploaddate}</td>
											<td class="t_c">
												<a href="<%=basePath%>/basicCrud/attach/downloadAttach?attachId=${attach.id}">下载</a>
											</td>
											<td class="t_c">
												<a href="#" onclick="removeFile_one(this)" id="${attach.id}" name="attach_id_one">删除</a>
											</td>
										</tr>
									</c:when >
									<c:otherwise>
										<tr style="word-break:break-all; word-wrap:break-word;">
											<td class="t_l" style="width:200px;">
												<a href="<%=basePath%>/basicCrud/attach/downloadAttach?attachId=${attach.id}">
													${attach.filename}
												</a>
											</td>
											<td class="t_r">
												<c:choose>
												<c:when test="(attach.filesize/1024.0+'').substring((attach.filesize/1024.0+'').indexOf('.'),(attach.filesize/1024.0+'').length()).length()<=3">
													${attach.filesize}
												</c:when>
												<c:otherwise>
													${attach.filesize}
												</c:otherwise>
											 </c:choose>
											</td>
											<td class="t_c">${attach.uploaddate}</td>
											<td class="t_c">
												<a href="<%=basePath%>/basicCrud/attach/downloadAttach?attachId=${attach.id}">下载</a>
											</td>
											<td class="t_c">
												<a href="#"  id="${attach.id}" name="attach_id_one" onclick="removeFile_one(this); return false">删除</a>
											</td>
										</tr>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</c:when>
						<c:otherwise>
							<tbody style="width: 550px;border: solid;border-color: #D0D0D3;display: none;" id="fileBody_one">
								<tr style="border: solid;border: #D0D0D3;">
									<td width="200px;" class="t_c">文件名</td>
									<td width="100px;" class="t_c">大小(KB)</td>
									<td width="150px;" class="t_c">上传时间</td>
									<td width="100px;" class="t_c" colspan="2">操作</td>
								</tr>
							</tbody>
						</c:otherwise>
						 </c:choose>
					</table>
				</td>
			</tr>
			
			<!-- 第二个上传表单 -->
			<tr>
				<td class="t_r lableTd">附件2<br/>(上传最大为10Mb)</td>
				<td colspan="3">
					<input type="file" name="uploadify_two" id="uploadify_two" />
					<input type="button" value="上传" onclick="$('#uploadify_two').uploadify('upload','*');">
					<input type="button" value="取消" onclick="$('#uploadify_two').uploadify('stop');">
					<table id="fileTable_two">
					<c:choose>
						<c:when test="${attachList_two !=null}">
							<tbody style="width: 550px;border: solid;border-color: #D0D0D3;" id="fileBody_two">
								<tr style="border: solid;border: #D0D0D3;">
									<td width="200px;" class="t_c">文件名</td>
									<td width="100px;" class="t_c">大小(KB)</td>
									<td width="150px;" class="t_c">上传时间</td>
									<td width="100px;" class="t_c" colspan="2">操作</td>
								</tr>
								<c:forEach var="attach" items="${attachList_two}">
								 <c:choose>
									<c:when test="${attach.status!=null} && ${attach.status=='eam'}">
										<tr style="word-break:break-all; word-wrap:break-word;">
											<td class="t_l" style="width:200px;">
												<a href="javascript:void(0);" onclick="window.open(${attach.path})">
													${attach.filename}
												</a>
											</td>
											<td class="t_r">
												<c:choose>
												<c:when test="(attach.filesize/1024.0+'').substring((attach.filesize/1024.0+'').indexOf('.'),(attach.filesize/1024.0+'').length()).length()<=3">
													${attach.filesize}
												</c:when>
												<c:otherwise>
													${attach.filesize}
												</c:otherwise>
											 </c:choose>
											</td>
											<td class="t_c">${attach.uploaddate}</td>
											<td class="t_c">
												<a href="<%=basePath%>/basicCrud/attach/downloadAttach?attachId=${attach.id}">下载</a>
											</td>
											<td class="t_c">
												<a href="#" onclick="removeFile_two(this)" id="${attach.id}" name="attach_id_two">删除</a>
											</td>
										</tr>
									</c:when >
									<c:otherwise>
										<tr style="word-break:break-all; word-wrap:break-word;">
											<td class="t_l" style="width:200px;">
												<a href="<%=basePath%>/basicCrud/attach/downloadAttach?attachId=${attach.id}">
													${attach.filename}
												</a>
											</td>
											<td class="t_r">
												<c:choose>
												<c:when test="(attach.filesize/1024.0+'').substring((attach.filesize/1024.0+'').indexOf('.'),(attach.filesize/1024.0+'').length()).length()<=3">
													${attach.filesize}
												</c:when>
												<c:otherwise>
													${attach.filesize}
												</c:otherwise>
											 </c:choose>
											</td>
											<td class="t_c">${attach.uploaddate}</td>
											<td class="t_c">
												<a href="<%=basePath%>/basicCrud/attach/downloadAttach?attachId=${attach.id}">下载</a>
											</td>
											<td class="t_c">
												<a href="#"  id="${attach.id}" name="attach_id_two" onclick="removeFile_two(this); return false">删除</a>
											</td>
										</tr>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</c:when>
						<c:otherwise>
							<tbody style="width: 550px;border: solid;border-color: #D0D0D3;display: none;" id="fileBody_two">
								<tr style="border: solid;border: #D0D0D3;">
									<td width="200px;" class="t_c">文件名</td>
									<td width="100px;" class="t_c">大小(KB)</td>
									<td width="150px;" class="t_c">上传时间</td>
									<td width="100px;" class="t_c" colspan="2">操作</td>
								</tr>
							</tbody>
						</c:otherwise>
						 </c:choose>
					</table>
				</td>
			</tr>
			
						</tbody>
				</tbody>
			</table>
			<p>
				<br/>
				<input class="button" type="submit" value="提交" onclick="return checkForm();" />
            </p>
			</form:form>
		</div>
	</div>
	
	<div class="clear"></div>
	<div id="footer">
		<small>
			Powered by <a href="#" target="_blank">lsf</a> | <a href="mailto:mengjie@wondersgroup.com">联系我</a>
		</small>
	</div>
</div>
</body>
</html>
