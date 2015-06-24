<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>网上测评</title>
    <meta charset="utf-8"/>
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
    <script src="js/cpqMain.js"></script>
    <style>
        .red {
            display: inline;
            color: red;
        }

        .w90 {
            width: 90%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".chooseDept").click(function(){
                var url = "${pageContext.request.contextPath}"+"/cpqMain/deptInfo/?zoneId=rootId" +
                        "&deptIdId="+$(this).parent("div").next(":hidden").attr("name")+
                        "&deptCountId="+$(this).parent("div").next().next(":hidden").attr("name")+
                        "&deptNameId="+$(this).prev("textarea").attr("name")+"&random="+Math.random();
                window.open(url);
            });

            $("#createTime").val(new Date().getTime());
            $("#creator").val(decodeURI("${cookie.cpq_userName.value}"));
            $("#creatorLoginName").val("${cookie.cpq_loginName.value}");
            $.getMenu("${pageContext.request.contextPath}", "cpqMain");

            $('#startTime,#endTime').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true
            });

            $("#btnStart").click(function () {
                $("#dialog-confirm").dialog({
                    resizable: false,
                    height: 140,
                    width: 200,
                    modal: true,
                    buttons: {
                        "确认": function () {
                            var otherData = "";
                            if (QueryString.GetValue('id') != null) {
                                otherData += "&id=" + QueryString.GetValue('id');
                            }
                            $.postSaveWorkflow("${pageContext.request.contextPath}", "${pageContext.request.contextPath}/basicCrud/cpqMain/save/",
                                    "${pageContext.request.contextPath}/basicCrud/cpqWorkflow/save/", otherData);
                            $(this).dialog("close");
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }
                });
            });


            $("#btnSubmit").click(function () {
                $("#dialog-confirm").dialog({
                    resizable: false,
                    height: 140,
                    width: 200,
                    modal: true,
                    buttons: {
                        "确认": function () {
                            var info = $.validateForm();

                            if (info != "") {
                                alert(info + "\r\n请您修改");
                                $(this).dialog("close");
                                return false;
                            }
                            var otherData = "";
                            if (QueryString.GetValue('id') != null) {
                                otherData += "&id=" + QueryString.GetValue('id');
                            }
                            $.postSaveMain("${pageContext.request.contextPath}", "cpqMainForm", otherData, "/cpqMain/cpqMainEdit");
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }
                });
            });
            $("#btnClose").click(function () {
                window.opener = null;
                window.open('', '_self');
                window.close();
            });


        });
    </script>
</head>

<body class="Flow">

<div class="f_bg">

    <div class="logo_1"></div>

    <div class="gray_bg">

        <div class="gray_bg2">

            <div class="w_bg">

                <div class="Bottom">

                    <div class="Top" style="min-height: 0px;">

                        <h1 class="t_c">上海申通地铁集团有限公司<br>网上测评</h1>

                        <div class="mb10">
                            <form id="cpqMainForm">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                    <thead>
                                    <th colspan="4" class="f1"><h5 class="fl">基本信息</h5>
                                    </th>
                                    </thead>
                                    <tr>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            测评名称：
                                        </td>
                                        <td colspan="3">
                                            <input name="cpqName" id="cpqName" type="text" class="w90">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            开始时间：
                                        </td>
                                        <td>
                                            <input readonly id="startTime" name="startTime" type="text"
                                                   class="input_large">
                                        </td>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            结束时间：
                                        </td>
                                        <td>
                                            <input readonly id="endTime" name="endTime" type="text" class="input_large">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            被测评部门：
                                        </td>
                                        <td colspan="3">
                                            <input id="rootId" name="rootId" type="hidden" value="2500">
                                            <div style="width: 100%;float: left;">
                                                <textarea readonly id="beTestDeptCn" name="beTestDeptCn" rows="5"
                                                          class="w90"></textarea>
                                                <input style="vertical-align: bottom;" type="button" value="选择" class="chooseDept"/>
                                            </div>
                                            <input id="beTestDept" name="beTestDept" type="hidden">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            测评部门及名额：
                                        </td>
                                        <td colspan="3">
                                            <div style="width: 100%;float: left;">
                                                <textarea readonly id="testDeptCn" name="testDeptCn" rows="5"
                                                          class="w90"></textarea>
                                                <input style="vertical-align: bottom;" type="button" value="选择" class="chooseDept"/>
                                            </div>
                                            <input id="testDept" name="testDept" type="hidden">
                                            <input id="testDeptCount" name="testDeptCount" type="hidden">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            是否开放：
                                        </td>
                                        <td colspan="3">
                                            <select name="opened" id="opened"></select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            <div class="red"> *</div>
                                            背景描述：
                                        </td>
                                        <td colspan="3">
                                            <textarea id="description" name="description" rows="7"
                                                      class="w90"></textarea>
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" name="creator" id="creator">
                                <input type="hidden" name="creatorLoginName" id="creatorLoginName">
                                <input type="hidden" name="createTime" id="createTime">
                                <input type="hidden" name="status" id="status" value="draft">
                            </form>
                        </div>
                        <div class="mb10 t_c">
                            <input style="display: none;"  type="button" id="btnSubmit" value="保存草稿"/>
                            &nbsp;
                            <input style="display: none;" type="button" id="btnStart" value="开始测评"/>
                            &nbsp;
                            <input type="button" id="btnClose" value="关闭"/>
                            &nbsp; </div>
                        <div class="footer"></div>
                        <div id="dialog-confirm" title="" style="display:none">确认提交吗？</div>
                    </div>

                </div>

            </div>

        </div>

    </div>
</div>
</body>
</html>
