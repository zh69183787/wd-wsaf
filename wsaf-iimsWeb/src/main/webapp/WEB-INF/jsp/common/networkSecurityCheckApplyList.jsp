<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>安全自查</title>
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
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	
	<script src="js/html5.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.formalize.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/securityCheck.js"></script>
    <script type="text/javascript">
		 $(document).ready(function () {
  
			$.getListDetail("${pageContext.request.contextPath}");
			$( "[name=applyTime]" ).datepicker({ dateFormat:"yy-mm-dd"});
        	$.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
        	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
          	 };
        	$("#searchbtn").click(function(){
				$.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
        	  
        	$("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button],[name=company],[name=companyId]").val("");
				$.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			 
			$.setBtnApply("${pageContext.request.contextPath}"); 
        	}); 	
		function add(){
			window.open("/iims/securityCheck/securityCheckAdd");
		}

		
	</script>
  
</head>

<body class="Flow">
	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>安全管理</a></li>
                	  <li class="fin">安全自查</li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
		
         
                    <div class="tabs_2">
                        <ul>
                            <li class="selected"><a href="#"><span>安全自查</span></a></li>
                            
                        </ul>
        			</div>
                
          
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="projectAppform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    	<td class="t_r">单位名称</td>
                      	<td>
                      		<input type="text" disabled  name="company" />
                      		<input type="hidden"  name="companyId" />
						</td>
                     
                     <td class="t_r">填报日期</td>
                      <td><input type="text" id="date" name="applyTime" /></td>
                    </tr>
                    
                      <tr>
                      <td colspan="10" class="t_c">
                       <input type="button"  id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" />
                      </tr>
                    </table>
                </form>
            </div>
        </div>
         
        <div class="fn clearfix">
           <!--xinxi-->
              &nbsp;
             <input type="button" id="addbtn" value="新 增"  onclick="add();" class="fr">
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">单位名称</span></a></td>
                       <td class="sort"><a ><span class="fl">填报日期</span></a></td>
                       <td class="sort"><a ><span class="fl">状态</span></a></td>
                       <td class="sort"><a ><span class="fl">操作</span></a></td>
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="9">
                        <div class="clearfix">
                            <span class="fl">当前无记录显示</span>
                            <ul id="page"class="fr clearfix pager">
                              <li>Pages:1/1
                                  <input type="number" id="number" name="number" min="0" max="999" step="1" class="input_tiny" />
                                  <input type="submit" name="button" id="button" value="Go">
                                </li>
                                <li><a href="#">&gt;&gt;</a></li>
                              
                                <li class="selected"><a href="#">1</a></li>
                                <li><a href="#">&lt;&lt;</a></li>
                            </ul>
                        </div>
                                </td>
                              </tr>
           </table>
      </div>
        <!--Table End-->
     </div>
</div>
</body>
</html>
