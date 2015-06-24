<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>年度专项费用</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="X-UA-Compatible" content="IE=8" />
	
    <link rel="stylesheet" href="css/formalize.css" />
    <link rel="stylesheet" href="css/page.css" />
    <link rel="stylesheet" href="css/default/imgs.css" />
    <link rel="stylesheet" href="css/reset.css" />
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	
	<script src="js/html5.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.formalize.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/annual.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
    <script type="text/javascript">
    $(function() {
    	$(".pt45").css("width","2626px");
		$(".main").css("width","2626px");
    	QueryString.Initial();
    	var specialId = QueryString.GetValue("specialId");
    	$("[name=specialId]").val(specialId);
    	
    	$("#addContract").click(function(){
    		var _yanz=$.yanzhenBudget();
    		if(_yanz!=""){
 		       alert(_yanz+"\r\n请修改");
 		       $( this ).dialog( "close" );
 		       return false;
 		    }
    		var otherData = "";	
  		  	if($("[name=budgetId]").val()!=""&&$("[name=budgetId]").val()!=null){
  			  otherData += "&id="+$("[name=budgetId]").val();
  		  	}
 		      var budgetId = $.postsaveBudget("${pageContext.request.contextPath}","projectPlanForm",otherData);
 		     if($("[name=budgetId]").val()==""||$("[name=budgetId]").val()==null){
  		    	  $("[name=budgetId]").val(budgetId);
  		      }
 		      window.open("/iims/special/specialContractAdd?budgetId="+budgetId+"&specialId="+specialId);
    		});
    	
    	$("#addProject").click(function(){
    		var _yanz=$.yanzhenBudget();
    		if(_yanz!=""){
 		       alert(_yanz+"\r\n请修改");
 		       $( this ).dialog( "close" );
 		       return false;
 		    }
    		var otherData = "";	
  		  	if($("[name=budgetId]").val()!=""&&$("[name=budgetId]").val()!=null){
  			  otherData += "&id="+$("[name=budgetId]").val();
  		  	}
 		      var budgetId = $.postsaveBudget("${pageContext.request.contextPath}","projectPlanForm",otherData);
 		     if($("[name=budgetId]").val()==""||$("[name=budgetId]").val()==null){
  		    	  $("[name=budgetId]").val(budgetId);
  		      }
 		      window.open("/iims/special/specialProjectAdd?budgetId="+budgetId);
    		});
    	
    	$("#btnSubmit").click(function(){
    		var otherData = "";	
    		if($("[name=specialId]").val()!=""&&$("[name=specialId]").val()!=null){
    			  otherData += "&id="+$("[name=specialId]").val();
    		  	}
 		    $.postsaveSpecial("${pageContext.request.contextPath}","projectPlanForm",otherData);
 			window.close();
			  location.href = Url + "/annualCost/annualIndex"; 
    	});
    	
    	if($("[name=specialId]").val()!=""&&$("[name=specialId]").val()!=null){
    		
    		var specialId_1 = $("[name=specialId]").val();
    		$.postSearchFormSpecialBudget2("${pageContext.request.contextPath}","&specialId="+specialId_1);
    		$.postSpecialBudgetDetail("${pageContext.request.contextPath}",specialId_1);
		
		
		var a = $("[name=pfys]"),val_a=0;
		for(var i=0;i<a.length;i++){
			val_a += parseInt(a[i].innerHTML);
		}
		$("[name=planReportBudget]").val(val_a);
		$("#planReportBudget").val($("[name=planReportBudget]").val());

		var b = $("[name=ysnd]"),c = $("[name=pfzt]"),val_b=0;
		for(var i=0;i<b.length;i++){
			if(b[i].innerHTML=="2015"&&c[i].innerHTML=="已批复"){
				var ii = i+1;
				val_b += parseInt($("#pfys_"+ii+"").text());
			}
		}
		$("[name=repliedBudget]").val(val_b);
		$("#repliedBudget").val($("[name=repliedBudget]").val());
		
		$("[name=unrepliedBudget]").val($("[name=planReportBudget]").val()-$("[name=repliedBudget]").val());
		$("#unrepliedBudget").val($("[name=unrepliedBudget]").val());
		
		$("[name=repliedPercent]").val($("[name=repliedBudget]").val()/$("[name=planReportBudget]").val());
		var num1 = $("[name=repliedBudget]").val()/$("[name=planReportBudget]").val();
		$("#repliedPercent").val(Math.round(num1*100)+"%");
		if($("#repliedPercent").val()=="NaN%"){
			$("#repliedPercent").val("0%");
		}
		
		var d = $("[name=ysnd]"),val_d=0,val_e=0;
		for(var i=0;i<d.length;i++){
			if(d[i].innerHTML=="2014"){
				var i2 = i+1;
				val_d += parseInt($("#ndys_"+i2+"").text());
			}else if(d[i].innerHTML=="2015"){
				var i3 = i+1;
				val_e += parseInt($("#ndys_"+i3+"").text());
			}
		}
		$("[name=lastYearBudget]").val(val_d);
		$("#lastYearBudget").val($("[name=lastYearBudget]").val());
		
		$("[name=thisYearBudget]").val(val_e);
		$("#thisYearBudget").val($("[name=thisYearBudget]").val());
		
		
		var f = $(".qdnd"),val_f=0;
		for(var i=0;i<f.length;i++){
			if(f[i].innerHTML=="2015"){
				var i4 = i+1;
				val_f += parseInt($("#qdje_"+i4+"").text());
			}
		}
		$("[name=planSignAmount]").val(val_f);
		$("#planSignAmount").val($("[name=planSignAmount]").val());
		
		
		
		var g = $(".qdzt"),val_g=0;
		for(var i=0;i<g.length;i++){
			if(f[i].innerHTML=="2015"&&g[i].innerHTML=="已签订"){
				var i5 = i+1;
				val_g += parseInt($("#qdje_"+i5+"").text());
			}
		}
		$("[name=signedAmount]").val(val_g);
		$("#signedAmount").val($("[name=signedAmount]").val());
		
		$("[name=unsignedAmount]").val($("[name=planSignAmount]").val()-$("[name=signedAmount]").val());
		$("#unsignedAmount").val($("[name=unsignedAmount]").val());
		
		$("[name=signedPercent]").val($("[name=signedAmount]").val()/$("[name=planSignAmount]").val());
		var num2 = $("[name=signedAmount]").val()/$("[name=planSignAmount]").val();
		$("#signedPercent").val(Math.round(num2*100)+"%");
		if($("#signedPercent").val()=="NaN%"){
			$("#signedPercent").val("0%");
		}
		
		var h = $(".jhzf"),val_h=0;
		for(var i=0;i<h.length;i++){
			val_h += parseInt(h[i].innerHTML);
		}
		$("[name=planPaiedAmount]").val(val_h);
		$("#planPaiedAmount").val($("[name=planPaiedAmount]").val());
		
		var k = $(".yzf"),val_k=0;
		for(var i=0;i<k.length;i++){
			val_k += parseInt(k[i].innerHTML);
		}
		$("[name=paiedAmount]").val(val_k);
		$("#paiedAmount").val($("[name=paiedAmount]").val());
		
		
		
		$("[name=unpaiedAmount]").val($("[name=planPaiedAmount]").val()-$("[name=paiedAmount]").val());
		$("#unpaiedAmount").val($("[name=unpaiedAmount]").val());
		
		$("[name=paiedPercent]").val($("[name=paiedAmount]").val()/$("[name=planPaiedAmount]").val());
		var num3 = ($("[name=paiedAmount]").val()/$("[name=planPaiedAmount]").val());
		$("#paiedPercent").val(Math.round(num3*100)+"%");
		if($("#paiedPercent").val()=="NaN%"){
			$("#paiedPercent").val("0%");
		}
		}
    	
    	window.onfocus = function(){
    		if($("[name=specialId]").val()!=""&&$("[name=specialId]").val()!=null){
        		
        		var specialId_2 = $("[name=specialId]").val();
        		$.postSearchFormSpecialBudget2("${pageContext.request.contextPath}","&specialId="+specialId_2);
        		$.postSpecialBudgetDetail("${pageContext.request.contextPath}",specialId_2);
    		
			
        		var a = $("[name=pfys]"),val_a=0;
        		for(var i=0;i<a.length;i++){
        			val_a += parseInt(a[i].innerHTML);
        		}
        		$("[name=planReportBudget]").val(val_a);
        		$("#planReportBudget").val($("[name=planReportBudget]").val());

        		var b = $("[name=ysnd]"),c = $("[name=pfzt]"),val_b=0;
        		for(var i=0;i<b.length;i++){
        			if(b[i].innerHTML=="2015"&&c[i].innerHTML=="已批复"){
        				var ii = i+1;
        				val_b += parseInt($("#pfys_"+ii+"").text());
        			}
        		}
        		$("[name=repliedBudget]").val(val_b);
        		$("#repliedBudget").val($("[name=repliedBudget]").val());
        		
        		$("[name=unrepliedBudget]").val($("[name=planReportBudget]").val()-$("[name=repliedBudget]").val());
        		$("#unrepliedBudget").val($("[name=unrepliedBudget]").val());
        		
        		$("[name=repliedPercent]").val($("[name=repliedBudget]").val()/$("[name=planReportBudget]").val());
        		var num1 = $("[name=repliedBudget]").val()/$("[name=planReportBudget]").val();
        		$("#repliedPercent").val(Math.round(num1*100)+"%");
        		if($("#repliedPercent").val()=="NaN%"){
        			$("#repliedPercent").val("0%");
        		}
        		
        		var d = $("[name=ysnd]"),val_d=0,val_e=0;
        		for(var i=0;i<d.length;i++){
        			if(d[i].innerHTML=="2014"){
        				var i2 = i+1;
        				val_d += parseInt($("#ndys_"+i2+"").text());
        			}else if(d[i].innerHTML=="2015"){
        				var i3 = i+1;
        				val_e += parseInt($("#ndys_"+i3+"").text());
        			}
        		}
        		$("[name=lastYearBudget]").val(val_d);
        		$("#lastYearBudget").val($("[name=lastYearBudget]").val());
        		
        		$("[name=thisYearBudget]").val(val_e);
        		$("#thisYearBudget").val($("[name=thisYearBudget]").val());
        		
        		
        		var f = $(".qdnd"),val_f=0;
        		for(var i=0;i<f.length;i++){
        			if(f[i].innerHTML=="2015"){
        				var i4 = i+1;
        				val_f += parseInt($("#qdje_"+i4+"").text());
        			}
        		}
        		$("[name=planSignAmount]").val(val_f);
        		$("#planSignAmount").val($("[name=planSignAmount]").val());
        		
        		
        		
        		var g = $(".qdzt"),val_g=0;
        		for(var i=0;i<g.length;i++){
        			if(f[i].innerHTML=="2015"&&g[i].innerHTML=="已签订"){
        				var i5 = i+1;
        				val_g += parseInt($("#qdje_"+i5+"").text());
        			}
        		}
        		$("[name=signedAmount]").val(val_g);
        		$("#signedAmount").val($("[name=signedAmount]").val());
        		
        		$("[name=unsignedAmount]").val($("[name=planSignAmount]").val()-$("[name=signedAmount]").val());
        		$("#unsignedAmount").val($("[name=unsignedAmount]").val());
        		
        		$("[name=signedPercent]").val($("[name=signedAmount]").val()/$("[name=planSignAmount]").val());
        		var num2 = $("[name=signedAmount]").val()/$("[name=planSignAmount]").val();
        		$("#signedPercent").val(Math.round(num2*100)+"%");
        		if($("#signedPercent").val()=="NaN%"){
        			$("#signedPercent").val("0%");
        		}
        		
        		var h = $(".jhzf"),val_h=0;
        		for(var i=0;i<h.length;i++){
        			val_h += parseInt(h[i].innerHTML);
        		}
        		$("[name=planPaiedAmount]").val(val_h);
        		$("#planPaiedAmount").val($("[name=planPaiedAmount]").val());
        		
        		var k = $(".yzf"),val_k=0;
        		for(var i=0;i<k.length;i++){
        			val_k += parseInt(k[i].innerHTML);
        		}
        		$("[name=paiedAmount]").val(val_k);
        		$("#paiedAmount").val($("[name=paiedAmount]").val());
        		
        		
        		
        		$("[name=unpaiedAmount]").val($("[name=planPaiedAmount]").val()-$("[name=paiedAmount]").val());
        		$("#unpaiedAmount").val($("[name=unpaiedAmount]").val());
        		
        		$("[name=paiedPercent]").val($("[name=paiedAmount]").val()/$("[name=planPaiedAmount]").val());
        		var num3 = ($("[name=paiedAmount]").val()/$("[name=planPaiedAmount]").val());
        		$("#paiedPercent").val(Math.round(num3*100)+"%");
        		if($("#paiedPercent").val()=="NaN%"){
        			$("#paiedPercent").val("0%");
        		}
    		}
			
    	};
    	      
  		$("[name=closebtn]").click(function(){
  			window.close();
  		});
    });
    
    function delConstract(id){
    	$.postDeleConstract("${pageContext.request.contextPath}",id);
    }
    function delProject(id){
    	$.postDeleProject("${pageContext.request.contextPath}",id);
    }
</script>
  
</head>

<body class="Flow">
	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>信息管理</a></li>
                      <li><a>日常管理</a></li>
                	  <li class="fin">合同管理</li>
                    </ul>
                  </div>
   		    </div>
   	<form id="projectPlanForm"> 
      <div class="pt45">
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      <td colspan="10" class="t_c">
                       	<div class="red"> *</div>项目预算年度<input type="text" disabled class="input_large" name="year"  />
                       	<div class="red"> *</div>项目年度预算<input type="text" disabled class="input_large"  name="budget"  />&nbsp;
                       	<input type="hidden" class="input_large" name="budgetId"  />
                       	<input type="hidden" class="input_large" name="specialId"  />
                       </td>
                      </tr>
                    </table>
            </div>
        </div>
         
        <div class="fn clearfix" >
           <!--xinxi-->
           <div class="fr">
             </div>
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">编号</span></a></td>
                       <td class="sort"><a><span class="fl">项目名称</span></a></td>
                       <td class="sort"><a ><span class="fl">项目批复预算</span></a></td>
                       <td class="sort"><a ><span class="fl">预算批复状态</span></a></td>
                       <td class="sort"><a ><span class="fl">项目金额</span></a></td>
                       <td class="sort"><a ><span class="fl">操作栏</span></a></td>
                       <td class="sort"><a ><span class="fl">项目预算年度</span></a></td>
                       <td class="sort"><a ><span class="fl">项目年度预算</span></a></td>
                       <td class="sort"><a ><span class="fl">合同名称</span></a></td>
                       <td class="sort"><a ><span class="fl">计划签订时间</span></a></td>
                       <td class="sort"><a ><span class="fl">合同签订年度</span></a></td>
                       <td class="sort"><a ><span class="fl">合同签订状态</span></a></td>
                       <td class="sort"><a ><span class="fl">合同签订金额</span></a></td>
                       <td class="sort"><a ><span class="fl">执行起始年度</span></a></td>
                       <td class="sort"><a ><span class="fl">执行终止年度</span></a></td>
                       <td class="sort"><a ><span class="fl">本年计划支付</span></a></td>
                       <td class="sort"><a ><span class="fl">本年已支付</span></a></td>
                       <td class="sort"><a ><span class="fl">支付完成率</span></a></td>
                       <td class="sort"><a ><span class="fl">本年未支付</span></a></td>
                       <td class="sort"><a ><span class="fl">累积支付</span></a></td>
                       <td class="sort"><a ><span class="fl">累积支付率</span></a></td>
                       <td class="sort"><a ><span class="fl">计划预付款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际预付款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划进度款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际进度款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划验收款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际验收款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划质保款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际质保款</span></a></td>
                       <td class="sort"><a ><span class="fl">执行情况说明</span></a></td>
                       <td class="sort" style="width:204px;"><a ><span class="fl">操作栏</span></a></td>
                   </tr>
                 </tbody>
                 
           </table>
           <table>
           <tbody>
                 	<tr>
                 		<td class="lableTd t_r">当年计划上报项目预算</td>
                 		<td> <input disabled type="text" class="input_large" id="planReportBudget" />
                 		<input type="hidden" class="input_large" name="planReportBudget" /></td>
                 		
                 		<td class="lableTd t_r">当年计划签订合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="planSignAmount" />
                 		<input type="hidden" class="input_large" name="planSignAmount" /></td>
                 		
                 		<td class="lableTd t_r">应支付合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="planPaiedAmount" />
                 		<input type="hidden" class="input_large" name="planPaiedAmount" /></td>
                 		
                 		<td class="lableTd t_r">去年项目资金预算</td>
                 		<td> <input disabled type="text" class="input_large" id="lastYearBudget" />
                 		<input type="hidden" class="input_large" name="lastYearBudget" /></td>
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">当年已批复项目预算</td>
                 		<td> <input disabled type="text" class="input_large" id="repliedBudget" />
                 		<input type="hidden" class="input_large" name="repliedBudget" /></td>
                 		
                 		
                 		<td class="lableTd t_r">当年已签订合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="signedAmount" />
                 		<input type="hidden" class="input_large" name="signedAmount" /></td>
                 		
                 		<td class="lableTd t_r">已支付合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="paiedAmount" />
                 		<input type="hidden" class="input_large" name="paiedAmount" /></td>
                 		
                 		<td class="lableTd t_r">当年项目资金预算</td>
                 		<td> <input disabled type="text" class="input_large" id="thisYearBudget" />
                 		<input type="hidden" class="input_large" name="thisYearBudget" /></td>
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">当年未批复项目预算</td>
                 		<td> <input disabled type="text" class="input_large" id="unrepliedBudget" />
                 		<input type="hidden" class="input_large" name="unrepliedBudget" /></td>
                 		
                 		<td class="lableTd t_r">当年未签订合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="unsignedAmount" />
                 		<input type="hidden" class="input_large" name="unsignedAmount" /></td>
                 		
                 		<td class="lableTd t_r">未支付合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="unpaiedAmount" />
                 		<input type="hidden" class="input_large" name="unpaiedAmount" /></td>
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">批复率</td>
                 		<td> <input disabled type="text" class="input_large" id="repliedPercent" />
                 		<input type="hidden" class="input_large" name="repliedPercent" /></td>
                 		
                 		<td class="lableTd t_r">签订率</td>
                 		<td> <input disabled type="text" class="input_large" id="signedPercent" />
                 		<input type="hidden" class="input_large" name="signedPercent" /></td>
                 		
                 		<td class="lableTd t_r">支付率</td>
                 		<td> <input disabled type="text" class="input_large" id="paiedPercent" />
                 		<input type="hidden" class="input_large" name="paiedPercent" /></td>
                 	</tr>
                 </tbody>
           </table>
      </div>
        <!--Table End-->
     </div>
     <div class="mb10 t_c">
       <input type="button" name="closebtn" value="关 闭" /> &nbsp;
     </div>
     </form>
</div>
</body>
</html>
