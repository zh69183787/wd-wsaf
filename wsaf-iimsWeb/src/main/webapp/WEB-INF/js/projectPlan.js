
function getdate(mydata)
{
	return mydata;
   //var now=new Date(mydata)
     //  y=now.getFullYear()
      // m=now.getMonth()+1
      // d=now.getDate()
      // m=m<10?"0"+m:m
      // d=d<10?"0"+d:d
      // return y+"-"+m+"-"+d
}

String.prototype.trim = function(){ return Trim(this);};
function LTrim(str)
{
    var i;
    for(i=0;i<str.length;i++)
    {
        if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break;
    }
    str=str.substring(i,str.length);
    return str;
}
function RTrim(str)
{
    var i;
    for(i=str.length-1;i>=0;i--)
    {
        if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break;
    }
    str=str.substring(0,i+1);
    return str;
}
function Trim(str)
{
    return LTrim(RTrim(str));
}

$.defaultjs = function(){
	if(!placeholderSupport())
	{   // 判断浏览器是否支持 placeholder
	    $('[placeholder]').focus(function() {
	        var input = $(this);
	        if (input.val() == input.attr('placeholder')) {
	            input.val('');
	            input.removeClass('placeholder');
	        }
	    }).blur(function() {
	        var input = $(this);
	        if (input.val() == '' || input.val() == input.attr('placeholder')) {
	            input.addClass('placeholder');
	            input.val(input.attr('placeholder'));
	        }
	    }).blur();
	}

	function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
	}
}

$.isNullOrEmpty = function(_obj){
	if( _obj.val()==""||_obj.val()==null)
	{	
		return true;	
	}
	else
		{
		return false;
		}	
}

$.setBtn = function(firUrl,isleader){
	 $(".topage").click(function(){
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+$(this).text(),isleader);
 		
		});
	   
    $(".prepage").click(function(){
 	 var nowpage=parseInt($(".selected a").text());

 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage),isleader;
 		 }
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

$.setPage= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$(".table_1").find(".tableItem");
	
		if(_pageinfo.pageSize>nowcount.length)
			{
			var minMum=_pageinfo.pageSize-nowcount.length,len=$(".table_1 .tit").children("td").length;
			
			for(var i=0;i<minMum;i++)
				{
				var con="<tr class=\"tableItem\">";
				for(var j=0;j<len;j++)
					{
					con+="<td>&nbsp;</td>";
					}
				$(".table_1").append(con+"</tr>");
				}
			}
		
         $(".tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7)
        	 {
        	 if(_pageinfo.currentPage<=1)
        		 {
        		 pageStyle+="<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
        		 }
        	 else
        		 {
        		 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+2;
           		 pageStyle+="<li ><a class=\"topage\">"+pa+"</a></li> <li><a class=\"selected\">"+_pageinfo.currentPage+"</a></li> <li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pc+"</a></li> <li><a class=\"topage\">"+pd+"</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
			      
        		 }
        	 }
         else
        	 {
        	 for(var j=1;j<=_pageinfo.totalPages;j++)
				{
        		if(j==_pageinfo.currentPage)
        			{
        			pageStyle="<li class=\"selected\"><a>"+j+"</a></li>"+pageStyle;

        			}
        		else
        			{
        			pageStyle="<li><a class=\"topage\">"+j+"</a></li>"+pageStyle;

        			}
				}
        	 }
         
         _menu+=pageStyle+"<li><a class=\"prepage\">&lt;&lt;</a></li>";
         $("ul.pager li").remove();
         $("ul.pager").append(_menu);		        
	}
}

QueryString = {  
			    data: {},  
			    Initial: function () {  
			        var aPairs, aTmp;  
			        var queryString = new String(window.location.search);  
			        queryString = queryString.substr(1, queryString.length); //remove   "?"       
			        aPairs = queryString.split("&");  
			        for (var i = 0; i < aPairs.length; i++) {  
			            aTmp = aPairs[i].split("=");  
			            this.data[aTmp[0]] = aTmp[1];  
			        }  
			    },  
			    GetValue: function (key) {  
			        if (this.data[key] != null)  
			            return decodeURIComponent(this.data[key]);  
			        else  
			            return null;  
			    }  
			}

$.postSearchForm = function(firUrl,paging,isleader){
	      var otherData="";
	     if(isleader==true)
	    	 {
	    	 $("option[value=draft]").remove();
         	 $("option[value=turnBack]").remove();       
         	
	    	 if($.isNullOrEmpty($("[name=status] option:selected")))
	    		 otherData+="&status_in=waitForAudit,finishInnerAudit,cancel"; 
	    	 }
	     
		 if(firUrl!="")
		   {	
			 otherData+=$.getListDetail(firUrl);
			
			 if(!$.isNullOrEmpty($("#planStartYear"))&&!$.isNullOrEmpty($("#planStartMon")))
				 otherData+="&planStartDate_s="+$("#planStartYear").val()+"-"+$("#planStartMon").val()+"-01";
		
			 if(!$.isNullOrEmpty($("#planEndYear"))&&!$.isNullOrEmpty($("#planEndYearMon")))
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
		
//解析Table
$.analyzeTableData= function(data, status, xhr,firUrl,isleader)
	{
		if (status == "success" && data != null)
		{
			$("tr.tableItem").remove();
			
			if (data.success == true) 
			{
				$("tr.tableItem").remove();
				var tableItem="",projectTypeChina="",statusChina="";
				$.each(data.result.content,function(entryIndex,entry) 
				{
					if(isleader&&entry.status=="waitForAudit")
						{
						
						if(entry.handlerLoginname!=$("#myname").text())
							return true;
						}
					   //To:do
						switch(entry.projectType)
						{
						case "repair":
							projectTypeChina="大修";
							break;
						case "remould":
							projectTypeChina="更新改造";
							break;
						case "new":
							projectTypeChina="新建";
							break;
						case "other":
							projectTypeChina="其它";
							break;
			               
						default:""
							projectTypeChina="";
						}
						
						//To:do
						switch(entry.status)
						{
						case "draft":
							statusChina="草稿";
							break;
						case "waitForAudit":
							statusChina="部门领导待审核";
							break;
						case "turnBack":
							statusChina="退回";
							break;
						case "finishInnerAudit":
							statusChina="内部审核完毕";
							break;
						case "cancel":
							statusChina="取消申报";
							break;  
						case "auditorReview":
   							statusChina="待审核";
   							break;
   						case "auditorPass":
   							statusChina="审核人审核通过";
   							break;
   						case "auditorCancel":
   							statusChina="审核人审核不通过";
   							break;
   				
   						case "leaderReview":
   							statusChina="待领导审核";
   							break;  
   						case "leaderBack":
   							statusChina="领导审核退回";
   							break;  
   						case "meetingReview":
   							statusChina="待会议评审";
   							break;  
   						case "intoStore":
   							statusChina="录入储备库";
   							break;  
						default:""
							statusChina="";
						}
						
						var arrStartDate= new Array();
						arrStartDate =entry.planStartDate.split("-");
						var arrEndDate= new Array();
						arrEndDate =entry.planEndDate.split("-");
						var mycount=entryIndex+1;
					tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\"test_checkbox_1\" name=\"test_checkbox_1\" /></td>";
					tableItem+="<td>"+mycount+"</td><td>"+entry.year+"</td><td>"+entry.projectName+"</td><td>"+entry.totalInvestEstimate+"万元</td><td>";
					tableItem+=projectTypeChina+"</td><td>"+arrStartDate[0]+"年"+arrStartDate[1]+"月"+"</td><td>"+arrEndDate[0]+"年"+arrEndDate[1]+"月"+"</td><td>"+statusChina+"</td>";
					
					var  newpage="";
					if(entry.status=="draft" || entry.status=="turnBack")
					{
					   newpage="projectApplicationEdit";
					}
					else if (entry.status=="waitForAudit"&&isleader==true)
					{
						newpage="projectApplicationEdit";
					}
					else
					{
						 newpage="projectApplicationDetail";
					}
					
					tableItem+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"+firUrl+"/projectPlan/"+newpage+"?id="+entry.id+"');\" \></td>";
					
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
								if (data.success == true) 
								{
									var entry=data.result,arrTime= new Array();
									
									$("#initiateTime").val(entry.initiateTime);
									$("[name=myhandlerLoginname]").val(entry.handlerLoginname);
									
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
								
									  if(isleader==true&&entry.status=="waitForAudit")
										{
										  $("[name=myhandlerLoginname]").attr("disabled","disabled");
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
							                	   $.postsave(firUrl,"projectPlanForm",otherData+"&suggestion="+$("[name=suggestion]").val(),"/projectPlan/projectApplicationList");
							                	   
							                
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
							                	  $.postsave(firUrl,"projectPlanForm",otherData+"&initiateTime="+d.getTime()+"&suggestion="+$("[name=suggestion]").val(),"/projectPlan/projectApplicationList");
							                
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
	
	
	$.postDele = function(Url){
		if(Url!="")
		   {					
				 $.ajax({
					    url : Url,
						type : 'post',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
									alert("删除成功");
									window.close();
								}
							}
							
							}
						});
		   }	
	}
	
	
	$.getOtherData = function(){
		 var otherData="";  
		// if($.getline()!="")
			// {
			 //otherData+= "&line="+$.getline();
			 //}
		 
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
	
	$.postsave = function(Url,formName,otherData,toUrl){
		var _data=$("#"+formName).serialize();

		if(Url!="")
		   {					
				 $.ajax({
					    url : Url+"/basicCrud/projectPlan/save",
						type : 'post',
						  async: false,
						data:_data+otherData,
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
								
									window.close();
									
									if(toUrl!="")
									location.href = Url+toUrl;
									
								}
								else
								{
								alert("修改失败");
								}
							}
							else
								{
								alert("修改失败");
								}
							
							}
						});
		   }	
		
	}
	
	$.postsave2 = function(Url,formName,modname,otherData,toUrl,isGetData,isGoBack,isUploadFile,attachIds){		
		var _data="";
		
         if(isGetData)
	      _data=$("#"+formName).serialize();

		if(Url!="")
		   {					
				 $.ajax({
					    url : Url+"/basicCrud/"+modname+"/save",
						type : 'post',
						  async: false,
						data:_data+otherData,
						datatype:'json',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
								  if(isGoBack)
									{
									  window.close();
									  
									  if(toUrl!="")
									  location.href = Url+toUrl;
									}	
								  
								  if(isUploadFile)
									  {
										$.FileSave(Url,modname,data.result.id,attachIds);
									  }
								}
								else
								{
								alert("修改失败");
								}
							}
							else
								{
								alert("修改失败");
								}
							
							}
						});
		   }	
		
	}
	
	
	//$.getline = function(){
		// var s='';  
  	     //var cbline=$(".line:checked");
  	     
  	      //for(var i=0; i<cbline.length; i++){    
  	    	// s+=cbline[i].value+',';  //如果选中，将value添加到变量s中    
  	      //}
  	      
  	    //s=s.substring(0,s.length-1);
  	    	// return s
  	   
	//}
	
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
	
	$.setUserInfo = function(Url){
		if(Url!="")
		   {
		 $.ajax({
			  async: false,
			    url : Url,
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
					   if (data.cookies!=null) 	
						{
							  $("[name=reportUnit]").val(data.companyName);
							  $("[name=reportUnitId]").val(data.companyId);
							  $("[name=applyer]").val(data.cookies.userName);
							  $("[name=applyerLoginname]").val(data.cookies.loginName);
						
						   if(data.leaders!="")
							{
								for ( var sitem in data.leaders) 
								{
									  $("[name=myhandlerLoginname]").append("<option value='"+sitem+"'>"+data.leaders[sitem]+"</option>"); 
								}
						
							}
						}
					}
				}
			});
	    }	
	  }
		
	$.isleader = function(firUrl){
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
						   
						    if(data.leaders!="")
							{
								for ( var sitem in data.leaders) 
							   {
								
								   if(data.cookies.loginName==sitem) 
									{	
									   _isleader=true;

									}
							   }								
							}
						}
					}
				}
			});
	    }
		return _isleader;
	  }
	
	$.yanzhen = function(){
		var _return="",totalNum=0,_num=parseInt($("[name=totalInvestEstimate]").val());
	   
		if(!$.isNullOrEmpty($("[name=fundPlan1]")))
			totalNum=totalNum+parseInt($("[name=fundPlan1]").val());
		
		if(!$.isNullOrEmpty($("[name=fundPlan2]")))
			totalNum=totalNum+parseInt($("[name=fundPlan2]").val());
		
		if(!$.isNullOrEmpty($("[name=fundPlan3]")))
			totalNum=totalNum+parseInt($("[name=fundPlan3]").val());
		
		if(!$.isNullOrEmpty($("[name=fundPlan4]")))
			totalNum=totalNum+parseInt($("[name=fundPlan4]").val());
		
		if(_num<totalNum)
		{
			_return+="资金计划总额度不能超过总投资";
		}
		
	   if($("[name=year]").val()==""||$("[name=year]").val()==null)	
		{
		_return+="\r\n年度不能为空";
		}
	   if($("[name=projectName]").val().length>50)	
		{
	   if($("[name=projectName]").val()==""||$("[name=projectName]").val()==null)	
		{
		_return+="\r\n项目名称不能为空";
		}
	   else
		   {
		   _return+="\r\n项目名称不能超过50个字";
		   }
		
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

	   if($("[name=myhandlerLoginname] option:selected").val()==""||$("[name=myhandlerLoginname] option:selected").val()==null)
	   {
			_return+="\r\n必须选择一个领导";
	   }
	  
	   if($("[name=securityLevel] option:selected").val()==""||$("[name=securityLevel] option:selected").val()==null)
	   {
			_return+="\r\n必须选择安全级别";
	   }
	   
 	
	  return _return
	}
	
	
	$.getListDetail = function(firUrl){
		var _retrunstr="";
		
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
						   if($("#lreportUnit").length > 0)
							   $("#lreportUnit").val(data.companyName);
						  
						   _retrunstr+="&reportUnit="+data.companyName;
						  
						   if($("#myname").length>0)
							   $("#myname").text(data.cookies.loginName);
						   
						  //  if(data.leaders!="")
							//{
								//for ( var sitem in data.leaders) 
							  // {
								
								   //if(data.cookies.loginName==sitem) 
									//{	
									
									  // _retrunstr+="&handlerLoginname="+sitem;

									//}
								  
							  // }								
							//}
						}
					}
				}
			});
	    }
		return _retrunstr;
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
	
	$.getMenu= function(firUrl,modName){
		
		if(firUrl!="")
		   {		
		 $.ajax({
			    async: false,
			    url  : firUrl+"/basicCrud/"+modName+"/getEntityProperty",
				type : 'post',
				datatype:'json',
				success: function(data, status, xhr) {
					if (data.success == true) 
					{
						$.each(data.result.fieldProperties,function(entryIndex,entry) 
								{
								if(entry.operate=="select")
									{
									if(entry.path=="resourceRequirement")
										{
										$.analyzeSelMenu("myresourceRequirement",entry.option);
										return true
										}
									
									$.analyzeSelMenu(entry.path,entry.option);	
									}	
						});
					}
				}
			});
			
	    }
		
	  }
	
	$.analyzeSelMenu= function(dataname,_obj)
	{
		for ( var sitem in _obj) 
		{
		if($("select[name="+dataname+"]").length > 0 )
			{
			$("[name="+dataname+"]").append("<option value='"+sitem+"'>"+_obj[sitem]+"</option>"); 
			}
		}
	}
		
	$.personIdentity = function(firUrl){
	   var _pi=0;
		
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
						     if($("#myname").length>0)
						    	 $("#myname").text(data.cookies.loginName);
						     
						     if(data.cookies.loginName=="G002000000332549") 
							 {	
						    	 _pi=3;

							  }
						     else if(data.cookies.loginName=="G020105000192549"||data.cookies.loginName=="G001000001702549"||data.cookies.loginName=="G010070003832549") 
							  {	
								 _pi=4;

							   }
							  else
							   {
								 if(data.leaders!="")
							       {
									  for ( var sitem in data.leaders) 
									  {
											
										if(data.cookies.loginName==sitem) 
									    {	
											if(data.cookies.deptName=="信息管理中心")
										      {
												   _pi=2;
										      }
											 else
											  {
												   _pi=1;
											   }
										 }
									   }								
								     }   
							      }
						     }
					 }
				 }
			});
	    }
		return _pi; 
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
	
	
	$.isReviewPersonnel = function(firUrl){
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
					   if (data.cookies!=null)	{
								   if(data.cookies.loginName=="G020105000192549"||data.cookies.loginName=="G001000001702549"||data.cookies.loginName=="G010070003832549") 
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
	
	
	$.getPerson = function(firUrl){
		var _isleader="";
		
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
						   _isleader=data.cookies.loginName;
									
						}
					}
				}
			});
	    }
		return _isleader;
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
					   if (data.result!=null) 	
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
							   
							   
							   $("#leaderSuggest tbody tr td").append(_str);
							});
						}
					}
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
					   if (data.result!=null) 	
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
	
	
	$.getSuggestSecurityLevel = function(firUrl,_id){
		if(firUrl!="")
		   {
		 $.ajax({
			    async: false,
			    url : firUrl+"/basicCrud/workflowLog/all?ptype=securityLevel&pid="+_id+"&sort=initiateTime desc",
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
					   if (data.result!=null) 	
						{
						   $.each(data.result,function(entryIndex,entry) 
						    {
							   var _str="";
							   switch(entry.status)
	       						{
	       						case "审核退回":
	       						case "部门领导退回":
	       						case "备案审查中":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>"+$("[name=company] option:selected").text()+"</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						break;
	       						
	       						case "公安机关送审中":
	       						case "信息中心领导审批退回":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息管理中心部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       							break;
	       					
	       						case "备案审查退回":
	       						case "信息中心预审中":
	       						case "信息中心领导审批中":	
	       						case "公安机关送审退回":	
	       						case "信息中心预审退回":
	       						case "备案审查退回":
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
	$.isInfoCenterleader = function(firUrl){
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
						   
						    if(data.leaders!=""&&data.cookies.deptName=="信息管理中心")
							{
								for ( var sitem in data.leaders) 
							   {
								
								   if(data.cookies.loginName==sitem) 
									{	
									   _isleader=true;

									}
							   }								
							}
						}
					}
				}
			});
	    }
		return _isleader;
	  }
	
	
	$.postSaves = function(Url,formName,otherData,modName){
		var _data=$("#"+formName).serialize(),data2="";
       //alert(_data+otherData);
       //return false;
       
		if(Url!="")
		   {					
				 $.ajax({
					    url : Url+"/basicCrud/"+modName+"/save",
						type : 'post',
						  async: false,
						data:_data+otherData,
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
								var _attachIds=$(".yiti table tbody tr"),attachIds="",summary=$(".table_summary tbody tr");
								for(var i=0;i<_attachIds.length;i++)
									{
									attachIds+=$(_attachIds[i]).attr("name")+",";
								
									}
								for(var j=0;j<summary.length;j++)
								{
								    attachIds+=$(summary[j]).attr("name")+",";
							
								}
								
								attachIds=attachIds.substring(0,attachIds.length-1);
                                $.FileSave(Url,modName,data.result.id,attachIds);
                                window.close();
								location.href = Url+"/meeting/meetingManageList";	
                                
								}
								else
								{
								alert("修改失败");
								}
							}
							else
								{
								alert("修改失败");
								}
							
							}
						});
		   }	
		
	}
	
	$.getPersonInfo = function(firUrl){
		   var _pi=0;
			
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
												if(data.cookies.deptName=="信息管理中心")
											      {
													if($("input#applyerName").length>0)
													$("input#applyerName").val(data.cookies.userName);
													  
													if($("input[name=applyer]").length>0)
														$("input[name=applyer]").val(data.cookies.loginName);
													
													var _sel=  $(".selPersonTable tbody");
													  
													    for(var i=0;i<_sel.length;i++)
													    {
													    	if($(_sel[i]).find("tr").length==0)
													    	{
													        
													    		for ( var sitem in data.deptUsers) 
													            {
														           $(_sel[i]).append("<tr><td class=\"td_1\">&nbsp;</td><td><input type=\"checkbox\" name=\"cbPerson\"> "+data.deptUsers[sitem]+"</td><td class=\"LoginName\" style=\"display:none\">"+sitem+"</td></tr>");
														        }
													    	}
													    }
											      }
											      
												 else
												  {
													 
												   }
											
						 }           
					  }
					}
				});
		    }
			return _pi; 
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
							if (data.success == true&&data.result!=null) 
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
 			                   if (data.success == true&&data.result.content!=null) 
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