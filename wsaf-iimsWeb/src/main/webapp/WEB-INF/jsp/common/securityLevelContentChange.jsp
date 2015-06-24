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
    <script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
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
            $("[name=startUserDate]").datepicker({onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); }, dateFormat: "yy-mm-dd" });
            $("[name=levelConfirmDate]").datepicker({ onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); },dateFormat: "yy-mm-dd" });
            $("[name=sysLevelReviewDate]").datepicker({onSelect: function(dateText, inst) {$(".ui-state-default").removeAttr("href"); }, dateFormat: "yy-mm-dd" });
            $.postManager = function (firUrl, otherData, _str) {
                if (firUrl != "") {
                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/manager/page?pageSize=1" + otherData,
                        type: 'post',
                        success: function (data, status, xhr) {

                            if (status == "success" && data != null) {
                                if (data.success == true ) {
                                    if (data.result.content.length > 0) {
                                        var entry = data.result.content[0];

                                        $("#principalPeople").append("<option value=\"" + entry.loginName + "\">" + _str + entry.userName + "</option>");

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
            $.FileDel = function (firUrl, _id, isRead) {
                if (firUrl != "") {
                    $.ajax({
                        async: false,
                        url: firUrl + "/attach/api/del/" + _id,
                        dataType: "json",
                        type: 'post',
                        success: function (data, status, xhr) {

                            alert("删除成功");
                        }
                    });
                }
            }

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
                                    $.postManager("${pageContext.request.contextPath}", "&companyId=" + entry.companyId + "&role=producePrincipal", "生产信息安全工作负责人:");
                                    $.postManager("${pageContext.request.contextPath}", "&companyId=" + entry.companyId + "&role=enterprisePrincipal", "企业信息安全工作负责人:");


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
                                            else if (item == "keyProducts") {
                                                var dataObj = jQuery.parseJSON(entry[item]);
                                                for (var sitem in dataObj) {
                                                    var dataObj2 = jQuery.parseJSON(dataObj[sitem]);
                                                    $(".mytable2 #" + sitem + "Num").val(dataObj2.num);
                                                    $(".mytable2 #" + sitem).val(dataObj2.use);

                                                    if (dataObj2.use == "part") {
                                                        $(".mytable2 #" + sitem + "Percent").val(dataObj2.percent);
                                                        $(".mytable2 #" + sitem + "Percent").removeAttr("disabled");
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

                                                    if (dataObj2.has == "yes") {
                                                        $(".mytable2 #" + sitem.trim() + "SysServices").val(dataObj2.responsibleParty);
                                                        $(".mytable2 #" + sitem.trim() + "SysServices").removeAttr("disabled");
                                                    }

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
                                                  $("#sysServeScopeCrossP").css("display", "inline");
                                                  $("#sysServeScopeCrossC").css("display", "none");
                                                  $("#sysServeScopeOther").css("display", "none");
                                                }
                                                else if (entry[item] == "crossCity") {
                                                	 $("#sysServeScopeCrossC").css("display", "inline");
                                                     $("#sysServeScopeOther").css("display", "none");
                                                     $("#sysServeScopeCrossP").css("display", "none");
                                                }
                                                else if (entry[item] == "other") {
                                                	$("#sysServeScopeOther").css("display", "inline");
                                                    $("#sysServeScopeCrossP").css("display", "none");
                                                    $("#sysServeScopeCrossC").css("display", "none");
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

            $.setUserInfo("${pageContext.request.contextPath}/ca/getCurrentLoginInfo");

            QueryString.Initial();
            if (QueryString.GetValue('id') != null)
                $.postSecurityLevelDetail("${pageContext.request.contextPath}", QueryString.GetValue('id'));
            $.getSuggestSecurityLevel("${pageContext.request.contextPath}", QueryString.GetValue('id'));

            $(".btnSubmit").click(function () {

                var d = new Date(), mystate = "", yanzhen = "";

                var _obj = $("input[type=text]"), _obj2 = $("select");
                for (var i = 0; i < _obj.length; i++) {
                    if ($(_obj[i]).css("display") != "none" && $(_obj[i]).parents("tr").css("display") != "none" && $(_obj[i]).parent("td").css("display") != "none" && $(_obj[i]).attr("disabled") != "disabled") {
                        if ($(_obj[i]).val() == null || $(_obj[i]).val() == "") {
                            if ($(_obj[i]).parent("td").prev("td").find("select").length == 0 && $(_obj[i]).attr("id") != "otherName" && $(_obj[i]).attr("id") != "otherSysServicesName" && $(_obj[i]).parent("td").prev("td").length > 0)
                                yanzhen += $(_obj[i]).parent("td").prev("td").text().trim() + "不能为空\r";
                        }
                    }

                }
                for (var j = 0; j < _obj2.length; j++) {
                    if ($(_obj2[j]).css("display") != "none" && $(_obj2[j]).parents("tr").css("display") != "none" && $(_obj2[j]).parent("td").css("display") != "none" && $(_obj2[j]).attr("disabled") != "disabled") {
                        if ($(_obj2[j]).val() == null || $(_obj2[j]).val() == "") {
                            if ($(_obj2[j]).parent("td").prev("td").find("input").length > 0 && $(_obj2[j]).attr("id") != "otherHas" && $(_obj2[j]).parent("td").prev("td").prev("td").length > 0) {
                                yanzhen += $(_obj2[j]).parent("td").prev("td").prev("td").text().trim() + "使用国产品率必须选择一个\r";
                            }
                            else {
                                if ($(_obj2[j]).parent("td").prev("td").find("select").length == 0 && $(_obj2[j]).parent("td").prev("td").length > 0)
                                    yanzhen += $(_obj2[j]).parent("td").prev("td").text().trim() + "必须选择一个\r";
                            }
                        }
                    }

                }

                if ($("#businessSecurityDamage input[type=checkbox]:checked").length <= 0)
                    yanzhen += "至少选择一条业务信息安全保护等级\r"

                if ($("#sysSecurityDamage input[type=checkbox]:checked").length <= 0)
                    yanzhen += "至少选择一条系统服务安全保护等级\r"

                if (yanzhen != "") {
                    alert(yanzhen);
                    return false;
                }

                if ($("[name=hasDeptIncharge] option:checked").val() == "NO")
                    $("[name=deptInchargeReview]").attr("disabled", "disabled");




                if ($(this).val().trim() == "提 交") {
                    mystate = "deptLeaderReview";
                }
                else if ($(this).val().trim() == "保存草稿") {
                    mystate = "draft";
                }
                else {
                    alert("error:状态错误")
                    return false;
                }

                var otherData = "&status=" + mystate + "&businessStatus=contentChange&keyProducts={\"security\":\"{\\\"num\\\":\\\"" + $("#securityNum").val();
                otherData += "\\\",\\\"use\\\":\\\"" + $("#security").val() + "\\\",\\\"percent\\\":\\\"" + $("#securityPercent").val() + "\\\"}\",";
                otherData += "\"net\":\"{\\\"num\\\":\\\"" + $("#netNum").val() + "\\\",\\\"use\\\":\\\"" + $("#net").val() + "\\\",\\\"percent\\\":\\\"" + $("#netPercent").val() + "\\\"}\",";
                otherData += "\"opsys\":\"{\\\"num\\\":\\\"" + $("#opsysNum").val() + "\\\",\\\"use\\\":\\\"" + $("#opsys").val() + "\\\",\\\"percent\\\":\\\"" + $("#opsysPercent").val() + "\\\"}\",";
                otherData += "\"db\":\"{\\\"num\\\":\\\"" + $("#dbNum").val() + "\\\",\\\"use\\\":\\\"" + $("#db").val() + "\\\",\\\"percent\\\":\\\"" + $("#dbPercent").val() + "\\\"}\",";
                otherData += "\"server\":\"{\\\"num\\\":\\\"" + $("#serverNum").val() + "\\\",\\\"use\\\":\\\"" + $("#server").val() + "\\\",\\\"percent\\\":\\\"" + $("#serverPercent").val() + "\\\"}\",";
                otherData += "\"other\":\"{\\\"name\\\":\\\"" + $("#otherName").val() + "\\\",\\\"num\\\":\\\"" + $(".mytable2 #otherNum").val() + "\\\",\\\"use\\\":\\\"" + $(".mytable2 #other").val() + "\\\",\\\"percent\\\":\\\"" + $(".mytable2 #otherPercent").val() + "\\\"}\"}";

                otherData += "&sysServices={\"level\":\"{\\\"has\\\":\\\"" + $("#levelHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#levelSysServices").val() + "\\\"}\",";
                otherData += "\"risk\":\"{\\\"has\\\":\\\"" + $("#riskHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#riskSysServices").val() + "\\\"}\",";
                otherData += "\"recovery\":\"{\\\"has\\\":\\\"" + $("#recoveryHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#recoverySysServices").val() + "\\\"}\",";
                otherData += "\"urgent\":\"{\\\"has\\\":\\\"" + $("#urgentHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#urgentSysServices").val() + "\\\"}\",";
                otherData += "\"integration\":\"{\\\"has\\\":\\\"" + $("#integrationHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#integrationSysServices").val() + "\\\"}\",";
                otherData += "\"advisory\":\"{\\\"has\\\":\\\"" + $("#advisoryHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#advisorySysServices").val() + "\\\"}\",";
                otherData += "\"train\":\"{\\\"has\\\":\\\"" + $("#trainHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#trainSysServices").val() + "\\\"}\",";
                otherData += "\"other\":\"{\\\"name\\\":\\\"" + $("#otherSysServicesName").val() + "\\\",\\\"has\\\":\\\"" + $("#otherHas").val() + "\\\",\\\"responsibleParty\\\":\\\"" + $("#otherSysServices").val() + "\\\"}\"}";

                otherData += "&subordinateRelation=" + $("select[name=subordinateRelation]").val() + "&companyType=" + $("select[name=companyType]").val();
                otherData += "&businessCategory=" + $("select[name=businessCategory]").val() + "&applyTime=" + d.getTime() + "&initiateTime=" + d.getTime();
                otherData += "&initiator=" + $("input[name=applyer]").val() + "&initiatorLoginname=" + $("input[name=applyerLoginname]").val();
                otherData += "&handler=" + $("select#principalPeople option:selected").text() + "&handlerLoginname=" + $("select#principalPeople option:selected").val();
                otherData += "&businessSecurityLevel=" + $("[name=myBusinessSecurityLevel]:checked").val();
                otherData += "&serviceSecurityLevel=" + $("[name=myServiceSecurityLevel]:checked").val();
                var cbBusinessSecurityDamage = "", cbSysSecurityDamage = "";
                $("#businessSecurityDamage input[type=checkbox]:checked").each(function () {
                    cbBusinessSecurityDamage += $(this).val() + ",";
                });
                cbBusinessSecurityDamage = cbBusinessSecurityDamage.substring(0, cbBusinessSecurityDamage.length - 1);
                $("#sysSecurityDamage input[type=checkbox]:checked").each(function () {
                    cbSysSecurityDamage += $(this).val() + ",";
                });
                cbSysSecurityDamage = cbSysSecurityDamage.substring(0, cbSysSecurityDamage.length - 1);

                otherData += "&businessSecurityDamage=" + cbBusinessSecurityDamage + "&sysSecurityDamage=" + cbSysSecurityDamage;

                if ($("[name=deptInchargeReview] option:selected").val() != "")
                    otherData += "&deptInchargeReview=" + $("[name=deptInchargeReview] option:selected").val();

                var _fj = $("table#applyInfo select");
                for (var i = 0; i < _fj.length; i++) {
                    otherData += "&" + $(_fj[i]).attr("name") + "=" + $(_fj[i]).children("option:selected").val();
                }


                var totalNum=0;
                
                if(!$.isNullOrEmpty($("[name=level1SysNum]")))
    				totalNum=totalNum+parseInt($("[name=level1SysNum]").val());
                
                if(!$.isNullOrEmpty($("[name=level2SysNum]")))
    				totalNum=totalNum+parseInt($("[name=level2SysNum]").val());
    			
    			if(!$.isNullOrEmpty($("[name=level3SysNum]")))
    				totalNum=totalNum+parseInt($("[name=level3SysNum]").val());
    			
    			if(!$.isNullOrEmpty($("[name=level4SysNum]")))
    				totalNum=totalNum+parseInt($("[name=level4SysNum]").val());
    			
    			if(!$.isNullOrEmpty($("[name=level5SysNum]")))
    				totalNum=totalNum+parseInt($("[name=level5SysNum]").val());
    			
    			otherData+="&totalSysNum="+totalNum; 
                
                
                otherData += "&expertReview=" + $("[name=expertReview] option:checked").val() + "&hasDeptIncharge=" + $("[name=hasDeptIncharge] option:checked").val() + "&hasSysLevelFile=" + $("[name=hasSysLevelFile] option:checked").val() + "&sysSecurityLevel=level";

                var num1 = parseInt($("[name=myBusinessSecurityLevel]:checked").val().replace("level", "")), num2 = parseInt($("[name=myServiceSecurityLevel]:checked").val().replace("level", ""));
                if (num1 > num2) {
                    otherData += num1;
                }
                else {
                    otherData += num2;
                }

                var _attachIds = $(".upload table tbody tr"), attachIds = "";
                for (var i = 0; i < _attachIds.length; i++) {
                    attachIds += $(_attachIds[i]).attr("name") + ",";
                }

                attachIds = attachIds.substring(0, attachIds.length - 1);

                $(this).attr("disabled", true);
                $.postsave2("${pageContext.request.contextPath}", "projectPlanForm", "securityLevel", otherData, "/securityLevel/securityLevelList", true, false, true, attachIds);

                window.close();
                location.href = "${pageContext.request.contextPath}/securityLevel/securityLevelList";

            });

            $("select").change(function () {
                var _str = $(this).attr("name") + "Other";
                if ($(this).attr("name") == "sysServeScope") {
                    if ($(this).val() == "crossProvince") {
                        $("#sysServeScopeCrossP").css("display", "inline");
                        $("#sysServeScopeCrossC").css("display", "none");
                        $("#sysServeScopeOther").css("display", "none");
                    }
                    else if ($(this).val() == "crossCity") {
                        $("#sysServeScopeCrossC").css("display", "inline");
                        $("#sysServeScopeOther").css("display", "none");
                        $("#sysServeScopeCrossP").css("display", "none");
                    }
                    else if ($(this).val() == "other") {
                        $("#sysServeScopeOther").css("display", "inline");
                        $("#sysServeScopeCrossP").css("display", "none");
                        $("#sysServeScopeCrossC").css("display", "none");
                    }
                    else {
                        $("#sysServeScopeOther").css("display", "none");
                        $("#sysServeScopeCrossP").css("display", "none");
                        $("#sysServeScopeCrossC").css("display", "none");
                    }


                }
                else if ($(this).attr("name") == "isSubsystem" || $(this).attr("name") == "hasDeptIncharge") {
                    if ($(this).val() == "YES") {
                        $(this).parents("tr").next("tr").css("display", "table-row");
                    }
                    else {
                        $(this).parents("tr").next("tr").css("display", "none");
                    }
                }
                else if ($(this).hasClass("myproduct")) {
                    if ($(this).val() == "part") {
                        $(this).parents("td").next("td").find("input").removeAttr("disabled");
                        $(this).parents("td").next("td").find("input").val("");
                    }
                    else if ($(this).val() == "all") {
                        $(this).parents("td").next("td").find("input").attr("disabled", "disabled");
                        $(this).parents("td").next("td").find("input").val("100");
                    }
                    else if ($(this).val() == "none") {
                        $(this).parents("td").next("td").find("input").attr("disabled", "disabled");
                        $(this).parents("td").next("td").find("input").val("0");
                    }
                }
                else if ($(this).hasClass("myproduct2")) {
                    if ($(this).val() == "yes") {
                        $(this).parents("td").next("td").find("select").removeAttr("disabled");
                    }
                    else {
                        $(this).parents("td").next("td").find("select").attr("disabled", "disabled");
                    }

                }
                else if ($(this).attr("name") == "isOperationOutsource") {
                    if ($(this).val() == "YES") {
                        $(this).parent("td").attr("colspan", "1");
                        $("input[name=outsourceCompany]").parent().css("display", "table-cell");
                        $("input[name=outsourceCompany]").parent().prev().css("display", "table-cell");
                    }
                    else {
                        $(this).parent("td").attr("colspan", "3");
                        $("input[name=outsourceCompany]").parent().css("display", "none");
                        $("input[name=outsourceCompany]").parent().prev().css("display", "none");
                    }
                }
                else if ($(this).val() == "other") {
                    if ($("input[name=" + _str + "]").length > 0) {
                        if ($("input[name=" + _str + "]").parents(".mytable").length > 0) {
                            $("input[name=" + _str + "]").css("display", "inline");
                        }
                        else {
                            $(this).parent("td").attr("colspan", "1");
                            $("input[name=" + _str + "]").parent().css("display", "table-cell");
                            $("input[name=" + _str + "]").parent().prev().css("display", "table-cell");
                        }
                    }
                }
                else {
                    if ($("input[name=" + _str + "]").length > 0) {
                        if ($("input[name=" + _str + "]").parents(".mytable").length > 0) {
                            $("input[name=" + _str + "]").css("display", "none");
                        }
                        else {
                            $(this).parent("td").attr("colspan", "3");
                            $("input[name=" + _str + "]").parent().css("display", "none");
                            $("input[name=" + _str + "]").parent().prev().css("display", "none");
                        }
                    }
                }
            });

            $("#businessSecurityDamage input[type=checkbox]").click(function () {

                if ($(this).attr("checked") == "checked") {
                    var str = $("#businessSecurityDamage input[type=checkbox]:checked"), str2 = $(this).attr("class"), str3 = "";
                    for (var i = 0; i < str.length; i++) {
                        if (str[i] != this)
                            str3 += $(str[i]).attr("class");
                    }

                    if (str3.indexOf(str2) <= -1) {
                        $("#businessSecurityDamage input[type=checkbox]").not(this).removeAttr("checked");

                    }
                    $("input[name=myBusinessSecurityLevel][value=" + str2 + "]").attr("checked", true);
                }
                var num1 =-1,num2=-1;
                
              	 if($("[name=myBusinessSecurityLevel]:checked").length>0)
              		 num1=parseInt($("[name=myBusinessSecurityLevel]:checked").val().replace("level", ""))
              	
                   if($("[name=myServiceSecurityLevel]:checked").length>0)
              		 num2 = parseInt($("[name=myServiceSecurityLevel]:checked").val().replace("level", ""));
    
                	 if (num1 > num2) {
                      $("[name=sysSecurityLevel]").val("level"+num1);
                   }
                   else {
                  	 $("[name=sysSecurityLevel]").val("level"+num2);
                   }
            });

            $("#sysSecurityDamage input[type=checkbox]").click(function () {

                if ($(this).attr("checked") == "checked") {
                    var str = $("#sysSecurityDamage input[type=checkbox]:checked"), str2 = $(this).attr("class"), str3 = "";
                    for (var i = 0; i < str.length; i++) {
                        if (str[i] != this)
                            str3 += $(str[i]).attr("class");
                    }

                    if (str3.indexOf(str2) <= -1) {
                        $("#sysSecurityDamage input[type=checkbox]").not(this).removeAttr("checked");

                    }
                    $("input[name=myServiceSecurityLevel][value=" + str2 + "]").attr("checked", true);
                }
                var num1 =-1,num2=-1;
                
              	 if($("[name=myBusinessSecurityLevel]:checked").length>0)
              		 num1=parseInt($("[name=myBusinessSecurityLevel]:checked").val().replace("level", ""))
              	
                   if($("[name=myServiceSecurityLevel]:checked").length>0)
              		 num2 = parseInt($("[name=myServiceSecurityLevel]:checked").val().replace("level", ""));
    
                	 if (num1 > num2) {
                      $("[name=sysSecurityLevel]").val("level"+num1);
                   }
                   else {
                  	 $("[name=sysSecurityLevel]").val("level"+num2);
                   }
            });
            $("#btndel").click(function () {
                $(this).attr("disabled", true);
                $.postsave2("${pageContext.request.contextPath}", "projectPlanForm", "securityLevel", "&removed=1&id=" + QueryString.GetValue('id'), "/securityLevel/securityLevelList", false, true, false, "");

            });

            $("#applyInfo tbody select").change(function () {
                if ($(this).val() == "YES") {
                    $(this).parents("tr").after("<tr class=\"upload\"><td class=\"lableTd t_r\">资料</td><td colspan=\"3\"><table width=\"100%\" ><thead><tr><td  colspan=\"5\"><input id=\"" + $(this).attr("name") + "\" class=\"upload_button\" type=\"button\" value=\"浏览...\" /><div style=\"display:none\" class=\"myissue\">issue" + "aaa" + "</div><input type=\"button\" value=\"上传\"  onclick=\"$('#" + $(this).attr("name") + "').uploadify('upload','*');\"><input type=\"button\" value=\"取消\"  onclick=\"$('#" + $(this).attr("name") + "').uploadify('cancel','*');\"></td></tr><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan=\"2\">操作</td></tr></thead><tbody></tbody></table></td></tr>");
                    $("#" + $(this).attr("name")).uploadify({
                        'auto': false,
                        'method': "post",
                        'height': 20,
                        'width': 100,
                        'swf': 'js/uploadify.swf',
                        'uploader': '<%=basePath%>attach/api/upload?groupName=' + $(this).attr("name"),
                        'fileTypeDesc': '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',		//描述
                        'fileTypeExts': '*.txt;*.xls;*.xlsx;*.doc;*.docx;*.rar;*.zip;*.jpg;*.png;*.pdf',			//文件类型
                        'fileSizeLimit': '30000KB',			//文件大小
                        'buttonText': '选择文件',			//按钮名称
                        'fileObjName': 'uploadify',
                        'multi': true,
                        'successTimeout': 5,
                        'requeueErrors': false,
                        'removeTimeout': 1,
                        'removeCompleted': true,
                        'onSelectError': function (file, errorCode, errorMsg) {
                            alert("失败");
                            if (errorCode == -110) {
                                this.queueData.errorMsg = "文件太大，无法上传！";
                            }
                        },
                        'onUploadSuccess': function (file, data, response) {
                            var attachs = jQuery.parseJSON(data);
                            var attach = attachs.result[0];

                            if (attach.id != null)
                                $(this.button[0]).parents("table:first").find("tbody:first").append("<tr name=\"" + attach.id + "\"><td>" + attach.fileName + "</td><td>" + attach.fileSize + "</td><td>" + attach.uploadDate + "</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/" + attach.id + "\">下载</a></td><td><a class=\"del\">删除</a></td></tr>");
                            $("table tbody a.del").click(function () {
                                $.FileDel("${pageContext.request.contextPath}", $(this).parents("tr").attr("name"), true);
                                $(this).parents("tr:first").remove();
                            });
                        },

                    });
                }
                else {
                    if ($(this).parents("tr").next("tr").hasClass("upload"))
                        $(this).parents("tr").next("tr").remove();
                }


            });

        })
    </script>
</head>

<body class="Flow">

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
                                            <td class="lableTd t_r">单位名称</td>
                                            <td colspan="3">
                                               <input class="input_large" type="text" name="company" readonly="readonly"/><input style="display:none" class="input_large" name="companyId" readonly="readonly"/></td>
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
                                                <input type="text" class="input_small" name="level1SysNum" />个</td>
                                            <td class="lableTd t_r">第二级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level2SysNum" />个</td>

                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">第三级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level3SysNum" />个</td>
                                            <td class="lableTd t_r">第四级信息系统数</td>
                                            <td>
                                                <input type="text" class="input_small" name="level4SysNum" />个</td>

                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">第五级信息系统数</td>
                                            <td colspan="3">
                                                <input type="text" class="input_small" name="level5SysNum" />个</td>
                                        </tr>
			
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">信息系统基本情况</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">责任部门</td>
                                            <td colspan="3">
                                                <input type="text" name="dutyDept" class="input_large" maxlength="20"></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">责任部门联系人</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>姓名</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanName" maxlength="20" /></td>
                                                        <td>职务/职称</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanPost" maxlength="20" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>办公电话</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanPhone" maxlength="12" /></td>
                                                        <td>电子邮件</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="dutyDeptLinkmanEmail" maxlength="30" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">系统类型</td>
                                            <td colspan="3">
                                                <select name="systemType" class="input_large"></td>
                                            <td style="display: none" class="lableTd t_r">系统类型其他内容</td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="systemTypeOther" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">所在网络区域</td>
                                            <td colspan="3">
                                                <select name="sysNetArea" class="input_large"></td>
                                            <td style="display: none" class="lableTd t_r">所在网络区域其他内容</td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="sysNetAreaOther" />
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
                                            <td class="lableTd t_r">系统名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="systemName" maxlength="20" readonly="readonly" /></td>
                                            <td class="lableTd t_r">系统编号</td>
                                            <td>
                                                <input type="text" class="input_large" name="systemNum" maxlength="20" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统承载业务<br>
                                                情况</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>业务类型</td>
                                                        <td colspan="3">
                                                            <select name="sysBusinessType" class="input_large">
                                                                <input style="display: none; margin-left: 10px" type="text" class="input_large" name="sysBusinessTypeOther" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>业务描述</td>
                                                        <td colspan="3">
                                                            <input type="text" class="input_large" name="sysBusinessDescription" maxlength="30" /></td>
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
                                                            <select name="sysServeScope" class="input_large"></select>  
                                                                  <div id="sysServeScopeOther" style="display:none;margin-left:10px;">服务范围其他信息：<input type="text"  class="input_large" name="sysServeScopeOther" /></div>
                                                                  <div id="sysServeScopeCrossP" style="display:none;margin-left:10px;">跨省数量/单位（个）：<input type="text"  class="input_large" name="sysServeScopeCrossP" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" /></div>
                                                                  <div id="sysServeScopeCrossC" style="display:none;margin-left:10px;">跨地数量/单位（个）：<input type="text"  class="input_large" name="sysServeScopeCrossC" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" /></div>                                               
                                                   </td></tr>
                                                    <tr>
                                                        <td>服务对象</td>
                                                        <td colspan="3">
                                                            <select name="sysServeObj" class="input_large">
                                                                <input type="text" style="display: none; margin-left: 10px" class="input_large" name="sysServeObjOther" />
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
                                                            <select name="sysNetCover" class="input_large">
                                                                <input type="text" class="input_large" style="display: none; margin-left: 10px" name="sysNetCoverOther" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>网络性质</td>
                                                        <td colspan="3">
                                                            <select name="sysNetProperty" class="input_large">
                                                                <input type="text" class="input_large" style="display: none; margin-left: 10px" name="sysNetPropertyOther" />
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统互联情况</td>
                                            <td>
                                                <select name="sysConnect" style="width: 200px;"></td>
                                            <td class="lableTd t_r" style="display: none">系统互联情况其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_large" name="sysConnectOther" />
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
                                                            <input type="text" class="input_small" id="securityNum" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <select id="security" class="input_small myproduct">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="securityPercent" disabled="disabled" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>2</td>
                                                        <td>网络产品</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="netNum" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <select id="net" class="input_small myproduct">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="netPercent" disabled="disabled" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>3</td>
                                                        <td>操作系统</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="opsysNum" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <select id="opsys" class="input_small myproduct">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="opsysPercent" disabled="disabled" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>4</td>
                                                        <td>数据库</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="dbNum" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <select id="db" class="input_small myproduct">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="dbPercent" disabled="disabled" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>5</td>
                                                        <td>服务器</td>
                                                        <td>
                                                            <input type="text" class="input_small" id="serverNum" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <select id="server" class="input_small myproduct">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="serverPercent" disabled="disabled" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" />%</td>
                                                    </tr>

                                                    <tr>
                                                        <td>6</td>
                                                        <td>其他<input type="text" class="input_small" id="otherName" maxlength="20" /></td>
                                                        <td>
                                                            <input type="text" class="input_small" id="otherNum" maxlength="20" />
                                                        </td>
                                                        <td>
                                                            <select id="other" class="input_small myproduct">
                                                                <option value="">请选择</option>
                                                                <option value="all">全部使用</option>
                                                                <option value="none">全部未使用</option>
                                                                <option value="part">部分使用</option>
                                                            </select></td>
                                                        <td>
                                                            <input type="text" class="input_tiny" id="otherPercent" disabled="disabled" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" />%</td>
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
                                                            <select id="levelHas" class="input_small myproduct2">
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
                                                            <select id="riskHas" class="input_small myproduct2">
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
                                                            <select id="recoveryHas" class="input_small myproduct2">
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
                                                            <select id="urgentHas" class="input_small myproduct2">
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
                                                            <select id="integrationHas" class="input_small myproduct2">
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
                                                            <select id="advisoryHas" class="input_small myproduct2">
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
                                                            <select id="trainHas" class="input_small myproduct2">
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
                                                        <td>其他<input type="text" class="input_small" id="otherSysServicesName" /></td>
                                                        <td>
                                                            <select id="otherHas" class="input_small myproduct2">
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
                                                <input type="text" class="input_large" name="reviewCompany" maxlength="30" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">何时投入运行使用</td>
                                            <td colspan="3">
                                                <input type="text" readonly="readonly" class="input_large" name="startUserDate" maxlength="30" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统运维是否委外</td>
                                            <td>
                                                <select name="isOperationOutsource" class="input_small"></td>
                                            <td class="lableTd t_r" style="display: none" maxlength="30">委外单位名称</td>
                                            <td style="display: none">
                                                <input type="text" class="input_large" name="outsourceCompany" maxlength="30" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">系统是否是分系统</td>
                                            <td colspan="3">
                                                <select name="isSubsystem" class="input_small"></td>
                                        </tr>
                                        <tr style="display: none">
                                            <td class="lableTd t_r">上级系统名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="mainSystem" /></td>
                                            <td class="lableTd t_r">上级系统所属单位名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="mainSystemCompany" /></td>
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
                                                <input type="text" readonly="readonly" class="input_large" name="levelConfirmDate" maxlength="10" readonly="readonly" /></td>
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
                                                <input type="text" class="input_large" name="deptIncharge" maxlength="30" readonly="readonly" /></td>
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
                                                <input type="text" class="input_large" name="sysLevelReviewDate" readonly="readonly" maxlength="30" /></td>
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
                                                <input type="text" class="input_large" name="applyTime" disabled="disabled" /><input type="text" class="input_large" name="reportUnitId" style="display: none" /></td>
                                            <td class="lableTd t_r">申报人</td>
                                            <td>
                                                <input type="text" class="input_large" name="applyer" readonly /><input type="text" class="input_large" name="applyerLoginname" readonly style="display: none" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">审核人</td>
                                            <td>
                                                <select id="principalPeople" style="width: 260px;">
                                                    <option value="">请选择</option>
                                                </select>
                                            </td>
                                            <td class="lableTd t_r">操作时间</td>
                                            <td>
                                                <input type="text" class="input_large" id="initiateTime" disabled="disabled" /></td>
                                        </tr>

                                    </table>
                                </form>
                            </div>
                            <div class="mb10 t_c">
                                <input type="button" class="btnSubmit" value="提 交" />
                                &nbsp;
              <input type="button" id="btndel" value="返 回" />
                                &nbsp;
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
