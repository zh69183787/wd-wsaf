<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    String url ="10.1.14.29";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>申通地铁集团信息管理中心</title>
<link rel="stylesheet" href="<%=basePath%>css/formalize.css" />
<link rel="stylesheet" href="<%=basePath%>css/page.css" />
<link rel="stylesheet" href="<%=basePath%>css/default/imgs.css" />
<link rel="stylesheet" href="<%=basePath%>css/reset.css" />
<link type="text/css" href="<%=basePath%>css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />

<script src="<%=basePath%>js/html5.js"></script>
<script src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
<script src="<%=basePath%>js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="<%=basePath%>js/jquery.formalize.js"></script>
<script src="<%=basePath%>js/json2.js"></script>
        <script type="text/javascript">
        $(document).ready(function () {
        
            $("#button").click(function(){
                window.location.href="<%=url%>";
            });
        });
	

    </script>
    <style type="text/css">
	   td{
		vertical-align:
		}
		.xiahuaxian{
			text-decoration:underline;
		}
	</style>



</head>

<body>
<div class="main">
    	<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="<%=basePath%>css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="����"></div>
            <div class="posi fl nwarp">
            	<ul>
                	<li><a href="#">首页</a></li>
                	<li><a href="#">运维和质量管理</a></li>
                	<li class="fin">网络运行监控图</li>
                </ul>
            </div>
            <div class="fr lit_nav nwarp">
            	<ul>
                    <li class="selected"><a class="print" href="#">网络运行监控图</a></li>
                </ul>
            </div>
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        <!--Tabs_2-->
        <div class="tabs_2 nwarp">
        	<ul class="nwarp">
            	<li class="selected"><a href="#"><span>网络运行监控图</span></a></li>
            </ul>
        </div>
        <!--Tabs_2 End-->
        	<div class="filter">
				<div class="query">
					<div class="filter_search p8">
					</div>
					</div>
					</div>
   <div class="mb10" id="table_3"  >
        	<table width="100%"   class="table_1">
                              <tbody>
                              <tr class="tit">
                              
                              
                                 
                                 <td width="100%"  class="t_c"><a href="#"><span class="fl">网络运行监控图</span><i></i></a></td>
                              </tr>
                              <tr>
                              
                         
                             <td class="t_c"> <img src="<%=basePath%>images/jiankong.png"width="100%" height="600px" ></td>
                              </tr>
                          
                              </tbody>
                           
                              <tr class="tfoot">
                                <td class="t_c">
                        <div class="clearfix">
                             <input type="button" name="button" id="button" value="监控跳转">
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
