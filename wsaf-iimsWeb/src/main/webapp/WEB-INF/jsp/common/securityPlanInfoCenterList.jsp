<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>目标计划审查列表</title>
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
 
            $.postSecurityPlanSearchForm = function (firUrl, paging, personIdentity) {
                if (firUrl != "") {
                	 var otherData = "";
                     //if ($.isNullOrEmpty($("[name=status] option:selected")))
                         otherData += "&status_in=infoDeptAudit,infoDeptLeaderAudit,infoDeptLeaderBack,pass&sort=planYear desc";
                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/securityPlan/page",
                        type: 'post',
                        data: $("#projectAppform").serialize() + paging + otherData,
                        success: function (data, status, xhr) {

                            $.analyzeSecurityLevel(data, status, xhr, firUrl, personIdentity);

                            $(".topage").click(function () {
                                $.postSecurityPlanSearchForm(firUrl, "&pageSize=16&pageNum=" + $(this).text(), personIdentity);

                            });

                            $(".prepage").click(function () {
                                var nowpage = parseInt($(".selected a").text());

                                if (nowpage > 1) {
                                    var topage = nowpage - 1;
                                    $.postSecurityPlanSearchForm(firUrl, "&pageSize=16&pageNum=" + topage, personIdentity);
                                }
                            });

                            $(".nextpage").click(function () {
                                var nextpage = parseInt($(".selected a").text()) + 1;

                                if (nextpage <= parseInt($("#gopage").attr("max")))
                                    $.postSecurityPlanSearchForm(firUrl, "&pageSize=16&pageNum=" + nextpage, personIdentity);

                            });



                            $("#gopagebtn").click(function () {
                                var topage = parseInt($("#gopage").val());

                                if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
                                    $.postSecurityPlanSearchForm(firUrl, "&pageSize=16&pageNum=" + topage, personIdentity);
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
            $.analyzeSecurityLevel = function (data, status, xhr, firUrl, personIdentity) {
                if (status == "success" && data != null) {
                    $("tr.tableItem").remove();

                    if (data.success == true ) {
                        $("tr.tableItem").remove();
                        var tableItem = "", projectTypeChina = "", statusChina = "", myindex = 1;
                        $.each(data.result.content, function (entryIndex, entry) {
                            var mycount = entryIndex + 1;

                            tableItem = "<tr class=\"tableItem\">";
                            tableItem += "<td>" + myindex + "</td><td>" + $("[name=company] option[value=" + entry.company + "]").text() + "</td><td>" +entry.planYear + "</td><td>" + $("[name=businessStatus] option[value=" + entry.businessStatus + "]").text() +"</td><td>";
                            tableItem += $("[name=status] option[value=" + entry.status + "]").text()+"</td>";

                            var newpage = "",strBtn="详情";

                            if (entry.handlerLoginname == $("#myname").text()) {

                                if (entry.status == "infoDeptAudit" || entry.status == "infoDeptLeaderBack") {
                                    newpage = "securityPlanReviewInfoCenter";
                                    strBtn="审查";
                                }
                                else if (entry.status == "infoDeptLeaderAudit") {
                                    newpage = "securityPlanReviewInfoLeader";
                                    strBtn="审核";
                                }
                                else {
                                    newpage = "securityPlanInfo";
                                    strBtn="详情";
                                }

                            }
                            else {
                                newpage = "securityPlanInfo";
                                strBtn="详情";
                            }

                         
                            
                            tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\""+strBtn+"\" onclick=\"window.open('" + firUrl + "/securityPlan/" + newpage + "?id=" + entry.id + "');\" \></td>";

                            $(".table_1").append(tableItem);
                            myindex += 1;
                        });

                        $.setPage(data.result);
                    }
                    else {
                        for (var i = 0; i <= 16; i++) {
                            $(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
                        }
                    }
                }
            }

            $.defaultjs();
            $.getMenu("${pageContext.request.contextPath}", "securityPlan");
           
            var personIdentity = $.personIdentity("${pageContext.request.contextPath}");

            $.postSecurityPlanSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", personIdentity);

            window.onfocus = function () {
                var _page = "1";
                if ($(".selected a").length > 0 && $(".selected a").text() != "")
                    _page = $(".selected a").text();

                $.postSecurityPlanSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=" + _page, personIdentity);
            }



            $("#searchbtn").click(function () {
                $.postSecurityPlanSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", personIdentity);
            });

            $("#renewbtn").click(function () {
                $("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
                $.postSecurityPlanSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", personIdentity);
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
                    <li><a>目标计划</a></li>
                    <li class="fin">目标计划审查列表<div id="myname" style="display: none"></div>
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
                                    <td class="t_r">计划年度</td>
                                    <td>
                                         <input type="text" name="planYear" class="input_tiny" onkeyup="value=value.replace(/[^\d.]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  maxlength="4">
                   
                                     <select style="display: none"  type="text" name="businessStatus"><option></option></select>
                                     <select style="display: none"  type="text" name="status"><option></option></select>
                                       </td>
                                        <td class="t_r">责任单位</td>
                                       <td><select   type="text" name="company"><option></option></select></td>
                                         <td  colspan="2" class="t_c">
                                        <input type="button" id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" />
                                        </td>
                                    
                               
                                  
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="fn clearfix">
                    <h5 class="fl"><a class="fl">目标计划申报表</a></h5>
                
                </div>
            </div>
            <!--Filter End-->
            <!--Table-->
            <div class="mb10">
                <table width="100%" class="table_1">
                    <tbody>
                        <tr class="tit">
                            
                            <td class="sort"><a><span class="fl">序号</span></a></td>
                            <td class="sort"><a><span class="fl">单位</span></a></td>
                            <td class="sort"><a><span class="fl">计划年度</span></a></td>
                            <td class="sort"><a><span class="fl">业务状态</span></a></td>
                            <td class="sort"><a><span class="fl">流程状态</span></a></td>
                            <td class="sort"><a><span class="fl"></span></a></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr class="tfoot">
                            <td colspan="6">
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