<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>VPN申请/注销审批办理表</title>
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
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	
	<script src="js/html5.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.formalize.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/vpn.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
	<script type="text/javascript">
		$(function() {
		$(".closewindow").click(function(){
			$(".f_window").css("display","none");
			$("#bt").css("display","none");
		});
		$(".print").click(function(){
			$(":disabled").each(function(){
				//$(this).attr("disabled",false);
				$(this).removeAttr("disabled");
				$(this).addClass("disabled");
				
			});
			$(".Divab1").hide();
			$("#leaderSuggest").hide();
			window.print();
			$(".Divab1").show();
			$("#leaderSuggest").show();
			$(".disabled").each(function(){
				$(this).attr("disabled",true);
				$(this).removeClass("disabled");
				
			});

		});	
		$.getFileInfo = function(firUrl,otherdata,isRead){
			if(firUrl!="")
			   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/attach/api/all?"+otherdata,
						type : 'get',
						dataType : 'json',
						success: function(data, status, xhr) {
	
							if (status == "success" && data != null)
							{	
								if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
								{
									$("#tbfj tbody tr").remove();
									var entry=data.result;
									for ( var item in entry) 
									{
									     
										 $("#tbfj tbody").append("<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"
												 +entry[item].fileSize+"</td><td>"+entry[item].uploadDate+
												 "</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+entry[item].id+
												 "\">下载</a></td></tr>");

									}
									 $("#tbfj tbody a.del").click(function(){
											$.FileDel("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"));
											$.getFileInfo("${pageContext.request.contextPath}","modelName=vpnResource&modelId="+QueryString.GetValue('id'),true);
									});
								}
							}
						}
				 });
			   }
		};
		var isleader= $.isleader("${pageContext.request.contextPath}");
         
         
			QueryString.Initial();
			
			
			$.postResourceManageDetail = function(firUrl,id,isread,isPreliminaryPersonnel){
			
			 if(firUrl!="")
			   {	
								
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/vpnResource/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
								if (status == "success" && data != null)
								{
									if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
									{
										var entry=data.result;
										if(entry.status=="waitForImplement"){
									         		$("#btnSubmit").val("提交");
									         }
										
											else if(isleader=="不是领导"){
									         	$("#btnSubmit").css("display","none");
									         }else if(isleader=="本部门领导"){
									         	if(entry.status=="infoDeptApproval"){
									         		$("#btnSubmit").css("display","none");
									         	}else if(entry.status=="innerApproval"){
									         		$("#btnSubmit").css("display","");
									         		$(".ywbl").parent("li").removeClass("disable").css("cursor","pointer");
											  		$(".ywbl").css("background-image","url(css/default/images/icon_1.png)");
													$(".ywbl").parent("li").click(function(){
													$("[name=suggestion]").val("");
														$("#bt").height($(document).height());
												   	 	$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
												    	$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
														$(".f_window").css("display","block");
														$("#bt").css("display","block");
													});
									         	}
									         }else if(isleader=="信息管理中心方政"){
									         	if(entry.status=="selfDealWith"){
									         		$("#btnSubmit").val("提交");
									         	}else if(entry.status=="infoDeptApproval"||entry.status=="serviceDeptBack"){
									         		$("#btnSubmit").css("display","");
									         		$(".ywbl").parent("li").removeClass("disable").css("cursor","pointer");
											  		$(".ywbl").css("background-image","url(css/default/images/icon_1.png)");
													$(".ywbl").parent("li").click(function(){
													$("[name=suggestion]").val("");
														$("#bt").height($(document).height());
												   	 	$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
												    	$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
														$(".f_window").css("display","block");
														$("#bt").css("display","block");
													});
									         	}else if(entry.status=="turnBack"||entry.status=="serviceDeptApproval"||entry.status=="finish"||entry.status=="innerApproval"){//entry.status=="serviceDeptApproval"||
									         		$("#btnSubmit").css("display","none");
									         	}
									         }else if(isleader=="江啸栋"&&entry.status=="serviceDeptApproval"){
									         		$("#btnSubmit").css("display","");
									         		$(".ywbl").parent("li").removeClass("disable").css("cursor","pointer");
											  		$(".ywbl").css("background-image","url(css/default/images/icon_1.png)");
													$(".ywbl").parent("li").click(function(){
													$("[name=suggestion]").val("");
														$("#bt").height($(document).height());
												   	 	$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
												    	$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
														$(".f_window").css("display","block");
														$("#bt").css("display","block");
													});
									         }
									         
									         else{
									         	$("#btnSubmit").css("display","none");
									         }
									         
									          $("#btnSubmit").click(function(){
									          $("[name=suggestion]").val("");
									          if(entry.status=="waitForImplement"){
												var otherData="";
				                	   			if(QueryString.GetValue('id')!=null)
				                		  		{
				                		   			otherData+="&id="+QueryString.GetValue('id')+"&status=finish";
				                		   		}
				                		   		var _yanz=$.yanzhen2();
				                		   		
				                		   		if(_yanz!="")
						                		 {
						                		   alert(_yanz+"\r\n请修改");
						                		   $( this ).dialog( "close" );
						                		   return false;
						                		 }
												$.postsave(firUrl,"projectPlanForm",otherData);
												window.close();
												location.href = Url
														+ "/vpnResource/vpnList";
											}else if(entry.status=="selfDealWith"){
											    var otherData="";
				                	   			if(QueryString.GetValue('id')!=null)
				                		  		{
				                		   			otherData+="&id="+QueryString.GetValue('id')+"&status=finish";
				                		   		}
				                		   		var _yanz=$.yanzhen2();
				                		   		
				                		   		if(_yanz!="")
						                		 {
						                		   alert(_yanz+"\r\n请修改");
						                		   $( this ).dialog( "close" );
						                		   return false;
						                		 }
				                		   		
												$.postsave(firUrl,"projectPlanForm",otherData);
												window.close();
												location.href = Url
														+ "/vpnResource/vpnList";
											
											}else{
											   $("#bt").height($(document).height());
											    $(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
											    $(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
												$(".f_window").css("display","block");
												$("#bt").css("display","block");
											}
								         });
									         
									      
									         
						if(entry.status=="waitForImplement"||entry.status=="selfDealWith"){
								var item="";	         	
	          					item="<table width='100%' border='0' cellspacing='0' cellpadding='0' class='table_2' id='applyInfo'>";
                				item+="<thead>";
                				item+="<th colspan='4'><h5 class='fl'>开通办理情况</h5></th>";
                				item+="</thead>";
                				item+="<tr>";
                				item+="<td class='lableTd t_r'><div class='red'> *</div>办理工程师</td>";
                    			item+="<td> <input  type='text' class='input_large' name='implementEngineer' /></td>";
                   				item+="<td class='lableTd t_r'><div class='red'> *</div>办理时间</td>";
                  				item+="<td ><input type='text'  name='implementTime'   class='input_large'/></td></tr>";
                 				item+="<tr>";
                				item+="<td class='lableTd t_r'><div class='red'> *</div>vpn账户</td>";
                    			item+="<td> <input  type='text' class='input_large' name='accountName' /></td>";
                    			item+="<td class='lableTd t_r'><div class='red'> *</div>用户</td>";
                    			item+="<td> <input  type='text' class='input_large' name='implementUser' /></td>";
               				    item+="</tr>";
               				    
               				 	item+="<tr>";
                 				item+="<td class='lableTd t_r'><div class='red'> *</div>访问权限</td>";
                 				item+="<td> <input  type='text' class='input_large' name='permissions' /></td>";
                 				item+="<td class='lableTd t_r'><div class='red'> *</div>职务</td>";
                 				item+="<td> <input  type='text' class='input_large' name='post' /></td>";
            				    item+="</tr>";
            				    
            				    item+="<tr>";
             					item+="<td class='lableTd t_r'><div class='red'> *</div>用户组</td>";
                 				item+="<td> <input  type='text' class='input_large' name='userGroup' /></td>";
            				    item+="</tr>";
               				    
               				    
               				 	item+="<tr>";
             					item+="<td class='lableTd t_r'><div class='red'> *</div>开通情况</td>";
                 				item+="<td colspan='3'><textarea  rows='4'  name='remarks' style='margin-top:0px;margin-bottom:0px;height:89px;'></textarea></td>";
            					item+="</tr>";
                				//item+="<tr>";
                				//item+="<td class='lableTd t_r'><div class='red'> *</div>提示</td>";
                    			//item+="<td> <input  type='button' class='input_large' name='projectName' value='请录入台账' /></td>";
               					//item+="</tr>";
               					//item+="</table>";
               					
               					$("#applyInfo").after(item);
									$( "[name=implementTime]" ).datepicker({ dateFormat:"yy-mm-dd"});         
							}
							
							
							if(entry.status=="finish"){
								var item="";	         	
	          					item="<table width='100%' border='0' cellspacing='0' cellpadding='0' class='table_2' id='applyInfo'>";
                				item+="<thead>";
                				item+="<th colspan='4'><h5 class='fl'>开通办理情况</h5></th>";
                				item+="</thead>";
                				item+="<tr>";
                				item+="<td class='lableTd t_r'><div class='red'> *</div>办理工程师</td>";
                    			item+="<td> <input disabled type='text' class='input_large' name='implementEngineer' /></td>";
                   				item+="<td class='lableTd t_r'><div class='red'> *</div>办理时间</td>";
                  				item+="<td ><input disabled type='text'  name='implementTime'   class='input_large'/></td></tr>";
                 				item+="<tr>";
                				item+="<td class='lableTd t_r'><div class='red'> *</div>vpn账户</td>";
                    			item+="<td> <input  disabled type='text' class='input_large' name='accountName' /></td>";
                    			item+="<td class='lableTd t_r'><div class='red'> *</div>用户</td>";
                    			item+="<td> <input disabled type='text' class='input_large' name='implementUser' /></td>";
               				    item+="</tr>";
               				    
               				 	item+="<tr>";
              					item+="<td class='lableTd t_r'><div class='red'> *</div>访问权限</td>";
              					item+="<td> <input disabled  type='text' class='input_large' name='permissions' /></td>";
              					item+="<td class='lableTd t_r'><div class='red'> *</div>职务</td>";
              					item+="<td> <input disabled  type='text' class='input_large' name='post' /></td>";
         				    	item+="</tr>";
         				    
         				    	item+="<tr>";
          						item+="<td class='lableTd t_r'><div class='red'> *</div>用户组</td>";
              					item+="<td> <input disabled  type='text' class='input_large' name='userGroup' /></td>";
         				    	item+="</tr>";
               				    
               				 	item+="<tr>";
             					item+="<td class='lableTd t_r'><div class='red'> *</div>开通情况</td>";
                 				item+="<td colspan='3'><textarea disabled rows='4'  name='remarks' style='margin-top:0px;margin-bottom:0px;height:89px;'></textarea></td>";
            					item+="</tr>";
                				//item+="<tr>";
                				//item+="<td class='lableTd t_r'><div class='red'> *</div>提示</td>";
                    			//item+="<td> <input  disabled type='button' class='input_large' name='projectName' value='请录入台账' /></td>";
               					//item+="</tr>";
               					item+="</table>";
               					
               					$("#applyInfo").after(item);
								$( "[name=implementTime]" ).datepicker({ dateFormat:"yy-mm-dd"});	         
							}
							
									         
									         
										
											var _str3="";
											  $("[name=btnISPass]").click(function(){
													var _str="",_str2="";
													switch($("input[name=btnISPass]:checked").val())
													{
													case"pass":
														_str="通过。";
															switch(entry.status)
														{
															case"innerApproval":
															_str2="提交到信息中心审核";
															break;
															case"infoDeptApproval":
															case"serviceDeptBack":
															_str2="提交至维保中心审核或自行处理";
															break;
															case"serviceDeptApproval":
																_str2="待实施";
																break;
															case"waitForImplement":
																_str2="处理完毕";
																break;
															case"selfDealWith":
																_str2="处理完毕";
																break;
														}
														
														
															if(entry.status=="innerApproval")
															{	
														     // var _str3="<tr class=\"reviewPerson\"><td colspan=\"2\">审核人</td></tr><tr class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" name=\"cbReview\" value=\"G001000002232549\"/>&nbsp;黄天印</td></tr>";
													         //	_str3+="<tr  class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" value=\"G020001000492549\" name=\"cbReview\"/>&nbsp;金涛</td></tr><tr  class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td>";
														        
														        // $("#mysug").after(_str3);
														        
															}
															if(entry.status=="infoDeptApproval")
															{	
														      
														     if(_str3==""){
														      _str3+="<tr name=\"caozuo\" class=\"reviewPerson\"><td colspan=\"2\">下一步操作</td></tr><tr name=\"caozuo\" class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" name=\"cbReview\" value=\"serviceDeptApproval\"/>&nbsp;给维保公司处理</td></tr>";
														      _str3+="<tr name=\"caozuo\" class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td><td><input type=\"radio\" value=\"selfDealWith\" name=\"cbReview\"/>&nbsp;自行处理</td></tr><tr  class=\"reviewPerson\"> <td class=\"td_1\">&nbsp;</td>";
														         $("#mysug").after(_str3);
													         }
													         $("[name=caozuo]").css("display","");
													         if($("[name=cbReview]").val()==""){
													         	alert("请选择一种操作");
													         }
													         
														}if(entry.status=="serviceDeptApproval"){
															
														}
														
														
														$("#btnSubmit2").val("提交审核");
														break;
														
													case"notPass":
														_str="不通过。";
															switch(entry.status)
															{
															
																case"innerApproval":
																case"infoDeptApproval":
																case"serviceDeptBack":
																_str2="返回申报人修改";
																break;
																case"serviceDeptApproval":
																_str2="退回至信息中心审核";
																break;
																
															}
															$("[name=caozuo]").css("display","none");
															
														
														
														
														$("#btnSubmit2").val("返回修改");
														break;
													
													}
												  $("[name=suggestion]").val(_str);
												  $("#nextDo").val(_str2);
												  
												});
											  
											  $("#btnSubmit2").click(function(){
												if($("input[name=btnISPass]:checked").val()=="pass")
										         {
													 var otherData="",isReviewPersonnel=$.isReviewPersonnel("${pageContext.request.contextPath}");
													var d = new Date();
													 
													
													 
														if(entry.status=="innerApproval")
														  {		
														 otherData+="&id="+QueryString.GetValue('id')+"&initiator="+$("[name=handler]").val()+"&initiatorLoginname="+entry.handlerLoginname+"&handler=方政&handlerLoginname=G010070003832549&status=infoDeptApproval";
														otherData+="&suggestion="+$("[name=suggestion]").val();
															
														}
														else if(entry.status=="infoDeptApproval")
														  {		
													    	var caozuo="",cbReview=$("input[name=cbReview]:checked");
								                		
														    if(cbReview.length<=0)
														   {
															alert("至少选择一个操作");
															return false;
														   }
														   switch(cbReview.val())
															{
															case "serviceDeptApproval":
																caozuo="待维保公司审核";
																break;
															case "selfDealWith":
																caozuo="自行处理";
																break;	
															}
														
															if(cbReview.val()=="serviceDeptApproval"){
																otherData+="&id="+QueryString.GetValue('id')+"&initiator=方政&initiatorLoginname=G010070003832549&handler=江啸栋&handlerLoginname=G080050014192549&status=serviceDeptApproval";
																otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
															}else{
																otherData+="&id="+QueryString.GetValue('id')+"&initiator=方政&initiatorLoginname=G010070003832549&handler=方政&handlerLoginname=G010070003832549&status=selfDealWith";
																otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
															}
														}
														else if(entry.status=="serviceDeptBack")
														  {		
														 otherData+="&id="+QueryString.GetValue('id')+"&initiator=胡波&initiatorLoginname=G002000000332549&handler=&handlerLoginname=&status=innerApproval";
														 otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
														}else if(entry.status=="serviceDeptApproval")
														  {		
														 otherData+="&id="+QueryString.GetValue('id')+$.getPerson("${pageContext.request.contextPath}")+"&handler=&handlerLoginname=&status=waitForImplement";
														 otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
														}
														else if(entry.status=="selfDealWith")
														{
															
														 otherData+="&id="+QueryString.GetValue('id')+"&initiator=方政&initiatorLoginname=G010070003832549&handler=&handlerLoginname=&status=finish";
														 otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
														}
														
														else if(entry.status=="waitForImplement"){
														 otherData+="&id="+QueryString.GetValue('id')+$.getPerson("${pageContext.request.contextPath}")+"&handler=&handlerLoginname=&status=finish";
														 otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
														}
															if($("[name=suggestion]").val().length>50){
															alert("输入意见超过50个字");
															return false;
														}
														$(this).attr("disabled", true);
													//alert(otherData);
								                	$.postsave(firUrl,"projectPlanForm",otherData);
								                	window.close();
													location.href = Url
															+ "/vpnResource/vpnList";
								                	 //var d = new Date($("[name=applyTime]").val());
								                	  //$.postsave(firUrl,"projectPlanForm",otherData+"&applyTime="+d.getTime()+"&suggestion="+$("[name=suggestion]").val());
	
										         }       	 
												else if($("input[name=btnISPass]:checked").val()=="notPass")
													{
													 var otherData="",isleader=$.isleader("${pageContext.request.contextPath}");
													 var d = new Date();
													 
													 
													  if(isleader=="本部门领导")
														{
															var data=$.getPerson(firUrl);
															otherData+=data+"&handler="+entry.applyer+"&handlerLoginname="+entry.applyerLoginname+"&status=innerTurnBack";
														}else if(isleader=="信息管理中心方政"){
															otherData+="&initiator=方政&initiatorLoginname=G010070003832549&handler="+entry.applyer+"&handlerLoginname="+entry.applyerLoginname+"&status=turnBack";
														}else if(isleader=="江啸栋"){
															otherData+=$.getPerson("${pageContext.request.contextPath}")+"&handler="+entry.applyer+"&handlerLoginname="+entry.applyerLoginname+"&status=serviceDeptBack";
														}
													 
													
													 
								                	   if(QueryString.GetValue('id')!=null)
								                		   {
								                		   otherData+="&id="+QueryString.GetValue('id')+"&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
								                		   }
								                		   	if($("[name=suggestion]").val().length>50){
															alert("输入意见超过50个字");
															return false;
														}
														$(this).attr("disabled", true);
								                	  //alert(otherData);
								                	  $.postsave(firUrl,"projectPlanForm",otherData);
								                	  window.close();
														location.href = Url
																+ "/vpnResource/vpnList";
								                	  
								                	  
													}
											
												else 
													{
													alert("请选择是否通过");
													}
										         });   
											  
											
										 
										for ( var item in entry) 
										{
										  try 
										{ 										
										      
											if($("[name="+item+"]").length > 0 )
												{	
												    if(item=="applyTime"||item=="initiateTime"||item=="implementTime"){
												       
												       $("[name="+item+"]").val(entry[item].substring(0,10));
												    }else{
												    	$("[name="+item+"]").val(entry[item]);
													}
												}else if($("[name=implementTime]").val()!=null){
												    	$("[name=implementTime]").val(entry[implementTime].substring(0,10));
												    
												    }
										}
											catch (e) 
											{ 
												//alert(e);
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
		};
		 
		  $("#closebtn1").click(function(){
				 window.open(' ','_self').close();

			});
			$("#closebtn").click(function(){
				 window.open(' ','_self').close();

			});
			var isPreliminaryPersonnel= $.isPreliminaryPersonnel("${pageContext.request.contextPath}");
			$.getListDetail("${pageContext.request.contextPath}");
			$.postResourceManageDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'),true,isPreliminaryPersonnel);
			$.getSuggestInDept("${pageContext.request.contextPath}",QueryString.GetValue('id')); 
			$.getFileInfo("${pageContext.request.contextPath}","modelName=vpnResource&modelId="+QueryString.GetValue('id'),true);
		});
		
	</script>
    <style type="text/css">
		#sty{
			margin-left:300px;
		}
		#sty{
			margin-top:30px;
		}
		.taizhang{
			margin-left:500px;
		}
    </style>

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

                <td ><div class="red"> *</div>审核意见：<input readonly name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input readonly name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><div class="red"> *</div>意见</td>

              </tr>

              <tr id="mysug">

                <td class="td_1">&nbsp;</td>

                <td><textarea  name="suggestion" rows="4" placeholder="请输入意见" ></textarea></td>

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

        	<input readonly type="button" id="btnSubmit2" value="提交审核" />



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

                <div class="more_4"><a  title="更多">更多</a></div>

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
                        	
                        	<li class="disable"><a  class="bat" href="/iims/vpnResource/vpnList">批量审核</a></li>

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

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>VPN申请/注销审批办理表</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>使用人姓名</td>
                    <td> <input  disabled type="text" class="input_large" name="userName" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>申请/注销</td>
                    <td >
                    		<select disabled name="applyType" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="apply" >申请</option>
                      <option value="cancel" >注销</option>
                      
                    </select>
                     </td>
                </tr>
               
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>申请业务类型</td>
                  <td> 
                  	<select disabled name="applyBusinessType" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="vpnForInnerNet" >集团管理网络VPN账户，访问集团内部网络</option>
                      <option value="vpnForPublishSite" >上海地铁官方网站VPN账户，访问网站发布系统</option>
                      <option value="other" >其它</option>
                    </select>
                  </td>
                   <td class="lableTd t_r"><div class="red"> *</div>联系电话</td>
                  <td ><input  disabled type="text" class="input_large" name="contactPhone" /></td>    
                </tr>
              
               <tr>
                  
                  <td class="lableTd t_r"><div class="red"> *</div>申请使用时间</td>
                  <td ><input disabled type="text" id="date" name="applyUseTime"   class="input_large"/></td>  
                  
                      
                </tr>
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>业务申请原因</td>
                  	<td colspan="3"><textarea disabled rows="4"  name="applyReason" 
                  	 style="margin-top:0px;margin-bottom:0px;height:180px;"></textarea>
                  	 </td> 
                </tr>
                <tr>
                  <td class="lableTd t_r" >附件信息</td>
                  <td colspan="3">
                  <table width="100%" id="tbfj">
                <thead><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan="2">操作</td></tr></thead>
                <tbody> </tbody>
                  
                    
                  </table>
                
                  </td>
                 
                </tr>
              </table>
             
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
                <th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </thead>
                <tr>
                  <td class="lableTd t_r" ><div class="red"> *</div>申报单位</td>
                  <td>      <input  disabled type="text" class="input_large" name="applyDept" />
                          </td>
                  <td class="lableTd t_r"><div class="red"> *</div>申报人</td>
                  <td> <input  disabled type="text" class="input_large" name="applyer" />
                  		<input type="hidden" name="applyerLoginname" />
                  		<input type="hidden" name="applyDeptId">
                  		<input type="hidden" name="initiateTime">
                  </td>
                </tr>
                <tr>
                <td class="lableTd t_r"><div class="red"> *</div>当前审核领导</td>
                  	<td>
                    <input type="text" disabled name="handler" class="input_large"  >
                      
                      
                    
                  </td>
                 <!--  
                  <td class="lableTd t_r"><div class="red"> *</div>申请状态</td>
                  <td >
                  	<select name="status" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="draft" >草稿</option>
                      <option value="innerApproval" >待内部审核</option>
                      <option value="infoDeptApproval" >待信息中心审核</option>
                      <option value="serviceDeptApproval" >待维保公司审核</option>
                      <option value="serviceDeptBack" >维保公司退回</option>
                      <option value="waitForImplement" >待实施</option>
                      <option value="selfDealWith" >自行处理</option>
                      <option value="finish" >处理完毕</option>
                      <option value="turnBack" >退回</option>
                    </select>
                  </td>
                  -->
                  <td class="lableTd t_r"><div class="red"> *</div>填报时间</td>
                  <td ><input disabled type="text" name="applyTime" class="input_large"  />
                  	</td>
                  

                </tr>

                
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
             <input  type="button"  id="btnSubmit" value="审 核" />
              &nbsp; 
            
              <input  type="button" id="closebtn1" value="关 闭" />
              &nbsp; </div>
              
            <div class="footer"></div>
            <div id="dialog-confirm" title="" style="display:none">
                 <p>是否删除</p>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>
