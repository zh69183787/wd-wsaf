<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String role=(String)request.getAttribute("role");			
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>申通地铁集团信息管理中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
<script src="js/partyLife.js"></script>

<script type="text/javascript">
    var deptId,deptName,loginName,userName;
    var role="<%=role%>";
    var contextPath="<%=path%>";

	$(document).ready(function() {
		$.defaultjs(); 
		initDeptUserInfo();		
		
		$("#searchbtn").click(function() {
			$("#table_1 tbody").empty();
			showObjectOption();
		});
		$("#renewbtn").click(function() {
			$("#searchform tbody input,#searchform tbody select").val("");
			showObjectOption();
		});

		showObjectOption();
	});
	
	
   
</script>
<style type="text/css">
.red{
 color: red;
}
</style>



</head>

<body>

	<div id="editDiv" class="f_window" style="width:690px;  display:none;  margin:6% 0% 0 25%;">
		<div class="con">
			<form id="editFrom">
				<input type="hidden" name="id" id="id"/>
				<input type="hidden" name="deptId" id="deptId"/>
				<input type="hidden" name="creatorLoginname" id="creatorLoginname"/>
				<input type="hidden" name="removed" id="removed" value="0"/>
			     <table width="100%" id="table_3" border="0" cellspacing="0" cellpadding="0" class="table_2">
					<thead>
						<th colspan="4"/>
							<h5 class="fl">组织生活情况</h5><a class="fr pt5 mr5" href="javascript:close();">关闭</a> 
						</th>
					</thead>
					<tbody>

						<tr>
							<td class="lableTd t_r">支部名称</td>
							<td><input readonly maxlength="30" type="text" name="deptName" id="deptName"  class="input_large"/></td>
							<td class="lableTd t_r">年度</td>
							<td><input  maxlength="30" type="text" name="year" id="year"  class="input_large"/></td>
						</tr>
						<tr>
							<td class="lableTd t_r">一月</td>
							<td><input  maxlength="30" type="text" name="jan"  id="jan" class="input_large" value="0"/></td>
							<td class="lableTd t_r">二月</td>
							<td><input  maxlength="30" type="text" name="feb"  id="feb" class="input_large" value="0"/></td>
						</tr>
						<tr>
							<td class="lableTd t_r">三月</td>
							<td><input  maxlength="30" type="text" name="mar" id="mar" class="input_large" value="0"/></td>
							<td class="lableTd t_r">四月</td>
							<td><input  maxlength="30" type="text" name="apr" id="apr" class="input_large" value="0"/></td>
						</tr>
						<tr>
							<td class="lableTd t_r">五月</td>
							<td><input  maxlength="30" type="text" name="may" id="may"  class="input_large" value="0"/></td>
							<td class="lableTd t_r">六月</td>
							<td><input  maxlength="30" type="text" name="jun"  id="jun" class="input_large" value="0"/></td>
						</tr>
						<tr>
							<td class="lableTd t_r">七月</td>
							<td><input  maxlength="30" type="text" name="jul" id="jul"  class="input_large" value="0"/></td>
							<td class="lableTd t_r">八月</td>
							<td><input  maxlength="30" type="text" name="aug" id="aug" class="input_large" value="0"/></td>
						</tr>
						<tr>
							<td class="lableTd t_r">九月</td>
							<td><input  maxlength="30" type="text" name="sep" id="sep"  class="input_large" value="0"/></td>
							<td class="lableTd t_r">十月</td>
							<td><input  maxlength="30" type="text" name="oct" id="oct" class="input_large" value="0"/></td>
						</tr>
						<tr>
							<td class="lableTd t_r">十一月</td>
							<td><input  maxlength="30" type="text" name="nov"  id="nov" class="input_large" value="0"/></td>
							<td class="lableTd t_r">十二月</td>
							<td><input  maxlength="30" type="text" name="dece" id="dece"  class="input_large" value="0"/></td>
						</tr>	
						<tr>
							<td class="lableTd t_r">填报人</td>
							<td><input readonly maxlength="30" type="text" name="creator" id="creator" class="input_large"/></td>
							<td class="lableTd t_r" colspan="2"><input  type="hidden" name="createTime" id="createTime"/></td>
						</tr>											
					</tbody>
					<tfoot></tfoot>
			</table>
			</form>
		</div>
		<div class="button t_c">
			<input type="button" id="md" onclick="javascript:save();" value="保 存" />
		</div>
	</div>
	
	
	<div class="main">
		<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li>党组织生活</li>
				</ul>
			</div>

		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<form id="searchform">
							<table class="nwarp" width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tbody>
									<tr>
										<td class="t_r">年度</td>
										<td>
											<input type="text"  name="year" class="input_large">											
										</td>
										
										<td class="t_r">支部名称</td>										
										<td>
											<input type="text" name="deptName" class="input_large">
										</td>
										
										<td class="t_r">填报人</td>
										<td>
											<input type="text" name="creator" class="input_large" />
									    </td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" class="t_c">
										<input type="button" id="searchbtn" value="搜索" /> &nbsp; 
										<input type="button" id="renewbtn" value="重 置" />
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

					<input type="button" name="button1" id="button1" class="fr"  onclick="javascript:addnew();" value="新增" />&nbsp;
				</div>
			</div>
			<!--Filter End-->
			<!--Table-->
			<div class="mb10">
				<table width="100%" id="table_1" class="table_1" id="maintable">
					<thead>
						<tr class="tit">
							<td>支部名称</td>
							<td>年度</td>
							<td>一月</td>
							<td>二月</td>
							<td>三月</td>							
							<td>四月</td>
							<td>五月</td>
							<td>六月</td>
							<td>七月</td>							
							<td>八月</td>
							<td>九月</td>
							<td>十月</td>
							<td>十一月</td>
							<td>十二月</td>							
							<td>填报人</td>
							<td>填报时间</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="17">
								<div class="clearfix">
									<span class="fl"></span>
									<ul id="page" class="fr clearfix pager"></ul>
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
