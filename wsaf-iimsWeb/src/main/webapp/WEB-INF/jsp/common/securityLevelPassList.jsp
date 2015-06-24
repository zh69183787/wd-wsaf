<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>等级内容变更</title>
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
    <script src="js/projectPlan.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#beginTime").datepicker({ onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); },dateFormat: "yy-mm-dd" });
            $("#endTime").datepicker({ onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); },dateFormat: "yy-mm-dd" });
            $.getListDetails = function (firUrl) {
                var _retrunstr = false;

                if (firUrl != "") {
                    $.ajax({
                        async: false,
                        url: firUrl + "/ca/getCurrentLoginInfo",
                        type: 'post',
                        success: function (data, status, xhr) {
                            if (status == "success" && data != null) {
                                if (data.cookies !=null) {
                                    if ($("#lreportUnit").length > 0)
                                        $("#lreportUnit").text(data.companyId);



                                    if ($("#myname").length > 0)
                                        $("#myname").text(data.cookies.loginName);

                                    if (data.leaders != "") {
                                        for (var sitem in data.leaders) {
                                            if (data.cookies.loginName == sitem) {
                                                _retrunstr = true;

                                            }
                                        }
                                    }
                                }
                            }
                        }
                    });
                }
                return _retrunstr;
            }


            $.postSecurityLevelSearchForm = function (firUrl, paging) {
                if (firUrl != "") {
                    var otherData = "&companyId=" + $("#lreportUnit").text() + "&status_in=pass";
                    if ($("#beginTime").val() != "")
                        otherData += "&applyTime_s=" + $("#beginTime").val();

                    if ($("#endTime").val() != "")
                        otherData += "&applyTime_e=" + $("#endTime").val();

                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/securityLevel/page",
                        type: 'post',
                        data: $("#projectAppform").serialize() + paging + otherData,
                        success: function (data, status, xhr) {

                            $.analyzeSecurityLevel(data, status, xhr, firUrl);

                            $(".topage").click(function () {
                                $.postSecurityLevelSearchForm(firUrl, "&pageSize=16&pageNum=" + $(this).text());

                            });

                            $(".prepage").click(function () {
                                var nowpage = parseInt($(".selected a").text());

                                if (nowpage > 1) {
                                    var topage = nowpage - 1;
                                    $.postSecurityLevelSearchForm(firUrl, "&pageSize=16&pageNum=" + topage);
                                }
                            });

                            $(".nextpage").click(function () {
                                var nextpage = parseInt($(".selected a").text()) + 1;

                                if (nextpage <= parseInt($("#gopage").attr("max")))
                                    $.postSecurityLevelSearchForm(firUrl, "&pageSize=16&pageNum=" + nextpage);

                            });



                            $("#gopagebtn").click(function () {
                                var topage = parseInt($("#gopage").val());

                                if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
                                    $.postSecurityLevelSearchForm(firUrl, "&pageSize=16&pageNum=" + topage);
                                }
                                else {
                                    alert("超出索引值");
                                }
                            });

                        },
                        error: function () {
                            hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                        }
                    });
                }
            }

            //解析Table
            $.analyzeSecurityLevel = function (data, status, xhr, firUrl) {
                if (status == "success" && data != null) {
                    $("tr.tableItem").remove();

                    if (data.success == true ) {
                        $("tr.tableItem").remove();
                        var tableItem = "", projectTypeChina = "", statusChina = "";
                        $.each(data.result.content, function (entryIndex, entry) {
                            var mycount = entryIndex + 1, businessSecurityLevelChi, serviceSecurityLevelChi, sysSecurityLevelChi, businessStatusChi, statusChi;

                            tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\"test_checkbox_1\" name=\"test_checkbox_1\" /></td>";
                            tableItem += "<td>" + mycount + "</td><td>" + entry.systemName + "</td><td>" + $("[name=businessSecurityLevel] option[value=" + entry.businessSecurityLevel + "]").text() + "</td><td>" + $("[name=serviceSecurityLevel] option[value=" + entry.serviceSecurityLevel + "]").text() + "</td><td>";
                            tableItem += $("[name=sysSecurityLevel] option[value=" + entry.sysSecurityLevel + "]").text()  + "</td><td>" + $("[name=businessStatus] option[value=" + entry.businessStatus + "]").text() + "</td><td>" + entry.applyTime + "</td><td>" + $("[name=status] option[value=" + entry.status + "]").text() + "</td>><td>" + entry.levelConfirmDate + "</td>";

                            if (entry.status == "pass" && entry.applyerLoginname == $("#myname").text()) {

                                tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"内容调整\" onclick=\"window.open('" + firUrl + "/securityLevel/securityLevelContentChange?id=" + entry.id + "');\" \></td><td><input type=\"button\" name=\"button\" id=\"edit\" value=\"等级调整\" onclick=\"window.open('" + firUrl + "/securityLevel/securityLevelChange?id=" + entry.id + "');\" \></td>";
                            }
                            else {
                                tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('" + firUrl + "/securityLevel/securityLevelDetail?id=" + entry.id + "');\" \></td><td></td>";
                            }

                            $(".table_1").append(tableItem);
                        });

                        $.setPage(data.result);
                    }
                    else {
                        for (var i = 0; i <= 16; i++) {
                            $(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
                        }
                    }
                }
            }

            $.defaultjs();
            $.getMenu("${pageContext.request.contextPath}", "securityLevel");
            var isleader = $.getListDetails("${pageContext.request.contextPath}");
            $.postSecurityLevelSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1");

            window.onfocus = function () {
                var _page = "1";
                if ($(".selected a").length > 0 && $(".selected a").text() != "")
                    _page = $(".selected a").text();

                $.postSecurityLevelSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=" + _page);
            }



            $("#searchbtn").click(function () {
                $.postSecurityLevelSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1");
            });

            $("#renewbtn").click(function () {
                $("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
                $.postSecurityLevelSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1");
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
                    <li><a>安全管理</a></li>
                     <li><a>安全定级</a></li>
                    <li class="fin">等级内容变更<div id="myname" style="display: none"></div>
                        <div id="lreportUnit" style="display: none"></div>
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
                                    <td class="t_r">系统名称</td>
                                    <td>
                                        <input type="text" class="input_large" name="systemName_l" /></td>
                                    <td class="t_r">业务信息安全等级</td>
                                    <td>
                                        <select name="businessSecurityLevel" class="input_large">
                                        </select>
                                    </td>
                                    <td class="t_r">系统服务安全等级</td>
                                    <td>
                                        <select name="serviceSecurityLevel" class="input_large">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r">业务状态</td>
                                    <td>
                                        <select name="businessStatus" class="input_large">
                                        </select></td>
                                    <td class="t_r">信息系统的安全保护等级</td>
                                    <td>
                                        <select name="sysSecurityLevel" class="input_large">
                                        </select></td>

                                    <td class="t_r">流程状态 </td>
                                    <td>
                                        <select name="status" class="input_large" disabled="disabled">
                                        </select></td>
                                </tr>
                                <tr>
                                    <td class="t_r">申报日期</td>
                                    <td colspan="5">
                                        <input type="text" id="beginTime" class="input_small">&nbsp;至&nbsp;<input type="text" id="endTime" class="input_small">
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
                    <h5 class="fl"><a class="fl">安全定级申报表</a></h5>
                    <input type="button" id="addbtn" value="新 增" onclick="window.open('${pageContext.request.contextPath}/securityLevel/securityLevelAdd');" class="fr">
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
                            <td class="sort"><a><span class="fl">系统名称</span></a></td>
                            <td class="sort"><a><span class="fl">业务信息安全等级</span></a></td>
                            <td class="sort"><a><span class="fl">系统服务安全等级</span></a></td>
                            <td class="sort"><a><span class="fl">信息系统的安全保护等级</span></a></td>
                            <td class="sort"><a class="asc desc">业务状态</a></td>
                            <td class="sort"><a><span class="fl">申报日期</span></a></td>
                            <td class="sort"><a><span class="fl">流程状态</span></a></td>
                            <td class="sort"><a><span class="fl">上次系统等级测评日期  </span></a></td>
                            <td class="sort"><a><span class="fl"></span></a></td>
                            <td class="sort"><a><span class="fl"></span></a></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr class="tfoot">
                            <td colspan="12">
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

