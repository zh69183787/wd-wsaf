<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增年度成本(维保公司)</title>
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
    	$("select").attr("disabled","disabled");
    	$(":text").attr("disabled","disabled");
    	QueryString.Initial();
    	var annualId = QueryString.GetValue("id");
    	$("[name=annualId]").val(annualId);
    	
    	
    	$("#addbtn").click(function(){
    		var _yanz=$.yanzhenCostAdd();
    		if(_yanz!=""){
 		       alert(_yanz+"\r\n请修改");
 		       $( this ).dialog( "close" );
 		       return false;
 		    }
    		var otherData = "";	
  		  	if($("[name=annualId]").val()!=""&&$("[name=annualId]").val()!=null){
  			  otherData += "&id="+$("[name=annualId]").val();
  		  	}
 		      var annualId = $.postsaveannual("${pageContext.request.contextPath}","projectPlanForm",otherData);
 		     if($("[name=annualId]").val()==""||$("[name=annualId]").val()==null){
  		    	  $("[name=annualId]").val(annualId);
  		      }
 		      window.open("/iims/annualCost/specialServiceList?annualId="+annualId);
    		});
    	
    	$("#btnSubmit").click(function(){
    		var otherData = "";	
    		if($("[name=annualId]").val()!=""&&$("[name=annualId]").val()!=null){
    			  otherData += "&id="+$("[name=annualId]").val();
    		  	}
 		    $.postsaveannual("${pageContext.request.contextPath}","projectPlanForm",otherData);
 			window.close();
			  location.href = Url + "/annualCost/annualIndex"; 
    	});
    	
    	if($("[name=annualId]").val()!=""&&$("[name=annualId]").val()!=null){
    		
    		var annualId = $("[name=annualId]").val();
    		$.postSearchFormAnnualCost11("${pageContext.request.contextPath}","&annualId="+annualId);
    		$.postannualCostDetail("${pageContext.request.contextPath}",annualId);
    		$("[name=totalBudget]").val($("[name=totalBudget]").val());
			$("#totalBudget").val($("[name=totalBudget]").val());
			
			var a = $("[name=htje]"),val_a=0;
			for(var i=0;i<a.length;i++){
				val_a += parseInt(a[i].innerHTML);
			}
			$("[name=totalSigned]").val(val_a.toFixed(2));
			$("#totalSigned").val($("[name=totalSigned]").val());
			
			var b = $("[name=yzf]"),val_b=0;
			for(var i=0;i<b.length;i++){
				val_b += parseInt(b[i].innerHTML);
			}
			$("[name=totalPaied]").val(val_b.toFixed(2));
			$("#totalPaied").val($("[name=totalPaied]").val());
			
			$("[name=totalUnsigned]").val(($("[name=totalBudget]").val()-$("[name=totalSigned]").val()).toFixed(2));
			$("#totalUnsigned").val($("[name=totalUnsigned]").val());
			
			$("[name=totalUnpaied]").val(($("[name=totalSigned]").val()-$("[name=totalPaied]").val()).toFixed(2));
			$("#totalUnpaied").val($("[name=totalUnpaied]").val());
			
			$("[name=signedPercent]").val($("[name=totalSigned]").val()/$("[name=totalBudget]").val());
			$("#signedPercent").val(($("[name=totalSigned]").val()/$("[name=totalBudget]").val()*100).toFixed(2)+"%");
			
			$("[name='']").val($("[name=totalPaied]").val()/$("[name=totalSigned]").val());
			$("#ht").val(($("[name=totalPaied]").val()/$("[name=totalSigned]").val()*100).toFixed(2)+"%");
			
			$("[name=paiedPercent]").val($("[name=totalPaied]").val()/$("[name=totalBudget]").val());
			$("#paiedPercent").val(($("[name=totalPaied]").val()/$("[name=totalBudget]").val()*100).toFixed(2)+"%");

    	}
    	
    	window.onfocus = function(){
    		if($("[name=annualId]").val()!=""&&$("[name=annualId]").val()!=null){
        		
        		var annualId = $("[name=annualId]").val();
        		$.postSearchFormAnnualCost11("${pageContext.request.contextPath}","&annualId="+annualId);
    		  	
        	
    		
			$("[name=totalBudget]").val($("[name=totalBudget]").val());
			$("#totalBudget").val($("[name=totalBudget]").val());
			
			var a = $("[name=htje]"),val_a=0;
			for(var i=0;i<a.length;i++){
				val_a += parseInt(a[i].innerHTML);
			}
			$("[name=totalSigned]").val(val_a.toFixed(2));
			$("#totalSigned").val($("[name=totalSigned]").val());
			
			var b = $("[name=yzf]"),val_b=0;
			for(var i=0;i<b.length;i++){
				val_b += parseInt(b[i].innerHTML);
			}
			$("[name=totalPaied]").val(val_b.toFixed(2));
			$("#totalPaied").val($("[name=totalPaied]").val());
			
			$("[name=totalUnsigned]").val(($("[name=totalBudget]").val()-$("[name=totalSigned]").val()).toFixed(2));
			$("#totalUnsigned").val($("[name=totalUnsigned]").val());
			
			$("[name=totalUnpaied]").val(($("[name=totalSigned]").val()-$("[name=totalPaied]").val()).toFixed(2));
			$("#totalUnpaied").val($("[name=totalUnpaied]").val());
			
			$("[name=signedPercent]").val($("[name=totalSigned]").val()/$("[name=totalBudget]").val());
			$("#signedPercent").val(($("[name=totalSigned]").val()/$("[name=totalBudget]").val()*100).toFixed(2)+"%");
			
			$("[name='']").val($("[name=totalPaied]").val()/$("[name=totalSigned]").val());
			$("#ht").val(($("[name=totalPaied]").val()/$("[name=totalSigned]").val()*100).toFixed(2)+"%");
			
			$("[name=paiedPercent]").val($("[name=totalPaied]").val()/$("[name=totalBudget]").val());
			$("#paiedPercent").val(($("[name=totalPaied]").val()/$("[name=totalBudget]").val()*100).toFixed(2)+"%");
    		
    		}
			
    	};
    	      
  		$("[name=closebtn]").click(function(){
  			window.close();
  		});
  		
  		$("#addbtn").css("display","none");
    	$("[name=delete]").css("display","none");
    });
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
                      	部门类别<select name="type">
                      		<option value="">请选择</option>
                      		<option value="serviceDept">维保公司</option>
                      		<option value="groupUnit">集团本部</option>
                      	   </select>
                       	<div class="red"> *</div>年度<input type="text" class="input_large"  name="year"  />&nbsp;
                       	<div class="red"> *</div>年度下达预算<input type="text" class="input_large" name="totalBudget"  />
                       	<input type="hidden" class="input_large" name="annualId"  />
                       </td>
                      </tr>
                    </table>
            </div>
        </div>
         
        <div class="fn clearfix" >
           <!--xinxi-->
           <div class="fr">
             <input type="button" id="addbtn" value="新 增" >
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
                       <td class="sort"><a><span class="fl">专项名称</span></a></td>
                       <td class="sort"><a ><span class="fl">上报预算</span></a></td>
                       <td class="sort"><a ><span class="fl">下达预算</span></a></td>
                       <td class="sort"><a ><span class="fl">合同名称</span></a></td>
                       <td class="sort"><a ><span class="fl">计划签订时间</span></a></td>
                       <td class="sort"><a ><span class="fl">合同金额</span></a></td>   
                       <td class="sort"><a ><span class="fl">已支付</span></a></td>
                       <td class="sort"><a ><span class="fl">未支付</span></a></td>
                       <td class="sort"><a ><span class="fl">支付率</span></a></td>
                       <td class="sort"><a ><span class="fl">计划预付款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际预付款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划进度款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际进度款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划验收款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际验收款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划质保款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际质保款</span></a></td>
                       <td class="sort"><a ><span class="fl">执行情况说明</span></a></td>
                       <td class="sort"><a ><span class="fl">操作栏</span></a></td>
                   </tr>
                 </tbody>
                 
           </table>
           <table>
           <tbody>
                 	<tr>
                 		<td class="lableTd t_r">总计预算金额</td>
                 		<td> <input disabled type="text" class="input_large" id="totalBudget" />
                 		<input type="hidden" class="input_large" name="totalBudget" /></td>
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">总计已签订合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="totalSigned" />
                 		<input type="hidden" class="input_large" name="totalSigned" /></td>
                 		<td class="lableTd t_r">投资完成率</td>
                 		<td> <input disabled type="text" class="input_large" id="signedPercent" />
                 		<input type="hidden" class="input_large" name="signedPercent" /></td>
                 		
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">总计已支付合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="totalPaied" />
                 		<input type="hidden" class="input_large" name="totalPaied" /></td>
                 		<td class="lableTd t_r">合同使用率</td>
                 		<td> <input disabled type="text" class="input_large" id="ht" />
                 		<input type="hidden" class="input_large" name="" /></td>
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">总计未签订合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="totalUnsigned" />
                 		<input type="hidden" class="input_large" name="totalUnsigned" /></td>
                 		<td class="lableTd t_r">资金支付率</td>
                 		<td> <input disabled type="text" class="input_large" id="paiedPercent" />
                 		<input type="hidden" class="input_large" name="paiedPercent" /></td>
                 	</tr>
                 	<tr>
                 		<td class="lableTd t_r">总计未支付合同金额</td>
                 		<td> <input disabled type="text" class="input_large" id="totalUnpaied" />
                 		<input type="hidden" class="input_large" name="totalUnpaied" /></td>
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
