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
        	$.getMenu({"url":"${pageContext.request.contextPath}", "modName":"projectPlan"});
        	
         
        	
            var isleader = $.userIdentity({"url":"${pageContext.request.contextPath}"});
        	
        	if (isleader == 1) {
                $("#btnSubmit").val("审批");
                $("#btndel").val("取消");
                $("#btnsave").val("").css("display", "none");
                $(".ywbl").parent("li").boxOpen();
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
                            _str2 = "提交到主管部门经办人初审";
                            $("#closebtn").css("display", "none");
                            $("#btnSubmit2").val("提交审核");
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
        	}
        	
        	$("#addRequirement").click(function () {
                var _require = $("#resourceRequirement option:selected");
                var cbRequirement = $(".cbRequirement");

                for (var i = 0; i < cbRequirement.length; i++) {
                    if ($(cbRequirement[i]).next("div").text() == _require.val()) {

                        alert("重复资源需求")
                        return false
                    }
                }
                
                if (_require.val() != "") {
                    var rs = "<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">" + _require.val() + "</div>";
                    
                    switch (_require.val()) {
                        case "networkResource":
                              rs += "<input  type=\"text\" class=\"input_large\" style=\"width:500px;margin-right:15px\" placeholder=\"请描述该项目针对网络方面需要提供的资源需求，并说明用户范围。\"/>" + _require.text() + "</td></tr>";
                            break;
                        case "dataResource":
                             rs += "<input  type=\"text\" class=\"input_large\" style=\"width:500px;margin-right:15px\" placeholder=\"请描述该项目针对数据中心方面需要提供的资源需求。\"/>" + _require.text() + "</td></tr>";
                            break;
                        case "storageResource":
                            rs += "<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\">（G） <input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\"/>" + _require.text() + "</td></tr>";
                            break;
                        case "virtualServerNumber":
                             rs += "<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\">（台）<input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\"/>" + _require.text() + "</td></tr>";            
                            break;
                    }

                    $(this).parents("tr").after(rs);
                }
            });
        	
        	$("[name=yearTarget]").change(function () {
                if ($("[name=yearTarget] option:selected").val() == "implementPartOK") {
                    $("#yearTargetReason").css("display", "block");
                    $("#yearTargetReasonTitle").text("年度推进目标理由").addClass("lableTd t_r");
                }
                else {
                    $("#yearTargetReason").css("display", "none");
                    $("#yearTargetReasonTitle").text("").removeClass("lableTd t_r");
                }
            });
        	
        	 $("#delRequirement").click(function () {
                 var cbRequirement = $(".cbRequirement:checked");

                 for (var i = 0; i < cbRequirement.length; i++) {
                     $(cbRequirement[i]).parents("tr").remove();
                 }
             });
        	 
        	 $("#btnSubmit,#btnsave").click(function () {
        		 var btnStr=$(this).val().replace(/\s+/g, "");
        		 if (btnStr == "审批") {
                     $("#bt").height($(document).height());
                     $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
                     $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
                     $(".f_window").css("display", "block");
                     $("#bt").css("display", "block");
                 }
        		  else if (btnStr== "提交"||btnStr== "保存草稿") {
                   $("#dialog-confirm P").text("是否"+$(this).val().replace(/\s+/g, ""));

                    $("#dialog-confirm").dialog({
                     resizable: false,
                     height: 140,
                     width: 200,
                     modal: true,
                     buttons: {
                         "确认": function () {
                             var _od = "";
  
                             if ($("#initiateTime") != "" || initiateTime != null) {
                                 var d = new Date();
                                 _od += "&initiateTime=" + d.getTime();
                                 _od += "&applyTime=" + d.getTime();
                             }

                             if ($("#myhandlerLoginname").text().trim() == null) {
                                 alert("错误");
                                 return false;
                             }

                             _od += "&handler=" + $("#myhandlerLoginname option:selected").text();
                             _od += "&handlerLoginname=" + $("#myhandlerLoginname option:selected").val();
                             _od += "&initiator=" + $("[name=applyer]").val();
                             _od += "&initiatorLoginname=" + $("[name=applyerLoginname]").val();
                             _od += "&projectStatus=" + $("[name=projectStatus]").val();

                             var otherData = $.getOtherData();
                             if (QueryString.GetValue('id') != null) {
                                 otherData += "&id=" + QueryString.GetValue('id');
                             }
  
                             var _yanz = $.yanzhen();

                             if (_yanz != "") {
                                 alert(_yanz + "\r\n请您修改");
                                 $(this).dialog("close");
                                 return false;
                             }

                             if (btnStr == "提交")
                            	 otherData += "&status=waitForAudit";        
                             else
                            	 otherData += "&status=draft";

                          $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":true,"modname":"projectPlan","otherData":otherData + _od + "&suggestion="});
                          
                          window.opener=null;
                          window.close();
                          
                          $(this).dialog("close");
                         },
                         "取消": function () {
                             $(this).dialog("close");
                         }
                      }
                 });
        	   }
        	 });
        	 
        	 if (QueryString.GetValue('id') != null) {
        		 $.getSuggestInDept("${pageContext.request.contextPath}", QueryString.GetValue('id'));
                 $.postDetail("${pageContext.request.contextPath}", QueryString.GetValue('id'), false, isleader);

                 $("#btndel").click(function () {
                     $("#dialog-confirm").dialog({
                         resizable: false,
                         height: 140,
                         width: 200,
                         modal: true,
                         buttons: {
                             "确认": function () {
                                 $.postDele({"url":"${pageContext.request.contextPath}","modname":"projectPlan","isClose":true,"id": QueryString.GetValue('id')});
                                 $(this).dialog("close");
                           	      window.opener=null;
							      window.close();
                             },
                             "取消": function () {
                                 $(this).dialog("close");
                             }
                         }
                     });
                 });
             }
             else {
                 $("[name=year]").val("2015");
                 $("#btndel").val("关闭");
                 $("#btndel").click(function () {
                	 window.opener = null; 
                     window.close();
                 });
             }
        });
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

            &nbsp;

            <input type="button" id="closebtn" value="取消申报" style="display: none" />

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
                                项目计划申报表</h1>

                            <div class="mb10">
                                <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">基本信息</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>
                                                年度</td>
                                            <td>
                                                <select name="year" class="input_large">
                                                </select>
                                            </td>
                                            <td class="lableTd t_r">项目类别</td>
                                            <td>
                                                <select name="projectType" class="input_large">
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>
                                                项目名称</td>
                                            <td>
                                                <input type="text" class="input_large" name="projectName" maxlength="50" /></td>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>
                                                总投资估算</td>
                                            <td>
                                                <input type="text" class="input_small" name="totalInvestEstimate" onkeyup="checknum(this);" onafterpaste="checknum(this);" maxlength="9"/>&nbsp;&nbsp;万元</td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">项目属性</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">资金计划/一季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan1" onkeyup="checknum(this);" onafterpaste="checknum(this);" maxlength="8"/>&nbsp;&nbsp;万元</td>
                                            <td class="lableTd t_r">资金计划/二季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan2" onkeyup="checknum(this);" onafterpaste="checknum(this);" maxlength="7"/>&nbsp;&nbsp;万元</td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">资金计划/三季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan3" onkeyup="checknum(this);" onafterpaste="checknum(this);" maxlength="7"/>&nbsp;&nbsp;万元</td>
                                            <td class="lableTd t_r">资金计划/四季</td>
                                            <td>
                                                <input type="text" class="input_small" name="fundPlan4" onkeyup="checknum(this);" onafterpaste="checknum(this);" maxlength="7"/>&nbsp;&nbsp;万元</td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>项目概述</td>
                                            <td colspan="3">
                                                <textarea name="mainContent" rows="4" placeholder="请输入项目目标,实施范围,主要功能,技术性能指标（字数最少不少于50字，最多不超过500字）" maxlength="500"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">年度推进目标</td>
                                            <td>
                                                <select name="yearTarget">
                                                </select>
                                            </td>

                                            <td id="yearTargetReasonTitle"></td>
                                            <td>
                                                <input type="text" class="input_large" name="yearTargetReason" id="yearTargetReason" style="display: none" />
                                            </td>

                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>安全等级保护级别</td>
                                            <td colspan="3">
                                                <select name="securityLevel" class="input_large">
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">信息化资源需求</td>
                                            <td colspan="3">
                                                <select id="resourceRequirement" name="myresourceRequirement" class="input_large">
                                                </select>
                                                <input type="button" id="addRequirement" value="增加" />
                                                <input type="button" id="delRequirement" value="删除" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>计划开工时间</td>
                                            <td>
                                                <input type="text" id="planStartYear" maxlength="4" class="input_tiny"  style="height: 23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;年&nbsp;<input type="text" id="planStartMon" class="input_tiny" style="height: 23px" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="2" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;月</td>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>计划完工时间</td>
                                            <td>
                                                <input type="text" id="planEndYear" maxlength="4" class="input_tiny" style="height: 23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">&nbsp;年&nbsp;<input type="text" id="planEndYearMon" class="input_tiny"style="height: 23px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="2" >&nbsp;月</td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">备注</td>
                                            <td colspan="3">
                                                <textarea name="remarks" rows="4" placeholder="（字数最多不超过500字）" maxlength="500"></textarea></td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                                        <thead>
                                            <th colspan="4">
                                                <h5 class="fl">申报信息</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">申报单位</td>
                                            <td>
                                                <input type="text" class="input_large" name="reportUnit" readonly /><input type="text" class="input_large" name="reportUnitId" readonly style="display: none" /></td>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>申报人</td>
                                            <td>
                                                <input type="text" class="input_large" name="applyer" readonly /><input type="text" class="input_large" id="applyerLoginname" name="applyerLoginname" readonly style="display: none" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">项目状态</td>
                                            <td>
                                                <select name="projectStatus" class="input_large" disabled>
                                                    <option value="inDept">部门内部申报</option>
                                                </select>
                                            </td>
                                            <td class="lableTd t_r">操作时间</td>
                                            <td>
                                                <input type="text" class="input_large" id="initiateTime" readonly /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">
                                                <div class="red">*</div>审核领导</td>
                                            <td colspan="3">
                                                <select id="myhandlerLoginname" class="input_large">
                                                    <option value="">请选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
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
                            <div class="mb10 t_c">
                                <input type="button" id="btnSubmit" value="提 交" />
                                &nbsp;
                                <input type="button" id="btndel" value="删 除" />
                                &nbsp;
                                <input type="button" id="btnsave" value="保存草稿" />
                                &nbsp;
                            </div>
                            <div class="footer"></div>
                            <div id="dialog-confirm" title="" style="display: none">
                                <p>是否删除</p>
                            </div>
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
