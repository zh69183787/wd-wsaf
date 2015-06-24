<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>申通地铁集团信息管理中心</title>
<meta charset="utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/formalize.css" />
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/default/imgs.css" />
<link rel="stylesheet" href="css/reset.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/json2.js"></script>
<script src="js/projectPlan.js"></script>
<!-- 

 
<script type="text/javascript">

var SelectObj="",IronMan=false;
var Iframenow=0;
	$(document).ready(function() {
		var obj;
		checkPower();
		
		
		$("#searchbtn").click(function() {
			$("#table_1 tbody").empty();
			$.showObjectOption();
		});
		$("#renewbtn").click(function() {
			$("#searchform tbody input,#searchform tbody select").val("");
			$.showObjectOption();
		});
		
		
		 $("#select_1").change(function() {
		   $("#select_2").empty(); 
		   var a = $("#select_1").val();
		   $("#equipmentNum").val(a);
		  
		   //$("#equipmentNum").value()=$("#select_1").val();
		   findSonSelect($("#select_1").val());
		}); 
		
		 $("#select_2").change(function() {
		   var a = $("#select_2").val();
		   $("#equipmentNum").val( $("#equipmentNum").val().substr(0,1)+a);
		}); 
		$("#button2").click(function(){
		   var content =$("#searchform").serialize();
 	       window.location.href="${pageContext.request.contextPath}/basicCrud/equipment/export2Excel?"+content+"&type=equipment";
		});
		
		
	 /* 	window.onfocus = function(){
        		var _page="1";
        		if($(".selected a").length>0&&$(".selected a").text()!="")
        			_page=$(".selected a").text();
        		
              $.showObjectOption(_page); 
          	 }   */
         	
	});
	function addnew(){
		     var obj="";
		     Iframenow=3;
		     findSelect(obj);
	}

	$.showObjectOption = function(_page) {
		//alert($("#searchform").serialize());
		// alert(0);
		$.ajax({
		      
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/equipment/page?pageSize=18&pageNum="+_page,
					data : $("#searchform").serialize(),
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						//alert(JSON.stringify(obj.result.pageInfo));
						if (obj.success) {
							loadinformation(obj);
							$.setBtn();
						}
					}
				});
	}

    function findById(id){
    
    $.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/basicCrud/equipment/get/"+ id,
			data : "",
			dataType : 'json',
			cache : false,
			error : function() {
				alert('系统连接失败，请稍后再试3！')
			},
			success : function(obj) {
				//alert(obj.result);

				if (obj.success) {
					// alert(findSelect());
					findSelect(obj);
				}
			}
		});
    }
 	function particulars(id) {
	   
		Iframenow=1;
		findById(id);
	}
	
	function Modify(id){
	   Iframenow=2;
	   findById(id);
    } 
	
	function Delete(id){
	if(confirm("确认删除？")){
	  deleted(id);
	}
	}

	
	 function findSonSelect(fatherSelect){
	// alert(111);
	    var select=$("#select_2");
		loadSonSelect(select,fatherSelect,SelectObj);
	} 
	
	function findSelect(obj) {
	//alert(0);
		$.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/equipment/getEntityProperty",
					data : "",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(selectobj) {
					  
						//alert(JSON.stringify(selectobj.result));
						if (selectobj.success) {
					        SelectObj = selectobj;
							if (Iframenow==1) {
	                      //           alert(0);
	                           loadInfomationToIframe1(obj, selectobj);
								
							//		alert(0);

							} else if(Iframenow==2){
							   loadInfomationToIframe2(obj, selectobj);
							}else if(Iframenow==3){
							//alert(3);
							   loadInfomationToIframe3(selectobj);
							   //alert(3);
							}else {
							   initselects(selectobj);
							}

						}
					}
				});
	}
	
function initselects(selectobj){
//alert(01);
	var fieldProperties = selectobj.result.fieldProperties;
	$.each(fieldProperties,function(index,select){
		if(select.path=="equipmentNum"){
			$.each(select.option,function(index,option){
				if(index==""){
					$("#select_1").append("<option value=\""+index+"\" selected>"+option+"</option>");
				}else{
					$("#select_1").append("<option value=\""+index+"\">"+option+"</option>");
				}
				
			});
		}
	});
//	alert(0);
}
function deleted(id){
  $.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/equipment/del/"+id,
					data : "",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(selectobj) {
					    if(selectobj.success==true){
					   alert("删除成功！");
					  }
					}
					
				});
				
			$("#table_1 tbody").empty();
			$.showObjectOption();	

}	

function modify(id){
   validate($("#ifrom").serialize());
   if(Mach!=1){
    $.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/equipment/save?id="+id,
					data : $("#ifrom").serialize(),
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(selectobj) {
					   if(selectobj.success==true){
					   alert("保存成功！");
					   $.showObjectOption();	
					  }
					}
					
				});
   }
}	
function save(){
   //alert(10);
   //alert($("#ifrom2").serialize());
   validate($("#ifrom2").serialize());
  // alert($("#ifrom2").serialize());
   if(Mach!=1){
   $.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/equipment/save",
					data : $("#ifrom2").serialize(),
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(selectobj) {
					  if(selectobj.success==true){
					   alert("保存成功！");
					   $.showObjectOption();	
					  }
					}
					
				});
				
 }
}	
function initselect(select1,selectobj,selectname){
//alert(01);
	var fieldProperties = selectobj.result.fieldProperties;
	$.each(fieldProperties,function(index,select){
	//alert(select);
		if(select.path==selectname){
			$.each(select.option,function(index,option){
			
				if(index==""){
					select1.append("<option value=\""+index+"\" selected>"+option+"</option>");
				}else{
					select1.append("<option value=\""+index+"\">"+option+"</option>");
				}
				
			});
		}
	});
//	alert(0);
}
$.setBtn = function(){
	 $(".topage").click(function(){
 		$.showObjectOption($(this).text());
 		
		});
	    
    $(".prepage").click(function(){
 	 var nowpage=parseInt($(" .selected  a").text());
 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.showObjectOption(topage);
 		 }
		}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($(".selected  a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		  $.showObjectOption(nextpage);

		});  
		
     $("#gopagebtn").click(function(){
		                    	  var topage=parseInt($("#gopage").val());
						      
						        	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
					        		 {
					        		 $.showObjectOption(topage);
					        		 }
						        	 else
						        		 {
						        		 alert("超出索引值");
						        		 }
									}); 
   }
   
   function checkPower(){
  
      var nowUser,powerUsers,obj;
        $.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/ca/getCurrentLoginInfo",
					data :"",
					dataType : 'json',
					cache : false,
					error : function() {
					//	alert('系统连接失败，请稍后再试1！');
					},
					success : function(user) {
					    nowUser=user.cookies.loginName;
					   // alert(nowUser);
					    $.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/power/all",
					data :"",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(user) {
					if(user.success==true){
					   $.each(user.result,function(index,Pusers){
					       var u = Pusers.users.split(",");
					       $.each(u,function(i,userName){
  					           if(userName==nowUser){
  					             //  alert(userName+""+nowUser);
  					               IronMan=true;
  					               Superpower();
  					               $.showObjectOption();
		                           findSelect(obj);
  					               return false;
  					           }else{
  					            IronMan=false;
  					            $.showObjectOption();
  					            findSelect(obj);
  					            return false;
  					           }
					       });
					   });
					  }
					}
				});
					}
					
				});
				//alert(0);
		    
				//alert(1);
				 
   }
   function getPowerList(){
   
   }
   function Superpower(){
        $("#button1").css("display","block");
   }

</script>
-->
<script src="js/terminal.js"></script>
<style type="text/css">
.red{
 color: red;
}
</style>



</head>

<body>


	<div id="iframe_xx" class="f_window"
		style="width:690px; display:none;  margin:10% 0% 0 25%;">

		<div class="con">
			<table id="table_2" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="table_2">

				<thead>

					<th colspan="4">

						<h5 class="fl">设备详细信息</h5> <span class="fr pt5 mr5"><a
							href="javascript:close();">关闭</a> </span></th>

				</thead>
				<tbody>

				</tbody>

			</table>


		</div>

		<div class="button t_c"></div>

	</div>

	<div id="iframe_gx" class="f_window"
		style="width:690px;  display:none;  margin:6% 0% 0 25%;">

		<div class="con">
		<form id="ifrom">
		     <table width="100%" id="table_3" border="0" cellspacing="0" cellpadding="0" class="table_2">

				<thead>
					<th colspan="4">
						<h5 class="fl">设备信息更新</h5> <span class="fr pt5 mr5"><a
							href="javascript:close();">关闭</a> </span></th>
				</thead>
				<tbody>
				      
				</tbody>
				<tfoot>
				
				 </tfoot>
		</table>
		</form>
			
		


		</div>

		<div class="button t_c">

			<input type="button" id="md" onclick="javascript:modify(1);" value="保 存" />

		</div>
	</div>

    <div id="iframe_xz" class="f_window"
		style="width:690px;  display:none;  margin:6% 0% 0 25%;">
		
		<div class="con">
		<form id="ifrom2">
		     <table width="100%" id="table_4" border="0" cellspacing="0" cellpadding="0" class="table_2">

				<thead>
					<th colspan="4">
						<h5 class="fl">设备信息新增</h5> <span class="fr pt5 mr5"><a
							href="javascript:close();">关闭</a> </span></th>
				</thead>
				<tbody>
				      
				</tbody>
				<tfoot>
				
				 </tfoot>
		</table>
		</form>
			
		


		</div>

		<div class="button t_c">

			<input type="button" id="md" onclick="javascript:save('');" value="保 存" />
			<input type="button" id="cz" value="重置" />
		</div>
    </div>
	<div class="main">
		<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="收起">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li><a href="#">首页</a>
					</li>
					<li><a href="#">运维和质量管理</a>
					</li>
					<li class="fin">设施设备台账</li>
				</ul>
			</div>
			<div class="fr lit_nav nwarp">
				<ul>
					<li class=""><a class="print" href="#">打印</a>
					</li>
					<li><a class="express" href="#">导出数据</a>
					</li>
					<li class=""><a class="table" href="#">表格模式</a>
					</li>
					<li><a class="treeOpen" href="#">打开树</a>
					</li>
					<li><a class="filterClose" href="#">关闭过滤</a>
					</li>
				</ul>
			</div>
		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Tabs_2-->
			<div class="tabs_2 nwarp">
				<ul class="nwarp">
				    <li class=""><a href="${pageContext.request.contextPath}/equipment/EquipmentList"><span>设备管理台账</span> </a>
					<li class="selected"><a href="javascript:;"><span>终端管理台账</span> </a>
					</li>
					
				</ul>
			</div>
			<!--Tabs_2 End-->
			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<form id="searchform">
							<table class="nwarp" width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tbody>
									<tr>
										<td class="t_r">编号</td>
										<td>
										<select name="projectStatus" id="select_1"
											class="input_large" style="width:120px">
										</select> 
										
										<select name="projectStatus" id="select_2"
											class="input_large" style="width:120px">
										</select> 
										
										<input type="text" id="equipmentNum" name="equipmentNum"
											style="width:120px" id="textfield" class="input_large"
											placeholder="请输入编号">
										</td>
										
										<td class="t_r" >厂商名称</td>
										
										<td>
										<input type="text" placeholder="请输入厂商名称" name="equipmentName" class="input_large">
										</td>
										
										<td class="t_r">使用人</td>
										<td>
										<input type="text" name="equipmentUser"
											class="input_large" placeholder="请输入使用人/负责人姓名" />
									    </td>
									</tr>
									<tr>
										<td class="t_r">型号</td>
										<td><input type="text" name="modelNumber"
											class="input_large" placeholder="请输入型号" /></td>
										<td class="t_r">物理位置</td>
										<td><input type="text" name="physicalLocation"
											class="input_large" placeholder="请输入物理位置" />
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" class="t_c"><input type="button"
											id="searchbtn" value="搜索" /> &nbsp; <input type="button"
											id="renewbtn" value="重 置" />
									</tr>
								</tfoot>

							</table>
						</form>
					</div>
				</div>
				<div class="fn clearfix">
					<h5 class="fl">
						<a href="#" class="colSelect fl"></a>
					</h5>

					<input type="button" name="button1" id="button1" class="fr" style="display:none;" onclick="javascript:addnew();" value="新增" />&nbsp;
					<input type="button" name="button2" id="button2" value="导 出" class="fr"/>
				</div>
			</div>
			<!--Filter End-->
			<!--Table-->
			<div class="mb10">
				<table width="100%" id="table_1" class="table_1" id="maintable">
					<thead>
						<tr class="tit">
							<td class=" t_c"><input type="checkbox" id="test_checkbox_1"
								name="test_checkbox_1" />
							</td>
							<td ><a href="#"><span class="fl">编号</span><i></i>
							</a>
							</td>
							<td ><a href="#"><span class="fl">型号</span><i></i>
							</a>
							</td>
								<td ><a href="#"><span class="fl">厂商名称</span><i></i>
							</a>
							</td>
							<td ><a href="#"><span class="fl">资产分类</span><i></i>
							</a>
							</td>
							<td ><a href="#"><span class="fl">设备重要性</span><i></i>
							</a>
							</td>
							<td ><a href="#"><span class="fl">主状态</span><i></i>
							</a>
							</td>
							
							<td><a href="#"><span class="fl">物理位置</span><i></i>
							</a>
							</td>
							<td ><a href="#"><span class="fl">使用人</span><i></i>
							</a>
							</td>
							<td><a href="#"><span class="fl">操作</span> </a>
							</td>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="10">
								<div class="clearfix">
									<span class="fl"></span>
									<ul class="fr clearfix pager"></ul>
								</div></td>
						</tr>
					</tfoot>
				</table>

			</div>
			<!--Table End-->
		</div>
	</div>
</body>
</html>
