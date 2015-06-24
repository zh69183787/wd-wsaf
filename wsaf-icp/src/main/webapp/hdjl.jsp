<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
		<head>
		<meta charset="utf-8" />
		<title>首页</title>
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
		<script type="text/javascript">
$(function(){
				$('#datepicker').datepicker({
					inline: true
				});
			});
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
        </script>
		</head>

		<body onLoad="MM_preloadImages('images/hover_13.png','images/hover_07.png','images/hover_14.png','images/hover_05.png','images/hover_12.png','images/hover_03.png')">
        <div class="main mw1070"> 
          <!--Ctrl-->
          <div class="ctrl clearfix">
            <div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl">
              <ul>
                <li><a href="javascript:window.location.href='/portal/center/xwzx/xw_index.jsp'">互动交流平台</a></li>
                <li class="fin">首页</li>
              </ul>
            </div>
            <div class="fr lit_nav">
              <ul>
                <li class="selected"><a class="print" href="#">打印</a></li>
                <li><a class="storage" href="#">网络硬盘</a></li>
                <li><a class="rss" href="#">订阅</a></li>
                <li><a class="chat" href="#">聊天</a></li>
                <li><a class="query" href="#">查询</a></li>
              </ul>
            </div>
          </div>
          <!--Ctrl End-->
          <div class="clearfix pt45"> 
          	<ul class="w1280 clearfix">
            	<li class="w33p fl mb10"><a href="<%=basePath%>qteUserAnswer/qteUserAnswerList" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','images/hover_13.png',1)"><img src="images/idle_13.png" alt="问卷调查" width="357" height="208" id="Image2"></a></li>
            	<li class="w33p fl mb10"><a href="<%=basePath%>cpqQuestion/toQuestionList" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','images/hover_07.png',1)"><img src="images/idle_07.png" alt="网上测评" width="357" height="208" id="Image3"></a></li>
            	<li class="w33p fl mb10"><a href="<%=basePath%>actSuggestion/actSuggestionList" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','images/hover_14.png',1)"><img src="images/idle_14.png" alt="意见征集" width="357" height="208" id="Image4"></a></li>
            	<li class="w33p fl mb10"><a href="http://10.1.14.20:8088/portal/jeecms/findByPage.action?channelId=2572" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','images/hover_05.png',1)"><img src="images/idle_05.png" alt="问题解答" width="357" height="208" id="Image5"></a></li>
            	<li class="w33p fl mb10"><a href="<%=basePath%>cptComplaint/cptComplaintSave" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','images/hover_12.png',1)"><img src="images/idle_12.png" alt="信访" width="357" height="208" id="Image6"></a></li>
            	<li class="w33p fl t_c mb10"><a href="<%=basePath%>qteComplexInfo/interaction" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','images/hover_03.png',1)"><img src="images/idle_03.png" alt="我的" width="357" height="208" id="Image7"></a></li>
            </ul>
          </div>
        </div>
</body>
</html>
