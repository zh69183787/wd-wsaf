<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>考勤信息录入</title>
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
     <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
     <link rel="stylesheet" href="js/jqx/styles/jqx.base.css" type="text/css" />
    <style type="text/css">
        .ui-datepicker-title span {
            display: inline;
        }

        button.ui-datepicker-current {
            display: none;
        }
        .black{
		color: black;
		}
        .red{
			color: red;
		}
		.green{
			color: green;
		}
        
        
    	table#grid td{
    		height:23px;
    		border: 1px solid #aaa;
    		vertical-align: middle;
    		cursor: pointer;
    	}
    	
    	table#grid select{
    		display:none;
    		width:100%;
    		font-size: 13px;
    	}

    	table#grid thead td{
    		height:18px;
    		background-color: #eee;
    	}
    	
    	input.save,input.submit,input.close{
    		display: none;
    	}
    	
    .ui-datepicker-calendar {
        display: none;
        }
    	
    </style>

    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jqx/jqx-all.js"></script>


    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="js/jquery.formalize.js"></script>
    <script src="js/attendance.js"></script>
    <script src="js/jquery.uploadify-3.1.js"></script>

    
    
    

    <script type="text/javascript">
    function getMonth(d,interval){
        //获取上月
        var dd = d.split("-");
        var strMonth = parseInt(dd[1])-1;
        var strYear = dd[0];
        if(strMonth<10)
        {
            strMonth="0"+strMonth;
        }

        if(strMonth == 0){
            strYear -- ;
            strMonth = 1;
        }

        return strYear + "-" + strMonth;

    }
    	
    	function Info(){
    		this.dept = "";						//部门号
    		this.cookieUser = {};				//当前登录人cookie信息
    		this.user = {};						//当前staff的user
    		this.leader = {};					//部门领导
    		this.staffs = {};						//部门员工对象    key=staffId value={ staff 信息 }
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
    	

    	
    	
    	var info = new Info();
    	var page = {
    		iasItem : {},
    		iasNameItem : {},
    		iasColor : {											//考勤选项显示颜色
	             attendance: "black",
	             legalHoliday: "green",
	             generalHoliday: "green",
	             publicErrand: "green"
			}
    	};

    	
    	$(function (){
 		   $('#iasMonth').datepicker( {
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


    		
    		$.ajaxSetup({
    				async:false,
    				cache:false
    			});  
    		
    		//initUpload();
    		
    		
    		//获取考勤下拉列表项
    		$.getJSON(
    			"./basicCrud/iasAttendance/getEntityProperty?fieldFilter=rec&isNeeded=true",
    			function (rtn){
    				page.iasItem = rtn.result.fieldProperties[0].option;
    				delete page.iasItem[""];
    				
    				for(var i in page.iasItem){
    					page.iasNameItem[page.iasItem[i]] = i;
    				}
    				
    			}
    		);
    		
    		
    		//保存
    		$("input.save").click(function (){
    			var workflow = saveWorkflow("draft");
    			if(workflow){
    				info.workflow = workflow;
    				//bindAttach(workflow.id);
	    			saveAttendance(workflow.id);
	    			setWrokflowStatus("draft");
    			}
    		});
    		
    		//提交
    		$("input.submit").click(function (){
                //判断上月是否已填写完成
                var flag = false;
                var lastUrl = "./basicCrud/iasWorkflow/all?status=finish&iasDept=" + info.dept + "&iasMonth=" + getMonth($('#iasMonth').val(),-1);
                $.getJSON(
                        lastUrl ,
                        function (rtn){
                            //alert(rtn);
                            if(rtn.success){
                                var r = rtn.result;
                                for(var key in r){
                                    //alert(r[key].status);
                                    if(r[key].status == "finish" ){
                                        flag = true;
                                        break;
                                    }
                                }
                                if(flag){
                                    var workflow = saveWorkflow("review");
                                    if(workflow){
                                        info.workflow = workflow;
                                        //bindAttach(workflow.id);
                                        saveAttendance(workflow.id);
                                        setWrokflowStatus("review");
                                        setReadOnlyMode();
                                    }
                                }else{
                                    alert("请完成上月考勤！");
                                    return false;
                                }
                            }
                        });
    		});
    		
    		//重置
    		$("#reset").click(function (){
    			$('#iasMonth').val(getNowYm());
    			$("#search").click();
    		});
    		
    		
    		//查询
    		$("#search").click(function (){
        		//初始化表格\参数
        		$("#grid").remove();
        		$("#scrollDiv").append($("<div id='grid'></div>"));
				
        		info = new Info();
                $("#attachInfo tr").remove();
    			search( $("#iasMonth").val());
        		$("input.save,input.submit,input.close,a.del").show();
        		
    			//流转情况存在 且处于待审批\完成状态时 不能修改 \附件只能下载
    			if( ! $.isEmptyObject(info.workflow) &&  ( info.workflow.status ==  "review" || info.workflow.status ==  "finish" )){
    				setReadOnlyMode();
    			}
    		}).click();
    		

    		
    	});
    	
    	
    	//设置页面为只读模式\隐藏 保存提交按钮\移除双击显示下拉列表事件
    	function setReadOnlyMode(){
			$("input.save,input.submit").hide();
			$("#grid").jqxGrid({editable:false});
			$("a.del").hide();
    	}
    	
    	//该方法保存或更新流转信息表
    	//保存成功 返回workflow对象  失败 返回false
    	function saveWorkflow(status){

			var iasMonth = info.workflow.iasMonth ? info.workflow.iasMonth : $('#iasMonth').val();
			
			info.workflow.iasName = iasMonth + "考勤表";
			info.workflow.iasDept = info.dept;
			info.workflow.iasMonth = iasMonth;
			info.workflow.initiator = info.cookieUser.userName;
			info.workflow.initiatorLoginname =  info.cookieUser.loginName;
			info.workflow.initiateTime = new Date().getTime();
			info.workflow.handler = info.leader.userName;
			info.workflow.handlerLoginname = info.leader.loginName;
			info.workflow.status = status;
			info.workflow.handleTime = "";
			/**
			*删除空元素
			**/
			for(var i in info.workflow){
				if(info.workflow[i] == null){
					delete info.workflow[i];
				}
			}
// 			alert($.param(info.workflow));
			var workflow = false;
			$.post(
				"./basicCrud/iasWorkflow/save?",
				info.workflow,
				function (rtn){
					if(chkRtn(rtn)){	
						workflow =  rtn.result;
					}
				},
				"json"
			);
			return workflow;
    	}
    	
    	
    	
    	//该方法从table中获取 考勤信息
    	function saveAttendance(workflowId){
    		var bool = true;
    		
    		
    		 var rows = $('#grid').jqxGrid('getboundrows');
    		 for(var i = 0 ; i < rows.length ; i ++){
    			 var row = rows[i];
    			 var r = {};
    			 
    			 if(row.attendanceId){
    				 r.id = row.attendanceId;
    			 }
    			 r.workflowId = workflowId;
    			 r.remark = row.remark;

    			 var rec = {};
    			 for(var d = 1 ; d <= 31 ; d ++){
    	 			if(d == 1){
    	        		r.staffId = row.staffId;
    	        		r.iasMonth = $("#iasMonth").val();
    	        		r.staffName = info.staffs[row.staffId].staffName;
    	        		r.staffCode = info.staffs[row.staffId].staffCode;
    				}
    				 
    				 
    				d = ( d < 10 ? "0" : "" ) + d;
    			    var column = $('#grid').jqxGrid('getcolumn', d);
    			   	if(column != null){
    			   		rec[d] = page.iasNameItem[row[d]];
    			   	}
    			 }
    			 
     			if(! $.isEmptyObject(rec)){
    				r.rec = JSON.stringify(rec);
    			}
     			
    			$.post(
        			"./basicCrud/iasAttendance/save",
        			r,
        			function (rtn){
        				if(chkRtn(rtn)){
        					
        					var d = $("#grid").jqxGrid('getrowdatabyid', row.id);
        					d.attendanceId = rtn.result.id;
        					$("#grid").jqxGrid("updaterow", row.id,d);
        				}else{
        					bool = false;
        				}
        			},
        			"json"
        		);

    		 }
    		 
     		if(bool){
    			alert("操作成功");
    		}else{
    			alert("操作失败");
    		}
    		return bool;

    	}
    	
    	

    	
    	
    	function search(date){

    		//从cookie中获取登录人信息
    		$.getJSON(
    			"./ca/getCookies",
    			function(rtn){
    				info.cookieUser = rtn;
    			}
    		);
    		
    		//通过loginName获取当前部门id
    		if(! $.isEmptyObject(info.cookieUser)){
    			$.getJSON(
    				"./basicCrud/iasStaff/all?loginName=" + info.cookieUser.loginName,
    				function (rtn){
	    				if(chkRtn(rtn)){
	    					info.user = rtn.result[0];
	    					info.dept =info.user.unitCode == "00" ? info.user.deptCode : info.user.unitCode;
	    					if(info.dept.length > 4){
	    						info.dept = info.dept.substring(0,4);
	    					}
	    	    		}
    				}
    			);
    		}

    		

    		if(info.dept && ! $.isEmptyObject(info.cookieUser)){
				//通过部门id 获取部门下所有的员工数据
				var url = "./basicCrud/iasStaff/all?" + ( ( info.user.unitCode == "00" ? "deptCode" : "unitCode") + "_sl=" + info.dept );
	    		$.getJSON(
	        		url,
	        		function (rtn){
	    				if(chkRtn(rtn)){
	    					var staffs = rtn.result;
	    					for(var i = 0 ; i < staffs.length ; i ++){
	    						var s = staffs[i];
	    						info.staffs[s.id] = s;
	    					}
	    	    		}
	        		}
	        	);
				

	    		//通过部门id 获取部门领导信息
	    		$.getJSON(
	    			"./ca/getDeptSingleLeader?deptId=" + info.cookieUser.deptId,	
	    			function (rtn){
	    				if( ! $.isEmptyObject(rtn)){
	    					for(var i in rtn){
	    						var l = rtn[i].split(",");
	    						info.leader.loginName = l[0];
	    						info.leader.userName = l[1];
	    						break;
	    					}
	    				}
	    		});
	    			
	    		
	    		
	    		
	    		
	    		//如果 scheduleWorkflowId 不为null 则为待办事项,直接通过该id获取workflow
	    		var scheduleWorkflowId = '<%=request.getParameter("id")%>';
	    		if(scheduleWorkflowId == 'null'){
	    			url = "./basicCrud/iasWorkflow/all?iasDept=" + info.dept + "&iasMonth=" + date;
	    		}
	    		//通过部门id  + 年月 获取workflow
	    		else{
	    			url = "./basicCrud/iasWorkflow/all?id=" + scheduleWorkflowId;		
	    		}
	    		
	    		$.getJSON(
			        url , 
			        function (rtn){
			    		if(chkRtn(rtn)){
			    			info.workflow = rtn.result[0];
			    			$("#iasMonth").val(info.workflow.iasMonth);
			    			
			    			setWrokflowStatus(info.workflow.status);
			    			
			    			
			    			//根据workflow_id获取附件
			    			//getAttach(info.attachModelName, info.workflow.id);
			    			
			    			
			    			//根据workflow_id 获取考勤信息
			    			$.getJSON(
			    				"./basicCrud/iasAttendance/all?workflowId=" + info.workflow.id,
			    				function (_rtn){
// 			    					alert(JSON.stringify(_rtn));
			    					if(chkRtn(_rtn)){
			    						attendances = _rtn.result;
			    						for(var i in attendances){
			    							var attendance = attendances[i];
			    							
			    							info.attendances[attendance.staffId] = attendance;
			    							var ym = date.split("-");
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
			}
    		
    		//构建表格body
    		if(! $.isEmptyObject(info.staffs)){
    			
    			
        		//构建下拉列表
        		var iasItem = [];
        		for(var i in page.iasItem){
        			iasItem.push( { label : page.iasItem[i],value : i });
        		}
        		var iasItemSource ={
                     datatype: "array",
                     datafields: [ { name: 'label', type: 'string' }, { name: 'value', type: 'string' } ],
                     localdata: iasItem
                };
        		var iasItemAdapter = new $.jqx.dataAdapter(iasItemSource, {autoBind: true});
    			

    			
    			var df = [
                          { name: 'id', type: 'string' },
                          { name: 'index', type: 'string' },
                          { name: 'staffId', type: 'string' },
                          { name: 'attendanceId', type: 'string' },
                          { name: 'staffName', type: 'string' },
                          { name: 'staffCode', type: 'String' },
                          { name: 'remark', type: 'String' }
                ];           
    			
    			
    			for(var i = 1 ; i <= 31 ; i ++){
    				d = ( i < 10 ? "0" : "" ) + i ;
    				df.push(  { name: d + 'Code', type: 'String' });
    				df.push(  { name: d , value: d+'Code', values: { source: iasItemAdapter.records, value: 'value', name: 'label' } }  );
    			}

    			
                $("#grid").jqxGrid({
                	editable: true,
                	selectionmode: 'multiplecellsadvanced',
                    width: "100%",
                    height:"350",
                    pageable:false,
                    source : {
                       datatype: "json",
                       datafields: df,
                       id:'id',
                       localdata : getBodyJson(date)
                    }, 
                    columns: getHeaderJson(date,iasItemAdapter),
                    columngroups: [
                       { text: '日期', align: 'center', name: 'date' }
                     ]
                 });
    			
    			
    			
    		}

    	}
    	
    	//该方法设置当前考勤表状态
    	function setWrokflowStatus(status){
    		$("#currentStatus").html("考勤表状态：" + info.status[status]);
    	}
    	

    	
    	
    	//该方法创建表格body
    	function getBodyJson(date){
    		var rtn = [];

    		var ym = date.split("-");
    		var y = ym[0];
    		var m = ym[1];
    		var iasDay = days.get(y,m);
    		

    		var index = 1;
    		for(var i in info.staffs){
        		var b = {};
    			var staff = info.staffs[i];
    			var attendance = info.attendances[staff.id];
    			if( ! attendance){
    				attendance = {};
    			}
    			b['id'] = index;
    			b['staffId'] = staff.id;
    			b["attendanceId"] = attendance.id;
    			b['index'] = index;
    			b['staffName'] = staff.staffName;
    			b['staffCode'] = staff.staffCode;

    			for(var j = 0 ; j < iasDay.length ; j ++){
    				var d = iasDay[j];

    				var key = getKey(staff.id, y, m, d);
    				
    				//考勤值\如没有则默认 (工作日 = attendance \双休日 = legalHoliday)
    				
    				//获取真实日期 日期>=26 月份-1  月份=0 年份-1
    				
    				var rymd =getRealYmd(y, m, d);
    	
    				var item = info.recs[key] ? info.recs[key] : ( days.isWeekend(rymd[0], rymd[1] ,rymd[2]) ? "legalHoliday" : "attendance" );
    				b[d+'Code'] = item;
//     				b[d] =  '<font color=' + getIasColor(item)  + '>' + page.iasItem[item] + '</font>';
    			}
    			
    			var remark = "";
    			var attendance = info.attendances[staff.id];
    			remark = attendance && attendance.remark != null ? attendance.remark : remark;
    			b['remark'] = remark;
				rtn.push(b);
    			index ++;
    			
    		}
    		return rtn;
    	}
    	

    	
    	//该方法创建表格头部
    	//date=考勤年月
    	function getHeaderJson(date,iasItemAdapter){

        	var cellclass = function (row, column, value, data) {
        		return page.iasColor[page.iasNameItem[value]] || "red";
        	};
    		
    		
    		var rtn = [
    	       { text: '序号', datafield: 'index', width: 40 ,cellsalign: 'center' ,align: 'center',pinned: true,editable: false},
               { text: '人员编号', datafield: 'staffCode' , width: 100,cellsalign: 'center',align: 'center',pinned: true,editable: false},
               { text: '人员姓名', datafield: 'staffName' , width: 65,cellsalign: 'center',align: 'center',pinned: true,editable: false}
            ];
    		var ym = date.split("-");
    		var iasDay = days.get(ym[0],ym[1]);
    		for(var i = 0 ; i < iasDay.length ; i++){
    			var text = iasDay[i];
    			if(Number(text) > 25){
    				text = "^" + text;
    			}
    			rtn.push(
    					{ 
    						text : text , 
    						datafield: iasDay[i] ,
    						width: 75,
    						columngroup: 'date',
    						cellsalign: 'center',
    						align: 'center',
    						columntype: 'dropdownlist',
                            createeditor: function (row, value, editor) {
                                editor.jqxDropDownList({ source: iasItemAdapter, displayMember: 'label', valueMember: 'value' });
                            },
                            cellclassname:cellclass
    					}
    			);
    		}
    		rtn.push({ text: '备注', datafield: 'remark' , width: 100,cellsalign: 'center',align: 'center'});
    		return rtn;
    	}
    	
    	
    	
    	function  getIasColor(item){
			var color = page.iasColor[item];
			return color ? color : "red";
    	}
    	
    	
    	//以下是 附件上传和下载 相关的方法
    	function initUpload(){
    		$("#attach").uploadify({
    	        'auto' : false,
    	           'method' : "post",
    	           'height' : 20,
    	           'width' : 100,
    	           'swf' : 'js/uploadify.swf', 
    	           'uploader' : '<%=basePath%>attach/api/upload',
    	           'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',     //描述
    	           'fileTypeExts' : '*.txt;*.xls;*.xlsx;*.doc;*.docx;*.rar;*.zip;*.jpg;*.png;*.pdf',         //文件类型
    	           'fileSizeLimit' : '30000KB',          //文件大小
    	           'buttonText' : '选择文件',         //按钮名称
    	           'fileObjName' :'uploadify',
    	           'multi' :false,
    	           'queueSizeLimit':1,
    	           'successTimeout' : 5,
    	           'requeueErrors' : false,
    	           'removeTimeout' : 1,
    	           'removeCompleted' : true,
    	           'onSelectError' : function(file,errorCode,errorMsg) {
    	          		 alert("失败");
    	                 if(errorCode==-110){
    	                     this.queueData.errorMsg = "文件太大，无法上传！";
    	                 }
    	            }, 
    	            'onUploadSuccess' : function(file, data, response){
	    	            	
	    	            $("a.del").each(function (){
	    	            	var id = $(this).attr("href");
	    	            	deleteAttach(id);
	    	            });
	    	            	
	    	             var attachs = jQuery.parseJSON(data);
	    	             var attach=attachs.result[0];
	    	             // alert(attach2);        
	    	              if(attach.id!=null){
		    	              $("#attachInfo").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td><a href=\"./attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\" onclick='return deleteAttach(" + attach.id + ");' href='" + attach.id + "'>删除</a></td></tr>");
	    	              }
    	        }
    	    });
    	}
    	
    	
    	
    	 function getAttach(modelName,workflowId){	
    		$.getJSON(
    			"./attach/api/all?modelName=" + modelName + "&modelId=" + workflowId,
    			function(rtn){
    				if(chkRtn(rtn)){
                        var entry=rtn.result;
                        for ( var i in entry)  {
                        	var attach = entry[i];
	    	                $("#attachInfo").append("<tr name=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td><a href=\"./attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\" onclick='return deleteAttach(" + attach.id + ");' href='" + attach.id + "'>删除</a></td></tr>");
                        }
    				}
    			}
    		);
        }

    	
    	function bindAttach(workflowId){
    		$("a.del").each(function (){
    			var id = $(this).attr("href");
    			$.post(
        				"./attach/api/bind?modelName=" + info.attachModelName + "&modelId="+workflowId+"&attachIds="+id
        		);
    		});

    		

    	}
    	

		function deleteAttach(id){
			$.post(
				"./attach/api/del/"+id,
				function (){
                    //alert("删除成功");
                    $("#attachInfo tr[name=" + id + "]").remove();
				}
			);
            return false;
		}

    </script>
</head>

<body class="Flow">
<div class="main">
    <div class="ctrl clearfix nwarp">
        <div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
        <div class="posi fl nwarp">
            <ul>
					<li><a>首页</a></li>
					<li><a>考勤信息管理</a></li>
					<li class="fin">考勤信息填报</li>
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
                             <td class="t_l" width="250">考勤月份：<input type="text" id="iasMonth" class="input_large" name="iasMonth" readonly="readonly"/></td>       
                             <td class="t_l" width="120" id="currentStatus">at</td>
                             <td class="t_l" width="60"><input type="button"  value="查 询" id="search"/></td>
                             <td class="t_l" width="60"><input type="button"  value="重 置" id="reset"/></td>
                          </tr>
                      </table>
                      
                      <table>
                      	<tr>                     

                      	</tr>
                      </table>
                      
                      

                     <table style="width: 100%">
                    
             				<tr >
             				 <td style="display:none"> 
             				 	<table>
             				 		<tr>
             				 			<td><input id="attach" class="upload_button" type="button" value="本地上传" /></td>
             				 			<td>
             				 				<input type="button" value="上传"  onclick="$('#attach').uploadify('upload','*');">
                							<input type="button" value="取消"  onclick="$('#attach').uploadify('cancel','*');">
                						</td>
                						<td>
             								<table id="attachInfo">
             									<tbody></tbody>
             								</table>
             							</td>
             				 		</tr>
             				 	</table>
             				 	

             				 </td>


             					<td  class="t_r"  >
             						<input type="button" value="保存" class="save">&nbsp;<input type="button" value="提交" class="submit">
             					</td>
             				</tr>

             			</table>
                </div>
            </div>
        </div>

        <!--Table-->
        <div id="scrollDiv">
            
        </div>

        
        
        <div class="filter">
            <div class="query">
                <div class="filter_search p8">
                    <form id="f2">
              			<table style="width: 100%">
             				<tr >
             					<td  class="t_r">
             						<input type="button" value="保存" class="save">&nbsp;<input type="button" value="提交" class="submit">
             					</td>
             				</tr>
             			</table>
                    </form>
                </div>
            </div>
        </div>


        <!--Table End-->
    </div>
</div>

</body>
</html>

