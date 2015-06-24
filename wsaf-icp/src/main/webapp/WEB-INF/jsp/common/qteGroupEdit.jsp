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
		<title>新增分组</title>
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
		<script src="js/qteGroup.js"></script>
		<script src="js/qteGroup.js"></script>
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
				
                var mode="add";
                if(mode=="add")	{
                     $("#id").attr("disabled",true);
                }			
				var mainId = "${mainId}";
				mainId = parseInt(mainId);
				$("#mainId").val(mainId);
				$.getGroup("${pageContext.request.contextPath}",mainId);
				
				
				$("#ok").click(function(){
					window.opener = null;
	                window.open('', '_self');
	                window.close();
				});
				$("#cancle").click(function(){
					$("#id").val("");
					$("#name").val("");
					$("#orders").val("");
				});
				$("#addGroup").click(function(){
				    var info = $.validateForm();
				    if (info != "") {
                        alert(info + "\r\n请您修改");
                        $(this).dialog("close");
                        return false;
                    }
					$.postSaveMain("${pageContext.request.contextPath}", "addGroupForm", "/qteGroup/qteGroupEdit");
				});	
				
				
				$(document).on("click", ".del", function () {
                if (confirm("确认删除该条记录吗？")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}" + "/basicCrud/qteGroup/del/" + $(this).attr("mainId"),
                        type: 'post',
                        dataType: 'json',
                        success: function (data, status, xhr) {
                            if (status == "success" && data != null) {
                                if (data.success == true) {
                                    alert("操作成功！");
                                    $.getGroup("${pageContext.request.contextPath}",mainId);
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
                	<li class="fin">新增分组</li>
                </ul>
            </div>
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        <!--Filter-->
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                  <form id="addGroupForm" >
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="t_r">分组名称 </td>
                      <td>
                      <input type="text" name="name" id="name" class="input_large" placeholder="请输入分组名称">
                      </td>
                      <td class="t_r">次序号</td>
                      <td>
                      <input type="text" name="orders" id="orders" class="input_large" placeholder="请输入次序号">
                      </td>
                  </tr>
                </table>
                 <input type="hidden" id="mainId" name="mainId" /> 
                 <input type="hidden" id="id" name="id" disabled="disabled" /> 
             </form>
             <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td colspan="4" class="t_c">
                     <input type="button" name="addGroup" id="addGroup" value="新增" />&nbsp;
                     <input type="button" name="cancle" id="cancle" value="重置" />
                  </td>
                 </tr>
             </table>
            </div>
        	</div>
            
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                              <tbody>
                              <tr class="tit">
                                <td class=" t_c">分组名称</td>
                                <td class=" t_c">次序</td>
                                <td class=" t_c">操作</td>
                              </tr>
                              
                              </tbody>
                              <<tr class="tfoot">
									<td colspan="3" class="t_r">
				                        <input type="button" id="ok" value="OK" />
                   				    </td>
                              </tr>
                            </table>

      </div>
        <!--Table End-->
        </div>
</div>
</body>
</html>
