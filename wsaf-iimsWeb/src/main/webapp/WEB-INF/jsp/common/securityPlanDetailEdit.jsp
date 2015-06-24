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

<script src="js/f.defaultJs.js"></script>
<script src="js/f.securityPlan.js"></script>

<script type="text/javascript">
	$(function() {       
		$.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityPlanDetail" });
		
		$.userIdentity({ "url": "${pageContext.request.contextPath}" });	
	    $.postSystemName("${pageContext.request.contextPath}", "", "");
	        
		$("#mysystemName").change(function () {
             var str = $("#mysystemName option:selected").val();
             $("[name=systemLevel] option[value=" + str + "]").attr("selected", "selected");
         });
		 
		QueryString.Initial();
		if(QueryString.GetValue('id')!=null)
		{
			$.postSecurityPlanDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'));
			
			$("#btndel2").click(function(){	
				$.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","modname":"securityPlanDetail","otherData":"id="+QueryString.GetValue('id')+"&removed=1","isClose":true});
			});
			
			
			$("#btnSubmit").click(function(){
				  var d = new Date(), mystate = "", yanzhen = $.customVerification("#securityPlanDetailTable");

	                if (yanzhen != "") {
	                    alert(yanzhen);
	                    return false;
	                }

	                var otherData = "&id="+QueryString.GetValue('id')+"&finished=0";
	               
	                if($("[name=planType] option:selected").val()!="infoTrain"&&$("[name=planType] option:selected").val()!="emergencyPlan")
	                 {
	                	otherData+="&systemName=" + $("#mysystemName option:selected").text() + "&systemLevel=" + $("[name=systemLevel] option:selected").val()
	                 }
	                else
	                {
	                	otherData+="&systemName=&systemLevel=";
	                }
	                
	                $.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":true,"modname":"securityPlanDetail","otherData":otherData,"isClose":true});
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
                  <td ><select name="planType" class="input_large" maxlength="30"></select></td>
                   <td class="lableTd t_r" >业务层级</td>
                  <td ><select name="businessLevel" class="input_large" maxlength="30"></select></td>
                 
                </tr>
                
                    
                  <tr>
                  <td class="lableTd t_r" >项目名称</td>
                  <td >   <input name="projectName" type="text" class="input_large" maxlength="30" /></td>
                  <td class="lableTd t_r" >项目编号</td>
                  <td ><input name="projectNum" type="text" class="input_large" maxlength="30"  readonly="readonly"/></td>
               
                  </td>
                 </tr>  
                   <tr class="Tohide">
                  <td class="lableTd t_r" >系统名称</td>
                  <td><select id="mysystemName" class="input_large">
                                <option value="">请选择</option>
                                  <option value="level0">无</option>
                            </select></td>
                             <td class="lableTd t_r" >系统等级</td>
                  <td >     <select name="systemLevel" type="text" class="input_large" disabled="disabled"></select></td>
                  </td>
                  </td>
                 </tr>
                  
                      <tr>
                  <td class="lableTd t_r" >主要内容</td>
                  <td colspan="3">    <textarea rows="2" name="mainContent" maxlength="200"></textarea></td>
                  </td>
                 </tr>   
                     <tr>
                  <td class="lableTd t_r" >实施方</td>
                  <td colspan="3">     <select name="implement" class="input_small"></select></td>
                  </td>
                 </tr>  
                       <tr>
                  <td class="lableTd t_r" >计划开始时间</td>
                  <td >     <input name="planStartTime" type="text" class="input_small" maxlength="10"></td>
                  </td>
                   <td class="lableTd t_r" >计划结束时间</td>
                  <td >    <input name="planEndTime" type="text" class="input_small" maxlength="10"></td>
                  </td>
                 </tr>
                 
                    <tr>
                  <td class="lableTd t_r" >费用(元)</td>
                  <td >     <input name="cost" type="text" class="input_small" onkeyup="value=value.replace(/[^\d.]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" maxlength="10"></td>
                  </td>
                   <td class="lableTd t_r" >目标计划</td>
                  <td >     <input name="targetPlan" type="text" class="input_large" maxlength="30"></td>
                  </td>
                 </tr>
                        <tr>
                  <td class="lableTd t_r" >备注</td>
                  <td colspan="3">    
                            <textarea rows="2" name="remarks"></textarea></td>
                  </td>
                 </tr> 
              
              </table>
             
              </form>
            </div>
            <div class="mb10 t_c">
              <input type="button" id="btnSubmit" value="保 存" />
              &nbsp;
              <input type="button" id="btndel" value="取 消" />
              &nbsp;
                <input type="button" id="btndel2" value="删 除" />
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
