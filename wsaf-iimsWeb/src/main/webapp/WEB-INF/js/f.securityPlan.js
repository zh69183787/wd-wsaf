;(function($, window, document,undefined) { 
	 $.postSystemName = function (firUrl, otherData, _str) {
         if (firUrl != "") {
             $.ajax({
                 url: firUrl + "/basicCrud/securityLevel/all?&status_in=pass" + otherData,
                 type: 'post',
                 success: function (data, status, xhr) {

                     if (status == "success" && data != null) {
                         if (data.success == true ) {
                             if (data.result.length > 0) {
                                 $.each(data.result, function (entryIndex, entry) {
                                     $("#mysystemName").append("<option value=\"" + entry.sysSecurityLevel + "\">" + entry.systemName + "</option>");
                                 });
                             }
                         }
                     }
                 },
                 error: function () {
                     hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                 }
             });
         }
     }
	 
     $.postSecurityPlanDetailSp = function (firUrl, otherData,type) {
         if (firUrl != "") {
             $.ajax({
                 url: firUrl + "/basicCrud/securityPlanDetail/all" + otherData,
                 type: 'post',
                 success: function (data, status, xhr) {

                     if (status == "success" && data != null) {
                         if (data.success == true ) {
                             $(".tableItem").remove();
                             $.each(data.result, function (entryIndex, entry) {
                             	if(entry.remarks==null)
                             		entry.remarks="";
                             		
                                 var str = "<tr class=\"tableItem\"><td class=\"ppId\">" + entry.id + "</td><td>" + $("[name=businessLevel] option[value=" + entry.businessLevel + "]").text() + "</td><td>" + entry.projectNum + "</td><td>" + entry.projectName + "</td>";
                                 
                                 if(entry.planType!="infoTrain"&&entry.planType!="emergencyPlan")
                                 str +=  "<td>" + entry.systemName + "</td><td>" + $("[name=systemLevel] option[value=" + entry.systemLevel + "]").text() + "</td>";
                                 
                                
                                 str += "<td>" + entry.mainContent + "</td><td>" + $("[name=implement] option[value=" + entry.implement + "]").text() + "</td><td>" + entry.planStartTime + "</td><td>" + entry.planEndTime + "</td><td>" + entry.cost + "</td><td>" + entry.targetPlan + "</td><td>" + entry.remarks + "</td>"
                                 
                                 if(type==0)
                                	 {
                                	 str+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"修改\" onclick=\"window.open('" + firUrl + "/securityPlan/securityPlanDetailEdit" + "?id=" + entry.id + "');\" \></td>";
                                	 }
                                 else if(type==2)
                            	 {
                                	var mystr="";
                                 	switch(entry.finished)
                             		{
                             			case 0:
                             			mystr="未完成";
                             			break;
                             			case 1:
                             			mystr="已完成";
                                 		break;	
                                 		default:
                                 		mystr="未完成";
                             			break;	
                             		}
                            	    str+="<td>"+mystr+"</td><td><input type=\"button\" name=\"button\" id=\"edit\" value=\"上传附件\" onclick=\"window.open('" + firUrl + "/securityPlan/securityPlanDetail" + "?id=" + entry.id + "');\" \></td>";
                            	 }
                                 else
                                	 {
                                	 str+="<td></td>";
                                	 }
                                 str+="</tr>";
                                 $(".mytable2 tbody").append(str);
                             });
                         }
                     }
                 },
                 error: function () {
                     alert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                 }
             });
         }
     }

     $.postSecurityPlanDetailSp2rd = function (firUrl, otherData) {
        var count=0;
    	 if (firUrl != "") {
             $.ajax({
                 url: firUrl + "/basicCrud/securityPlanDetail/all?" + otherData,
                 type: 'post',
                 async: false,
                 success: function (data, status, xhr) {

                     if (status == "success" && data != null) {
                         if (data.success == true ) {
                             if(data.result!=null)
                        	 count=data.result.length;
                         }
                     }
                 },
                 error: function () {
                     alert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                 }
             });
         }
             return count;
     }
     
     
     $.customVerification = function (tableName) {    	
    	var yanzhen=$.verificationAll({"tableName":tableName});

    	 if($("[name=planType] option:selected").val()!="infoTrain"&&$("[name=planType] option:selected").val()!="emergencyPlan"&&$("[name=planType] option:selected").val()!="")
    	{
         if ($("[name=systemLevel]").val() == null || $("[name=systemLevel]").val() == "")
             yanzhen += "至少选择一条业务信息安全保护等级\r";
        }
         
         return yanzhen;
     }
     
    
     
     var PlanTypeSp2 = function(ele, opt) {
         this.$element = ele,
         this.defaults = {
             'url': 'iims/',
             'type': -1,
             'planId': '',
             'otherData':''
         },
         this.options = $.extend({}, this.defaults, opt)
     }
     
     PlanTypeSp2.prototype = {
    		planTypeSp2: function() {
    			 var str2 = $("#planType .selected span").text(),myData=this.options;

    	         if (this.options.planId != null && this.options.planId != "")
    	      {
    	         $("[name=planType] option").each(function (i) {
    	             if ($(this).text() == str2)
    	                 $.postSecurityPlanDetailSp(myData.url, "?planId=" + myData.planId + myData.otherData+"&planType=" + $(this).val(),myData.type);
    	         });
    	      }
         },
         planTypeSp:function(){
        	 var myData=this.options;
        	 this.$element.click(function () {
        		 $("#planType li").removeClass("selected");
                 $(this).addClass("selected");

                 var str = $(this).find("span").text();

                 if (str == "安全培训" || str == "应急演练") {
                     $("td .hid_item").css("display", "none");
                 }
                 else {
                     $("td .hid_item").css("display", "table-cell");
                 }

                 if (myData.planId== null || myData.planId == "")
                     return false;

                 $("[name=planType] option").each(function (i) {
                     if ($(this).text() == str) {
                         $.postSecurityPlanDetailSp(myData.url, "?planId=" + myData.planId + myData.otherData+ "&planType=" + $(this).val(),myData.type);
                     }
                 });
             }); 
         }
     }
     
     $.planTypeSp2 = function(options) {
         var _planTypeSp2 = new PlanTypeSp2(this, options);
         return _planTypeSp2.planTypeSp2();
     }
     $.fn.planTypeSp = function(options) {
         var _planTypeSp = new PlanTypeSp2(this, options);
         return _planTypeSp.planTypeSp();
     }
     
     
     $.postProjectNum = function (firUrl, otherData) {
    	 var projectNum="";
         if (firUrl != "") {
             $.ajax({
                 url: firUrl + "/securityPlan/getSerialNo?" + otherData,
                 type: 'get',
                 async: false,
                 success: function (data, status, xhr) {

                     if (status == "success" && data != null) {
                    	 if(data.serialNo!=null&&data.serialNo!="")
                    	 projectNum= data.serialNo;   
                     }
                 },
                 error: function () {
                     alert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                 }
             });
         }
         return projectNum;
     }
     
     $.ProjectNumSp = function (firUrl) {
    	 var _type="",_projectNum="";
    	 switch($("[name=planType] option:selected").val())
    	 {
    	 case "levelReview":
    		 _type="D";
    	 break;
    	 case "securityCheck":
    		 _type="J";
    	 break;
    	 case "infoTrain":
    		 _type="P";
    	 break;
    	 case "emergencyPlan":
    		 _type="Y";
    	 break;
    	 case "securityRectify":
    		 _type="Z";
    	 break;   	 
    	 }

    	 _projectNum= $.postProjectNum(firUrl, "type="+_type+"&year="+$("[name=planYear] option:selected").val());   	 
    	
    	 return _projectNum;
     }
     
     $.postSecurityPlanDetail = function(firUrl,id){
			 if(firUrl!="")
			   {	
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/securityPlanDetail/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
		
								if (status == "success" && data != null)
								{
									if (data.success == true) 
									{
										var entry=data.result;

										for ( var item in entry) 
										{
										  try 
									      { 	
											  if(item=="planType")
											  {
												  if(entry[item]!="infoTrain"&&entry[item]!="emergencyPlan"&&entry[item]!="")
												  {
													  $(".Tohide").css("display","table-row");
													  $("#mysystemName").attr("disabled",false); 
												  }
												  else
												  {
													  $(".Tohide").css("display","none");
													  $("#mysystemName").attr("disabled",true);
												  }
											  }
											  
											   if($("[name="+item+"]").length>0)
												$("[name="+item+"]").val(entry[item]);
									
											 
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
     
     $.getSuggestSecurityPlan = function(firUrl,_id){
 		if(firUrl!="")
 		   {
 		 $.ajax({
 			    async: false,
 			    url : firUrl+"/basicCrud/workflowLog/all?ptype=securityPlan&pid="+_id+"&sort=initiateTime desc",
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
 	       						case "审批通过":
 	       						case "信息管理中心领导审批退回":
 	       							_str="<div class=\"node\"><b class=\"fl\">领导意见</b><div class=\"clear\"></div><div class=\"con\">";
 	       							_str+="<i>信息管理中心部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
 	       						
 	       						break;
 	       						case "信息管理中心审查中":	
 	       						case "工作负责人退回":
 	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
 	       							_str+="<i>"+$("[name=company] option:selected").text()+"</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
 	       							break;
 	       						
 	       						case "信息管理中心审查退回":	
 	       						case "信息管理中心领导审批中":	
 	       						
 	       							_str="<div class=\"node\"><b class=\"fl\">部门意见 </b><div class=\"clear\"></div><div class=\"con\">";
 	       							_str+="<i>信息管理中心</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>"
 	       						
 	       						break;	
 	       						}
 							   
 							   $("#leaderSuggest tbody tr td").append(_str);
 							});
 						}
 					}
 				}
 			});
 	    }
 	
 	  }	
     
     $.postSecurityPlan = function (firUrl, id) {
    	    if (firUrl != "") {
    	        $.ajax({
    	            async: false,
    	            url: firUrl + "/basicCrud/securityPlan/get/" + id,
    	            type: 'post',
    	            success: function (data, status, xhr) {

    	                if (status == "success" && data != null) {
    	                    if (data.success == true ) {
    	                        var entry = data.result;
    	                        
    	                        if($("#principalPeople").length>0)
    	                         $("#principalPeople").val(data.result.handlerLoginname);
    	                        	
    	                        $("#initiateTime").val(data.result.initiateTime)
    	                        for (var item in entry) {
    	                            try {
    	                            	if($("[name=" + item + "]").length>0)
    	                                $("[name=" + item + "]").val(entry[item]);
    	                            }
    	                            catch (e) {
    	                                alert(e);
    	                            }
    	                        }

    	                    }
    	                }
    	            },
    	            error: function () {
    	                alert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
    	            }
    	        });
    	    }
    	}
     
     
})(jQuery, window, document);



$(function(){
	if($("[name=planStartTime]").length>0)
    $("[name=planStartTime]").datepicker({ dateFormat: "yy-mm-dd" });
	
	if($("[name=planEndTime]").length>0)
    $("[name=planEndTime]").datepicker({ dateFormat: "yy-mm-dd" });
	
	if($(".Tohide").length>0)
	$(".Tohide").css("display","none");  
	
	if($("[name=planType]").length>0)
		{
	 $("[name=planType]").change(function () {
  	   if($(this).find("option:selected").val()!="infoTrain"&&$(this).find("option:selected").val()!="emergencyPlan"&&$(this).find("option:selected").val()!="")
         {
  		   $(".Tohide").css("display","table-row"); 
  		   $("#mysystemName").attr("disabled",false); 
         }
  	   else
  	   {
  		   $(".Tohide").css("display","none");  
    		   $("#mysystemName").attr("disabled",true);
  	   }
     });
	}
});
