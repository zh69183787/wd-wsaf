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
  
        	
        	$.postSearchFormInfoLeader("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
        	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.postSearchFormInfoLeader("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
          	 };
        	$("#searchbtn").click(function(){ 
        	if($("[name=date1]").val()!=""&&$("[name=date2]").val()!=""){
        	if($("[name=date1]").val()>$("[name=date2]").val()){
        			alert("申请使用时间的开始时间大于结束时间 错误！");
        			return false;
        		}
        		}		
				$.postSearchFormInfoLeader("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
        	  
        	$("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
				$.postSearchFormInfoLeader("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			
			$(function() {
	           	    $( "[name=date1]" ).datepicker({ dateFormat:"yy-mm-dd"});
	           	    $( "[name=date2]" ).datepicker({ dateFormat:"yy-mm-dd"});
				  });
				  
			$.postResourceManageDetail = function(firUrl,id){
				 if(firUrl!="")
				   {	
						 $.ajax({
							   async: false,
							    url : firUrl+"/basicCrud/virtualResource/get/"+id,
								type : 'post',
								success: function(data, status, xhr) {
									if (status == "success" && data != null)
									{
										if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
										{
											var entry=data.result;
											 $("[name=btnISPass]").click(function(){
													var _str="",_str2="";
													switch($("input[name=btnISPass]:checked").val())
													{
													case"pass":
														_str="通过。";
														_str2="提交到信息中心管理岗待实施";
														$("#btnSubmit2").val("提交审核");
														break;
														
													case"notPass":
														_str="不通过。";
														_str2="返回信息中心管理岗审核";
														$("#btnSubmit2").val("退回审核");
														break;
													
													}
												  $("[name=suggestion]").val(_str);
												  $("#nextDo").val(_str2);
												  
												});
											  
											  $("#btnSubmit2").click(function(){
												if($("input[name=btnISPass]:checked").val()=="pass")
										         {
													 var otherData="";var d = new Date();
																
														 otherData+="&id="+id+$.getPerson(firUrl)+"&handler=方政&handlerLoginname=G010070003832549&status=waitForImplement";
														 otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
															if($("[name=suggestion]").val().length>50){
															alert("输入意见超过50个字");
															return false;
														}
														$(this).attr("disabled", true);
													//alert(otherData);
								                	$.postsave2(firUrl,"projectPlanForm",otherData);
									                location.reload(true);
								                	 //var d = new Date($("[name=applyTime]").val());
								                	  //$.postsave(firUrl,"projectPlanForm",otherData+"&applyTime="+d.getTime()+"&suggestion="+$("[name=suggestion]").val());
	
										         }else if($("input[name=btnISPass]:checked").val()=="notPass"){
													 var otherData="";
													 var d = new Date();
													 var data=$.getPerson(firUrl);
														otherData+=data+"&handler="+entry.initiator+"&handlerLoginname="+entry.initiatorLoginname+"&status=infoDeptLeaderBack";
								                		otherData+="&id="+id+"&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
								                		if($("[name=suggestion]").val().length>50){
															alert("输入意见超过50个字");
															return false;
														}
														$(this).attr("disabled", true);
								                	  //alert(otherData);
														$.postsave2(firUrl,"projectPlanForm",otherData);
									                	location.reload(true);
													}
											
												else 
													{
													alert("请选择是否通过");
													}
										         });
											
											}
										}
									}
								});
							}
						};
					$("#auditBtn").click(function(){
				  		var a = document.getElementsByName("checkbox");
						var id = "";
						for(var i = 0; i<a.length;i++){
							if(a[i].checked){
								id = a[i].value;
								if($("#"+id).text()=="待信息中心领导审核"){
									$("[name=suggestion]").val("");
			           	           	$("#bt").height($(document).height());
									$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
									$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
									$(".f_window").css("display","block");
									$("#bt").css("display","block");
									$.postResourceManageDetail("${pageContext.request.contextPath}",id);
								}
							}
						}
					});
	        	}); 	

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
                          <option value="infoDeptLeaderBack">信息中心领导退回</option>
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
           	 <input type="button" id="auditBtn" value="批 量 审 核"   style="margin:0 15px">   &nbsp;
             <input type="button" id="oututBtn" value="导 出"   style="margin:0 15px">   &nbsp;
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
