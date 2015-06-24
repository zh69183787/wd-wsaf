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
	$(function() {
		$("#btndel").click(function(){
			 window.close();
				location.href = "${pageContext.request.contextPath}/meeting/meetingManageList";	
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
						    url : firUrl+"/basicCrud/meeting/get/"+id,
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
		
		
		$.getMenu("${pageContext.request.contextPath}","meeting");
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
                  <td colspan="3">      <input  type="text" style="width:400px" name="title" readonly/>
                          </td>
                 
                </tr>
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>开始日期</td>
                  <td colspan="3"><input type="date" id="date" name="mystartDate" readonly/></td>
                       </tr>
                   <tr>
                  <td class="lableTd t_r">开始时间</td>
                  <td><select name="startTime" class="input_small" disabled></select></td>
                  <td class="lableTd t_r">结束时间</td>
                  <td><select name="endTime" class="input_small" disabled></select></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4"><h5 class="fl">会议属性</h5></th>
                    </thead>
                       <tr>
                  <td class="lableTd t_r">会议地点</td>
                  <td><select name="meetingRoom" class="input_large" disabled>
                        
                          </select></td>
                  <td class="lableTd t_r">会议类型</td>
                  <td><select name="meetingType" class="input_large" disabled>
                        
                          </select></td>
  </tr>
     <tr>
                  <td class="lableTd t_r">主持人</td>
                  <td colspan="3"><input  type="text"  class="input_large" name="master" readonly="readonly"/></td>
              
  </tr>
                <tr>
                  <td class="lableTd t_r">出席人员</td>
                     <td colspan="3"><input  type="text"  class="input_large" name="presentMembers" readonly="readonly"/></td>
                </tr>
                <tr >
                  <td class="lableTd t_r">会议资料及议程上传</td>
                  <td colspan="3">
                                                              
                   <input type="button" id="addIssue" value="增加" disabled/>
                    <input type="button" id="delIssues" value="删除所有" disabled/>
                    </td>
               
                    
                </tr>
                
                <tr>
                  <td class="lableTd t_r">会议纪要</td>
                  <td colspan="3">
                  <table width="100%" class="table_summary"><thead><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan="2">操作</td></tr></thead><tbody></tbody>
                 
                  </table></td>
                </tr>

                <tr >
                  <td class="lableTd t_r">备注</td>
                  <td colspan="3"><textarea name="remarks" rows="4" placeholder="（字数最多不超过500字）" readonly="readonly"></textarea></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
                <th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </thead>
                <tr>
                    <td class="lableTd t_r"><div class="red"> *</div>申报人</td>
                  <td colspan="3"><input  type="text" class="input_large" id="applyerName" readonly/><input  type="text" class="input_large" name="applyer" readonly style="display:none"/>
                  <div style="display:none" id="myname"></div></td>
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
