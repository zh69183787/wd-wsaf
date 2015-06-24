<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>项目计划申报</title>
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
     <script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
    
    <script src="js/f.defaultJs.js"></script>
    <script src="js/f.projectPlan.js"></script>
    
    <script type="text/javascript">
        $(function () {
            $("#btnSubmit").boxOpen();
            $(".ywbl").parent("li").boxOpen();

            $.postProjectReviewDetail = function (firUrl, id, isread, isPreliminaryPersonnel) {
                if (firUrl != "") {
                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/projectPlan/get/" + id,
                        type: 'post',
                        success: function (data, status, xhr) {

                            if (status == "success" && data != null) {
                                if (data.success == true ) {
                                    var entry = data.result, arrTime = new Array();

                                    $("#initiateTime").val(entry.initiateTime);
                                   // $("#myhandlerLoginname").val(entry.handlerLoginname);

                                    arrTime = entry.planStartDate.split("-");
                                    $("#planStartYear").val(arrTime[0]);
                                    $("#planStartMon").val(arrTime[1]);

                                    var arrEndTime = new Array();
                                    arrEndTime = entry.planEndDate.split("-");
                                    $("#planEndYear").val(arrEndTime[0]);
                                    $("#planEndYearMon").val(arrEndTime[1]);


                                    if (entry.yearTarget == "implementPartOK") {
                                        $("#yearTargetReason").css("display", "block");
                                        $("#yearTargetReasonTitle").text("年度推进目标理由").addClass("lableTd t_r");
                                    }


                                    $("#myhandlerLoginname").attr("disabled", "disabled");
                                    $("#myuploadify").uploadify({
                                        'auto': false,
                                        'method': "post",
                                        'height': 20,
                                        'width': 100,
                                        'swf': 'js/uploadify.swf',
                                        'uploader': '<%=basePath%>attach/api/upload?groupName=procedure' ,
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
                                    
                                    $("#addAttachP").click(function(){
                                    	$(".f_window").css("display", "none");
                                    	$("#dialogAttach").dialog({
                                    				resizable: false,
                                    				title: '上传附件',
                                                    width: 490,
                                                    beforeClose: function( event, ui ) {
                                                          $(".f_window").css("display", "block");
                                                          var _attachIds = $("table#tbupload tbody tr");
                                                  		  $("#addAttachP a").text("添加附件("+_attachIds.length+")");  
                                                    },
                                                    buttons: {
                                                    	"保存": function () {
                                                    		$(this).dialog("close");
                                                    	},
                                                    	"取消": function () {
                                                    		 var _attachIds = $("table#tbupload tbody tr");
                                            	                for (var i = 0; i < _attachIds.length; i++) {
                                            	                	 $.FileDel2("${pageContext.request.contextPath}", $(_attachIds[i]).attr("name"), true); 
                                            	                	 $(_attachIds[i]).remove();
                                            	                }
                                                    	$(this).dialog("close");
                                                    	
                                                    	}
                                                    }
                                                 
                                    			});
                                    });
                                    
                                    $("[name=btnISPass]").click(function () {
                                        var _str = "", _str2 = "";
                                        switch ($("input[name=btnISPass]:checked").val()) {
                                            case "pass":
                                                _str = "通过。"
                                                switch (entry.status) {
                                                    case "finishInnerAudit":
                                                    case "auditorCancel":
                                                    case "leaderBack":
                                                        _str2 = "提交到信息规划/信息安全/信息资源审核";
                                                        break;
                                                    case "auditorReview":
                                                        _str2 = "提交至信息中心项目管理岗审核";
                                                        break;
                                                    case "auditorPass":
                                                        _str2 = "提交至信息中心领导";
                                                        break;
                                                    case "leaderReview":
                                                        _str2 = "提交到会议评审";
                                                        break;
                                                }

                                                if ($("tr.reviewPerson").length == 0 && isPreliminaryPersonnel=="3") {
                                                    if (entry.status == "finishInnerAudit" || entry.status == "auditorCancel" || entry.status == "leaderBack") {
                                                      
                                                    }
                                                    else if (entry.status == "auditorPass") {
                                                     
                                                    }
                                                }
                                                $("#btnSubmit2").val("提交审核");
                                                break;
                                            case "notPass":
                                                _str = "不通过。"
                                                switch (entry.status) {

                                                    case "leaderBack":
                                                    case "auditorCancel":
                                                    case "auditorPass":
                                                    case "finishInnerAudit":
                                                        _str2 = "返回申报人修改";
                                                        break;
                                                    case "leaderReview":
                                                    case "auditorReview":
                                                        _str2 = "退回至信息中心项目管理岗审核";
                                                        break;
                                                    case "auditorPass":
                                                        _str2 = "提交至信息中心领导";
                                                        break;
                                                    case "leaderReview":
                                                        _str2 = "提交到会议评审";
                                                        break;
                                                }

                                                $("tr.reviewPerson").remove();

                                                $("#btnSubmit2").val("返回修改");
                                                break;

                                        }
                                        $("[name=suggestion2]").val(_str);
                                        $("#nextDo").val(_str2);

                                    });

                                    $("#btnSubmit2").click(function () {

                                        if ($("input[name=btnISPass]:checked").val() == "pass") {
                                            var otherData = "";
                                            var d = new Date();

                                            if (isPreliminaryPersonnel=="3") {

                                                if (entry.status == "finishInnerAudit" || entry.status == "leaderBack" || entry.status == "auditorCancel") {
                                                    var str_cbReview = "", str_china = "", cbReview = $("input[name=cbReview]:checked");

                                                   

                                                    otherData += "&initiator=胡波&initiatorLoginname=G002000000332549&handler=胡波 &handlerLoginname=G002000000332549&status=meetingReview&projectStatus=toInfoDept";
                                                }
                                                else if (entry.status == "auditorPass") {
                                                    var str_china = "", cbReview = $("input[name=cbReview]:checked");

                                                    otherData += "&initiator=胡波&initiatorLoginname=G002000000332549&handler=胡波&handlerLoginname=G002000000332549&status=meetingReview&projectStatus=toInfoDept";

                                                }
                                            }
                                            else if (isPreliminaryPersonnel==4||isPreliminaryPersonnel==5||isPreliminaryPersonnel==6) {
                                                var userName = $("#applyerLoginname").val(), chiName = "";

                                                
                                                
                                                otherData += "&initiator=胡波&initiatorLoginname=G002000000332549&handler=胡波&handlerLoginname=G002000000332549&status=meetingReview&projectStatus=toInfoDept";

                                            }
                                            else if (isPreliminaryPersonnel==2&& entry.status == "leaderReview") {
                                                otherData += "&initiator=" + entry.handler + "&initiatorLoginname=" + entry.handlerLoginname + "&handler=胡波&handlerLoginname=G002000000332549&status=meetingReview&projectStatus=toInfoDept";
                                            }

                                            if (QueryString.GetValue('id') != null) {
                                                otherData += "&id=" + QueryString.GetValue('id') + "&initiateTime=" + d.getTime() + "&suggestion=" + $("[name=suggestion2]").val();
                                            }

                                            //alert(otherData);
                                            $(this).attr("disabled", true);
                                           // $.postsave(, "projectPlanForm", , "/projectPlan/projectReviewList");
                                            $.postSave({"url":firUrl,"formName":"projectPlanForm","isClose":false,"isGetData":false,"modname":"projectPlan","otherData":otherData});
                                           
                                            var _attachIds = $("table#tbupload tbody tr"), attachIds = "";
					   	                    for (var i = 0; i < _attachIds.length; i++) {
					   	                    attachIds += $(_attachIds[i]).attr("name") + ",";
					   	                    }
					   	                    attachIds = attachIds.substring(0, attachIds.length - 1);
					   	                    if(attachIds!=""&&attachIds!=null)
					   	                   {
					   	                    	var workflowId=$.getWorkflowId({"url":firUrl,"otherdata":"ptype=projectPlan&pid="+id+"&sort=initiateTime desc"});				                	  
							                	$.saveFile({"url":firUrl,"modelName":"projectPlan","modelId":workflowId,"attachIds":attachIds});
					   	                   }
					   	                 
					   	                  window.opener=null;
										  window.close();

                                        }
                                        else if ($("input[name=btnISPass]:checked").val() == "notPass") {
                                            var otherData = ""; var d = new Date();

                                            if (isPreliminaryPersonnel=="3") {
                                                otherData += "&handler=" + entry.applyer + "&handlerLoginname=" + entry.applyerLoginname + "&initiator=胡波&initiatorLoginname=G002000000332549&status=turnBack&projectStatus=inDept";
                                            }
                                            else if (isPreliminaryPersonnel=="4"||isPreliminaryPersonnel=="5"||isPreliminaryPersonnel=="6") {
                                                var userName = $("#applyerLoginname").val(), chiName = "";
                                                  
                                                switch (userName) {
                                                    case "G020105000192549":
                                                        chiName = "徐文洁";
                                                        break;
                                                    case "G001000001702549":
                                                        chiName = "郑思浩";
                                                        break;
                                                    case "G010070003832549":
                                                        chiName = "方政";
                                                        break;

                                                }
                                                otherData += "&initiator=" + chiName + "&initiatorLoginname=" + userName + "&handler=胡波&handlerLoginname=G002000000332549&status=auditorCancel&projectStatus=toInfoDept";

                                            }
                                            else if (isPreliminaryPersonnel==2 && entry.status == "leaderReview") {
                                                otherData += "&initiator=" + entry.handler + "&initiatorLoginname=" + entry.handlerLoginname + "&handler=胡波&handlerLoginname=G002000000332549&status=leaderBack&projectStatus=toInfoDept";
                                            }


                                            if (QueryString.GetValue('id') != null) {
                                                otherData += "&id=" + QueryString.GetValue('id') + "&suggestion=" + $("[name=suggestion2]").val() + "&initiateTime=" + d.getTime();
                                            }

                      
                                            $(this).attr("disabled", true);
                                           // $.postsave(firUrl, "projectPlanForm", otherData, "/projectPlan/projectReviewList");
                                            $.postSave({"url":firUrl,"formName":"projectPlanForm","isClose":false,"isGetData":false,"modname":"projectPlan","otherData":otherData});
                                            var _attachIds = $("table#tbupload tbody tr"), attachIds = "";
					   	                    for (var i = 0; i < _attachIds.length; i++) {
					   	                    attachIds += $(_attachIds[i]).attr("name") + ",";
					   	                    }
					   	                    attachIds = attachIds.substring(0, attachIds.length - 1);
					   	                    if(attachIds!=""&&attachIds!=null)
					   	                   {
					   	                    	var workflowId=$.getWorkflowId({"url":firUrl,"otherdata":"ptype=projectPlan&pid="+id+"&sort=initiateTime desc"});				                	  
							                	$.saveFile({"url":firUrl,"modelName":"projectPlan","modelId":workflowId,"attachIds":attachIds});
					   	                   }
					   	                 
					   	                  window.opener=null;
										  window.close();
                                        }

                                        else {
                                            alert("请选择是否通过")
                                        }
                                    });



                                    for (var item in entry) {
                                        try {
                                            if (item == "resourceRequirement") {

                                                var dataObj = jQuery.parseJSON(entry[item]);

                                                for (var sitem in dataObj) {
                                                    var dataObj2 = jQuery.parseJSON(dataObj[sitem]);

                                                    switch (sitem) {
                                                        case "networkResource":
                                                        case "dataResource":
                                                            var rs = "<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">" + sitem + "</div>";
                                                            rs += "<input  type=\"text\" class=\"input_large\" value=\"" + dataObj2.reason + "\" style=\"width:500px;margin-right:15px\"/>" + $("#resourceRequirement option[value=" + sitem + "]").text() + "</td></tr>";
                                                            $("#" + item).parents("tr").after(rs);
                                                            break;
                                                        case "storageResource":
                                                            var rs = "<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">" + sitem + "</div>";
                                                            rs += "<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" value=\"" + dataObj2.num + "\">（G） <input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\" value=\"" + dataObj2.reason + "\"/>" + $("#resourceRequirement option[value=" + sitem + "]").text() + "</td></tr>";
                                                            $("#" + item).parents("tr").after(rs);
                                                            break;
                                                        case "virtualServerNumber":
                                                            var rs = "<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">" + sitem + "</div>";
                                                            rs += "<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" value=\"" + dataObj2.num + "\">（台）<input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\" value=\"" + dataObj2.reason + "\"/>" + $("#resourceRequirement option[value=" + sitem + "]").text() + "</td></tr>";
                                                            $("#" + item).parents("tr").after(rs);
                                                            break;
                                                    }
                                                }

                                            }


                                            if ($("[name=" + item + "]").length > 0) {
                                                $("[name=" + item + "]").val(entry[item]);

                                            }
                                        }
                                        catch (e) {
                                            alert(e);
                                        }
                                    }
                                    if (isread) {
                                        $(".cbRequirement").nextAll("input").attr("disabled", "disabled").parents("tr").addClass("disable");
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

            var isPreliminaryPersonnel = $.userIdentity({"url":"${pageContext.request.contextPath}","companyShow":false});

            $("#closebtn").click(function () {
                window.close();
            });
            if (QueryString.GetValue('id') != null) {

                $.postProjectReviewDetail("${pageContext.request.contextPath}", QueryString.GetValue('id'), true, isPreliminaryPersonnel);
                $.getSuggestInDept("${pageContext.request.contextPath}", QueryString.GetValue('id'));
                $(".cbRequirement").attr("disabled", "disabled");
            }
        })
    </script>
</head>

<body class="Flow">
<div id="dialogAttach" title="" style="display: none">
                                <p><table width="100%" id="tbupload"><thead>
                    <tr><td  colspan="5">
                    <input id="myuploadify" class="upload_button" type="button" value="浏览..." />
                    <div style="display:none" class="myissue"></div>
                    <input type="button" value="上传"  onclick="$('#myuploadify').uploadify('upload','*');">
                    <input type="button" value="取消"  onclick="$('#myuploadify').uploadify('cancel','*');">
                    </td></tr><tr><td colspan="5">&nbsp</td></tr><tr style="background-color:#f4f4f4;"><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan="2">操作</td></tr>
                    </thead><tbody></tbody></table></p>
                            </div>
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
                        <div class="red">*</div>
                        审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left: 20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left: 10px">不通过</td>

                </tr>

                <tr>

                    <td class="td_1">&nbsp;</td>

                    <td>
                        <div class="red">*</div>
                        意见<span class="fr" id="addAttachP"><a>添加附件(0)</a></span></td>

                </tr>

                <tr id="mysug">

                    <td class="td_1">&nbsp;</td>

                    <td>
                        <textarea name="suggestion2" rows="4" placeholder="请输入意见"></textarea></td>

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

                            <ul class="button clearfix">

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
                                项目计划申报表</h1>

                            <div class="mb10">
                                <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th class="disable" colspan="4" class="f1">
                                                <h5 class="fl">基本信息</h5>
                                            </th>
                                        </thead>
                                        <tr class="disable">
                                            <td class="lableTd t_r">年度</td>
                                            <td>
                                                <select name="year" class="input_large" disabled>
                                                    <option value="2015">2015</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2013">2013</option>
                                                </select></td>
                                            <td class="lableTd t_r">项目类别</td>
                                            <td>
                                                <select name="projectType" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="repair">大修</option>
                                                    <option value="remould">更新改造</option>
                                                    <option value="new">新建</option>
                                                    <option value="other">其它</option>
                                                </select></td>
                                        </tr>

                                        <tr class="disable">
                                            <td class="lableTd t_r">项目名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="projectName" disabled /></td>
                                            <td class="lableTd t_r">总投资估算</td>
                                            <td>
                                                <input type="text" class="input_small" name="totalInvestEstimate" disabled />&nbsp;&nbsp;万元</td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>

                                            <th colspan="4" class="disable">
                                                <h5 class="fl">项目属性</h5>
                                            </th>
                                        </thead>
                                        <tr class="disable">
                                            <td class="lableTd t_r">资金计划/一季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan1" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                            <td class="lableTd t_r">资金计划/二季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan2" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">资金计划/三季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan3" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                            <td class="lableTd t_r">资金计划/四季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan4" onkeyup="checknum(this);" onafterpaste="checknum(this);" disabled />&nbsp;&nbsp;万元</td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">项目概述</td>
                                            <td colspan="3">
                                                <textarea name="mainContent" rows="4" placeholder="请输入项目目标/实施范围/主要功能/技术性能指标" disabled></textarea></td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">年度推进目标</td>
                                            <td>
                                                <select name="yearTarget" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="">请选择</option>
                                                    <option value="planOK">完成前期策划</option>
                                                    <option value="purchaseOK">完成立项采购</option>
                                                    <option value="implementAllOK">完成项目实施（全部）</option>
                                                    <option value="implementPartOK">完成项目实施（部分）</option>
                                                    <option value="initalCheckOK">完成项目初验</option>
                                                    <option value="finalCheckOK">完成项目终验</option>
                                                </select>
                                            </td>
                                            <td class="lableTd t_r" id="yearTargetReasonTitle"></td>
                                            <td>
                                                <input id="yearTargetReason" style="display: none" type="text" class="input_large" name="yearTargetReason" disabled />
                                            </td>
                                        </tr>

                                        <tr class="disable">
                                            <td class="lableTd t_r">安全等级保护级别</td>
                                            <td colspan="3">
                                                <select name="securityLevel" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="level1">一级</option>
                                                    <option value="level2">二级</option>
                                                    <option value="level3">三级</option>
                                                </select></td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">信息化资源需求</td>
                                            <td colspan="3">
                                                <select id="resourceRequirement" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="networkResource">网络资源需求</option>
                                                    <option value="storageResource">存储资源需求</option>
                                                    <option value="dataResource">数据资源需求</option>
                                                    <option value="virtualServerNumber">虚拟服务器台数</option>

                                                </select>
                                                <input type="button" id="addRequirement" value="增加" disabled />
                                                <input type="button" id="delRequirement" value="删除" disabled />
                                            </td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">计划开工时间</td>
                                            <td>
                                                <input type="number" id="planStartYear" class="input_tiny" min="1990" max="2020" step="1" style="height: 23px" disabled>&nbsp;年&nbsp;<input type="number" id="planStartMon" class="input_tiny" min="0" max="12" step="1" style="height: 23px" disabled>&nbsp;月</td>
                                            <td class="lableTd t_r">计划完工时间</td>
                                            <td>
                                                <input type="number" id="planEndYear" class="input_tiny" min="1990" max="2020" step="1" style="height: 23px" disabled>&nbsp;年&nbsp;<input type="number" id="planEndYearMon" class="input_tiny" min="0" max="12" step="1" style="height: 23px" disabled>&nbsp;月</td>
                                        </tr>

                                        <tr class="disable">
                                            <td class="lableTd t_r">备注</td>
                                            <td colspan="3">
                                                <textarea name="remarks" rows="4" disabled></textarea></td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                                        <thead>
                                            <th colspan="4" class="disable">
                                                <h5 class="fl">申报信息</h5>
                                            </th>
                                        </thead>
                                        <tr class="disable">
                                            <td class="lableTd t_r">申报单位</td>
                                            <td>
                                                <input type="text" class="input_large" name="reportUnit" disabled /></td>
                                            <td class="lableTd t_r">申报人</td>
                                            <td>
                                                <input type="text" class="input_large" name="applyer" disabled/></td>
                                                <input type="text" class="input_large" id="applyerLoginname" disabled style="display: none" />
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">项目状态</td>
                                            <td>
                                                <select name="projectStatus" class="input_large" disabled>
                                                    <option value="">请选择</option>
                                                    <option value="inDept">部门内部申报</option>
                                                    <option value="toInfoDept">信息中心审核</option>
                                                    <option value="toStore">入储备库</option>
                                                    <option value="toReport">台账</option>

                                                </select>
                                            </td>
                                            <td class="lableTd t_r" id="TimeType">操作时间</td>
                                            <td>
                                                <input type="text" class="input_large" name="initiateTime" disabled /></td>
                                        </tr>
                                        <tr class="disable">
                                            <td class="lableTd t_r">当前审核人</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" name="handler" disabled />

                                            </td>
                                        </tr>

                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="leaderSuggest">
                                            <thead>
                                                <th>
                                                    <h5 class="fl">审批信息</h5>
                                                </th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                </form>
                            </div>
                            <div class="mb10 t_c" id="mybtn">
                                <input type="button" id="btnSubmit" value="审批" />
                                &nbsp;
            <input type="button" id="closebtn" value="关闭" />
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
