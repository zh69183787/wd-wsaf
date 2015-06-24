<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta http-equiv="x-ua-compatible" content="IE=8">
		
		<title>提出意见</title>
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
		<script src="js/jquery.uploadify-3.1.js"></script>
		<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script src="js/jquery.formalize.js"></script>
		<script src="js/actSuggestion.js"></script>
		<script type="text/javascript">
		    $(function(){
		    		
				    var ctId="${ctId}";
				    $("#ctId").val(ctId);
				    var id="${id}";
				    $.postMainDetail("${pageContext.request.contextPath}",ctId,id);
				    ctId=parseInt(ctId);
				    $.getFileInfo("${pageContext.request.contextPath}","modelName=adviceCollect&modelId="+ctId);
				    
	            	
	            	
		            $("#createTime").val(new Date().getTime());
		            $.ajax({
		            	 async:false,
		            	url:"${pageContext.request.contextPath}/ca/getCookies",
		            	type: 'post',
// 		            	cache:false,
		           		dataType : 'json',
		           		data:{},
		           		success: function (data) {
		           				if(data!=null){
		           					$("#suggester").val(data.userName);
		           					$("#loginName").val(data.loginName+data.deptId);
		           					$("#deptName").val(data.deptName);
		           					$("#deptId").val(data.deptId);
		           				}
		           		}
		            });
		            
		            
		            $("#btnSubmit").click(function () {
		                $("#dialog-confirm").dialog({
		                    resizable: false,
		                    height: 140,
		                    width: 200,
		                    modal: true,
		                    buttons: {
		                        "确认": function () {
		                            var info = $.validateForm();
		                            
		                            if (info != "") {
		                                alert(info + "\r\n请您修改");
		                                $(this).dialog("close");
		                                return false;
		                            }
		                            var otherData = "";
		                            if (QueryString.GetValue('id') != null) {
		                                otherData += "&id=" + QueryString.GetValue('id');
		                            }
		                            $.postSaveMain("${pageContext.request.contextPath}", "actSuggestionForm", otherData, "/actSuggestion/actSuggestionEdit");
		                            $(this).dialog("close");
		                            $("#btnSubmit").attr("disabled",true);
		                            alert("操作成功！");
		                        },
		                        "取消": function () {
		                            $(this).dialog("close");
		                        }
		                    }
		                });
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
<!--                 	<li><a href="#">首页</a></li> -->
                	<li><a >意见征集</a></li>
                	<li class="fin">提出意见</li>
                </ul>
            </div>
           
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        
        <!--Filter-->
         <div class="filter">
            <div class="fn clearfix">
            	<h5 class="fl"><a  class="colSelect fl">提出意见</a></h5>
            </div>
         </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<form id="actSuggestionForm">
        	<table width="100%"  class="table_1">
                              <tbody>
                              <tr>
                                <td class="t_r lableTd">征集名称</td>
                                <td colspan="3"><label name="name" id="name"></label></td>
                                <td></td>
                                <td></td>
                              </tr>
                              
                              <tr>
                                <td class="t_r lableTd">意见类别</td>
                                <td>
                                	<select id="colCategory" name="colCategory" class="input_large" disabled="disabled">
                                		<option value="">请选择</option>
                                		<option value="partyCategory">党群类</option>
                                		<option value="manageCategory">管理类</option>
                                		<option value="technologCategory">技术类</option>
                                		<option value="specialCategory">专题类</option>
                                	</select>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
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
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">征集内容</td>
                                <td colspan="3"><label id="themecontent" name="themecontent"></label></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">意见内容</td>
                                <td colspan="3"><textarea id="content" name="content" rows="5" placeholder=""></textarea></td>
                                <td></td>
                                <td></td>
                              </tr>
                             
                              
                              </tbody>
                              
                            </table>
                            	<input type="hidden" name="ctId" id="ctId">
                                <input type="hidden" name="suggester" id="suggester">
                                <input type="hidden" name="loginName" id="loginName">
                                <input type="hidden" name="deptName" id="deptName" >
                                <input type="hidden" name="deptId" id="deptId"  >
                                <input type="hidden" name="createTime" id="createTime" >
                                
                                
                </form>                
               <div class="mb10 t_c"  >
                          <table width="100%" class="table_1">
                            <tr><td class=" t_c">
                            <input type="button" id="btnSubmit" value="提 交" />&nbsp;
							<input type="button" id="btnClose" value="返 回" />&nbsp; 
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
