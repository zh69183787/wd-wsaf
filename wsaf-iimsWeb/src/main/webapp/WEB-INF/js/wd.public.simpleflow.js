

$.ajaxLoadFlowLogs = function(firUrl,objId,simpleClassName,type){//String objId,String simpleClassName,String type
	//var params = "objId="+objId+"&simpleClassName="+simpleClassName+"&type="+type;
	$.openLoading();
	 $.ajax({
		  	async: false,
		    url : firUrl+"/simpleFlow/loadFlow",
			type : 'post',
			data: "objId="+objId+"&simpleClassName="+simpleClassName+"&type="+type,
			success: function(data, status, xhr) {
				//$.analyzeTableData(data, status, xhr,webpath,null);
				//alert(data.logs.length);
				$("#simpleFlowLogs").html("");
				for(var i=0;i<data.logs.length;i++){
					if(data.logs[i].node.nodeCode=="startUser"){ continue;}
					var html = "<div class='node'><b class='fl'>"+data.logs[i].nodeName+"</b>"+
								"<div class='clear'></div><div class='con'>"+
								"<i>"+data.logs[i].dealDept+"</i>"+
								"<div>"+
								"<p>"+data.logs[i].suggestion+"</p>"+
								"</div>"+
								"<div class='t_r'>"+data.logs[i].dealUser+"<span class='date_02 mr5'>"+data.logs[i].dealTime+"</span>"+
								"</div>"+
								"</div>"+
								"</div>";
					$("#simpleFlowLogs").append(html);
					
				}
				if(data.userLog!=null&&data.userLog.id!=null){ //判断发起人  的话放出提交审核
					var slname = $("#main_startUserLoginname").val();
					if(data.userLog.dealUserLoginname==slname){ // 当前处理人为  发起人
						$("#saveFormSubmitWithFlow").show();
						if(data.userLog.nextLog!=null&&data.userLog.nextLog.dealUserLoginname==null){
							var nextSelect = "<tr><td class='lableTd t_r'>下一步处理人</td>"+
			                "<td colspan='3'>"+
			                "<input type='hidden'  value='"+data.userLog.dealDeptId+"' name='nextLog.dealDeptId' class='input_large'/>"+
			                "<input type='hidden'  value='"+data.userLog.dealDept+"' name='nextLog.dealDept' class='input_large'/>"+
			                "<select id='deptUserSelect"+data.userLog.dealDeptId+"' name='nextLog.dealUserLoginname' class='input_large'></select>"+
			                "</td></tr>"+
			                " <input type='hidden' value='"+data.userLog.id+"' name='id' />"+
			                " <input type='hidden' value='"+data.userLog.orderIndexNext+"' name='orderIndexNext' />"+
			                " <input type='hidden' value='"+data.userLog.mainId+"' name='mainId' />"+
			                " <input id='nextLog_dealUser"+data.userLog.dealDeptId+"' type='hidden' value='' name='nextLog.dealUser' />"+
							" <input type='hidden' value='"+data.userLog.nextLog.id+"' name='nextLog.id' />";

							$("#simpleFlowNextDeal").append(nextSelect);
							
							$("#deptUserSelect"+data.userLog.dealDeptId).change(function(){
								var val = $(this).val();
								$(this).find("option").each(function(i,n){
									if($(n).attr("value")==val){
										$("#nextLog_dealUser"+data.userLog.dealDeptId).val($(n).text());
									}
								});
								
							});
							
							$.ajaxLoadDeptUserForSimpleFlow(firUrl,data.userLog.dealDeptId,data.userLog.nextLog.node.nodeCode);
						}
					}else{// 不为当前发起人
						var dealUserlogin = $("#main_dealUserLoginname").val(); //当前处理人LOGINNAME
						//alert(dealUserlogin+":::"+data.userLog.dealUserLoginname);
						if(dealUserlogin==data.userLog.dealUserLoginname){//当前登录人为当前处理人
							var dealHtml = 
			                " <input type='hidden' value='"+data.userLog.id+"' name='id' />"+
			                " <input type='hidden' value='"+data.userLog.orderIndexNext+"' name='orderIndexNext' />"+
			                " <input type='hidden' value='"+data.userLog.mainId+"' name='mainId' />";
							if(data.userLog.orderIndexNext==null||data.userLog.orderIndexNext=='-1'){ //表示为最终处理人处理
								//$("#nextDoText").hide();
								$(".nextDoText textarea").html("当前为最终处理！");
							}else if(data.userLog.nextLog!=null){// 不为最终处理人   考虑下一步处理人是否为空
								
								dealHtml +="<input type='hidden' value='"+data.userLog.nextLog.id+"' name='nextLog.id' />";
								if(data.userLog.nextLog.dealUserLoginname==null){//下一步处理人 未选择
									dealHtml+="<input type='hidden'  value='"+data.userLog.dealDeptId+"' name='nextLog.dealDeptId' />"+
					                "<input type='hidden'  value='"+data.userLog.dealDept+"' name='nextLog.dealDept' />"+
					                " <input id='nextLog_dealUser"+data.userLog.dealDeptId+"' type='hidden' value='' name='nextLog.dealUser' />";
									
									var dealSelect ="<tr><td class='td_1'>&nbsp;</td><td><div class='red'> *</div>下一步处理人</td></tr>"+
										"<tr><td class=td_1>&nbsp;</td><td>"+
										"<select id='deptUserSelect"+data.userLog.dealDeptId+"' name='nextLog.dealUserLoginname' class='input_large'></select>"+
						                "</td></tr>";
									$("#dealFlowWindowFormSelect").html(dealSelect);
									$.ajaxLoadDeptUserForSimpleFlow(firUrl,data.userLog.dealDeptId,data.userLog.nextLog.node.nodeCode);
									$("#deptUserSelect"+data.userLog.dealDeptId).change(function(){
										var val = $(this).val();
										$(this).find("option").each(function(i,n){
											if($(n).attr("value")==val){
												$("#nextLog_dealUser"+data.userLog.dealDeptId).val($(n).text());
												//下一步提示
												var ts = "下一步交由 "+data.userLog.dealDept+" "+$(n).text()+" 进行处理";
												$(".nextDoText textarea").html(ts);
											}
										});
									});
									//<input type='hidden' name='nextLog.dealUserLoginname' value='"+data.userLog.nextLog.dealUserLoginname+"' />
								}else{//下一步处理人 已选择
									dealHtml+="<input type='hidden' name='nextLog.dealUserLoginname' value='"+data.userLog.nextLog.dealUserLoginname+"' />"+
									"<input type='hidden'  value='"+data.userLog.nextLog.dealDeptId+"' name='nextLog.dealDeptId' />"+
					                "<input type='hidden'  value='"+data.userLog.nextLog.dealDept+"' name='nextLog.dealDept' />"+
					                " <input type='hidden' value='"+data.userLog.nextLog.dealUser+"' name='nextLog.dealUser' />"+
									" ";
									//下一步提示
									var ts = "下一步交由 "+data.userLog.nextLog.dealDept+" "+data.userLog.nextLog.dealUser+" 进行处理";
									$(".nextDoText textarea").html(ts);
								}
								
								
								
							}
							

							$("#dealFlowWindowForm .hid_data").html(dealHtml);
							
							
							
							//变为可处理状态
							$(".ywbl").removeClass("disable");
							$(".ywbl").click(function(){
								var h = $(document).scrollTop()+120;
								$(".f_window").css("margin-top",h+"px");
								$(".f_window").show();
							});
							
						}
						
						/*if(data.userLog.nextLog!=null&&data.userLog.nextLog.dealUserLoginname==null){
							var nextSelect = "<tr><td class='lableTd t_r'>下一步处理人</td>"+
			                "<td colspan='3'>"+
			                "<input type='hidden'  value='"+data.userLog.dealDeptId+"' name='nextLog.dealDeptId' class='input_large'/>"+
			                "<input type='hidden'  value='"+data.userLog.dealDept+"' name='nextLog.dealDept' class='input_large'/>"+
			                "<select id='deptUserSelect"+data.userLog.dealDeptId+"' name='nextLog.dealUserLoginname' class='input_large'></select>"+
			                "</td></tr>"+
			                " <input type='hidden' value='"+data.userLog.id+"' name='id' />"+
			                " <input type='hidden' value='"+data.userLog.orderIndexNext+"' name='orderIndexNext' />"+
			                " <input type='hidden' value='"+data.userLog.mainId+"' name='mainId' />"+
			                " <input id='nextLog_dealUser"+data.userLog.dealDeptId+"' type='hidden' value='' name='nextLog.dealUser' />"+
							" <input type='hidden' value='"+data.userLog.nextLog.id+"' name='nextLog.id' />";

							$("#simpleFlowNextDeal").append(nextSelect);
							
							$("#deptUserSelect"+data.userLog.dealDeptId).change(function(){
								var val = $(this).val();
								$(this).find("option").each(function(i,n){
									if($(n).attr("value")==val){
										$("#nextLog_dealUser"+data.userLog.dealDeptId).val($(n).text());
									}
								});
								
							});
							
							$.ajaxLoadDeptUserForSimpleFlow(firUrl,data.userLog.dealDeptId,data.userLog.nextLog.node.nodeCode);
						}else{
							var nextSelect = 
			                " <input type='hidden' value='"+data.userLog.id+"' name='id' />"+
			                " <input type='hidden' value='"+data.userLog.orderIndexNext+"' name='orderIndexNext' />"+
			                " <input type='hidden' value='"+data.userLog.mainId+"' name='mainId' />";
							if(data.userLog.orderIndexNext==null||data.userLog.orderIndexNext=='-1'){ //表示为最终处理人处理
								$(".nextDoText").hide();
							}else{
								nextSelect+="<input type='hidden' name='nextLog.dealUserLoginname' value='"+data.userLog.nextLog.dealUserLoginname+"' />"+
								"<input type='hidden'  value='"+data.userLog.nextLog.dealDeptId+"' name='nextLog.dealDeptId' />"+
				                "<input type='hidden'  value='"+data.userLog.nextLog.dealDept+"' name='nextLog.dealDept' />"+
				                " <input type='hidden' value='"+data.userLog.nextLog.dealUser+"' name='nextLog.dealUser' />"+
								" <input type='hidden' value='"+data.userLog.nextLog.id+"' name='nextLog.id' />";
							}

							$("#dealFlowWindowForm .hid_data").html(nextSelect);
							
							
							
							$(".ywbl").removeClass("disable");
							$(".ywbl").click(function(){
								var h = $(document).scrollTop()+120;
								$(".f_window").css("margin-top",h+"px");
								$(".f_window").show();
							});
						}*/
					}
					//var nextDealUserLoginname = data.userLog.nextLog.dealUserLoginname;
					
				}
				if(data.main!=null){
					$("#simpleFlowMainInfo [name='main.statusDetail']").val(data.main.statusDetail);
					
					if(data.main.status=="2"){
						$("#simpleFlowMainInfo [name='main.nowLog.dealUser']").val("");
						$("#simpleFlowMainInfo .main_nowLog_dealUser").hide();
					}else{
						//$("#simpleFlowMainInfo [name='main.nowLog.dealUser']").val(data.userLog.nextLog.dealUser);
					}
					
					$("#simpleFlowMainInfo").show();
					$("#simpleFlowMainInfoLogs").show();
				}else{
					$("#simpleFlowMainInfo").hide();
					$("#simpleFlowMainInfoLogs").hide();
				}
				
				
			$.closeLoading();
        }, 
        error: function() {
        	$.closeLoading();
           alert("对不起！你的请求出现异常，请联系服务人员！");
        }
	});
}
$.ajaxLoadDeptUserForSimpleFlow= function(firUrl,deptID,type){
	//alert(type);
	var url ="/ca/getDeptUser";
	var deStr ="请选择人员";
	if(type!=null&&type=='deptLeader'){
		url ="/ca/getDeptLeaders";
		deStr ="请选择部门领导";
	}else if(type!=null&&type=='deptLeaderOther'){ //选择其他部门人员
		
	}
	
	$.openLoading();
	$.ajax({
		async: false,
		url : firUrl+url,
		type : 'post',
		data: "deptId="+deptID,
		success: function(data, status, xhr) {
			var html = "<option value='-1'>"+deStr+"</option>";
			$.each(data,function(index,item){
				html+="<option value='"+index+"'>"+item+"</option>";
			});
			$("#deptUserSelect"+deptID).html(html);
			$.closeLoading();
	    }, 
	    error: function() {
	       flowHiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
	       $.closeLoading();
	    }
	});
}

$.ajaxSaveFirstStartFlow= function(firUrl,formId){
	$.closeLoading();
	//alert($("#"+formId+" select[name='nextLog.dealUserLoginname']").length);
	if($("#"+formId+" [name='orderIndexNext']").eq(0).val()=="-1"){//最后处理节点
		
	}else{
		if($("#"+formId+" [name='nextLog.dealUserLoginname']").length<=0){
			alert("您不能执行该操作！");
			return false;
		}
		if($("#"+formId+" [name='nextLog.dealUserLoginname']").eq(0).val()=="-1"){
			alert("请正确选择人员！");
			$("#"+formId+" [name='nextLog.dealUserLoginname']").eq(0).focus();
			return false;
		}
	}
	
	$.openLoading();
	$.ajax({
		async: false,
		url : firUrl+"/simpleFlow/dealFlow",
		type : 'post',
		data: $("#"+formId).serialize(),
		success: function(data, status, xhr) {
			
			alert("操作完成！");
			window.location.reload();
			//$.closeLoading();
	    }, 
	    error: function() {
	    	
	       alert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
	       $.closeLoading();
	    }
	});
}