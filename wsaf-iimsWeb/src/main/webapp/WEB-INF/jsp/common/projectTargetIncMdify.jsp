<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="projectPlanTarget_From" action="${pageContext.request.contextPath}/basicCrud/projectPlanTarget/save"> 
<input name="id"   type="hidden" value="${ppt.id}"/>
<input name="projectPlanID" class="projectPlanID"  type="hidden" value="${ppt.projectPlanID}" />
<table width="100%" >
<tbody id="tbody_modify">

<tr>
		<td class="lableTd t_r">项目申报计划：</td>
		<td colspan="3" class="projectPlanTarget_From_link">
			<input ${isDisabled} name="projectNameNoUse" id="projectNameNoUse"  type="TEXT" value="${pp.projectName}" style="width: 60%"/>
			<a class="ps_link"  href="javascript:void(0);" target="_blank" > [查看详情] </a> 
		</td>
	</tr>
	<tr>
		<td class="lableTd t_r">项目名称：</td>
		<td ><input ${isDisabled} name="projectName" type="text" class=" changeinput projectName" value="${ppt.projectName}" cvalue="${pp.projectName}" maxlength="30"  style="width:100%"/></td>
	<td class="lableTd t_r">年度：</td>
		<td ><input ${isDisabled} name="year" type="text" class=" changeinput " value="${ppt.year}" cvalue="${pp.year}" maxlength="30"  style="width:30%"/></td>
	
	</tr>
	<tr>
		<td class="lableTd t_r">项目类别：</td>
		<td><input ${isDisabled} name="projectType" type="text" value="${ppt.projectType}" cvalue="${pp.projectType}"  class="input_large changeinput changeinput" maxlength="30"></td>
		<td class="lableTd t_r">业务层级：</td>
		<td><input ${isDisabled} name="businessLevel" type="text" class="input_large changeinput" value="${ppt.businessLevel}" cvalue="${pp.businessLevel}" maxlength="30"/></td>
	</tr>
	<tr>
		<td class="lableTd t_r">项目编号：</td>
		<td><input ${isDisabled} name="projectNum" type="text" class="input_large changeinput"  value="${ppt.projectNum}" cvalue="${pp.projectNum}" maxlength="30"></td>
		<td class="lableTd t_r">启动时间：</td> 	
		<td><input ${isDisabled} readonly="readonly" name="startTime" type="text" class="input_small .idate" maxlength="10"  value="${ppt.startTime}" cvalue="${pp.startTime}" /></td>
	</tr>
	<tr>
		<td class="lableTd t_r">项目描述：</td>
		<td colspan="3">
		<textarea row="3" class="textarea_show" name="mainContent" maxlength="200" ${isDisabled}>${ppt.mainContent}</textarea>
		<textarea row="3" class="textarea_hidden"  style="display: none" name="mainContent" maxlength="200" ${isDisabled}>${pp.mainContent}</textarea>
		</td>
	</tr>
	<tr>
		<td class="lableTd t_r">实施内容：</td>
		<td colspan="3">
		<textarea row="3" class="textarea_show"  name="implementContent" maxlength="200" ${isDisabled} >${ppt.implementContent}</textarea></td>
	    <textarea row="3" class="textarea_hidden" style="display: none"  name="implementContent" maxlength="200" ${isDisabled} >${pp.implementContent}</textarea></td>
	</tr>
	<tr>
		<td class="lableTd t_r">项目目标：</td>
		<td><input ${isDisabled} name="targetPlan" type="text" class="input_large changeinput" maxlength="30" value="${ppt.targetPlan}" cvalue=""></td>
		<td class="lableTd t_r">建设周期：</td>
		<td><input ${isDisabled} name="buildcycle" type="text" class="input_small" maxlength="10" value="${ppt.buildcycle}" cvalue="${pp.buildcycle}"/></td>
	</tr>
	<tr>
		<td class="lableTd t_r">投资估算：</td>
		<td><input ${isDisabled} name="totalInvestEstimate" type="text" class="input_small" maxlength="10" value="${ppt.totalInvestEstimate}" cvalue="${pp.totalInvestEstimate}"></td>
		<td class="lableTd t_r">资金计划：</td>
		<td><input ${isDisabled} name="fundPlanAll" type="text" class="input_large changeinput" maxlength="30" value="${ppt.fundPlanAll}" cvalue="${pp.fundPlanAll}"></td>
	</tr>
	<tr>
		<td class="lableTd t_r">实施主体：</td>
		<td><input ${isDisabled} name="suggestImplementDept" type="text" class="input_large changeinput" maxlength="30" value="${ppt.suggestImplementDept}" cvalue="${pp.suggestImplementDept}"></td>
		<td class="lableTd t_r">建议费用性质：</td>
		<td><input ${isDisabled} name="suggestCostProperty" type="text" class="input_large changeinput" maxlength="30" value="${ppt.suggestCostProperty}" cvalue="${pp.suggestCostProperty}"></td>
	</tr>
	<tr>
		<td class="lableTd t_r">申报单位：</td>
		<td><input ${isDisabled} name="reportUnit" type="text" class="input_large changeinput" maxlength="30" value="${ppt.reportUnit}" cvalue="${pp.reportUnit}" />
		<input name="reportUnitId" type="hidden" class="input_large changeinput" maxlength="30" value="${ppt.reportUnitId}" cvalue="${pp.reportUnitId}" />
		</td>
		<td class="lableTd t_r">分管领导：</td>
		<td><input ${isDisabled} name="chargeLeader" type="text" class="input_large changeinput" maxlength="30" value="${ppt.chargeLeader}" cvalue=""></td >
	</tr>
	<tr>
		<td class="lableTd t_r">申报人：</td>
		<td><input ${isDisabled} name="applyer" type="text" class="input_large changeinput" maxlength="30" value="${ppt.applyer}" cvalue="${pp.applyer}"></td>
		<td class="lableTd t_r">申报人工号：</td>
		<td><input ${isDisabled} name="applyerLoginname" type="text" class="input_large changeinput" maxlength="30" value="${ppt.applyerLoginname}" cvalue=""></td>
	</tr>
	<tr>
		<td class="lableTd t_r">年度推进目标：</td>
		<td><input ${isDisabled} name="yearTarget" type="text" class="input_large changeinput" maxlength="30" value="${ppt.yearTarget}"   cvalue="${pp.yearTarget}"></td>
	</tr>
	<tr>
		<td class="lableTd t_r">备注：</td>
		<td colspan="3">
		<textarea ${isDisabled} rows="2" name="remarks" >${ppt.remarks}</textarea>
		<textarea ${isDisabled} style="display: none" rows="2" name="remarks" >${pp.remarks}</textarea>
		</td>
	</tr>
	<c:if test="${isShowBut}">
	<tr>
		<td colspan="4" class="lableTd t_c ">
		<input style="" type="button" value="保 存" class="input_large" onclick="projectPlanTarget_From();">
		<!-- <input style="" type="button" value="切换plan" class="input_large" onclick="changeContent();"/> -->
		</td>
	</tr>
	</c:if>
	
</tbody>
</table>
</form>
<script type="text/javascript">
function projectPlanTarget_From(){
	$.ajaxPageFormSubmit("projectPlanTarget_From");
}

function changeContent(){
	//var inputs = document.getElementsByTagName("input");
	$("#projectPlanTarget_From .changeinput").each(function(i,n){
		$(n).attr("valtem",$(n).val());
		$(n).val($(n).attr("cvalue"));
		$(n).attr("cvalue",$(n).attr("valtem"));
	});
	
	
	//alert($("input").attr('cvalue'));
	//
}
$(document).ready(function () {
	//alert(0);
});
	$(function() {
		$.closeLoading();
		$( "#projectPlanTarget_From input[type=date]" ).datepicker({ dateFormat:"yy-mm-dd"});
		$( "#projectPlanTarget_From .idate" ).datepicker({ dateFormat:"yy-mm-dd"});
		//$.openLoading();

		//$( "#projectPlanTarget_From .projectPlanTarget_From_link" ).append();
		resetDefaultLink();
		
		$("#projectNameNoUse").autocomplete({
		    source: function(request, response) {
		        $.ajax({
		            url: "${pageContext.request.contextPath}/projectPlan/completeData",
		            dataType: "json",
		            type:"post",
		            data: {
		                featureClass: "P",
		                style: "full", 
		                pageNum:1,
		                pageSize:10,
		                param: request.term
		            },
		            success: function(data) {
		                response($.map(data.list, function(item) {
		                    return {
		                        label: "["+item.year+"] "+item.projectName +" ("+ (item.applyer )+")",
		                        value: item.projectName,
		                        obj:item
		                    }
		                }));
		            }
		        });
		    },
		    minLength: 2, 
		    delay: 500,
		    select: function(e, ui) {
               // alert(ui.item.objectid) ; reportUnit applyer applyerLoginname reportUnitId
                $("#projectPlanTarget_From [name='projectPlanID']").val(ui.item.obj.id);
                $("#projectPlanTarget_From .projectName").val(ui.item.obj.projectName);
                
                $("#projectPlanTarget_From [name='reportUnit']").val(ui.item.obj.reportUnit);
                $("#projectPlanTarget_From [name='reportUnitId']").val(ui.item.obj.reportUnitId);
                $("#projectPlanTarget_From [name='applyer']").val(ui.item.obj.applyer);
                $("#projectPlanTarget_From [name='applyerLoginname']").val(ui.item.obj.applyerLoginname);
                resetDefaultLink();
            },
		    change: function(e, ui) {
	               // alert(ui) ;
	                
	        }
		});
	});
function resetDefaultLink(){
	var pid = $("#projectPlanTarget_From [name='projectPlanID']").eq(0).val();
	//alert(pid);
	if(pid==null||pid==''){
		$( "#projectPlanTarget_From .ps_link ").text("[请先 选择关联项目申报计划！]");
		$( "#projectPlanTarget_From .ps_link ").attr("href","javascript:void(0);");
		$( "#projectPlanTarget_From .ps_link ").removeAttr("target");
	}else{
		var url = "${pageContext.request.contextPath}/projectPlan/projectApplicationDetail?id="+pid;
		$( "#projectPlanTarget_From .ps_link").text("[查看详情]");
		$( "#projectPlanTarget_From .ps_link ").attr("href",url);
		$( "#projectPlanTarget_From .ps_link ").attr("target","_blank");
	}
	
}
</script>