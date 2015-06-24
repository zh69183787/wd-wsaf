<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>专项填写</title>
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
    $(function() {
    	QueryString.Initial();
    	var projectId = QueryString.GetValue("id");
    	$("[name=projectId]").val(projectId);
    	
    	var annualId = QueryString.GetValue("annualId");
    	
    	$("[name=annualId]").val(annualId);
   	    $("#addbtn").click(function(){
   	    	var _yanz=$.yanzhenOrganList();
    		if(_yanz!=""){
 		       alert(_yanz+"\r\n请修改");
 		       $( this ).dialog( "close" );
 		       return false;
 		    }
    		  var otherData = "";	
    		  if($("[name=projectId]").val()!=""&&$("[name=projectId]").val()!=null){
    			  otherData += "&id="+$("[name=projectId]").val();
    		  }
   		      var projectId = $.postsaveproject("${pageContext.request.contextPath}","projectPlanForm",otherData);
   		      if($("[name=projectId]").val()==""||$("[name=projectId]").val()==null){
   		    	  $("[name=projectId]").val(projectId);
   		      }
   		      window.open("/iims/annualCost/specialService?projectId="+projectId);          
   		    });
   	    
   	  $("#btnSubmit").click(function(){
   		window.close();
		location.href = Url+ "/annualCost/annualCostAddService";
   	  });
   	  
	  $.getListDetail("${pageContext.request.contextPath}");
	  
	  if($("[name=projectId]").val()!=""&&$("[name=projectId]").val()!=null){
  		
  		var projectId = $("[name=projectId]").val();
  		$.postSearchFormSpecial("${pageContext.request.contextPath}","&projectId="+projectId);
  		$.postprojectCostDetail2("${pageContext.request.contextPath}",projectId); 	
  	}
	  
	  
	  window.onfocus = function(){
		  if($("[name=projectId]").val()!=""&&$("[name=projectId]").val()!=null){
		  		
		  		var projectId = $("[name=projectId]").val();
		  		$.postSearchFormSpecial("${pageContext.request.contextPath}","&projectId="+projectId);
				  	
		  	}
      };
      
	  $("[name=closebtn]").click(function(){
		window.close();
	  });
   });
    function del(id){
    	if(!confirm("确认要删除？")){ 
			window.event.returnValue = false;
			return false;
			}
		$.postDeleContractCost("${pageContext.request.contextPath}",id);
		var projectId = $("[name=projectId]").val();
		$.postSearchFormSpecial("${pageContext.request.contextPath}","&projectId="+projectId);
	};
</script>
  
</head>

<body class="Flow">
	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>信息管理</a></li>
                      <li><a>日常管理</a></li>
                	  <li class="fin">合同管理</li>
                    </ul>
                  </div>
   		    </div>
   	<form id="projectPlanForm"> 
      <div class="pt45">
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      <td colspan="10" class="t_c">
                       	<div class="red"> *</div>项目名称<input type="text" class="input_large"  name="projectName"  />&nbsp;
                       	<div class="red"> *</div>预算金额<input type="text" class="input_large" name="budget"  />
                       		 <input type="hidden" class="input_large" name="annualId"  />
                       		 <input type="hidden" class="input_large" name="projectId"  />
                       		 <input  type="hidden" class="input_large" name="applyer" />
                  			 <input  type="hidden" class="input_large" name="applyerLoginname" />
                  			 <input  type="hidden" class="input_large" name="applyTime" 
                  			   value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                       </td>
                      </tr>
                    </table>
            </div>
        </div>
         
        <div class="fn clearfix" >
           <!--xinxi-->
           <div>
             <input type="button" id="addbtn" value="新 增" >
             </div>
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">编号</span></a></td>
                       <td class="sort"><a ><span class="fl">合同名称</span></a></td>
                       <td class="sort"><a ><span class="fl">计划签订时间</span></a></td>
                       <td class="sort"><a ><span class="fl">合同金额</span></a></td>   
                       <td class="sort"><a ><span class="fl">已支付</span></a></td>
                       <td class="sort"><a ><span class="fl">未支付</span></a></td>
                       <td class="sort"><a ><span class="fl">支付率</span></a></td>
                       <td class="sort"><a ><span class="fl">计划预付款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际预付款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划进度款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际进度款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划验收款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际验收款</span></a></td>
                       <td class="sort"><a ><span class="fl">计划质保款</span></a></td>
                       <td class="sort"><a ><span class="fl">实际质保款</span></a></td>
                       <td class="sort"><a ><span class="fl">执行情况说明</span></a></td>
                       <td class="sort"><a ><span class="fl">操作栏</span></a></td>
                   </tr>
                 </tbody>
           </table>
      </div>
        <!--Table End-->
     </div>
     <div class="mb10 t_c">
       <input type="button" id="btnSubmit" value="保 存" /> &nbsp;
       <input type="button" name="closebtn" value="关 闭" /> &nbsp;
     </div>
     </form>
</div>
</body>
</html>
