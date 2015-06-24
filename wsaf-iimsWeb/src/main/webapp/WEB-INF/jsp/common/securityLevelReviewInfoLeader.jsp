<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>安全定级申报</title>
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
    <script src="js/projectPlan.js"></script>
    <style type="text/css">
        .mytable tbody td:nth-child(2n-1)
        {
            background-color: #F8F8F8;
            text-align: right;
            width: 65px;
        }

        .mytable tbody td
        {
            border-left: 1px #e4e4e4 solid;
        }

        .table_2 input[type=checkbox]
        {
            margin: 0 1px 0 15px;
        }

        .mytable3 thead td
        {
            text-align: center;
            vertical-align: middle;
            border-left: 1px #e4e4e4 solid;
        }

        .mytable3 tbody td
        {
            text-align: left;
            vertical-align: middle;
            border-left: 1px #e4e4e4 solid;
        }

        .mytable2 tbody td
        {
            text-align: center;
            vertical-align: middle;
            border-left: 1px #e4e4e4 solid;
        }

        tbody tr.bg2 td
        {
            background-color: #F8F8F8;
        }

        .companyAddress select
        {
            margin: 0 1px 0 15px;
        }

            .table_2 input[type=checkbox]:first-child, .companyAddress select:first-child
            {
                margin: 0 3px 0 0;
            }
    </style>
    <script type="text/javascript">
        $(function () {
            $.postSecurityLevelDetail = function (firUrl, id) {
                if (firUrl != "") {
                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/securityLevel/get/" + id,
                        type: 'post',
                        success: function (data, status, xhr) {

                            if (status == "success" && data != null) {
                                if (data.success == true ) {
                                    var entry = data.result;
                                    $("#btnSubmit2").click(function () {
                                        if ($("input[name=btnISPass]:checked").val() == "pass") {
                                            var otherData = "";
                                            if (id != null) {
                                                var d = new Date();

                                                otherData += "&handler=郑思浩";
                                                otherData += "&handlerLoginname=G001000001702549";
                                                otherData += "&initiator=" + entry.handler;
                                                otherData += "&initiatorLoginname=" + entry.handlerLoginname;

                                                if (entry.sysSecurityLevel == "level1") {
                                                    otherData += "&status=pass";
                                                }
                                                else {
                                                    otherData += "&status=policeReview";
                                                }

                                                otherData += "&id=" + id + "&initiateTime=" + d.getTime()+ "&suggestion=" + $("[name=suggestion]").val();
                                            }

                                            $(this).attr("disabled", true);
                                            $.postsave2(firUrl, "projectPlanForm", "securityLevel", otherData, "/securityLevel/securityLevelInfoCenterList", false, true, false, "");

                                        }
                                        else if ($("input[name=btnISPass]:checked").val() == "notPass") {
                                            var otherData = "";
                                            if (id != null) {
                                                otherData += "&id=" + id + "&status=infoDeptLeaderBack";
                                            }

                                            if ($("#mynotifyDeptLeader").attr("checked") == "checked")
                                                otherData += "&notifyDeptLeader=YES";

                                            var d = new Date();

                                            otherData += "&handler=" + entry.applyer;
                                            otherData += "&handlerLoginname=" + entry.applyerLoginname;
                                            otherData += "&initiator=" + entry.handler;
                                            otherData += "&initiatorLoginname=" + entry.handlerLoginname + "&initiateTime=" + d.getTime() + "&suggestion=" + $("[name=suggestion]").val();

                                            $(this).attr("disabled", true);
                                            $.postsave2(firUrl, "projectPlanForm", "securityLevel", otherData, "/securityLevel/securityLevelInfoCenterList", false, true, false, "");
                                        }

                                        else {
                                            alert("请选择是否通过")
                                        }
                                    });

                                    for (var item in entry) {
                                        try {
                                            if (item == "businessStatus") {
                                                if (entry[item] == "contentChange" || entry[item] == "levelChange") {
                                                    var historyInfo = $.postHistoryList(firUrl, "systemNum=" + entry.systemNum + "&status=pass");
                                                    var str = "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"table_2\" id=\"historyInfo\">";
                                                    str += "<thead><th colspan=\"4\"> <h5 class=\"fl\">历史记录</h5></th></thead><tbody>" + historyInfo + "</tbody></table>";

                                                    $("#applyInfo").after(str);
                                                }
                                            }
                                            else if (item == "hasSysTipologyFile" || item == "hasSysSecurityOrganFile" || item == "hasSysProtectFile" || item == "hasSysProductsFile" || item == "hasSysTipologyFile" || item == "hasSysLevelReviewFile" || item == "hasExpertReviewFile" || item == "hasDeptInchargeReviewFile") {
                                                if (entry[item] == "YES") {
                                                    var otherdata = "modelName=securityLevel&modelId=" + id + "&groupName=" + item;
                                                    var info = $.getFileInfo2(firUrl, otherdata);
                                                    $("[name=" + item + "]").parents("tr").after("<tr class=\"upload\"><td class=\"lableTd t_r\">资料</td><td colspan=\"3\"><table width=\"100%\" ><thead><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan=\"2\">操作</td></tr></thead><tbody>" + info + "</tbody></table></td></tr>");
                                                    $("a.del").remove();

                                                }
                                            }
                                            if (item == "keyProducts") {
                                                var dataObj = jQuery.parseJSON(entry[item]);

                                                for (var sitem in dataObj) {
                                                    var dataObj2 = jQuery.parseJSON(dataObj[sitem]);
                                                    $(".mytable2 #" + sitem + "Num").val(dataObj2.num);
                                                    $(".mytable2 #" + sitem).val(dataObj2.use);

                                                    if (dataObj2.use == "part") {
                                                        $(".mytable2 #" + sitem + "Percent").val(dataObj2.percent);
                                                    }
                                                    else if (dataObj2.use == "all") {
                                                        $(".mytable2 #" + sitem + "Percent").val("100");
                                                    }
                                                    else if (dataObj2.use == "none") {
                                                        $(".mytable2 #" + sitem + "Percent").val("0");
                                                    }

                                                    if (sitem == "other")
                                                        $(".mytable2 #otherName").val(dataObj2.name);
                                                }
                                            }

                                            else if (item == "sysServices") {
                                                var dataObj = jQuery.parseJSON(entry[item]);

                                                for (var sitem in dataObj) {
                                                    var dataObj2 = jQuery.parseJSON(dataObj[sitem]);
                                                    $(".mytable2 #" + sitem + "Has").val(dataObj2.has);

                                                    if (dataObj2.has == "yes")
                                                        $(".mytable2 #" + sitem.trim() + "SysServices").val(dataObj2.responsibleParty);

                                                    if (sitem == "other")
                                                        $(".mytable2 #otherSysServicesName").val(dataObj2.name);
                                                }
                                            }

                                            else if (item == "businessSecurityDamage") {
                                                var strArry = entry[item].split(",");
                                                $("#businessSecurityDamage input[type=checkbox]").val(strArry);
                                            }
                                            else if (item == "sysSecurityDamage") {
                                                var strArry = entry[item].split(",");
                                                $("#sysSecurityDamage input[type=checkbox]").val(strArry);
                                            }
                                            else if (item == "businessSecurityLevel") {
                                                $("[name=myBusinessSecurityLevel][value=" + entry[item] + "]").attr("checked", "checked");
                                            }
                                            else if (item == "serviceSecurityLevel") {
                                                $("[name=myServiceSecurityLevel][value=" + entry[item] + "]").attr("checked", "checked");
                                            }
                                            else if (item == "initiateTime") {
                                                $("[name=initiateTime]").val(entry[item]);
                                            }

                                            else if (item == "sysServeScope") {
                                                if (entry[item] == "crossProvince") {
                                                    $("input[name=sysServeScopeCrossP]").css("display", "inline");
                                                    $("input[name=sysServeScopeCrossC]").css("display", "none");
                                                    $("input[name=sysServeScopeOther]").css("display", "none");
                                                }
                                                else if (entry[item] == "crossCity") {
                                                    $("input[name=sysServeScopeCrossC]").css("display", "inline");
                                                    $("input[name=sysServeScopeOther]").css("display", "none");
                                                    $("input[name=sysServeScopeCrossP]").css("display", "none");
                                                }
                                                else if (entry[item] == "other") {
                                                    $("input[name=sysServeScopeOther]").css("display", "inline");
                                                    $("input[name=sysServeScopeCrossP]").css("display", "none");
                                                    $("input[name=sysServeScopeCrossC]").css("display", "none");
                                                }

                                            }
                                            else if (item == "isSubsystem" || item == "hasDeptIncharge") {
                                                if (entry[item] == "YES") {
                                                    $("[name=" + item + "]").parents("tr").next("tr").css("display", "table-row");
                                                }
                                            }
                                            else if (item == "isOperationOutsource") {
                                                if (entry[item] == "YES") {
                                                    $("[name=" + item + "]").parent("td").attr("colspan", "1");
                                                    $("input[name=outsourceCompany]").parent().css("display", "table-cell");
                                                    $("input[name=outsourceCompany]").parent().prev().css("display", "table-cell");
                                                }
                                            }

                                            else if ($("[name=" + item + "]").length > 0) {
                                                if ($("[name=" + item + "]").hasClass("myproduct")) {
                                                    if (entry[item] == "part") {
                                                        $("[name=" + item + "]").parents("td").next("td").find("input").removeAttr("disabled");
                                                    }
                                                }
                                                else if ($("[name=" + item + "]").hasClass("myproduct2")) {
                                                    if ($("[name=" + item + "]").val() == "yes") {
                                                        $("[name=" + item + "]").parents("td").next("td").find("select").removeAttr("disabled");
                                                    }
                                                }
                                                else if (entry[item] == "other") {
                                                    if ($("[name=" + item + "]").parents(".mytable").length > 0) {
                                                        $("[name=" + item + "Other]").css("display", "inline");
                                                    }
                                                    else {
                                                        $("[name=" + item + "]").parent("td").attr("colspan", "1");
                                                        $("input[name=" + item + "Other]").parent().css("display", "table-cell");
                                                        $("input[name=" + item + "Other]").parent().prev().css("display", "table-cell");
                                                    }

                                                }

                                            }

                                            $("[name=" + item + "]").val(entry[item]);


                                        }
                                        catch (e) {
                                            alert(e);
                                        }
                                    }

                                }
                            }
                        },
                        error: function () {
                            hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                        }
                    });
                }
            }

            $.getMenu("${pageContext.request.contextPath}", "securityLevel");
            $("#btnClose").click(function () {
                window.close();
                location.href = "${pageContext.request.contextPath}/securityLevel/securityLevelList";
            });

            QueryString.Initial();
            if (QueryString.GetValue('id') != null) {
                $.postSecurityLevelDetail("${pageContext.request.contextPath}", QueryString.GetValue('id'));
                $.getSuggestSecurityLevel("${pageContext.request.contextPath}", QueryString.GetValue('id'));
                $("[name=suggestion]").val("");
                $(".closewindow").click(function () {
                    $(".f_window").css("display", "none");
                    $("#bt").css("display", "none");
                });
                $("#btnSubmit").click(function () {
                    $("#bt").height($(document).height());
                    $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
                    $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
                    $(".f_window").css("display", "block");
                    $("#bt").css("display", "block");

                });
                $(".ywbl").parent("li").removeClass("disable").css("cursor", "pointer");
                $(".ywbl").css("background-image", "url(css/default/images/icon_1.png)");
                $(".ywbl").parent("li").click(function () {
                    $("#bt").height($(document).height());
                    $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
                    $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
                    $(".f_window").css("display", "block");
                    $("#bt").css("display", "block");
                });
                $("[name=btnISPass]").click(function () {
                    var _str = "", _str2 = "";
                    switch ($("input[name=btnISPass]:checked").val()) {
                        case "pass":
                            _str = "通过。"

                            if ($("[name=sysSecurityLevel]:selected").val() == "level1") {
                                _str2 = "审核通过";
                            }
                            else {
                                _str2 = "提交到公安机关审核";
                            }
                            $("#closebtn").css("display", "none");
                            $("#btnSubmit2").val("提交审核");
                            $(".reviewNotPass").css("display", "none");
                            break;
                        case "notPass":
                            _str = "不通过。"
                            _str2 = "返回申报人修改";

                            $("#closebtn").css("display", "inline");
                            $("#btnSubmit2").val("返回修改");
                            $(".reviewNotPass").css("display", "table-row");
                            break;

                    }
                    $("[name=suggestion]").val(_str);
                    $("#nextDo").val(_str2);
                });
            }

        })


    </script>
</head>

<body class="Flow">

    <div id="bt" class="transparent" style="display: none"></div>

    <div class="f_window" style="display: none">

        <h3 class="clearfix mb10"><span class="fl">业务办理</span><div class="fr close"><a class="closewindow">关闭窗口</a></div>
        </h3>

        <div class="con">

            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                    <td class="td_1" colspan="2">业务栏</td>

                </tr>

                <tr>

                    <td class="td_1">&nbsp;</td>

                    <td>
                        
                        信息中心领导审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left: 20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left: 10px">不通过</td>

                </tr>

                <tr >

                    <td class="td_1">&nbsp;</td>

                    <td>
                        
                        审核意见</td>

                </tr>

                <tr  >

                    <td class="td_1">&nbsp;</td>

                    <td>
                        <textarea name="suggestion" rows="4" placeholder="请输入意见"></textarea></td>

                </tr>
                <tr style="display: none" class="reviewNotPass">
                    <td class="td_1">&nbsp;</td>
                    <td>
                        <input id="mynotifyDeptLeader" type="checkbox" style="margin-right: 5px">通知发起人部门领导</td>
                </tr>
                <tr>

                    <td class="td_1" colspan="2">操作栏</td>


                </tr>

                <tr>

                    <td class="td_1">&nbsp;</td>

                    <td>
                        <textarea rows="2" id="nextDo" disabled></textarea></td>

                </tr>


            </table>

        </div>

        <div class="button t_c">

            <input type="button" id="btnSubmit2" value="提交审核" />
            &nbsp;
        </div>

    </div>

    <!--Transparent End-->
    <div class="f_bg">

        <!--Panel_6-->

        <div class="Divab1">

            <!--1st-->

            <div class="panel_6">

                <div class="divT">

                    <div class="mb10 icon icon_1"></div>

                    <div class="more_4"><a title="更多">更多</a></div>

                </div>

                <div class="divH">

                    <div class="divB">

                        <h5 class="clearfix">业务办理</h5>

                        <div class="con">

                            <ul class="button clearfix" style="filter: Gray">

                                <li class="disable"><a class="ywbl">业务办理</a></li>

                                <li class="disable"><a class="print">打印</a></li>

                                <li class="disable"><a class="jk">业务监控</a></li>

                                <li class="disable"><a class="tips">小提示</a></li>

                                <li class="disable"><a class="imp">公文导入</a></li>

                                <li class="disable"><a class="exp">公文导出</a></li>

                            </ul>

                        </div>

                    </div>

                    <div class="divF"></div>

                </div>

            </div>

            <!--1st End-->



        </div>

        <!--Panel_6 End-->

        <div class="logo_1"></div>

        <div class="gray_bg">

            <div class="gray_bg2">

                <div class="w_bg">

                    <div class="Bottom">

                        <div class="Top">

                            <h1 class="t_c">上海申通地铁集团有限公司<br>
                                安全定级申报表</h1>

                            <div class="mb10">
                                <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">单位基本情况(不可修改)</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">
                                                
                                                单位名称</td>
                                            <td colspan="3">
                                                <input class="input_large" type="text" name="company" readonly="readonly"/></td>
                                        </tr>
                                        <tr class="companyAddress">
                                            <td class="lableTd t_r">单位地址</td>
                                            <td colspan="3">
                                                <input type="text" name="companyProvince" class="input_small" readonly="readonly">
                                                </select>省(自治区、直辖市)<input type="text" name="companyCity" class="input_tiny" readonly="readonly">
                                                </select>地(区、市、州、盟)<input type="text" name="companyCounty" class="input_tiny" readonly="readonly">
                                                </select>县(区、市、旗)</td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">邮政编码</td>
                                            <td>
                                                <input type="text" class="input_small" name="zipCode" readonly="readonly" /></td>
                                            <td class="lableTd t_r">行政区划代码</td>
                                            <td>
                                                <input type="text" class="input_small" name="addressCode" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">单位负责人</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>姓名</td>
                                                        <td>
                                                            <input type="text" class="input_small" name="leaderName" readonly="readonly" /></td>
                                                        <td>职务/职称</td>
                                                        <td>
                                                            <input type="text" class="input_small" name="leaderPost" readonly="readonly" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>办公电话</td>
                                                        <td>
                                                            <input type="text" class="input_small" name="leaderPhone" readonly="readonly" /></td>
                                                        <td>电子邮件</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="leaderEmail" readonly="readonly" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-bottom: 0px;">移动电话</td>
                                                        <td style="border-bottom: 0px;" colspan="3">
                                                            <input type="text" class="input_small" name="leaderMobile" readonly="readonly" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">隶属关系 </td>
                                            <td colspan="3">
                                                <select name="subordinateRelation" class="input_large" disabled="disabled"></td>
                                            <td class="lableTd t_r" style="display: none">隶属关系其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="subordinateRelationOther" readonly="readonly" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">单位类型</td>
                                            <td colspan="3">
                                                <select name="companyType" class="input_large" disabled="disabled"></td>
                                            <td class="lableTd t_r" style="display: none">单位类型其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="companyTypeOther" readonly="readonly" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">行业类别</td>
                                            <td colspan="3">
                                                <select name="businessCategory" class="input_large" disabled="disabled"></td>
                                            <td style="display: none" class="lableTd t_r">行业类别其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="businessCategoryOther" readonly="readonly" />
                                            </td>
                                        </tr>
                                      	<tr>
                                            <td class="lableTd t_r">第一级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level1SysNum" readonly="readonly"/>个</td>
                                            <td class="lableTd t_r">第二级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level2SysNum" readonly="readonly"/>个</td>

                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">第三级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level3SysNum" readonly="readonly"/>个</td>
                                            <td class="lableTd t_r">第四级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level4SysNum" readonly="readonly"/>个</td>

                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">第五级信息系统数</td>
                                            <td colspan="3">
                                                <input type="text" class="input_small" name="level5SysNum" readonly="readonly"/>个</td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">信息系统总数</td>
                                            <td colspan="3">
                                                <input type="text" class="input_small" name="totalSysNum" readonly="readonly" />个</td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">信息系统基本情况</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">
                                                
                                                责任部门</td>
                                            <td colspan="3">
                                                <input type="text" name="dutyDept" class="input_large" readonly="readonly"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">责任部门联系人</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>姓名</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanName" readonly="readonly" /></td>
                                                        <td>职务/职称</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanPost" readonly="readonly" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>办公电话</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanPhone" readonly="readonly" /></td>
                                                        <td>电子邮件</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanEmail" readonly="readonly" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">系统类型</td>
                                            <td colspan="3">
                                                <select name="systemType" class="input_large" disabled="disabled"></td>
                                            <td style="display: none" class="lableTd t_r">系统类型其他内容</td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="systemTypeOther" readonly="readonly" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                
                                                所在网络区域</td>
                                            <td colspan="3">
                                                <select name="sysNetArea" class="input_large" disabled="disabled"></td>
                                            <td style="display: none" class="lableTd t_r">所在网络区域其他内容</td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="sysNetAreaOther" readonly="readonly" />
                                            </td>
                                        </tr>

                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">信息系统情况</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">
                                                
                                                系统名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="systemName" readonly="readonly" /></td>
                                            <td class="lableTd t_r">
                                                
                                                系统编号</td>
                                            <td>
                                                <input type="text" class="input_large" name="systemNum" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统承载业务<br>
                                                情况</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>业务类型</td>
                                                        <td colspan="3">
                                                            <select name="sysBusinessType" class="input_large" disabled="disabled">
                                                                <input style="display: none; margin-left: 10px" type="text" class="input_large" name="sysBusinessTypeOther" readonly="readonly" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>业务描述</td>
                                                        <td colspan="3">
                                                            <input type="text" class="input_large" name="sysBusinessDescription" readonly="readonly" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">系统服务情况</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>服务范围</td>
                                                        <td colspan="3">
                                                            <select name="sysServeScope" class="input_large" disabled="disabled">
                                                                <input type="text" style="display: none; margin-left: 10px" class="input_large" name="sysServeScopeOther" readonly="readonly" />
                                                                <input type="text" style="display: none; margin-left: 10px" class="input_large" name="sysServeScopeCrossP" readonly="readonly" />
                                                                <input type="text" style="display: none; margin-left: 10px" class="input_large" name="sysServeScopeCrossC" readonly="readonly" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>服务对象</td>
                                                        <td colspan="3">
                                                            <select name="sysServeObj" class="input_large" disabled="disabled">
                                                                <input type="text" style="display: none; margin-left: 10px" class="input_large" name="sysServeObjOther" readonly="readonly" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">系统网络平台</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>覆盖范围</td>
                                                        <td colspan="3">
                                                            <select name="sysNetCover" class="input_large" disabled="disabled">
                                                                <input type="text" class="input_large" style="display: none; margin-left: 10px" name="sysNetCoverOther" readonly="readonly" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>网络性质</td>
                                                        <td colspan="3">
                                                            <select name="sysNetProperty" class="input_large" disabled="disabled">
                                                                <input type="text" class="input_large" style="display: none; margin-left: 10px" name="sysNetPropertyOther" readonly="readonly" />
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                
                                                系统互联情况</td>
                                            <td>
                                                <select name="sysConnect" style="width: 200px;" disabled="disabled"></td>
                                            <td class="lableTd t_r" style="display: none">系统互联情况其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_large" name="sysConnectOther" readonly="readonly" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">关键产品使用情况 </td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable2">
                                                    <tr class="bg2">
                                                        <td>序号</td>
                                                        <td>产品类型</td>
                                                        <td>数量</td>
                                                        <td>使用国产品率 </td>
                                                        <td>使用率 </td>
                                                    </tr>

                                                    <tr>
                                                        <td>1</td>
                                                        <td>安全专用产品</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="securityNum" readonly="readonly" />
                                                        </td>
                                                        <td>
                                                            <select id="security" class="input_small myproduct" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="securityPercent" readonly="readonly" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>2</td>
                                                        <td>网络产品</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="netNum" readonly="readonly" />
                                                        </td>
                                                        <td>
                                                            <select id="net" class="input_small myproduct" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="netPercent" readonly="readonly" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>3</td>
                                                        <td>操作系统</td>
                                                        <td>
                                                            <input type="text" id="opsysNum" class="input_small" readonly="readonly" />
                                                        </td>
                                                        <td>
                                                            <select id="opsys" class="input_small myproduct" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="opsysPercent" readonly="readonly" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>4</td>
                                                        <td>数据库</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="dbNum" readonly="readonly" />
                                                        </td>
                                                        <td>
                                                            <select id="db" class="input_small myproduct" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="dbPercent" readonly="readonly" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>5</td>
                                                        <td>服务器</td>
                                                        <td>
                                                            <input id="serverNum" type="text" class="input_small" readonly="readonly" />
                                                        </td>
                                                        <td>
                                                            <select id="server" class="input_small myproduct" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="serverPercent" readonly="readonly" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>6</td>
                                                        <td>其他<input type="text" class="input_small" id="otherName" readonly="readonly" /></td>
                                                        <td>
                                                            <input type="text" class="input_small" id="otherNum" readonly="readonly" />
                                                        </td>
                                                        <td>
                                                            <select id="other" class="input_small myproduct" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="otherPercent" readonly="readonly" />%</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td class="lableTd t_r">系统采用服务情况</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable2">
                                                    <tr class="bg2">
                                                        <td>序号</td>
                                                        <td colspan="2">服务类型</td>
                                                        <td>服务责任方类型 </td>
                                                    </tr>

                                                    <tr>
                                                        <td>1</td>
                                                        <td>等级测评</td>
                                                        <td>
                                                            <select id="levelHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="levelSysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>风险评估</td>
                                                        <td>
                                                            <select id="riskHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="riskSysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>3</td>
                                                        <td>灾难恢复</td>
                                                        <td>
                                                            <select id="recoveryHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="recoverySysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>

                                                    <tr>
                                                        <td>4</td>
                                                        <td>应急响应</td>
                                                        <td>
                                                            <select id="urgentHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="urgentSysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>

                                                    <tr>
                                                        <td>5</td>
                                                        <td>系统集成</td>
                                                        <td>
                                                            <select id="integrationHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="integrationSysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>6</td>
                                                        <td>安全咨询</td>
                                                        <td>
                                                            <select id="advisoryHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="advisorySysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>7</td>
                                                        <td>安全培训</td>
                                                        <td>
                                                            <select id="trainHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="trainSysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>

                                                    <tr>
                                                        <td>8</td>
                                                        <td>其他<input type="text" class="input_small" id="otherSysServicesName" readonly="readonly" /></td>
                                                        <td>
                                                            <select id="otherHas" class="input_small myproduct2" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="yes">有</option>
                                                                <option value="no">无</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select id="otherSysServices" class="input_large" disabled="disabled">
                                                                <option value="">请选择</option>
                                                                <option value="own">本行业（单位）</option>
                                                                <option value="internal">国内其他服务商</option>
                                                                <option value="foreign">国外服务商</option>
                                                            </select></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">等级测评单位名称</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" name="reviewCompany" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">何时投入运行使用</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" name="startUserDate" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统运维是否委外</td>
                                            <td>
                                                <select name="isOperationOutsource" class="input_small" disabled="disabled"></td>
                                            <td class="lableTd t_r" style="display: none">委外单位名称</td>
                                            <td style="display: none">
                                                <input type="text" class="input_large" name="outsourceCompany" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统是否是分系统</td>
                                            <td colspan="3">
                                                <select name="isSubsystem" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr style="display: none">
                                            <td class="lableTd t_r">上级系统名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="mainSystem" readonly="readonly" /></td>
                                            <td class="lableTd t_r">上级系统所属单位名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="mainSystemCompany" readonly="readonly" /></td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">信息系统定级情况</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">确定业务信息安全<br>
                                                保护等级 </td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable3" id="businessSecurityDamage">
                                                    <thead>
                                                        <tr class="bg2">
                                                            <td>损害客体及损害程度</td>
                                                            <td>级别</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level1_damage" class="level1" disabled="disabled">仅对公民、法人和其他组织的合法权益造成损害</td>
                                                            <td>
                                                                <input type="radio" name="myBusinessSecurityLevel" value="level1" disabled="disabled">第一级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level2_damage1" class="level2" disabled="disabled">对公民、法人和其他组织的合法权益造成严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level2" name="myBusinessSecurityLevel" disabled="disabled">第二级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level2_damage2" class="level2" disabled="disabled">对社会秩序和公共利益造成损害</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level3_damage1" class="level3" disabled="disabled">对社会秩序和公共利益造成严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level3" name="myBusinessSecurityLevel" disabled="disabled">第三级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level3_damage2" class="level3" disabled="disabled">对国家安全造成损害</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level4_damage1" class="level4" disabled="disabled">对社会秩序和公共利益造成特别严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level4" name="myBusinessSecurityLevel" disabled="disabled">第四级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level4_damage2" class="level4" disabled="disabled">对国家安全造成严重损害</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level5_damage" class="level5" disabled="disabled">对国家安全造成特别严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level5" name="myBusinessSecurityLevel" disabled="disabled">第五级</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">确定系统服务安全<br>
                                                保护等级 </td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable3" id="sysSecurityDamage">
                                                    <thead>
                                                        <tr class="bg2">
                                                            <td>损害客体及损害程度</td>
                                                            <td>级别</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level1_damage" class="level1" disabled="disabled">仅对公民、法人和其他组织的合法权益造成损害</td>
                                                            <td>
                                                                <input type="radio" name="myServiceSecurityLevel" value="level1" disabled="disabled">第一级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level2_damage1" class="level2" disabled="disabled">对公民、法人和其他组织的合法权益造成严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level2" name="myServiceSecurityLevel" disabled="disabled">第二级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level2_damage2" class="level2" disabled="disabled">对社会秩序和公共利益造成损害</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level3_damage1" class="level3" disabled="disabled">对社会秩序和公共利益造成严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level3" name="myServiceSecurityLevel" disabled="disabled">第三级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level3_damage2" class="level3" disabled="disabled">对国家安全造成损害</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level4_damage1" class="level4" disabled="disabled">对社会秩序和公共利益造成特别严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level4" name="myServiceSecurityLevel" disabled="disabled">第四级</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level4_damage2" class="level4" disabled="disabled">对国家安全造成严重损害</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" value="level5_damage" class="level5" disabled="disabled">对国家安全造成特别严重损害</td>
                                                            <td rowspan="2">
                                                                <input type="radio" value="level5" name="myServiceSecurityLevel" disabled="disabled">第五级</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">信息系统安全保护等级</td>
                                            <td colspan="3">
                                                <select name="sysSecurityLevel" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">定级时间</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" name="levelConfirmDate" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">专家评审情况</td>
                                            <td colspan="3">
                                                <select name="expertReview" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">是否有主管部门</td>
                                            <td colspan="3">
                                                <select name="hasDeptIncharge" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr style="display: none">
                                            <td class="lableTd t_r">主管部门名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="deptIncharge" readonly="readonly" /></td>
                                            <td class="lableTd t_r">主管部门审批定级情况</td>
                                            <td>
                                                <select name="deptInchargeReview" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统定级报告 </td>
                                            <td colspan="3">
                                                <select name="hasSysLevelFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">第三级以上信息系统提交材料情况</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">系统拓扑结构及说明</td>

                                            <td colspan="3">
                                                <select name="hasSysTipologyFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统安全组织机构及管理制度</td>
                                            <td colspan="3">
                                                <select name="hasSysSecurityOrganFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统安全保护设施设计实施方案或改建实施方案</td>
                                            <td colspan="3">
                                                <select name="hasSysProtectFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统使用的安全产品清单及认证、销售许可证明</td>
                                            <td colspan="3">
                                                <select name="hasSysProductsFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统等级测评报告</td>
                                            <td colspan="3">
                                                <select name="hasSysLevelReviewFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统等级测评时间</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" name="sysLevelReviewDate" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">专家评审情况</td>
                                            <td colspan="3">
                                                <select name="hasExpertReviewFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">上级主管部门审批意见</td>
                                            <td colspan="3">
                                                <select name="hasDeptInchargeReviewFile" class="input_small" disabled="disabled"></td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="Table1">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">申报信息</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">申请时间</td>
                                            <td>
                                                <input type="text" class="input_large" name="applyTime" readonly="readonly" /><input type="text" class="input_large" name="reportUnit" style="display: none" readonly="readonly" /></td>
                                            <td class="lableTd t_r">
                                                
                                                申报人</td>
                                            <td>
                                                <input type="text" class="input_large" name="applyer" readonly /><input type="text" class="input_large" name="applyerLoginname" readonly="readonly" style="display: none" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                
                                                处理人</td>
                                            <td>
                                                <input type="text" name="handler" class="input_large" readonly="readonly" />

                                            </td>
                                            <td class="lableTd t_r">操作时间</td>
                                            <td>
                                                <input type="text" class="input_large" name="initiateTime" readonly="readonly" /></td>
                                        </tr>

                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="leaderSuggest">
                                        <thead>
                                            <th>
                                                <h5 class="fl">审批信息</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="mb10 t_c">
                                <input type="button" id="btnSubmit" value="审 核" />
                                &nbsp;
                                <input type="button" id="btnClose" value="返 回" />
                            </div>
                            <div class="footer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
