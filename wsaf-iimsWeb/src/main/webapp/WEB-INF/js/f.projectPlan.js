<!--2015.1.19 build-->
$.setBtn = function(firUrl,isleader){
	 $(".topage").click(function(){
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+$(this).text(),isleader);
		});
	   
        $(".prepage").click(function(){
 	    var nowpage=parseInt($(".selected a").text());
 	    
 	 if(nowpage>1){
 		var topage=nowpage-1;
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage,isleader);}
		}); 
  
      $(".nextpage").click(function(){
 	    var nextpage=parseInt($(".selected a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+nextpage,isleader);
		}); 

   $("#gopagebtn").click(function(){
 	  var topage=parseInt($("#gopage").val());
   
     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
 		 {
 		   $.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage,isleader);
 		 }
     	 else
     	 {
     	   alert("超出索引值");
     	 }
    });  
}

$.isPreliminaryPersonnel = function(firUrl){
	var _isleader=false;
	
	if(firUrl!="")
	   {
	 $.ajax({
		    async: false,
		    url : firUrl+"/ca/getCurrentLoginInfo",
			type : 'post',
			success: function(data, status, xhr) {
				if (status == "success" && data != null)
				{ 
				   if (data.cookies!=null) 	
					{
							   if(data.cookies.loginName=="G002000000332549") 
								{	
								   _isleader=true;

								}
					}
				}
			}
		});
    }
	return _isleader;
  }	

$.postSearchForm = function(firUrl,paging,isleader){
	     var otherData="";
	     if(isleader==1)
	    	 {
	    	 $("#addbtn").css("display", "none");
	    	 $("option[value=draft]").remove();
         	 $("option[value=turnBack]").remove();       
         	
	    	 if($("[name=status] option:selected").isNullOrEmpty())
	    	 otherData+="&status_in="+$("[name=status] option").getOptionVal(); 
	    	 }
	     else
	    	 {
	    	  otherData+="&applyerLoginname="+$("#myname").text();
	    	 }
	     
		 if(firUrl!="")
		   {	
			 otherData+="&reportUnit="+$("#lreportUnit").val();
			
			 if(!$("#planStartYear").isNullOrEmpty()&&!$("#planStartMon").isNullOrEmpty())
				 otherData+="&planStartDate_s="+$("#planStartYear").val()+"-"+$("#planStartMon").val()+"-01";
		
			 if(!$("#planEndYear").isNullOrEmpty()&&!$("#planEndYearMon").isNullOrEmpty())
				 otherData+="&planStartDate_e="+$("#planEndYear").val()+"-"+$("#planEndYearMon").val()+"-1";
			
			   $("#oututBtn").click(function(){				 	
				 	  var content =$("#projectAppform").serialize()+otherData+"&sort=status asc,planStartDate desc"
				 	  window.location.href=firUrl+"/basicCrud/projectPlan/export2Excel?"+content;
				   });
			 		 
			 $.ajax({
					  async: false,
					    url : firUrl+"/basicCrud/projectPlan/page",
						type : 'post',
						data: $("#projectAppform").serialize()+paging+otherData+"&sort=status asc,planStartDate desc",
						success: function(data, status, xhr) {							
							$.analyzeTableData(data, status, xhr,firUrl,isleader);
							$.setBtn(firUrl,isleader);							  
				           }, 
				           error: function() {
				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
				           }
						});
		          }
	      }
		
$.analyzeTableData= function(data, status, xhr,firUrl,isleader)
	{
		if (status == "success" && data != null)
		{
			$("tr.tableItem").remove();
			
			if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
			{
				$("tr.tableItem").remove();
				var tableItem="",projectTypeChina="",statusChina="";
				$.each(data.result.content,function(entryIndex,entry) 
				{
						if(entry.projectType!="")
							projectTypeChina=$("[name=projectType] option[value=" + entry.projectType + "]").text();
						
						if(entry.status!="")
							statusChina=$("[name=status] option[value=" + entry.status + "]").text();
							
						
						var arrStartDate= new Array();
						arrStartDate =entry.planStartDate.split("-");
						var arrEndDate= new Array();
						arrEndDate =entry.planEndDate.split("-");
						var mycount=entryIndex+1;
						
					tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\"test_checkbox_1\" name=\"test_checkbox_1\" /></td>";
					tableItem+="<td>"+mycount+"</td><td>"+entry.year+"</td><td>"+entry.projectName+"</td><td>"+entry.totalInvestEstimate+"万元</td><td>";
					tableItem+=projectTypeChina+"</td><td>"+arrStartDate[0]+"年"+arrStartDate[1]+"月"+"</td><td>"+arrEndDate[0]+"年"+arrEndDate[1]+"月"+"</td><td>"+statusChina+"</td>";
					
					var  newpage="",btnStr="详情";
					if(entry.status=="draft" || entry.status=="turnBack")
					{
					   newpage="projectApplicationEdit";
					   btnStr="修改";
					}
					else if (entry.status=="waitForAudit"&&isleader=="1")
					{
						newpage="projectApplicationEdit";
						btnStr="审核";
					}
					else
					{
						 newpage="projectApplicationDetail";
						 btnStr="详情";
					}
					
					tableItem+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\""+btnStr+"\" onclick=\"window.open('"+firUrl+"/projectPlan/"+newpage+"?id="+entry.id+"');\" \></td>";
					
					$(".table_1").append(tableItem);
				});
				
				$.setPage(data.result);			
			}
			else
				{
				for(var i=0;i<=16;i++)
				{
				$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
				}
			  }
		}
    }	
	
	
	$.postDetail = function(firUrl,id,isread,isleader){
		 if(firUrl!="")
		   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/basicCrud/projectPlan/get/"+id,
						type : 'post',
						success: function(data, status, xhr) {
	
							if (status == "success" && data != null)
							{
								if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
								{
									var entry=data.result,arrTime= new Array();
									
									$("#initiateTime").val(entry.initiateTime);
									$("#myhandlerLoginname").val(entry.handlerLoginname);
									
									arrTime = entry.planStartDate.split("-");
									$("#planStartYear").val(arrTime[0]);
									$("#planStartMon").val(arrTime[1]);
									
									var arrEndTime= new Array();
									arrEndTime = entry.planEndDate.split("-");
									$("#planEndYear").val(arrEndTime[0]);
									$("#planEndYearMon").val(arrEndTime[1]);
									
									 if(entry.status=="turnBack"||entry.status=="finishInnerAudit"||entry.status=="cancel")
										{
										  $("#applyInfo tbody").append("<tr class=\"disable\"><td class=\"lableTd t_r\">审核意见</td><td colspan=\"3\"><textarea rows=\"2\" name=\"suggestion\"  disabled>"+status.suggestion+"</textarea></td></tr>");
										}
									 
									 if(entry.yearTarget=="implementPartOK")
										{
										  $("#yearTargetReason").css("display","block");
										  $("#yearTargetReasonTitle").text("年度推进目标理由").addClass("lableTd t_r");
										}
								
									  if(isleader==1&&entry.status=="waitForAudit")
										{
										  $("#myhandlerLoginname").attr("disabled","disabled");
										  $("#closebtn").click(function(){	
												
												 var otherData=$.getOtherData();
							                	
												 if(id!=null)
							                    {
							                		   otherData+="&id="+id+"&status=cancel";
							                     }
							                	   var d = new Date();
							                	   var _yanz=$.yanzhen();
							                       
							                	   if(_yanz!="")
							                		   {
							                		   alert(_yanz+"\r\n请您修改");
							                		   $( this ).dialog( "close" );
							                		   return false;
							                		   }
							                	   
							                	  $.postsave(firUrl,"projectPlanForm",otherData+"&initiateTime="+d.getTime()+"&suggestion="+$("[name=suggestion]").val(),"/projectPlan/projectApplicationList");
							                
											});
										  
										  $("#btnSubmit2").click(function(){
										
											if($("input[name=btnISPass]:checked").val()=="pass")
									         {
												  var otherData=$.getOtherData();
							                	   if(id!=null)
							                		   {
							                   		     var d = new Date();
							                   		 
							                   		   otherData+="&handler=胡波";
								                	   otherData+="&handlerLoginname=G002000000332549";
								                	   otherData+="&initiator="+entry.handler;
								                	   otherData+="&initiatorLoginname="+entry.handlerLoginname;
								                	   
							                		   otherData+="&id="+id+"&status=finishInnerAudit"+"&initiateTime="+d.getTime();
							                		   }
							                 
							                	   var _yanz=$.yanzhen();
							                       
							                	   if(_yanz!="")
							                		   {
							                		   alert(_yanz+"\r\n请您修改");
							                		   $( this ).dialog( "close" );
							                		   return false;
							                		   }
							                	  
							                	   $.postSave({"url":firUrl,"formName":"projectPlanForm","isClose":false,"isGetData":true,"modname":"projectPlan","otherData":otherData+"&suggestion="+$("[name=suggestion]").val()});
							                	   
							                	    var _attachIds = $("table#tbupload tbody tr"), attachIds = "";
							   	                    for (var i = 0; i < _attachIds.length; i++) {
							   	                    attachIds += $(_attachIds[i]).attr("name") + ",";
							   	                    }
							   	                    attachIds = attachIds.substring(0, attachIds.length - 1);
							   	                    if(attachIds!=""&&attachIds!=null)
							   	                   {
							   	                    	var workflowId=$.getWorkflowId({"url":firUrl,"otherdata":"ptype=projectPlan&pid="+id+"&sort=initiateTime desc"});				                	  
									                	$.saveFile({"url":firUrl,"modelName":"projectPlan","modelId":workflowId,"attachIds":attachIds});
							   	                   }
							   	                 
							   	                  window.opener=null;
												  window.close();
							   	                    
									         }       	 
											else if($("input[name=btnISPass]:checked").val()=="notPass")
												{
												 var otherData=$.getOtherData();
							                	   if(id!=null)
							                		   {
							                		   otherData+="&id="+id+"&status=turnBack";
							                		   }
							                	   var d = new Date();
							                	   
							                	   otherData+="&handler="+entry.initiator;
							                	   otherData+="&handlerLoginname="+entry.initiatorLoginname;
							                	   otherData+="&initiator="+entry.handler;
							                	   otherData+="&initiatorLoginname="+entry.handlerLoginname;
							                	   
							                	   var _yanz=$.yanzhen();

							                	   if(_yanz!="")
							                		   {
							                		   alert(_yanz+"\r\n请您修改");
							                		   $( this ).dialog( "close" );
							                		   return false;
							                		   }
							                	  
							                	   $.postSave({"url":firUrl,"formName":"projectPlanForm","isClose":false,"isGetData":true,"modname":"projectPlan","otherData":otherData+"&initiateTime="+d.getTime()+"&suggestion="+$("[name=suggestion]").val()});							                
							                	   
							                	   var _attachIds = $("table#tbupload tbody tr"), attachIds = "";
							   	                    for (var i = 0; i < _attachIds.length; i++) {
							   	                    attachIds += $(_attachIds[i]).attr("name") + ",";
							   	                    }
							   	                    attachIds = attachIds.substring(0, attachIds.length - 1);
							   	                    if(attachIds!=""&&attachIds!=null)
							   	                   {
							   	                    	var workflowId=$.getWorkflowId({"url":firUrl,"otherdata":"ptype=projectPlan&pid="+id+"&sort=initiateTime desc"});				                	  
									                	$.saveFile({"url":firUrl,"modelName":"projectPlan","modelId":workflowId,"attachIds":attachIds});
							   	                   }
							   	                 
							   	                  window.opener=null;
												  window.close();
												
												}
											else 
												{
												alert("请选择是否通过")
												}
									         });   
										  
										}	
									for ( var item in entry) 
									{
									  try 
									{ 										
										if(item=="resourceRequirement")
										{
											
										var dataObj=jQuery.parseJSON(entry[item]);
							
										for ( var sitem in dataObj) 
										{
											  var dataObj2=jQuery.parseJSON(dataObj[sitem]);
											 
												  switch(sitem) 
									                { 
									                  case "networkResource": 
									                  case "dataResource": 
									                	 var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+sitem+"</div>";
									     		             rs+="<input  type=\"text\" class=\"input_large\" value=\""+dataObj2.reason+"\" style=\"width:500px;margin-right:15px\"/>"+$("#resourceRequirement option[value="+sitem+"]").text()+"</td></tr>";
									     		            $("#"+item).parents("tr").after(rs);
									                   break; 
									                      case "storageResource": 
									                     	  var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+sitem+"</div>";
									       		             rs+="<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" value=\""+dataObj2.num+"\">（G） <input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\" value=\""+dataObj2.reason+"\"/>"+$("#resourceRequirement option[value="+sitem+"]").text()+"</td></tr>";
									       		          $("#"+item).parents("tr").after(rs);
									                     break;
									                      case "virtualServerNumber": 
									                    	  var rs="<tr><td class=\"lableTd t_r\"></td><td colspan=\"3\"><input type=\"checkbox\" class=\"cbRequirement\"/>&nbsp;<div style=\"display:none\">"+sitem+"</div>";
									      		             rs+="<input type=\"number\" min=\"0\"  class=\"input_tiny\" step=\"1\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" value=\""+dataObj2.num+"\">（台）<input  type=\"text\" class=\"input_large\" style=\"width:414px;margin-right:15px\" placeholder=\"请填写说明\" value=\""+dataObj2.reason+"\"/>"+$("#resourceRequirement option[value="+sitem+"]").text()+"</td></tr>";
									      		           $("#"+item).parents("tr").after(rs);
									                    break;                    
												   }
										    }
								
										}
						
									
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
									if(isread)
										{
									$(".cbRequirement").nextAll("input").attr("disabled","disabled").parents("tr").addClass("disable");
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

	$.getOtherData = function(){
		 var otherData="";  

		 if($.getRequirement()!="")
			 {
			 otherData+="&resourceRequirement={"+$.getRequirement()+"}";

			 }
		 if($("#planStartYear").val()!=""&&$("#planStartMon").val()!="")
		 {
			 otherData+="&planStartDate="+$("#planStartYear").val()+"-"+$("#planStartMon").val()+"-01";
		 }
		 if($("#planEndYear").val()!=""&&$("#planEndYearMon").val()!="")
		 {
			 
   	      otherData+="&planEndDate="+$("#planEndYear").val()+"-"+$("#planEndYearMon").val()+"-01";
		
		 }   	
 	    	 return otherData   
	}
	
	$.getRequirement = function(){
		 var s='';  
 	     var cbRequirement= $(".cbRequirement");
 	     
 	      for(var i=0; i<cbRequirement.length; i++){    
 	    	 s+="\""+$(cbRequirement[i]).next("div").text()+'\":';
 	    	 
 	    	 var _Requirenum=$(cbRequirement[i]).nextAll("input[type=number]"), _rn="";
 	    	 if(_Requirenum.length>0&&_Requirenum.val()!="")
 	    		_rn=_Requirenum.val();
 	    	   
 	    	 s+="\"{\\\"num\\\":";  
 	    	 s+="\\\""+_rn+'\\\",', 
 	    	 s+="\\\"reason\\\":"; 
 	    	 s+="\\\""+$(cbRequirement[i]).nextAll("input[type=text]").val()+'\\\"}\",';   	
 	      }
 	      
 	    s=s.substring(0,s.length-1);
 	    	 return s
 	   
	}
	
	
	
	$.yanzhen = function(){
		var _return="",totalNum=0,_num=parseInt($("[name=totalInvestEstimate]").val());
	   
		if(!$("[name=fundPlan1]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan1]").val());
		
		if(!$("[name=fundPlan2]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan2]").val());
		
		if(!$("[name=fundPlan3]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan3]").val());
		
		if(!$("[name=fundPlan4]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan4]").val());
		
		if(_num<totalNum)
		{
			_return+="资金计划总额度不能超过总投资";
		}
		
	   if($("[name=year]").val()==""||$("[name=year]").val()==null)	
		{
		_return+="\r\n年度不能为空";
		}
	 
	   if($("[name=projectName]").val()==""||$("[name=projectName]").val()==null)	
		{
		  _return+="\r\n项目名称不能为空";
		}
	   else if($("[name=projectName]").val().length>50)	
		{
		   _return+="\r\n项目名称不能超过50个字";
		}

	   if($("[name=totalInvestEstimate]").val()==""||$("[name=totalInvestEstimate]").val()==null)	
		{
		_return+="\r\n总投资不能为空";
		}

	   if($("[name=mainContent]").val().length<50||$("[name=mainContent]").val().length>500)
		{
		   if($("[name=mainContent]").val()==""||$("[name=mainContent]").val()==null)	
			{
			 _return+="\r\n项目概述不能为空";
			}
		   else
			{
		   _return+="\r\n项目概述字数必须在50~500之间";
			}
		}
	   if($("[name=remarks]").val().length>500)
	   {
		   _return+="\r\n备注不能超过500字";
			
	   }
		   
		  if($("#planStartYear").val()<=1990||$("#planStartYear").val()>=2020||$("#planStartMon").val()>12||$("#planStartMon").val()<1)
			  {
			  if($("#planStartYear").val()==""||$("#planStartYear").val()==null||$("#planStartMon").val()==""||$("#planStartMon").val()==null)	
				{
				  _return+="\r\n计划开工时间不能为空";
				}
			  else
				  {
				  _return+="\r\n计划开工时间格式错误";
				  }
			  }
		  if($("#planEndYear").val()<=1990||$("#planEndYear").val()>=2020||$("#planEndYearMon").val()>12||$("#planEndYearMon").val()<1)
		  {
	   if($("#planEndYear").val()==""||$("#planEndYear").val()==null||$("#planEndYearMon").val()==""||$("#planEndYearMon").val()==null)	
		{
		_return+="\r\n计划完工时间不能为空";
		}
		  else
		  {
		  _return+="\r\n计划开工时间格式错误";
		  }
		  }

	   if($("#myhandlerLoginname option:selected").val()==""||$("#myhandlerLoginname option:selected").val()==null)
	   {
			_return+="\r\n必须选择一个领导";
	   }
	  
	   if($("[name=securityLevel] option:selected").val()==""||$("[name=securityLevel] option:selected").val()==null)
	   {
			_return+="\r\n必须选择安全级别";
	   }
	   
 	
	  return _return
	}
	$.yanzhen2 = function(){
		var _return="",totalNum=0,_num=parseInt($("[name=totalInvestEstimate]").val());
	   
		if(!$("[name=fundPlan1]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan1]").val());
		
		if(!$("[name=fundPlan2]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan2]").val());
		
		if(!$("[name=fundPlan3]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan3]").val());
		
		if(!$("[name=fundPlan4]").isNullOrEmpty())
			totalNum=totalNum+parseInt($("[name=fundPlan4]").val());
		
		if(_num<totalNum)
		{
			_return+="资金计划总额度不能超过总投资";
		}
		
	   if($("[name=year]").val()==""||$("[name=year]").val()==null)	
		{
		_return+="\r\n年度不能为空";
		}
	 
	   if($("[name=projectName]").val()==""||$("[name=projectName]").val()==null)	
		{
		  _return+="\r\n项目名称不能为空";
		}
	   else if($("[name=projectName]").val().length>50)	
		{
		   _return+="\r\n项目名称不能超过50个字";
		}

	   if($("[name=totalInvestEstimate]").val()==""||$("[name=totalInvestEstimate]").val()==null)	
		{
		_return+="\r\n总投资不能为空";
		}

	   if($("[name=mainContent]").val().length<50||$("[name=mainContent]").val().length>500)
		{
		   if($("[name=mainContent]").val()==""||$("[name=mainContent]").val()==null)	
			{
			 _return+="\r\n项目概述不能为空";
			}
		   else
			{
		   _return+="\r\n项目概述字数必须在50~500之间";
			}
		}
	   if($("[name=remarks]").val().length>500)
	   {
		   _return+="\r\n备注不能超过500字";
			
	   }
		   
		  if($("#planStartYear").val()<=1990||$("#planStartYear").val()>=2020||$("#planStartMon").val()>12||$("#planStartMon").val()<1)
			  {
			  if($("#planStartYear").val()==""||$("#planStartYear").val()==null||$("#planStartMon").val()==""||$("#planStartMon").val()==null)	
				{
				  _return+="\r\n计划开工时间不能为空";
				}
			  else
				  {
				  _return+="\r\n计划开工时间格式错误";
				  }
			  }
		  if($("#planEndYear").val()<=1990||$("#planEndYear").val()>=2020||$("#planEndYearMon").val()>12||$("#planEndYearMon").val()<1)
		  {
	   if($("#planEndYear").val()==""||$("#planEndYear").val()==null||$("#planEndYearMon").val()==""||$("#planEndYearMon").val()==null)	
		{
		_return+="\r\n计划完工时间不能为空";
		}
		  else
		  {
		  _return+="\r\n计划开工时间格式错误";
		  }
		  }


	  
	   if($("[name=securityLevel] option:selected").val()==""||$("[name=securityLevel] option:selected").val()==null)
	   {
			_return+="\r\n必须选择安全级别";
	   }
	   
 	
	  return _return
	}
	
	
	
	$.getExport= function(firUrl,_data){
		
		if(firUrl!="")
		   {
		
		 $.ajax({
			    async: false,
			    url  : firUrl+"/basicCrud/projectPlan/iimsExcel",
				type : 'Get',
				datatype:'json',
				data :"excelContent="+_data,
				success: function(data, status, xhr) {
				
				}
			});
			
	    }
		
	  }
	
	
	$.getSuggestInDept = function(firUrl,_id){
		if(firUrl!="")
		   {
		 $.ajax({
			    async: false,
			    url : firUrl+"/basicCrud/workflowLog/all?ptype=projectPlan&pid="+_id+"&sort=initiateTime desc",
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
	       						case "部门内部申报-内部审核完毕":
	       					
	       							_str="<div class=\"node\"><b class=\"fl\">领导意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>"+$("[name=reportUnit]").val()+"部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						
	       						break;
	       						case "部门内部申报-退回":
	       						    if($.isPreliminaryPersonnel(firUrl))
	       							{
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						
	       							}
	       						else
	       							{
	       							_str="<div class=\"node\"><b class=\"fl\">领导意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>"+$("[name=reportUnit]").val()+"部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						}
	       						break;
	       						case "信息中心审核-待审核":
	       							var _str3="";
	       							if(entry.handler!=null||entry.handler!="")
	       								_str3="给"+entry.handler;
	       								
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见"+_str3+" </b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						
	       						break;
	
	       						case "信息中心审核-待领导审核":
	       						case "信息中心审核-审核人审核通过":
	       						case "信息中心审核-审核人审核不通过":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见 </b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						
	       						break;	
		                       case "信息中心审核-待审核":
		       						
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.handler+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						
	       						break;	
		                       case "信息中心审核-待会议评审":
		                       case "信息中心审核-领导审核退回":
	       							_str="<div class=\"node\"><b class=\"fl\">领导意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息管理中心领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
	       						
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
	
	
	$.getFileInfo2 = function(firUrl,otherdata){
		var info="";
		if(firUrl!="")
		   {	
			 $.ajax({
				   async: false,
				    url : firUrl+"/attach/api/all?"+otherdata,
					type : 'get',
					success: function(data, status, xhr) {

						if (status == "success" && data != null)
						{	
							if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
							{
								var entry=data.result;
								for ( var item in entry) 
								{
								   
								    	 info+="<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td><a href=\""+firUrl+"/attach/api/download/"+entry[item].id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>";
								}
							
							}
						}
					}
			 });
			 return info;
		   }
	}
	
	$.FileSave = function(firUrl,modelName,_id,_attachIds){
		  if(firUrl!="")
			   {	
			
			$.ajax({
				  async: false,
				    url : firUrl+"/attach/api/bind",
					type : 'post',
					data: "&modelName="+modelName+"&modelId="+_id+"&attachIds="+_attachIds,
					success: function(data, status, xhr) {
						
					},
			       error:function(XMLHttpRequest, textStatus, errorThrown){
			    	   //alert(XMLHttpRequest+"save失败");
			       }
			       });
			   }
		}

 	$.postHistoryList = function(firUrl,otherData){
   	   var tableItem="",myIndex=0;
 		 if(firUrl!="")
 		   {	          
 			 $.ajax({
 					    async: false,
 					    url : firUrl+"/basicCrud/securityLevel/page",
 						type : 'post',
 						data: otherData,
 						success: function(data, status, xhr) {
 							
 							if (status == "success" && data != null)
 	                     	{
 			                   if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
 			                 {
 			
 				             
 			                  	$.each(data.result.content,function(entryIndex,entry) 
 			                	{
 			                  		myIndex=entryIndex+1;
 			                  		tableItem+="<tr><td  class=\"lableTd t_r\"></td><td colspan=\"3\"><a href=\""+firUrl+"/securityLevel/securityLevelDetail?id="+entry.id+"\" target=\"_blank\">历史记录"+myIndex+"</a></td></tr>";
 			                    });
 			                
 			                   }
 	                     	}
                             return tableItem;
 				           }, 
 				           error: function() {
 				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
 				           }
 						});
 		          }
 		 
             return tableItem;
 	      }
 	
 	
$(function(){
	$(".print").css({"color":"Black","background-image":"url(css/default/images/icon_1.png)"}).parent("li").removeClass("disable").css("cursor", "pointer");
 	$(".print").click(function(){
		$(":disabled").each(function(){
			//$(this).attr("disabled",false);
			$(this).removeAttr("disabled");
			$(this).addClass("disabled");
			
		});
		$(".Divab1").hide();
		$("#leaderSuggest").hide();
		
		window.print();
		$(".Divab1").show();
		$("#leaderSuggest").show();
		$(".disabled").each(function(){
			$(this).attr("disabled",true);
			$(this).removeClass("disabled");
			
		});

	});	  
 })