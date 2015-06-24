<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目审核</title>
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
	<script src="js/json2.js"></script>
	<script src="js/projectPlan.js"></script>
	    <script type="text/javascript">
        $(document).ready(function () {
        	 $("#startDate").datepicker({onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); },dateFormat:"yy-mm-dd"});
        	 $("#endDate").datepicker({onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); },dateFormat:"yy-mm-dd"});
        	$.postMeeting = function(firUrl,paging){

       		 if(firUrl!="")
       		   {	
       			 if($("#startDate").val()!="")
       				paging+="&startDate_s="+$("#startDate").val();
       			 
       			 if($("#endDate").val()!="")
        				paging+="&startDate_e="+$("#endDate").val();
       			 
         			 $.ajax({
       					  async: false,
       					    url : firUrl+"/basicCrud/meeting/page",
       						type : 'post',
       						data: $("#projectAppform").serialize()+paging,
       						success: function(data, status, xhr) {
       							
       							$.analyzeTableData(data, status, xhr,firUrl);
       						
       							$(".topage").click(function(){
       					 		$.postMeeting(firUrl,"&pageSize=16&pageNum="+$(this).text());
       					 		
       							});
       						   
       					       $(".prepage").click(function(){
       					 	   var nowpage=parseInt($(".selected a").text());

       					 	   if(nowpage>1)
       					 		 {
       					 		 var topage=nowpage-1;
       					 		$.postMeeting(firUrl,"&pageSize=16&pageNum="+topage);
       					 		 }
       							}); 
       					  
       					   $(".nextpage").click(function(){
       					 	 var nextpage=parseInt($(".selected a").text())+1;

       					 	 if(nextpage<=parseInt($("#gopage").attr("max")))
       							   $.postMeeting(firUrl,"&pageSize=16&pageNum="+nextpage);

       							}); 
       					   
       					   $("#oututBtn").click(function(){
       					 	
       					 	  var content =$("#projectAppform").serialize()+paging+otherData+"&sort=status asc,planStartDate desc"
       					 	  window.location.href=firUrl+"/basicCrud/projectPlan/export2Excel?"+content;

       					   }); 
       					   
       					   $("#gopagebtn").click(function(){
       					 	  var topage=parseInt($("#gopage").val());
       					   
       					     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
       					 		 {
       					 		$.postMeeting(firUrl,"&pageSize=16&pageNum="+topage);
       					 		 }
       					     	 else
       					     		 {
       					     		 alert("超出索引值");
       					     		 }
       								}); 
       							  
       				           }, 
       				           error: function() {
       				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
       				           }
       						});
       		          }
       	      }
       		
       //解析Table
       $.analyzeTableData= function(data, status, xhr,firUrl)
       	{
       		if (status == "success" && data != null)
       		{
       			$("tr.tableItem").remove();
       			
       			if (data.success == true) 
       			{
       				$("tr.tableItem").remove();
       				
       				$.each(data.result.content,function(entryIndex,entry) 
       				{
       					var tableItem="",mycount=1,mystartTime="",myendTime="";
       					if(entry.startTime!=null&&entry.startTime!="")
       						mystartTime=entry.startTime.substring(0,entry.startTime.length-3);
       					if(entry.endTime!=null&&entry.endTime!="")
       						myendTime=entry.endTime.substring(0,entry.endTime.length-3)
       						
       					tableItem = "<tr class=\"tableItem\">";
       					tableItem+="<td>"+mycount+"</td><td>"+$("[name=meetingType] option[value=" + entry.meetingType + "]").text()+"</td><td>"+entry.title+"</td><td>"+mystartTime+"</td><td>";
       					tableItem+=myendTime+"</td><td>"+$("[name=meetingRoom] option[value=" + entry.meetingRoom + "]").text()+"</td><td>"+entry.master+"</td>";
       					
       					var dataObj=jQuery.parseJSON(entry.topic),isreader=false;
						
						for ( var sitem in dataObj) 
						{
						  var dataObj2=jQuery.parseJSON(dataObj[sitem]);
						  
						  if(dataObj2.share.indexOf($("#myname").text())>=0)
							  isreader=true;
						}
       					
       					var  newpage="";
       					
       					if(entry.applyer==$("#myname").text())
       					{
       						
       							newpage="meetingManageEdit";
       					}
       					else if(isreader)
       					{
       						 newpage="meetingManageDetail";
       					}
       					else
       				    {
       						return true;
       					}
       					       					
       					tableItem+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"+firUrl+"/meeting/"+newpage+"?id="+entry.id+"');\" \></td>";
       					
       					$(".table_1").append(tableItem);
       					mycount+=1;	
       				});
       				
       				$.setPage(data.result);			
       			}
       			else
       				{
       				for(var i=0;i<=16;i++)
       				{
       				$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
       				}
       			  }
       		}
           }	
        	
        	$.defaultjs();     	
        	$.getMenu("${pageContext.request.contextPath}","meeting");
        	
        	$.ajax({
			    async: false,
			    url : "${pageContext.request.contextPath}/ca/getCurrentLoginInfo",
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
					   if (data.cookies!=null) 	
						{
						   $("#myname").text(data.cookies.loginName);
						}
					}
				}
		});
        	
        	$.postMeeting("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
        
        	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.postMeeting("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
          	 }
         	
        	

			$("#searchbtn").click(function(){ 		
				$.postMeeting("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			
			$("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
				$.postMeeting("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});	
        });
    </script>
    
</head>

<body class="Flow">
	<div class="main">
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a >首页</a></li>
                	  <li class="fin">会议管理<div id="myname" style="display:none"></div></li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
  
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="projectAppform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="t_r">会议室</td>
                      <td><select name="meetingRoom" class="input_large" >
                        
                          </select></td>
                      <td class="t_r">标题</td>
                      <td>
                      <input  type="text"  id="lreportUnit_l" class="input_large" name="title"  />
                      </td>
                     <td class="t_r">会议日期</td>
                      <td><input type="text"  id="startDate" />
                                                                               至
                        <input type="text"  id="endDate" /></td>
                    </tr>
                    <tr>
                      <td class="t_r">会议类型</td>
                      <td><select name="meetingType" class="input_large" >
                        <option value=""></option>
                          <option value="finishInnerAudit">待预审</option>
                          </select></td>
                      <td class="t_r">主持人</td>
                      <td  colspan="3"><input type="text" name="master_l" class="input_large" ></td>
                         </tr>
                      <tr>
                      <td colspan="6" class="t_c">
                       <input type="button"  id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" />
                      </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="fn clearfix">
            	<h5 class="fl"><a class="fl">会议记录</a></h5>
              <input type="button" id="addbtn" value="新 增"  onclick="window.open('${pageContext.request.contextPath}/meeting/meetingManageAdd');" class="fr">
        </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                <tbody>
                   <tr class="tit">
                    
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">会议类型</span></a></td>
                       <td class="sort"><a ><span class="fl">标题</span></a></td>
                       <td class="sort"><a ><span class="fl">开始时间</span></a></td>
                       <td class="sort"><a ><span class="fl">结束时间</span></a></td>
                       <td class="sort"><a class="asc desc">会议室</a></td>
                       <td class="sort"><a><span class="fl">主持人</span></a></td>  
                       <td class="sort"><a ><span class="fl"></span></a></td>                              
                   </tr>
                 </tbody>
                 <tfoot>
                   <tr class="tfoot">
                       <td colspan="10">
                         <div class="clearfix"><span class="fl"></span>
                           <ul class="fr clearfix pager"></ul>
                         </div>
                       </td>
                    </tr>
                  </tfoot>
           </table>
      </div>
        <!--Table End-->
     </div>
</div>
</body>
</html>

