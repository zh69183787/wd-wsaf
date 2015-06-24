<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8" />
		<meta http-equiv="x-ua-compatible" content="IE=8">
		<title>提出意见</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/formalize.css" />
		<link rel="stylesheet" href="css/page.css" />
		<link rel="stylesheet" href="css/default/imgs.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
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
		<script src="js/actSuggestion.js"></script>
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
			
			
			$.ajax({
            	url:"${pageContext.request.contextPath}/ca/getCookies",
            	async:false,
//             	cache:false,
            	type: 'post',
           		dataType : 'json',
           		data:{},
           		success: function (data) {
           				if(data!=null){
           					$("#loginName").val(data.loginName+data.deptId);
           				}
           		}
            });	
            
			$.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");

            $("#searchbtn").click(function () {
                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");
            });	
            $("#cancle").click(function(){
            	$("#name").val("");
//             	$("#name").attr("placeholder", "请输入意见名称");
            });		
        });
    </script>
	<style type="text/css">
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
                	<li class="fin"><a  href="<%=basePath%>actTheme/actThemeList">意见管理</a></li>
                </ul>
            </div>
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        <!--Tabs_2-->
<!--         <div class="tabs_2 nwarp"> -->
<!--         	<ul class="nwarp"> -->
<!--             	<li class="selected"><a href="#"><span>栏目名称</span></a></li> -->
<!--             	<li><a href="#"><span>栏目名称栏目名称</span></a></li> -->
<!--             	<li><a href="#"><span>栏目名称</span></a></li> -->
<!--             	<li><a href="#"><span>栏目名称</span></a></li> -->
<!--             	<li><a href="#"><span>栏目名称</span></a></li> -->
<!--             </ul> -->
<!--         </div> -->
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
                                                                          征集意见名称：
                         <input type="text" name="name" id="name" class="input_large" >&nbsp;
                         <input type="button" id="searchbtn" value="检索" />&nbsp;<input type="button" id="cancle" value="重置" />
                      </td>
                  </tr>
                </table>
            </div>
        	</div>
            <div class="fn clearfix">
            	<h5 class="fl"><a  class="colSelect fl">征集意见列表</a></h5>
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
                            <form id="actSuggestionForm">
		                            <input type="hidden" id="loginName" name="loginName" />
		                            <input type="hidden" id="ctId" name="ctId" />
                            </form>
                            
                            

      </div>
        <!--Table End-->
        </div>
</div>
</body>
</html>
