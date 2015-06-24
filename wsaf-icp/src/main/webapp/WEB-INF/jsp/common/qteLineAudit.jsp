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
		<title>问卷信息</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/formalize.css" />
		<link rel="stylesheet" href="css/page.css" />
		<link rel="stylesheet" href="css/default/imgs.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
		<style>
			td.a a, div.a a{
			display:inline;
			}
			.cz a{
				display:inline;
			}
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
			  background:#8DC11F;
			}
		</style>
		<!--[if IE 6.0]>
           <script src="js/iepng.js" type="text/javascript"></script>
           <script type="text/javascript">
                EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
           </script>
       <![endif]-->
		<script src="js/html5.js"></script>
		<script src="js/jquery-1.7.1.min.js"></script>
		<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script src="js/qteLineAudit.js"></script>
		<script src="js/jquery.formalize.js"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				var mainId = "${mainId}";
				$.getMainName("${pageContext.request.contextPath}",mainId);
				$.getGroupByMainId("${pageContext.request.contextPath}",mainId);
				
				$("#closeBtn").click(function(){
					window.opener = null;
	                window.open('', '_self');
	                window.close();
				
				});
				
				$(":checkbox").attr("disabled",true);
				$(":radio").attr("disabled",true);
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
                <div class="more_4"><a title="更多">更多</a></div>
              </div>
              <div class="divH">
                <div class="divB">
                	<h5 class="clearfix">相关操作</h5>
                	<div class="con">
						<ul class="button clearfix">
                        	<li><a target="_blank" style=" cursor :pointer;" id="addQuestion" href="<%=basePath%>qteComplexInfo/lineAudit?mainId=${mainId}" class="imp">问卷审核</a></li>
                        	<li><a target="_blank" style=" cursor :pointer;" id="closeBtn"  >返回</a></li>
                        </ul>
                	</div>
                </div>
                <div class="divF"></div>
              </div>
            </div>
            <!--1st End-->
            <!--2nd-->
            <div class="panel_6">
            </div>
            <!--2nd End-->
        </div>
      <!--Panel_6 End-->	
<!--         <div class="t_num"> -->
<!--             <ul> -->
<!--                <li class="not" >导航栏</li> -->
<!--                <li ><span class="">1</span></li> -->
<!--                <li >2</li> -->
<!--                <li >3</li> -->
<!--                <li >4</li> -->
<!--                <li >5</li> -->
<!--                <li >6</li> -->
<!--             </ul> -->
<!--         </div> -->
    	<div class="logo_1"></div>
        <div class="gray_bg">
        	<div class="gray_bg2">
            	<div class="w_bg">
                	<div class="Bottom">
                    	<div class="Top">
                        	<h1 class="t_c" id="mTitle"></h1>
                            <div class="mb10 Step"></div>
                            <div class="mb10">
                             <div style="margin-right:100px" class="mainQuest">
<!--                            	  <div class="L_08"><h4>思想作风</h4></div> -->
<!-- 	                           	  <div class="m10" class="question"> -->
<!-- 			                           	  <div class="pl18 pt10 mlr10 mb10 "> -->
<!-- 			                           	       <label class="plr8 num " >1</label > -->
<!-- 			                           	       <label class="ml_5">服务态度：执行首问责任制，服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度热情诚恳，解答问题细致周到。</label> -->
<!-- 			                           	       <div class="pl18 pt10 mlr10" class="radioAnswer" > -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="checkbox" name="a" value="A">A.很满意</label> -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="n" value="B">B.满意</label> -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="b" value="C">C.一般</label> -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="m" value="D">D.不满意</label> -->
<!-- 			                           	       </div> -->
<!-- 			                           	       <div class="t_r cz"> -->
<!-- 			                           	            <a class="m6" href="#">修改</a>|<a class="m6" href="#">删除</a>|<a class="m6" href="#">详情</a> -->
<!-- 			                           	       </div> -->
<!-- 			                           	  </div> -->
<!-- 	                            	</div> -->
<!-- 	                           	<div class="m10"> -->
<!-- 			                           	  <div class="pl18 pt10 mlr10 mb10"> -->
<!-- 			                           	       <label class="plr8 num " >1</label > -->
<!-- 			                           	       <label class="ml_5">服务态度：执行首问责任制，服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度热情诚恳，解答问题细致周到。</label> -->
<!-- 			                           	       <div class="pl18 pt10 mlr10" > -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="an" value="A">A.很满意</label> -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="an" value="B">B.满意</label> -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="an" value="C">C.一般</label> -->
<!-- 			                           	          <label class="pl18" ><input class="pl18" type="radio" name="an" value="D">D.不满意</label> -->
<!-- 			                           	       </div> -->
<!-- 			                           	       <div class="t_r cz"> -->
<!-- 			                           	            <a class="m6" href="#">修改</a>|<a class="m6" href="#">删除</a>|<a class="m6" href="#">详情</a> -->
<!-- 			                           	       </div> -->
<!-- 			                           	  </div> -->
<!-- 	                           	</div> -->
<!-- 	                           	<div class="m10"> -->
<!-- 		                           	  <div class="pl18 pt10 mlr10 mb10"> -->
<!-- 		                           	       <label class="plr8 num " >1</label > -->
<!-- 		                           	       <label class="ml_5">服务态度：执行首问责任制，服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度服务态度热情诚恳，解答问题细致周到。</label> -->
<!-- 		                           	       <div class="pl18 pt10 mlr10" > -->
<!-- 		                           	          <textarea id="" name="" rows="3" placeholder=""></textarea> -->
<!-- 		                           	       </div> -->
<!-- 		                           	       <div class="t_r cz"> -->
<!-- 		                           	            <a class="m6" href="#">修改</a>|<a class="m6" href="#">删除</a>|<a class="m6" href="#">详情</a> -->
<!-- 		                           	       </div> -->
<!-- 		                           	  </div> -->
<!-- 	                           	</div> -->
                           	</div> 
                          </div>
<!--                           <div class="mb10 t_c"> -->
<!--                               <input type="button" id="submitBtn" value="保存提交" />&nbsp; -->
<!--                               <input type="button" id="closeBtn" value="关闭" />&nbsp; -->
<!--                           </div> -->
                            <div class="footer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>