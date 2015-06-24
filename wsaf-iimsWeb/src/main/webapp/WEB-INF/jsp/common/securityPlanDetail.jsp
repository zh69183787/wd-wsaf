<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计划申报审批预审信息</title>
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
<script src="js/f.securityPlan.js"></script>

<script type="text/javascript">
	$(function() {
		$.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityPlanDetail" });

		if(QueryString.GetValue('id')!=null)
		{
			$.postSecurityPlanDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'));
			 var otherdata = "modelName=securityPlanDetail&modelId=" + QueryString.GetValue('id') + "&groupName=securityPlanData";
			
			 var info = $.getFile({"url":"${pageContext.request.contextPath}", "otherdata":otherdata});

             $(".upload table tbody").append(info);

			 $("#btndel2").click(function(){
				window.close();
			 });
			
			$("#myuploadify").uploadify({
                'auto': false,
                'method': "post",
                'height': 20,
                'width': 100,
                'swf': 'js/uploadify.swf',
                'uploader': '<%=basePath%>attach/api/upload?groupName=securityPlanData' ,
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
			

			$("#btnSubmit").click(function(){
				  var d = new Date(), mystate = "";
				  
				  var _attachIds = $(".upload table tbody tr"), attachIds = "";
	                for (var i = 0; i < _attachIds.length; i++) {
	                    attachIds += $(_attachIds[i]).attr("name") + ",";
	                }

	                attachIds = attachIds.substring(0, attachIds.length - 1);
	                
	                var otherData = "id="+QueryString.GetValue('id');
	   	         
	                if($("[name=finished]").val()!="1")
	                	otherData+="&finished=1&completeTime="+ d.getTime(); 

	                $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","modname":"securityPlanDetail","otherData":otherData,"isClose":false,"attachIds":attachIds,"isUploadFile":true});
	                
	                $(this).attr("disabled", true);
	                
	                $.ajax({
                        url:"${pageContext.request.contextPath}/basicCrud/securityPlanDetail/all?finished=0&planId="+$("[name=planId]").val(),
                        type: 'post',
                        success: function (data, status, xhr) {

                            if (status == "success" && data != null) {
                                if (data.success == true ) {
                                    if(data.result.length<=0)
                                    $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","modname":"securityPlan","otherData":"id="+$("[name=planId]").val()+"&businessStatus=finish","isClose":true});

                                    $(this).attr("disabled", false);
                                }
                            }
                        },
                        error: function () {
                            hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                        }
                    });
			});
			
		}

		$("#btndel").click(function(){
			window.close();
		});
		
	})
	

	</script>
</head>

<body class="Flow">

 <div id="bt" class="transparent" style="display:none"></div>

    <div class="f_window" style="display:none">

   	  <h3 class="clearfix mb10"><span class="fl">业务办理</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="con">

        	<table width="100%" border="0" cellspacing="0" cellpadding="0">

              <tr>

                <td class="td_1" colspan="2">业务栏</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td ><div class="red"> *</div>审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><div class="red"> *</div>意见</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><textarea  name="suggestion" rows="4" placeholder="请输入意见" ></textarea></td>

              </tr>

              <tr>

                <td class="td_1" colspan="2">操作栏</td>

              
              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><textarea   rows="2" id="nextDo" disabled></textarea></td>

              </tr>

              
            </table>

      </div>

      <div class="button t_c">

        	<input type="button" id="btnSubmit2" value="提交审核" />

&nbsp;

<input type="button" id="closebtn" value="取消申报" style="display:none"/>

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

						<ul class="button clearfix" style="filter:Gray">

                        	<li class="disable"><a  class="ywbl">业务办理</a></li>

                        	<li class="disable"><a class="print">打印</a></li>

                        	<li class="disable"><a  class="jk">业务监控</a></li>

                        	<li class="disable"><a class="tips">小提示</a></li>

                        	<li class="disable"><a class="imp">公文导入</a></li>

                        	<li class="disable"><a  class="exp">公文导出</a></li>

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

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>计划申报审批预审信息</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead><th colspan="4" class="f1"> <h5 class="fl">基本信息</h5></th></thead>
                <tr>
                  <td class="lableTd t_r" >计划类型</td>
                  <td ><select name="planType" class="input_large" maxlength="30" disabled="disabled"></select></td>
                   <td class="lableTd t_r" >业务层级</td>
                  <td ><select name="businessLevel" class="input_large" maxlength="30" disabled="disabled"></select></td>
                 
                </tr>
                
                    
                  <tr>
                  <td class="lableTd t_r" >项目名称</td>
                  <td >   <input name="projectName" type="text" class="input_large" maxlength="30" readonly="readonly"/></td>
                  <td class="lableTd t_r" >项目编号</td>
                  <td ><input name="projectNum" type="text" class="input_large" maxlength="30" readonly="readonly"/></td>
               
                  </td>
                 </tr>  
                  <tr class="Tohide">
                  <td class="lableTd t_r" >系统名称</td>
                  <td><input name="systemName" type="text" class="input_large" readonly="readonly" /></td>
                  <td class="lableTd t_r" >系统等级</td>
                  <td><select name="systemLevel" type="text" class="input_large" disabled="disabled"></select></td>
                 </tr>
                  
                      <tr>
                  <td class="lableTd t_r" >主要内容</td>
                  <td colspan="3">    <textarea rows="2" name="mainContent" maxlength="200" readonly="readonly"></textarea></td>
                  </td>
                 </tr>   
                     <tr>
                  <td class="lableTd t_r" >实施方</td>
                  <td colspan="3">     <select name="implement" class="input_small" disabled="disabled"></select></td>
                  </td>
                 </tr>  
                       <tr>
                  <td class="lableTd t_r" >计划开始时间</td>
                  <td >     <input name="planStartTime" type="text" class="input_small" maxlength="10" readonly="readonly"></td>
                  </td>
                   <td class="lableTd t_r" >计划结束时间</td>
                  <td >    <input name="planEndTime" type="text" class="input_small" maxlength="10" readonly="readonly"></td>
                  </td>
                 </tr>
                 
                    <tr>
                  <td class="lableTd t_r" >费用(元)</td>
                  <td >     <input name="cost" type="text" class="input_small" maxlength="10" readonly="readonly"></td>
                  </td>
                   <td class="lableTd t_r" >目标计划</td>
                  <td >     <input name="targetPlan" type="text" class="input_large" maxlength="30" readonly="readonly">
                  <input name="finished" type="text" class="input_large" maxlength="30" style="display:none">
                   <input name="planId" type="text" class="input_large" maxlength="30" style="display:none">
                  </td>
                  </td>
                 </tr>
                        <tr>
                  <td class="lableTd t_r" >备注</td>
                  <td colspan="3">    
                            <textarea rows="2" name="remarks" readonly="readonly"></textarea></td>
                  </td>
                 </tr> 
                    <tr class="upload">
                    <td class="lableTd t_r">附件</td>
                    <td colspan="3">
                    <table width="100%" id="tbupload"><thead>
                    <tr><td  colspan="5">
                    <input id="myuploadify" class="upload_button" type="button" value="浏览..." />
                    <div style="display:none" class="myissue"></div>
                    <input type="button" value="上传"  onclick="$('#myuploadify').uploadify('upload','*');">
                    <input type="button" value="取消"  onclick="$('#myuploadify').uploadify('cancel','*');">
                    </td></tr><tr><td>文件名</td> <td>大小(kb)</td><td>上传时间</td><td colspan="2">操作</td></tr>
                    </thead><tbody></tbody></table></td></tr>        
              </table>
             
              </form>
            </div>
            <div class="mb10 t_c">
              <input type="button" id="btnSubmit" value="保 存" />
              &nbsp;
              <input type="button" id="btndel" value="取 消" />
              &nbsp;
       
            <div class="footer"></div>
            
                </div>
                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>
