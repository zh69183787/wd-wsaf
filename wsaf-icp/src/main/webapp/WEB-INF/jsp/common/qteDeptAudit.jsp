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
		<script src="js/qteDeptAudit.js"></script>
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
                <div class="more_4"><a  title="更多">更多</a></div>
              </div>
              <div class="divH">
                <div class="divB">
                	<h5 class="clearfix">相关操作</h5>
                	<div class="con">
						<ul class="button clearfix">
                        	<li><a target="_blank" style=" cursor :pointer;" id="addQuestion" href="<%=basePath%>qteComplexInfo/deptAudit?mainId=${mainId}" class="imp">问卷审核</a></li>
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

                           	</div> 
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