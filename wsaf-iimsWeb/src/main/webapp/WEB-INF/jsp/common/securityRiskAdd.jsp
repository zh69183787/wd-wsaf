<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>信息安全风险管理</title>
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
    <script src="js/f.securityLevel.js"></script>

    <script type="text/javascript">
        $(function () {
        	$("[name=findTime]").datepicker({ dateFormat:"yy-mm-dd"}).click(function(){$(".ui-state-default").removeAttr("href"); });
            $("[name=handleTimeLimit]").datepicker({ dateFormat:"yy-mm-dd"}).click(function(){$(".ui-state-default").removeAttr("href"); });
            $("[name=confirmDate]").datepicker({ dateFormat:"yy-mm-dd"}).click(function(){$(".ui-state-default").removeAttr("href"); });
            $("[name=traceDate]").datepicker({ dateFormat:"yy-mm-dd"}).click(function(){$(".ui-state-default").removeAttr("href"); });
            
            $.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityRisk" });
            $.userIdentity({ "url": "${pageContext.request.contextPath}" });
            $.getRole({"url": "${pageContext.request.contextPath}","otherData":"companyId=2549&role=principal","personDescribe":"","inputId":"principalPeople"});

            $("#btndel").click(function () {
                window.close();
                location.href = "${pageContext.request.contextPath}/securityRisk/securityRiskList";
            });
            
            $(".btnSubmit").click(function () {
            	 var d = new Date(), mystate = "", yanzhen = $.verificationAll(),otherData="";

                 if (yanzhen != "") {
                     alert(yanzhen);
                     return false;
                 }

                 if ($(this).val().trim() == "提 交") {
                     mystate = "infoDeptReview";
                 }
                 else if ($(this).val().trim() == "保存草稿") {
                     mystate = "draft";
                 }
                 else {
                     alert("error:状态错误")
                     return false;
                 }

     			otherData += "&status="+mystate+"&handler=" + $("#principalPeople option:selected").text()+"&handlerLoginname=" + $("#principalPeople option:selected").val();
     			otherData += "&initiator=" + $("[name=applyer]").val()+ "&initiatorLoginname=" + $("[name=applyerLoginname]").val()+"&companyId="+$("#company_Id").text();
     			otherData += "&initiateTime=" + d.getTime()+"&applyTime=" + d.getTime();
     			
                 $(this).attr("disabled", true);
                 $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":true,"modname":"securityRisk","otherData":otherData,"isClose":true});
            });
        });
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
                              信息安全风险管理</h1>

                            <div class="mb10">
                                <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">基本信息</h5>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">单位名称</td>
                                                <td>
                                                    <input type="text" class="input_large" name="company" maxlength="20" />
                                                    <div id="company_Id" style="display: none;"></div>
                                                </td>
                                                <td class="lableTd t_r">发现时间</td>
                                                <td>
                                                    <input type="text" readonly="readonly" name="findTime" class="input_small" maxlength="8"></td>
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">关联系统</td>
                                                <td colspan="3">
                                                    <input type="text" name="relateSys" class="input_large" maxlength="20"></td>
                                                      </tr>
                                             
                                        </tbody>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">风险信息</h5>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">风险类别</td>
                                                <td>
                                                       <select name="riskType" class="input_large"></select></td>
                                                <td class="lableTd t_r">风险等级</td>
                                                <td>
                                                     <select name="riskLevel" class="input_large"></select></td>
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">风险来源</td>
                                                <td colspan="3">
                                                    <input name="riskSource" maxlength="40" type="text" class="input_large" /></td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">风险描述</td>
                                                <td colspan="3" >
                                                    <textarea name="riskDescription" rows="2"  maxlength="200"></textarea></td>
                                                
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">风险处理信息</h5>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">风险处置方案</td>
                                                <td colspan="3" >
                                                    <textarea name="handlePlan" rows="2"  maxlength="200"></textarea></td>
                                               
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">处理跟踪情况</td>
                                                 <td colspan="3" >
                                                    <textarea name="traceCase" rows="2"  maxlength="200"></textarea></td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">跟踪日期</td>
                                                 <td >
                                                   <input type="text" readonly="readonly" name="traceDate" class="input_small" maxlength="8"></td>
                                                 <td class="lableTd t_r">风险处置时限</td>
                                                 <td >
                                                   <input type="text" readonly="readonly" name="handleTimeLimit" class="input_small" maxlength="8"></td>
                                            </tr>
                                             <tr>
                                                <td class="lableTd t_r">风险确认日期</td>
                                                 <td colspan="3" >
                                                      <input type="text" readonly="readonly" name="confirmDate" class="input_small" maxlength="8"></td>  
                                            </tr>
                                            
                                        </tbody>
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
                                                <input type="text" class="input_large" name="applyer" readonly /><input type="text" class="input_large" name="applyerLoginname" id="applyerLoginname" readonly style="display: none" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">审核人</td>
                                            <td>
                                                <select id="principalPeople" style="width: 260px;"></select>
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
              <input type="button" class="btnSubmit" value="保存草稿" />
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
