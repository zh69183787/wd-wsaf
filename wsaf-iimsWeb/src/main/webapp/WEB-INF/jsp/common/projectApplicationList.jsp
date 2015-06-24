<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>项目计划申报</title>
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
    
    <script src="js/f.defaultJs.js"></script>
    <script src="js/f.projectPlan.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $.getMenu({"url":"${pageContext.request.contextPath}", "modName":"projectPlan"});
        	var count=false;
            $("[name=status] option").each(function(){
                if($(this).text()=="请选择")
                {               	
                	if(count)
                	$(this).remove();
                	count=true;
                }
                });
            
            $("[name=year]").val("");
            var isleader = $.userIdentity({"url":"${pageContext.request.contextPath}"});
            $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", isleader);
           
            window.onfocus = function () {
                var _page = "1";
                if ($(".selected a").length > 0 && $(".selected a").text() != "")
                    _page = $(".selected a").text();

                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=" + _page, isleader);  
            }
            
            $("#searchbtn").click(function () {
                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", isleader);
            });
            
            $("#renewbtn").click(function () {
                $("#projectAppform input,#projectAppform select").not("input[type=button],[name=reportUnit]").val("");
                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", isleader);
            });
        });
    </script>
</head>

<body class="Flow">
    <div class="main">
        <div class="ctrl clearfix nwarp">
            <div class="fl">
                <img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl nwarp">
                <ul>
                    <li><a>首页</a></li>
                    <li><a>项目管理</a></li>
                    <li class="fin">项目计划申报<div id="myname" style="display: none"></div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="pt45">

            <div class="filter">
                <div class="query">
                    <div class="filter_search p8">
                        <!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                        <form id="projectAppform">
                            <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="t_r">申报单位</td>
                                    <td>
                                        <input type="text" id="lreportUnit" class="input_large" name="reportUnit" disabled /></td>
                                    <td class="t_r">年度</td>
                                    <td>
                                        <select name="year" class="input_large">
                                        </select>
                                    </td>
                                    <td class="t_r">项目类别</td>
                                    <td>
                                        <select name="projectType" class="input_large">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r">项目名称</td>
                                    <td>
                                        <input type="text" name="projectName_l" class="input_large"></td>
                                    <td class="t_r">项目状态</td>
                                    <td>
                                        <select name="status" class="input_large">
                                     
                                        </select></td>
                                    <td class="t_r">项目开始时间</td>
                                    <td>
                                        <input type="number" id="planStartYear" min="1990" max="2020" step="1" class="input_small">&nbsp;年&nbsp;<input type="number" id="planStartMon" min="0" max="12" step="1" class="input_small">&nbsp;月&nbsp;至
                       &nbsp;<input type="number" id="planEndYear" min="1990" max="2020" step="1" class="input_small">&nbsp;年&nbsp;<input type="number" id="planEndYearMon" min="0" max="12" step="1" class="input_small">&nbsp;月</td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="t_c">
                                        <input type="button" id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" />
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="fn clearfix">
                    <h5 class="fl"><a class="fl">项目计划申报表</a></h5>
                    <div class="fr">
                     <input type="button" id="oututBtn" value="导 出"  style="margin: 0 15px">
                    &nbsp;
                    <input type="button" id="addbtn" value="新 增" onclick="window.open('${pageContext.request.contextPath}/projectPlan/projectApplicationEdit');" >
                    
                    </div>
                   
                </div>
            </div>
            <!--Filter End-->
            <!--Table-->
            <div class="mb10">
                <table width="100%" class="table_1">
                    <tbody>
                        <tr class="tit">
                            <td class=" t_c">
                                <input type="checkbox" id="test_checkbox_1" name="test_checkbox_1" /></td>
                            <td class="sort"><a><span class="fl">序号</span></a></td>
                            <td class="sort"><a><span class="fl">年度</span></a></td>
                            <td class="sort"><a><span class="fl">项目名称</span></a></td>
                            <td class="sort"><a><span class="fl">总投资估算</span></a></td>
                            <td class="sort"><a><span class="fl">项目类别</span></a></td>
                            <td class="sort"><a class="asc desc">拟开始年月</a></td>
                            <td class="sort"><a><span class="fl">拟完工年月</span></a></td>
                            <td class="sort"><a><span class="fl">状态</span></a></td>
                            <td class="sort"><a><span class="fl"></span></a></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr class="tfoot">
                            <td colspan="10">
                                <div class="clearfix">
                                    <span class="fl"></span>
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

