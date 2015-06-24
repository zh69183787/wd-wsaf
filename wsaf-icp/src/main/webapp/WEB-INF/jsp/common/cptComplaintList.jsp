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

<html>
<head>
    <base href="<%=basePath%>">

    <title>监督投诉</title>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
	<meta http-equiv="x-ua-compatible" content="IE=8">
    <link rel="stylesheet" href="css/formalize.css"/>
    <link rel="stylesheet" href="css/page.css"/>
    <link rel="stylesheet" href="css/default/imgs.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>

    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="js/jquery.formalize.js"></script>
    <script src="js/comConfig.js"></script>
    <script src="js/cptComplain.js"></script>
    
    <style>
    a{
			display:inline;
		}
    
        .ui-datepicker-title span {
            display: inline;
        }

        button.ui-datepicker-current {
            display: none;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
             $("#addCptComplaint").click(function () {
               window.location.href = "<%=basePath%>cptComplaint/cptComplaintSave";
            });        
        
            $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1","<%=workOrder%>");

            $("#searchbtn").click(function () {
                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1","<%=workOrder%>");
            });

            $(document).on("click", ".del", function () {
                if (confirm("确认删除该条记录吗？")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}" + "/basicCrud/cptComplaint/del/" + $(this).attr("mainId"),
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

          
        });
    </script>
</head>

<body class="Flow">
	<div class="main">
    	<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl nwarp">
            	<ul>
                	<li><a href="#">互动交流平台</a></li>
                	<li class="fin">监督投诉</li>
                </ul>
                
            </div>
            <div class="posi fr nwarp">
            	<ul>
                    <li class="fin"><a target="_blank" href="<%=basePath%>cptComplaint/cptComplaintSave">填写监督投诉</a>
                    </li>               
                </ul>
            </div>
   		</div>

    <div class="pt45">

       <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                <form id="cpqComplaintform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                 
                    <tr>
                      <td style="text-align:right;">监督投诉名称:                  
                      <input type="text" name="cptTitle_l" id="cptTitle" class="input_large" />
                      
                          <input type="button" id="searchbtn" value="搜 索"/>&nbsp;
                          <input type="reset" id="renewbtn" value="重 置"/></td>
                  </tr>
                  
                
                </table>
                  </form>
            </div>
        	</div>
            <div class="fn clearfix">
            	<h5 class="fl"><a  class="colSelect fl">查询投诉列表</a></h5> 
            </div>
      </div>

        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
            <table width="100%" class="table_1">
                <tbody>
               <tr class="tit">
   <!--               <td class="t_c"><input type="checkbox" id="test_checkbox_1" name="test_checkbox_1" /></td> -->
                 <td class="t_c">监督投诉名称<i></i></td>
                 <td class="t_c">创建人<i></i></td>
                 <td class="t_c">创建时间<i></i></td>
                 <td class="t_c">创建部门<i></i></td>
                 <td class="t_c">操作<i></i></td>
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

