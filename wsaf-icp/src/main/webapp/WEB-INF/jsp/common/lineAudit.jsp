<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8" />
		<title>问卷审核</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/formalize.css" />
		<link rel="stylesheet" href="css/page.css" />
		<link rel="stylesheet" href="css/default/imgs.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
		<!--[if IE 6.0]>
           <script src="js/iepng.js" type="text/javascript"></script>
           <script type="text/javascript">
                EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
           </script>
       <![endif]-->
		<script src="js/html5.js"></script>
		<script src="js/jquery-1.7.1.min.js"></script>
		<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script src="js/jquery.formalize.js"></script>
	    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
		<script src="js/lineAudit.js"></script>
		<script type="text/javascript">
        $(function () {
        	var mainId="${mainId}";
        	//第一步：根据mianId获取问卷信息
        	$.getQteMain(mainId);
        	//第二步：获取该问卷的流转记录
        	$.getQteMainWorkFlow(mainId);
        	
        	//审核通过
        	$("#btnPass").click(function(){
        	    $.auditPass();
        	    $("#btnPass").attr("disabled","disabled");
        	    $("#btnBack").attr("disabled","disabled");
        	});
        	
        	$("#btnBack").click(function(){
        	   $.deptBack();
        	    $("#btnPass").attr("disabled","disabled");
        	    $("#btnBack").attr("disabled","disabled");
        	});
        	
        	
            
			$("#btnClose").click(function () {
                window.opener = null;
                window.open('', '_self');
                window.close();
            });
        });
    </script>
</head>

<body>
	<div class="main">
    	<!--Ctrl-->
		<div class="ctrl clearfix">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl">
            	<ul>
                	<li><a >问卷审核</a></li>
                	<li class="fin">条线领导审核</li>
                </ul>
            </div>
           
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        
        <!--Filter-->
<!--          <div class="filter"> -->
<!--             <div class="fn clearfix"> -->
<!--             	<h5 class="fl"><a href="#" class="colSelect fl">创建问卷</a></h5> -->
<!--             </div> -->
<!--          </div> -->
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
          <form id="qteMainForm">
        	<table width="100%"  class="table_1">
                              <tbody>
                              <tr>
                                <td class="t_r lableTd">问卷名称</td>
                                <td colspan="3">
                                	<input class="input_full" type="text" id="title" name="title" disabled="disabled" />
                                </td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">有效开始时间</td>
                                <td>
                                	<input readonly id="startTime" name="startTime" type="text" class="input_large" disabled="disabled">
                                </td>
                                <td class="t_r lableTd">有效结束时间</td>
                                <td>
                                	<input readonly id="endTime" name="endTime" type="text" class="input_large" disabled="disabled">
                                </td>
                              	<td></td>
                              	<td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">选择参与人员</td>
                                <td>
                                    <input readonly id="participants" name="participants" type="text" class="input_large" disabled="disabled">
                                </td>
                                <td class="t_r lableTd">是否开放</td>
                                <td>
                                   <input readonly id="isOpend" name="isOpend" type="text" class="input_large" disabled="disabled">
                                </td>
                                <td></td>
                                <td></td>
                              </tr>
                              
                              <tr>
                                <td class="t_r lableTd">背景描述</td>
                                <td colspan="3"><textarea id="description" name="description" rows="5" placeholder="" disabled="disabled"></textarea></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">审核意见</td>
                                <td colspan="3"><textarea id="suggestion" name="suggestion" rows="5" placeholder=""></textarea></td>
                                <td></td>
                                <td></td>
                              </tr>
                              </tbody>
                            </table>
                            	<input type="hidden" name="workFlowId" id="workFlowId">
                               
                </form>                
                                
                                
                <div class="mb10 t_c"  >
                          <table width="100%" class="table_1">
                            <tr><td class=" t_c">
                            <input type="button" id="btnPass" value="通过" />&nbsp;
							<input type="button" id="btnBack" value="返回修改" />&nbsp; 
							</td></tr>
						  </table>
			   </div>
			   <div id="dialog-confirm" title="" style="display:none">确认提交吗？</div>
                                
      </div>
        <!--Table End-->
    	</div>
</div>
</body>
</html>
