<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>网上测评列表</title>
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

    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="js/jquery.formalize.js"></script>
    <script src="js/cpqMain.js"></script>
    <style>
        .ui-datepicker-title span {
            display: inline;
        }

        button.ui-datepicker-current {
            display: none;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");

            $("#searchbtn").click(function () {
                $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");
            });

            $(document).on("click", ".del", function () {
                if (confirm("确认删除该条记录吗？")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}" + "/basicCrud/cpqMain/del/" + $(this).attr("mainId"),
                        type: 'post',
                        dataType: 'json',
                        success: function (data, status, xhr) {
                            if (status == "success" && data != null) {
                                if (data.success == true) {
                                    alert("操作成功！");
                                    $.postSearchForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");
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
            })

            $('#startTime_s').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                closeText: '清除',
                currentText: "startTime_s"//仅作为“清除”按钮的判断条件
            });
            $('#startTime_e').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                closeText: '清除',
                currentText: "startTime_e"//仅作为“清除”按钮的判断条件
            });
            $('#endTime_s').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                closeText: '清除',
                currentText: "endTime_s"//仅作为“清除”按钮的判断条件
            });
            $('#endTime_e').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                closeText: '清除',
                currentText: "endTime_e"//仅作为“清除”按钮的判断条件
            });

            $(document).on("click", ".ui-datepicker-close", function () {
                if ($(this).parent("div").children("button:eq(0)").text() == "startTime_s") $("#startTime_s").val("");
                if ($(this).parent("div").children("button:eq(0)").text() == "startTime_e") $("#startTime_e").val("");
                if ($(this).parent("div").children("button:eq(0)").text() == "startTime_s") $("#endTime_s").val("");
                if ($(this).parent("div").children("button:eq(0)").text() == "startTime_e") $("#endTime_e").val("");

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
                <li><a>首页</a></li>
                <li><a>测评管理</a></li>
            </ul>
        </div>
    </div>
    <div class="pt45">

        <div class="filter">
            <div class="query">
                <div class="filter_search p8">
                    <!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                    <form id="cpqMainform">
                        <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="t_r">测评名称</td>
                                <td><input type="text" id="cpqName" class="input_xxlarge" name="cpqName"/></td>
                                <td class="t_r">状态</td>
                                <td><select name="status" id="status">
                                    <option value="">请选择</option>
                                    <option value="draft">草稿</option>
                                    <option value="doing">测评中</option>
                                    <option value="finish">完成</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td class="t_r">有效开始时间</td>
                                <td><input readonly type="text" id="startTime_s" class="input_large"
                                           name="startTime_s"/>
                                    至<input readonly type="text" id="startTime_e" class="input_large"
                                            name="startTime_e"/>
                                </td>
                                <td class="t_r">有效结束时间</td>
                                <td><input readonly type="text" id="endTime_s" class="input_large" name="endTime_s"/>
                                    至<input readonly type="text" id="endTime_e" class="input_large" name="endTime_e"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="t_r">创建人</td>
                                <td><input type="text" id="creator" class="input_xlarge" name="creator"/></td>
                                <td class="t_r">是否开放</td>
                                <td><select name="opened" id="opened">
                                    <option value="">请选择</option>
                                    <option value="yes">开放</option>
                                    <option value="no">不开放</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td colspan="6" class="t_c">
                                    <input type="button" id="searchbtn" value="搜 索"/>&nbsp;<input type="reset"
                                                                                                  id="renewbtn"
                                                                                                  value="重 置"/>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="fn clearfix">
                <h5 class="fl"><a class="fl">网上测评</a></h5>
                <input type="button" id="addbtn" value="新 增"
                       onclick="window.open('${pageContext.request.contextPath}/cpqMain/cpqMainEdit');" class="fr">
            </div>
        </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
            <table width="100%" class="table_1">
                <tbody>
                <tr class="tit">
                    <td style="width: 5%;" class=" t_c"><input type="checkbox" id="test_checkbox_1"
                                                               name="test_checkbox_1"/></td>
                    <td class="sort" style="width: 5%;"><a><span class="fl">序号</span></a></td>
                    <td class="sort" style="width: 35%;"><a><span class="fl">测评名称</span></a></td>
                    <td class="sort" style="width: 5%;"><a><span class="fl">创建人</span></a></td>
                    <td class="sort" style="width: 5%;"><a><span class="fl">是否开放</span></a></td>
                    <td class="sort" style="width: 10%;"><a><span class="fl">状态</span></a></td>
                    <td class="sort" style="width: 10%;"><a><span class="fl">有效开始时间</span></a></td>
                    <td class="sort" style="width: 10%;"><a><span class="fl">有效结束时间</span></a></td>
                    <td class="sort" style="width: 15%;"><a><span class="fl">操作</span></a></td>
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

