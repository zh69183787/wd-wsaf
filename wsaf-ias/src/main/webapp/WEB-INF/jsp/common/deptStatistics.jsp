<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">

<title>按部门统计</title>
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
<link rel="stylesheet" href="css/SimpleCanleder.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<style type="text/css">
.ui-datepicker-title span {
	display: inline;
}

button.ui-datepicker-current {
	display: none;
}

    .ui-datepicker-calendar {
        display: none;
        }

</style>

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.ui.datepicker-zh-CN.js"></script>
<script src="js/SimpleCanleder.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/attendance.js"></script>

<script type="text/javascript">

		var iasItem = {};
		
    	var deptMap = {
    			'1121': '上海轨道交通申松线发展有限公司',
    			'1123': '上海轨道交通申嘉线发展有限公司',
    			'1122': '上海轨道交通十号线发展有限公司',
    			'1124': '上海轨道交通十二号线发展有限公司',
    			'1125': '上海轨道交通十三号线发展有限公司',
    			'0006': '党委办公室',
    			'0004': '工会',
    			'0008': '团委',
    			'0010': '投资管理部',
    			'0014': '组织人事部',
    			'0009': '总体规划部',
    			'0015': '审计室',
    			'0011': '财务部',
    			'0016': '运营安全监察室',
    			'0013': '企业管理发展部',
    			'0007': '办公室',
    			'0012': '合约管理部',
    			'0005': '监察室',
    			'0018': '建设管理中心',
    			'0019': '信息管理中心',
    			'0017': '保卫部'
    	};
    	
    	var statusMap = {
    		'draft' : "草稿",
    		'review' : '已提交',
    		'back' : '审核退回',
    		'finish' : '审核通过'
    	};
		
		var dept = "";
		var hr = false;
		

    	$(function (){
    		$.ajaxSetup({async:false});  

    		   $('#date,#date2').datepicker( {
    	            changeMonth: true,
    	            changeYear: true,
    	            showButtonPanel: true,
    	            dateFormat: 'yy-mm',
    	            onClose: function(dateText, inst) { 
    	                var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
    	                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
    	                $(this).datepicker('setDate', new Date(year, month, 1));
    	            },
    	            beforeShow : function(input, inst) {
    	                if ((datestr = $(this).val()).length > 0) {
    	                    year = datestr.substring(0,4);
    	                    month = Number(datestr.substring(5,7)) - 1;
    	                    $(this).datepicker('option', 'defaultDate', new Date(year, month, 1));
    	                    $(this).datepicker('setDate', new Date(year, month, 1));
    	                }
    	            }
    	        });
       		$("#date").val(getNowYm().substring(0,5) + "01");


    		
    		
      		//从cookie中获取登录人信息
      		var cookieUser;
    		$.getJSON(
    			"./ca/getCookies",
    			function(rtn){
    				cookieUser = rtn;
    			}
    		);
    		
    		//通过loginName获取当前部门id
    		if(cookieUser){
//     			if("G00200000033" == cookieUser.loginName){
				//指定人可以查看所有部门\状态默认选择 审核通过
    			if("G00100000074" == cookieUser.loginName){
    				$("#dept").parent().show();
    				$("#status option[value=finish]").attr("selected","selected");
    				hr = true;
    			}else{
        			var staff;
        			$.getJSON(
        				"./basicCrud/iasStaff/all?loginName=" + cookieUser.loginName,
        				function (rtn){
    	    				if(chkRtn(rtn)){
    	    					staff = rtn.result[0];
    	    					dept =staff.unitCode == "00" ? staff.deptCode : staff.unitCode;
    	    					if(dept.length > 4){
    	    						dept = dept.substring(0,4);
    	    					}
    	    	    		}
        				}
        			);
    			}
    		}
    		
    		
    		$("#reset").click(function (){
    			$("#date").val(getNowYm());
    			$("#date2").val("");
    			$("#dept").val("");
    			$("#status").val(hr ? "finish" : "");		
    		});
    		
    		
    		$("#search").click(function (){
    			var s = $("#date").val();
    			var e = $("#date2").val();
    			
    			if(e != "" && s > e){
    				alert("开始时间不得大于终止时间，请从新选择");
    				return;
    			}

    			$("#grid tbody").remove();
				search();
    		}).click();

    		
    	});
    	
    	function search(){
    		var date = $("#date").val();
    		var date2 = $("#date2").val();
    		var status = $("#status").val();
    		
    		if(hr){
    			buildBody(date,date2,$("#dept").val(),status);
    		}else{
    			if(dept){
    				buildBody(date,date2,dept,status);
    			}
    		}
    		
    	}
    	
    	

    	
    	function buildBody(date,date2,dept,status){
    		
    		var url = "./basicCrud/iasWorkflow/all?sort=iasMonth desc";
    		
    		if(date2 != ""){
    			url += ( "&iasMonth_s=" + date + "&iasMonth_e=" + date2);
    		}else{ 
//     			url += ( "&iasMonth=" + getNowYm() );
    			url += ( "&iasMonth=" + date );
    		}
    		
    		if(dept){
    			url +=("&iasDept=" + dept);
    		}
    		if(status){
    			url += ("&status=" + status);
    		}

    		
    		
			$.getJSON(
				url ,
				function (rtn){
					if(chkRtn(rtn)){
						var workflows = rtn.result;
						var b = "<tbody>"
						for(var i = 0 ; i < workflows.length ; i ++){
							var w = workflows[i];
							b += "<tr>";
							b += ("<td class='t_c'>" + (i + 1) + "</td>");
							b += ("<td class='t_c'>" + deptMap[w.iasDept] + "</td>");
							b += ("<td class='t_c'>" + w.iasMonth + "</td>");
							b += ("<td class='t_c'>" + w.initiateTime + "</td>");
							b += ("<td class='t_c'>" + w.initiatorLoginname + "</td>");
							b += ("<td class='t_c'>" + w.initiator + "</td>");
							b += ("<td class='t_c'>" + ( w.handleTime == null ? "" : w.handleTime ) + "</td>");
							b += ("<td class='t_c'>" + w.handlerLoginname + "</td>");
							b += ("<td class='t_c'>" + w.handler + "</td>");
							b += ("<td class='t_c'>" + statusMap[w.status] + "</td>");
							b += ("<td class='t_c'><a href='#' onclick='return showDetail(" + w.id + ");'>查看</a></td>");
							b += "</tr>";
						}
						
						b += "</body>";
						$("#grid").append($(b));
					}
				}
			);

    	}
    	
    	function showDetail(id){
    		window.open ('<%=basePath%>attendanceApprove/make?from=deptStatistics&id='+id,'detail','toolbar=no,menubar=no, resizable=yes,scrollbars=yes,location=no, status=no') ;
    		return false;
    	}
    	

   

    </script>
</head>
<body >
	<div class="main">
		<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="收起">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li><a>首页</a></li>
					<li><a>考勤信息管理</a></li>
					<li class="fin">按部门统计</li>
				</ul>
			</div>

		</div>
		<!--Ctrl End-->
		<div class="pt45">

			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<table class="nwarp" style="width: 800px;">
							<tr>
								<td width="50px"></td>
								<td style="display: none;"> 单位/部门
									<select id="dept" >
										<option value="">全部</option>
										<optgroup label="集团本部">
											<option value="0006">党委办公室</option>
											<option value="0004">工会</option>
											<option value="0008">团委</option>
											<option value="0010">投资管理部</option>
											<option value="0014">组织人事部</option>
											<option value="0009">总体规划部</option>
											<option value="0015">审计室</option>
											<option value="0011">财务部</option>
											<option value="0016">运营安全监察室</option>
											<option value="0013">企业管理发展部</option>
											<option value="0007">办公室</option>
											<option value="0012">合约管理部</option>
											<option value="0005">监察室</option>
											<option value="0018">建设管理中心</option>
											<option value="0019">信息管理中心</option>
											<option value="0017">保卫部</option>				
										</optgroup>	
										<optgroup label="项目公司">
											<option value="1121">上海轨道交通申松线发展有限公司</option>
											<option value="1123">上海轨道交通申嘉线发展有限公司</option>
											<option value="1122">上海轨道交通十号线发展有限公司</option>
											<option value="1124">上海轨道交通十二号线发展有限公司</option>
											<option value="1125">上海轨道交通十三号线发展有限公司</option>
										</optgroup>
									</select>
								</td>
								<td>上报状态
									<select id="status" class="input_small">
										<option value="">全部</option>
										<option value="draft">草稿</option>
										<option value="review">已提交</option>
										<option value="back">审核退回</option>
										<option value="finish">审核通过</option>
									</select>
								</td>
								<td>考勤月份
									<input type="text" id="date" name="date" readonly="readonly"  class="input_small"/>
									~
									<input type="text" id="date2" name="date2" readonly="readonly"  class="input_small"/>
									<input type="button" value="清空"  onclick="$('#date2').val('');" />
									&nbsp;
									&nbsp;
									&nbsp;
									&nbsp;
									&nbsp;
								</td>
								<td>
									<input type="button" value="查询"  id="search" />
									<input type="button" value="重置"  id="reset" />
								</td>
							</tr>

						</table>
					</div>
				</div>
				<div class="fn clearfix">

<!-- 					<input type="submit" name="button2" id="button2" value="导 出" class="fr"> -->
				</div>
			</div>
			<!--Filter End-->
			<!--Table-->
			<div class="mb10">
				<table width="100%" class="table_1" id="grid">
					<thead>
						<tr class="tit">
							<td class="t_c">序号</td>
							<td class="t_c">单位/部门名称</td>
							<td class="t_c">考勤月份</td>
							<td class="t_c">提交日期</td>
							<td class="t_c">提交人工号</td>
							<td class="t_c">提交人</td>
							<td class="t_c">处理日期</td>
							<td class="t_c">处理人工号</td>
							<td class="t_c">处理人</td>
							<td class="t_c">上报状态</td>
							<td class="t_c">操作</td>
						</tr>
					</thead>
					<tbody>

					</tbody>

				</table>

			</div>
			<!--Table End-->
		</div>
	</div>
</body>

</html>

