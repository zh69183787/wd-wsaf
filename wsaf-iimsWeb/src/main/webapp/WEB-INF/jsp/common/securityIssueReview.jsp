<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>信息安全问题管理</title>
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
    <script src="js/f.securityEvent.js"></script>
 

    <script type="text/javascript">
        $(function () {   
            $.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityIssue" });
             
            $("#btndel").click(function () {
                window.close();
                location.href = "${pageContext.request.contextPath}/securityIssue/securityIssueList";
            });
            
            if (QueryString.GetValue('id') != null) {
            	$.postSecurityIssueDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'));
            	$.getSuggestSecurityIssue("${pageContext.request.contextPath}",QueryString.GetValue('id'));
            	
            	$("[name=suggestion]").val("");
                $(".btnSubmit").boxOpen();
                $(".ywbl").parent("li").boxOpen();
                
                $("[name=btnISPass]").click(function () {
                    var _str = "", _str2 = "";
                    switch ($("input[name=btnISPass]:checked").val()) {
                        case "pass":
                            _str = "通过。"
                            _str2 = "审核通过";
                            $("#closebtn").css("display", "none");
                            $("#btnSubmit2").val("提交审查");

                            break;
                        case "notPass":
                            _str = "不通过。"
                            _str2 = "返回申报人修改";

                            $("#closebtn").css("display", "inline");
                            $("#btnSubmit2").val("返回修改");
                            break;

                    }
                    $("[name=suggestion]").val(_str);
                    $("#nextDo").val(_str2);
                });
                
                $("#btnSubmit2").click(function () {
                
                	  if ($("input[name=btnISPass]:checked").val() == "pass") {
                          var otherData = "";
                          if (QueryString.GetValue('id') != null) {
                              var d = new Date();

                             
                              otherData += "&initiator=" + $("[name=handler]").val()+"&initiatorLoginname=" + $("[name=handlerLoginname]").val();
                              otherData += "&id=" + QueryString.GetValue('id') + "&initiateTime=" + d.getTime();
                           
                            	  otherData+="&status=finish";
                            	  otherData += "&handler="+$("[name=applyer]").val()+"&handlerLoginname="+$("[name=applyerLoginname]").val();
                            	  
                          }
                           
                          $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":false,"modname":"securityIssue","otherData":otherData + "&suggestion=" + $("[name=suggestion]").val(),"isClose":true});
                          $(this).attr("disabled", true);

                      }
                      else if ($("input[name=btnISPass]:checked").val() == "notPass") {
                          var otherData = "";
                          if (QueryString.GetValue('id') != null) {
                              otherData += "&id=" + QueryString.GetValue('id') + "&status=infoDeptBack";
                         
                          var d = new Date();

                          otherData += "&handler="+$("[name=applyer]").val()+"&handlerLoginname="+$("[name=applyerLoginname]").val();
                          otherData += "&initiator=" + $("[name=handler]").val()+"&initiatorLoginname=" + $("[name=handlerLoginname]").val();
                          
                          $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":false,"modname":"securityIssue","otherData":otherData + "&initiateTime=" + d.getTime() + "&suggestion=" + $("[name=suggestion]").val(),"isClose":true});
                          $(this).attr("disabled", true);
                          }
                      }

                      else {
                          alert("请选择是否通过")
                      }
                  });
            }
           
        });
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
            <input type="button" id="btnSubmit2" value="提交审查" />
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
                              信息安全问题管理</h1>

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
                                                    <input type="text" class="input_large" name="company" maxlength="20"  readonly="readonly"/>
                                                    <div id="company_Id" style="display: none;"></div>
                                                </td>
                                                <td class="lableTd t_r">发现时间</td>
                                                <td>
                                                    <input type="text" readonly="readonly" name="findTime" class="input_small" maxlength="8"></td>
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">关联系统</td>
                                                <td>
                                                    <input type="text" name="relateSys" class="input_large" maxlength="20" readonly="readonly"></td>
                                                <td class="lableTd t_r">问题来源</td>
                                                <td>
                                                    <input type="text" name="issueSource" class="input_large" maxlength="20" readonly="readonly"></td>
                                            </tr>
                                              <tr>
                                                <td class="lableTd t_r">问题描述</td>
                                                <td colspan="3" >
                                                    <textarea name="issueDescription" rows="2"  maxlength="200" disabled="disabled"></textarea></td>
                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">分类信息</h5>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">业务类别</td>
                                                <td>
                                                       <select name="issueCate" class="input_large" disabled="disabled"></select></td>
                                                <td class="lableTd t_r">科目</td>
                                                <td>
                                                     <select name="issueSubject" class="input_large" disabled="disabled"></select></td>
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">科目子类</td>
                                                <td colspan="3">
                                                    <select name="issueItem" class="input_large" disabled="disabled"></select></td>
                                                
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">整改信息</h5>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">整改方案</td>
                                                <td colspan="3" >
                                                    <textarea name="rectifyPlan" rows="2"  maxlength="200" disabled="disabled"></textarea></td>
                                               
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">实际情况</td>
                                                 <td colspan="3" >
                                                    <textarea name="actualSituation" rows="2"  maxlength="200" disabled="disabled"></textarea></td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">计划开始时间</td>
                                                 <td >
                                                   <input type="text" readonly="readonly" name="startTime" class="input_small" maxlength="8" readonly="readonly"></td>
                                                 <td class="lableTd t_r">计划完成时间</td>
                                                 <td >
                                                   <input type="text" readonly="readonly" name="finishTime" class="input_small" maxlength="8" readonly="readonly"></td>
                                            </tr>
                                             <tr>
                                                <td class="lableTd t_r">整改方案备注</td>
                                                 <td colspan="3" >
                                                    <textarea name="rectifyRemark" rows="2"  maxlength="200" disabled="disabled"></textarea></td>  
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">跟踪信息</h5>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">跟踪日期</td>
                                                <td colspan="3" >
                                                    <input type="text" readonly="readonly" name="traceDate" class="input_small" maxlength="8"></td>
                                               
                                            </tr>
                                            <tr>
                                                <td class="lableTd t_r">复核情况</td>
                                                 <td colspan="3" >
                                                    <textarea name="checkSituation" rows="2"  maxlength="200" disabled="disabled"></textarea></td>
                                                
                                            </tr>
                                           
                                             <tr>
                                                <td class="lableTd t_r">跟踪信息备注</td>
                                                 <td colspan="3" >
                                                    <textarea name="traceRemark" rows="2"  maxlength="200" disabled="disabled"></textarea></td>  
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
                                                <input type="text" class="input_large" name="applyTime" readonly="readonly" /><input type="text" class="input_large" name="reportUnitId" style="display: none" /></td>
                                            <td class="lableTd t_r">申报人</td>
                                            <td>
                                                <input type="text" class="input_large" name="applyer" readonly /><input type="text" class="input_large" name="applyerLoginname"  readonly style="display: none" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">当前处理人</td>
                                            <td>
                                                <input name="handler" style="width: 260px;"  type="text" readonly="readonly"/>
                                              <input type="text" style="width: 230px;display:none;" name="handlerLoginname" readonly />
                                            </td>
                                            <td class="lableTd t_r">上一次操作时间</td>
                                            <td>
                                                <input type="text" class="input_large" name="initiateTime" readonly="readonly"/></td>
                                        </tr>

                                    </table>
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="leaderSuggest">
                                      <thead><th><h5 class="fl">审批信息</h5></th></thead><tbody><tr><td></td></tr></tbody></table>
                                </form>
                            </div>
                            <div class="mb10 t_c">
                              <input type="button" class="btnSubmit" value="审 查" />
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