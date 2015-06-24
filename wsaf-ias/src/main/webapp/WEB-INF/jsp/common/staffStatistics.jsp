<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">

<title>按人员统计</title>
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
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />

<style type="text/css">
.ui-datepicker-title span {
	display: inline;
}

button.ui-datepicker-current {
	display: none;
}

td.poniter{
	cursor: pointer;
}	

table#grid td{
	white-space:nowrap;
}

.ui-datepicker-calendar {
    display: none;
 }
</style>

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.ui.datepicker-zh-CN.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/attendance.js"></script>

<script type="text/javascript">




	function exportExcel(){
		
		var rows = [];
		$("#grid tr:gt(0)").each(function (){
			var cols = [];
			$(this).find("td").each(function (){
				cols.push($(this).html());
			});
			rows.push(cols.join(","));
		});
		
		var data = rows.join(";");
		data = data.replace("&nbsp;","序号").replace("&nbsp;","人员编号").replace("&nbsp;","姓名").replace("&nbsp;","备注");
		$.post(
			"./staffStatistics/sendExportData",
			{data : data},
			function (){
		 	  	var url="./staffStatistics/export";
		 	   	document.getElementById("file").src=url;
			}
		);
	}

		var iasItem = {};
		
		var dept = "";
		var hr = false;

    	$(function (){
    		$.ajaxSetup({async:false});  
    		
  		   $('#date').datepicker( {
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
	        }).val(getNowYm());
    		
    		
    		
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
    			if("G00100000074" == cookieUser.loginName){
    				$("#dept").parent().show();
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
    		
    		
    		
    		
    		$("#search").click(function (){
    			$("#grid").children().remove();
    			search();
    		}).click();
    		
    		
    		$("#reset").click(function (){
    			$("#date").val(getNowYm());
    			$("#staffName").val("");
    			$("#dept").val("");
    			
    		});
    		
    		$("#export").click(function (){
    			exportExcel();	
    		});
    		
    		

    		
    		
    		
    	});
    	
    	function search(){
    		
    		buildHeader();
    		
    		var date = $("#date").val();
    		var staffName = $("#staffName").val();
    		
    		if(hr){
    			buildBody(date,$("#dept").val(),staffName);
    		}else{
    			if(dept){
    				buildBody(date,dept,staffName);
    			}
    		}
    		
    	}
    	
    	function buildHeader(){
    		//获取所有的考勤项
    		$.getJSON(
    			"./basicCrud/iasAttendance/getEntityProperty?fieldFilter=rec&isNeeded=true",
    			function (rtn){
    				iasItem = rtn.result.fieldProperties[0].option;
    				delete iasItem[""];

    				var size = 0;
    				var item = "";
    				for(var i in iasItem){
    					item += '<td class="t_c" width="70px">' + iasItem[i] + '</td>';
    					size ++;
    				}

    				
    				var h = '<thead><tr class="tit">';
    				h += '<td class="t_c" width="40px">序号</td>';
    				h += '<td class="t_c" width="100px;">人员编号</td>';
    				h += '<td class="t_c" width="70px">姓名</td>';
    				h += '<td colspan="' +  size + '" class="t_c">日期</td>';
    				h += '<td class="t_c" width="200px">备注</td>';
    				h += '</tr>';
    				h += '<tr>';
    				h += '<td class="t_c">&nbsp;</td>';
    				h += '<td class="t_c">&nbsp;</td>';
    				h += '<td class="t_c">&nbsp;</td>';
    				h += item;
    				h += '<td class="t_c">&nbsp;</td>';
    				h += '</tr></thead>';

    				$("#grid").append($(h));
    			}
    			
    		);

    	}
    	
    	function buildBody(date,dept,staffName){
    		//设计时需考虑查询多个部门的情况, 使用数组
    		var workflowId = [];
    		//先根据日期和部门 获取流转信息(status=finish)的workflowId 
    		//workflowId
    		var url = "./basicCrud/iasWorkflow/all?status=finish&iasMonth=" + date;
    		if(dept){
    			url +=  ( "&iasDept=" + dept );
    		}
    		$.getJSON(
    				url,
    				function (rtn){
    					if(chkRtn(rtn)){
    						var workflows = rtn.result;
    						for(var i = 0 ; i < workflows.length ; i ++){
    							workflowId.push(workflows[i].id);
    						}
    					}
    				}
    		);
    		
    		var b = "<tbody>";
    		var index = 1;

    		for(var i = 0 ; i < workflowId.length ; i ++){
//     			url = "./basicCrud/iasAttendance/all?workflowId=" + workflowId[i] ;
//     			if(staffName){
//     				url += ( "&staffName=" + staffName );
//     			}
//     			url += "&sort=staffId asc";


				url = "./basicCrud/iasAttendance/all";
				var param = {
						sort : "staffId asc",
						workflowId :workflowId[i]
				};

    			if(staffName){
    				param.staffName_l = staffName;
				}
    			$.post(
        				url,
        				param,
        				function (rtn){
    	    				if(chkRtn(rtn)){
    	    					for(var j = 0 ; j < rtn.result.length ; j ++){
    	    						var a = rtn.result[j];
    	    						b += "<tr>";
    	    						b += ( "<td class='t_c'>" + index  + "</td>" );
    	    						b += ( "<td class='t_c'>" + a.staffCode + "</td>" );
    	    						b += ( "<td class='t_c'>" + a.staffName + "</td>" );
    	    						
    	    						var day = {};	//记录 所有考勤选项类型的 天数 key=类型 value=天数
    	    						var detail = {};	//记录考勤详情
    	    						var ym = a.iasMonth.split("-");
    	    						var y = ym[0];
    	    						var m = ym[1];
    	    						
									
    	    						for(var item in iasItem){
    	    							day[item] = 0;
    	    							detail[item] = [];
    	    						}
    	    						
    	    						if(a.rec){
    	    							var rec = $.parseJSON(a.rec);
    	    							for(var d in rec){
    	    								var item = rec[d];
    	    								day[item] ++;
    	    								
    	    								var rymd = getRealYmd(y,m,d);
    	    								detail[item].push(rymd.join("-"));
    	    							}
    	    						}	    						
    	    						for(var item in iasItem){
    	    							var detailDays = detail[item].sort().join(",");
    	    							b += ( "<td class='t_c poniter'  onclick='showDetail(this.id," +"\"" +detailDays + "\"" + ");'>" + ( day[item] == 0 ? "" : day[item] )  +"</td>" );
    	    						}
    	    						b += ( "<td class='t_c'>" +( a.remark ? a.remark : "" ) + "</td>" );
    	    						b += "</tr>";
    	    						
    	    						index ++;
    	    					}
    	    	    		}
        				},
        				"json"
        		);
    		}
    		b += "</tbody>";
    		$("#grid").append($(b));

    	}
    	
		function showDetail(id,days){
			if(days){
				days = days.split(",");
				
				var t = "<thead><tr><td class='tit t_c'>序号</td><td class='tit t_c'>考勤日</td></tr></thead>";
				t += "<tbody>";
				for(var i = 0 ; i < days.length ; i ++){
					t += "<tr>"
					t += ( "<td class='t_c'>" + (i + 1) + "</td>" );
					t += ( "<td class='t_c'>" + days[i] + "</td>" );
					t += "</tr>";
				}
				t += "</tbody>";

		 		$("#model #view table").html(t);
		 		
		 		id ="#model";


				
				if(days.length > 10){
					$(id).find("#view").css({height:"280px",overflow:"auto"});
				}else{
					$(id).find("#view").css({height:"auto",overflow:"hidden"});
				}
			  	var top = ($(window).height() - $(id).height())/2 + $(document).scrollTop();   
				var left = ($(window).width() - $(id).width())/2 + $(document).scrollLeft();   
				$(id).css( { position : 'absolute', 'top' : top - 50, 'left' : left } ).show();  

				
			}

		}


    </script>
</head>
<body style="min-width: 1280px">
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
					<li class="fin">按人员统计</li>
				</ul>
			</div>

		</div>
		<!--Ctrl End-->
		<div class="pt45">

			<!--Filter-->
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						<table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="3%"></td>
								<td width="25%" style="display: none;"> 单位/部门
									<select id="dept" >
										<option value="" class="default">全部</option>
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
								<td width="20%">人员姓名
									<input type="text" id="staffName" name="staffName"  maxlength="10"/>
								</td>
								<td width="20%">考勤月份
									<input type="text" id="date" name="date" readonly="readonly" />
								</td>
								<td>
									<input type="button" value="查询"  id="search" />
									<input type="button" value="重置"  id="reset" />
									<input type="button" value="导出"  id="export" />
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
			<div class="mb10" style="height: 500px;overflow:auto;">
				<table width="100%" class="table_1" id="grid">
					
				</table>
				
				
			</div>
			<!--Table End-->
		</div>
	</div>
	

	<div id="model" style="position: absolute; z-index:9999 ;width: 350px;  display: none;border: 2px solid #999; background: #fff;">
		<div class="t_c" style="padding:5px;">
			<table style="width: 100%">
				<tr>
					<td width="15%" class="t_c"></td>
					<td width="70%" class="t_c"><h4>考勤详情</h4></td>
					<td width="15%" class="t_r" ><a href="#" onclick="$(this).parents('#model').hide();return false;">关闭</a></td>
				</tr>
			</table>
		</div>
		<div id="view">
			<table class="table_1" style="width: 100%" >

			</table>
			<br/>
		</div>
	</div>
	
	<iframe id="file" style="display:none"></iframe>
		

	
</body>

</html>

