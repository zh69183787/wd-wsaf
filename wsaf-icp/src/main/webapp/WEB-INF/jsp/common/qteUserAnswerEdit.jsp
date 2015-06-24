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
		<title>答题页面</title>
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
		<script src="js/qteUserAnswer.js"></script>
		<script src="js/jquery.formalize.js"></script>
		<style>
			.t_num{
			   position:absolute;top:250px;left:760px;right:0;width:40px; text-align:center;
			}
			.t_num li{
				margin-bottom:2px;
				background:#d3d3d3;
			}
			.t_num li.answered{
				background:#8DC11F;
				color:#fff;
			}
			.t_num li.not{
				background:#0194D9;
				color:#fff;
			}
			label.num{
			  background:#d3d3d3;
			}
		
		</style>
		
		
		<script type="text/javascript">
				$(document).ready(function(){
			     var mainId = "${mainId}";
				 $.getMainName("${pageContext.request.contextPath}",mainId);
				 $.getGroupByMainId("${pageContext.request.contextPath}",mainId);
				 
				 $.ajax({
		            	url:"${pageContext.request.contextPath}/ca/getCookies",
		            	async:false,
		            	type: 'post',
		            	async: false,
		           		dataType : 'json',
		           		data:{},
		           		success: function (data) {
		           				if(data!=null){
		           					$("#loginName").val(data.loginName+data.deptId);
		           					$("#deptId").val(data.deptId);
		           				}
		           		}
		            });
				 
				 
				 $("#submitBtn").click(function(){
				 	$.saveRadioAnswer("${pageContext.request.contextPath}",mainId);
				 	$.saveMultiChoiceAnswer("${pageContext.request.contextPath}",mainId);
				 	$.saveTextAnswer("${pageContext.request.contextPath}",mainId);
				 	
				 	$.saveUserMain("${pageContext.request.contextPath}",mainId);
				 	
					alert("保存成功！");
					$("#submitBtn").attr("disabled",true);
					$(":checkbox").attr("disabled",true);
				    $(":radio").attr("disabled",true);
				    $(".fill").attr("disabled",true);
				    
				});
				
				$("#closeBtn").click(function(){
					window.opener = null;
	                window.open('', '_self');
	                window.close();
				
				});
				
				});
		
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
                <div class="more_4"><a  title="更多">更多</a></div>
              </div>
              <div class="divH">
                <div class="divB">
                	<h5 class="clearfix">相关操作</h5>
                	<div class="con">
						<ul class="button clearfix">
                        	<li><a  class="imp">提交保存</a></li>
                        	<li><a  class="tips">小提示</a></li>
                        </ul>
                	</div>
                </div>
                <div class="divF"></div>
              </div>
            </div>
            <!--1st End-->
            
        </div>
      <!--Panel_6 End-->	
        <div class="t_num">
            <ul>
               <li class=" not" >未选择</li>
               <li class="" >1</li>
               <li >2</li>
               <li >3</li>
               <li >4</li>
               <li >5</li>
               <li >6</li>
            </ul>
        </div>
    	<div class="logo_1"></div>
        <div class="gray_bg">
        	<div class="gray_bg2">
            	<div class="w_bg">
                	<div class="Bottom">
                    	<div class="Top">
                        	<h1 class="t_c" id="mTitle"></h1>
                            <div class="mb10 Step"></div>
                            <div class="mb10">
                             <div style="margin-right:100px"  class="mainQuest">
<!--                            	  <div class="L_08"><h4>思想作风</h4></div> -->
<!--                            	  <div class="pl18 pt10 mlr10 mb10"> -->
<!--                            	       <label class="plr8 num " >1</label ><label class="ml_5">服务态度：执行首问责任制，服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度热情诚恳，解答问题细致周到。</label> -->
<!--                            	       <div class="pl18 pt10 mlr10"  > -->
<!--                            	          <label class="pl18" ><input class="pl18" quesId="" type="radio" name="answer" value="optionId">A.很满意</label> -->
<!--                            	          <label class="pl18" ><input class="pl18" quesId="" type="radio" name="answer" value="optionId">B.满意</label> -->
<!--                            	          <label class="pl18" ><input class="pl18" quesId="" type="radio" name="answer" value="optionId">C.一般</label> -->
<!--                            	          <label class="pl18" ><input class="pl18" quesId="" type="radio" name="answer" value="optionId">D.不满意</label> -->
<!--                            	       </div> -->
<!--                            	  </div> -->
<!--                            	  <div class="pl18 pt10 mlr10 mb10"> -->
<!--                            	       <label class="plr8  num" >2</label><label class="ml_5">服务态度：执行首问责任制，服务态度热情诚恳，解答问题细致周到。</label> -->
<!--                            	       <div class="pl18 pt10 mlr10" > -->
<!--                            	          <label class="pl18" ><input class="pl18" type="radio" name="answer" value="A">A.很满意</label> -->
<!--                            	          <label class="pl18" ><input class="pl18" type="radio" name="answer" value="B">B.满意</label> -->
<!--                            	          <label class="pl18" ><input class="pl18" type="radio" name="answer" value="C">C.一般</label> -->
<!--                            	          <label class="pl18" ><input class="pl18" type="radio" name="answer" value="D">D.不满意</label> -->
<!--                            	       </div> -->
<!--                            	  </div> -->
                           	  
                           	</div> 
                          </div>
                          <div class="mb10 t_c"><input type="hidden" id="loginName"/><input type="hidden" id="deptId"/>
                              <input type="button" id="submitBtn" value="提交" />&nbsp;
                              <input type="button" id="closeBtn" value="关闭" />&nbsp;
                          </div>
                            <div class="footer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
