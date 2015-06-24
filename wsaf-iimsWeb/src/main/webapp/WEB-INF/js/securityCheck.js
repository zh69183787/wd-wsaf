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
			};
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
};

$.isNullOrEmpty = function(_obj){
	if( _obj.val()==""||_obj.val()==null)
	{	
		return true;	
	}
	else
		{
		return false;
		}	
};

$.setBtn = function(firUrl,isleader){
	 $(".topage").click(function(){
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+$(this).text());
 		
		});
	   
    $(".prepage").click(function(){
 	 var nowpage=parseInt($("#page>.selected a").text());

 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage);
 		 }
		}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($("#page>.selected a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchForm(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
   
   $("#oututBtn").click(function(){
 	
 	  var content =$("#projectAppform").serialize()+"&sort=id desc";
 	  window.location.href=firUrl+"/basicCrud/securityCheck/export2Excel?"+content+"&type=securityCheck";

   }); 
   
   $("#gopagebtn").click(function(){
 	  var topage=parseInt($("#gopage").val());
   
     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
 		 {
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage);
 		 }
     	 else
     		 {
     		 alert("超出索引值");
     		 }
			});  
};
$.setBtnApply = function(firUrl,isleader){
	 $(".topage").click(function(){
		$.postSearchFormApply(firUrl,"&pageSize=16&pageNum="+$(this).text());
		
		});
	   
   $(".prepage").click(function(){
	 var nowpage=parseInt($("#page>.selected a").text());

	 if(nowpage>1)
		 {
		 var topage=nowpage-1;
		$.postSearchFormApply(firUrl,"&pageSize=16&pageNum="+topage);
		 }
		}); 
 
  $(".nextpage").click(function(){
	 var nextpage=parseInt($("#page>.selected a").text())+1;

	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchFormApply(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
  
  $("#oututBtn").click(function(){
	
	  var content =$("#projectAppform").serialize()+"&sort=id desc";
	  window.location.href=firUrl+"/basicCrud/securityCheck/export2Excel?"+content+"&type=securityCheck";

  }); 
  
  $("#gopagebtn").click(function(){
	  var topage=parseInt($("#gopage").val());
  
    	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
		 {
		$.postSearchFormApply(firUrl,"&pageSize=16&pageNum="+topage);
		 }
    	 else
    		 {
    		 alert("超出索引值");
    		 }
			});  
};

$.setPage= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$(".table_1").find(".tableItem");
	
		if(_pageinfo.pageSize>nowcount.length)
			{
			var minMum=_pageinfo.pageSize-nowcount.length;
			for(var i=0;i<minMum;i++)
				{
				$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
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
        		 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+3;
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
};

$.isleader = function(firUrl) {
	var _isleader = "不是领导";

	if (firUrl != "") {
		$
				.ajax({
					async : false,
					url : firUrl + "/ca/getCurrentLoginInfo",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.cookies && JSON.stringify(data.cookies) != "[]") {
								if(data.cookies.deptId=="2549"){
									_isleader="信息中心";
								}
								
							}
						}
					}
				});
	}
	return _isleader;
};
$.getLoginname = function(firUrl) {
	var _isleader = "";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {

						_isleader = data.cookies.loginName;

					}
				}
			}
		});
	}
	return _isleader;
};


$.postSearchForm = function(firUrl,paging){
	paging += "&status_in=review";
	paging += "&sort=id desc";
	 if(firUrl!="")
	   {	
		 $.ajax({
				  async: false,
				    url : firUrl+"/basicCrud/securityCheck/page",
					type : 'post',
					data: $("#projectAppform").serialize()+paging,
					success: function(data, status, xhr) {
						
						$.analyzeTableData(data, status, xhr,firUrl);
						
						  
			           }, 
			           error: function() {
			              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
			           }
					});
	          }
  };
  $.postSearchFormApply = function(firUrl,paging){
		paging += "&sort=id desc";
		paging+="&applyerLoginname="+$.getLoginname(firUrl);
		 if(firUrl!="")
		   {	
			 $.ajax({
					  async: false,
					    url : firUrl+"/basicCrud/securityCheck/page",
						type : 'post',
						dataType : 'json',
						data: $("#projectAppform").serialize()+paging,
						success: function(data, status, xhr) {
							$.analyzeTableDataApply(data, status, xhr,firUrl);
							
							  
				           }, 
				           error: function() {
				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
				           }
						});
		          }
	  };
  
  $.analyzeTableData = function(data, status, xhr,firUrl)
  {
  	if (status == "success" && data != null)
  	{
  		$("tr.tableItem").remove();
  		
  		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
  		{
  			$("tr.tableItem").remove();
  			var tableItem="";
  			var companyChina="";
  			var i = 0;
  			$.each(data.result.content,function(entryIndex,entry) 
  			{
  				   //To:do
  					
  					switch(entry.status)
  					{
  					case "draft":
  						statusChina="草稿";
  						break;
  					case "review":
  						statusChina="待审核";
  						break;
  					case "pass":
  						statusChina="审核通过";
  						break;
  					case "unpass":
  						statusChina="审核不通过";
  						break;
  						default:"";
  						statusChina="";
  					}
  					
  					switch(entry.company)
  					{
  					case "2925":
  						companyChina="维保中心";
  						break;
  					case "2920":
  						companyChina="运管中心";
  						break;
  					case "2941":
  						companyChina="技术中心";
  						break;
  					case "2944":
  						companyChina="培训中心";
  						break;
  					case "2921":
  						companyChina="运一公司";
  						break;
  					case "2922":
  						companyChina="运二公司";
  						break;
  					case "2923":
  						companyChina="运三公司";
  						break;
  					case "2924":
  						companyChina="运四公司";
  						break;
  					case "2962":
  						companyChina="磁浮公司";
  						break;
  					case "2946":
  						companyChina="资产公司";
  						break;
  					case "2943":
  						companyChina="隧道院";
  						break;
  					case "2945":
  						companyChina="股份公司";
  						break;
  						default:"";
  						companyChina="";
  					}
  				i += 1;
  				tableItem = "<tr class=\"tableItem\">";
  				tableItem+="<td>"+i+"</td><td>"+entry.company+"</td><td>"+entry.applyTime+"</td><td>"+statusChina+"</td>";
  				
  				var  newpage="";
  				if(entry.status=="draft" || entry.status=="unpass")
  				{
  				   newpage="securityCheckDetail";
  				}
  				else if (entry.status=="review"|| entry.status=="pass")
  				{
  					newpage="securityCheckReview";
  				}
  				else
  				{
  					 newpage="securityCheckReview";
  				}
  				
  				tableItem+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"+firUrl+"/securityCheck/"+newpage+"?id="+entry.id+"');\" \></td>";
  				
  				$(".table_1").append(tableItem);
  			});
  			$.setPage(data.result);			
  		}
  		else
  			{
  			for(var i=0;i<=16;i++)
  			{
  			$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
  			}
  		  }
  	}
  };
  $.analyzeTableDataApply = function(data, status, xhr,firUrl)
  {
  	if (status == "success" && data != null)
  	{
  		$("tr.tableItem").remove();
  		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
  		{
  			
  			$("tr.tableItem").remove();
  			var tableItem="";
  			var companyChina="";
  			var i = 0;
  			$.each(data.result.content,function(entryIndex,entry) 
  			{
  				   //To:do
  					switch(entry.status)
  					{
  					case "draft":
  						statusChina="草稿";
  						break;
  					case "review":
  						statusChina="待审核";
  						break;
  					case "pass":
  						statusChina="审核通过";
  						break;
  					case "unpass":
  						statusChina="审核不通过";
  						break;
  						default:"";
  						statusChina="";
  					}
  					
  					switch(entry.company)
  					{
  					case "2925":
  						companyChina="维保中心";
  						break;
  					case "2920":
  						companyChina="运管中心";
  						break;
  					case "2941":
  						companyChina="技术中心";
  						break;
  					case "2944":
  						companyChina="培训中心";
  						break;
  					case "2921":
  						companyChina="运一公司";
  						break;
  					case "2922":
  						companyChina="运二公司";
  						break;
  					case "2923":
  						companyChina="运三公司";
  						break;
  					case "2924":
  						companyChina="运四公司";
  						break;
  					case "2962":
  						companyChina="磁浮公司";
  						break;
  					case "2946":
  						companyChina="资产公司";
  						break;
  					case "2943":
  						companyChina="隧道院";
  						break;
  					case "2945":
  						companyChina="股份公司";
  						break;
  						default:"";
  						companyChina="";
  					}
  				i += 1;
  				tableItem = "<tr class=\"tableItem\">";
  				tableItem+="<td>"+i+"</td><td>"+entry.company+"</td><td>"+entry.applyTime+"</td><td>"+statusChina+"</td>";
  				
  				var  newpage="";
  				if(entry.status=="draft" || entry.status=="unpass")
  				{
  				   newpage="securityCheckDetail";
  				}
  				else if (entry.status=="review"|| entry.status=="pass")
  				{
  					newpage="securityCheckApply";
  				}
  				else
  				{
  					 newpage="securityCheckReview";
  				}
  				
  				tableItem+="<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"+firUrl+"/securityCheck/"+newpage+"?id="+entry.id+"');\" \></td>";
  				
  				$(".table_1").append(tableItem);
  			});
  			$.setPage(data.result);			
  		}
  		else
  			{
  			for(var i=0;i<=16;i++)
  			{
  			$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
  			}
  		  }
  	}
  };
$.getOtherData = function(){
	var otherData = "";
	otherData += "&infoSysSummary={\"count\":\""+$("#infoSysSummaryCount").val()+"\",\"internet\":\""+$("#infoSysSummaryInternet").val()+"\",";
	otherData += "\"noInternet\":\""+$("#infoSysSummaryNoInternet").val()+"\",\"public\":\""+$("#infoSysSummaryPublic").val()+"\",";
	otherData += "\"checkPass\":\""+$("#infoSysSummaryCheckPass").val()+"\"}";
	
	otherData += "&internetAccess={\"count\":\""+$("#internetAccessCount").val()+"\",\"unicom\":\"{\\\"num\\\":\\\""+$("#unicomNum").val()+"\\\",\\\"bw\\\":\\\""+$("#unicomBw").val()+"\\\"}\",";
	otherData += "\"mobile\":\"{\\\"num\\\":\\\""+$("#mobileNum").val()+"\\\",\\\"bw\\\":\\\""+$("#mobileBw").val()+"\\\"}\",";
	otherData += "\"other\":\"{\\\"name\\\":\\\""+$("#otherName").val()+"\\\",\\\"num\\\":\\\""+$("#otherNum").val()+"\\\",\\\"bw\\\":\\\""+$("#otherBw").val()+"\\\"}\"}";

	otherData += "&sysLevel={\"lv1\":\""+$("#lv1").val()+"\",\"lv2\":\""+$("#lv2").val()+"\",";
	otherData += "\"lv3\":\""+$("#lv3").val()+"\",\"lv4\":\""+$("#lv4").val()+"\",";
	otherData += "\"no\":\""+$("#no").val()+"\"}";
	
        
	otherData += "&netRemoteControlSys={";
		if($("[name=netRemoteControl]").val()=="no"||$("[name=netRemoteControl]").val()==""){
			otherData += "}";
		}else{
			var m = $("#sysName div");
			if(m.length==1){
				otherData += "\"sys1\":\""+$("#netRemoteControlSys_1").val()+"\"";
			}else if(m.length>=2){
				for(var i=1;i<=m.length-1;i++){
					otherData += "\"sys"+i+"\":\""+$("#netRemoteControlSys_"+m.length).val()+"\",";
				}
				otherData += "\"sys"+m.length+"\":\""+$("#netRemoteControlSys_"+m.length).val()+"\"";
			}
			otherData += "}";
		}       	
	
	otherData += "&routerUse={\"visitInternet\":\""+$("#visitInternet").val()+"\",\"visitBusinessNet\":\""+$("#visitBusinessNet").val()+"\"}";
	
	
	otherData += "&productServer={\"count\":\""+$("#productServerCount").val()+"\",\"brand\":\"{\\\"internal\\\":\\\""+$("#productServerBrandInternal").val()+"\\\",";
	otherData += "\\\"internalCpu\\\":\\\""+$("#productServerBrandInternalCpu").val()+"\\\",\\\"foreign\\\":\\\""+$("#productServerBrandForeign").val()+"\\\"}\",";
	otherData += "\"sys\":\"{\\\"internal\\\":\\\""+$("#productServerSysInternal").val()+"\\\",\\\"foreign\\\":\\\""+$("#productServerSysForeign").val()+"\\\"}\"}";

	otherData += "&productTerminal={\"count\":\""+$("#productTerminalCount").val()+"\",\"brand\":\"{\\\"internal\\\":\\\""+$("#productTerminalBrandInternal").val()+"\\\",";
	otherData += "\\\"internalCpu\\\":\\\""+$("#productTerminalBrandInternalCpu").val()+"\\\",\\\"foreign\\\":\\\""+$("#productTerminalForeign").val()+"\\\"}\",";
	otherData += "\"sys\":\"{\\\"internal\\\":\\\""+$("#productTerminalSysInternal").val()+"\\\",\\\"foreign\\\":\\\""+$("#productTerminalSysForeign").val()+"\\\",";
	otherData += "\\\"winXp\\\":\\\""+$("#productTerminalSyswinXp").val()+"\\\",\\\"afterWinXpStop\\\":\\\""+$("#afterWinXpStop").val()+"\\\",";
	otherData += "\\\"afterWinXpStopOther\\\":\\\""+$("[name=afterWinXpStopOther]").val()+"\\\"}\",";
	otherData += "\"internalWord\":\""+$("#internalWord").val()+"\",\"internalFireWall\":\""+$("#internalFireWall").val()+"\"}";
	
	otherData += "&productRouter={\"count\":\""+$("#productRouterCount").val()+"\",\"brand\":\"{\\\"internal\\\":\\\""+$("#productRouterBrandInternal").val()+"\\\",";
	otherData += "\\\"foreign\\\":\\\""+$("#productRouterBrandForeign").val()+"\\\"}\"}";

	otherData += "&productSwitch={\"count\":\""+$("#productSwitchCount").val()+"\",\"brand\":\"{\\\"internal\\\":\\\""+$("#productSwitchBrandInternal").val()+"\\\",";
	otherData += "\\\"foreign\\\":\\\""+$("#productSwitchBrandForeign").val()+"\\\"}\"}";
	
	otherData += "&productStorage={\"count\":\""+$("#productStorageCount").val()+"\",\"brand\":\"{\\\"internal\\\":\\\""+$("#productStorageBrandInternal").val()+"\\\",";
	otherData += "\\\"foreign\\\":\\\""+$("#productStorageBrandForeign").val()+"\\\"}\"}";
	
	otherData += "&productDb={\"count\":\""+$("#productDbCount").val()+"\",\"brand\":\"{\\\"internal\\\":\\\""+$("#productDbBrandInternal").val()+"\\\",";
	otherData += "\\\"foreign\\\":\\\""+$("#productDbBrandForeign").val()+"\\\"}\"}";
	
	
	
	otherData += "&productEmail={\"count\":\""+$("#productEmailCount").val()+"\",\"brandAndNum\":\"[";
	var a = $("#email div");
	if(a.length==1){
		otherData += "{\\\"brand\\\":\\\""+$("#productEmailBrand_1").val()+"\\\",\\\"num\\\":\\\""+$("#productEmailNum_1").val()+"\\\"}";
	}else if(a.length>=2){
		for(var i=1;i<=a.length-1;i++){
			otherData += "{\\\"brand\\\":\\\""+$("#productEmailBrand_"+i).val()+"\\\",\\\"num\\\":\\\""+$("#productEmailNum_"+i).val()+"\\\"},";
		}
		otherData += "{\\\"brand\\\":\\\""+$("#productEmailBrand_"+a.length).val()+"\\\",\\\"num\\\":\\\""+$("#productEmailNum_"+a.length).val()+"\\\"}";
	}
		otherData += "]\"}";
	
	
	otherData += "&productLb={\"count\":\""+$("#productLbCount").val()+"\",\"brandAndNum\":\"[";
	var b = $("#productLb div");
	if(b.length==1){
		otherData += "{\\\"brand\\\":\\\""+$("#productLbBrand_1").val()+"\\\",\\\"num\\\":\\\""+$("#productLbNum_1").val()+"\\\"}";
	}else if(b.length>=2){
		for(var i=1;i<=b.length-1;i++){
			otherData += "{\\\"brand\\\":\\\""+$("#productLbBrand_"+i).val()+"\\\",\\\"num\\\":\\\""+$("#productLbNum_"+i).val()+"\\\"},";
		}
		otherData += "{\\\"brand\\\":\\\""+$("#productLbBrand_"+b.length).val()+"\\\",\\\"num\\\":\\\""+$("#productLbNum_"+b.length).val()+"\\\"}";
	}
		otherData += "]\"}";
		
		
	otherData += "&productFirewall={\"count\":\""+$("#productFirewallCount").val()+"\",\"brandAndNum\":\"[";
	var c = $("#productFirewall div");
	if(c.length==1){
		otherData += "{\\\"brand\\\":\\\""+$("#productFirewallBrand_1").val()+"\\\",\\\"num\\\":\\\""+$("#productFirewallNum_1").val()+"\\\"}";
	}else if(c.length>=2){
		for(var i=1;i<=c.length-1;i++){
			otherData += "{\\\"brand\\\":\\\""+$("#productFirewallBrand_"+i).val()+"\\\",\\\"num\\\":\\\""+$("#productFirewallNum_"+i).val()+"\\\"},";
		}
		otherData += "{\\\"brand\\\":\\\""+$("#productFirewallBrand_"+c.length).val()+"\\\",\\\"num\\\":\\\""+$("#productFirewallNum_"+c.length).val()+"\\\"}";
	}
		otherData += "]\"}";
	
			
	otherData += "&productInvadeCheck={\"count\":\""+$("#productInvadeCheckCount").val()+"\",\"brandAndNum\":\"[";
	var d = $("#productInvadeCheck div");
	if(d.length==1){
		otherData += "{\\\"brand\\\":\\\""+$("#productInvadeCheckBrand_1").val()+"\\\",\\\"num\\\":\\\""+$("#productInvadeCheckNum_1").val()+"\\\"}";
	}else if(d.length>=2){
		for(var i=1;i<=d.length-1;i++){
			otherData += "{\\\"brand\\\":\\\""+$("#productInvadeCheckBrand_"+i).val()+"\\\",\\\"num\\\":\\\""+$("#productInvadeCheckNum_"+i).val()+"\\\"},";
		}
		otherData += "{\\\"brand\\\":\\\""+$("#productInvadeCheckBrand_"+d.length).val()+"\\\",\\\"num\\\":\\\""+$("#productInvadeCheckNum_"+d.length).val()+"\\\"}";
	}
		otherData += "]\"}";
				
				
	otherData += "&productSecurityAudit={\"count\":\""+$("#productSecurityAuditCount").val()+"\",\"brandAndNum\":\"[";
	var e = $("#productSecurityAudit div");
	if(e.length==1){
		otherData += "{\\\"brand\\\":\\\""+$("#productSecurityAuditBrand_1").val()+"\\\",\\\"num\\\":\\\""+$("#productSecurityAuditNum_1").val()+"\\\"}";
	}else if(e.length>=2){
		for(var i=1;i<=e.length-1;i++){
			otherData += "{\\\"brand\\\":\\\""+$("#productSecurityAuditBrand_"+i).val()+"\\\",\\\"num\\\":\\\""+$("#productSecurityAuditNum_"+i).val()+"\\\"},";
		}
		otherData += "{\\\"brand\\\":\\\""+$("#productSecurityAuditBrand_"+e.length).val()+"\\\",\\\"num\\\":\\\""+$("#productSecurityAuditNum_"+e.length).val()+"\\\"}";
	}
		otherData += "]\"}";
					
		otherData += "&checkSeepTest={\"count\":\""+$("#checkSeepTestCount").val()+"\",\"success\":\""+$("#checkSeepTestSuccess").val()+"\"}";
		
		otherData += "&checkBadcodeTest={\"server\":\"{\\\"count\\\":\\\""+$("#checkBadcodeTestServerCount").val()+"\\\",\\\"failure\\\":\\\""+$("#checkBadcodeTestServerFailure").val()+"\\\"}\",";
		otherData += "\"terminal\":\"{\\\"count\\\":\\\""+$("#checkBadcodeTestTerminalCount").val()+"\\\",\\\"failure\\\":\\\""+$("#checkBadcodeTestTerminalFailure").val()+"\\\"}\"}";
		
		otherData += "&checkLeakTest={\"server\":\"{\\\"count\\\":\\\""+$("#checkLeakTestServerCount").val()+"\\\",\\\"failure\\\":\\\""+$("#checkLeakTestServerFailure").val()+"\\\"}\",";
		otherData += "\"terminal\":\"{\\\"count\\\":\\\""+$("#checkLeakTestTerminalCount").val()+"\\\",\\\"failure\\\":\\\""+$("#checkLeakTestTerminalFailure").val()+"\\\"}\"}";
		
		
		otherData += "&epibolyOrgan=[";
		var f = $("#table_1 tbody");
		if(f.length-28==1){
			otherData += "\"{\\\"name\\\":\\\""+$("#epibolyOrganName_1").val()+"\\\",\\\"nature\\\":\\\""+$("#epibolyOrganNature_1").val()+"\\\",";
			otherData += "\\\"service\\\":\\\""+$("#epibolyOrganService_1").val()+"\\\",\\\"otherService\\\":\\\""+$("#epibolyOrganotherService_1").val()+"\\\",";
			otherData += "\\\"protocol\\\":\\\""+$("#epibolyOrganProtocol_1").val()+"\\\",\\\"ce\\\":\\\""+$("#epibolyOrganCe_1").val()+"\\\",";
			otherData += "\\\"ceCenter\\\":\\\""+$("#epibolyOrganotherCeCenter_1").val()+"\\\"}\"";
		}else if(f.length-28>=2){
			for(var i=1;i<=f.length-29;i++){
				otherData += "\"{\\\"name\\\":\\\""+$("#epibolyOrganName_"+i).val()+"\\\",\\\"nature\\\":\\\""+$("#epibolyOrganNature_"+i).val()+"\\\",";
				otherData += "\\\"service\\\":\\\""+$("#epibolyOrganService_"+i).val()+"\\\",\\\"otherService\\\":\\\""+$("#epibolyOrganotherService_"+i).val()+"\\\",";
				otherData += "\\\"protocol\\\":\\\""+$("#epibolyOrganProtocol_"+i).val()+"\\\",\\\"ce\\\":\\\""+$("#epibolyOrganCe_"+i).val()+"\\\",";
				otherData += "\\\"ceCenter\\\":\\\""+$("#epibolyOrganotherCeCenter_"+i).val()+"\\\"}\",";
			}
			var ff = f.length-28;
			otherData += "\"{\\\"name\\\":\\\""+$("#epibolyOrganName_"+ff).val()+"\\\",\\\"nature\\\":\\\""+$("#epibolyOrganNature_"+ff).val()+"\\\",";
			otherData += "\\\"service\\\":\\\""+$("#epibolyOrganService_"+ff).val()+"\\\",\\\"otherService\\\":\\\""+$("#epibolyOrganotherService_"+ff).val()+"\\\",";
			otherData += "\\\"protocol\\\":\\\""+$("#epibolyOrganProtocol_"+ff).val()+"\\\",\\\"ce\\\":\\\""+$("#epibolyOrganCe_"+ff).val()+"\\\",";
			otherData += "\\\"ceCenter\\\":\\\""+$("#epibolyOrganotherCeCenter_"+ff).val()+"\\\"}\"";
		}
			otherData += "]";
		
		var g = $("#problem div");
		otherData += "&problem={";
		if(g.length==1){
				otherData += "\"1\":\""+$("#problem_1").val()+"\"";
		}else if(g.length>=2){
			for(var i=1;i<=g.length-1;i++){
				otherData += "\""+i+"\":\""+$("#problem_"+i).val()+"\",";
			}
			otherData += "\""+g.length+"\":\""+$("#problem_"+g.length).val()+"\"";
		}
			otherData += "}";
		var h = $("#risk div");
		otherData += "&risk={";
		if(h.length==1){
				otherData += "\"1\":\""+$("#risk_1").val()+"\"";
		}else if(h.length>=2){
			for(var i=1;i<=h.length-1;i++){
				otherData += "\""+i+"\":\""+$("#risk_"+i).val()+"\",";
			}
			otherData += "\""+h.length+"\":\""+$("#risk_"+h.length).val()+"\"";
		}
			otherData += "}";
			
		var k = $("#judge div");
		otherData += "&judge={";
		if(k.length==1){
				otherData += "\"1\":\""+$("#judge_1").val()+"\"";
		}else if(k.length>=2){
			for(var i=1;i<=k.length-1;i++){
				otherData += "\""+i+"\":\""+$("#judge_"+i).val()+"\",";
			}
			otherData += "\""+k.length+"\":\""+$("#judge_"+k.length).val()+"\"";
		}
			otherData += "}";
		
		var x1 =$("[name=securityDefense_c]");
		var y1 = "";
		for(var i = 0; i<x1.length;i++){
			if(x1[i].checked){
				y1 += x1[i].value+",";
			}
		}
		y1=y1.substring(0,y1.lastIndexOf(","));
		otherData += "&securityDefense="+y1;
		
		var x2 = $("[name=emailProtect_c]");
		var y2 = "";
		for(var i = 0; i<x2.length;i++){
			if(x2[i].checked){
				y2 += x2[i].value+",";
			}
		}
		y2=y2.substring(0,y2.lastIndexOf(","));
		otherData += "&emailProtect="+y2;
		
		var x3 = $("[name=terminalUnifiedManage_c]");
		var y3 = "";
		for(var i = 0; i<x3.length;i++){
			if(x3[i].checked){
				y3 += x3[i].value+",";
			}
		}
		y3=y3.substring(0,y3.lastIndexOf(","));
		otherData += "&terminalUnifiedManage="+y3;
		
		
		var time = new Date();
		otherData += "&initiateTime="+time.getTime()+"&applyTime="+time.getTime();
		return otherData;
};

	/**  保存操作   */
$.postsave = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();
//	 alert(_data+otherData);
//	 return false;

	if (Url != "") {
		$
				.ajax({
					url : Url + "/basicCrud/securityCheck/save",
					type : 'post',
					data : _data + otherData,
					dataType : 'json',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.success == true) {
								alert("操作成功");
								window.close();
								location.href = Url
										+ "/securityCheck/securityCheckList";

							} else {
								alert("修改失败");
							}
						} else {
							alert("修改失败");
						}

					}
				});
	}

};


	/**  读取操作   */
$.postResourceManageDetail = function(firUrl,id,isread){
	 if(firUrl!="")
	   {	
			 $.ajax({
				   async: false,
				    url : firUrl+"/basicCrud/securityCheck/get/"+id,
					type : 'post',
					dataType : 'json',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{
							if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
							{
								var entry=data.result;
								for ( var item in entry){
								  try{ 
									  if(entry[item]==null){
										  $("[name="+item+"]").val("");
									  }else{
										  $("[name="+item+"]").val(entry[item]);
									  }
									  
								  	}catch (e){ 
										//alert(e);
									}
								}
								var infoSysSummary = eval('('+data.result.infoSysSummary+')');
								$("#infoSysSummaryCount").val(infoSysSummary.count);
								$("#infoSysSummaryPublic").val(infoSysSummary.public);
								$("#infoSysSummaryCheckPass").val(infoSysSummary.checkPass);
								$("#infoSysSummaryInternet").val(infoSysSummary.internet);
								$("#infoSysSummaryNoInternet").val(infoSysSummary.noInternet);
								
								var internetAccess = eval('('+data.result.internetAccess+')');
								var unicom = eval('('+internetAccess.unicom+')');
								var mobile = eval('('+internetAccess.mobile+')');
								var other = eval('('+internetAccess.other+')');
								if(unicom.num!=""){
									$("#unicom").attr("checked","checked");
									$("#tunicom").css("display","table-row-group");
									$("#tmobile").css("display","none");
									$("#tother").css("display","none");
								}
								if(mobile.num!=""){
									$("#mobile").attr("checked","checked");
									$("#tunicom").css("display","none");
									$("#tmobile").css("display","table-row-group");
									$("#tother").css("display","none");
								}
								if(other.num!=""){
									$("#otherRadio").attr("checked","checked");
									$("#tunicom").css("display","none");
									$("#tmobile").css("display","none");
									$("#tother").css("display","table-row-group");
								}
								$("#internetAccessCount").val(internetAccess.count);
								$("#unicomNum").val(unicom.num);
								$("#unicomBw").val(unicom.bw);
								$("#mobileNum").val(mobile.num);
								$("#mobileBw").val(mobile.bw);
								$("#otherName").val(other.name);
								$("#otherNum").val(other.num);
								$("#otherBw").val(other.bw);
								
								
								
								var sysLevel = eval('('+data.result.sysLevel+')');
								$("#lv1").val(sysLevel.lv1);
								$("#lv2").val(sysLevel.lv2);
								$("#lv3").val(sysLevel.lv3);
								$("#lv4").val(sysLevel.lv4);
								$("#no").val(sysLevel.no);
								
								
								if($("[name=netRemoteControl]").val()=="outerSide"||$("[name=netRemoteControl]").val()=="foreign"){
									$("#netRemoteControlSys").css("display","table-row-group");
								} else{
									$("#netRemoteControlSys").css("display","none");
								} 
								$("#sysName_1").remove();
								var netRemoteControlSys = eval('('+data.result.netRemoteControlSys+')');
								var a = 0;
								for( value in netRemoteControlSys){
									a += 1;
									var item = "";
									item = "<div id='sysName_"+a+"' style='display:inline'>系统名称：<input type='text' disabled class='input_large' id='netRemoteControlSys_"+a+"' style='width:170px;'>&nbsp;</div>";
									$("#sysName").append(item);
									$("#netRemoteControlSys_"+a).val(netRemoteControlSys[value]);
								}
								
								
								var routerUse = eval('('+data.result.routerUse+')');
								if(routerUse.visitInternet != "0"){
									$("option[value=visitInternet]").attr("selected","selected");
								}else if(routerUse.visitBusinessNet != "0"){
									$("option[value=visitBusinessNet]").attr("selected","selected");
								}else{
									$("option[value='']").attr("selected","selected");
								}
								
								if($("[name=routerUse_select]").val()=="visitInternet"){
									$("#internet").css("display","inline");
									$("#businessNet").css("display","none");
								} else if($("[name=routerUse_select]").val()=="visitBusinessNet"){
									$("#internet").css("display","none");
									$("#businessNet").css("display","inline");
								}else{
									$("#internet").css("display","none");
									$("#businessNet").css("display","none");
								}
								$("#visitInternet").val(routerUse.visitInternet);
								$("#visitBusinessNet").val(routerUse.visitBusinessNet);
								
								
								var productServer = eval('('+data.result.productServer+')');
								var brandServer = eval('('+productServer.brand+')');
								var sysServer = eval('('+productServer.sys+')');
								$("#productServerCount").val(productServer.count);
								$("#productServerBrandInternal").val(brandServer.internal);
								$("#productServerBrandInternalCpu").val(brandServer.internalCpu);
								$("#productServerBrandForeign").val(brandServer.foreign);
								$("#productServerSysInternal").val(sysServer.internal);
								$("#productServerSysForeign").val(sysServer.foreign);
								
								
								var productTerminal = eval('('+data.result.productTerminal+')');
								var brandTerminal = eval('('+productTerminal.brand+')');
								var sysTerminal = eval('('+productTerminal.sys+')');
								$("#productTerminalCount").val(productTerminal.count);
								$("#productTerminalBrandInternal").val(brandTerminal.internal);
								$("#productTerminalBrandInternalCpu").val(brandTerminal.internalCpu);
								$("#productTerminalForeign").val(brandTerminal.foreign);
								$("#productTerminalSysInternal").val(sysTerminal.internal);
								$("#productTerminalSysForeign").val(sysTerminal.foreign);
								$("#productTerminalSyswinXp").val(sysTerminal.winXp);
								$("[name=afterWinXpStop]").val(sysTerminal.afterWinXpStop);
								$("[name=afterWinXpStopOther]").val(sysTerminal.afterWinXpStopOther);
								$("#internalWord").val(productTerminal.internalWord);
								$("#internalFireWall").val(productTerminal.internalFireWall);
								if($("[name=afterWinXpStop]").val()=="other"){
									$("[name=afterWinXpStopOther]").css("display","table-row-group");
								}else{
									$("[name=afterWinXpStopOther]").css("display","none");
								}
								
								
								var productRouter = eval('('+data.result.productRouter+')');
								var routerBrand = eval('('+productRouter.brand+')');
								$("#productRouterCount").val(productRouter.count);
								$("#productRouterBrandInternal").val(routerBrand.internal);
								$("#productRouterBrandForeign").val(routerBrand.foreign);
								
								
								var productSwitch = eval('('+data.result.productSwitch+')');
								var switchBrand = eval('('+productSwitch.brand+')');
								$("#productSwitchCount").val(productSwitch.count);
								$("#productSwitchBrandInternal").val(switchBrand.internal);
								$("#productSwitchBrandForeign").val(switchBrand.foreign);
								
								
								var productStorage = eval('('+data.result.productStorage+')');
								var storageBrand = eval('('+productStorage.brand+')');
								$("#productStorageCount").val(productStorage.count);
								$("#productStorageBrandInternal").val(storageBrand.internal);
								$("#productStorageBrandForeign").val(storageBrand.foreign);
								
								
								var productDb = eval('('+data.result.productDb+')');
								var DbBrand = eval('('+productDb.brand+')');
								$("#productDbCount").val(productDb.count);
								$("#productDbBrandInternal").val(DbBrand.internal);
								$("#productDbBrandForeign").val(DbBrand.foreign);
								
								
								var productDb = eval('('+data.result.productDb+')');
								var DbBrand = eval('('+productDb.brand+')');
								$("#productDbCount").val(productDb.count);
								$("#productDbBrandInternal").val(DbBrand.internal);
								$("#productDbBrandForeign").val(DbBrand.foreign);
								
								
								var productEmail = eval('('+data.result.productEmail+')');
								$("#productEmailCount").val(productEmail.count);
								var brandAndNumEmail = eval('('+productEmail.brandAndNum+')');
								$("#email_1").remove();
								for(var i=1;i<=brandAndNumEmail.length;i++ ){
									var item = "";
									item += "<div id='email_"+i+"' style='display:inline'> 品牌：<input type='text' disabled class='input_large' id='productEmailBrand_"+i+"' style='width:80px;' /> ";
									item += "数量：<input type='text' disabled class='input_large' id='productEmailNum_"+i+"' style='width:80px;' /> </div>";
									$("#email").append(item);
									$("#productEmailBrand_"+i).val(brandAndNumEmail[i-1].brand);
									$("#productEmailNum_"+i).val(brandAndNumEmail[i-1].num);
								}
								
								
								var productLb = eval('('+data.result.productLb+')');
								$("#productLbCount").val(productLb.count);
								var brandAndNumLb = eval('('+productLb.brandAndNum+')');
								$("#productLb_1").remove();
								for(var i=1;i<=brandAndNumLb.length;i++ ){
									var item = "";
									item += "<div id='productLb_"+i+"' style='display:inline'> 品牌：<input type='text' disabled class='input_large' id='productLbBrand_"+i+"' style='width:80px;' /> ";
									item += "数量：<input type='text' disabled class='input_large' id='productLbNum_"+i+"' style='width:80px;' /> </div>";
									$("#productLb").append(item);
									$("#productLbBrand_"+i).val(brandAndNumLb[i-1].brand);
									$("#productLbNum_"+i).val(brandAndNumLb[i-1].num);
								}
								
								
								var productFirewall = eval('('+data.result.productFirewall+')');
								$("#productFirewallCount").val(productFirewall.count);
								var brandAndNumFirewall = eval('('+productFirewall.brandAndNum+')');
								$("#productFirewall_1").remove();
								for(var i=1;i<=brandAndNumFirewall.length;i++ ){
									var item = "";
									item += "<div id='productFirewall_"+i+"' style='display:inline'> 品牌：<input type='text' disabled class='input_large' id='productFirewallBrand_"+i+"' style='width:80px;' /> ";
									item += "数量：<input type='text' disabled class='input_large' id='productFirewallNum_"+i+"' style='width:80px;' /> </div>";
									$("#productFirewall").append(item);
									$("#productFirewallBrand_"+i).val(brandAndNumFirewall[i-1].brand);
									$("#productFirewallNum_"+i).val(brandAndNumFirewall[i-1].num);
								}
								
								
								var productInvadeCheck = eval('('+data.result.productInvadeCheck+')');
								$("#productInvadeCheckCount").val(productInvadeCheck.count);
								var brandAndNumInvadeCheck = eval('('+productInvadeCheck.brandAndNum+')');
								$("#productInvadeCheck_1").remove();
								for(var i=1;i<=brandAndNumInvadeCheck.length;i++ ){
									var item = "";
									item += "<div id='productInvadeCheck_"+i+"' style='display:inline'> 品牌：<input type='text' disabled class='input_large' id='productInvadeCheckBrand_"+i+"' style='width:80px;' /> ";
									item += "数量：<input type='text' disabled class='input_large' id='productInvadeCheckNum_"+i+"' style='width:80px;' /> </div>";
									$("#productInvadeCheck").append(item);
									$("#productInvadeCheckBrand_"+i).val(brandAndNumInvadeCheck[i-1].brand);
									$("#productInvadeCheckNum_"+i).val(brandAndNumInvadeCheck[i-1].num);
								}
								
								
								var productSecurityAudit = eval('('+data.result.productSecurityAudit+')');
								$("#productSecurityAuditCount").val(productSecurityAudit.count);
								var brandAndNumSecurityAudit = eval('('+productSecurityAudit.brandAndNum+')');
								$("#productSecurityAudit_1").remove();
								for(var i=1;i<=brandAndNumInvadeCheck.length;i++ ){
									var item = "";
									item += "<div id='productSecurityAudit_"+i+"' style='display:inline'> 品牌：<input type='text' disabled class='input_large' id='productSecurityAuditBrand_"+i+"' style='width:80px;' /> ";
									item += "数量：<input type='text' disabled class='input_large' id='productSecurityAuditNum_"+i+"' style='width:80px;' /> </div>";
									$("#productSecurityAudit").append(item);
									$("#productSecurityAuditBrand_"+i).val(brandAndNumSecurityAudit[i-1].brand);
									$("#productSecurityAuditNum_"+i).val(brandAndNumSecurityAudit[i-1].num);
								}
								
								
								var checkSeepTest = eval('('+data.result.checkSeepTest+')');
								$("#checkSeepTestCount").val(checkSeepTest.count);
								$("#checkSeepTestSuccess").val(checkSeepTest.success);
								
								
								var checkBadcodeTest = eval('('+data.result.checkBadcodeTest+')');
								var serverBadcodeTest = eval('('+checkBadcodeTest.server+')');
								var terminalBadcodeTest = eval('('+checkBadcodeTest.terminal+')');
								$("#checkBadcodeTestServerCount").val(serverBadcodeTest.count);
								$("#checkBadcodeTestServerFailure").val(serverBadcodeTest.failure);
								$("#checkBadcodeTestTerminalCount").val(terminalBadcodeTest.count);
								$("#checkBadcodeTestTerminalFailure").val(terminalBadcodeTest.failure);
								
								
								var checkLeakTest = eval('('+data.result.checkLeakTest+')');
								var serverLeakTest = eval('('+checkLeakTest.server+')');
								var terminalLeakTest = eval('('+checkLeakTest.terminal+')');
								$("#checkLeakTestServerCount").val(serverLeakTest.count);
								$("#checkLeakTestServerFailure").val(serverLeakTest.failure);
								$("#checkLeakTestTerminalCount").val(terminalLeakTest.count);
								$("#checkLeakTestTerminalFailure").val(terminalLeakTest.failure);
								
								
								var epibolyOrgan = eval('('+data.result.epibolyOrgan+')');
								$("#epibolyOrgan_1").remove();
								for(var i=1;i<=epibolyOrgan.length;i++ ){
									var item = "";
									item += "<tbody class='tb10' id='epibolyOrgan_"+i+"' ><tr><td class='lableTd t_r' style='text-decoration:inline;'><h3>外包服务机构</h3></td>" +
									"<td colspan='3' class='lableTd t_r'style='text-decoration:inline;'></td></tr><tr><td class='lableTd t_r'>机构名称</td>" +
									"<td><input type='text' class='input_large'id='epibolyOrganName_"+i+"' disabled /></td><td class='lableTd t_r'>机构性质</td><td>" +
									"<select class='input_large' id='epibolyOrganNature_"+i+"' disabled><option value=''>请选择</option>" +
									"<option value='state'>国有单位</option><option value='private'>民营企业</option><option value='foreign'>外资企业</option>" +
									"</select></td></tr><tr><td class='lableTd t_r'>服务内容</td><td><select class='input_large' id='epibolyOrganService_"+i+"' disabled>" +
									"<option value=''>请选择</option><option value='integration'>系统集成</option><option value='maintain'>系统运维</option>" +
									"<option value='risk'>风险评估</option><option value='check'>安全检测</option><option value='fasten'>安全加固</option>" +
									"<option value='support'>应急支持</option><option value='store'>数据存储</option><option value='backup'>灾难备份</option>" +
									"<option value='other'>其他</option></select></td><td class='lableTd t_r'>服务内容_其他</td>" +
									"<td><input type='text' class='input_large'id='epibolyOrganotherService_"+i+"' disabled /></td></tr><tr>" +
									"<td class='lableTd t_r'>信息安全管理体系认证情况</td><td><select class='input_large' id='epibolyOrganCe_"+i+"' disabled>" +
									"<option value=''>请选择</option><option value='yes'>已通过认证</option><option value='no'>未通过认证</option></select></td>" +
									"<td class='lableTd t_r'>认证机构</td><td><input type='text' class='input_large'id='epibolyOrganotherCeCenter_"+i+"' disabled /></td>" +
									"</tr><tr><td class='lableTd t_r'>网络安全与保密协议</td><td><select class='input_large' id='epibolyOrganProtocol_"+i+"' disabled>" +
									"<option value=''>请选择</option><option value='yes'>已签订</option><option value='no'>未签订</option></select></td>" +
									"</tr></tbody>";
							
									$("#table_1").append(item);
									
									var epiboly = eval('('+epibolyOrgan[i-1]+')');
									$("#epibolyOrganName_"+i).val(epiboly.name);
									$("#epibolyOrganNature_"+i).val(epiboly.nature);
									$("#epibolyOrganService_"+i).val(epiboly.service);
									$("#epibolyOrganotherService_"+i).val(epiboly.otherService);
									$("#epibolyOrganProtocol_"+i).val(epiboly.protocol);
									$("#epibolyOrganCe_"+i).val(epiboly.ce);
									$("#epibolyOrganotherCeCenter_"+i).val(epiboly.ceCenter);
								}
								
								var problem = eval('('+data.result.problem+')');
								$("#problem_1").remove();
								$("#problemDiv").remove();
								var pro = 0;
								for(value in problem){
									pro += 1;
									var item = "";
									item += "<div id='problemDiv_"+pro+"'><textarea rows='4'";
									item += " id='problem_"+pro+"' style='margin-top:0px;margin-bottom:0px;height:89px;' disabled></textarea></div>";
									$("#problem").append(item);
									$("#problem_"+pro).val(problem[value]);
								}
								
								var risk = eval('('+data.result.risk+')');
								$("#risk_1").remove();
								$("#riskDiv").remove();
								var ris = 0;
								for(value in risk){
									ris += 1;
									var item = "";
									item += "<div id='riskDiv_"+ris+"'><textarea rows='4'";
									item += " id='risk_"+ris+"' style='margin-top:0px;margin-bottom:0px;height:89px;' disabled></textarea></div>";
									$("#risk").append(item);
									$("#risk_"+ris).val(risk[value]);
								}
								
								
								var judge = eval('('+data.result.judge+')');
								$("#judge_1").remove();
								$("#judgeDiv").remove();
								var jud = 0;
								for(value in judge){
									jud += 1;
									var item = "";
									item += "<div id='judgeDiv_"+jud+"'><textarea rows='4'";
									item += " id='judge_"+jud+"' style='margin-top:0px;margin-bottom:0px;height:89px;' disabled></textarea></div>";
									$("#judge").append(item);
									$("#judge_"+jud).val(judge[value]);
								}
								
								if(entry.securityDefense!=null){
								var x1= entry.securityDefense.split(",");
								for(var i = 0;i<x1.length;i++){
								
								if($("#idDefense").val()==x1[i]){
									$("#idDefense").attr("checked","checked");
									
								}
								
								if($("#ipDefense").val()==x1[i]){
									$("#ipDefense").attr("checked","checked");
									
								}
								
								if($("#noDefense").val()==x1[i]){
									$("#noDefense").attr("checked","checked");
									
								}
								
							}
								}	
								if(entry.emailProtect!=null){
								var x2= entry.emailProtect.split(",");
								for(var i = 0;i<x2.length;i++){
								
								if($("#antivirus").val()==x2[i]){
									$("#antivirus").attr("checked","checked");
									
								}
								
								if($("#fireWall").val()==x2[i]){
									$("#fireWall").attr("checked","checked");
									
								}
								
								if($("#antiJunkMail").val()==x2[i]){
									$("#antiJunkMail").attr("checked","checked");
									
								}
								
								if($("#other").val()==x2[i]){
									$("#other").attr("checked","checked");
									$("#emailProtectOther").css("display","table-row-group");
								}
								
							}
							
								}	
								
								if(entry.terminalUnifiedManage!=null){
								var x3= entry.terminalUnifiedManage.split(",");
								for(var i = 0;i<x3.length;i++){
								
								if($("#appInstall").val()==x3[i]){
									$("#appInstall").attr("checked","checked");
									
								}
								
								if($("#patchInstall").val()==x3[i]){
									$("#patchInstall").attr("checked","checked");
									
								}
								
								if($("#antivirus").val()==x3[i]){
									$("#antivirus").attr("checked","checked");
									
								}
								
								if($("#safeAudit").val()==x3[i]){
									$("#safeAudit").attr("checked","checked");
									
								}
								
								if($("#UDIskControl").val()==x3[i]){
									$("#UDIskControl").attr("checked","checked");
									
								}
								
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
};
/**  审核  */
$.postAudit = function(firUrl,id){
	 if(firUrl!="")
	   {	
			 $.ajax({
				   async: false,
				    url : firUrl+"/basicCrud/securityCheck/get/"+id,
					type : 'post',
					dataType : 'json',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{
							if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
							{
								var entry = data.result;
								  $("[name=btnISPass]").click(function(){
								  
										var _str="",_str2="";
										switch($("input[name=btnISPass]:checked").val())
										{
										case"pass":
											_str="通过。";
											_str2="审核通过";
										         
											$("#btnSubmit2").val("提交审核");
											break;
											
										case"notPass":
											_str="不通过。";
											_str2="返回申报人修改";
												$("[name=caozuo]").css("display","none");
											$("#btnSubmit2").val("返回修改");
											break;
										
										}
									  $("[name=suggestion]").val(_str);
									  $("#nextDo").val(_str2);
									  
									});
								  
								  
								  $("#btnSubmit2").click(function(){
										
										if($("input[name=btnISPass]:checked").val()=="pass")
								         {
											 var otherData="";var d = new Date();
											 
												otherData+="&id="+QueryString.GetValue('id')+$.getPerson("${pageContext.request.contextPath}")+"&handler"+entry.initiator+"&handlerLoginname"+entry.initiatorLoginname+"&status=pass";
												otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
													
												$(this).attr("disabled", true);
												$.postsave(firUrl,"projectPlanForm",otherData);
								         }else if($("input[name=btnISPass]:checked").val()=="notPass"){
								        	 var otherData=""; var d = new Date();
											 
											 
								        	 	otherData+="&id="+QueryString.GetValue('id')+$.getPerson("${pageContext.request.contextPath}")+"&handler"+entry.initiator+"&handlerLoginname"+entry.initiatorLoginname+"&status=unpass";
												otherData+="&suggestion="+$("[name=suggestion]").val()+"&initiateTime="+d.getTime();
													
												$(this).attr("disabled", true);
												$.postsave(firUrl,"projectPlanForm",otherData);
								         }else{
											alert("请选择是否通过");
										}
								  });
							}
						}
					}
			 });
	   };
};

$.getSuggestInDept = function(firUrl, _id) {
	if (firUrl != "") {
		$.ajax({
					async : false,
					url : firUrl+ "/basicCrud/workflowLog/all?ptype=securityCheck&pid="+ _id + "&sort=initiateTime desc",
					type : 'post',
					dataType : 'json',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.result&& JSON.stringify(data.result) != "[]") {
								$.each(data.result,function(entryIndex, entry) {
									var _str = "";
//									 alert(entry.status);
//									 return false;
									switch (entry.status) {
									case "审核通过":
									case "审核不通过":
										_str = "<div class=\"node\"><b class=\"fl\">信息管理中心意见</b><div class=\"clear\"></div><div class=\"con\">";
										_str += "<i>信息中心管理岗位</i><div><p>"+ entry.suggestion+ "</p></div><div class=\"t_r\">"
												+ entry.initiator+ "<span class=\"date_02 mr5\">"+ entry.initiateTime+ "</span></div></div></div>";

										break;
									}

									$("#table_4 tbody tr td").append(_str);
								});
							}
						}
					}
				});
	}

};




$.postDele = function(firUrl, id) {
	if (firUrl != "") {
		$.ajax({
			url : firUrl + "/basicCrud/securityCheck/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
						window.close();
					}
				}

			}
		});
	}
};

$.getListDetail = function(firUrl) {

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			dataType : 'json',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						$("[name=applyer]").val(data.cookies.userName);
						$("[name=applyerLoginname]").val(data.cookies.loginName);
						$("[name=initiator]").val(data.cookies.userName);
						$("[name=initiatorLoginname]").val(data.cookies.loginName);
						$("[name=company]").val(data.cookies.deptName);
						$("#company").val(data.cookies.deptName);
						$("[name=companyId]").val(data.cookies.deptId);
					}
				}
			}

		});
	}

};
$.getPerson = function(firUrl) {
	var _isleader = "";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						_isleader = "&initiator=" + data.cookies.userName
								+ "&initiatorLoginname="
								+ data.cookies.loginName;

					}
				}
			}
		});
	}
	return _isleader;
};
$.getTitle = function(firUrl) {

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			dataType : 'json',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						var title = data.cookies.deptName+"2015年信息安全检查总结报告";
						$("#title").append(title);
					}
				}
			}

		});
	}

};
  
  
  $(document).ready(function() {
		$("#a1").click(function() {
			if($("#tb1").css("display")=="none"){
				$("#tb1").css("display","table-row-group");
			}else if($("#tb1").css("display")=="table-row-group"){
				$("#tb1").css("display","none");
			}else{
				$("#tb1").css("display","none");
			}
		});
		$("#a2").click(function() {
			if($(".tb2").css("display")=="none"){
				$(".tb2").css("display","table-row-group");
			}else if($(".tb2").css("display")=="table-row-group"){
				$(".tb2").css("display","none");
			}else{
				$(".tb2").css("display","none");
			}
		});
		$("#a3").click(function() {
			if($("#tb3").css("display")=="none"){
				$("#tb3").css("display","table-row-group");
			}else if($("#tb3").css("display")=="table-row-group"){
				$("#tb3").css("display","none");
			}else{
				$("#tb3").css("display","none");
			}
		});
		$("#a4").click(function() {
			if($(".tb4").css("display")=="none"){
				$(".tb4").css("display","table-row-group");
			}else if($(".tb4").css("display")=="table-row-group"){
				$(".tb4").css("display","none");
			}else{
				$(".tb4").css("display","none");
			}
		});
		$("#a5").click(function() {
			if($(".tb5").css("display")=="none"){
				$(".tb5").css("display","table-row-group");
			}else if($(".tb5").css("display")=="table-row-group"){
				$(".tb5").css("display","none");
			}else{
				$(".tb5").css("display","none");
			}
		});
		$("#a6").click(function() {
			if($("#tb6").css("display")=="none"){
				$("#tb6").css("display","table-row-group");
			}else if($("#tb6").css("display")=="table-row-group"){
				$("#tb6").css("display","none");
			}else{
				$("#tb6").css("display","none");
			}
		});
		$("#a7").click(function() {
			if($(".tb7").css("display")=="none"){
				$(".tb7").css("display","table-row-group");
			}else if($(".tb7").css("display")=="table-row-group"){
				$(".tb7").css("display","none");
			}else{
				$(".tb7").css("display","none");
			}
		});
		$("#a8").click(function() {
			if($("#tb8").css("display")=="none"){
				$("#tb8").css("display","table-row-group");
			}else if($("#tb8").css("display")=="table-row-group"){
				$("#tb8").css("display","none");
			}else{
				$("#tb8").css("display","none");
			}
		});
		$("#a9").click(function() {
			if($("#tb9").css("display")=="none"){
				$("#tb9").css("display","table-row-group");
			}else if($("#tb9").css("display")=="table-row-group"){
				$("#tb9").css("display","none");
			}else{
				$("#tb9").css("display","none");
			}
		});
		$("#a10").click(function() {
			if($(".tb10").css("display")=="none"){
				$(".tb10").css("display","table-row-group");
			}else if($(".tb10").css("display")=="table-row-group"){
				$(".tb10").css("display","none");
			}else{
				$(".tb10").css("display","none");
			}
		});
		
		
		
	
		
	/**  网络接入情况  */
		$("#unicom").click(function(){
			$("#tunicom").css("display","table-row-group");
			$("#tmobile").css("display","none");
			$("#tother").css("display","none");
		});
		$("#mobile").click(function(){
			$("#tunicom").css("display","none");
			$("#tmobile").css("display","table-row-group");
			$("#tother").css("display","none");
		});
		$("#otherRadio").click(function(){
			$("#tunicom").css("display","none");
			$("#tmobile").css("display","none");
			$("#tother").css("display","table-row-group");
		});
		
	/**  网络安全防护设备部署  */
		$("[name=netProtectDevice]").change(function(){
            
			if($("[name=netProtectDevice]").val()=="other"){
				$("#netProtectDeviceOther").css("display","table-row-group");
			} else{
				$("#netProtectDeviceOther").css("display","none");
			}       	
       }); 
		
	/**  系统远程控制/维护  */
		$("[name=netRemoteControl]").change(function(){
            
			if($("[name=netRemoteControl]").val()=="outerSide"||$("[name=netRemoteControl]").val()=="foreign"){
				$("#netRemoteControlSys").css("display","table-row-group");
			} else{
				$("#netRemoteControlSys").css("display","none");
			}       	
       }); 
		
		
		$("#addSys").click(function(){
			var item = "";
			var i = $("#sysName div");
			var j = i.length+1;
			item += "<div id='sysName_"+j+"' style='display:inline'>系统名称：<input type='text' class='input_large' id='netRemoteControlSys_"+j+"' style='width:170px;'>&nbsp;</div>";
			$("#sysName").append(item);
		
		});
		
		$("#reduceSys").click(function(){
			var j = $("#sysName div");
			$("#sysName_"+j.length).remove();
		});
		
	/**  无线路由器用途  */
		$("[name=routerUse_select]").change(function(){
            
			if($("[name=routerUse_select]").val()=="visitInternet"){
				$("#internet").css("display","inline");
				$("#businessNet").css("display","none");
			} else if($("[name=routerUse_select]").val()=="visitBusinessNet"){
				$("#internet").css("display","none");
				$("#businessNet").css("display","inline");
			}else{
				$("#internet").css("display","none");
				$("#businessNet").css("display","none");
			}       	
       });
		
	/**  漏洞扫描   */	
		$("[name=siteLeakScan]").change(function(){
            
			if($("[name=siteLeakScan]").val()=="regular"){
				$("#siteLeakScanPeriod").css("display","inline");
			}else{
				$("#siteLeakScanPeriod").css("display","none");
			}       	
       });

	/**  电子邮件服务提供商   */
		$("[name=emailBuild]").change(function(){
            
			if($("[name=emailBuild]").val()=="thirdParty"){
				$("#emailSupplier").css("display","table-row-group");
			}else{
				$("#emailSupplier").css("display","none");
			}       	
       });
		
	/**  应急演练开展情况   */
		$("[name=emergencyTrainJob]").change(function(){
            
			if($("[name=emergencyTrainJob]").val()=="trainThisYear"){
				$("#emergencyTrainTime").css("display","table-row-group");
			}else{
				$("#emergencyTrainTime").css("display","none");
			}       	
       });
		
	/**  WindowsXP停止服务后的安全加固措施_其他   */
		$("#afterWinXpStop").change(function(){
            
			if($("#afterWinXpStop").val()=="other"){
				$("#afterWinXpStopOther").css("display","table-row-group");
			}else{
				$("#afterWinXpStopOther").css("display","none");
			}       	
       });
	
	/**  邮件系统   */
		$("#emailAdd").click(function(){
			var item = "";
			var i = $("#email div");
			var j = i.length+1;
			item += "<div id='email_"+j+"' style='display:inline'> 品牌：<input type='text' class='input_large' id='productEmailBrand_"+j+"' style='width:80px;' /> ";
			item += "数量：<input type='text' class='input_large' id='productEmailNum_"+j+"' style='width:80px;' /> </div>";
			$("#email").append(item);
		
		});
		
		$("#emailReduce").click(function(){
			var j = $("#email div");
			$("#email_"+j.length).remove();
		});
		
		/**  负载均衡设备   */
		$("#productLbAdd").click(function(){
			var item = "";
			var i = $("#productLb div");
			var j = i.length+1;
			item += "<div id='productLb_"+j+"' style='display:inline'> 品牌：<input type='text' class='input_large' id='productLbBrand_"+j+"' style='width:80px;' /> ";
			item += "数量：<input type='text' class='input_large' id='productLbNum_"+j+"' style='width:80px;' /> </div>";
			$("#productLb").append(item);
		
		});
		
		$("#productLbReduce").click(function(){
			var j = $("#productLb div");
			$("#productLb_"+j.length).remove();
		});
		
		/**  防火墙   */
		$("#productFirewallAdd").click(function(){
			var item = "";
			var i = $("#productFirewall div");
			var j = i.length+1;
			item += "<div id='productFirewall_"+j+"' style='display:inline'> 品牌：<input type='text' class='input_large' id='productFirewallBrand_"+j+"' style='width:80px;' /> ";
			item += "数量：<input type='text' class='input_large' id='productFirewallNum_"+j+"' style='width:80px;' /> </div>";
			$("#productFirewall").append(item);
		
		});
		
		$("#productFirewallReduce").click(function(){
			var j = $("#productFirewall div");
			$("#productFirewall_"+j.length).remove();
		});
		
		/**  入侵检测设备（入侵防御）   */
		$("#productInvadeCheckAdd").click(function(){
			var item = "";
			var i = $("#productInvadeCheck div");
			var j = i.length+1;
			item += "<div id='productInvadeCheck_"+j+"' style='display:inline'> 品牌：<input type='text' class='input_large' id='productInvadeCheckBrand_"+j+"' style='width:80px;' /> ";
			item += "数量：<input type='text' class='input_large' id='productInvadeCheckNum_"+j+"' style='width:80px;' /> </div>";
			$("#productInvadeCheck").append(item);
		
		});
		
		$("#productInvadeCheckReduce").click(function(){
			var j = $("#productInvadeCheck div");
			$("#productInvadeCheck_"+j.length).remove();
		});
		
		/**  安全审计设备   */
		$("#productSecurityAuditAdd").click(function(){
			var item = "";
			var i = $("#productSecurityAudit div");
			var j = i.length+1;
			item += "<div id='productSecurityAudit_"+j+"' style='display:inline'> 品牌：<input type='text' class='input_large' id='productSecurityAuditBrand_"+j+"' style='width:80px;' /> ";
			item += "数量：<input type='text' class='input_large' id='productSecurityAuditNum_"+j+"' style='width:80px;' /> </div>";
			$("#productSecurityAudit").append(item);
		
		});
		
		$("#productSecurityAuditReduce").click(function(){
			var j = $("#productSecurityAudit div");
			$("#productSecurityAudit_"+j.length).remove();
		});
		
		/**  外包服务机构   */
		$("#epibolyOrganAdd").click(function(){
			var item = "";
			var i = $("#table_1 tbody");
			var j = i.length-27;
			item += "<tbody id='epibolyOrgan_"+j+"'><tr><td class='lableTd t_r' style='text-decoration:inline;'><h3>外包服务机构</h3></td>" +
					"<td colspan='3' class='lableTd t_r'style='text-decoration:inline;'></td></tr><tr><td class='lableTd t_r'>机构名称</td>" +
					"<td><input type='text' class='input_large'id='epibolyOrganName_"+j+"' /></td><td class='lableTd t_r'>机构性质</td><td>" +
					"<select class='input_large' id='epibolyOrganNature_"+j+"'><option value=''>请选择</option>" +
					"<option value='state'>国有单位</option><option value='private'>民营企业</option><option value='foreign'>外资企业</option>" +
					"</select></td></tr><tr><td class='lableTd t_r'>服务内容</td><td><select class='input_large' id='epibolyOrganService_"+j+"'>" +
					"<option value=''>请选择</option><option value='integration'>系统集成</option><option value='maintain'>系统运维</option>" +
					"<option value='risk'>风险评估</option><option value='check'>安全检测</option><option value='fasten'>安全加固</option>" +
					"<option value='support'>应急支持</option><option value='store'>数据存储</option><option value='backup'>灾难备份</option>" +
					"<option value='other'>其他</option></select></td><td class='lableTd t_r'>服务内容_其他</td>" +
					"<td><input type='text' class='input_large'id='epibolyOrganotherService_"+j+"' /></td></tr><tr>" +
					"<td class='lableTd t_r'>信息安全管理体系认证情况</td><td><select class='input_large' id='epibolyOrganCe_"+j+"'>" +
					"<option value=''>请选择</option><option value='yes'>已通过认证</option><option value='no'>未通过认证</option></select></td>" +
					"<td class='lableTd t_r'>认证机构</td><td><input type='text' class='input_large'id='epibolyOrganotherCeCenter_"+j+"' /></td>" +
					"</tr><tr><td class='lableTd t_r'>网络安全与保密协议</td><td><select class='input_large' id='epibolyOrganProtocol_"+j+"'>" +
					"<option value=''>请选择</option><option value='yes'>已签订</option><option value='no'>未签订</option></select></td>" +
					"</tr></tbody>";
			
			$("#table_1").append(item);
		
		});
		
		$("#epibolyOrganReduce").click(function(){
			var i = $("#table_1 tbody");
			var j = i.length-28;
			$("#epibolyOrgan_"+j).remove();
		});
		
		/** 主要问题和薄弱环节   */
		$("#problemAdd").click(function(){
			var item = "";
			var i = $("#problem div");
			var j = i.length+1;
			item += "<div id='problemDiv_"+j+"'><textarea rows='4'";
			item += " id='problem_"+j+"' style='margin-top:0px;margin-bottom:0px;height:89px;'></textarea></div>";
			$("#problem").append(item);
		});
		
		$("#problemReduce").click(function(){
			var i = $("#problem div");
			var j = i.length;
			$("#problemDiv_"+j).remove();
		});
		
		/** 面临的安全威胁与风险   */
		$("#riskAdd").click(function(){
			var item = "";
			var i = $("#risk div");
			var j = i.length+1;
			item += "<div id='riskDiv_"+j+"'><textarea rows='4'";
			item += " id='risk_"+j+"' style='margin-top:0px;margin-bottom:0px;height:89px;'></textarea></div>";
			$("#risk").append(item);
		});
		
		$("#riskReduce").click(function(){
			var i = $("#risk div");
			var j = i.length;
			$("#riskDiv_"+j).remove();
		});
		
		/** 整体安全状况的基本判断   */
		$("#judgeAdd").click(function(){
			var item = "";
			var i = $("#judge div");
			var j = i.length+1;
			item += "<div id='judgeDiv_"+j+"'><textarea rows='4'";
			item += " id='judge_"+j+"' style='margin-top:0px;margin-bottom:0px;height:89px;'></textarea></div>";
			$("#judge").append(item);
		});
		
		$("#judgeReduce").click(function(){
			var i = $("#judge div");
			var j = i.length;
			$("#judgeDiv_"+j).remove();
		});
});
  
  /**  电子邮件安全防护_其他   */
function email(){
	$("#emailProtectOther").css("display","table-row-group");
};


	
/** Table页切换   */
function t1(){
	$("#1").attr().attr("class", "selected");
	$("#2").attr().attr("class", "");
	$("#3").attr().attr("class", "");
	$("#table_1").css("display","table-row-group");
	$("#table_2").css("display","none");
	$("#table_3").css("display","none");
};
function t2(){
	$("#1").attr().attr("class", "");
	$("#2").attr().attr("class", "selected");
	$("#3").attr().attr("class", "");
	$("#table_1").css("display","none");
	$("#table_2").css("display","table-row-group");
	$("#table_3").css("display","none");
};
function t3(){
	$("#1").attr().attr("class", "");
	$("#2").attr().attr("class", "");
	$("#3").attr().attr("class", "selected");
	$("#table_1").css("display","none");
	$("#table_2").css("display","none");
	$("#table_3").css("display","table-row-group");
};




