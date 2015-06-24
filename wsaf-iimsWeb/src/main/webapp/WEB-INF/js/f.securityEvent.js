;(function($, window, document,undefined) { 
	
	 $.postSecurityRiskDetail = function(firUrl,id){
		 if(firUrl!="")
		   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/basicCrud/securityRisk/get/"+id,
						type : 'post',
						success: function(data, status, xhr) {
	
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
									var entry=data.result,isreader=false,otherdata="modelName=meeting&modelId="+id,otherdata2="";		
								
									for ( var item in entry) 
									{
									  try 
									{ 	
										 
										if($("[name="+item+"]").length > 0 )
											{	
											$("[name="+item+"]").val(entry[item]);
												
											}
									}
										catch (e) 
										{ 
											alert(e);
										}
									}
									
								}
						   }
				           }, 
				           error: function() {
				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
				           }
						});
		   }
	}
	 
	
	
	 $.postSecurityIssueDetail = function(firUrl,id){
		 if(firUrl!="")
		   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/basicCrud/securityIssue/get/"+id,
						type : 'post',
						success: function(data, status, xhr) {
	
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
									var entry=data.result,isreader=false,otherdata="modelName=meeting&modelId="+id,otherdata2="";		
								
									for ( var item in entry) 
									{
									  try 
									{ 	
										 
										if($("[name="+item+"]").length > 0 )
											{	
											$("[name="+item+"]").val(entry[item]);
												
											}
									}
										catch (e) 
										{ 
											alert(e);
										}
									}
									
								}
						   }
				           }, 
				           error: function() {
				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
				           }
						});
		   }
	}
	 
	 $.postSecurityEventDetail = function(firUrl,id){
			 if(firUrl!="")
			   {	
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/securityEvent/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
		
								if (status == "success" && data != null)
								{
									if (data.success == true) 
									{
										var entry=data.result,isreader=false,otherdata="modelName=meeting&modelId="+id,otherdata2="";		
									
										for ( var item in entry) 
										{
										  try 
										{ 	
											 
											if($("[name="+item+"]").length > 0 )
												{	
												$("[name="+item+"]").val(entry[item]);
													
												}
										}
											catch (e) 
											{ 
												alert(e);
											}
										}
										
									}
							   }
					           }, 
					           error: function() {
					              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
					           }
							});
			   }
		}
	 
	 $.getRoleIdentity = function (firUrl,companyId,role) {
         var _retrunstr;

         if (firUrl != "") {
             $.ajax({
                 async: false,
                 url: firUrl + "/basicCrud/manager/all?companyId=" + companyId+"&role="+role,
                 type: 'post',
                 success: function (data, status, xhr) {
                     if (status == "success" && data != null) {

                            	 _retrunstr= { name: data.result[0].userName,loginName:data.result[0].loginName};
                     }
                 }
             });
         }
         return _retrunstr;
     }
	 
		$.getSuggestSecurityEvent = function(firUrl,_id){
			if(firUrl!="")
			   {
			 $.ajax({
				    async: false,
				    url : firUrl+"/basicCrud/workflowLog/all?ptype=securityEvent&pid="+_id+"&sort=initiateTime desc",
					type : 'post',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{ 
						   if (data.result&&JSON.stringify(data.result) != "[]") 	
							{
							   $.each(data.result,function(entryIndex,entry) 
							    {
								   var _str="";
								   switch(entry.status)
		       						{
								   case "部门安全负责人审核":
		       						case "审核通过":
		       						case "业务负责人退回":
		       						case "部门安全负责人退回":

		       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i></i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
		       						
		       						break;
		       						case "信息中心安全负责人审核":
		       						case "信息中心安全负责人退回":
		       						
		       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
		       						
		       							
		       							break;
		       						case "维保中心安全负责人审核":
		       						case "维保中心安全负责人退回":
		       							
		       							_str="<div class=\"node\"><b class=\"fl\">部门意见"+_str3+" </b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i>维保中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
		       						
		       						break;
		
			                   
		       						}
								   var info = $.getFile({"url":firUrl, "otherdata":"groupName=procedure&modelName=projectPlan&modelId="+entry.id,"type":"2"});
								   
								   if(info!=""&&info!=null)
								    _str+="<table>"+info+"</table>";
								   
							
								   $("#leaderSuggest tbody tr td:first").append(_str);
								});
							}
						}
					}
				});
		    }
		
		  }	
	 
		
		$.getSuggestSecurityRisk = function(firUrl,_id){
			if(firUrl!="")
			   {
			 $.ajax({
				    async: false,
				    url : firUrl+"/basicCrud/workflowLog/all?ptype=securityRisk&pid="+_id+"&sort=initiateTime desc",
					type : 'post',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{ 
						   if (data.result&&JSON.stringify(data.result) != "[]") 	
							{
							   $.each(data.result,function(entryIndex,entry) 
							    {
								   var _str="";
								   switch(entry.status)
		       						{
							
		       						case "审核通过":

		       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i></i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
		       						
		       						break;
		       						case "信息中心安全负责人退回":
		       						
		       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
		       						
		       							
		       							break;
		       						
		
			                   
		       						}
								   var info = $.getFile({"url":firUrl, "otherdata":"groupName=procedure&modelName=projectPlan&modelId="+entry.id,"type":"2"});
								   
								   if(info!=""&&info!=null)
								    _str+="<table>"+info+"</table>";
								   
							
								   $("#leaderSuggest tbody tr td:first").append(_str);
								});
							}
						}
					}
				});
		    }
		
		  }	
		
		$.getSuggestSecurityIssue = function(firUrl,_id){
			if(firUrl!="")
			   {
			 $.ajax({
				    async: false,
				    url : firUrl+"/basicCrud/workflowLog/all?ptype=securityIssue&pid="+_id+"&sort=initiateTime desc",
					type : 'post',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{ 
						   if (data.result&&JSON.stringify(data.result) != "[]") 	
							{
							   $.each(data.result,function(entryIndex,entry) 
							    {
								   var _str="";
								   switch(entry.status)
		       						{
							
		       						case "审核通过":

		       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i></i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
		       						
		       						break;
		       						case "信息中心安全负责人退回":
		       						
		       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
		       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
		       						
		       							
		       							break;
		       						
		
			                   
		       						}
								   var info = $.getFile({"url":firUrl, "otherdata":"groupName=procedure&modelName=projectPlan&modelId="+entry.id,"type":"2"});
								   
								   if(info!=""&&info!=null)
								    _str+="<table>"+info+"</table>";
								   
							
								   $("#leaderSuggest tbody tr td:first").append(_str);
								});
							}
						}
					}
				});
		    }
		
		  }	
	 
})(jQuery, window, document);