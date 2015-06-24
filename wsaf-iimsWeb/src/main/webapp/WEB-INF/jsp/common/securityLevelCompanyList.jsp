<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>安全定级单位</title>
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
            $.postSecurityLevelSearchForm = function (firUrl, paging) {
                var otherData = "";

                if (firUrl != "") {

                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/securityLevelCompany/page",
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
                        var tableItem = "", statusChina = "";
                        $.each(data.result.content, function (entryIndex, entry) {
                            tableItem = "<tr class=\"tableItem\">";
                            entryIndex += 1;
                            tableItem += "<td>" + entryIndex + "</td><td>" +  entry.company  + "</td><td>" + entry.companyProvince + "省(自治区、直辖市)</br>" + entry.companyCity + "地(区、市、州、盟)</br>" + entry.companyCounty + " 县(区、市、旗)</br>" + "</td><td>" + entry.zipCode + "</td><td>" + entry.addressCode + "</td><td>姓名:";
                            tableItem += entry.leaderName + "</br>职务/职称:" + entry.leaderPost + "</br>办公电话:" + entry.leaderPhone + "</br>电子邮件:" + entry.leaderEmail + "</br>移动电话:" + entry.leaderMobile + "</td><td>" + $("[name=subordinateRelation] option[value=" + entry.subordinateRelation + "]").text() + "</td><td>" + $("[name=companyType] option[value=" + entry.companyType + "]").text() + "</td><td>" + $("[name=businessCategory] option[value=" + entry.businessCategory + "]").text() +"</td>";

                            tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"编辑\" onclick=\"window.open('" + firUrl + "/securityLevelCompany/securityLevelCompanyEdit?id=" + entry.id + "');\" \></td>";

                            $(".table_1").append(tableItem);
                        });

                        $.setPage(data.result);
                    }
                    else {
                        for (var i = 0; i <= 16; i++) {
                            $(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
                        }
                    }
                }
            }

            $.defaultjs();
            $.getMenu("${pageContext.request.contextPath}", "securityLevel");

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
                <img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起">
            </div>
            <div class="posi fl nwarp">
                <ul>
                    <li><a>首页</a></li>
                    <li><a>安全管理</a></li>
                    <li><a>基础信息</a></li>
                    <li class="fin">单位信息<div id="myname" style="display: none"></div>
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
                                    <td class="t_r">单位名称</td>
                                    <td>
                                       <input class="input_large" type="text" name="company_l"/></td>
                                    <td class="t_r">单位负责人姓名</td>
                                    <td>
                                        <input type="text" name="leaderName" class="input_large" name="company_l" />
                                    </td>
                                    <td class="t_r">隶属关系</td>
                                    <td>
                                        <select name="subordinateRelation" class="input_large">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r">单位类型</td>
                                    <td>
                                        <select name="companyType" class="input_large">
                                        </select></td>
                                    <td class="t_r">行业类别</td>
                                    <td colspan="3">
                                        <select name="businessCategory" class="input_large">
                                        </select></td>

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
                    <h5 class="fl"><a class="fl">单位基础信息</a></h5>

                    <input type="button" id="addbtn" value="新 增" onclick="window.open('${pageContext.request.contextPath}/securityLevelCompany/securityLevelCompanyAdd');" class="fr">
                </div>
            </div>
            <!--Filter End-->
            <!--Table-->
            <div class="mb10">
                <table width="100%" class="table_1">
                    <tbody>
                        <tr class="tit">
                            <td class="sort"><a><span class="fl">序号</span></a></td>
                            <td class="sort"><a><span class="fl">单位名称</span></a></td>
                            <td><a><span class="fl">单位地址</span></a></td>
                            <td class="sort"><a><span class="fl">邮政编码</span></a></td>
                            <td class="sort"><a><span class="fl">行政区划代码</span></a></td>
                            <td class="sort"><a class="asc desc">单位负责人</a></td>
                            <td class="sort"><a><span class="fl">隶属关系</span></a></td>
                            <td class="sort"><a><span class="fl">单位类型</span></a></td>
                            <td class="sort"><a><span class="fl">行业类别</span></a></td>
                    
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
