<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8" />
		<meta http-equiv="x-ua-compatible" content="IE=8">
		<title>查看征集</title>
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
		<script src="js/actSuggestion.js"></script>
		<script src="js/layer/layer.min.js"></script>
		<style type="text/css">
				
		</style>
		<script type="text/javascript">
				
				$(function(){
						var ctId="${ctId}";
						$("#ctId").val(ctId);
						//查看的是suggestion，引入的是actSuggestion.js
						$.postMainDetailView("${pageContext.request.contextPath}",ctId);
						$("#colCategory").attr("disabled",true);
						$("#isOpend").attr("disabled",true);
						$.postFeedbackView("${pageContext.request.contextPath}", "&pageSize=5&pageNum=1");
						ctId=parseInt(ctId);
		    			$.getFileInfo("${pageContext.request.contextPath}","modelName=adviceCollect&modelId="+ctId);
						$("#btnClose").click(function () {
			                window.opener = null;
			                window.open('', '_self');
			                window.close();
			            });
						
				});
				function open_back(id){
						$.layer({
										type : 2,
										shadeClose : true,
										title : "意见反馈",
										closeBtn : [ 0, true ],
										shade : [ 0.3, '#000' ],
										border : [ 0 ],
										offset : [ '50px', '' ],
// 										area : ['auto', 'auto'],
										area : ['800px',($(window).height() - 390)+ 'px' ],
// 										btns: 1,
										btn: ['确定', '取消'],
										iframe : {
											src : "${pageContext.request.contextPath}/actTheme/actThemeBack?id="+id
										}
									});

				}
				
		</script>
</head>

<body>
	<div class="main">
    	<!--Ctrl-->
		<div class="ctrl clearfix">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl">
            	<ul>
<!--                 	<li><a href="#">首页</a></li> -->
                	<li><a >意见管理</a></li>
                	<li class="fin">查看意见征集</li>
                </ul>
            </div>
           
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        
        <!--Filter-->
         <div class="filter">
            <div class="fn clearfix">
            	<h5 class="fl"><a  class="colSelect fl">查看意见征集</a></h5>
            </div>
         </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
            <form id="actSuggestionForm" ><input type="hidden" id="ctId" name="ctId" /></form>
        	<table width="100%"  class="table_1">
        	 				  <tbody>
                              <tr>
                                <td class="t_r lableTd">征集名称</td>
                                <td colspan="3"><label id="name" name="name" ></label></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">意见类别</td>
                                <td width="32%">
                                	<select id="colCategory" name="colCategory" class="input_large">
                                		<option value="">请选择</option>
                                		<option value="partyCategory">党群类</option>
                                		<option value="manageCategory">管理类</option>
                                		<option value="technologCategory">技术类</option>
                                		<option value="specialCategory">专题类</option>
                                	</select>
                                </td>
                               <td class="t_r lableTd">是否开放</td>
                                <td>
                                	<select  id="isOpend" name="isOpend"   class="input_large">
                                		<option value="">请选择</option>
                                		<option value="yes">开放</option>
                                		<option value="no">不开放</option>
                                	</select>
                                </td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">相关附件</td>
                                <td colspan="3">
                                	<table id="tbfj">
					                 	<tbody>
					                 	   <tr></tr>
					                 	</tbody>
					                 </table>
					            </td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">征集开始时间</td>
                                <td width="32%"><label id="startTime" name="startTime" ></label></td>
                                <td class="t_r lableTd">征集结束时间</td>
                                <td width="32%"><label id="endTime" name="endTime" ></label></td>
                              </tr>
                               <tr>
                                <td class="t_r lableTd">选择参与人员</td>
                               <td colspan="3">
                                	<textarea readonly id="participant_cn"  rows="5" disabled="disabled"></textarea>
                                	<input type="hidden" id="participant" name="participant"/>
                                	<!-- input type="hidden" id="participants_loginName"/-->
                                </td> 
                                
                              </tr>
                              <tr>
                                <td class="t_r lableTd">征集内容</td>
                                <td colspan="3"><textarea id="themecontent" name="themecontent" rows="5" placeholder="" disabled="disabled"></textarea></td>
                              </tr>
                              
                              
                              
                             
                              
			                           
                              </tbody>
                              <tr class="tfoot">
									<td colspan="6">
				                        <div class="clearfix"><span class="fl"></span>
				                            <ul class="fr clearfix pager"></ul>
				                        </div>
                   				    </td>
                              </tr>
                              
              </table>
              <div class="mb10 t_c"  >
                          <table width="100%" style="background-color:#fff;">
                            <tr><td class=" t_c">
							<input type="button" id="btnClose" value="返 回" />&nbsp; 
							</td></tr>
						  </table>
			   </div>
      </div>
      
						    
      
      
        <!--Table End-->
    	</div>
</div>
</body>
</html>
