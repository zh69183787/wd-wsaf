<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会议记录</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/formalize.css" />
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/default/imgs.css" />
<link rel="stylesheet" href="css/reset.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/projectPlan.js"></script>
<script src="js/jquery.uploadify-3.1.js"></script>
<link rel="stylesheet" href="css/uploadify.css" type="text/css" />
		
<script type="text/javascript">
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

	$(function() {

		 $("[name=startDate]").val(getNowFormatDate()).datepicker({
			 onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); },
			 dateFormat:"yy-mm-dd",
			 });
	
		var issue_num=0;
		
		$.getPersonInfo("${pageContext.request.contextPath}");
        $.FileDel = function(firUrl,_id,isRead){
			
			if(firUrl!="")
			   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/attach/api/del/"+_id,
					    dataType:"json",
						type:'post',
						success: function(data, status, xhr) {
	
							alert("删除成功");
						}
				 });
			   }
		}
    	$("#btndel").click(function(){
			 window.close();
				location.href = "${pageContext.request.contextPath}/meeting/meetingManageList";	
		});
		$("#btnSubmit").click(function(){
			var _return="";
			
			if($.isNullOrEmpty($("[name=title]")))
				_return+="会议标题不能为空\r\n";
			
			if($.isNullOrEmpty($("[name=startDate]")))
				_return+="开始日期不能为空\r\n";
			
			if(_return!="")
			{ 
				alert(_return);
				return false;
			}
			
			var otherData="&topic={",_obj=$(".winPermission");
			for(var i=0;i<_obj.length;i++)
			{
			var _num=$(_obj[i]).attr("id");
			var _num2=_num.replace("winPermission","");
			otherData+="\""+$(".table_issue"+_num2+" .txtissue").val()+"\":\"{\\\"attachGroup\\\":\\\"issue"+_num2+"\\\",\\\"share\\\":\\\"";
			var _obj2=$("#winPermission"+_num2).find("input[name=cbPerson]:checked");
			for(var j=0;j<_obj2.length;j++)
			{
				otherData+=$(_obj2[j]).parents("tr").find(".LoginName").text()+",";
			}
			
			if(_obj2.length>0)
			otherData=otherData.substring(0,otherData.length-1);
			
			otherData+="\\\"}\",";
			}
		otherData+="\"meetingSummary\":\"{\\\"attachGroup\\\":\\\"meetingSummary\\\",\\\"share\\\":\\\"";
		
		var _obj3=$("#win3").find("input[name=cbPerson]:checked");
		for(var x=0;x<_obj3.length;x++)
		{
			otherData+=$(_obj3[x]).parents("tr").find(".LoginName").text()+",";
		}
		
		if(_obj3.length>0)
		otherData=otherData.substring(0,otherData.length-1);
		
		otherData+="\\\"}\"";
		
		
		//otherData=otherData.substring(0,otherData.length-1);
		otherData+="}";
	    $.postSaves("${pageContext.request.contextPath}","projectPlanForm",otherData,"meeting");
		});
		
		$("input#delIssues").click(function(){
			$("tr.yiti").remove();
			$(".winPermission").remove();
			
		});
		$(".closewindow").click(function(){
			$(".f_window").css("display","none");
			$("#bt").css("display","none");
		});
		$("#win3 .submit").click(function(){
			$(".f_window").css("display","none");
			$("#bt").css("display","none");
		});
		$("#win1 .submit").click(function(){
			var _master=$("#win1 input[name=cbPerson]:checked").parent().text();
			$("input[name=master]").val(_master);
			$("#win1").css("display","none");
			$("#bt").css("display","none");
		});
		$("#win2 .submit").click(function(){
			var _master=$("#win2 input[name=cbPerson]:checked").parent().text();
			$("input[name=presentMembers]").val(_master);
			$("#win2").css("display","none");
			$("#bt").css("display","none");
		});
		$("input[name=master]").click(function(){
			$("#bt").height($(document).height());
		    $("#win1").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
		    $("#win1").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
			$("#win1").css("display","block");
			$("#bt").css("display","block");
		});
		
		$("input[name=presentMembers]").click(function(){
			$("#bt").height($(document).height());
		    $("#win2").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
		    $("#win2").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
			$("#win2").css("display","block");
			$("#bt").css("display","block");
		});
		$(".table_summary .setPermission").click(function(){
			$("#bt").height($(document).height());
		    $("#win3").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
		    $("#win3").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
			$("#win3").css("display","block");
			$("#bt").css("display","block");
		});
		
		$("#upload_meeting").uploadify({
			'auto' : false,
		       'method' : "post",
		       'height' : 20,
		       'width' : 100,
		       'swf' : 'js/uploadify.swf', 
		       'uploader' : '<%=basePath%>attach/api/upload?groupName="meetingSummary"',
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
		    	   alert("失败");
		       		if(errorCode==-110){
		       			this.queueData.errorMsg = "文件太大，无法上传！";
		       		}
		        }, 
		        'onUploadSuccess' : function(file, data, response){
		   	  	 var attachs = jQuery.parseJSON(data);
	    	  	 var attach=attachs.result[0];
	  
	    		if(attach.id!=null)
	    			$(this.button[0]).parents("table:first").find("tbody:first").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td>"+attach.uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");
	    		$("table tbody a.del").click(function(){
					$.FileDel("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"),true);
					  $(this).parents("tr:first").remove();
			   });
		    	},
		       
		});
		
		
		$("#addIssue").click(function(){
		    issue_num+=1;
			$(this).parents("tr").after("<tr class=\"yiti\"><td class=\"lableTd t_r\">会议资料</td><td colspan=\"3\"><table width=\"100%\" class=\"table_issue"+issue_num+"\"><thead><tr><td colspan=\"4\" >议题：  <input  type=\"text\"  style=\"width:360px\" class=\"txtissue\" MaxLength=\"50\"/></td><td style=\"color:Blue;cursor:pointer;text-align:right\" class=\"delIssue\">删除</td></tr><tr><td  colspan=\"5\"><input id=\"upload_photo"+issue_num+"\" class=\"upload_button\" type=\"button\" value=\"浏览...\" /><div style=\"display:none\" class=\"myissue\">issue"+issue_num+"</div><input type=\"button\" value=\"上传\"  onclick=\"$('#upload_photo"+issue_num+"').uploadify('upload','*');\"><input type=\"button\" value=\"取消\"  onclick=\"$('#upload_photo"+issue_num+"').uploadify('cancel','*');\"></td></tr><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan=\"2\">操作</td></tr></thead><tbody></tbody><tfoot><tr><td colspan=\"5\" style=\"text-align:right;cursor:pointer;color:Blue;border-bottom:0\" class=\"setPermission\" >设置权限</td></tr></tfoot></table></td></tr>");
			$("#bt").after(" <div class=\"f_window winPermission\" id=\"winPermission"+issue_num+"\" style=\"display:none\"><h3 class=\"clearfix mb10\"><span class=\"fl\">请设置权限</span><div class=\"fr close\"><a class=\"closewindow\">关闭窗口</a></div></h3><div class=\"con\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"selPersonTable\" ><thead><tr><td colspan=\"2\"></td></tr></thead><tbody></tbody></table></div> <div class=\"button t_c\"><input type=\"button\" class=\"submit\" value=\"确认\" /></div></div>");
			$(".setPermission").click(function(){
				var my_num=$(this).parents("table").attr("class");
				my_num=my_num.replace("table_issue","");
				$("#bt").height($(document).height());
			    $("#winPermission"+my_num).css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
			    $("#winPermission"+my_num).css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
				$("#winPermission"+my_num).css("display","block");
				$("#bt").css("display","block");
				$.getPersonInfo("${pageContext.request.contextPath}");
			});
			
			$(".delIssue").click(function(){
				var my_num=$(this).parents("table").attr("class");
				my_num=my_num.replace("table_issue","");
		      $(".table_issue"+my_num).parents("tr.yiti").remove();
		      $("#winPermission"+my_num).remove();
			});
			$(".submit").click(function(){
				$(".f_window").css("display","none");
				$("#bt").css("display","none");
			});
			$(".closewindow").click(function(){
				$(".f_window").css("display","none");
				$("#bt").css("display","none");
			});
			$("#upload_photo"+issue_num).uploadify({
				'auto' : false,
			       'method' : "get",
			       'height' : 20,
			       'width' : 100,
			       'swf' : 'js/uploadify.swf', 
			       'scriptData':'',
			       'uploader' : '<%=basePath%>attach/api/upload',
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
			       'onUploadStart' : function(file) {
			    	  var groupName=$(this.button[0]).parents("tr").find(".myissue").text();
			    	  var my_num=groupName.replace("issue","");
			    	  $("#upload_photo"+my_num).uploadify("settings","formData",{"groupName":groupName});
			    },
        
			       'onSelectError' : function(file,errorCode,errorMsg) {
			    	   alert("失败");
			       		if(errorCode==-110){
			       			this.queueData.errorMsg = "文件太大，无法上传！";
			       		}
			        }, 
			        'onUploadSuccess' : function(file, data, response){
			    	  	 var attachs = jQuery.parseJSON(data);
			    	  	 var attach=attachs.result[0];
			  
			    		if(attach.id!=null)
			    			$(this.button[0]).parents("table:first").find("tbody:first").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td>"+attach.uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");
			    		$("table tbody a.del").click(function(){
							$.FileDel("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"),true);
							  $(this).parents("tr:first").remove();
					   });
			    	},
			       
			});
		});
		
		$.getMenu("${pageContext.request.contextPath}","meeting");
		$.defaultjs(); 
		 $("[name=meetingRoom]").val("roomInInfoCenter");
	
	});
	
	function checknum(obj)
{   if(/^\d+\.?\d{0,2}$/.test(obj.value)){
       obj.value = obj.value;
    }else
    {
   obj.value = obj.value.substring(0,obj.value.length-1);
}
   
}
	</script>
</head>

<body class="Flow">
    <!--Transparent End-->
 <div id="bt" class="transparent" style="display:none"></div>

    <div class="f_window" id="win1" style="display:none">
      <h3 class="clearfix mb10"><span class="fl">请选择主持人</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="con">

        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="selPersonTable" >
<thead>
<tr><td colspan="2"></td>
</tr></thead>
<tbody></tbody></table>

      </div>

      <div class="button t_c">

        	<input type="button" class="submit" value="确认" />

        </div>

    </div>

    <!--Transparent End-->
    <div class="f_window" id="win2" style="display:none">
      <h3 class="clearfix mb10"><span class="fl">请选择出席人员</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>
        <div class="con">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="selPersonTable" >
       <thead><tr><td colspan="2"></td>
       </tr></thead><tbody></tbody></table></div>
        <div class="button t_c">
        <input type="button" class="submit" value="确认" />
        </div></div>
 <!--2 end-->
  <div class="f_window" id="win3" style="display:none">
      <h3 class="clearfix mb10"><span class="fl">请设置权限</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>
        <div class="con">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="selPersonTable" >
       <thead><tr><td colspan="2"></td>
       </tr></thead><tbody></tbody></table></div>
        <div class="button t_c">
        <input type="button" class="submit" value="确认" />
         </div></div>
     <!--3 end-->
	<div class="f_bg">

      <!--Panel_6-->	

        <div class="Divab1">

        	<!--1st-->

            <div class="panel_6">

              <div class="divT">

                <div class="mb10 icon icon_1"></div>

                <div class="more_4"><a title="更多">更多</a></div>

              </div>

              <div class="divH">

                <div class="divB">

                	<h5 class="clearfix">业务办理</h5>

                	<div class="con">

						<ul class="button clearfix" style="filter:Gray">

                        	<li class="disable"><a  class="ywbl">业务办理</a></li>

                        	<li class="disable"><a class="print">打印</a></li>

                        	<li class="disable"><a  class="jk">业务监控</a></li>

                        	<li class="disable"><a class="tips">小提示</a></li>

                        	<li class="disable"><a class="imp">公文导入</a></li>

                        	<li class="disable"><a  class="exp">公文导出</a></li>

                        </ul>

                	</div>

                </div>

                <div class="divF"></div>

              </div>

            </div>

            <!--1st End-->

        

        </div>

      <!--Panel_6 End-->	

    	<div class="logo_1"></div>

        <div class="gray_bg">

        	<div class="gray_bg2">

            	<div class="w_bg">

                	<div class="Bottom">

                    	<div class="Top">

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>会议记录</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                  <td class="lableTd t_r" ><div class="red"> *</div>会议标题</td>
                  <td colspan="3">      <input  type="text" style="width:400px" name="title" MaxLength="50"/>
                          </td>
                 
                </tr>
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>开始日期</td>
                  <td colspan="3"><input type="text"  name="startDate" /></td>
                       </tr>
                   <tr>
                  <td class="lableTd t_r">开始时间</td>
                  <td><select name="startTime" class="input_small" ></select></td>
                  <td class="lableTd t_r">结束时间</td>
                  <td><select name="endTime" class="input_small" ></select></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4"><h5 class="fl">会议属性</h5></th>
                    </thead>
                       <tr>
                  <td class="lableTd t_r">会议地点</td>
                  <td><select name="meetingRoom" class="input_large" >
                        
                          </select></td>
                  <td class="lableTd t_r">会议类型</td>
                  <td><select name="meetingType" class="input_large" >
                        
                          </select></td>
  </tr>
     <tr>
                  <td class="lableTd t_r">主持人</td>
                  <td colspan="3"><input  type="text"  class="input_large" name="master" readonly="readonly"/></td>
              
  </tr>
                <tr>
                  <td class="lableTd t_r">出席人员</td>
                     <td colspan="3"><input  type="text"  class="input_large" name="presentMembers" /></td>
                </tr>
                <tr >
                  <td class="lableTd t_r">会议资料及议程上传</td>
                  <td colspan="3">
                                                              
                   <input type="button" id="addIssue" value="增加" />
                    <input type="button" id="delIssues" value="删除所有" />
                    </td>
               
                    
                </tr>
                
                <tr>
                  <td class="lableTd t_r">会议纪要</td>
                  <td colspan="3">
                  <table width="100%" class="table_summary"><thead><tr>
                  <td colspan="5"><input id="upload_meeting" class="upload_button" type="button" value="浏览..." /><input type="button" value="上传"  onclick="$('#upload_meeting').uploadify('upload','*');"><input type="button" value="取消"  onclick="$('#upload_meeting').uploadify('cancel','*');">
                  </td></td></tr><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan="2">操作</td></tr></thead><tbody></tbody>
                  <tfoot><tr><td colspan="5" style="text-align:right;cursor:pointer;color:Blue;border-bottom:0" class="setPermission">设置权限</td></tr></tfoot>
                  </table></td>
                </tr>
               
                
                <tr >
                  <td class="lableTd t_r">备注</td>
                  <td colspan="3"><textarea name="remarks" rows="4" placeholder="（字数最多不超过500字）" MaxLength="500"></textarea></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
                <th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </thead>
                <tr>
                    <td class="lableTd t_r"><div class="red"> *</div>申报人</td>
                  <td colspan="3"><input  type="text" class="input_large" id="applyerName" readonly/><input  type="text" class="input_large" name="applyer" readonly style="display:none"/></td>
                </tr>

                
              </table>
              </form>
            </div>
            <div class="mb10 t_c">
              <input type="button" id="btnSubmit" value="提 交" />
              &nbsp;
              <input type="button" id="btndel" value="返 回" />
              &nbsp;
         
            <div class="footer"></div>
            <div id="dialog-confirm" title="" style="display:none">
                 <p>是否删除</p>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
</div>
</body>
</html>
