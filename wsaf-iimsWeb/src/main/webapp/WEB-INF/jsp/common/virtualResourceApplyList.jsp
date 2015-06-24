<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>虚拟化资源申请</title>
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
	<script src="js/virtualResource.js"></script>
    <script type="text/javascript">
		 $(document).ready(function () {
		  $(".closewindow").click(function(){
			$(".f_window").css("display","none");
			$("#bt").css("display","none");
		});
  
        	
        	$.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
        	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
          	 };
        	$("#searchbtn").click(function(){ 
        	if($("[name=date1]").val()!=""&&$("[name=date2]").val()!=""){
        	if($("[name=date1]").val()>$("[name=date2]").val()){
        			alert("申请使用时间的开始时间大于结束时间 错误！");
        			return false;
        		}
        		}		
				$.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
        	  
        	$("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
				$.postSearchFormApply("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			
			$(function() {
	           	    $( "[name=date1]" ).datepicker({ dateFormat:"yy-mm-dd"});
	           	    $( "[name=date2]" ).datepicker({ dateFormat:"yy-mm-dd"});
				  });
        	}); 	
		function add(firUrl){
			window.open("/iims/virtualResource/virtualResourceAdd");
		}

		function checkAll($obj) {
			var elms = document.getElementsByName("checkbox");
			for (var i = 0; i < elms.length; i++) {
			elms[i].checked = $obj.checked;
			}
		}
	</script>
  
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
                <td ><div class="red"> *</div>审核意见：<input readonly name="btnISPass" type="radio" value="pass" style="margin-left:20px">通过<input readonly name="btnISPass" type="radio" value="notPass" style="margin-left:10px">不通过</td>
              </tr>
              <tr>
                <td class="td_1">&nbsp;</td>
                <td><div class="red"> *</div>意见</td>
              </tr>
              <tr id="mysug">
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
        	<input readonly type="button" id="btnSubmit2" value="提交审核" />
        </div>
    </div>
	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>资源管理</a></li>
                      <li><a>资源申报</a></li>
                	  <li class="fin">资源申请</li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
		
         
                    <div class="tabs_2">
                        <ul>
                             <li><a href="/iims/netResource/resourceManageList"><span>网络接入</span></a></li>
                            <li><a href="/iims/accountResource/systemAccountList"><span>系统账户申请</span></a></li>
                            <li><a href="/iims/vpnResource/vpnList"><span>VPN访问</span></a></li>
                            <li><a href="/iims/wirelessResource/wirelessNetList"><span>无线网络</span></a></li>
                            <li><a href="/iims/internetResource/internetAccessList"><span>特定互联网访问</span></a></li>
                             <li class="selected"><a ><span>虚拟化资源</span></a></li>
                        </ul>
        			</div>
                
          
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="projectAppform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="t_r">使用人姓名</td>
                      <td><input  type="text"  id="lreportUnit" class="input_large" name="userName"/></td>
                   	  
                    	
                      	
                      	<td class="t_r">申请状态</td>
                      <td><select name="status" class="input_large" >
                          <option value="">请选择</option>
                          <option value="draft">草稿</option>
                          <option value="deptLeaderApproval">待部门领导审核</option>
                          <option value="deptLeaderBack">部门领导退回</option>
                          <option value="infoDeptApproval">待信息中心审核</option>
                          <option value="infoDeptBack">信息中心退回</option>
                          <option value="infoDeptLeaderApproval">待信息中心领导审核</option>
                          <option value="infoDeptLeaderBack">信息中心领导退回</option>
                          <option value="waitForImplement">待实施</option>
                          <option value="finish">处理完毕</option>
                          </select></td>
                     
                     <td class="t_r">申请使用时间</td>
                      <td><input type="text" id="date1" name="date1" />
                        至
                        <input type="text" id="date2" name="date2" /></td>
                    </tr>
                  	<tr>
                         <td class="t_r">申请部门</td>
                      <td><input  type="text"   class="input_large" name="applyDept"/></td>
                       <td class="t_r">所属项目</td>
                      <td><input  type="text"   class="input_large" name="projectName"/></td>
                      
                    </tr>
                    
                      <tr>
                      <td colspan="10" class="t_c">
                       <input type="button"  id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" />
                      </tr>
                    </table>
                </form>
            </div>
        </div>
         
        <div class="fn clearfix">
           <!--xinxi-->
           <div class="fr">
             <input type="button" id="oututBtn" value="导 出"   style="margin:0 15px">   &nbsp;
             <input type="button" id="addbtn" value="新 增"  onclick="add();" >
         </div>
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1">
                <tbody>
                   <tr class="tit">
                       <td class=" t_c"><input type="checkbox" id="checkboxAll" name="checkboxAll" onClick="checkAll(this)"/></td>
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">使用人姓名</span></a></td>
                       <td class="sort"><a ><span class="fl">申请部门</span></a></td>
                       <td class="sort"><a ><span class="fl">所属项目</span></a></td>
                       <td class="sort"><a ><span class="fl">申请状态</span></a></td>
                       <td class="sort"><a ><span class="fl">申请使用时间</span></a></td>   
                       <td class="sort"><a ><span class="fl">操作</span></a></td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>                         
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="10">
                        <div class="clearfix">
                            <span class="fl">当前无记录显示</span>
                            <ul id="page" class="fr clearfix pager">
                              <li>Pages:1/1
                                  <input type="number" id="number" name="number" min="0" max="999" step="1" class="input_tiny" />
                                  <input type="submit" name="button" id="button" value="Go">
                                </li>
                                <li><a href="#">&gt;&gt;</a></li>
                              
                                <li class="selected"><a href="#">1</a></li>
                                <li><a href="#">&lt;&lt;</a></li>
                            </ul>
                        </div>
                                </td>
                              </tr>
           </table>
      </div>
        <!--Table End-->
     </div>
</div>
</body>
</html>
