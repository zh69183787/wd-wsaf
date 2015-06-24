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
		<title>查看问题</title>
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
		<script src="js/qteQuestion.js"></script>
		<script>
		    $(function(){
		    
		        var mainId = "${mainId}";
			    $("#mainId").val(mainId);
// 				alert(mainId);
				$.getMainNameForAdd("${pageContext.request.contextPath}",mainId);
				$.getGroup("${pageContext.request.contextPath}",mainId);
				var quId = "${quId}";
			    $("#quId").val(quId);
// 				alert(quId);
				$.getQueDetailById("${pageContext.request.contextPath}",quId);
				
		        
		        $("#quesType").change(function(){
		        	var qtype=$(this).val();
		        	if(qtype=="radio"){
		        		$(".double,.wenda").hide();
// 		        		$(".double,.wenda").attr("disabled",true);
		        		$(".singel").show();
// 		        		$(".singel").attr("disabled",false);
		        		 $.getRaOptionDetail("${pageContext.request.contextPath}",quId);
		        	}else if(qtype=="multiChoice"){
		        		$(".singel,.wenda").hide();
// 		        		$(".singel,.wenda").attr("disabled",true);
		        		$(".double").show();
// 		        		$(".double").attr("disabled",false);
		        		$.getMultiChoiceOptionDetail("${pageContext.request.contextPath}",quId);
		        	}else if(qtype=="fill"){
		        		$(".singel,.double").hide();
// 		        		$(".singel,.double").attr("disabled",true);
		        		$(".wenda").show();
// 		        		$(".wenda").attr("disabled",false);
		        	}else if(qtype=="ques"){
		        		$(".singel,.double").hide();
// 		        		$(".singel,.double").attr("disabled",true);
		        		$(".wenda").show();
// 		        		$(".wenda").attr("disabled",false);
		        	}
		        	
		        }).change();
// 		        $.getMultiChoiceOptionDetail("${pageContext.request.contextPath}",quId);
// 			    $.getRaOptionDetail("${pageContext.request.contextPath}",quId);
			    
				
            
					$("#btnClose").click(function () {
		                window.opener = null;
		                window.open('', '_self');
		                window.close();
		            });
		            
		            $(":select").attr("disabled",true);
		            $(":input").attr("disabled",true);
		            $(":textarea").attr("disabled",true);
            
		    
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
                	<li><a >问题管理</a></li>
                	<li class="fin">查看问题</li>
                </ul>
            </div>
           
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        
        <!--Filter-->
        <div class="filter">
            <div class="fn clearfix">
            	<h5 class="fl"><a class="colSelect fl">查看问题</a></h5>
            </div>
        </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
          <form id="qteQuestionForm" >
        	<table width="100%"  class="table_1">
                              <tbody>
                              <tr>
                                <td class="t_r lableTd">题类型</td>
                                <td>
                                	<select name="quesType" id="quesType" class="input_large" disabled="disabled">
                                		<option value="radio">单选题</option>
                                		<option value="multiChoice">多选题</option>
                                		<option value="fill">问答题</option>
                                		<option value="ques">填写题</option>
                                	</select>
                                </td>
                                <td class="t_r lableTd">题号</td>
                                <td><input type="text" id="quesOrders" name="quesOrders" placeholder="输入题号" disabled="disabled" /></td>
                                <td class="t_r lableTd">是否显示题号</td>
                                <td>
                                	<select name="isDisplay" id="isDisplay" class="input_large" disabled="disabled">
                                		<option value="true">显示</option>
                                		<option value="false">隐藏</option>
                                	</select>
                                </td>
                                </tr>
                              <tr>
                                <td class="t_r lableTd">所属问卷</td>
                                <td colspan="3"><label id="title" name="title" ></label></td>
                                <td class="t_r lableTd">所属分组</td>
                                <td>
                                	<select name="groupId" id="groupId" class="input_large" disabled="disabled">
                                	</select>
                                </td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">题干内容</td>
                                <td colspan="3"><textarea disabled="disabled" id="quesContent" name="quesContent" rows="3" placeholder="This is an example of HTML5 placeholder text."></textarea></td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="singel sItem" >
                                <td rowspan="4" class="t_r">
                                	 单选题 答案设置<br/>
<!--                                    <input class="singel" type="submit" name="button2" id="button2" value="增加选项" > -->
                                </td>
                                <td class="t_c lableTd">
                                	<label class="pl18 pt10 mlr10 mb10">选项A</label> 
                                	<input class="pl18 pt10 mlr10 mb10 singel" disabled="disabled" type="radio" id="code" name="code" value="A" />
                                </td>
                                <td colspan="2" class="t_l lableTd">
                                	<textarea class="singel" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="rid" />
<!--                                 	<a  >移除</a> -->
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="singel  sItem">
                                <td class="t_c ">
                                	<label class="pl18 pt10 mlr10 mb10">选项B</label> 
                                	<input class="pl18 pt10 mlr10 mb10 singel" disabled="disabled" type="radio" id="code" name="code"  value="B" />
                                </td>
                                <td colspan="2" class="t_l ">
                                	<textarea class="singel" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="rid" />
<!--                                 	<a  >移除</a> -->
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="singel  sItem">
                                <td class="t_c lableTd">
                                	<label class="pl18 pt10 mlr10 mb10 singel">选项C</label> 
                                	<input class="pl18 pt10 mlr10 mb10 singel"  disabled="disabled" type="radio" id="code" name="code"  value="C" />
                                </td>
                                <td colspan="2" class="t_l lableTd">
                                	<textarea class="singel" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="rid" />
<!--                                 	<a  >移除</a> -->
                                	
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="singel sItem">
                                <td class="t_c ">
                                	<label class="pl18 pt10 mlr10 mb10 singel">选项D</label> 
                                	<input class="pl18 pt10 mlr10 mb10 singel" disabled="disabled" type="radio" id="code" name="code"  value="D" />
                                </td>
                                <td colspan="2" class="t_l ">
                                	<textarea class="singel" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="rid" />
<!--                                 	<a  >移除</a> -->
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              
                              
                              <tr class="double dItem">
                                <td rowspan="4" class="t_r">
                                                                                                        多选题答案设置<br/>
<!--                                    <input type="submit" class="double"  name="button2" id="button2" value="增加选项" > -->
                                </td>
                                
                                
                                <td class="t_c lableTd">
                                	<label class="pl18 pt10 mlr10 mb10">选项A</label> 
                                	<input class="pl18 pt10 mlr10 mb10 double"  disabled="disabled" type="radio"  id="code" name="code"  value="A" />
                                </td>
                                <td colspan="2" class="t_l lableTd">
                                	<textarea class="double" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="mid" />
<!--                                 	<a  >移除</a> -->
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="double dItem">
                                <td class="t_c ">
                                	<label class="pl18 pt10 mlr10 mb10">选项B</label> 
                                	<input class="pl18 pt10 mlr10 mb10 double" disabled="disabled" type="radio"  id="code" name="code"  value="B" />
                                </td>
                                <td colspan="2" class="t_l ">
                                	<textarea class="double" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="mid" />
<!--                                 	<a  >移除</a> -->
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="double dItem">
                                <td class="t_c lableTd">
                                	<label class="pl18 pt10 mlr10 mb10">选项C</label> 
                                	<input class="pl18 pt10 mlr10 mb10 double" disabled="disabled" type="radio"  id="code" name="code"  value="C" />
                                </td>
                                <td colspan="2" class="t_l lableTd">
                                	<textarea class="double" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="mid" />
<!--                                 	<a  >移除</a> -->
                                	
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              <tr class="double dItem">
                                <td class="t_c ">
                                	<label class="pl18 pt10 mlr10 mb10">选项D</label> 
                                	<input class="pl18 pt10 mlr10 mb10 double" disabled="disabled" type="radio"   id="code" name="code"  value="D" />
                                </td>
                                <td colspan="2" class="t_l ">
                                	<textarea class="double" disabled="disabled" id="value" name="value" rows="2" placeholder=""></textarea>
                                	<input type="hidden" id="mid" />
                                	<a  >移除</a>
                                </td>
                              	<td></td>
                                <td></td>
                              </tr>
                              
                              <tr class="wenda">
                                <td class="t_r ">答案设置</td>
                                <td colspan="3"><textarea class="wenda" disabled="disabled" id="rightAnswer" name="rightAnswer" rows="3" placeholder=""></textarea></td>
                              	<td></td>
                                <td></td>
                              </tr>
                              
                              
<!--                               <tr class="tianxie"> -->
<!--                                 <td class="t_r  ">答案设置</td> -->
<!--                                 <td colspan="3"><input class="tianxie" disabled="disabled" class="input_full" type="text" id="rightAnswer" name="rightAnswer"  /></td> -->
<!--                                 <td></td> -->
<!--                                 <td></td> -->
<!--                               </tr> -->
                              
                              
                              <tr>
                                <td class="t_r lableTd">备注</td>
                                <td colspan="3"><textarea disabled="disabled" id="remark" name="remark" rows="3" placeholder=""></textarea></td>
                              	<td></td>
                                <td></td>
                              </tr>
                              </tbody>
                              
                            </table>
                            <input type="hidden" id="mainId" name="mainId" />
                            <input type="hidden" id="id" name="id" />
              </form>
              <div class="mb10 t_c"  >
                          <table width="100%" class="table_1">
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