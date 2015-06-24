<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目申报计划详情</title>
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
	$(function() {
		$("#btndel").click(function(){
			 window.close();
				location.href = "${pageContext.request.contextPath}/projectPlanTarget/projectPlanTargetList?id="+$("#versionId").val();	
		});
		$.getFileInfo = function(firUrl,otherdata,isRead){
			var info="";
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
									var entry=data.result;
									for ( var item in entry) 
									{
									     if(isRead)
										{
									    	 info+="<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+entry[item].id+"\">下载</a></td></tr>";
										}
									     else
									    	 {
									    	// info+="<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td>&nbsp;</td></tr>";
												
									    	 }
									}
								
								}
							}
						}
				 });
				 return info;
			   }
		}
		
		$.postDetail = function(firUrl,id){
			 if(firUrl!="")
			   {	
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/projectPlanTarget/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
		
								if (status == "success" && data != null)
								{
									if (data.success == true) 
									{
										var entry=data.result,isreader=false,otherdata="modelName=meeting&modelId="+id,otherdata2="";		
									
										for ( var item in entry) 
										{
										  try 
										{ 	
											  if(item=="topic")
												{
												var dataObj=jQuery.parseJSON(entry[item]);
												
												for ( var sitem in dataObj) 
												{
												
												  var dataObj2=jQuery.parseJSON(dataObj[sitem]);
												 		

												  if(dataObj2.share.indexOf($("#myname").text())>=0)
													  isreader=true;

													if(sitem=="meetingSummary")
												    {
														  otherdata2=otherdata+"&groupName=\"meetingSummary\""; 
														  var info=$.getFileInfo(firUrl,otherdata2,isreader);
													      $(".table_summary tbody").append(info);
													}
													else
													{
														  otherdata2=otherdata+"&groupName="+dataObj2.attachGroup;
														  var info=$.getFileInfo(firUrl,otherdata2,isreader);
													      $("#addIssue").parents("tr").after("<tr class=\"yiti\"><td class=\"lableTd t_r\">会议资料</td><td colspan=\"3\"><table width=\"100%\" class=\"table_issue\"><thead><tr><td colspan=\"5\" >议题：  <input  type=\"text\"  style=\"width:360px\" class=\"txtissue\" value=\""+sitem+"\" readonly/></td></tr><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan=\"2\">操作</td></tr></thead><tbody>"+info+"</tbody></table></td></tr>");	 
															
													}
													  isreader=false;
											    
												}
												}
											  
											  if(item=="startDate")
											  $("[name=mystartDate]").val(entry[item].trim());
											
											
											if($("[name="+item+"]").length > 0 )
												{	
												$("[name="+item+"]").val(entry[item]);
													
												}
										}
											catch (e) 
											{ 
												alert(e);
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
		}
		
		
		$.getMenu("${pageContext.request.contextPath}","projectPlanTarget");
		$.defaultjs(); 
		QueryString.Initial();
	
		if(QueryString.GetValue('id')!=null)
		{
			$.ajax({
		    async: false,
		    url : "${pageContext.request.contextPath}/ca/getCurrentLoginInfo",
			type : 'post',
			success: function(data, status, xhr) {
				if (status == "success" && data != null)
				{ 
				   if (data.cookies) 	
					{
						for ( var sitem in data.deptUsers) 
			            {
				            
				            	$("#myname").text(data.cookies.loginName);
				        }
					}
				}
			}
	});
			$.postDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'));
			
			$.ajax({
				    async: false,
				    url : "${pageContext.request.contextPath}/ca/getCurrentLoginInfo",
					type : 'post',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{ 
						   if (data.cookies!=null) 	
							{
								for ( var sitem in data.deptUsers) 
					            {
						            if($("input[name=applyer]").val()==sitem)
						            	$("#applyerName").val(data.deptUsers[sitem]);
						        }
							}
						}
					}
			});
		}
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
<tr><td colspan="2"><input type="checkbox"  name="cbAll"> 全选</td>
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
       <thead><tr><td colspan="2"><input type="checkbox"  name="cbAll"> 全选</td>
       </tr></thead><tbody></tbody></table></div>
        <div class="button t_c">
        <input type="button" class="submit" value="确认" />
        </div></div>
 <!--2 end-->
    
	<div class="f_bg">

      <!--Panel_6-->	


      <!--Panel_6 End-->	

    	<div class="logo_1"></div>

        <div class="gray_bg">

        	<div class="gray_bg2">

            	<div class="w_bg">

                	<div class="Bottom">

                    	<div class="Top">

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>项目申报计划详情</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th class="disable" colspan="4" class="f1">
                                                <h5 class="fl">基本信息</h5>
                                            </th>
                                        </thead>
                                        <tr class="disable">
                                            <td class="lableTd t_r">年度</td>
                                            <td>
                                                <select name="year" class="input_large" disabled>
                                                    <option value="2015">2015</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2013">2013</option>
                                                </select></td>
                                            <td class="lableTd t_r">项目类别</td>
                                            <td>
                                                <select name="projectType" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="repair">大修</option>
                                                    <option value="remould">更新改造</option>
                                                    <option value="new">新建</option>
                                                    <option value="other">其它</option>
                                                </select></td>
                                        </tr>

                                        <tr class="disable">
                                            <td class="lableTd t_r">项目名称</td>
                                            <td><input type="hidden" class="input_large" name="versionId" disabled />
                                                <input type="text" class="input_large" name="projectName" disabled /></td>
                                            <td class="lableTd t_r">总投资估算</td>
                                            <td>
                                                <input type="text" class="input_small" name="totalInvestEstimate" disabled />&nbsp;&nbsp;万元</td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>

                                            <th colspan="4" class="disable">
                                                <h5 class="fl">项目属性</h5>
                                            </th>
                                        </thead>
                                        <tr class="disable">
                                            <td class="lableTd t_r">资金计划/一季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan1" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                            <td class="lableTd t_r">资金计划/二季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan2" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">资金计划/三季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan3" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                            <td class="lableTd t_r">资金计划/四季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan4" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">项目概述</td>
                                            <td colspan="3">
                                                <textarea name="mainContent" rows="4" placeholder="请输入项目目标/实施范围/主要功能/技术性能指标" disabled></textarea></td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">年度推进目标</td>
                                            <td>
                                                <select name="yearTarget" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="">请选择</option>
                                                    <option value="planOK">完成前期策划</option>
                                                    <option value="purchaseOK">完成立项采购</option>
                                                    <option value="implementAllOK">完成项目实施（全部）</option>
                                                    <option value="implementPartOK">完成项目实施（部分）</option>
                                                    <option value="initalCheckOK">完成项目初验</option>
                                                    <option value="finalCheckOK">完成项目终验</option>
                                                </select>
                                            </td>
                                            <td class="lableTd t_r" id="yearTargetReasonTitle"></td>
                                            <td>
                                                <input id="yearTargetReason" style="display: none" type="text" class="input_large" name="yearTargetReason" disabled />
                                            </td>
                                        </tr>

                                        <tr class="disable">
                                            <td class="lableTd t_r">安全等级保护级别</td>
                                            <td colspan="3">
                                                <select name="securityLevel" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="level1">一级</option>
                                                    <option value="level2">二级</option>
                                                    <option value="level3">三级</option>
                                                </select></td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">信息化资源需求</td>
                                            <td colspan="3">
                                                <select id="resourceRequirement" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="networkResource">网络资源需求</option>
                                                    <option value="storageResource">存储资源需求</option>
                                                    <option value="dataResource">数据资源需求</option>
                                                    <option value="virtualServerNumber">虚拟服务器台数</option>

                                                </select>
                                                <input type="button" id="addRequirement" value="增加" disabled />
                                                <input type="button" id="delRequirement" value="删除" disabled />
                                            </td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">计划开工时间</td>
                                            <td>
                                                <input type="number" id="planStartYear" class="input_tiny" min="1990" max="2020" step="1" style="height: 23px" disabled>&nbsp;年&nbsp;<input type="number" id="planStartMon" class="input_tiny" min="0" max="12" step="1" style="height: 23px" disabled>&nbsp;月</td>
                                            <td class="lableTd t_r">计划完工时间</td>
                                            <td>
                                                <input type="number" id="planEndYear" class="input_tiny" min="1990" max="2020" step="1" style="height: 23px" disabled>&nbsp;年&nbsp;<input type="number" id="planEndYearMon" class="input_tiny" min="0" max="12" step="1" style="height: 23px" disabled>&nbsp;月</td>
                                        </tr>

                                        <tr class="disable">
                                            <td class="lableTd t_r">备注</td>
                                            <td colspan="3">
                                                <textarea name="remarks" rows="4" disabled></textarea></td>
                                        </tr>
                                    </table>

                                </form>
            </div>
            <div class="mb10 t_c">
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

</body>
</html>
