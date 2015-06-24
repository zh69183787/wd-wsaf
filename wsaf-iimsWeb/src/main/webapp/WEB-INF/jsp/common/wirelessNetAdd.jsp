<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>无线网络申请/注销审批办理表</title>
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
	<script src="js/wirelessNet.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
	<script type="text/javascript">
		
$(function(){
 $(function() {
	           	    $( "[name=applyUseTime]" ).datepicker({ dateFormat:"yy-mm-dd"});
	           	 	$( "[name=startDate]" ).datepicker({ dateFormat:"yy-mm-dd"});
	           	    $( "[name=endDate]" ).datepicker({ dateFormat:"yy-mm-dd"});
				  });
	var isleader= $.isleader("${pageContext.request.contextPath}");
	$("#upload").uploadify({
        'auto' : false,
           'method' : "post",
           'height' : 20,
           'width' : 100,
           'swf' : 'js/uploadify.swf', 
           'uploader' : '<%=basePath%>attach/api/upload?groupName="wirelessResource"',
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
						$("#tbfj tbody tr").remove();
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
											$.getFileInfo("${pageContext.request.contextPath}","modelName=wirelessResource&modelId="+QueryString.GetValue('id'),true);
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
	
	$.getSerialNo("${pageContext.request.contextPath}");
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
	                  	 
	                  	 var a =$("[name=usePosition2_c]");
						var b = "";
						for(var i = 0; i<a.length;i++){
							if(a[i].checked){
								b += a[i].value+",";
							}
						}
						b=b.substring(0,b.lastIndexOf(","));
						//alert(b);
						//return false;
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
	                	   	  var fid = $.postsave("${pageContext.request.contextPath}","projectPlanForm",otherData+"&status=innerApproval"+_od+"&suggestion=");
	                	   	  $.FileSave("${pageContext.request.contextPath}","wirelessResource",fid,_attachIds);
	                	   	window.close();
							location.href = Url
									+ "/wirelessResource/wirelessNetList";
	                
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
				_od+="&handlerLoginname="+$("#handler option:selected").val();;
            	 _od+="&initiator="+$("[name=applyer]").val();
            	 _od+="&initiatorLoginname="+$("[name=applyerLoginname]").val();
              	 _od+="&applyType="+$("[name=applyType]").val();
                       
                       var a =$("[name=usePosition2_c]");
						var b = "";
						for(var i = 0; i<a.length;i++){
							if(a[i].checked){
								b += a[i].value+",";
							}
						}
						b=b.substring(0,b.lastIndexOf(","));
                          	 
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
	                	   	  var fid = $.postsave("${pageContext.request.contextPath}","projectPlanForm",otherData+"&status=draft"+_od+"&suggestion=");
	                	   	  $.FileSave("${pageContext.request.contextPath}","wirelessResource",fid,_attachIds);
	                	   	window.close();
							location.href = Url
									+ "/wirelessResource/wirelessNetList";
            
                 $( this ).dialog( "close" );
               },
               "取消": function() {
                 $( this ).dialog( "close" );
               }
             }
           }); 
     });
	         
	         
	                 $.getListDetail("${pageContext.request.contextPath}");

	                // $("#date").blur(function(){
	                //      $.getApplyUseTime();
	                // });
	                 $("[name=closebtn]").click(function(){
				 window.close();
			});
	           $("[name=applyBusinessType]").change(function(){
					if($("[name=applyBusinessType]").val() =="temp"){
						$("#date").css("display","");
						$("#nameAndid").css("display","");
						$("#name1").css("display","");
						$("#name2").css("display","");
					}else if($("[name=applyBusinessType]").val() =="manage"){
						$("#date").css("display","none");
						$("#nameAndid").css("display","");
						$("#name1").css("display","");
						$("#name2").css("display","");
					}else if($("[name=applyBusinessType]").val() =="special"||$("[name=applyBusinessType]").val() =="mobile"){
						$("#date").css("display","none");
						$("#nameAndid").css("display","");
						$("#name1").css("display","none");
						$("#name2").css("display","none");
					}else{
					    $("#date").css("display","none");
					    $("#nameAndid").css("display","none");
					} 
	           });
	           
	           $("[name=usePosition]").change(function(){
	        	   if($("[name=usePosition]").val() =="designatedArea"){
	        		   $("#position").css("display","");
	        	   }else{
	        		   $("#position").css("display","none");
	        	   }
	           });
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
		#shenming{
			text-align: left;
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

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>无线网络申请/注销审批办理表</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                    
                <tr>
                	<td class="lableTd t_r">编号</td>
                    <td class="lableTd t_r">
                    	<input readonly type="text" class="input_large" name="businessCode"/>
                    </td>
                </tr>

                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>使用人姓名</td>
                    <td> <input  type="text" class="input_large" name="userName" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>申请类型</td>
                    <td >
                    		<select name="applyType" class="input_large" name="applyType" >
                      <option value="" selected>请选择</option>
                      <option value="apply" >申请</option>
                      <option value="change" >变更</option>
                      <option value="cancel" >注销</option>
                      
                    </select>
                     </td>
                </tr>
               
                <tr>
                  <td class="lableTd t_r" ><div class="red"> *</div>用途</td>
                  <td><input  type="text" class="input_large" name="usePlace" /></td>
                  <td class="lableTd t_r"><div class="red"> *</div>业务类型</td>
                  <td> 
                  	<select name="applyBusinessType" class="input_large"  >
                      <option value="" selected>请选择</option>
                        <option value="special" >互联网专用设备接入</option>
                      	<option value="mobile" >移动设备接入互联网区（限集团员工申请选择）</option>
                      	<option value="temp" >临时接入互联网区（必须写明开始使用日期和结束使用日期）</option>
                      	<option value="manage" >无线接入管理网区（仅限特殊需求）</option>
                    </select>
                  </td>    
                </tr>
                <tbody id="date" style="display:none">
              	<tr>
              		<td class="lableTd t_r"><div class="red"> *</div>开始使用日期</td>
                  	<td ><input  type="text" class="input_large" name="startDate" /></td>
                  	<td class="lableTd t_r"><div class="red"> *</div>结束使用日期</td>
                  	<td ><input  type="text" class="input_large" name="endDate" /></td>
              	</tr>
              	</tbody>
              	<tbody id="nameAndid" style="display:none">
              	<tr>
                  	<td class="lableTd t_r"><div class="red"> </div>员工证号</td>
                  	<td ><input  type="text" class="input_large" name="staffCardId" /></td>
              		<td class="lableTd t_r" id="name1"><div class="red"> </div>单位名称</td>
                  	<td id="name2"><input  type="text" class="input_large" name="companyName" /></td>
              	</tr>
              	</tbody>
               <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>使用位置选择</td>
                  <td> 
                  <select  name="usePosition" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="theUnit" >本单位</option>
                      <option value="wholeGroup" >全集团漫游</option>                 
                      <option value="designatedArea" >指定集团内漫游区域</option>
                    </select>
                    <input type="hidden" name="applyUseTime"  class="input_large" 
                    value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  </td> 
                  
                  	
                  
                  <td class="lableTd t_r"><div class="red"> *</div>联系电话</td>
                  <td ><input  type="text" class="input_large" name="contactPhone" /></td>
                </tr>
                 <tbody id="position" style="display:none">
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>使用位置选择2</td>
                  	<td >
                  		<input  type="checkbox" value="groupCompanyHome" name="usePosition2_c" />集团公司本部
                  		<input  type="checkbox" value="hengtongBuilding" name="usePosition2_c" />恒通大厦
                  		<input  type="checkbox" value="assetCompanyHome" name="usePosition2_c" />资产公司本部
                  	</td> 
                </tr>
                </tbody>
                <tr>
               
                   <td class="lableTd t_r"><div class="red"> *</div>无线MAC地址</td>
                  <td ><input  type="text" class="input_large" name="macAddress" /></td>
                   <td class="lableTd t_r"><div class="red"> *</div>职务</td>
                  <td ><input  type="text" class="input_large" name="userPost" /></td> 
                </tr>
                	
                <tr>
                <td class="lableTd t_r"><div class="red"> *</div>设备类型</td>
                   <td> 
                  	<select  name="equipmentType" class="input_large"  >
                      <option value="" selected>请选择</option>
                      <option value="desktop" >台式机电脑</option>
                      <option value="notebook" >笔记本电脑</option>                 
                      <option value="mobile" >手机设备</option>
                      <option value="pad" >平板电脑</option>
                      <option value="special" >专用设备</option>
                    </select>
                  </td> 
                
                </tr>
                
                <tr>
                	<td id="reason" class="lableTd t_r"><div class="red" id="red" > *</div>业务申请原因</td>
                  	<td colspan="3"><textarea  rows="4" placeholder="请输入你的业务申请原因" name="applyReason" 
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
                  <td>      
                  	<input disabled type="text" class="input_large" id="deptName" />
                  	<input  type="hidden" class="input_large"   name="applyDept" />
                  	<input type="hidden" name="applyDeptId" id="deptId"/>
                  </td>
                  <td class="lableTd t_r"><div class="red"> *</div>申报人</td>
                  <td> <input disabled type="text" class="input_large" name="applyer"/>
                  	<input type="hidden" name="applyer">
                  	<input type="hidden" name="applyerLoginname" />
                  	<input type="hidden" name="initiator">
                  	<input type="hidden" name="initiatorLoginname">
                  	<input type="hidden" name="initiateTime" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">
                  	
                  	
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
                  <td ><input disabled type="text"  class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  <input type="hidden" name="applyTime" class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  </td>
                  

                </tr>

                
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                	<th colspan="4"><h5 class="fl">申请人声明</h5></th>
                </thead>
                <tr>
                	<td class="lableTd t_r" id="shenming">
                		申请人声明:<br>
						1、申请单位负责对业务需求的审核，并负责监督使用行为符合集团及国家相关网络和信息安全管理规定，<br>
						      承担因申请用户不当、违规使用造成网络安全和业务故障的管理责任。<br>
						2、无线网络用户在使用期间，应自觉遵守国家有关法律和法规，不得使用网络从事危害公共安全、<br>
						       损害公众利益、侵害他人正当权益、窃取或者泄露他人秘密以及散布、传播其他有害的活动。<br>
						3、无线网络用户在使用期间，未经许可不可进行大流量的下载操作。使用中保障入网设备安全、无病毒。<br>
 	                </td>
                </tr>
              </table>
              </form>
            </div>
            <div class="mb10 t_c">
              <input type="button" id="btnSubmit" value="提 交" />
              &nbsp;
              <input type="button" name="closebtn" value="关 闭" />
              &nbsp;
              <input type="button"  id="btnsave" value="保存草稿" />
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
