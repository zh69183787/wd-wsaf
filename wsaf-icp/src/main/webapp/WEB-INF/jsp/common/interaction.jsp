<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<title>新闻资讯</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/formalize.css" />
		
		<link rel="stylesheet" href="css/page.css" />
		<link rel="stylesheet" href="css/default/imgs.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<!--[if IE 6.0]>
           <script src="js/iepng.js" type="text/javascript"></script>
           <script type="text/javascript">
                EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
           </script>
       <![endif]-->
       	<script src="js/jquery-1.7.1.js"></script>
        <script src="js/html5.js"></script>     
		<script src="js/jquery.formalize.js"></script>
		<script src="js/index.js"></script>
<!-- 		<script src="js/show.js"></script> -->
<!-- 		<script src="js/wdsw_ajax.js"></script> -->

		<script type="text/javascript">
			
		$(document).ready(function(){ 
			
// 			getLatestNews("40","0");
			
			$.getThemeData("${pageContext.request.contextPath}", "&pageSize=5&pageNum=1");
			$.getQuesData("${pageContext.request.contextPath}", "&pageSize=5&pageNum=1");
			$.getCpqData("${pageContext.request.contextPath}", "pageSize=5&pageNum=1");
			$.getCptData("${pageContext.request.contextPath}", "&pageSize=5&pageNum=1");
		});
		
		</script>
		
</head>

<body>
	<div class="main mw1002">
    	<!--Ctrl-->
		<div class="ctrl clearfix">
        	<div class="fl"><img id="show" onclick="showHide();" src="css/default/images/sideBar_arrow_right.jpg" width="46" height="30" alt="展开"></div>
            <div class="posi fl">
            	<ul>
                	<li><a href="javascript:window.location.href='/portal/center/xwzx/xw_index.jsp'">互动交流平台</a></li>
                	<li class="fin">我的互动</li>
                </ul>
            </div>
            <div style="display:none;" class="fr lit_nav nwarp">
            	<ul>
                    <li class="selected"><a class="print" href="#">打印</a></li>
                    <li><a class="express" href="#">导出数据</a></li>
                    <li class="selected"><a class="table" href="#">表格模式</a></li>
                    <li><a class="treeOpen" href="#">打开树</a></li>
                    <li><a class="filterClose" href="#">关闭过滤</a></li>
                </ul>
            </div>
   		</div>
        <!--Ctrl End-->
         <div class="clearfix pt45">
			<!--Panel_3-->
                <div class="panel_3 m6 fl w49p" style="width:48%;" >
                	<header class="clearfix">
                    	<div class="bg_3 clearfix">
                            <h5 class="fl richeng">我的问卷</h5>
                        </div>
                    </header>
                    <div class="con" style="height:220px">
                        <div class="clearfix" style="height:90%">
                        	<ul class="clearfix wd ques" >
                            </ul>
                            <!--
                            <p class="fr"><a class="more_3" href="#">更多</a></p>
                            <p class="fr down"><a href="#">向下</a></p>
                            <p class="fr up"><a href="#">向上</a></p>
                            -->
                        </div>
                        <p class="fr"><a class="more_3" target="_blank" href="<%=basePath%>qteUserAnswer/qteUserAnswerList">更多</a>
                        <input type="hidden" id="quesPageNum"/><input type="hidden" id="questotalPages"/></p>
                        <p class="fr down"><a href="javascript:void(0);" class="quesnextpage">向下</a></p>
                        <p class="fr up"><a href="javascript:void(0);" class="quesprepage">向上</a></p>
                    </div>
                </div>
                <!--Panel_3 End-->
			<!--Panel_3-->
                <div class="panel_3 m6 fr w49p" style="width:48%;">
                	<header class="clearfix">
                    	<div class="bg_3 clearfix">
                            <h5 class="fl meeting">我的测评</h5>
                        </div>
                    </header>
                    <div class="con" style="height:220px">
                        <div class="clearfix" style="height:90%">
                        	<ul class="columns clearfix  full cpq">
                                
                            </ul>
                            <!--
                            <p class="fr"><a class="more_3" href="#">更多</a></p>
                            <p class="fr down"><a href="#">向下</a></p>
                            <p class="fr up"><a href="#">向上</a></p>
                            -->
                        </div>
                         <p class="fr"><a class="more_3" target="_blank" href="<%=basePath%>cpqQuestion/toQuestionList">更多</a>
                         <input type="hidden" id="cpqPageNum"/><input type="hidden" id="cpqtotalPages"/></p>
                         <p class="fr down"><a href="javascript:void(0);" class="cpqnextpage">向下</a></p>
                         <p class="fr up"><a href="javascript:void(0);"class="cpqprepage" >向上</a></p>
                    </div>
                </div>
                <!--Panel_3 End-->
                <div class="clear"></div>
			<!--Panel_3-->
                <div class="panel_3 m6 fl w49p" style="width:48%;" >
                	<header class="clearfix">
                    	<div class="bg_3 clearfix">
                            <h5 class="fl richeng">我的意见</h5>
                        </div>
                    </header>
                    <div class="con" style="height:220px">
                        <div class="clearfix" style="height:90%">
                        	<ul class="columns clearfix full theme">
                                
                            </ul>
                        </div>
                        <p class="fr"><a class="more_3" target="_blank" href="<%=basePath%>actSuggestion/actSuggestionList">更多</a></p>
                        <p class="fr down"><a href="javascript:void(0);" class="themenextpage">向下</a><input type="hidden" id="themePageNum"/><input type="hidden" id="themetotalPages"/></p>
                        <p class="fr up"><a href="javascript:void(0);" class="themeprepage">向上</a></p>
                    </div>
                </div>
                <!--Panel_3 End-->
			<!--Panel_3-->
                <div class="panel_3 m6 fr w49p" style="width:48%;">
                	<header class="clearfix">
                    	<div class="bg_3 clearfix">
                            <h5 class="fl meeting">我的投诉</h5>
                        </div>
                    </header>
                    <div class="con" style="height:220px">
                        <div class="clearfix" style="height:90%">
                        	<ul class="columns clearfix full cpt">
<!--                                 <li class="clearfix"><a href="#">基础盒模型(Basic box model)基础盒模型(Basic box model)基础盒模型(Basic box model)基础盒模型(Basic box model)</a><span>01-21</span></li> -->
<!--                                 <li class="clearfix"><a href="#">内容(Generated Content)</a><span>01-21</span></li> -->
<!--                                 <li class="clearfix"><a href="#">其它模块(Other modules)</a><span>01-21</span></li> -->
<!--                                 <li class="clearfix"><a href="#">用户界面(User-interface)</a><span>01-21</span></li> -->
<!--                                 <li class="clearfix"><a href="#">边框(Border)</a><span>01-21</span></li> -->
<!--                                 <li class="clearfix"><a href="#">背景(Background)</a><span>01-21</span></li> -->
                            </ul>
                            <!--
                            <p class="fr"><a class="more_3" href="#">更多</a></p>
                            <p class="fr down"><a href="#">向下</a></p>
                            <p class="fr up"><a href="#">向上</a></p>
                            -->
                        </div>
                        <p class="fr"><a class="more_3" target="_blank" href="<%=basePath%>cptComplaint/cptComplaintList">更多</a>
                        <input type="hidden" id="cptPageNum"/><input type="hidden" id="cpttotalPages"/></p>
                        <p class="fr down"><a href="javascript:void(0);" class="cptnextpage">向下</a></p>
                        <p class="fr up"><a href="javascript:void(0);" class="cptprepage">向上</a></p>
                    </div>
                </div>
                <!--Panel_3 End-->     
        </div>
	</div>
</body>
</html>
