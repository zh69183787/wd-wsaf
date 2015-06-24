<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>特定互联网申请/注销审批办理表</title>
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
	<script src="js/internetAccess.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
	<script type="text/javascript">
		$(function() {
		$(function() {
	           	    $( "[name=applyUseTime]" ).datepicker({ dateFormat:"yy-mm-dd"});
				  });
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
         
         
	         
	       
			QueryString.Initial();
			
			$("#upload").uploadify({
		         'auto' : false,
		            'method' : "post",
		            'height' : 20,
		            'width' : 100,
		            'swf' : 'js/uploadify.swf', 
		            'uploader' : '<%=basePath%>attach/api/upload?groupName="internetResource"',
		          'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',     //描述
		            'fileTypeExts' : '*.txt;*.xls;*.xlsx;*.doc;*.docx;*.rar;*.zip;*.jpg;*.png;*.pdf',         //文件类型
		            'fileSizeLimit' : '30000KB',          //文件大小
		            'buttonText' : '选择文件',         //按钮名称
		            'fileObjName' :'uploadify',
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
		             if(attach.id!=null){
		                 $("#tbfj tbody").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td>"+attach.uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");
		         	   }
		             $("#tbfj tbody a.del").click(function(){
								$.FileDel("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"));
								$.getFileInfo("${pageContext.request.contextPath}","modelName=internetResource&modelId="+QueryString.GetValue('id'),true);
						});
		         },
		            
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
											$("#tbfj tbody tr").remove();
										if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
										{
											var entry=data.result;
											for ( var item in entry) 
											{
											     
												 $("#tbfj tbody").append("<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"
														 +entry[item].fileSize+"</td><td>"+entry[item].uploadDate+
														 "</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+entry[item].id+
														 "\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");

											}
											 $("#tbfj tbody a.del").click(function(){
													$.FileDel("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"));
													$.getFileInfo("${pageContext.request.contextPath}","modelName=internetResource&modelId="+QueryString.GetValue('id'),true);
											});
										}
									}
								}
						 });
					   }
				};
				
				$.getAttachId = function(){
		    		var attachId="",_tr=$("#tbfj tbody").find("tr");
		   		 for (var i = 0; i < _tr.length; i++){
		  	  		attachId+=$(_tr[i]).attr("name")+",";
				}
		   		 if(attachId!=null||attachId!=""){
		    		return attachId=attachId.substring(0,attachId.length-1);
				}else{
		    		return attachId;
				}
			};
			
			$.FileSave = function(firUrl,modelName,_id,_attachIds){
		        if(firUrl!="")
		             { 
		          
		          $.ajax({
		                async: false,
		                  url : firUrl+"/attach/api/bind",
		                  type : 'post',
		                  data: "&modelName="+modelName+"&modelId="+_id+"&attachIds="+_attachIds,
		                  success: function(data, status, xhr) {
		                  },
		                 error:function(XMLHttpRequest, textStatus, errorThrown){
		                 //alert(XMLHttpRequest+"save失败");
		                 }
		                 });
		             }
		      };

			
			$.FileDel = function(firUrl,_id){
				if(firUrl!="")
				   {	
					 $.ajax({
						   async: false,
						    url : firUrl+"/attach/api/del/"+_id,
						    dataType:"json",
							type:"post",
							success: function(data, status, xhr) {

								alert("删除成功");
							}
					 });
				   }
			};
			$.postResourceManageDetail = function(firUrl,id,isread,isPreliminaryPersonnel){
			
			 if(firUrl!="")
			   {	
								
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/internetResource/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
								if (status == "success" && data != null)
								{
									if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
									{
										var entry=data.result;
									//alert(entry.status);
										var isleader= $.isleader("${pageContext.request.contextPath}");
										if(isleader=="本部门领导"||isleader=="信息管理中心方政"||isleader=="维保部门"){
											if(entry.status=="turnBack"||entry.status=="innerTurnBack"||entry.status=="serviceDeptBack"){
												$("#projectPlanForm input,#projectPlanForm select,#projectPlanForm textarea").attr("disabled","true");
												$("#btnSubmit").css("display","none");
												$("#btnsave").css("display","none");
												$("#btndele").css("display","none");
												
											}
										}
										//else if(entry.status=="serviceDeptBack"){
										//		$("#projectPlanForm input,#projectPlanForm select,#projectPlanForm textarea").attr("disabled","true");
										//		$("#btnSubmit").css("display","none");
										//		$("#btnsave").css("display","none");
										//		$("#btndele").css("display","none");
										//}
										
										
										for ( var item in entry) 
										{
										  try 
										{ 			
										$("[name=applyUseTime]").val(entry.applyUseTime.trim());							
											if($("[name="+item+"]").length > 0 )
												{	
												    if(item=="applyTime"||item=="initiateTime"||item=="implementTime"){
												       
												       $("[name="+item+"]").val(entry[item].substring(0,10));
												    }else{
												    	$("[name="+item+"]").val(entry[item]);
													}
												}
										}
											catch (e) 
											{ 
												alert(e);
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
			var isleader= $.isleader("${pageContext.request.contextPath}");
     $("#btnSubmit").click(function(){
			
			  
		     
				  {
	        	 $("#dialog-confirm P").text("是否提交");
	        	 
	        	 $( "#dialog-confirm" ).dialog({
	                 resizable: false,
	                 height:140,
			         width:200,
	                 modal: true,
	                 buttons: {
	                   "确认": function() {
	                	   var _od="";
	                	  
	                  	 
	                  	 if($("[name=handlerLoginname]").text().trim()==null)
	                  		 {
	                  		 alert("错误");
	                         return false;
	                  		 }
 
	                	 _od+="&handler="+$("#handler option:selected").text();
						_od+="&handlerLoginname="+$("#handler option:selected").val();
            	 		 _od+="&initiator="+$("[name=applyer]").val();
            			 _od+="&initiatorLoginname="+$("[name=applyerLoginname]").val();
	                  	 _od+="&applyType="+$("[name=applyType]").val();

	                	   var otherData="";
	                	   if(QueryString.GetValue('id')!=null)
	                		   {
	                		   otherData+="&id="+QueryString.GetValue('id');
	                		   }
	                	
	                	   var _yanz=$.yanzhen();
	                	   if(isleader==true)
	            			{
	            			alert("错误身份");
	            			$( this ).dialog( "close" );
	            			return false;

	            			}
	                	   if(_yanz!="")
	                		   {
	                		   alert(_yanz+"\r\n请修改");
	                		   $( this ).dialog( "close" );
	                		   return false;
	                		   }
	                	 
	                	   var _attachIds=$.getAttachId();
	                       $.FileSave("${pageContext.request.contextPath}","internetResource",QueryString.GetValue('id'),_attachIds);
	                	   $.postsave("${pageContext.request.contextPath}","projectPlanForm",otherData+"&status=innerApproval"+_od+"&suggestion=");
	                	   window.close();
							location.href = Url
									+ "/internetResource/internetAccessList";
	                
	                     $( this ).dialog( "close" );
	                   },
	                   "取消": function() {
	                     $( this ).dialog( "close" );
	                   }
	                 }
	               }); 
	        	 }
	         });
	         $("#btnsave").click(function(){
          $("#dialog-confirm P").text("是否保存为草稿");
       	 
    	  $( "#dialog-confirm" ).dialog({
             resizable: false,
             height:140,
	         width:200,
             modal: true,
             buttons: {
               "确认": function() {
            	
            	   var _od="";
            	  
              	 //if($("#initiateTime")!=""||initiateTime!=null)
              		// {
              		 //var d = new Date();
            	   //_od+="&initiateTime="+d.getTime();
            	   //_od+="&applyTime="+d.getTime();
              		 //}
              	
              	 if($("[name=handlerLoginname]").text().trim()==null)
              		 {
              		 alert("错误");
                     return false;
              		 }
              	 
              	_od+="&handler="+$("#handler option:selected").text();
						_od+="&handlerLoginname="+$("#handler option:selected").val();
            	 _od+="&initiator="+$("[name=applyer]").val();
            	 _od+="&initiatorLoginname="+$("[name=applyerLoginname]").val();
              	 _od+="&applyType="+$("[name=applyType]").val();
                          	 
            	   var otherData=$.getOtherData();
            	   if(QueryString.GetValue('id')!=null)
            		   {
            		   otherData+="&id="+QueryString.GetValue('id');
            		   }
            	   if(isleader==true)
       			{
       			//alert("错误身份");
       			//$( this ).dialog( "close" );
       			//return false;

       			}
            	   var _yanz=$.yanzhen();
            
            	   if(_yanz!="")
            		   {
            		   alert(_yanz+"\r\n请您修改");
            		   $( this ).dialog( "close" );
            		   return false;
            		   }
            	   
            	   var _attachIds=$.getAttachId();
                   $.FileSave("${pageContext.request.contextPath}","internetResource",QueryString.GetValue('id'),_attachIds);
            	   $.postsave("${pageContext.request.contextPath}","projectPlanForm",otherData+"&status=draft"+_od+"&suggestion=");
            	   window.close();
					location.href = Url
							+ "/internetResource/internetAccessList";
            
                 $( this ).dialog( "close" );
               },
               "取消": function() {
                 $( this ).dialog( "close" );
               }
             }
           }); 
     });
	         
	         


 $("#btndele").click(function(){
             if(confirm("你确认删除吗？")){
               var id="";
	         if(QueryString.GetValue('id')!=null)
            		   {
            		   id+=QueryString.GetValue('id');
            		   }
	         	$.postDele("${pageContext.request.contextPath}",id);
             }
	         
	         
	         });

	                // $("#date").blur(function(){
	                //      $.getApplyUseTime();
	                // });
	                 $("[name=closebtn]").click(function(){
				 window.close();
			});
	           $("[name=applyBusinessType]").change(function(){
	                
					if($("[name=applyBusinessType]").val()!="addLocal"){
						$("#red").css("display","inline");
					} else{
					    $("#red").css("display","none");
					}       	
	           });
	           $.getFileInfo("${pageContext.request.contextPath}","modelName=internetResource&modelId="+QueryString.GetValue('id'),true);
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

                <td ><div class="red"> *</div>审核意见：<input  name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input  name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>

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

        	<input  type="button" id="btnSubmit2" value="提交修改" />

&nbsp;

<input  type="button" id="closebtn" value="返回修改" />

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

                        	<li><a class="print">打印</a></li>

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

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>特定网络接入申请/注销审批办理表</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>使用人姓名</td>
                    <td> <input   type="text" class="input_large" name="userName" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>申请类型</td>
                    <td >
                    		<select name="applyType" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="apply" >申请</option>
                      <option value="change" >变更</option>
                      <option value="cancel" >注销</option>
                      
                    </select>
                     </td>
                </tr>
                <tr>
                	 <td class="lableTd t_r" ><div class="red"> *</div>单位/部门</td>
                  	 <td><input  type="text" class="input_large" name="dept" /></td>
                     <td class="lableTd t_r" ><div class="red"> *</div>职务</td>
                     <td><input  type="text" class="input_large" name="post" /></td>
                </tr>
                <tr>
                  <td class="lableTd t_r" ><div class="red"> *</div>位置</td>
                  <td><input  type="text" class="input_large" name="usePlace" /></td>
                  <td class="lableTd t_r"><div class="red"> *</div>终端类型</td>
                   <td> 
                  	<select  name="equipmentType" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="desktop" >台式机</option>
                      <option value="mobileDevice" >移动设备</option>
                      <option value="specialDevice" >专用设备</option>
                      <option value="other" >其它</option>  
                    </select>
                  </td>    
                </tr>
              
               <tr>
                  
                  <td class="lableTd t_r"><div class="red"> *</div>申请使用时间</td>
                  <td >
                  	<input type="text" disabled class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  	<input type="hidden" name="applyUseTime"  class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  </td>  
                  <td class="lableTd t_r"><div class="red"> *</div>联系电话</td>
                  <td ><input   type="text" class="input_large" name="contactPhone" /></td> 
                      
                </tr>
                 
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>业务申请原因</td>
                  	<td colspan="3"><textarea  rows="4"  name="applyReason" 
                  	 style="margin-top:0px;margin-bottom:0px;height:180px;"></textarea>
                  	 </td> 
                </tr>
                <tr>
                	 <td class="lableTd t_r" >添加附件</td>
                  	 <td colspan="3">
                 		<input id="upload" class="upload_button" type="button" value="本地上传" />
                   		<input type="button" value="上传"  onclick="$('#upload').uploadify('upload','*');">
                 		<input type="button" value="取消"  onclick="$('#upload').uploadify('cancel','*');">
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
              </table>
             
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
                <th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </thead>
                <tr>
                  <td class="lableTd t_r" ><div class="red"> *</div>申报单位</td>
                  <td>      <input disabled  type="text" class="input_large" name="applyDept" />
                          </td>
                  <td class="lableTd t_r"><div class="red"> *</div>申报人</td>
                  <td> <input  disabled type="text" class="input_large" name="applyer" />
                  		<input type="hidden" name="applyerLoginname" />
                  		<input type="hidden" name="applyDeptId">
                  		<input type="hidden" name="initiateTime">
                  </td>
                </tr>
                <tr>
                <td class="lableTd t_r"><div class="red"> *</div>审核领导</td>
                  	<td>
                    <select id="handler" class="input_large"  >
                      
                     
                    </select>
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
             <input  type="button"  id="btnSubmit" value="提交" />
              &nbsp; 
            
              <input  type="button" id="closebtn1" value="关 闭" />
              &nbsp; 
               <input type="button"  id="btnsave" value="保存草稿" />
              &nbsp;
              <input type="button"  id="btndele" value="删除草稿"  />
              &nbsp;
              </div>
              
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
