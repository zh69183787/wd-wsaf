<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>目标计划申报</title>
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
       <script src="js/f.defaultJs.js"></script>
    <script src="js/f.securityPlan.js"></script>
    
    <style type="text/css">
        .mytable2 tbody td
        {
            text-align: center;
            vertical-align: middle;
            border-left: 1px #e4e4e4 solid;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $.postSecurityPlanDetail2 = function (firUrl, id) {
                if (firUrl != "") {
                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/securityPlan/get/" + id,
                        type: 'post',
                        success: function (data, status, xhr) {

                            if (status == "success" && data != null) {
                                if (data.success == true ) {
                                    var entry = data.result;
                                    $("#initiateTime").val(data.result.initiateTime)
                                    for (var item in entry) {
                                        try {
                                        	 if(item!="suggestion")
                                            $("[name=" + item + "]").val(entry[item]);
                                        }
                                        catch (e) {
                                            alert(e);
                                        }
                                    }
                                    $("#btnSubmit2").click(function () {
                                        if ($("input[name=btnISPass]:checked").val() == "pass") {
                                            var otherData = "";
                                            if (id != null) {
                                                var d = new Date();

                                                otherData += "&handler=郑思浩";
                                                otherData += "&handlerLoginname=G001000001702549";
                                                otherData += "&initiator=" + entry.handler;
                                                otherData += "&initiatorLoginname=" + entry.handlerLoginname;

                                                otherData += "&id=" + id + "&status=infoDeptAudit" + "&initiateTime=" + d.getTime();
                                            }
                                            
                                            $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":false,"modname":"securityPlan","otherData":otherData + "&suggestion=" + $("[name=suggestion]").val(),"isClose":true});

                                            $(this).attr("disabled", true);

                                        }
                                        else if ($("input[name=btnISPass]:checked").val() == "notPass") {
                                            var otherData = "";
                                            if (id != null) {
                                                otherData += "&id=" + id + "&status=principalBack";
                                            }
                                            var d = new Date();

                                            otherData += "&handler=" + entry.initiator;
                                            otherData += "&handlerLoginname=" + entry.initiatorLoginname;
                                            otherData += "&initiator=" + entry.handler;
                                            otherData += "&initiatorLoginname=" + entry.handlerLoginname;

                                            $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":false,"modname":"securityPlan","otherData":otherData + "&initiateTime=" + d.getTime() + "&suggestion=" + $("[name=suggestion]").val(),"isClose":true});

                                            $(this).attr("disabled", true);
                                        }

                                        else {
                                            alert("请选择是否通过")
                                        }
                                    });

                                }
                            }
                        },
                        error: function () {
                            alert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                        }
                    });
                }
            }

            $.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityPlan" });
            $.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityPlanDetail" });     

            QueryString.Initial();
            if (QueryString.GetValue('id') != null) {
                $.postSecurityPlanDetail2("${pageContext.request.contextPath}", QueryString.GetValue('id'));
                $.planTypeSp2({"url":"${pageContext.request.contextPath}","type":-1,"planId":QueryString.GetValue('id'),"otherData":"&finished=0"});

                $.getSuggestSecurityPlan("${pageContext.request.contextPath}", QueryString.GetValue('id'));

                $("#planType li").planTypeSp({"url":"${pageContext.request.contextPath}","type":-1,"planId":QueryString.GetValue('id'),"otherData":"&finished=0"});
                

                $("#btnSubmit").boxOpen();
                $(".ywbl").parent("li").boxOpen();
                
                $("[name=btnISPass]").click(function () {
                    var _str = "", _str2 = "";
                    switch ($("input[name=btnISPass]:checked").val()) {
                        case "pass":
                            _str = "通过。"
                            _str2 = "信息管理中心安全员用户审查";
                         
                            $("#btnSubmit2").val("提交审核");

                            break;
                        case "notPass":
                            _str = "不通过。"
                            _str2 = "返回申报人修改";

                       
                            $("#btnSubmit2").val("返回修改");
                            break;

                    }
                    $("[name=suggestion]").val(_str);
                    $("#nextDo").val(_str2);
                });

            }

            $("#btnClose").click(function () {
                window.close();
            });

        })

    </script>
</head>

<body class="Flow">

    <div id="bt" class="transparent" style="display: none"></div>

    <div style="display: none">

        <h3 class="clearfix mb10"><span class="fl">计划申报填写</span><div class="fr close"><a class="closewindow">关闭窗口</a></div>
        </h3>

        <div class="con">
            <form id="securityPlanDetailFrom">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="securityPlanDetailTable">

                    <tr>
                        <td class="fr">计划类型：</td>
                        <td>
                            <select name="planType" class="input_large" maxlength="30"></select></td>
                    </tr>
                    <tr>
                        <td class="fr">业务层级：</td>
                        <td>
                            <select name="businessLevel" class="input_large" maxlength="30"></select></td>
                    </tr>
                    <tr>
                        <td class="fr">项目编号：</td>
                        <td>
                            <input name="projectNum" type="text" class="input_large" maxlength="30" /></td>
                    </tr>

                    <tr>
                        <td class="fr">项目名称：</td>
                        <td>
                            <input name="projectName" type="text" class="input_large" maxlength="30" /></td>
                    </tr>

                    <tr>

                        <td class="fr">系统名称：</td>
                        <td>
                            <select id="mysystemName" class="input_large">
                                <option value="">请选择</option>
                                 <option value="level0">无</option>
                            </select></td>
                    </tr>

                    <tr>

                        <td class="fr">系统等级：</td>
                        <td>
                            <select name="systemLevel" type="text" class="input_large" disabled="disabled"></select></td>
                    </tr>

                    <tr>
                        <td class="fr">主要内容：</td>
                        <td>
                            <textarea rows="2" name="mainContent" maxlength="200"></textarea></td>

                    </tr>

                    <tr>
                        <td class="fr">实施方：</td>
                        <td>
                            <select name="implement" class="input_small"></select></td>
                    </tr>
                    <tr>
                        <td class="fr">计划开始时间：</td>
                        <td>
                            <input name="planStartTime" type="text" class="input_small" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="fr">计划结束时间：</td>
                        <td>
                            <input name="planEndTime" type="text" class="input_small" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="fr">费用(元)：</td>
                        <td>
                            <input name="cost" type="text" class="input_large" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="fr">目标计划：</td>
                        <td>
                            <input name="targetPlan" type="text" class="input_large" maxlength="30"></td>
                    </tr>
                    <tr>
                        <td  class="fr">备注：</td>
                        <td>
                            <textarea rows="2" name="remarks"></textarea></td>

                    </tr>

                </table>
            </form>
        </div>

        <div class="button t_c">

            <input type="button" id="btnSave" value="保存" />
            &nbsp;
        </div>

    </div>

    <!--Transparent End-->
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
                       
                        审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left: 20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left: 10px">不通过</td>

                </tr>

                <tr>

                    <td class="td_1">&nbsp;</td>

                    <td>
                       
                        意见</td>

                </tr>

                <tr>

                    <td class="td_1">&nbsp;</td>

                    <td>
                        <textarea name="suggestion" rows="4" placeholder="请输入意见"></textarea></td>

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

        

        </div>

    </div>

    <!--Transparent2 End-->

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
                                目标计划申报表</h1>

                            <div class="mb10">
                                <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">基本信息</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">单位</td>
                                            <td colspan="3">
                                                <select type="text" name="company" class="input_large" disabled="disabled"></select></td>
                                        </tr>
                                        <tr class="companyAddress">
                                            <td class="lableTd t_r">计划年度</td>
                                            <td colspan="3">
                                                <input type="text" name="planYear" class="input_tiny" readonly="readonly">
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="myTable">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">审批预审信息</h5>

                                                <ul id="planType" class="fr mr5">
                                                    <li class="selected"><a><span>等保测评</span></a></li>
                                                       <li><a><span>技术检测</span></a></li>
                                                    <li><a><span>安全培训</span></a></li>
                                                    <li><a><span>应急演练</span></a></li>
                                                    <li><a><span>专项整改</span></a></li>
                                                </ul>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="4" style="padding: 0">
                                                    <table width="100%" class="mytable2">
                                                        <tr class="bg2">
                                                            <td>序号</td>
                                                            <td>业务层级</td>
                                                            <td>项目编号</td>
                                                            <td>项目名称</td>
                                                            <td class="hid_item">系统名称</td>
                                                            <td class="hid_item">等级</td>
                                                            <td>主要内容</td>
                                                            <td>实施方</td>
                                                            <td>计划开始时间</td>
                                                            <td>计划完成时间</td>
                                                            <td>费用</td>
                                                            <td>目标计划</td>
                                                            <td>备注</td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
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
                                            <td class="lableTd t_r">当前处理人</td>
                                            <td>
                                                <input type="text" style="width: 230px" name="handler" readonly />
                                            </td>
                                            <td class="lableTd t_r">上一次操作时间</td>
                                            <td>
                                                <input type="text" class="input_large" id="initiateTime" disabled="disabled" /></td>
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
