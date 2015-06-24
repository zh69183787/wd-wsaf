<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>年度专项详情</title>
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
	<script src="js/annual.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
	<script type="text/javascript">
	document.write("<script type='text/javascript' "  
	        + "src='<%=request.getContextPath()%>/js/jquery.uploadify-3.1.js?" + new Date()  
	        + "'></s" + "cript>"); 
		
$(function() {
	$(":text").attr("disabled","disabled");
	
	 QueryString.Initial();
	 if(QueryString.GetValue('id')!=null){
			var id = QueryString.GetValue("id");
	  		$.postSpecialDetail("${pageContext.request.contextPath}",id);
		}
	$("#repliedPercent").val(Math.round($("[name=repliedPercent]").val()*100)+"%");
	$("#signedPercent").val(Math.round($("[name=signedPercent]").val()*100)+"%");
	$("#paiedPercent").val(Math.round($("[name=paiedPercent]").val()*100)+"%");
	 
	 
	 $("#upload").uploadify({
	        'auto' : false,
	           'method' : "post",
	           'height' : 20,
	           'width' : 100,
	           'swf' : 'js/uploadify.swf', 
	           'uploader' : '<%=basePath%>attach/api/upload?groupName="special"',
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
							$("[name="+$(this).parents('tr').attr('name')+"]").remove();
					});
	        },
	           
	    });
	    
	    $.getFileInfo = function(firUrl,otherdata){
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
													 "\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");

										}
										 $("#tbfj tbody a.del").click(function(){
												$.FileDel("${pageContext.request.contextPath}",$(this).parents("tr").attr("name"));
												$("[name="+$(this).parents('tr').attr('name')+"]").remove();
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
	 
      $("[name=closebtn]").click(function(){
		 window.close();
	  });
      $.getFileInfo("${pageContext.request.contextPath}","modelName=special&modelId="+QueryString.GetValue('id'));
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

                <td ><div class="red"> *</div>审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><div class="red"> *</div>意见</td>

              </tr>

              <tr>

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

        	<input type="button" id="btnSubmit2" value="提交审核" />

&nbsp;

<input type="button" id="closebtn" value="取消申报" />

        </div>

    </div>

    <!--Transparent End-->
	<div class="f_bg">

      <!--Panel_6-->	


      <!--Panel_6 End-->	

    	<div class="logo_1"></div>

        <div class="gray_bg">

        	<div class="gray_bg2">

            	<div class="w_bg">

                	<div class="Bottom">

                    	<div class="Top">

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>年度专项</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>年度</td>
                    <td> <input  type="text" class="input_large" name="year" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>当年计划上报项目预算</td>
                   <td> <input  type="text" class="input_large" name=planReportBudget /></td>
                </tr>
               
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>当年已批复项目预算</td>
                  <td> <input  type="text" class="input_large" name="repliedBudget" /></td> 
                   <td class="lableTd t_r"><div class="red"> *</div>当年未批复项目预算</td>
                  <td>
                  <input  type="text" class="input_large" name="unrepliedBudget" />
                    <input  type="hidden" class="input_large" name="budgetId" />
	                  	<input  type="hidden" class="input_large" name="applyer" />
	                  	<input  type="hidden" class="input_large" name="applyerLoginname" />
	                  	<input  type="hidden" class="input_large" name="applyTime" 
	                  			value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
					</td>    
                </tr>
                
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>批复率</td>
                    <td> <input  type="text" class="input_large" id="repliedPercent" />
                    <input  type="hidden" class="input_large" name="repliedPercent" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>去年项目资金预算</td>
                   <td> <input  type="text" class="input_large" name=lastYearBudget /></td>
                </tr>
                
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>当年项目资金预算</td>
                    <td> <input  type="text" class="input_large" name="thisYearBudget" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>当年计划签订合同金额</td>
                   <td> <input  type="text" class="input_large" name=planSignAmount /></td>
                </tr>
                
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>当年已签订合同金额</td>
                    <td> <input  type="text" class="input_large" name="signedAmount" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>当年未签订合同金额</td>
                   <td> <input  type="text" class="input_large" name=unsignedAmount /></td>
                </tr>
                
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>签订率</td>
                    <td> <input  type="text" class="input_large" id="signedPercent" />
                    <input  type="hidden" class="input_large" name="signedPercent" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>应支付合同金额</td>
                   <td> <input  type="text" class="input_large" name=planPaiedAmount /></td>
                </tr>
                
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>已支付合同金额</td>
                    <td> <input  type="text" class="input_large" name="paiedAmount" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>未支付合同金额</td>
                   <td> <input  type="text" class="input_large" name=unpaiedAmount /></td>
                </tr>
                
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>支付率</td>
                    <td> <input  type="text" class="input_large" id="paiedPercent" />
                    <input  type="hidden" class="input_large" name="paiedPercent" /></td>
                </tr>
              
                <tr>
                	 <td class="lableTd t_r" >附件信息</td>
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
              </form>
            </div>
            <div class="mb10 t_c">
              <input type="button" name="closebtn" value="关 闭" />
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

</body>
</html>
