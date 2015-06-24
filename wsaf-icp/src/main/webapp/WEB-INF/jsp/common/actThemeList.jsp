<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%

    Properties properties = new Properties();
    String configPath = Thread.currentThread().getContextClassLoader().getResource("icpConfig.properties").getPath();
	FileInputStream fis = new FileInputStream(configPath);
	properties.load(fis);
	String workOrder = properties.getProperty("workOrder");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
		<title>征集主题列表</title>
		<base href="<%=basePath%>">
		
		<meta charset="utf-8"/>
	    <meta http-equiv="pragma" content="no-cache">
	    <meta http-equiv="cache-control" content="no-cache">
	    <meta http-equiv="expires" content="0">
	    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	    <meta http-equiv="description" content="This is my page">
		
		<link rel="stylesheet" href="css/formalize.css"/>
	    <link rel="stylesheet" href="css/page.css"/>
	    <link rel="stylesheet" href="css/default/imgs.css"/>
	    <link rel="stylesheet" href="css/reset.css"/>
	    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>

		<!--[if IE 6.0]>
           <script src="js/iepng.js" type="text/javascript"></script>
           <script type="text/javascript">
                EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
           </script>
        <![endif]-->
		<script src="js/html5.js"></script>
		<script src="js/jquery-1.7.1.min.js"></script>
		<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script src="js/jquery.formalize.js"></script>
		<script src="js/comConfig.js"></script>
		<script src="js/actTheme.js"></script>
        <script type="text/javascript">
        
        $(document).ready(function () {
            var $tbInfo = $(".filter .query input:text");
            $tbInfo.each(function () {
                $(this).focus(function () {
                    $(this).attr("placeholder", "");
                });
            });
			
			var $tblAlterRow = $(".table_1 tbody tr:even");
			if ($tblAlterRow.length > 0)
				$tblAlterRow.css("background","#fafafa");		
				
				
				
			$.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1","<%=workOrder%>");

            $("#searchbtn").click(function () {
                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1","<%=workOrder%>");
            });	
            
            
            $(document).on("click", ".del", function () {
                if (confirm("确认删除该条记录吗？")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}" + "/basicCrud/actTheme/del/" + $(this).attr("mainId"),
                        type: 'post',
                        dataType: 'json',
                        success: function (data, status, xhr) {
                            if (status == "success" && data != null) {
                                if (data.success == true) {
                                    alert("操作成功！");
                                    $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1","<%=workOrder%>");
                                }
                                else {
                                    alert("操作失败");
                                }
                            }
                            else {
                                alert("操作失败");
                            }

                        }
                    });
                }
            });
            $("#cancle").click(function(){
            	$("#name").val("");
//             	$("#name").attr("placeholder", "请输入意见名称");
            });
        });
    </script>
	<style>
	td.a a, div.a a{
	display:inline;
	}
	a{
		display:inline;
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
<!--                 	<li><a href="#">首页</a></li> -->
                	<li><a >互动交流平台</a></li>
                	<li class="fin">意见征集</li>
                </ul>
            </div>
            <div class="posi fr nwarp">
            	<ul>
                	<li class="fin"><a  href="<%=basePath%>actSuggestion/actSuggestionList">意见征集</a></li>
                </ul>
            </div>
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        <!--Tabs_2-->
        <!--Tabs_2 End-->
        <!--Filter-->
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="t_r"></td>
                      <td class="t_r"></td>
                      <td class="t_r"></td>
                      <td class="t_r">
                                                                          意见征集名称：
                         <input type="text" name="name" id="name" class="input_large" >&nbsp;
                         <input type="button" value="检索" id="searchbtn" />&nbsp;<input type="button" id="cancle" value="重置" />
                      </td>
                  </tr>
                </table>
            </div>
        	</div>
            <div class="fn clearfix">
            	<h5 class="fl"><a  class="colSelect fl">意见征集列表</a></h5>
            	<input type="submit" name="button2" id="button2" value="发起征集" class="fr"
            	  onclick="window.open('${pageContext.request.contextPath}/actTheme/actThemeEdit');">
            </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                              <tbody>
                              <tr class="tit">
                                <td class=" t_c">征集意见名称</td>
                                <td class=" t_c">意见类别</td>
                                <td class=" t_c">创建时间</td>
                                <td class=" t_c">开始时间</td>
                                <td class=" t_c">结束时间</td>
                                <td class=" t_c">创建人</td>
                                <td class=" t_c">创建部门</td>
                                <td class=" t_c">操作</td>
                              </tr>
                              
                              </tbody>
                              <tr class="tfoot">
									<td colspan="9">
				                        <div class="clearfix"><span class="fl"></span>
				                            <ul class="fr clearfix pager"></ul>
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
