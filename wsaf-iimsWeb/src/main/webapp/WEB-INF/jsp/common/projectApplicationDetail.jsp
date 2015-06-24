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

<script src="js/f.defaultJs.js"></script>
<script src="js/f.projectPlan.js"></script>
<script type="text/javascript">
	$(function() {
		QueryString.Initial();

	    $("#closebtn").click(function(){
	    	window.opener=null;
			window.close();
		});
	    
		if(QueryString.GetValue('id')!=null)
	    {
		 var isleader = $.userIdentity({"url":"${pageContext.request.contextPath}"});
         $.postDetail("${pageContext.request.contextPath}",QueryString.GetValue('id'),true,isleader);
         $.getSuggestInDept("${pageContext.request.contextPath}",QueryString.GetValue('id')); 
     	 $(".cbRequirement").attr("disabled","disabled");
		}		
	})
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

						<ul class="button clearfix">

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

            <h1 class="t_c">上海申通地铁集团有限公司<br>
              项目计划申报表</h1>
           
            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th class="disable" colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr class="disable">
                  <td class="lableTd t_r">年度</td>
                  <td> <select name="year" class="input_large" disabled>
                          <option value="2015">2015</option>
                          <option value="2014">2014</option>
                          <option value="2013">2013</option></select></td>
                  <td class="lableTd t_r">项目类别</td>
                  <td><select  name="projectType"  class="input_large" disabled>
                      <option value="">请选择</option>
                            <option value="repair">大修</option>
                      <option value="remould">更新改造</option>
                      <option value="new">新建</option>
                      <option value="other">其它</option>
                    </select></td>
                </tr>
                
                <tr class="disable">
                  <td class="lableTd t_r" >项目名称</td>
                  <td><input  type="text" class="input_large" name="projectName" disabled/></td>
                  <td class="lableTd t_r">总投资估算</td>
                  <td><input  type="text" class="input_small" name="totalInvestEstimate" disabled/>&nbsp;&nbsp;万元</td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                
                <th colspan="4" class="disable"><h5 class="fl">项目属性</h5></th>
                    </thead>
                     <tr class="disable">
                  <td class="lableTd t_r">资金计划/一季</td>
                  <td><input  type="text" class="input_small" name="fundPlan1" onkeyup= "checknum(this);" onafterpaste="checknum(this);" disabled/>&nbsp;&nbsp;万元</td>
                  <td class="lableTd t_r">资金计划/二季</td>
                  <td><input  type="text" class="input_small" name="fundPlan2" onkeyup= "checknum(this);" onafterpaste="checknum(this);" disabled/>&nbsp;&nbsp;万元</td>
  </tr>
     <tr class="disable">
                  <td class="lableTd t_r">资金计划/三季</td>
                  <td><input  type="text" class="input_small" name="fundPlan3" onkeyup= "checknum(this);" onafterpaste="checknum(this);" disabled/>&nbsp;&nbsp;万元</td>
                  <td class="lableTd t_r">资金计划/四季</td>
                  <td><input  type="text" class="input_small" name="fundPlan4" onkeyup= "checknum(this);" onafterpaste="checknum(this);" disabled/>&nbsp;&nbsp;万元</td>
  </tr>
                <tr class="disable">
                  <td class="lableTd t_r"  >项目概述</td>
                  <td colspan="3"><textarea  name="mainContent" rows="4" placeholder="请输入项目目标/实施范围/主要功能/技术性能指标"  disabled></textarea></td>
                </tr>
                <tr class="disable">
                  <td class="lableTd t_r">年度推进目标</td>
                  <td >
                  <select  name="yearTarget" disabled>
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
                       <td class="lableTd t_r"  id="yearTargetReasonTitle" ></td><td ><input id="yearTargetReason" style="display:none"  type="text" class="input_large" name="yearTargetReason" disabled/>
                  </td>
                </tr>
               
                <tr class="disable">
                  <td class="lableTd t_r">安全等级保护级别</td>
                  <td colspan="3"><select name="securityLevel" class="input_large" disabled>
                   <option value="">请选择</option>
                      <option value="level1">一级</option>
                      <option value="level2">二级</option>
                      <option value="level3">三级</option>
                    </select></td>
                </tr>
                <tr class="disable">
                  <td class="lableTd t_r">信息化资源需求</td>
                  <td colspan="3">
                  <select id="resourceRequirement" class="input_large"  disabled>
                       <option value="">请选择</option>
                      <option value="networkResource">网络资源需求</option>
                      <option value="storageResource">存储资源需求</option>
                      <option value="dataResource">数据资源需求</option>
                      <option value="virtualServerNumber">虚拟服务器台数</option>
           
                    </select>
                      <input type="button" id=addRequirement value="增加" disabled/>
                    <input type="button" id=delRequirement value="删除" disabled/>
                    </td>
                </tr>
                <tr class="disable">
                  <td class="lableTd t_r">计划开工时间</td>
                  <td><input type="number" id="planStartYear" class="input_tiny"  min="1990" max="2020" step="1" style="height:23px" disabled>&nbsp;年&nbsp;<input type="number" id="planStartMon" class="input_tiny" min="0" max="12" step="1" style="height:23px" disabled>&nbsp;月</td>
                  <td class="lableTd t_r">计划完工时间</td>
                  <td><input type="number" id="planEndYear" class="input_tiny" min="1990" max="2020" step="1" style="height:23px" disabled>&nbsp;年&nbsp;<input type="number" id="planEndYearMon" class="input_tiny" min="0" max="12" step="1" style="height:23px" disabled>&nbsp;月</td>
                </tr>
                
                <tr class="disable">
                  <td class="lableTd t_r"  >备注</td>
                  <td colspan="3"><textarea name="remarks"  rows="4" disabled></textarea></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="applyInfo">
                <thead>
                <th colspan="4"><h5 class="fl">申报信息</h5></th>
                    </thead>
                <tr class="disable">
                  <td class="lableTd t_r"  >申报单位</td>
                  <td ><input  type="text" class="input_large" name="reportUnit" disabled/></td>
                  <td class="lableTd t_r"  >申报人</td>
                  <td ><input  type="text" class="input_large" name="applyer" disabled/></td>
                </tr>
                <tr class="disable">
                  <td class="lableTd t_r"  >项目状态</td>
                  <td >
                   <select name="projectStatus" class="input_large"  disabled>
                      <option value="">请选择</option>
                       <option value="inDept">部门内部申报</option>
                        <option value="toInfoDept">信息中心审核</option>
                         <option value="toStore">入储备库</option>
                         <option value="toReport">台账</option>
                      
                    </select>
                  </td>
                  <td class="lableTd t_r" id="TimeType" >操作时间</td>
                  <td ><input  type="text" class="input_large" name="initiateTime" disabled/></td>
                </tr>
                 <tr class="disable">
                  <td class="lableTd t_r">当前审核人</td>
                  <td colspan="3">
                  <input  type="text" class="input_large" name="handler" disabled/>
        
                  </td>
                </tr>
              </table>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="leaderSuggest">
                           	    <thead>
                       	          <th> <h5 class="fl">审批信息</h5>
                                 </th>
                         	   </thead>
                       	        <tr>
                       	        	<td>
                                    	

                                    </td></tr></table>
              </form>
            </div>
            <div class="mb10 t_c" id="mybtn">
            <input type="button" id="closebtn" value="关闭" />
              &nbsp; </div>
            
            <div class="footer"></div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>