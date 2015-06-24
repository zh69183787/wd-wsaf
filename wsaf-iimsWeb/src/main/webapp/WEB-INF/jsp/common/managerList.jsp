<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人员信息</title>
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
        	$.postSecurityLevelSearchForm = function(firUrl,paging){
      	      var otherData="&businessType=securityLevel";
      	     
      		 if(firUrl!="")
      		   {	
      			 $.ajax({
      					  async: false,
      					    url : firUrl+"/basicCrud/manager/page",
      						type : 'post',
      						data: $("#projectAppform").serialize()+paging+otherData,
      						success: function(data, status, xhr) {
      							
      							$.analyzeSecurityLevel(data, status, xhr,firUrl);
      							
      							 $(".topage").click(function(){
      						 		$.postSecurityLevelSearchForm(firUrl,"&pageSize=16&pageNum="+$(this).text());
      						 		
      								});
      							   
      						    $(".prepage").click(function(){
      						 	 var nowpage=parseInt($(".selected a").text());

      						 	 if(nowpage>1)
      						 		 {
      						 		 var topage=nowpage-1;
      						 		$.postSecurityLevelSearchForm(firUrl,"&pageSize=16&pageNum="+topage);
      						 		 }
      								}); 
      						  
      						   $(".nextpage").click(function(){
      						 	 var nextpage=parseInt($(".selected a").text())+1;

      						 	 if(nextpage<=parseInt($("#gopage").attr("max")))
      								   $.postSecurityLevelSearchForm(firUrl,"&pageSize=16&pageNum="+nextpage);

      								}); 
      						   
      						 
      						   
      						   $("#gopagebtn").click(function(){
      						 	  var topage=parseInt($("#gopage").val());
      						   
      						     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
      						 		 {
      						 		$.postSecurityLevelSearchForm(firUrl,"&pageSize=16&pageNum="+topage);
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
      $.analyzeSecurityLevel= function(data, status, xhr,firUrl)
      	{
      		if (status == "success" && data != null)
      		{
      			$("tr.tableItem").remove();
      			
      			if (data.success == true) 
      			{
      				$("tr.tableItem").remove();
      				var tableItem="",statusChina="";
      				$.each(data.result.content,function(entryIndex,entry) 
      				{
           
      					tableItem = "<tr class=\"tableItem\">";
      					entryIndex+=1;
      					tableItem+="<td>"+entryIndex+"</td><td>"+entry.company+"</td><td>"+$("option[value="+entry.role+"]").text()+"</td><td>"+entry.userName+"</td><td>";
      					tableItem+=entry.dept+"</td><td>"+entry.post+"</td><td>"+entry.office+"</td><td>"+entry.mobile+"</td><td>"+entry.fix+"</td>";
      					
      					tableItem+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"编辑\" onclick=\"window.open('"+firUrl+"/manager/managerEdit?id="+entry.companyId+"');\" \></td>";
      					var reg=new RegExp("null","g");
      					tableItem=tableItem.replace(reg,"");

      					$(".table_1").append(tableItem);
      				});
      				
      				$.setPage(data.result);			
      			}
      			else
      				{
      				for(var i=0;i<=16;i++)
      				{
      				$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
      				}
      			  }
      		}
          }	

        	$.defaultjs();     	
    		$.getMenu("${pageContext.request.contextPath}","manager");
        	
        	$.postSecurityLevelSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
        
        	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.postSecurityLevelSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
          	 }
         	
        	

			$("#searchbtn").click(function(){ 		
				$.postSecurityLevelSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			
			$("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
				$.postSecurityLevelSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
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
                	  <li><a>安全管理</a></li>
                	  <li class="fin">人员信息<div id="myname" style="display:none"></div></li>
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
                      <td class="t_r">组织/单位</td>
                      <td><input type="text" name="company_l" class="input_large" ></td>
                      <td class="t_r">信息安全角色</td>
                      <td colspan="3" >
                      <select name="role" style="width:250px">
                      </select></td>
                      </td>
                      
             
                      </select>
                      </td>
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
            	<h5 class="fl"><a class="fl">人员信息</a></h5>
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                <tbody>
                   <tr class="tit">
                        <td class="sort" ><a><span class="fl">序号</span></a></td>
                       <td class="sort" ><a><span class="fl">组织/单位</span></a></td>
                       <td ><a ><span class="fl">信息安全角色</span></a></td>
                       <td class="sort" ><a ><span class="fl">姓名</span></a></td>
                      
                       <td class="sort"  ><a class="asc desc">部门</a></td>
                       <td class="sort" ><a><span class="fl">职务</span></a></td>
                       <td class="sort" ><a ><span class="fl">办公电话</span></a></td>
                       <td class="sort" ><a ><span class="fl">移动电话</span></a></td> 
                       <td class="sort"  ><a ><span class="fl">传真</span></a></td>         
                       <td class="sort" ><a ><span class="fl"></span></a></td>                              
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
