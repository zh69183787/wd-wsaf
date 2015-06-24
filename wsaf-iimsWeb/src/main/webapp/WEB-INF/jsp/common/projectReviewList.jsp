<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>项目审核</title>
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
            $.postProjectReview = function (firUrl, paging, personIdentity) {
                   var otherData = "";
                   $("option[value=draft]").remove();
           	       $("option[value=turnBack]").remove();   
           	       $("option[value=waitForAudit]").remove();
            	   $("option[value=cancel]").remove();   
               
                if (personIdentity == 2) {
                    $("option[value=finishInnerAudit]").remove();
                    $("option[value=auditorReview]").remove();
                    $("option[value=auditorPass]").remove();
                    $("option[value=auditorCancel]").remove();
                    $("option[value=leaderBack]").remove();
                }
                else if(personIdentity != 3) {
                    $("option[value=finishInnerAudit]").remove();
                }
                
                if ($("[name=status] option:selected").isNullOrEmpty())
                otherData+="&status_in="+$("[name=status] option").getOptionVal(); 

                if (firUrl != "") {
                    if (!$("#planStartYear").isNullOrEmpty() && !$("#planStartMon").isNullOrEmpty())
                        otherData += "&planStartDate_s=" + $("#planStartYear").val() + "-" + $("#planStartMon").val() + "-01";

                    if (!$("#planEndYear").isNullOrEmpty() && !$("#planEndYearMon").isNullOrEmpty())
                        otherData += "&planStartDate_e=" + $("#planEndYear").val() + "-" + $("#planEndYearMon").val() + "-1";

                    $("#oututBtn").click(function () {
                        var content = $("#projectAppform").serialize() + otherData + "&type=&sort=status asc,planStartDate desc"
                        window.location.href = firUrl + "/basicCrud/projectPlan/export2Excel?" + content;

                    });

                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/projectPlan/page",
                        type: 'post',
                        data: $("#projectAppform").serialize() + paging + otherData + "&sort=status asc,planStartDate desc",
                        success: function (data, status, xhr) {

                            $.analyzeTableData(data, status, xhr, firUrl, personIdentity);

                            $(".topage").click(function () {
                                $.postProjectReview(firUrl, "&pageSize=16&pageNum=" + $(this).text(), personIdentity);

                            });

                            $(".prepage").click(function () {
                                var nowpage = parseInt($(".selected a").text());

                                if (nowpage > 1) {
                                    var topage = nowpage - 1;
                                    $.postProjectReview(firUrl, "&pageSize=16&pageNum=" + topage, personIdentity);
                                }
                            });

                            $(".nextpage").click(function () {
                                var nextpage = parseInt($(".selected a").text()) + 1;

                                if (nextpage <= parseInt($("#gopage").attr("max")))
                                    $.postProjectReview(firUrl, "&pageSize=16&pageNum=" + nextpage, personIdentity);

                            });

                            $("#gopagebtn").click(function () {
                                var topage = parseInt($("#gopage").val());

                                if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
                                    $.postProjectReview(firUrl, "&pageSize=16&pageNum=" + topage, personIdentity);
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

            $.analyzeTableData = function (data, status, xhr, firUrl, personIdentity) {
                if (status == "success" && data != null) {
                    $("tr.tableItem").remove();

                    if (data.success == true  ) {
                        $("tr.tableItem").remove();
                        var tableItem = "", projectTypeChina = "", statusChina = "";
                        var myname = $("#myname").text();

                        $.each(data.result.content, function (entryIndex, entry) {
                            if(entry.projectType!="")
							projectTypeChina=$("[name=projectType] option[value=" + entry.projectType + "]").text();
						
						    if(entry.status!="")
							statusChina=$("[name=status] option[value=" + entry.status + "]").text();

                            var arrStartDate = new Array();
                            arrStartDate = entry.planStartDate.split("-");
                            var arrEndDate = new Array();
                            arrEndDate = entry.planEndDate.split("-");
                            var mycount = entryIndex + 1;
                            tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\"test_checkbox_1\" name=\"test_checkbox_1\" /></td>";
                            tableItem += "<td>" + mycount + "</td><td>" + entry.year + "</td><td>" + entry.projectName + "</td><td>" + entry.totalInvestEstimate + "万元</td><td>";
                            tableItem += projectTypeChina + "</td><td>" + arrStartDate[0] + "年" + arrStartDate[1] + "月" + "</td><td>" + arrEndDate[0] + "年" + arrEndDate[1] + "月" + "</td><td>" + statusChina + "</td>";

                            var newpage = "projectApplicationDetail",btnStr="详情";
                            var isme = entry.handlerLoginname.indexOf(myname);
                            if (personIdentity == 3) {
                                if (entry.status == "finishInnerAudit" || entry.status == "auditorCancel" || entry.status == "auditorPass" || entry.status == "leaderBack") {
                                    newpage = "projectReviewDetail";
                                    btnStr="审查";
                                }
                                else {
                                    newpage = "projectApplicationDetail";
                                    btnStr="详情";
                                }
                            }
                            else if (personIdentity == 2 && isme != -1&& entry.status == "leaderReview") {
                                newpage = "projectReviewDetail";
                                btnStr="审核";
                            }

                            else if (entry.status == "auditorReview" && isme != -1) {
                            	if(personIdentity == 4 ||personIdentity == 5||personIdentity == 6 )
                                {
                            		newpage = "projectReviewDetail";
                            		 btnStr="审查";
                                }
                            }
                            else {
                                newpage = "projectApplicationDetail";
                                btnStr="详情";
                            }

                            tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\""+btnStr+"\" onclick=\"window.open('" + firUrl + "/projectPlan/" + newpage + "?id=" + entry.id + "');\" \></td>";

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

            $.getMenu({"url":"${pageContext.request.contextPath}", "modName":"projectPlan"});
            $("[name=status] option[value=finishInnerAudit]").text("待预审");
            var count=false;
            $("[name=status] option").each(function(){
                if($(this).text()=="请选择")
                {               	
                	if(count)
                	$(this).remove();
                	count=true;
                }
                });
            
            var personIdentity = $.userIdentity({"url":"${pageContext.request.contextPath}","companyShow":false});

            $.postProjectReview("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", personIdentity);

            window.onfocus = function () {
                var _page = "1";
                if ($(".selected a").length > 0 && $(".selected a").text() != "")
                    _page = $(".selected a").text();

                $.postProjectReview("${pageContext.request.contextPath}", "&pageSize=16&pageNum=" + _page, personIdentity);
            }

            $("#searchbtn").click(function () {
                $.postProjectReview("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", personIdentity);
            });

            $("#renewbtn").click(function () {
                $("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
                $.postProjectReview("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", personIdentity);
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
                    <li class="fin">项目审核</li>
                    <div id="myname" style="display: none"></div>
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
                                        <input type="text" class="input_large" name="reportUnit_l" /></td>
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
                                        </select>
                                    </td>
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
                    <input type="button" id="oututBtn" value="导 出" class="fr" style="margin: 0 15px">
                    &nbsp;
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
