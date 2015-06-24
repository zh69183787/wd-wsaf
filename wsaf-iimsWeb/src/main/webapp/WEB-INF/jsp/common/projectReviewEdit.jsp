<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目计划申报</title>
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
<script src="js/jquery.uploadify-3.1.js"></script>
<link rel="stylesheet" href="css/uploadify.css" type="text/css" />
		
	<script src="js/f.projectPlan.js"></script>
	<script src="js/f.defaultJs.js"></script>

	
<script type="text/javascript">
	$(function() {
		$("#upload_photo").uploadify({
			'auto' : false,
		       'method' : "post",
		       'height' : 20,
		       'width' : 100,
		       'swf' : 'js/uploadify.swf', 
		       'uploader' : '<%=basePath%>attach/api/upload?groupName="projectPlan1"',
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
		    		// alert(attach2);		  
		    		if(attach.id!=null)
					$("#tbfj tbody").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td>"+attach.uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");

		    	},
		       
		});
		
		$.getFileInfo = function(firUrl,otherdata,isRead){
			if(firUrl!="")
			   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/attach/api/all?"+otherdata,
						type : 'get',
						success: function(data, status, xhr) {
	
							if (status == "success" && data != null)
							{	
								if (data.success == true) 
								{
									$("#tbfj tbody tr").remove();
									var entry=data.result;
									for ( var item in entry) 
									{
									     
										 $("#tbfj tbody").append("<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+entry[item].id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");

									}
									 $("#tbfj tbody a.del").click(function(){
											$.FileDel2("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"),isPreliminaryPersonnel);
											  $.getFileInfo("${pageContext.request.contextPath}","modelName=projectPlan&modelId="+QueryString.GetValue('id'),true);
													});
								}
							}
						}
				 });
			   }
		}
		
	
		
		$.getAttachId = function()
		{
			
	      var attachId="",_tr=$("#tbfj tbody").find("tr");
	      for ( i = 0; i < _tr.length; i++) 
	  	{
	    	  attachId+=$(_tr[i]).attr("name")+",";
              
	  	}
	      if(attachId!=null||attachId!="")
	      return attachId=attachId.substring(0,attachId.length-1);
	      
	      return attachId;
		}
		
		$.FileDel2 = function(firUrl,_id,isRead){
			
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
		
		$.postMeetingDetail = function(firUrl,id,isread,isPreliminaryPersonnel){
			 if(firUrl!="")
			   {	
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/projectPlan/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
		
								if (status == "success" && data != null)
								{
									if (data.success == true) 
									{
										var entry=data.result,arrTime= new Array();
										
										$("#initiateTime").val(entry.initiateTime);
										$("[name=myhandlerLoginname]").val(entry.handlerLoginname);
										
										arrTime = entry.planStartDate.split("-");
										$("#planStartYear").val(arrTime[0]);
										$("#planStartMon").val(arrTime[1]);
										
										var arrEndTime= new Array();
										arrEndTime = entry.planEndDate.split("-");
										$("#planEndYear").val(arrEndTime[0]);
										$("#planEndYearMon").val(arrEndTime[1]);
										 
										 if(entry.yearTarget=="implementPartOK")
											{
											  $("#yearTargetReason").css("display","block");
											  $("#yearTargetReasonTitle").text("年度推进目标理由").addClass("lableTd t_r");
											}
									
										 if(isPreliminaryPersonnel==true&&entry.status=="meetingReview")
											{
											  $("[name=myhandlerLoginname]").attr("disabled","disabled");
											 
											  
											  $("#btnsave").click(function(){	
													
													 var otherData=$.getOtherData();
								                	
													 if(id!=null)
								                    {
								                		   otherData+="&id="+id;
								                     }
													 var _yanz=$.yanzhen2();
								                       
								                	   if(_yanz!="")
								                		   {
								                		   alert(_yanz+"\r\n请您修改");
								                		   $( this ).dialog( "close" );
								                		   return false;
								                		   }
								                	   
								                	   var d = new Date();
								                	
								                	  var _attachIds=$.getAttachId();

								                	  $.FileSave(firUrl,"projectPlan",id,_attachIds);
								                	  $(this).attr("disabled", true);  
								            
								                	  $.postSave({"url":firUrl,"modname":"projectPlan","formName":"projectPlanForm","otherData":otherData+"&initiateTime="+d.getTime(),"isGetData":true,"isClose":true});
												});
											  
											  $("#btnSubmit").click(function(){	
													
													 var otherData=$.getOtherData();
								                	
													 if(id!=null)
								                    {
								                		   otherData+="&id="+id+"&status=intoStore";
								                     }
								                	   var d = new Date();
								                	   var _yanz=$.yanzhen2();
								                       
								                	   if(_yanz!="")
								                		   {
								                		   alert(_yanz+"\r\n请您修改");
								                		   $( this ).dialog( "close" );
								                		   return false;
								                		   }
								                	   
								                	   otherData+="&handler="+entry.initiator;
								                	   otherData+="&handlerLoginname="+entry.initiatorLoginname;
								                	   otherData+="&initiator="+entry.handler;
								                	   otherData+="&initiatorLoginname="+entry.handlerLoginname;
								                	   
								                	  var _attachIds=$.getAttachId();

									                  $.FileSave(firUrl,"projectPlan",id,_attachIds);
									                  $(this).attr("disabled", true);  
								                	  $.postSave({"url":firUrl,"modname":"projectPlan","formName":"projectPlanForm","otherData":otherData+"&initiateTime="+d.getTime(),"isGetData":true,"isClose":true});
														
								                
												});
											  
											  $("#btndel").click(function(){	
													
												  var _attachIds=$.getAttachId();

								                  $.FileSave(firUrl,"projectPlan",id,_attachIds);
								                      $(this).attr("disabled", true);  
								                	  $.postSave({"url":firUrl,"modname":"projectPlan","formName":"projectPlanForm","otherData":"&id="+id+"&initiateTime="+d.getTime()+"&removed=1","isGetData":false,"isClose":true});
								                
												});
											  
											}
										for ( var item in entry) 
										{
										  try 
										{ 										
											if(item=="resourceRequirement")
											{
												
											var dataObj=jQuery.parseJSON(entry[item]);
								
											for ( var sitem in dataObj) 
											{
												  var dataObj2=jQuery.parseJSON(dataObj[sitem]);
												 
													  switch(sitem) 
										                { 
										                  case "networkResource": 
										                  case "dataResource": 
										                	 var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+sitem+"</div>";
										     		             rs+="<input  type=\"text\" class=\"input_large\" value=\""+dataObj2.reason+"\" style=\"width:500px;margin-right:15px\"/>"+$("#resourceRequirement option[value="+sitem+"]").text()+"</td></tr>";
										     		            $("#"+item).parents("tr").after(rs);
										                   break; 
										                      case "storageResource": 
										                     	  var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+sitem+"</div>";
										       		             rs+="<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" value=\""+dataObj2.num+"\">（G） <input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\" value=\""+dataObj2.reason+"\"/>"+$("#resourceRequirement option[value="+sitem+"]").text()+"</td></tr>";
										       		          $("#"+item).parents("tr").after(rs);
										                     break;
										                      case "virtualServerNumber": 
										                    	  var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+sitem+"</div>";
										      		             rs+="<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" value=\""+dataObj2.num+"\">（台）<input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\" value=\""+dataObj2.reason+"\"/>"+$("#resourceRequirement option[value="+sitem+"]").text()+"</td></tr>";
										      		           $("#"+item).parents("tr").after(rs);
										                    break;                    
													   }
											    }
									
											}
							
										
											if($("[name="+item+"]").length > 0 )
												{	
												$("[name="+item+"]").val(entry[item]);
													
												}
										}
											catch (e) 
											{ 
												alert(e+"错误：");
											}
										}
										if(isread)
											{
									        	$(".cbRequirement").nextAll("input").attr("disabled","disabled").parents("tr").addClass("disable");
											}
									}
							   }
					           }, 
					           error: function() {
					              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
					           }
							});
			   }
		}
		
		$("[name=yearTarget]").change(function(){
			if($("[name=yearTarget] option:selected").val()=="implementPartOK")
			{  
				$("#yearTargetReason").css("display","block");
	            $("#yearTargetReasonTitle").text("年度推进目标理由").addClass("lableTd t_r");
			}
			else
				{
				 $("#yearTargetReason").css("display","none");
				 $("#yearTargetReasonTitle").text("").removeClass("lableTd t_r");
				}
			});
		
		$("#delRequirement").click(function(){
		     var cbRequirement= $(".cbRequirement:checked");
		     
		     for(var i=0; i<cbRequirement.length; i++){    
	 	    	  $(cbRequirement[i]).parents("tr").remove();
	 	      }
		});
		$("#addRequirement").click(function(){
			var _require=$("#resourceRequirement option:selected");
			var cbRequirement= $(".cbRequirement");
	 	     
	 	      for(var i=0; i<cbRequirement.length; i++){    
	 	    	 if($(cbRequirement[i]).next("div").text()==_require.val())
	 	    		 {
	 	    	
	 	    		alert("重复资源需求")
	 	    		return false
	 	    		 }
	 	      }
			if(_require.val()!="")
			{
				switch(_require.val()) 
                { 
                  case "networkResource": 
                		 var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+_require.val()+"</div>";
     		             rs+="<input  type=\"text\" class=\"input_large\" style=\"width:500px;margin-right:15px\" placeholder=\"请描述该项目针对网络方面需要提供的资源需求，并说明用户范围。\"/>"+_require.text()+"</td></tr>";
          			 $(this).parents("tr").after(rs);
                   break; 
                  case "dataResource": 
                	 var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+_require.val()+"</div>";
     		             rs+="<input  type=\"text\" class=\"input_large\" style=\"width:500px;margin-right:15px\" placeholder=\"请描述该项目针对数据中心方面需要提供的资源需求。\"/>"+_require.text()+"</td></tr>";
          			 $(this).parents("tr").after(rs);
                   break; 
                      case "storageResource": 
                     	  var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+_require.val()+"</div>";
       		             rs+="<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\">（G） <input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\"/>"+_require.text()+"</td></tr>";
            			 $(this).parents("tr").after(rs);
                     break;
                      case "virtualServerNumber": 
                    	  var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+_require.val()+"</div>";
      		             rs+="<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\">（台）<input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\"/>"+_require.text()+"</td></tr>";
           			 $(this).parents("tr").after(rs);
                    break;                    
                 }			
			}
		});
		
		$.getMenu({"url":"${pageContext.request.contextPath}","modName":"projectPlan"});
		QueryString.Initial();
		if(QueryString.GetValue('id')!=null)
		{
			var isPreliminaryPersonnel= $.isPreliminaryPersonnel("${pageContext.request.contextPath}");
			
		  $.postMeetingDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'),false,isPreliminaryPersonnel);
		  $.getSuggestInDept("${pageContext.request.contextPath}",QueryString.GetValue('id'));
		  $.getFileInfo("${pageContext.request.contextPath}","modelName=projectPlan&modelId="+QueryString.GetValue('id'),true);
			
		 
		}
	});
		</script>
</head>

<body class="Flow">
 <div id="bt" class="transparent" style="display:none"></div>

    <div class="f_window" style="display:none">

   	  <h3 class="clearfix mb10"><span class="fl">业务办理</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="con">

        	<table width="100%" border="0" cellspacing="0" cellpadding="0">

              <tr>

                <td class="td_1" colspan="2">业务栏</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td ><div class="red"> *</div>审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>

              </tr>
            
              <tr >

                <td class="td_1">&nbsp;</td>

                <td><div class="red"> *</div>意见</td>

              </tr>

              <tr id="mysug">

                <td class="td_1">&nbsp;</td>

                <td><textarea  name="suggestion2" rows="4" placeholder="请输入意见" ></textarea></td>

              </tr>
             
              <tr>

                <td class="td_1" colspan="2">操作栏</td>

              
              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><textarea   rows="2" id="nextDo" disabled></textarea></td>

              </tr>

              
            </table>

      </div>

      <div class="button t_c">

        	<input type="button" id="btnSubmit2" value="提交审核" />

&nbsp;



        </div>

    </div>

    <!--Transparent End-->
    
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

						<ul class="button clearfix">

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

            <h1 class="t_c">上海申通地铁集团有限公司<br>
              项目计划申报表</h1>
           
            <div class="mb10">
            <form id="projectPlanForm">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                  <td class="lableTd t_r" ><div class="red"> *</div>年度</td>
                  <td>      <select name="year" class="input_large" >
                         </select>
                          </td>
                  <td class="lableTd t_r">项目类别</td>
                  <td><select  name="projectType"  class="input_large" >
                    </select></td>
                </tr>
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>项目名称</td>
                  <td><input  type="text" class="input_large" name="projectName" /></td>
                  <td class="lableTd t_r"><div class="red"> *</div>总投资估算</td>
                  <td><input  type="text" class="input_small" name="totalInvestEstimate" onkeyup= "checknum(this);" onafterpaste="checknum(this);"/>&nbsp;&nbsp;万元</td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4"><h5 class="fl">项目属性</h5></th>
                    </thead>
                       <tr>
                  <td class="lableTd t_r">资金计划/一季</td>
                  <td><input  type="text" class="input_small" name="fundPlan1" onkeyup= "checknum(this);" onafterpaste="checknum(this);"/>&nbsp;&nbsp;万元</td>
                  <td class="lableTd t_r">资金计划/二季</td>
                  <td><input  type="text" class="input_small" name="fundPlan2" onkeyup= "checknum(this);" onafterpaste="checknum(this);"/>&nbsp;&nbsp;万元</td>
  </tr>
     <tr>
                  <td class="lableTd t_r">资金计划/三季</td>
                  <td><input  type="text" class="input_small" name="fundPlan3" onkeyup= "checknum(this);" onafterpaste="checknum(this);"/>&nbsp;&nbsp;万元</td>
                  <td class="lableTd t_r">资金计划/四季</td>
                  <td><input  type="text" class="input_small" name="fundPlan4" onkeyup= "checknum(this);" onafterpaste="checknum(this);"/>&nbsp;&nbsp;万元</td>
  </tr>
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>项目概述</td>
                  <td colspan="3"><textarea  name="mainContent" rows="4" placeholder="请输入项目目标,实施范围,主要功能,技术性能指标（字数最少不少于50字，最多不超过500字）" ></textarea></td>
                </tr>
                <tr >
                  <td class="lableTd t_r">年度推进目标</td>
                  <td >
                  <select  name="yearTarget" >
                
                    </select>
                    </td>
               
                   <td id="yearTargetReasonTitle"></td><td><input  type="text" class="input_large" name="yearTargetReason" id="yearTargetReason" style="display:none" />
                  </td>
               
                </tr>
                
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>安全等级保护级别</td>
                  <td colspan="3"><select name="securityLevel" class="input_large" >
                  
                    </select></td>
                </tr>
                <tr >
                  <td class="lableTd t_r">信息化资源需求</td>
                  <td colspan="3">
                  <select id="resourceRequirement" name="myresourceRequirement" class="input_large"  >
                    </select>
                      <input type="button" id=addRequirement value="增加" />
                    <input type="button" id=delRequirement value="删除" />
                    </td>
                </tr>
                <tr >
                  <td class="lableTd t_r"><div class="red"> *</div>计划开工时间</td>
                  <td><input type="number" id="planStartYear"  min="1990" max="2020" class="input_tiny" step="1" style="height:23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;年&nbsp;<input type="number" id="planStartMon" class="input_tiny" min="0" max="12" step="1" style="height:23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;月</td>
                  <td class="lableTd t_r"><div class="red"> *</div>计划完工时间</td>
                  <td><input type="number" id="planEndYear"  min="1990" max="2020" class="input_tiny" step="1" style="height:23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;年&nbsp;<input type="number" id="planEndYearMon" class="input_tiny" min="0" max="12" step="1" style="height:23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;月</td>
                </tr>
                
                <tr >
                  <td class="lableTd t_r"  >备注</td>
                  <td colspan="3"><textarea name="remarks" rows="4" placeholder="（字数最多不超过500字）"></textarea></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
                <th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </thead>
                <tr>
                  <td class="lableTd t_r">申报单位</td>
                  <td><input  type="text" class="input_large" name="reportUnit" readonly/><input  type="text" class="input_large" name="reportUnitId" readonly style="display:none"/></td>
                  <td class="lableTd t_r"><div class="red"> *</div>申报人</td>
                  <td><input  type="text" class="input_large" name="applyer" readonly/><input  type="text" class="input_large" name="applyerLoginname" readonly style="display:none"/></td>
                </tr>
                <tr>
                  <td class="lableTd t_r">项目状态</td>
                  <td >
                   <select name="projectStatus" class="input_large"  disabled>
         <option value="inDept">部门内部申报</option>
                      
                    </select>
                  </td>
                  <td class="lableTd t_r">操作时间</td>
                  <td ><input  type="text" class="input_large" id="initiateTime" readonly/></td>
                </tr>
                  <tr class="disable">
                  <td class="lableTd t_r" >当前审核人</td>
                  <td colspan="3">
                   <select name="myhandlerLoginname" class="input_large"  >
                      <option value="G002000000332549">胡波</option>
                      
                    </select>
        
                  </td>
                </tr>
              </table>
             
                
                   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
            
                  <th colspan="4" ><h5 class="fl">会议评审信息</h5></th>
                  </thead>
                  <tbody>
                  <tr>
                  <td class="lableTd t_r"  >业务类别</td>
                  <td > <select name="businessType" class="input_large"  >
                  </select></td>
                  <td class="lableTd t_r"  >业务层级</td>
                  <td ><select name="businessLevel" class="input_large"  >
                  </select></td>
                  </tr>
                  <tr >
                  <td class="lableTd t_r" >实施内容</td>
                  <td >
                   <input  type="text" class="input_large" name="implementContent" />
                  </td>
                  <td class="lableTd t_r">建议实施主体</td>
                  <td ><select name="suggestImplementDept" class="input_large"  >
                    </select></td>
                  </tr>
                  <tr>
                  <td class="lableTd t_r" >建议费用类别</td>
                  <td >
                  <select name="suggestCostType" class="input_large"  >
                    </select>
        
                  </td>
                   <td class="lableTd t_r" >建议费用性质</td>
                  <td >
                  <select name="suggestCostProperty" class="input_large"  >
                    </select>
        
                  </td>
                </tr>
                <tr>
                  <td class="lableTd t_r" >添加附件</td>
                  <td colspan="3">
                 <input id="upload_photo" class="upload_button" type="button" value="本地上传" />
               	 <input type="button" value="上传"  onclick="$('#upload_photo').uploadify('upload','*');">
                 <input type="button" value="取消"  onclick="$('#upload_photo').uploadify('cancel','*');">
                  </td>
                 
                </tr>
                     <tr>
                  <td class="lableTd t_r" ></td>
                  <td colspan="3">
                  <table width="100%" id="tbfj">
                <thead><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan="2">操作</td></tr></thead>
                <tbody> </tbody>
                  
                    
                  </table>
                
                  </td>
                 
                </tr>
                </tbody>
                </table>
                
               <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="leaderSuggest" >
                           	    <thead>
                       	          <th> <h5 class="fl">审批信息</h5>
                                 </th>
                         	   </thead>
                         	   <tbody>
                       	        <tr><td></td></tr>
                                      </tbody>
                                    </table>
                                  
              </form>
            </div>
           <div class="mb10 t_c">
             
              <input type="button"  id="btnsave" value="保存" />
              &nbsp;  <input type="button" id="btnSubmit" value="提 交" />
              &nbsp;
              <input type="button" id="btndel" value="删 除" />
              &nbsp;</div>
            
            <div class="footer"></div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>


