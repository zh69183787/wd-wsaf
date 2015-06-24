<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>年度专项项目</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="X-UA-Compatible" content="IE=8" />
	
    <link rel="stylesheet" href="css/formalize.css" />
    <link rel="stylesheet" href="css/page.css" />
    <link rel="stylesheet" href="css/default/imgs.css" />
    <link rel="stylesheet" href="css/reset.css" />
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	
	<script src="js/html5.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.formalize.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/annual.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
	<script type="text/javascript">
	document.write("<script type='text/javascript' "  
	        + "src='<%=request.getContextPath()%>/js/jquery.uploadify-3.1.js?" + new Date()  
	        + "'></s" + "cript>"); 
		
$(function() {
	 $(":text").attr("disabled","disabled");
	 $("select").attr("disabled","disabled");
	 QueryString.Initial();
	 var budgetId = QueryString.GetValue("budgetId");
	 $("[name=budgetId]").val(budgetId);
	
	
     $("#btnSubmit").click(function(){
       	 $("#dialog-confirm P").text("是否提交");
       	 
       	 $( "#dialog-confirm" ).dialog({
                resizable: false,
                height:140,
	         	width:200,
                modal: true,
                buttons: {
                  "确认": function() {
               	   var otherData="";
               	   var _yanz=$.yanzhenProject();
               	   if(_yanz!="")
               		   {
               		   alert(_yanz+"\r\n请修改");
               		   $( this ).dialog( "close" );
               		   return false;
               		   }
               	 
           	   	 $.postsaveSpecialproject("${pageContext.request.contextPath}","projectPlanForm",otherData);
               	   	window.close();
               
                    $( this ).dialog( "close" );
                  },
                  "取消": function() {
                    $( this ).dialog( "close" );
                  }
                }
              }); 
        });
	         
	         
      $.getListDetail("${pageContext.request.contextPath}");
      $("[name=closebtn]").click(function(){
		 window.close();
	  });
      QueryString.Initial();
      if(QueryString.GetValue('id')!=null){
		var id = QueryString.GetValue("id");
  		$.postSpecialProjectDetail("${pageContext.request.contextPath}",id);
	}
});
	</script>
    <style type="text/css">
		#sty{
			margin-left:300px;
		}
		#sty{
			margin-top:30px;
		}
		.taizhang{
			margin-left:500px;
		}
    </style>

</head>

<body class="Flow">

 <div id="bt" class="transparent" style="display:none"></div>

    <div class="f_window" style="display:none">

   	  <h3 class="clearfix mb10"><span class="fl">业务办理</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="con">

        	<table width="100%" border="0" cellspacing="0" cellpadding="0">

              <tr>

                <td class="td_1" colspan="2">业务栏</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td ><div class="red"> *</div>审核意见：<input name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><div class="red"> *</div>意见</td>

              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><textarea  name="suggestion" rows="4" placeholder="请输入意见" ></textarea></td>

              </tr>

              <tr>

                <td class="td_1" colspan="2">操作栏</td>

              
              </tr>

              <tr>

                <td class="td_1">&nbsp;</td>

                <td><textarea   rows="2" id="nextDo" disabled></textarea></td>

              </tr>

              
            </table>

      </div>

      <div class="button t_c">

        	<input type="button" id="btnSubmit2" value="提交审核" />

&nbsp;

<input type="button" id="closebtn" value="取消申报" />

        </div>

    </div>

    <!--Transparent End-->
	<div class="f_bg">

      <!--Panel_6-->	


      <!--Panel_6 End-->	

    	<div class="logo_1"></div>

        <div class="gray_bg">

        	<div class="gray_bg2">

            	<div class="w_bg">

                	<div class="Bottom">

                    	<div class="Top">

                        	 <h1 class="t_c">上海申通地铁集团有限公司<br>年度专项项目</h1>

                            <div class="mb10">
            <form id="projectPlanForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                <thead>
                <th colspan="4" class="f1"> <h5 class="fl">基本信息</h5>
                  </th>
                    </thead>
                <tr>
                	<td class="lableTd t_r"><div class="red"> *</div>项目名称</td>
                    <td> <input  type="text" class="input_large" name="projectName" /></td>
                    <td class="lableTd t_r" ><div class="red"> *</div>项目批复预算</td>
                   <td> <input  type="text" class="input_large" name=repliedBudget /></td>
                </tr>
               
                <tr>
                  <td class="lableTd t_r"><div class="red"> *</div>项目金额</td>
                  <td> <input  type="text" class="input_large" name="projectAmount" /></td> 
                   <td class="lableTd t_r"><div class="red"> *</div>预算批复状态</td>
                  <td>
                  <select class="input_large" name="repliedType" >
                      <option value="" selected>请选择</option>
                      <option value="yes">已批复</option>
                      <option value="no">未批复</option>
                    </select>
                    <input  type="hidden" class="input_large" name="budgetId" />
	                  	<input  type="hidden" class="input_large" name="applyer" />
	                  	<input  type="hidden" class="input_large" name="applyerLoginname" />
	                  	<input  type="hidden" class="input_large" name="applyTime" 
	                  			value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
					</td>    
                </tr>
              
                
              </table>
              </form>
            </div>
            <div class="mb10 t_c">
              &nbsp;
              <input type="button" name="closebtn" value="关 闭" />
              &nbsp;
             
            <div class="footer"></div>
            <div id="dialog-confirm" title="" style="display:none">
                 <p>是否删除</p>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>
