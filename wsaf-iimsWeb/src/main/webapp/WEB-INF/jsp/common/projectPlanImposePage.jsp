<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--<base href="">--> <base href="<%=basePath%>">
    
    <title>项目计划申报</title>
    <meta charset="utf-8">
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
<script src="js/wd.public.simpleflow.js"></script>
<script src="js/jquery.ui.autocomplete.js"></script>

	
	
<script type="text/javascript">

	$(function() {
		$( "input[type=date]" ).datepicker({ dateFormat:"yy-mm-dd"});
		$( ".idate" ).datepicker({ dateFormat:"yy-mm-dd"});
		
    	$("#projectPlanTargetInfos").load("${pageContext.request.contextPath}/projectPlanTarget/incEdit?id=${ppt.id}&isEdit=false&isShowBut=false&nt="+new Date().getTime());

		//$(".Flow").load("${pageContext.request.contextPath}/index.jsp");
		//$.openLoading();
/* 		$("#Login").autocomplete({
    source: "${pageContext.request.contextPath}/projectPlan/completeData"
    , select: function(e, ui) {
      alert(ui.item.value) 
    }
    
    
}); */
		
		
		

		
		/* $("#Login").autocomplete("${pageContext.request.contextPath}/projectPlan/completeData", {
			formatItem: function(row, i,max) {
			var obj =eval("(" + row + ")"); //转换成js对象
			return obj.Text;
			},
			formatResult: function(row) {
			var obj =eval("(" + row + ")"); //转换成js对象
			return obj.Text;
			}
			}).result(function(event, item) {
			var obj = eval("(" +item + ")"); //转换成js对象
			//$("#link").attr(“href”,obj.url);
			}); */
	});
	function saveFormFrist(flag,flowFormId){
		var gosave =true;
		var DATE_FORMAT = /^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$/;
		$(".v_data").each(function(i,n){
			var val = $(n).val();
			if(val!=''){
				 if(DATE_FORMAT.test(val)){
				  		//alert("您输入的日期格式正确");
				  } else {
				   		alert("抱歉，您输入的日期格式有误，正确格式应为2015-01-01.");
				   		$(n).focus();
				   		gosave = false;
				   		return false;
				  }
			}
		});
		
	/* 	function checkDate(){
		 var birthday = document.getElementById("birthday").value;
		 if(DATE_FORMAT.test(birthday)){
		   alert("您输入的日期格式正确");
		  } else {
		   alert("抱歉，您输入的日期格式有误，正确格式应为2015-01-01.");
		  }
		  } */
	
		//$.postsave("${pageContext.request.contextPath}","projectPlanImposeForm","");
		
		//alert($("#projectPlanImposeForm").serialize());
		if(gosave){
		$.openLoading();
		 $.ajax({
			    url :"${pageContext.request.contextPath}/projectplanimposed/saveFirst",
				type : 'post',
				data:$("#projectPlanImposeForm").serialize(),
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{
						if  (data.success == true) 
						{
							if(flag==0){ //提交审核
								$.ajaxSaveFirstStartFlow("${pageContext.request.contextPath}",flowFormId);
							}else{
								alert("保存成功");
								$.closeLoading();
							}
							//location.href = Url+"/targetVersion/targetPlanList";
						}
						else
						{
						alert("保存失败");
						$.closeLoading();
						}
					}
					else
						{
						alert("保存失败");
						$.closeLoading();
						}
					
					},
					dataType : 'json'
				});
		}
	}
	
	function checknum(obj)
{   if(/^\d+\.?\d{0,2}$/.test(obj.value)){
       obj.value = obj.value;
    }else
    {
   obj.value = obj.value.substring(0,obj.value.length-1);
}
   
}
	
	
	
	
	$(document).ready(function (){
		//firUrl,objId,simpleClassName,type
		var projectPlanImposeId = $("#projectPlanImposeId").val();
		$.ajaxLoadFlowLogs("${pageContext.request.contextPath}",projectPlanImposeId,"ProjectPlanImposed","simple");
		
		$(window).scroll(function() {
			//alert(0);
			var h = $(document).scrollTop()+212;
			$('#dealFormDiv').css("top",h+"px");
		});
		
		
	});
	
	function saveFormSubmitFlow(flowFormId,flag){
		
		if(flag==0&&confirm("确定保存并提交审核?")){
			
			var gosave =true;
			$(".v_data").each(function(i,n){
				var val = $(n).val();
				if(val==''){
					alert("抱歉，必填项不能为空.");
					$(n).focus();
					gosave = false;
					return false;
				}
			});
			if(gosave){
				saveFormFrist(flag,flowFormId);
			}
		}else if(flag==1&&confirm("确定保存?")){
			var cansave =true;
			if($("#dealFlowWindowForm [name='suggestion']").length>0){
				if($("#dealFlowWindowForm [name='suggestion']").eq(0).val()==''){
					alert("请填写审核意见！");
					$("#dealFlowWindowForm [name='suggestion']").eq(0).focus();
					cansave =false;
				}
			}
			if(cansave){
				$.ajaxSaveFirstStartFlow("${pageContext.request.contextPath}",flowFormId);
			}
		}else if(flag==2&&confirm("确定保存草稿?")){
			saveFormFrist();
		}
		//$.ajaxSaveFirstStartFlow("${pageContext.request.contextPath}",formid);
	}
	
	
	
	
	</script>
</head>

<body class="Flow">

<input type="hidden" name="loginname" id="loginname" value="${loginname }" /> 
<div id="bt" class="transparent" style=""></div>

    <div class="f_window" style="display: none;z-index: 8888;">
	
   	  <h3 class="clearfix mb10 "><span class="fl">业务办理</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="con">
<form id="dealFlowWindowForm" action="">
<div style="display: none;" class="hid_data"></div>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td class="td_1" colspan="2">业务栏</td>
              </tr>
            <!-- <tr>
                <td class="td_1">&nbsp;</td>
                <td><div class="red"> *</div>审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>
              </tr>
			   -->
              <tr>
                <td class="td_1">&nbsp;</td>
                <td><div class="red"> *</div>处理意见</td>
              </tr>
              <tr>
                <td class="td_1">&nbsp;</td>
                <td>
                	<textarea  name="suggestion" rows="4" placeholder="请输入意见"></textarea>
                </td>
              </tr>
              </tbody>
               <tbody id="dealFlowWindowFormSelect">
               </tbody>
              <tfoot>
              <tr class="nextDoText">
                <td class="td_1" colspan="2">操作栏</td>
              </tr>
              <tr class="nextDoText">
                <td class="td_1">&nbsp;</td>
                <td><textarea rows="2" class="nextDoTextTextarea" disabled=""></textarea></td>
              </tr>
              </tfoot>
            </table>
</form>
      </div>

      <div class="button t_c">

        	<input type="button" id="btnSubmitSimpleFlow" onclick="saveFormSubmitFlow('dealFlowWindowForm',1);" value="提交">

&nbsp;

<input type="button" id="closebtn" class="closewindow" value="关闭" >

      </div>

    </div>

    <!--Transparent End-->
	<div class="f_bg">

      <!--Panel_6-->	

        <div class="Divab1" style="" id="dealFormDiv">

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

                        	<li class="disable ywbl"><a class="ywbl">业务办理</a></li>

                        	<!-- <li class="disable"><a class="print">打印</a></li> -->

                        	<!-- <li class="disable"><a class="jk">业务监控</a></li>

                        	<li class="disable"><a class="tips">小提示</a></li>

                        	<li class="disable"><a class="imp">公文导入</a></li>

                        	<li class="disable"><a class="exp">公文导出</a></li> -->

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
                       	    实施计划申报表</h1>

                             <div class="mb10">
            
              
               <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <tr><th class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </tr>
                </thead>
                <tbody>
            
             
                <tr>
                  <td id="projectPlanTargetInfos"> </td>
                </tr>
				
              </tbody></table>
              
              
              
              
              <form id="projectPlanImposeForm" modelAttribute="projectPlanImpose" >
              <input type="hidden" class="input_large"  name="projectTargetId" value="${ppt.id}">
              <input type="hidden" class="input_large" name="id" value="${ppi.id}" id="projectPlanImposeId" />
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <tr><th colspan="4"><h5 class="fl">项目推进计划</h5> <input type="hidden" style="float:right" id="btnSubmit" value="添 加"></th>
                    </tr></thead>
                       <tbody>
					     <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>目标及效果</td>
		                  <td class="t_r"><input type="text" class="input_large idate  v_data" ${isdisabled} name="targetAndEffectStart" value="${ppi.targetAndEffectStart}"></td>
		                  <td class="lableTd t_c"> 至</td>
		                  <td class="t_l"><input type="text" class="input_large idate v_data" ${isdisabled} name="targetAndEffectEnd" value="${ppi.targetAndEffectEnd}"></td>
		                </tr>
		                
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>需求及功能</td>
		                  <td class="t_r"><input type="text" class="input_large idate v_data" ${isdisabled} name="demandAndFunctionStart" value="${ppi.demandAndFunctionStart}"></td>
		                  <td class="lableTd t_c"> 至</td>
		                  <td class="t_l"><input type="text" class="input_large idate v_data" ${isdisabled} name="demandAndFunctionEnd" value="${ppi.demandAndFunctionEnd}"></td>
		                </tr>
		                
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>技术方案</td>
		                  <td class="t_r"><input type="text" class="input_large idate v_data" ${isdisabled} name="schemeProposalStart" value="${ppi.schemeProposalStart}"></td>
		                  <td class="lableTd t_c"> 至</td>
		                  <td class="t_l"><input type="text" class="input_large idate v_data" ${isdisabled} name="schemeProposalEnd" value="${ppi.schemeProposalEnd}"></td>
		                </tr>
		                
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>立项审价</td>
		                  <td class="t_r"><input type="text" class="input_large idate v_data" ${isdisabled} name="designatedShenjiaStart" value="${ppi.designatedShenjiaStart}"></td>
		                  <td class="lableTd t_c"> 至</td>
		                  <td class="t_l"><input type="text" class="input_large idate v_data" ${isdisabled} name="designatedShenjiaEnd" value="${ppi.designatedShenjiaEnd}"></td>
		                </tr>
		                
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>采购技术文件</td>
		                  <td class="t_r"><input type="text" class="input_large idate v_data" ${isdisabled} name="purchaseTechnologyFileStart" value="${ppi.purchaseTechnologyFileStart}"></td>
		                  <td class="lableTd t_c"> 至</td>
		                  <td class="t_l"><input type="text" class="input_large idate v_data" ${isdisabled} name="purchaseTechnologyFileEnd" value="${ppi.purchaseTechnologyFileEnd}"></td>
		                </tr>
		                
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>采购</td>
		                  <td class="t_r"><input type="text" class="input_large idate v_data" ${isdisabled} name="purchaseStart" value="${ppi.purchaseStart}"></td>
		                  <td class="lableTd t_c"> 至</td>
		                  <td class="t_l"><input type="text" class="input_large idate v_data" ${isdisabled} name="purchaseEnd" value="${ppi.purchaseEnd}"></td>
		                </tr>
		                
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>项目开工时间</td>
		                  <td class="t_l" colspan="3"><input type="text" class="input_large idate v_data" ${isdisabled} name="projectStart" value="${ppi.projectStart}"></td>
		                </tr>
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>实施方案开始时间</td>
		                  <td class="t_l" colspan="3"><input type="text" class="input_large idate v_data" ${isdisabled} name="implementationPlanStart" value="${ppi.implementationPlanStart}"></td>
		                </tr>
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>项目初验时间</td>
		                  <td class="t_l" colspan="3"><input type="text" class="input_large idate v_data" ${isdisabled} name="projectFirstCheck" value="${ppi.projectFirstCheck}"></td>
		                </tr>
		                <tr>
		                  <td class="lableTd t_r"><div class="red">*</div>项目终验时间</td>
		                  <td class="t_l" colspan="3">
		                  
		                  
		                  <input type="text" class="input_large idate v_data" ${isdisabled} name="projectFinalCheck" value="${ppi.projectFinalCheck}"></td>
		                </tr>
		                
              </tbody></table>
              </form>
              <form id="dealFlowForm">
              <table  id="simpleFlowMainInfo" width="100%" cellspacing="0" cellpadding="0" border="0"  class="table_2">
                <thead>
                <tr><th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </tr></thead>
                <tbody ><tr class="disable">
                  <td class="lableTd t_r">申报单位</td>
                  <td><input type="text" disabled="disabled" value="${main.startDept }"  name="main.startDept" class="input_large"/></td>
                  <td class="lableTd t_r">申报人</td>
                  <td><input type="text" disabled="disabled" value="${main.startUser}" name="main.startUser" id="main_startUser" class="input_large" />
                  <input type="hidden" disabled="disabled" value="${main.startUserLoginname}" name="main.startUserLoginname" id="main_startUserLoginname"  />
                  </td>
                </tr>
                <tr class="disable">
                  <td class="lableTd t_r">当前状态</td>
                  <td>
                  <input type="text" disabled="disabled" value="${main.statusDetail }" name="main.statusDetail" class="input_large">
                   
                  </td>
                  <td id="TimeType" class="lableTd t_r">操作时间</td>
                  <td><input type="text" disabled="disabled" name="main.initiateTime" value="${main.initiateTime }"  class="input_large"></td>
                </tr>
                 <tr class="disable main_nowLog_dealUser"  >
                  <td class="lableTd t_r">当前处理人</td>
                  <td colspan="3">
                  <input type="text" disabled="disabled" value="${main.nowLog.dealUser }" name="main.nowLog.dealUser" class="input_large"/>
                  <input type="hidden" disabled="disabled" value="${main.nowLog.dealUserLoginname }" name="main.nowLog.dealUserLoginname" id="main_dealUserLoginname" />
                  </td>
                </tr>
              </tbody>
              <tfoot  id="simpleFlowNextDeal">
              </tfoot>
              </table>
              </form>
				<table  id="simpleFlowMainInfoLogs" width="100%" cellspacing="0" cellpadding="0" border="0" class="table_2">
					<thead>
						<tr>
							<th>
								<h5 class="fl">审批信息</h5>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="simpleFlowLogs" >
							</td>
						</tr>
					</tbody>
				</table>
              
            </div>
            <div class="mb10 t_c">
            
            <c:if test="${isedit=='1'}">
            	<input type="button" onclick="saveFormSubmitFlow('',2)" value="保存草稿" />
            	<input id="saveFormSubmitWithFlow" type="button" onclick="saveFormSubmitFlow('dealFlowForm',0)" value="提交审批" style="display: none;" />
            </c:if>
              
              &nbsp;
              <input type="button" id="btndel2" value="关闭">

              &nbsp; </div>
            <div class="footer"></div>
            <div id="dialog-confirm" title="" style="display:none">
                 <p>是否删除</p>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>



</div></body></html>