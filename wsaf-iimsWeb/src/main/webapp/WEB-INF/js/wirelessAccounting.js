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
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+$(this).text(),isleader);
 		
		});
	   
    $(".prepage").click(function(){
 	 var nowpage=parseInt($("#page>.selected a").text());

 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage),isleader;
 		 }
		}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($("#page>.selected a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchForm(firUrl,"&pageSize=16&pageNum="+nextpage,isleader);

		}); 
   
   $("#oututBtn").click(function(){
 	
	   var content =$("#projectAppform").serialize()+"&sort=id desc";
	   window.location.href=firUrl+"/basicCrud/wirelessResourceBook/export2Excel?"+content+"&type=wirelessResourceBook&status_in=finish";

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
				$(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
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
};
$.setPageInfo= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$(".table_1").find(".tableItem");
		if(_pageinfo.pageSize>nowcount)
			{
			var minMum=_pageinfo.pageSize-nowcount,len=16;
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
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>"
        		 }
        	 else{ 
      		   if(_pageinfo.currentPage==_pageinfo.totalPages){
      			   var pa=_pageinfo.currentPage-4; pb=_pageinfo.currentPage-3;pc=_pageinfo.currentPage-2; pd=_pageinfo.currentPage-1;
        		   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pd+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>";
        		   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-1){
      			   var pa=_pageinfo.currentPage-3; pb=_pageinfo.currentPage-2;pc=_pageinfo.currentPage-1;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
      			   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>";
        		   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-2){
      			   var pa=_pageinfo.currentPage-2; pb=_pageinfo.currentPage-1;pc=_pageinfo.currentPage+1;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
            	   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
      			   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
            	   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
            	   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>";
            	   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-3){
      			   var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
        		   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>"; 
        		   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-4){
      			   var pa=_pageinfo.currentPage+1; pb=_pageinfo.currentPage+2;pc=_pageinfo.currentPage+3;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
      			   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
      			   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
      			   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>"; 
      			   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
      			   pageStyle+="<li><a>...</a></li>";
      		   }else{
      			   if(_pageinfo.currentPage==2){
      				 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+3;
            		 pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">"+pd+"</a></li><li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li><li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li><li ><a class=\"topage\">"+pa+"</a></li>";
      			   }else{
      				 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+3;
            		 pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">"+pd+"</a></li><li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li><li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li><li ><a class=\"topage\">"+pa+"</a></li><li><a>...</a></li>";
      			   }
          		
      		    }
        	   }
        	 }else
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
         $("ul.pager").html(_menu);		        
	}
};



$.postSearchForm = function(firUrl,paging){
	
	 paging+="&status_in=finish";
	 paging+="&sort=id desc";
	 if(firUrl!="")
	   {	
		 $.ajax({
				  async: false,
				    url : firUrl+"/basicCrud/wirelessResourceBook/page",
					type : 'post',
					data: $("#projectAppform").serialize()+paging,
					success: function(data, status, xhr) {
						
						$.analyzeTableData(data, status, xhr,firUrl);
						$.setBtn(firUrl);
						  
			           }, 
			           error: function() {
			              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
			           }
					});
	          }
     };
     
     
   //解析Table
     $.analyzeTableData= function(data, status, xhr,firUrl)
     {
     	if (status == "success" && data != null)
     	{
     		$("tr.tableItem").remove();
     		
     		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
     		{
     			$("tr.tableItem").remove();
     			var tableItem="",table2Item="",applyBusinessTypeChina="";
     			$.each(data.result.content,function(entryIndex,entry) 
     			{
     				   //To:do
     					switch(entry.applyType)
     					{
     					case "apply":
							applyTypeChina = "申请";
							break;
						case "change":
							applyTypeChina = "变更";
							break;
						case "cancel":
							applyTypeChina = "注销";
							break;
     					default :"";
     						applyTypeChina="";
     					}
     					switch(entry.status)
     					{
     					case "draft":
     						statusChina="草稿";
     						break;
     					case "innerApproval":
     						statusChina="待内部审核";
     						break;
     					case "infoDeptApproval":
     						statusChina="待信息中心审核";
     						break;
     					case "innerTurnBack":
     						statusChina="本部门领导退回";
     						break;
     					case "turnBack":
     						statusChina="退回";
     						break;
     					case "serviceDeptApproval":
     						statusChina="待维保公司审核";
     						break;
     					case "serviceDeptBack":
     						statusChina="维保公司退回";
     						break;
     					case "waitForImplement":
     						statusChina="待实施";
     						break;
     					case "selfDealWith":
     						statusChina="自行处理";
     						break;
     					case "finish":
     						statusChina="处理完毕";
     						break;
     						default:"";
     							statusChina="";
     					}
     					
     					switch(entry.applyBusinessType)
     					{
     					case "special":
							applyBusinessTypeChina = "互联网专用设备接入";
							break;
						case "mobile":
							applyBusinessTypeChina = "移动设备接入互联网区（限集团员工申请选择）";
							break;
						case "temp":
							applyBusinessTypeChina = "临时接入互联网区（必须写明开始使用日期和结束使用日期）";
							break;
						case "manage":
							applyBusinessTypeChina = "无线接入管理网区（仅限特殊需求）";
							break;
     					default :"";
     						applyBusinessType="";
     					}
     					
     				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"></td>";
     				tableItem+="<td>"+entry.applyDept+"</td><td>"+entry.userName+"</td><td>"+entry.contactPhone+"</td><td>"+applyBusinessTypeChina+"</td><td>"+entry.macAddress+"</td><td>";
     				tableItem+=entry.implementTime+"</td><td>"+entry.implementEngineer+"</td>";
     				tableItem+="<td><a href=\"javascript:open("+entry.id+");\" style=\"display:inline\">详情 </a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:open2("+entry.id+");\" style=\"display:inline\">修改 </a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:del("+entry.id+");\" onclick=\"return confirm('确定将此记录删除?')\" style=\"display:inline\">删除 </a></td><td>&nbsp;</td>";
     				$("#table1").append(tableItem);
     				
     			});
     			$.setPageInfo(data.result);			
     		}
     		else
     			{
     			for(var i=0;i<=16;i++)
     			{
     			$("#table1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
     			}
     		  }
     	}
     };
     
   
    	
     
	
	
	
	$.findById = function(firUrl,id){
		 if(firUrl!="")
		   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/basicCrud/wirelessResourceBook/get/"+id,
						type : 'post',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
								{
									var entry=data.result;
									
									switch(entry.applyBusinessType)
			     					{
			     					case "special":
										applyBusinessTypeChina = "互联网专用设备接入";
										break;
									case "mobile":
										applyBusinessTypeChina = "移动设备接入互联网区（限集团员工申请选择）";
										break;
									case "temp":
										applyBusinessTypeChina = "临时接入互联网区（必须写明开始使用日期和结束使用日期）";
										break;
									case "manage":
										applyBusinessTypeChina = "无线接入管理网区（仅限特殊需求）";
										break;
			     					default :"";
			     						applyBusinessType="";
			     					}
									switch(entry.applyType)
			     					{
			     					case "apply":
										applyTypeChina = "申请";
										break;
									case "change":
										applyTypeChina = "变更";
										break;
									case "cancel":
										applyTypeChina = "注销";
										break;
			     					default :"";
			     						applyTypeChina="";
			     					}
			     					switch(entry.status)
			     					{
			     					case "draft":
			     						statusChina="草稿";
			     						break;
			     					case "innerApproval":
			     						statusChina="待内部审核";
			     						break;
			     					case "infoDeptApproval":
			     						statusChina="待信息中心审核";
			     						break;
			     					case "innerTurnBack":
			     						statusChina="本部门领导退回";
			     						break;
			     					case "turnBack":
			     						statusChina="退回";
			     						break;
			     					case "serviceDeptApproval":
			     						statusChina="待维保公司审核";
			     						break;
			     					case "serviceDeptBack":
			     						statusChina="维保公司退回";
			     						break;
			     					case "waitForImplement":
			     						statusChina="待实施";
			     						break;
			     					case "selfDealWith":
			     						statusChina="自行处理";
			     						break;
			     					case "finish":
			     						statusChina="处理完毕";
			     						break;
			     						default:"";
			     							statusChina="";
			     					}
			     					switch(entry.equipmentType)
			     					{
			     					case "desktop":
			     						equipmentTypeChina="台式机电脑";
			     						break;
			     					case "notebook":
			     						equipmentTypeChina="笔记本电脑";
			     						break;
			     					case "mobile":
			     						equipmentTypeChina="手机设备";
			     						break;
			     					case "pad":
			     						equipmentTypeChina="平板电脑";
			     						break;
			     					case "special":
			     						equipmentTypeChina="专用设备";
			     						break;
			     					default:"";
			     						equipmentTypeChina="";
			     					
			     					}
									if(entry.applyDept==null){
										entry.applyDept=="";
									}
									if(entry.contactPhone==null){
										entry.contactPhone=="";
									}
									if(entry.macAddress==null){
										entry.macAddress=="";
									}
									if(entry.usePlace==null){
										entry.usePlace=="";
									}
									if(entry.implementTime==null){
										entry.implementTime=="";
									}
									if(entry.implementUser==null){
										entry.implementUser=="";
									}
									if(entry.remarks==null){
										entry.remarks=="";
									}
									if(entry.userName==null){
										entry.userName=="";
									}
									if(entry.userPost==null){
										entry.userPost=="";
									}
									if(entry.accountName==null){
										entry.accountName=="";
									}
									if(entry.implementEngineer==null){
										entry.implementEngineer=="";
									}
									$("#tb1").html("");
				     				table2Item ="<tr><td class='lableTd t_r'>部门</td><td>"+entry.applyDept+"</td><td class='lableTd t_r'>使用人姓名</td><td>"+entry.userName+"</td></tr>";
				       				table2Item+="<tr><td class='lableTd t_r'>联系电话</td><td>"+entry.contactPhone+"</td><td class='lableTd t_r'>职务</td><td>"+entry.userPost+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>网络类型</td><td>wifi</td><td class='lableTd t_r'>设备类型</td><td>"+equipmentTypeChina+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>mac地址</td><td>"+entry.macAddress+"</td><td class='lableTd t_r'>账户名称</td><td>"+entry.accountName+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>用途</td><td>"+entry.usePlace+"</td><td class='lableTd t_r'>业务类型</td><td>"+applyBusinessTypeChina+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>办理日期</td> <td>"+entry.implementTime+"</td><td class='lableTd t_r'>办理人</td><td>"+entry.implementEngineer+"</td> </tr><tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>用户</td> <td>"+entry.implementUser+"</td></tr>";
				                    table2Item+="<td class='lableTd t_r' rowspan='2'>开通情况</td><td rowspan='3' colspan='3'>"+entry.remarks+"</td></tr>";
				       				$("#table2").append(table2Item);
				       				
				       				
				       				
				       				$("#tb2").html("");
				       				table3Item= "<tr><td class='lableTd t_r'>部门</td><td><input name='applyDept' type='text' class='input_large' value='"+entry.applyDept+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>使用人姓名</td><td><input name='userName' type='text'  class='input_large' value='"+entry.userName+"'/></td></tr>";
				       				table3Item+="<tr><td class='lableTd t_r'>联系电话</td><td><input name='contactPhone' type='text'  class='input_large' value='"+entry.contactPhone+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>职务</td><td><input name='userPost' type='text'  class='input_large' value='"+entry.userPost+"'/></td></tr>";
				       				table3Item+="<tr><td class='lableTd t_r'>网络类型</td><td>wifi</td><td class='lableTd t_r'>设备类型</td>";
				       				table3Item+="<td><select name='equipmentType' style='width:160px;'> <option value=''>请选择</option> <option value='desktop'>台式机电脑</option> <option value='notebook'>笔记本电脑</option><option value='mobile'>手机设备</option>"; 
				       				table3Item+="<option value='pad'>平板电脑</option><option value='special'>专用设备</option></select></td></tr>";
				       				table3Item+="<tr><td class='lableTd t_r'>mac地址</td><td><input disabled name='macAddress' type='text'  class='input_large' value='"+entry.macAddress+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>账户名称</td><td><input name='accountName' type='text'  class='input_large' value='"+entry.accountName+"'/></td></tr>";
				      				table3Item+="<tr> <td class='lableTd t_r'>用途</td><td><input name='usePlace' type='text'  class='input_large' value='"+entry.usePlace+"'/></td></td>";
				       				table3Item+="<td class='lableTd t_r'>业务类型</td><td><select name='applyBusinessType' style='width:160px;'> <option value=''>请选择</option> <option value='special'>互联网专用设备接入</option> <option value='mobile'>移动设备接入互联网区（限集团员工申请选择）</option><option value='temp'>临时接入互联网区（必须写明开始使用日期和结束使用日期）</option>"; 
				       				table3Item+="<option value='manage'>无线接入管理网区（仅限特殊需求）</option></select></td></tr><tr><td class='lableTd t_r'>办理日期</td><td><input name='implementTime' type='text'  class='input_large' value='"+entry.implementTime+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>办理人</td><td><input name='implementEngineer' type='text'  class='input_large' value='"+entry.implementEngineer+"'/></td></tr>";
				       				table3Item+="<tr><td class='lableTd t_r'>用户</td><td><input name='implementUser' type='text'  class='input_large' value='"+entry.implementUser+"'/></td></tr>";
				       				table3Item+=" <tr> <td class='lableTd t_r' rowspan='2'>开通情况</td> <td rowspan='3' colspan='3'><textarea name='remarks' style='3px' rows='4' cols='3' >"+entry.remarks+"</textarea></td></tr>";
				       				$("#table3").append(table3Item);
				       				$("[name=equipmentType]").val(entry.equipmentType);
				       				$("[name=applyBusinessType]").val(entry.applyBusinessType);
				       				$("[name=usePosition]").val(entry.usePosition);
				       				
				       				$("#div1").html("");
				       				tableItem="<input type='submit' value='保 存' onclick='javascript:save("+entry.id+");'/>";
				     				$("#div1").append(tableItem);
				       				
								}
							}
						}
					});
		   		};
	
	
	
	$.delById = function(firUrl,id){
		if(firUrl!="")
		   {	
				 $.ajax({
					    url : firUrl+"/basicCrud/wirelessResourceBook/del/"+id,
						type : 'post',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
									alert("删除成功");
									location.reload(true);
								}
							}
							
							}
						});
		   }	
	};
	
	
	$.getOtherData = function(){
		 var otherData="";  
		 if($.getline()!="")
			 {
			 otherData+= "&line="+$.getline();
			 }
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
 	    	 return otherData;   
	};
	
	$.postsave = function(Url,formName,otherData){
		var _data=$("#"+formName).serialize();
//        return false;
		if(Url!="")
		   {					
				 $.ajax({
					    url : Url+"/basicCrud/wirelessResourceBook/save",
						type : 'post',
						data:_data+otherData,
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
								
									window.close();
									location.href = Url+"/wirelessResourceBook/wirelessAccounting";
									
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
		
	};
	
	
	
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
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
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
	  };
		
	$.isleader = function(firUrl){
		var _isleader="不是领导";
		
		if(firUrl!="")
		   {
		 $.ajax({
			    async: false,
			    url : firUrl+"/ca/getCurrentLoginInfo",
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
						{
						   
						   if(data.cookies.loginName=="G010070003832549"){
							   _isleader="信息管理中心方政";
							   }else if(data.cookies.deptId=="2925"){
								   _isleader="维保部门";
							   }
						   
						   else if(data.leaders!="")
							{
								for ( var sitem in data.deptLeaders) 
							   {
									if(data.cookies.loginName==sitem) 
									{	
										    
											   _isleader="本部门领导";
										   
										}
									   }
									}
								}
							}
						}
					});
			    }
				return _isleader;
			  };
	
	$.yanzhen = function(){
		var _return="";
		
	   if($("[name=userName]").val()==""||$("[name=userName]").val()==null)	
		{
		_return+="\r\n使用人姓名不能为空";
		}
	   if($("[name=usePlace]").val().length>50)	
		{
	   if($("[name=usePlace]").val()==""||$("[name=usePlace]").val()==null)	
		{
		_return+="\r\n业务需求/权限不能为空";
		}
	   else
		   {
		   _return+="\r\n业务需求/权限不能超过50个字";
		   }
		
		}
	   if($("[name=applyUseTime]").val()==""||$("[name=applyUseTime]").val()==null)	
		{
		_return+="\r\n申请使用时间不能为空";
		}
	   if($("[name=applyType] option:selected").val()==""||$("[name=applyType] option:selected").val()==null)	
		{
		_return+="\r\n申请/注销不能为空";
		}
	   if($("[name=applyBusinessType] option:selected").val()==""||$("[name=applyBusinessType] option:selected").val()==null)	
		{
		_return+="\r\n业务申请类型不能为空";
		}
	    var a=/^\d{11}$/;
	    var t1=$("[name=contactPhone]").val();
	   if(!a.test(t1)){
	   if($("[name=contactPhone]").val()==""||$("[name=contactPhone]").val()==null)	
		{
		   _return+="\r\n联系电话不能为空";
		}
	   _return+="\r\n请输入正确的联系电话，如：6487256，15005059587";
	   }

	   if($("[name=applyReason]").val().length<5||$("[name=applyReason]").val().length>500)
		   {
		   if($("[name=applyReason]").val()==""||$("[name=applyReason]").val()==null)	
			{
			 _return+="\r\n业务申请原因不能为空";
			}
		   else
			{
		   _return+="\r\n业务申请原因字数必须在5~500之间";
			}
		   }
	   
	   
	  
	   if($("[name=applyer]").val()==""||$("[name=applyer]").val()==null)	
		{
		_return+="\r\n申报人不能为空";
		}
	   
	   if($("[name=applyTime]").val()==""||$("[name=applyTime]").val()==null)	
		{
		_return+="\r\n填报时间不能为空";
		}
	   if($("[name=handler] option:selected").val()==""||$("[name=handler] option:selected").val()==null)
	   {
			_return+="\r\n必须选择一个审核领导";
	   }
	  
	   
	  return _return;
	};
	
	$.yanzhen2 = function(){
		var _return="";
		if($("[name=implementEngineer]").val()==""||$("[name=implementEngineer]").val()==null){
			_return+="\r\n办理工程师不能为空";
		}
		if($("[name=implementTime]").val()==""||$("[name=implementTime]").val()==null){
			_return+="\r\n办理时间不能为空";
		}
		if($("[name=macAddress]").val()==""||$("[name=macAddress]").val()==null){
			_return+="\r\nMAC地址不能为空";
		}
		
	return _return;	
	};
	
	
	$.getListDetail = function(firUrl){
		
		
		if(firUrl!="")
		   {
		 $.ajax({
			    async: false,
			    url : firUrl+"/ca/getCurrentLoginInfo",
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
						{
								$("[name=applyer]").val(data.cookies.userName);
								$("#deptName").val(data.cookies.deptName);
								$("[name=applyDept]").val(data.cookies.deptName);
								$("[name=applyDeptId]").val(data.cookies.deptId);
								$("[name=applyerLoginname]").val(data.cookies.loginName);
								$("[name=initiator]").val(data.cookies.userName);
								$("[name=initiatorLoginname]").val(data.cookies.loginName);
								var selectItem="<option value=''>请选择</option>";
								for(var key in data.deptLeaders){
									selectItem+="<option value='"+key+"'>"+data.deptLeaders[key]+"</option>";
								}
								$("[name=handler]").append(selectItem);
								
						}
					}
				}
					
			});
	    }
		
	  
		 };
		   
	$.getExport= function(firUrl,_data){
		
		if(firUrl!="")
		   {
		
		 $.ajax({
			    async: false,
			    url  : firUrl+"/basicCrud/wirelessResourceBook/iimsExcel",
				type : 'Get',
				datatype:'json',
				data :"excelContent="+_data,
				success: function(data, status, xhr) {
				
				}
			});
			
	    }
		
	  };
	
	$.getMenu= function(firUrl){
		
		if(firUrl!="")
		   {		
		 $.ajax({
			    async: false,
			    url  : firUrl+"/basicCrud/wirelessResourceBook/getEntityProperty",
				type : 'post',
				datatype:'json',
				success: function(data, status, xhr) {
					if (data.success == true&&data.result.fieldProperties &&JSON.stringify(data.result.fieldProperties) != "[]") 
					{
						$.each(data.result.fieldProperties,function(entryIndex,entry) 
								{
								if(entry.operate=="select")
									{
									if(entry.path=="resourceRequirement")
										{
										$.analyzeSelMenu("myresourceRequirement",entry.option);
										return true;
										}
									
									$.analyzeSelMenu(entry.path,entry.option);	
									}	
						});
					}
				}
			});
			
	    }
		
	  };
	
	$.analyzeSelMenu= function(dataname,_obj)
	{
		for ( var sitem in _obj) 
		{
		if($("[name="+dataname+"]").length > 0 )
			{
			$("[name="+dataname+"]").append("<option value='"+sitem+"'>"+_obj[sitem]+"</option>"); 
			}
		}
	};
	
	
		
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
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
						{
								   if(data.cookies.loginName=="G010070003832549") 
									{	
									   _isleader=true;

									}
						}
					}
				}
			});
	    }
		return _isleader;
	  };	
	
	
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
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
						{
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
	  };	
	
	
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
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
						{
						   _isleader="&initiator="+data.cookies.userName+"&initiatorLoginname="+data.cookies.loginName;
						   
						   
						}
					}
				}
			});
	    }
		return _isleader;
	  };	
	
	
	$.getSuggestInDept = function(firUrl,_id){
		if(firUrl!="")
		   {
		 $.ajax({
			    async: false,
			    url : firUrl+"/basicCrud/workflowLog/all?ptype=wirelessResource&pid="+_id,
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
					   if (data.result&&JSON.stringify(data.result) != "[]") 	
						{
						   $.each(data.result,function(entryIndex,entry) 
						    {
							   var _str="";
							   //alert(entry.status);
							   switch(entry.status)
	       						{
	       						case "待信息中心审核":
	       							_str="<div class=\"node\"><b class=\"fl\">本部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>"+$("[name=applyDept]").val()+"部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						
	       						break;
	       						case "退回":
	       							
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息中心部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	    	       					
	       								break;
	       							
	       							
	       						case "自行处理":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息中心部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">方政<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						
	       						break;
	       						case "待维保公司审核":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>信息中心部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">方政<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						
	       						break;
	       						
	       						case "待实施":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>维保部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						
	       						break;
	       						case "维保公司退回":
	       							_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>维保部门领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						
	       						break;
	       						
	       						case "处理完毕":
	       						_str="<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
       							_str+="<i>实施公司领导</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
       						
       						break;
	       						case "内部退回":
		       						_str="<div class=\"node\"><b class=\"fl\">本部门意见</b><div class=\"clear\"></div><div class=\"con\">";
	       							_str+="<i>"+$("[name=applyDept]").val()+"</i><div><p>"+entry.suggestion+"</p></div><div class=\"t_r\">"+entry.initiator+"<span class=\"date_02 mr5\">"+entry.initiateTime+"</span></div></div></div>";
	       						
	       						break;
	       						
	       						
	       						

	       						}
							   
							   $("#leaderSuggest tbody tr td").append(_str);
							});
						}
					}
				}
			});
	    }
	
	  };
	
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
					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
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
	  };
	
	$.isInnerReview = function(firUrl){
		var paging="";
		if(firUrl!="")
		   {
		 $.ajax({
			    async: false,
			    url : firUrl+"/ca/getCurrentLoginInfo",
				type : 'post',
				success: function(data, status, xhr) {
					if (status == "success" && data != null)
					{ 
						if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
						{
							paging+="&handler="+data.cookies.loginName;
						}
						
					   }
					}
		 		});
		   }
		return paging;
		};
		
		$.getline = function(){
			 var s='';  
	  	     var cbline=$(".line:checked");
	  	     
	  	      for(var i=0; i<cbline.length; i++){    
	  	    	 s+=cbline[i].value+',';  //如果选中，将value添加到变量s中    
	  	      }
	  	      
	  	    s=s.substring(0,s.length-1);
	  	    	 return s
	  	   
		};
		
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
	 	   
		};
	};			
		   
	
	
	