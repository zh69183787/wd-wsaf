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
		<title>反馈</title>
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
		<script type="text/javascript">
		    $(function(){
		    		
				    var id="${id}";
				    $("#id").val(id);
				    
				    id=parseInt(id);
			        $.ajax({
			            
			            url: "<%=basePath%>basicCrud/actSuggestion/get/" + id,
			            dataType :'json',
			            type: 'post',
			            success: function (data, status, xhr) {
			
			                if (status == "success" && data != null) {
			                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
			                        var entry = data.result;
			                         $("#fbTitle").val(entry.fbTitle);
			                         $("#fbContent").val(entry.fbContent);
			                    }
			                    if(entry.id !=null){
			                    	$("#id").val(entry.id);
			                    }
			                }
			            },
			            error: function () {
			                alert("对不起！你的请求出现异常，请联系服务人员！");
			            }
			        });
	            	
		            $("#fbCreateTime").val(new Date().getTime());
		           
		            $.ajax({
		            	url:"${pageContext.request.contextPath}/ca/getCookies",
		            	type: 'post',
// 		            	cache:false,
		           		dataType : 'json',
		           		data:{},
		           		success: function (data) {
		           				if(data!=null){
		           					$("#fbName").val(data.userName);
		           					$("#fbLoginName").val(data.loginName+data.deptId);
		           					$("#fbDeptName").val(data.deptName);
		           					$("#fbDeptId").val(data.deptId);
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
		                            var info = $.validatefbForm();
		                            
		                            if (info != "") {
		                                alert(info + "\r\n请您修改");
		                                $(this).dialog("close");
		                                return false;
		                            }
		                            var otherData = "";
		                            if (QueryString.GetValue('id') != null) {
		                                otherData += "&id=" + QueryString.GetValue('id');
		                            }
		                            $.postSaveMain("${pageContext.request.contextPath}", "actSuggestionForm", otherData, "");
		                            $(this).dialog("close");
		                            alert("反馈成功！");
		                            $("#btnSubmit").attr("disabled",true);
		                        },
		                        "取消": function () {
		                            $(this).dialog("close");
		                        }
		                    }
		                });
		            });
		            $("#btnClose").click(function () {
		                if(confirm('确定离开吗？')){
// 		                	 window.opener = null;
// 			                window.open('', '_self');
// 			                window.close();
		                	 $(this).dialog("close");
//                             history.back();
		                }
		               
		            });
		    
		    });
            
		</script>
</head>

<body>
	<div class="main">
        <!--Filter-->
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
            <form id="actSuggestionForm" >
        	<table width="100%"  class="table_1">
                              <tbody>
                              <tr>
                                <td class="t_r lableTd">反馈标题</td>
                                <td colspan="3"><input class="input_full" type="text" id="fbTitle" name="fbTitle"  /></td>
                              </tr>
                              
                              <tr>
                                <td class="t_r lableTd">详细内容</td>
                                <td colspan="3"><textarea id="fbContent" name="fbContent" rows="10" placeholder=""></textarea></td>
                              </tr>
                              </tbody>
                              
            </table>
            					<input type="hidden" name="id" id="id" />
                                <input type="hidden" name="fbName" id="fbName">
                                <input type="hidden" name="fbLoginName" id="fbLoginName">
                                <input type="hidden" name="fbDeptName" id="fbDeptName">
                                <input type="hidden" name="fbDeptId" id="fbDeptId" >
                                <input type="hidden" name="fbCreateTime" id="fbCreateTime"  >
            </form>
            <div class="mb10 t_c"  >
                          <table width="100%" class="table_1">
                            <tr><td class=" t_c">
                            <input type="button" id="btnSubmit" value="提 交" />&nbsp;
<!-- 							<input type="button" id="btnClose" value="返 回" />&nbsp;  -->
							
							</td></tr>
						  </table>
			   </div>

      </div>
        <!--Table End-->
    	<div id="dialog-confirm" title="" style="display:none">确认提交吗？</div>
</div>
</body>
</html>
