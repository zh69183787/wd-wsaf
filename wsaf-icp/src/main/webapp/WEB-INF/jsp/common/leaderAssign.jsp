<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>网上测评名额分派</title>
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
    <script src="js/messagebox.js"></script>
    <script src="js/cpqMain.js"></script>
    <style>
        .red {
            display: inline;
            color: red;
        }

        .w90 {
            width: 90%;
        }

        pre {
            white-space: pre-wrap; /* css-3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-word; /* Internet Explorer 5.5+ */
            word-break: break-all;
            overflow: hidden;
        }

        .disable {
            disabled: true;
        }
    </style>
    <script type="text/javascript">
        function getWorkflowInfo(mainId){
            $.ajax({
                url: "${pageContext.request.contextPath}" + "/basicCrud/cpqWorkflow/get/" + QueryString.GetValue('id'),
                dataType: 'json',
                type: 'post',
                success: function (data, status, xhr) {
                    if (status == "success" && data != null) {
                        if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
                            var entry = data.result;
                            var mainId = entry.cpqId;
                            getMainInfo(entry,mainId);
                        }
                    }
                },
                error: function () {
                    alert("对不起！你的请求出现异常，请联系服务人员！");
                }
            });
        }
        function getMainInfo(flowBo,mainId){
            $.ajax({
                url: "${pageContext.request.contextPath}" + "/basicCrud/cpqMain/get/" + mainId,
                dataType: 'json',
                type: 'post',
                success: function (data, status, xhr) {
                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
                        var entry = data.result;
                        var deptId = flowBo.testDept;
                        var deptCount = entry.testDeptCount;
                        $("#cpqName").html(entry.cpqName);
                        $("#startTime").html(entry.startTime);
                        $("#endTime").html(entry.endTime);
                        $("#beTestDeptCn").html(entry.beTestDeptCn)
                        $("#testDeptCn").html(entry.testDeptCn);
                        $("#description").html(entry.description);
                        var reg = eval("/"+deptId+"\\[(\\d+)\\]/");
                        var c = (deptCount.match(reg))[1]==null?10:(deptCount.match(reg))[1];
                        //alert(c);
                        $("#count").val(c);$("#countTd").html("名额："+c+" 人");
                        $("#deptId").val(deptId);

                    }
                }
            })

        }
        function updateWorkflowInfo(){
            userCounts = $("#count").val();
            $.ajax({
                url: "${pageContext.request.contextPath}" + "/basicCrud/cpqWorkflow/save?id=" + QueryString.GetValue('id'),
                type: 'post',
                dataType : 'json',
                data: {
                    "handleTime":new Date().getTime()
                },
                success: function (data, status, xhr) {
                    if (status == "success" && data != null) {
                        if (data.success == true) {
                            var lArr = $("#loginNames").val().split(",");
                            var uArr = $("#userNames").val().split(",");
                            var len = $("#loginNames").val().split(",").length;
                            for(var m=0;m<len;m++) {
                                saveWorkflowInfo(data.result,lArr[m],uArr[m]);
                            }
                        }
                        else {
                            alert("操作失败");
                            $("#btnSelect").attr("disabled",false);
                        }
                    }
                    else {
                        alert("操作失败");
                        $("#btnSelect").attr("disabled",false);
                    }

                }
            });

        }

        function saveWorkflowInfo(flowBo,loginName,userName){
            $.ajax({
                url: "${pageContext.request.contextPath}" + "/basicCrud/cpqWorkflow/save",
                type: 'post',
                dataType : 'json',
                data: {
                    "cpqId":flowBo.cpqId,
                    "testDept":flowBo.testDept,
                    "initiator":flowBo.handler,
                    "initiatorLoginname":flowBo.handlerLoginname,
                    "initiateTime":new Date().getTime(),
                    "handler":userName,
                    "handlerLoginname":loginName,
                    "status":"tmbk"
                },
                success: function (data, status, xhr) {
                    if (status == "success" && data != null) {
                        if(data.success == true){
                            userCount ++;
                            if(userCount == userCounts){
                                alert("操作成功！");
                                window.opener = null;
                                window.open("","_self");
                                window.close();
                            }
                        }
                    }
                    else {
                        alert("操作失败");
                        $("#btnSelect").attr("disabled",false);
                    }

                }
            });

        }

        var userCount = 0;
        var userCounts = 0;

        $(function () {
            initMessagebox();
            initMessageboxClose();
            $(".choosePerson").click(function(){
                var url = "${pageContext.request.contextPath}"+"/cpqMain/deptUsers/?zoneId=deptId&random="+Math.random();
                window.open(url);
            });
            $(".clearPerson").click(function(){
                $("#loginNames,#userNames").val("");
            });
            $(".ywbl").parent("li").css("cursor", "pointer");
            $(".ywbl").css("background-image", "url(css/default/images/icon_1.png)");
            QueryString.Initial();
            if (QueryString.GetValue('id') != null) {
                getWorkflowInfo(QueryString.GetValue('id'));
            }

            $("#btnSelect").click(function(){
               if($("#loginNames").val()=="" || $("#loginNames").val()==null){
                   alert("请选择部门人员！");
                   return false;
               }else if($("#loginNames").val().split(",").length != $("#count").val()){
                   alert("请选择与名额人数相同的部门人员！");
                   return false;
               }else{
                   updateWorkflowInfo();
               }


            });
            $("#btnClose").click(function () {
                window.close();
            });
        })

    </script>
</head>

<body class="Flow">
<div class="transparent" id="maskDiv" style="display: none;" style="filter:alpha(opacity=30);opacity:0.3;"></div>

<div id="handle_zone" class="f_window" style="display:none;margin:0 auto;">

    <h3 class="clearfix mb10"><span class="fl">业务办理</span>
        <div class="fr close"><a id="handleDivClose" class="closewindow">关闭窗口</a></div>
    </h3>

    <div class="con">

        <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>
                <td class="td_1" colspan="2" style="color:red;">注：请选择与名额相同的部门人员数填写测评表</td>
            </tr>
            <tr>
                <td class="td_1" colspan="2" id="countTd">
                </td>
            </tr>
           <tr id="dealPersonTr" height="30">
                <td style="text-align:right;"><font style="color:red;">*</font></td>
                <td>
                    选择部门人员：
                    <input type="button" name="choosePerson" value="..." class="btn choosePerson">
                    <input type="button" name="clearPerson" value="清除" class="btn clearPerson"/>
                    <textarea rows="5" id="userNames" name="userNames" readonly></textarea>
                    <input type="hidden" id="loginNames" name="loginNames" value="">
                    <input type="hidden" id="deptId" name="deptId" value="">
                    <input type="hidden" id="count" name="count"/>


                </td>
            </tr>

        </table>

    </div>

    <div class="button t_c">
        <input type="button" id="btnSelect" value="提交"/>
    </div>

</div>


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

                        <ul class="button clearfix">

                            <li><a id="todo_handle" class="ywbl" href="javascript:void(0);">业务办理</a></li>

                            <!--<li class="disable"><a class="print">打印</a></li>

                            <li class="disable"><a  class="jk">业务监控</a></li>

                            <li class="disable"><a class="tips">小提示</a></li>

                            <li class="disable"><a class="imp">公文导入</a></li>

                            <li class="disable"><a  class="exp">公文导出</a></li>-->

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
                                            测评名称：
                                        </td>
                                        <td colspan="3" id="cpqName"></td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            开始时间：
                                        </td>
                                        <td id="startTime"></td>
                                        <td class="lableTd t_r">
                                            结束时间：
                                        </td>
                                        <td id="endTime"></td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            被测评部门：
                                        </td>
                                        <td colspan="3">
                                            <pre id="beTestDeptCn"
                                                 style="width: 100%; white-space: pre-wrap !important; word-wrap: break-word;"></pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lableTd t_r">
                                            测评部门及名额：
                                        </td>
                                        <td colspan="3">
                                            <pre id="testDeptCn"
                                                 style="width: 100%; white-space: pre-wrap !important; word-wrap: break-word;"></pre>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="lableTd t_r">
                                            背景描述：
                                        </td>
                                        <td colspan="3">
                                            <pre id="description"
                                                 style="width: 100%; white-space: pre-wrap !important; word-wrap: break-word;"></pre>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div class="mb10 t_c">
                            <input type="button" id="btnClose" value="关闭"/>
                            &nbsp; </div>
                        <div class="footer"></div>
                    </div>

                </div>

            </div>

        </div>

    </div>
</div>
</body>
</html>
