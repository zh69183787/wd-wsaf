<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>虚拟化资源台帐</title>
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
	<script src="js/accounting.js"></script>
    <script type="text/javascript">
		 $(document).ready(function () {
        	$.postSearchFormVirtual("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
        	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.postSearchFormVirtual("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
          	 };
        	$("#searchbtn").click(function(){ 		
				$.postSearchFormVirtual("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
        	  
        	$("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
				$.postSearchFormVirtual("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			
        	}); 	
		
		function close(){
			var a = document.getElementById("iframe_xx");
			var b = document.getElementById("iframe_gx");
		    a.style.display="none";
			 b.style.display="none";
			}
			function open(id){
				var a = document.getElementById("iframe_xx");
				a.style.display="";
				$.findByIdVirtual("${pageContext.request.contextPath}",id);
				}
			function open2(id){
				var a = document.getElementById("iframe_gx");
				a.style.display="";
				$.findByIdVirtual("${pageContext.request.contextPath}",id);
				}
			function del(id){
				$.delByIdVirtual("${pageContext.request.contextPath}",id);
				}
			function save(id){
				var otherData="&status=finish";
           		 otherData+="&id="+id;
				$.postsaveVirtual("${pageContext.request.contextPath}","virtualResource",otherData);
			}

		
	</script>
  
</head>

<body class="Flow">
	<div id="iframe_xx"  class="f_window" style="width:690px; display:none;  margin:15% 25% 0 25%;" >

        <div class="con">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="table2">
  <thead><th colspan="4"><h5 class="fl">申请表单详情</h5><span class="fr pt5 mr5"><a href="javascript:close();" >关闭</a></span></th></thead>
   <tbody id="tb1"></tbody>                                 
                        
</table>
        

      </div>

      <div class="button t_c">
      	
        </div>

    </div>
<form id="virtualResource">
   <div id="iframe_gx"  class="f_window" style="width:690px;  display:none;  margin:10% 25% 0 25%;" >

   <div class="con">
   
   
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="table3">
<thead><th colspan="4"><h5 class="fl">信息更新</h5><span class="fr pt5 mr5"><a href="javascript:close();" >关闭</a></span></th></thead>
<tbody id="tb2"></tbody>
	                           
</table>
      </div>
	<div class="button t_c" id="div1">
            </div>
        </div>

    </form>
	




	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>资源管理</a></li>
                	  <li class="fin">资源台帐管理</li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
		
         
                    <div class="tabs_2">
                        <ul>
                            <li><a href="/iims/netResourceBook/netAccounting"><span>网络接入台帐</span></a></li>
                            <li><a href="/iims/accountResourceBook/accountAccounting"><span>系统账户台帐</span></a></li>
                            <li><a href="/iims/vpnResourceBook/vpnAccounting"><span>VPN台帐</span></a></li>
                            <li><a href="/iims/wirelessResourceBook/wirelessAccounting"><span>无线网络台帐</span></a></li>
                            <li><a href="/iims/internetResourceBook/internetAccounting"><span>特定互联网台帐</span></a></li>
                            <li class="selected"><a href=""><span>虚拟化资源台帐</span></a></li>
                            
                        </ul>
        			</div>
                
          
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="projectAppform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    	<td class="t_r">申请部门</td>
                      	<td><input  type="text"  id="lreportUnit" class="input_large" name="applyDept"/>
                      		
                      	
                      	</td>
                      	
	                      <td class="t_r">使用人姓名</td>
	                      <td><input  type="text"  id="lreportUnit" class="input_large" name="userName"/></td>
                     
                     <td class="t_r">系统名称</td>
                      <td><input type="text" id="lreportUnit" name="sysName" /></td>
                    </tr>
                  	<tr>
                        <td class="t_r">办理工程师</td>
                      <td><input type="text" id="lreportUnit" name="implementEngineer" /></td>
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
           <!--xinxi-->
             <input type="button" id="oututBtn" value="导 出"  class="fr" style="margin:0 15px">   &nbsp;
             
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1" id="table1">
                <tbody>
                   <tr class="tit">
                       <td class=" t_c"></td>
                       <td class="sort"><a><span class="fl">申请部门</span></a></td>
                       <td class="sort"><a><span class="fl">使用人姓名</span></a></td>
                       <td class="sort"><a ><span class="fl">联系电话</span></a></td>
                       <td class="sort"><a ><span class="fl">所属项目</span></a></td>
                       <td class="sort"><a ><span class="fl">办理日期</span></a></td>
                       <td class="sort"><a ><span class="fl">办理人</span></a></td>   
                       <td class="sort"><a ><span class="fl">操作</span></a></td>
                       <td>&nbsp;</td>                        
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="10">
                        <div class="clearfix">
                            <span class="fl">当前无记录显示</span>
                            <ul class="fr clearfix pager">
                              <li>Pages:1/1
                                  <input type="number" id="number" name="number" min="0" max="999" step="1" class="input_tiny" />
                                  <input type="submit" name="button" id="button" value="Go">
                                </li>
                                <li><a>&gt;&gt;</a></li>
                              
                                <li class="selected"><a>1</a></li>
                                <li><a>&lt;&lt;</a></li>
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
