<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.OutputStream"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>申通地铁集团信息管理中心</title>
<meta charset="utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/formalize.css" />
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/default/imgs.css" />
<link rel="stylesheet" href="css/reset.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/json2.js"></script>
<script src="js/projectPlan.js"></script>
<script src="js/appVersion.js"></script>
<script type="text/javascript">

var SelectObj="";
var Iframenow=0;
	$(document).ready(function() {
	   QueryString.Initial();
	   InitSelect();
	   
		//alert(QueryString.GetValue("appType"));
	  
	  //minute("123","123","123","123");
	    $("#dc").click(function(){
 	       window.location.href="${pageContext.request.contextPath}/basicCrud/appVersion/export2Excel?dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType")+"&type=appVersion";
		});
	});		
	 /* 	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.showObjectOption(_page); 
          	 }   */
          	
  	$.showObjectOption = function(_page) {
		//alert($("#searchform").serialize());
		 //alert(0);
		$.ajax({
		      
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/page?pageSize=18&pageNum="+_page+"&dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType"),
					data : "",	
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
					//alert(12);
						//alert(JSON.stringify(obj.result));
						if (obj.success) {
					//	alert(123);
						   
				
							loadinformationToVersion(obj);
							  $.setBtn();
						}
					}
				});
	}
function del(id){
     		$.ajax({
		      
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/del/"+id,
					data : "",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						//alert(JSON.stringify(obj.result.pageInfo));
						if (obj.success) {
						//alert(0);
							$.showObjectOption();
						}
					}
				});
  }
  
    
  function modify(id){
      window.location.href="${pageContext.request.contextPath}/appVersion/AppVersionModify?backpage=2&id="+id+"&dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType");
  }
  function add(){
    window.location.href="${pageContext.request.contextPath}/appVersion/AppVersionAdd?backpage=2"+"&dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType");
  }
  
  
$.setBtn = function(){
	 $(".topage").click(function(){
 		$.showObjectOption($(this).text());
 		
		});
	    
    $(".prepage").click(function(){
 	 var nowpage=parseInt($("#page>.selected  a").text());
 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.showObjectOption(topage);
 		 }
		}); 
  
   $(".nextpage").click(function(){
     //alert(0);
 	 var nextpage=parseInt($("#page>.selected  a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		  $.showObjectOption(nextpage);

		});  
		
     $("#gopagebtn").click(function(){
		                    	  var topage=parseInt($("#gopage").val());
						      
						        	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
					        		 {
					        		 $.showObjectOption(topage);
					        		 }
						        	 else
						        		 {
						        		 alert("超出索引值");
						        		 }
									}); 
   }
   
   
   
   function InitSelect(){
   //alert(0);
   $.ajax({
		      
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/getEntityProperty",
					data : "",	
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						if (obj.success) {
						    SelectObj=obj;
						  //  alert(SelectObj);
						    $.showObjectOption();
						  
						}
					}
				});
   }
   
   

function loadinformationToVersion(obj){
	  var tableIteam="",dept="";
	    //alert(obj.result.content);
	   // alert(SelectObj);
	   var appType,appLevel,authorize;
	   $.each(obj.result.content, function(Index, object){
		   //alert(Index);
		    dept=object.dept;
		    //alert(object.dept);
			   $.each(SelectObj.result.fieldProperties,function(index,sl){
			    	if(sl.path=="dept"){
			    		$.each(sl.option,function(i,o){
			    			if(i==dept){
			    			//alert(i);
			    				dept=o;
			    			}
			    		});
			    	}
			    }); 
			  //  alert(0);
		    appType=object.appType;
		  appLevel=object.appLevel;
		   authorize=object.authorize;
		   if(appType!=null&&appType!=""){
			   switch(appType){
			   case"opsys":
				   appType="操作系统";
				   break;
			   case"oa":
				   appType="办公软件";
				   break;
			   case"app":
				   appType="应用软件";
				   break;
			   }
		   }else{
			   appType="";
		   }
		  // alert(0);
		   if(appLevel!=null&&appLevel!=""){
			   switch(appLevel){
			   case"basic":
				   appLevel="基础";
				   break;
			   case"senior":
				   appLevel="高级";
				   break;
			   }
		   }else{
			   appLevel="";
		   }
		   //alert(0);
		     
		   if(authorize!=null&&authorize!=""){
			   switch(authorize){
			   case"yes":
				   authorize="已授权";
				   break;
			   case"no":
				   authorize="未授权";
				   break;
			   }
		   }else{
			   authorize="";
		   }
		    
		   tableIteam+="<tr class=\"tableItem\"><td>"+object.id+"</td><td>"+dept+"</td><td>"+object.deviceNum+"</td><td>"+appType+"</td><td>"+appLevel+"</td><td>"+object.appName+"-"+object.appVersion+"</td><td>"+authorize+"</td><td><a href=\"javascript:modify("+object.id+");\" style=\"display:inline\">修改</a>&nbsp;<a href=\"javascript:del("+object.id+");\" style=\"display:inline\">删除</a></td></tr>"; 
	  
	  
	   });
	   // alert(tableIteam);
		$("#table_1 tbody").empty();
	 	$("#table_1 tbody").append(tableIteam); 
	    
	   // alert(obj.result.pageInfo.pageSize);
	  
	    
	
	    	if (obj.result.pageInfo != null) 
				{
				
					var _pageinfo=obj.result.pageInfo;
					
					var nowcount=$("#table_1").find(".tableItem");
				   
					if(_pageinfo.pageSize>nowcount.length)
						{
						var minMum=_pageinfo.pageSize-nowcount.length;
						for(var i=0;i<minMum;i++)
							{
							$("#table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
							}
						}
					
					$(".tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
			         
			         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
			         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
			        
			         var  pageStyle="";
			         if(_pageinfo.totalPages>7)
			        	 {
			        	 if(_pageinfo.currentPage<=1)
			        		 {
			        		 //pageStyle+="<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
			        		 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">5</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
			        		 }else if(_pageinfo.currentPage==2){
			        			 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">5</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">3</a></li><li class=\"selected\"><a class=\"topage\">2</a></li><li ><a class=\"topage\">1</a></li>";
			        		 }
			        	 else
			        		 {
			        		
			        			 if(_pageinfo.totalPages-_pageinfo.currentPage==0){
			        				 var pa=_pageinfo.currentPage-4; pb=_pageinfo.currentPage-3;pc=_pageinfo.currentPage-2; pd=_pageinfo.currentPage-1;
			        				 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li>  <li><a class=\"topage\">"+pd+"</a></li> <li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>";
			        			 }else if(_pageinfo.totalPages-_pageinfo.currentPage==1){
			        				 var pa=_pageinfo.currentPage-3; pb=_pageinfo.currentPage-2;pc=_pageinfo.currentPage-1; pd=_pageinfo.currentPage+1;
			        				 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li> <li><a class=\"topage\">"+pd+"</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li>  <li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>"; 
			        			 }else{
			        				 var pa=_pageinfo.currentPage-2; pb=_pageinfo.currentPage-1;pc=_pageinfo.currentPage+1; pd=_pageinfo.currentPage+2;
				        		     pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li> <li><a class=\"topage\">"+pd+"</a></li> <li><a class=\"topage\">"+pc+"</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li> <li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>";
			        			 }
			        			
			        		 }
			        	 }
			         else
			        	 {
			        	for(var j=1;j<=_pageinfo.totalPages;j++)
							{
			        		if(j==_pageinfo.currentPage)
			        			{
			        			pageStyle="<li class=\"selected \"><a>"+j+"</a></li>"+pageStyle;
			        			
			        			}
			        		else
			        			{
			        			pageStyle="<li><a class=\"topage \">"+j+"</a></li>"+pageStyle;

			        			}
							}
			        	 }
			      
			         _menu+=pageStyle+"<li><a  class=\"prepage\">&lt;&lt;</a></li>";
			         //alert(pageStyle);
			         $("ul.pager li").remove();
			         $("ul.pager").append(_menu);   
				
}else{
	
	   $(".tfoot span:first-child").text("无相关信息！请重新搜索！");
}
}  
   
</script>

<style type="text/css">
.red{
 color: red;
}
</style>



</head>

<body>


	<div class="main">
			<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl nwarp">
            	<ul>
                	<li><a href="javascript:;">首页</a></li>
                	<li><a href="javascript:;">正版化管理</a></li>
                	<li class="fin">正版化台账</li>
                </ul>
            </div>
            <div class="fr lit_nav nwarp">
            	<ul>
                   <li class="selected"><a class="print" href="javascript:;">打印</a></li>
                    <li><a class="express" href="javascript:;">导出数据</a></li>
                    <li class="selected"><a class="table" href="javascript:;">表格模式</a></li>
                    <li><a class="treeOpen" href="javascript:;">打开树</a></li>
                    <li><a class="filterClose" href="javascript:;">关闭过滤</a></li>
                </ul>
            </div>
   		</div>	
        <!--Ctrl End-->
		<div class="pt45">
		  <!--Tabs_2-->
        <div class="tabs_2 nwarp">
        	<ul class="nwarp" >
            		<li ><a href="${pageContext.request.contextPath}/appCount/AppCountList"><span>正版化台账-设备类别</span></a></li>
            	<li class="selected"><a href="javascript:;"><span>正版化台账-设备详细</span></a></li>
            </ul>
        </div>
        <!--Tabs_2 End-->
			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<form id="searchform">
							<table class="nwarp" width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tbody>
								    
                  
                    <tr id="tr_1" >
            
             
                      
                               
                  </tr >
        
								</tbody>
								<tfoot>
								
								</tfoot>

							</table>
						</form>
					</div>
				</div>
				<div class="fn clearfix">
					<h5 class="fl">
						<a href="javascript:;" class="colSelect fl"></a>
					</h5>
              <input type="submit" name="button2" id="button2" onclick="add();" value="新 增" class="fr">
              <input type="submit" name="button2" id="dc" value="导 出" class="fr"> 
             
				</div>
			</div>
			<!--Filter End-->	
			<!--Table-->
			<div class="mb10">
				<table width="100%" id="table_1" class="table_1" id="maintable">
					<thead>
						<tr class="tit">
						
							<td ><a href="javascript:;"><span class="fl">ID</span><i></i>
							</a>
							</td>
							<td ><a href="javascript:;"><span class="fl">部门</span><i></i>
							</a>
							</td>
								<td ><a href="javascript:;"><span class="fl">设备编号</span><i></i>
							</a>
							</td>
							<td ><a href="javascript:;"><span class="fl">软件类型</span><i></i>
							</a>
							</td>
							<td ><a href="javascript:;"><span class="fl">软件级别</span><i></i>
							</a>
							</td>
							
							<td><a href="javascript:;"><span class="fl">版本号</span><i></i>
							</a>
							</td>
							
							<td><a href="javascript:;"><span class="fl">授权情况</span> </a>
							</td>
							<td><a href="javascript:;"><span class="fl">操作</span> </a>
							</td>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="9">
								<div class="clearfix">
									<span class="fl"></span>
									<ul id="page" class="fr clearfix pager"></ul>
								</div></td>
						</tr>
					</tfoot>
				</table>

			</div>
			<!--Table End-->
		</div>
	</div>

</body>
</html>
