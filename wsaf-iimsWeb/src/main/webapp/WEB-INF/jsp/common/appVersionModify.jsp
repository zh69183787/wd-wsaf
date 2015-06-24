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
<script src="js/appVersion.js"></script>
<script type="text/javascript">
	var SelectObj = "",power;
	var Iframenow = 0;
	$(document).ready(function() {
		var obj;
		QueryString.Initial();
		//alert(QueryString.GetValue("id"));
		InitLocation();
		$.showObjectOption();
		$("#cz").click(function() {
			$.showObjectOption();
		});
	
		//minute("123","123","123","123");
	});
	/* 	window.onfocus = function(){
	   		var _page="1";
	   		if($(".selected a").length>0&&$(".selected a").text()!="")
	   			_page=$(".selected a").text();
	   		
	         $.showObjectOption(_page); 
	     	 }   */
function InitLocation(){
	   if(QueryString.GetValue("backpage")=="2"){
	      $("#location2").attr("href","${pageContext.request.contextPath}/appVersion/AppVersionList?&dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType"));
	      $("#location2").css("display","block");
	      $("#fh").click(function(){
	        window.location.href="${pageContext.request.contextPath}/appVersion/AppVersionList?&dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType");
     	});
	  }
	}
	$.showObjectOption = function() {
		//alert($("#searchform").serialize());
		// alert(0);
		$
				.ajax({

					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/getEntityProperty",
					data : "",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						if (obj.success) {
							SelectObj = obj;
							loadinformationToVersionModify(obj);
							
						}
					}
				});
	}
	
	
	
	 function checkPower(){
  
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
					 //alert(JSON.stringify(user.cookies.deptId!="2549"));
				     // alert(JSON.stringify(user.cookies.deptId));
				     if(user.cookies.deptId!="2549"){
				        power="no";
				        $("[name='dept']").attr("disabled",true);
				     }else{
				        power="yes";
				     }
					}
					
				});
		    
				 
   }
	function modify(id) {
		//operation="save";
		//alert(10);
		//alert($("#ifrom2").serialize());
		 $("[name='dept']").attr("disabled",false);
		 validate($("#ifrom_gx").serialize());
		//alert($("#ifrom_gx").serialize());

		if(Mach!=2){
		$.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/save?id="+id,
					data : $("#ifrom_gx").serialize(),
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(selectobj) {
						//alert(selectobj.success);
						if (selectobj.success == true) {
							alert("保存成功！");
							 window.location.href="${pageContext.request.contextPath}/appVersion/AppVersionList?&dept="+QueryString.GetValue("dept")+"&deviceNum="+QueryString.GetValue("deviceNum")+"&authorize="+QueryString.GetValue("authorize")+"&appType="+QueryString.GetValue("appType");
						}
					}

				});

		}
		if(power=="no"){
				 $("#dept").attr("disabled",true);
				}
	}
	function InitInfomationToModify() {
		$.ajax({
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/appVersion/get/"+QueryString.GetValue("id") ,
					data : "",
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试1！');
					},
					success : function(obj) {
						//alert(selectobj.success);
						if (obj.success == true) {
						  // alert(obj);
						   loadInfomationTomodify(obj);
						   checkPower();
						}
					}

				});
	}
</script>

<style type="text/css">
.red {
	color: red;
}
</style>



</head>

<body>


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
					<li><a href="#">正版化管理</a>
					</li>
					<li class="fin">正版化台账</li>
				</ul>
			</div>
			<div class="fr lit_nav nwarp">
				<ul>
					<li class="selected"><a class="print" href="javascript:;">打印</a>
					</li>
					<li><a class="express" href="javascript:;">导出数据</a>
					</li>
					<li class="selected"><a class="table" href="javascript:;">表格模式</a>
					</li>
					<li><a class="treeOpen" href="javascript:;">打开树</a>
					</li>
					<li><a class="filterClose" href="javascript:;">关闭过滤</a>
					</li>
				</ul>
			</div>
		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Tabs_2-->
			<div class="tabs_2 nwarp">
				<ul class="nwarp">
					<li><a
						href="${pageContext.request.contextPath}/appCount/AppCountList"><span>正版化台账-设备类别</span>
					</a>
					</li>
						<li ><a id="location2" style="display:none;" href="#"><span>正版化台账-详情</span></a></li>
					<li class="selected"><a href="javascript:;"><span>正版化台账-修改</span>
					</a>
					</li>
				</ul>
			</div>
			<!--Tabs_2 End-->
			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<table class="nwarp" width="100%" border="0" cellspacing="0"
							cellpadding="0">

							<tr>
								<td colspan="6" class="t_r">
							</tr>
						</table>
					</div>
				</div>
				<div class="mb10">
					<form id="ifrom_gx">
						<table id="table_addnew" width="100%" border="0" cellspacing="0"
							cellpadding="0" class="table_2">
							<thead>
								<th colspan="4" class="f1">
									<h5 class="fl">正版化台账更新</h5>
								</th>
							</thead>
							<tbody>

							</tbody>
						</table>

					</form>
				</div>
				<div class="fn clearfix t_c">
					<h5 class="fl">
						<a href="#" class="colSelect fl"></a>
					</h5>
					<input type="button" id="md" value="保 存" /> &nbsp;
					 <input	type="button" id="cz" value="重 置" /> &nbsp; 
					 <input type="button" id="fh" value="返 回" />
				</div>
			</div>
			<!--Filter End-->
		</div>
	</div>

</body>
</html>
