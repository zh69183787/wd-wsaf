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
		<title>统计</title>
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
		<script src="js/qteMainStatistics.js"></script>
		<script src="js/highcharts.js"></script>
		<style>
				    .table_{
						background:#fff;
						
			    	}
			    	.table_ td{
			    		border: solid #ddd 1px;
			    		width:30px;
			    		text-align:center;
			    	}
			    	 .table_ tr{ 
				    	 height:25px; 
				    	 line-height:25px; 
			    	}
			    	.table_ .tit{
			    		width:200px;
			    		text-align:left;
			    	}
			    	.table_ .num{
			    		width:40px;
			    	}
			    	.table_2{
						background:#fff;
						
			    	}
			    	.table_2 td{
			    		border: solid #ddd 1px;
			    		width:30px;
			    		text-align:center;
			    	}
			    	 .table_2 tr{ 
				    	 height:25px; 
				    	 line-height:25px; 
			    	}
			    	.table_2 .tit{
			    		text-align:left;
			    	}
			    	.table_2 .num{
			    		width:10px;
			    	}
		</style>
		<script type="text/javascript">
			$(document).ready(function () {
	           $("#btnClose").click(function () {
	                window.opener = null;
	                window.open('', '_self');
	                window.close();
	            });
	            
	             var mainId = "${id}";
	             mainId = parseInt(mainId);
	             var title = "";
	            $.ajax({
	            	async:false,
					url:"${pageContext.request.contextPath}/basicCrud/qteMain/get/"+mainId,
					type:"post",
					dataType:"json",
					success :function(data){
						if(data.success==true){
							title = data.result.title;
						}
					}
	            });
	            $("#pieTitle").html(title+"填报人所在部门汇总百分比");
	            $("#opt").html(title+"选项选择数目汇总表");
	            $("#opPer").html(title+"选项汇总百分比表");
	            
		        var time = new Date();  
	            var hour = time.getHours();
	            $("#time").append(time.Format("yyyy-MM-dd")+"  "+hour+":00:00");
	            
	           
	            
				$.getDeptHeader("${pageContext.request.contextPath}",mainId);
				$.getQuestion("${pageContext.request.contextPath}",mainId);
				$.getPieStatictis("${pageContext.request.contextPath}",mainId);
				
				
				$.getTotalCount("${pageContext.request.contextPath}",mainId);
				$.getRadioOption("${pageContext.request.contextPath}",mainId);
				$.getMultiChoiceOption("${pageContext.request.contextPath}",mainId);
				
        	});
		</script>

</head>

<body class="Flow">
<div class="f_bg">
      <!--Panel_6-->	
        <div class="Divab1">
        	<!--1st-->
            
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
                    	    <h1 class="t_c"></h1>
                            <div class="mb10 Step"></div>
                            <h1 class="t_c" id="pieTitle"></h1>
                            <div class="mb10" id="pie" ></div>
                            <div class="mb10">
                            <h1 class="t_c" id="opt"></h1>
		                            <table width="100%"    class="table_">
		                            </table>
                            
                           	
                             </div>
                             <div class="mb10">
                              <h1 class="t_c" id="opPer"></h1>
		                            <table width="100%"  class="table_2">
		                            	<tr><td colspan="9" class="tit" >截止：<label id="time"></label>   填报总数：<label id="count"></label> </td></tr>
		                            	<tr>
		                            	    <td>序号</td>
		                            		<td>项目</td>
		                            		<td>百分比</td>
		                            		<td>项目</td>
		                            		<td>百分比</td>
		                            		<td>项目</td>
		                            		<td>百分比</td>
		                            		<td>项目</td>
		                            		<td>百分比</td>
		                            	</tr>
		                            	
		                            	
		                            </table>
                            
                           	
                             </div>
                           
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
    </div>
</body>
</html>
