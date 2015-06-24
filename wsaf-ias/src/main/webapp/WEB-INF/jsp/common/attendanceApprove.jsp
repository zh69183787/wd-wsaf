<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>考勤信息审批</title>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/formalize.css"/>
    <link rel="stylesheet" href="css/page.css"/>
    <link rel="stylesheet" href="css/default/imgs.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
    <style type="text/css">
        .ui-datepicker-title span {
            display: inline;
        }

        button.ui-datepicker-current {
            display: none;
        }
        
    	table#grid td{
    		height:23px;
    		border: 1px solid #aaa;
    		vertical-align: middle;
    		cursor: pointer;
    	}

    	table#grid thead td{
    		height:18px;
    		background-color: #eee;
    	}

    </style>

    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="js/jquery.formalize.js"></script>
    <script src="js/attendance.js"></script>
    

    <script type="text/javascript">
    	
    	function Info(){
    		this.attendances = {};		//记录考勤信息   key=staffId value={ attendace  信息}
    		this.recs = {};						//记录所有考勤信息		key=staffId-YYYY-MM-DD  value=attendance/legalHoliday ....
    		this.workflow = {};				//流转情况
    		this.status = {
    				"draft":"草稿",
    				"review":"已提交",
    				"back":"审核退回",
    				"finish":"审核通过"
    		};
    		this.attachModelName = "iasWorkflowAttach";
    		return this;
    	}
    	
    	var workflowId = '<%=request.getParameter("id")%>';
    	var from = '<%=request.getParameter("from")%>';
    	
    	var info = new Info();
    	
    	var page = {
    		iasItem : {},
    		iasSelect : $('<select></select>'),	//考勤下拉列表项
    		iasColor : {											//考勤选项显示颜色
    	             attendance: "black",
    	             legalHoliday: "green",
    	             generalHoliday: "green",
//     	             publicHoliday: "red",
//     	             visitation: "red",
//     	             maritalLeave: "red",
//     	             funeralLeave: "red",
//     	             sickLeave: "red",
//     	             maternityLeave: "red",
//     	             personalLeave: "red",
//     	             absenteeism: "red",
//     	             breastfeedingLeave: "red",
    	             publicErrand: "green"
//     	             workInjury: "red"
    			}
    	};

    	
    	
    	$(function (){


    		
    		$.ajaxSetup({async:false});  
    		
    		// from = deptStatistics 时的操作
    		if(from == "deptStatistics"){
    			$("#finish,#back").hide();
    			$("#nav").html('<li><a>首页</a></li><li><a>考勤信息管理</a></li><li><a>按部门统计</a></li><li class="fin">详情</li>');
    			$("#title").html("按部门统计");
    		}
    		
    		
    		
    		
    		$.getJSON(
			        "./basicCrud/iasWorkflow/all?id="  + workflowId, 
			        function (rtn){
			    		if(chkRtn(rtn)){
			    			info.workflow = rtn.result[0];
			    			
			    			var status = info.workflow.status;
			    			
			    			setWrokflowStatus(status);	//设置流程状态
			    			
			    			//getAttach(info.attachModelName, workflowId);
			    			
			    			if(status != "review" ){
			    				$("#finish,#back").hide();
			    			}
			    			$("#iasMonth").html("考勤月份 : " + info.workflow.iasMonth);
			    			$.getJSON(
			    				"./basicCrud/iasAttendance/all?workflowId=" + workflowId,
			    				function (_rtn){
			    					if(chkRtn(_rtn)){
			    						attendances = _rtn.result;
			    						for(var i in attendances){
			    							var attendance = attendances[i];
			    							info.attendances[attendance.staffId] = attendance;
			    							var ym = info.workflow.iasMonth.split("-");
			    							var y = ym[0];
			    							var m = ym[1];
			    							var rec = attendance.rec;
			    							if(rec){
			    								rec = $.parseJSON(rec);
			    								for(var d in rec){
			    									var key = getKey(attendance.staffId, y, m, d);
			    									info.recs[key] = rec[d]; 
			    								}
			    							}
			    						}
			    					}
			    				}
			    			);
			    	    }else{
			    	    	setWrokflowStatus("draft");
			    	    }
			        }
			     );
    		
    		
    		
    		
    		
    		
    		
    		//获取考勤下拉列表项
    		$.getJSON(
    			"./basicCrud/iasAttendance/getEntityProperty?fieldFilter=rec&isNeeded=true",
    			function (rtn){
    				page.iasItem = rtn.result.fieldProperties[0].option;
    				delete page.iasItem[""];
    			}
    		);
    		
    		
			//同意
    		$("#finish").click(function (){
    			if(saveWorkflow("finish")){
    				alert("操作成功");
    				setWrokflowStatus("finish");
        			$("#finish,#back").hide();
    			}else{
    				alert("操作失败");
    			}

    		});

			//退回
    		$("#back").click(function (){
    			if(saveWorkflow("back")){
    				alert("操作成功");
    				setWrokflowStatus("back");
        			$("#finish,#back").hide();
    			}else{
    				alert("操作失败");
    			}
    		});
    		
    		//关闭
    		$("#exit").click(function (){
    			if(confirm("是否关闭此页面?")){
    				window.close();
    			}
    		});
    		
    		if( !$.isEmptyObject(info.workflow)){
    			search(info.workflow.iasMonth);    			
    		}

    	});
    	

    	
    	//该方法设置当前考勤表状态
    	function setWrokflowStatus(status){
    		$("#currentStatus").html("考勤表状态：" + info.status[status]);
    	}
    	
    	
    	
    	//该方法保存或更新流转信息表
    	//保存成功 返回workflowId  失败 返回false
    	function saveWorkflow(status){

			var iasMonth = info.workflow.iasMonth;
			var initiateTime=info.workflow.initiateTime.replace(new RegExp("-","gm"),"/");
			info.workflow.initiateTime=new Date(initiateTime).getTime();
			info.workflow.handleTime = new Date().getTime();
			info.workflow.status = status;

			for(var i in info.workflow){
				if(info.workflow[i] == null){
					delete info.workflow[i];
				}
			}
			var workflowId = false;
			$.post(
				"./basicCrud/iasWorkflow/save?",
				info.workflow,
				function (rtn){
					if(chkRtn(rtn)){	
						workflowId =  rtn.result.id;
					}
				},
				"json"
			);
			return workflowId;
    	}
    	
    	

    	
    	
    	function search(date){
    		//构建表格的head部分
    		buildHeader(date);
    		//构建表格body
    		if(! $.isEmptyObject(info.attendances)){
    			buildBody(date);
    		}
    	}

    	

    	
    	//该方法创建表格body
    	function buildBody(date){
    		var ym = date.split("-");
    		var y = ym[0];
    		var m = ym[1];
    		var iasDay = days.get(y,m);
    		
    		var b = '<tbody>';
    		var index = 1;
    		for(var i in info.attendances){
    			var a = info.attendances[i];

    			b += '<tr>';
    			b += ( '<td class=" t_c">' + index + '</td>' );
    			b += ( '<td class=" t_c">' + a.staffCode + '</td>' );
    			b += ( '<td class=" t_c">' + a.staffName + '</td>' );
    			for(var j = 0 ; j < iasDay.length ; j ++){
    				var d = iasDay[j];
    				var key = getKey(a.staffId, y, m, d);
    				//考勤值\如没有则默认 (工作日 = attendance \双休日 = legalHoliday)
    				//获取真实日期 日期>=26 月份-1  月份=0 年份-1
    				
    				var rymd =getRealYmd(y, m, d);
    				
    				var item = info.recs[key] ? info.recs[key] : ( days.isWeekend(rymd[0], rymd[1] ,rymd[2]) ? "legalHoliday" : "attendance" );
    				//显示颜色
    				var itemColor = getIasColor(item);
    				
    				//下拉列表显示名称
    				var itemName = page.iasItem[item];	
    				b +=  '<td class=" t_c edit">';
    				b += ( '<font color=' + itemColor  + '>' + itemName + '</font>' );
    				b += '</td>';
    			}
    			
    			var remark = a.remark ? a.remark : "";
    			b += ( '<td class=" t_c">' + remark + '</td>' );
    			b += '</tr>';
    			index ++;
    		}
    		b += '</tbody>';
    		$("#grid").append($(b));
    	}
    	

    	
    	//该方法创建表格头部
    	//date=考勤年月
    	function buildHeader(date){
    		var ym = date.split("-");
    		var iasDay = days.get(ym[0],ym[1]);
    		var h = '<thead><tr>';
    		h += '<td rowspan="2"  class=" t_c" width="40">序号</td>';
    		h += '<td rowspan="2"  class=" t_c" width="60">人员编号</td>';
    		h += '<td rowspan="2"  class=" t_c" width="60">人员姓名</td>';
    		h += ( '<td class=" t_c" colspan=' + iasDay.length + '>日期</td>' );
    		h += '<td rowspan="2"  class=" t_c" width="120">备注</td>';
    		h += '</tr>';
    		h += '<tr>';
    		for(var i = 0 ; i < iasDay.length ; i++){
    			var day = iasDay[i];
    			if(Number(day) > 25){
    				day = "^" + day;
    			}
    			h += ( '<td class=" t_c" width="70">' + day + '</td>' );
    		}
    		h += '</tr></thead>'

    		var w = 40 + 60 + 60 + iasDay.length * 70 + 120 + 100;
    		$("#grid").width(w).append($(h));
    	}
    	
    	function  getIasColor(item){
			var color = page.iasColor[item];
			return color ? color : "red";
    	}
    	
    	
     	//以下是 附件上传和下载 相关的方法
    	 function getAttach(modelName,workflowId){	
    		$.getJSON(
    			"./attach/api/all?modelName=" + modelName + "&modelId=" + workflowId,
    			function(rtn){
    				if(chkRtn(rtn)){
                        $("#attachInfo tr").remove();
                        var entry=rtn.result;
                        for ( var i in entry)  {
                        	var attach = entry[i];
	    	                $("#attachInfo").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td><a href=\"./attach/api/download/"+attach.id+"\">下载</a></td></tr>");
                        }
    				}
    			}
    		);
        }


    	

    </script>
</head>

<body class="Flow">
<div class="main">
    <div class="ctrl clearfix nwarp">
        <div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
        <div class="posi fl nwarp">
            <ul id="nav">
					<li><a >首页</a></li>
					<li><a>考勤信息管理</a></li>
					<li class="fin">考勤信息审批</li>
            </ul>
        </div>
    </div>
    <div class="pt45">

        <div class="filter">
            <div class="query">
                <div class="filter_search p8">
                      <table class="nwarp" style="width: 500">
                          <tr>
                            <td width="100"></td>
                             <td class="t_l" width="200" id="iasMonth"></td>
                             <td class="t_l" width="200" id="currentStatus"></td>
                             <td class="t_l">
                            	<!-- 附件内容: --> 
                             </td>
                             <td class="t_l" width="400" >
                             
                             	
                                <table id="attachInfo">
             							<tbody></tbody>
             					</table>
                             </td>
                             

                          </tr>
                      </table>
                     <table style="width: 100%">
             				<tr >
             					<td  class="t_r">
             						<input type="button" value="同意" id="finish">&nbsp;<input type="button" value="退回" id="back">&nbsp;<input type="button" value="关闭" id="exit">
             					</td>
             				</tr>
             			</table>
                </div>
            </div>
        </div>

        <!--Table-->
        <div  style="overflow: scroll;height: 500px;">
            <table  class="table_1" id="grid">
            	
            </table >
        </div>
        



        <!--Table End-->
    </div>
</div>
</body>
</html>

