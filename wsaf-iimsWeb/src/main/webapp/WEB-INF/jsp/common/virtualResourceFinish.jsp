<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>虚拟化资源申请/注销审批办理表</title>
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
	<script src="js/virtualResource.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
	<script type="text/javascript">
	$(function() {
		$(":input:not(.b)").attr("disabled","disabled");
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
         
         
			QueryString.Initial();
			
			
			$.postResourceManageDetail = function(firUrl,id){
			
			 if(firUrl!=""){	
			 $.ajax({
				   async: false,
				    url : firUrl+"/basicCrud/virtualResource/get/"+id,
					type : 'post',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{
							if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
							{
								var entry=data.result;
										for ( var item in entry){
										  try{ 										
											if($("[name="+item+"]").length > 0 ){	
											  if(item=="applyTime"||item=="initiateTime"||item=="implementTime"){
												  $("[name="+item+"]").val(entry[item].substring(0,10));
											  }else{
												  $("[name="+item+"]").val(entry[item]);
												}
											}else if($("[name=implementTime]").val()!=null){
											  $("[name=implementTime]").val(entry[implementTime].substring(0,10));
											}
										}catch (e){ 
											//alert(e);
											}
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
			$.getListDetail("${pageContext.request.contextPath}");
			$.postResourceManageDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'));
			$.getSuggestInDept("${pageContext.request.contextPath}",QueryString.GetValue('id')); 
			$.getFileInfo("${pageContext.request.contextPath}","modelName=virtualResource&modelId="+QueryString.GetValue('id'),true);
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

                <td ><div class="red"> *</div>审核意见：
                <input name="btnISPass" type="radio" value="pass" style="margin-left:20px" class="b">通过
                <input name="btnISPass" type="radio" value="notPass" style="margin-left:10px"class="b">不通过</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><div class="red"> *</div>意见</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><textarea  name="suggestion" rows="4" placeholder="请输入意见" class="b"></textarea></td>

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

        	<input type="button" id="btnSubmit2" value="提交审核" class="b"/>

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

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>虚拟化资源申请审批办理表</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>使用人姓名</td>
                    <td> <input  type="text" class="input_large" name="userName" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>所属项目</td>
                    <td >
                    		<input  type="text" class="input_large" name="projectName" />
                     </td>
                </tr>
               
                <tr>
                   <td class="lableTd t_r"><div class="red"> *</div>申请使用时间</td>
                   <td >
                  	<input type="text" disabled class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  	<input type="hidden" name="applyUseTime"  class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  </td>
                   <td class="lableTd t_r"><div class="red"> *</div>联系电话</td>
                  <td ><input  type="text" class="input_large" name="contactPhone" /></td>    
                </tr>
              
               <tr>
                  
                  <td class="lableTd t_r"><div class="red"> *</div>项目负责人</td>
                   <td >
                  	<input type="text" class="input_large" name="projectPrincipal"/>
                  </td>
                  <td class="lableTd t_r"><div class="red"> *</div>申请类型</td>
                   <td >
                  	<select class="input_large" name="applyType">
                  	<option value="">请选择</option>
                  	<option value="apply">申请</option>
                  	<option value="change">变更</option>
                  	<option value="cancel">注销</option>
                  	</select>
                  </td>
                </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">资源信息</h5>
                  </th>
                    </thead>
                    <tr>
                  		<td class="lableTd t_r"><div class="red"> *</div>虚拟服务器</td>
                   		<td><input type="text" class="input_large" name="virtualServer"/>个 </td>
                   		
                	</tr>
                	<tr>
                		<td class="lableTd t_r"><div class="red"> *</div>CPU</td>
                   		<td><input type="text" class="input_large" name="cpu"/>核 </td>
                  		<td class="lableTd t_r"><div class="red"> *</div>内存大小</td>
                   		<td><input type="text" class="input_large" name="memory"/>GB </td>
                   		
                	</tr>
                	<tr>
                		<td class="lableTd t_r"><div class="red"> *</div>硬盘大小</td>
                   		<td><input type="text" class="input_large" name="hardDisk"/>GB</td>
                	</tr>
                	<tr>
                		<td class="lableTd t_r"><div class="red"> *</div>基础软件</td>
                	</tr>
                	<tr>
                		<td class="lableTd t_r"></td>
                		<td>操作系统</td>
                		<td colspan="2"><textarea  rows="4" placeholder="请输入所需操作系统" name="opsysDescription" 
                  	 	style="margin-top:0px;margin-bottom:0px;width:275px;height:60px;"></textarea>
                  	 	<input type="text" class="input_large" style="width:48px;" name="opsys">个
                  	 	</td>
                	</tr>
                	<tr>
                		<td class="lableTd t_r"></td>
                		<td>数据库</td>
                		<td colspan="2"><textarea  rows="4" placeholder="请输入所需数据库" name="dbDescription" 
                  	 	style="margin-top:0px;margin-bottom:0px;width:275px;height:60px;"></textarea>
                  	 	<input type="text" class="input_large" style="width:48px;" name="db">个
                  	 	</td>
                	</tr>
                	<tr>
                		<td class="lableTd t_r"></td>
                		<td>中间件</td>
                		<td colspan="2"><textarea  rows="4" placeholder="请输入所需中间件" name="middlewareDescription" 
                  	 	style="margin-top:0px;margin-bottom:0px;width:275px;height:60px;"></textarea>
                  	 	<input type="text" class="input_large" style="width:48px;" name="middleware">个
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
                <tr>
                	<td id="reason" class="lableTd t_r">备注</td>
                  	<td colspan="3"><textarea  rows="4" placeholder="请在此处填写申请备注信息" name="remarks" 
                  	 style="margin-top:0px;margin-bottom:0px;height:180px;"></textarea>
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
                 <td class="lableTd t_r"><div class="red"> *</div>当前审核领导</td>
                  	<td>
                    <input type="text" disabled name="handler" class="input_large"  >
                  </td>
                  <td class="lableTd t_r"><div class="red"> *</div>填报时间</td>
                  <td ><input disabled type="text"  class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  <input type="hidden" name="applyTime" class="input_large" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="implementInfo">
				   <thead><th colspan="4"><h5 class="fl">开通办理情况</h5></th></thead>
				    <tr>
						<td class="lableTd t_r"><div class="red"> *</div>系统名称</td>
				        <td> <input  type="text" class="input_large" name="sysName" /></td>
				        <td class="lableTd t_r"><div class="red"> *</div>主机名</td>
				        <td ><input type="text"  name="hostName"   class="input_large"/></td></tr>
				    <tr>
				        <td class="lableTd t_r"><div class="red"> *</div>IP</td>
				        <td> <input  type="text" class="input_large" name="ip" /></td>
				        <td class="lableTd t_r"><div class="red"> *</div>安装软件</td>
				        <td> <input  type="text" class="input_large" name="software" /></td>
				     </tr>
				     <tr>
				        <td class="lableTd t_r"><div class="red"> *</div>办理人</td>
				        <td> <input  type="text" class="input_large" name="implementUser" /></td>
				        <td class="lableTd t_r"><div class="red"> *</div>办理时间</td>
				        <td> <input  type="text" class="input_large" name="implementTime" /></td>
				     </tr>
				      
			  </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="leaderSuggest" >
                 <thead> <th> <h5 class="fl">审批信息</h5> </th></thead>
                        <tbody>
                       	   <tr><td></td></tr>
                        </tbody>
               </table>
              </form>
            </div>
            <div class="mb10 t_c">
              <input type="button" id="closebtn" value="关 闭" class="b"/>
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