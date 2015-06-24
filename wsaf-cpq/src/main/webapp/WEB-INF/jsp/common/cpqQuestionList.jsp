<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">

		<title>网上测评列表</title>
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
		<script src="js/jquery.ui.datepicker-zh-CN.js"></script>
		<script src="js/jquery.formalize.js"></script>
		<style>
.ui-datepicker-title span {
	display: inline;
}

button.ui-datepicker-current {
	display: none;
}
</style>

    <script type="text/javascript">
     var handlerLoginname = "";
	var deptName="";
	var username = "";
    $(document).ready(function () {

	$.ajax( {
			async:false,
			url : "ca/getCookies",
			type : 'post',
			dataType : 'json',
			success : function(data) {
				deptId = data.deptId;
				handlerLoginname = data.loginName;
				deptName=data.deptName;
				username = data.userName;
				//$("#deptName").val(data.deptName);
			},
			error : function() {
				alert("接口调用异常,请联系管理员");
			}
		});

		var otherData = "";
		$.ajax( {
			url : "basicCrud/cpqAnswer/all",
			type : 'post',
			data : "userLoginname="+handlerLoginname,
			dataType : 'json',
			success : function(data, status) {
				$.analyzeTableData(data, status);
			},
			error : function() {
				alert("接口调用异常,请联系管理员");
			}
		})
	});

    	$.analyzeTableData = function (data, status) {
    	    if (status == "success" && data != null) {
    	        if (data.success == true && data.result  && JSON.stringify(data.result) != "[]") {
    	            $("tr.tableItem").remove();
    	            var tableItem = "";
    	            //alert(data.result.length);
    	            $.each(data.result, function (entryIndex, entry) {
    	            
	    	            $.ajax( {
							async:false,
							url : "basicCrud/cpqMain/get/"+entry.cpqId,
							type : 'post',
							dataType : 'json',
							success : function(data2,status2) {
								if (status2 == "success" && data2 != null) {
					    	        if (data2.success == true && data2.result  && JSON.stringify(data2.result) != "[]") {
					    	        JSON.stringify
					    	        	 tableItem += "<tr><td>" + (entryIndex + 1) + "</td><td>"+data2.result.cpqName+"</td><td>" + deptName +"</td><td>" + username + "</td><td>" +( entry.submited == "1" ? "已提交" : "草稿" )+"</td><td>" +  entry.answerTime+"</td>";
	    	              				tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\""+(entry.submited == "1" ? "查看":"编辑")+"\" onclick=\"window.open('<%=path%>/cpqQuestion/toCpqQuestionEidt?id=" + entry.cpqId +  "');\" \></tr>";
	    	                
					    	        }
				    	        }
							},
							error : function() {
								alert("接口调用异常,请联系管理员");
							}
						});

    	                
    	            });
    	            $(".table_1").append(tableItem);
    	        }
    	    }
    	}
    	
    	
</script>
    
	</head>
	<body class="Flow">
		<div class="main">
			<div class="ctrl clearfix nwarp">
				<div class="fl">
					<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
						height="30" alt="收起">
				</div>
				<div class="posi fl nwarp">
					<ul>
						<li>
							<a>首页</a>
						</li>
						<li>
							<a>网上测评</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="pt45">
			<div class="filter">
				<div class="fn clearfix">
					<h5 class="fl">
						<a class="fl">网上测评</a>
					</h5>
					<!-- 
					<input type="button" id="addbtn" value="测评管理"
						onclick="window.open('${pageContext.request.contextPath}/cpqMain/cpqMainList');"
						class="fr">
						 -->
				</div>
				</div>
			</div>

			<!--Table-->
			<div class="mb10">
				<table width="100%" class="table_1">
					<tbody>
						<tr class="tit">
							<td class="sort" >
								<a><span class="fl">序号</span> </a>
							</td>
							<td class="sort">
								<a><span class="fl">测评名称</span> </a>
							</td>
							<td class="sort">
								<a><span class="fl">处理部门</span> </a>
							</td>
							<td class="sort" >
								<a><span class="fl">处理人</span> </a>
							</td>
							<td class="sort">
								<a><span class="fl">状态</span> </a>
							</td>
							<td class="sort" >
								<a><span class="fl">处理时间</span> </a>
							</td>
							<td class="sort" >
								<a><span class="fl">操作</span> </a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="10">
								<div class="clearfix">
									<span class="fl"></span>
									<ul class="fr clearfix pager"></ul>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!--Table End-->
		</div>
	</body>
</html>

