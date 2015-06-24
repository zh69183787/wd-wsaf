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

$.setBtnResource = function(firUrl){
	 $(".topage").click(function(){
 		$.postSearchFormResource(firUrl,"&pageSize=16&pageNum="+$(this).text());
 		
		});
	   
    $(".prepage").click(function(){
 	 var nowpage=parseInt($("#page>.selected a").text());

 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.postSearchFormResource(firUrl,"&pageSize=16&pageNum="+topage);
 		 }
		}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($("#page>.selected a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchFormResource(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
   
   $("#oututBtn").click(function(){
 	
	   var content =$("#projectAppform").serialize()+"&sort=id desc";
	   window.location.href=firUrl+"/basicCrud/netResourceBook/export2Excel?"+content+"&type=netResourceBook&status_in=finish";

   }); 
   
   $("#gopagebtn").click(function(){
 	  var topage=parseInt($("#gopage").val());
   
     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
 		 {
 		$.postSearchFormResource(firUrl,"&pageSize=16&pageNum="+topage);
 		 }
     	 else
     		 {
     		 alert("超出索引值");
     		 }
			});  
};

$.setBtnAccount = function(firUrl){
	 $(".topage").click(function(){
		$.postSearchFormAccount(firUrl,"&pageSize=16&pageNum="+$(this).text());
		
		});
	   
   $(".prepage").click(function(){
	 var nowpage=parseInt($("#page>.selected a").text());

	 if(nowpage>1)
		 {
		 var topage=nowpage-1;
		$.postSearchFormAccount(firUrl,"&pageSize=16&pageNum="+topage);
		 }
		}); 
 
  $(".nextpage").click(function(){
	 var nextpage=parseInt($("#page>.selected a").text())+1;

	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchFormAccount(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
  
  $("#oututBtn").click(function(){
	
	   var content =$("#projectAppform").serialize()+"&sort=id desc";
	   window.location.href=firUrl+"/basicCrud/accountResourceBook/export2Excel?"+content+"&type=accountResourceBook&status_in=finish";

  });
};
  
  $.setBtnInternet = function(firUrl){
		 $(".topage").click(function(){
			$.postSearchFormInternet(firUrl,"&pageSize=16&pageNum="+$(this).text());
			
			});
		   
	   $(".prepage").click(function(){
		 var nowpage=parseInt($("#page>.selected a").text());

		 if(nowpage>1)
			 {
			 var topage=nowpage-1;
			$.postSearchFormInternet(firUrl,"&pageSize=16&pageNum="+topage);
			 }
			}); 
	 
	  $(".nextpage").click(function(){
		 var nextpage=parseInt($("#page>.selected a").text())+1;

		 if(nextpage<=parseInt($("#gopage").attr("max")))
			   $.postSearchFormInternet(firUrl,"&pageSize=16&pageNum="+nextpage);

			}); 
	  
	  $("#oututBtn").click(function(){
		
		   var content =$("#projectAppform").serialize()+"&sort=id desc";
		   window.location.href=firUrl+"/basicCrud/internetResourceBook/export2Excel?"+content+"&type=internetResourceBook&status_in=finish";

	  }); 
  
  
  $("#gopagebtn").click(function(){
	  var topage=parseInt($("#gopage").val());
  
    	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
		 {
		$.postSearchFormInternet(firUrl,"&pageSize=16&pageNum="+topage);
		 }
    	 else
    		 {
    		 alert("超出索引值");
    		 }
			});  
};

$.setBtnVpn = function(firUrl){
	 $(".topage").click(function(){
		$.postSearchFormVpn(firUrl,"&pageSize=16&pageNum="+$(this).text());
		
		});
	   
  $(".prepage").click(function(){
	 var nowpage=parseInt($("#page>.selected a").text());

	 if(nowpage>1)
		 {
		 var topage=nowpage-1;
		$.postSearchFormVpn(firUrl,"&pageSize=16&pageNum="+topage);
		 }
		}); 

 $(".nextpage").click(function(){
	 var nextpage=parseInt($("#page>.selected a").text())+1;

	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchFormVpn(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
 
 $("#oututBtn").click(function(){
	
	   var content =$("#projectAppform").serialize()+"&sort=id desc";
	   window.location.href=firUrl+"/basicCrud/vpnResourceBook/export2Excel?"+content+"&type=vpnResourceBook&status_in=finish";

 }); 


$("#gopagebtn").click(function(){
 var topage=parseInt($("#gopage").val());

	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
	 {
	$.postSearchFormVpn(firUrl,"&pageSize=16&pageNum="+topage);
	 }
	 else
		 {
		 alert("超出索引值");
		 }
		});  
};


$.setBtnVirtual = function(firUrl){
	 $(".topage").click(function(){
		$.postSearchFormVirtual(firUrl,"&pageSize=16&pageNum="+$(this).text());
		
		});
	   
   $(".prepage").click(function(){
	 var nowpage=parseInt($("#page>.selected a").text());

	 if(nowpage>1)
		 {
		 var topage=nowpage-1;
		$.postSearchFormVirtual(firUrl,"&pageSize=16&pageNum="+topage);
		 }
		}); 
 
  $(".nextpage").click(function(){
	 var nextpage=parseInt($("#page>.selected a").text())+1;

	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchFormVirtual(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
  
  $("#oututBtn").click(function(){
	
	   var content =$("#projectAppform").serialize()+"&sort=id desc";
	   window.location.href=firUrl+"/basicCrud/virtualResourceBook/export2Excel?"+content+"&type=virtualResourceBook&status_in=finish";

  }); 
  
  $("#gopagebtn").click(function(){
	  var topage=parseInt($("#gopage").val());
  
    	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
		 {
		$.postSearchFormVirtual(firUrl,"&pageSize=16&pageNum="+topage);
		 }
    	 else
    		 {
    		 alert("超出索引值");
    		 }
			});  
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
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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



$.postSearchFormResource = function(firUrl,paging){
	
	 paging+="&status_in=finish";
	 paging+="&sort=id desc";
	 if(firUrl!="")
	   {	
		 $.ajax({
				  async: false,
				    url : firUrl+"/basicCrud/netResourceBook/page",
					type : 'post',
					data: $("#projectAppform").serialize()+paging,
					success: function(data, status, xhr) {
						
						$.analyzeTableDataResource(data, status, xhr,firUrl);
						$.setBtnResource(firUrl);
						  
			           }, 
			           error: function() {
			              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
			           }
					});
	          }
     };
     
     
   //解析Table
     $.analyzeTableDataResource = function(data, status, xhr,firUrl)
     {
     	if (status == "success" && data != null)
     	{
     		$("tr.tableItem").remove();
     		
     		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
     		{
     			$("tr.tableItem").remove();
     			var tableItem="";
     			$.each(data.result.content,function(entryIndex,entry) 
     			{
     				   //To:do
     				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"></td>";
     				tableItem+="<td>"+entry.applyDept+"</td><td>"+entry.userName+"</td><td>"+entry.contactPhone+"</td><td>"+entry.ip+"</td><td>"+entry.mac+"</td><td>";
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
     
     $.findByIdResource = function(firUrl,id){
		 if(firUrl!="")
		   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/basicCrud/netResourceBook/get/"+id,
						type : 'post',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
								{
									var entry=data.result;
									var applyBusinessTypeChina="",netStatusChina="",equipmentTypeChina="";
									var table2Item="",table3Item="";
									switch(entry.applyBusinessType)
			     					{
			     					case "addLocal":
										applyBusinessTypeChina = "新增本地管理网信息点";
										break;
									case "addCrossLine":
										applyBusinessTypeChina = "新增跨线管理网信息点";
										break;
									case "addCrossNet":
										applyBusinessTypeChina = "新增跨网络信息点";
										break;
									case "addInternet":
										applyBusinessTypeChina = "新增互联网信息点";
										break;
									case "other":
										applyBusinessTypeChina = "其它";
										break;
			     					default :"";
			     						applyBusinessType="";
			     					}
									switch(entry.netStatus)
			     					{
			     					case "up":
			     						netStatusChina = "UP";
										break;
									case "down":
										netStatusChina = "DOWN";
										break;
			     					default :"";
			     						netStatusChina="";
			     					}
									
			     					switch(entry.equipmentType)
			     					{
			     					case "desktop":
			     						equipmentTypeChina="台式机";
			     						break;
			     					case "mobileDevice":
			     						equipmentTypeChina="移动设备";
			     						break;
			     					case "specialDevice":
			     						equipmentTypeChina="专用设备";
			     						break;
			     					case "other":
			     						equipmentTypeChina="其它";
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
				     				table2Item="<tr><td class='lableTd t_r'>部门</td><td>"+entry.applyDept+"</td><td class='lableTd t_r'>使用人姓名</td><td>"+entry.userName+"</td></tr>";
				       				table2Item+="<tr><td class='lableTd t_r'>联系电话</td><td>"+entry.contactPhone+"</td><td class='lableTd t_r'>职务</td><td>"+entry.post+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>交换机设备编号</td><td>"+entry.switchDeviceCode+"</td><td class='lableTd t_r'>终端类型</td><td>"+equipmentTypeChina+"</td></tr>";
				                    
				                    table2Item+="<tr><td class='lableTd t_r'>端口</td><td>"+entry.port+"</td><td class='lableTd t_r'>VLAN</td><td>"+entry.vlan+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>业务状态</td><td>"+netStatusChina+"</td><td class='lableTd t_r'>接口信息</td><td>"+entry.interfaceInfo+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>IP地址/掩码</td><td>"+entry.ip+"</td><td class='lableTd t_r'>网关</td><td>"+entry.gateway+"</td></tr>";
				                    
				                    table2Item+="<tr><td class='lableTd t_r'>mac地址</td><td>"+entry.mac+"</td><td class='lableTd t_r'>系统名称</td><td>"+entry.sysName+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>用途</td><td>"+entry.usePlace+"</td><td class='lableTd t_r'>业务类型</td><td>"+applyBusinessTypeChina+"</td></tr>";
				                    table2Item+="<tr><td class='lableTd t_r'>办理日期</td> <td>"+entry.implementTime+"</td><td class='lableTd t_r'>办理人</td><td>"+entry.implementEngineer+"</td> </tr><tr>";
				                    table2Item+="<td class='lableTd t_r' rowspan='2'>开通情况</td><td rowspan='3' colspan='3'>"+entry.remarks+"</td></tr>";
				       				$("#table2").append(table2Item);
				       				
				       				
				       				
				       				$("#tb2").html("");
				       				table3Item= "<tr><td class='lableTd t_r'>部门</td><td><input name='applyDept' type='text' class='input_large' value='"+entry.applyDept+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>使用人姓名</td><td><input name='userName' type='text'  class='input_large' value='"+entry.userName+"'/></td></tr>";
				       				table3Item+="<tr><td class='lableTd t_r'>联系电话</td><td><input name='contactPhone' type='text'  class='input_large' value='"+entry.contactPhone+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>职务</td><td><input name='post' type='text'  class='input_large' value='"+entry.post+"'/></td></tr>";
				       				table3Item+="<tr><td class='lableTd t_r'>交换机设备编号</td><td><input name='switchDeviceCode' type='text'  class='input_large' value='"+entry.switchDeviceCode+"'/></td><td class='lableTd t_r'>终端类型</td>";
				       				table3Item+="<td><select name='equipmentType' style='width:160px;'> <option value=''>请选择</option> <option value='desktop'>台式机</option> <option value='mobileDevice'>移动设备</option><option value='specialDevice'>专用设备</option>"; 
				       				table3Item+="<option value='other'>其它</option></select></td></tr>";
				       				
				       				table3Item+= "<tr><td class='lableTd t_r'>端口</td><td><input name='port' type='text' class='input_large' value='"+entry.port+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>VLAN</td><td><input name='vlan' type='text'  class='input_large' value='"+entry.vlan+"'/></td></tr>";
				       				
				       				table3Item+="<tr><td class='lableTd t_r'>接口信息</td><td><input name='interfaceInfo' type='text'  class='input_large' value='"+entry.interfaceInfo+"'/></td><td class='lableTd t_r'>业务状态</td>";
				       				table3Item+="<td><select name='netStatus' style='width:160px;'> <option value=''>请选择</option> <option value='up'>UP</option> <option value='down'>DOWN</option></select></td></tr>";
				       				
				       				table3Item+= "<tr><td class='lableTd t_r'>IP地址/掩码</td><td><input name='ip' type='text' class='input_large' value='"+entry.ip+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>网关</td><td><input name='gateway' type='text'  class='input_large' value='"+entry.gateway+"'/></td></tr>";

				       				
				       				table3Item+="<tr><td class='lableTd t_r'>mac地址</td><td><input disabled name='mac' type='text'  class='input_large' value='"+entry.mac+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>系统名称</td><td><input name='sysName' type='text'  class='input_large' value='"+entry.sysName+"'/></td></tr>";
				      				table3Item+="<tr> <td class='lableTd t_r'>用途</td><td><input name='usePlace' type='text'  class='input_large' value='"+entry.usePlace+"'/></td></td>";
				       				table3Item+="<td class='lableTd t_r'>业务类型</td><td><select name='applyBusinessType' style='width:160px;'> <option value=''>请选择</option> <option value='addLocal'>新增本地管理网信息点</option> <option value='addCrossLine'>新增跨线管理网信息点</option><option value='addCrossNet'>新增跨网络信息点</option>"; 
				       				table3Item+="<option value='addInternet'>新增互联网信息点</option><option value='other'>其他</option></select></td></tr><tr><td class='lableTd t_r'>办理日期</td><td><input name='implementTime' type='text'  class='input_large' value='"+entry.implementTime+"'/></td>";
				       				table3Item+="<td class='lableTd t_r'>办理人</td><td><input name='implementEngineer' type='text'  class='input_large' value='"+entry.implementEngineer+"'/></td></tr>";
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
     };
	
	
	$.delByIdResource = function(firUrl,id){
		if(firUrl!="")
		   {	
				 $.ajax({
					    url : firUrl+"/basicCrud/netResourceBook/del/"+id,
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
	
	$.postsaveResource = function(Url,formName,otherData){
		var _data=$("#"+formName).serialize();
//        return false;
		if(Url!="")
		   {					
				 $.ajax({
					    url : Url+"/basicCrud/netResourceBook/save",
						type : 'post',
						data:_data+otherData,
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
								
									window.close();
									location.href = Url+"/netResourceBook/netAccounting";
									
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
	
	
	
	
	$.postSearchFormAccount = function(firUrl,paging){
		
		 paging+="&status_in=finish";
		 paging+="&sort=id desc";
		 if(firUrl!="")
		   {	
			 $.ajax({
					  async: false,
					    url : firUrl+"/basicCrud/accountResourceBook/page",
						type : 'post',
						data: $("#projectAppform").serialize()+paging,
						success: function(data, status, xhr) {
							
							$.analyzeTableDataAccount(data, status, xhr,firUrl);
							$.setBtnAccount(firUrl);
							  
				           }, 
				           error: function() {
				              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
				           }
						});
		          }
	     };
	     
	     
	   //解析Table
	     $.analyzeTableDataAccount = function(data, status, xhr,firUrl)
	     {
	     	if (status == "success" && data != null)
	     	{
	     		$("tr.tableItem").remove();
	     		
	     		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
	     		{
	     			$("tr.tableItem").remove();
	     			var tableItem="";
	     			var postChina="";
	     			$.each(data.result.content,function(entryIndex,entry) 
	     			{
	     				   //To:do
	     				switch(entry.post)
     					{
     					case "principal":
     						postChina = "部门正职（主持工作）";
							break;
						case "deputy":
							postChina = "部门副职";
							break;
						case "staff":
							postChina = "科员";
							break;
     					default :"";
     						postChina="";
     					}
	     				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"></td>";
	     				tableItem+="<td>"+entry.applyDept+"</td><td>"+entry.userName+"</td><td>"+entry.contactPhone+"</td><td>"+postChina+"</td><td>"+entry.loginName+"</td><td>";
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
	     
	     $.findByIdAccount = function(firUrl,id){
			 if(firUrl!="")
			   {	
					 $.ajax({
						   async: false,
						    url : firUrl+"/basicCrud/accountResourceBook/get/"+id,
							type : 'post',
							success: function(data, status, xhr) {
								if (status == "success" && data != null)
								{
									if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
									{
										var entry=data.result;
										var applyBusinessTypeChina="",postChina="";
										var table2Item="",table3Item="";
										switch(entry.applyBusinessType)
				     					{
				     					case "emailAccount":
											applyBusinessTypeChina = "企业邮箱账户";
											break;
										case "portalAccount":
											applyBusinessTypeChina = "协同平台账户";
											break;
										case "other":
											applyBusinessTypeChina = "其它";
											break;
				     					default :"";
				     						applyBusinessType="";
				     					}
										switch(entry.post)
				     					{
				     					case "principal":
				     						postChina = "部门正职（主持工作）";
											break;
										case "deputy":
											postChina = "部门副职";
											break;
										case "staff":
											postChina = "科员";
											break;
				     					default :"";
				     						postChina="";
				     					}
										
				     					switch(entry.equipmentType)
				     					{
				     					case "desktop":
				     						equipmentTypeChina="台式机";
				     						break;
				     					case "mobileDevice":
				     						equipmentTypeChina="移动设备";
				     						break;
				     					case "specialDevice":
				     						equipmentTypeChina="专用设备";
				     						break;
				     					case "other":
				     						equipmentTypeChina="其它";
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
					     				table2Item="<tr><td class='lableTd t_r'>部门</td><td>"+entry.applyDept+"</td><td class='lableTd t_r'>使用人姓名</td><td>"+entry.userName+"</td></tr>";
					       				table2Item+="<tr><td class='lableTd t_r'>联系电话</td><td>"+entry.contactPhone+"</td><td class='lableTd t_r'>职务</td><td>"+postChina+"</td></tr>";
					                    table2Item+="<tr><td class='lableTd t_r'>员工工号</td><td>"+entry.loginName+"</td><td class='lableTd t_r'>业务类型</td><td>"+applyBusinessTypeChina+"</td></tr>";
					                    
					                    table2Item+="<tr><td class='lableTd t_r'>业务申请原因</td><td>"+entry.applyReason+"</td><td class='lableTd t_r'>开通位置</td><td>"+entry.place+"</td></tr>";
					                   
					                    table2Item+="<tr><td class='lableTd t_r'>办理日期</td> <td>"+entry.implementTime+"</td><td class='lableTd t_r'>办理人</td><td>"+entry.implementEngineer+"</td> </tr><tr>";
					                    table2Item+="<td class='lableTd t_r' rowspan='2'>开通情况</td><td rowspan='3' colspan='3'>"+entry.remarks+"</td></tr>";
					       				$("#table2").append(table2Item);
					       				
					       				
					       				
					       				$("#tb2").html("");
					       				table3Item= "<tr><td class='lableTd t_r'>部门</td><td><input name='applyDept' type='text' class='input_large' value='"+entry.applyDept+"'/></td>";
					       				table3Item+="<td class='lableTd t_r'>使用人姓名</td><td><input name='userName' type='text'  class='input_large' value='"+entry.userName+"'/></td></tr>";
					       				table3Item+="<tr><td class='lableTd t_r'>联系电话</td><td><input name='contactPhone' type='text'  class='input_large' value='"+entry.contactPhone+"'/></td>";
					       				table3Item+="<td class='lableTd t_r'>职务</td><td><select name='post' style='width:160px;'> <option value=''>请选择</option> <option value='principal'>部门正职（主持工作）</option> <option value='deputy'>部门副职</option><option value='staff'>科员</option></select></td></tr>";
					       				table3Item+="<tr><td class='lableTd t_r'>员工工号</td><td><input name='loginName' type='text'  class='input_large' value='"+entry.loginName+"'/></td><td class='lableTd t_r'>业务类型</td>";
					       				table3Item+="<td><select name='applyBusinessType' style='width:160px;'> <option value=''>请选择</option> <option value='emailAccount'>企业邮箱账户</option> <option value='portalAccount'>协同平台账户</option>"; 
					       				table3Item+="<option value='other'>其它</option></select></td></tr>";
					       				
					       				table3Item+= "<tr><td class='lableTd t_r'>业务申请原因</td><td><input name='applyReason' type='text' class='input_large' value='"+entry.applyReason+"'/></td>";
					       				table3Item+="<td class='lableTd t_r'>开通位置</td><td><input name='place' type='text'  class='input_large' value='"+entry.place+"'/></td></tr>";
					       				

					       				table3Item+="<tr><td class='lableTd t_r'>办理日期</td><td><input name='implementTime' type='text'  class='input_large' value='"+entry.implementTime+"'/></td>";
					       				table3Item+="<td class='lableTd t_r'>办理人</td><td><input name='implementEngineer' type='text'  class='input_large' value='"+entry.implementEngineer+"'/></td></tr>";
					       				table3Item+=" <tr> <td class='lableTd t_r' rowspan='2'>开通情况</td> <td rowspan='3' colspan='3'><textarea name='remarks' style='3px' rows='4' cols='3' >"+entry.remarks+"</textarea></td></tr>";
					       				$("#table3").append(table3Item);
					       				$("[name=post]").val(entry.post);
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
	     };
		
		
		$.delByIdAccount = function(firUrl,id){
			if(firUrl!="")
			   {	
					 $.ajax({
						    url : firUrl+"/basicCrud/accountResourceBook/del/"+id,
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
		
		$.postsaveAccount = function(Url,formName,otherData){
			var _data=$("#"+formName).serialize();
//	        return false;
			if(Url!="")
			   {					
					 $.ajax({
						    url : Url+"/basicCrud/accountResourceBook/save",
							type : 'post',
							data:_data+otherData,
							success: function(data, status, xhr) {
								if (status == "success" && data != null)
								{
									if (data.success == true) 
									{
									
										window.close();
										location.href = Url+"/accountResourceBook/accountAccounting";
										
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
		
		$.postSearchFormInternet = function(firUrl,paging){
			
			 paging+="&status_in=finish";
			 paging+="&sort=id desc";
			 if(firUrl!="")
			   {	
				 $.ajax({
						  async: false,
						    url : firUrl+"/basicCrud/internetResourceBook/page",
							type : 'post',
							data: $("#projectAppform").serialize()+paging,
							success: function(data, status, xhr) {
								
								$.analyzeTableDataInternet(data, status, xhr,firUrl);
								$.setBtnInternet(firUrl);
								  
					           }, 
					           error: function() {
					              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
					           }
							});
			          }
		     };
		     
		     
		   //解析Table
		     $.analyzeTableDataInternet = function(data, status, xhr,firUrl)
		     {
		     	if (status == "success" && data != null)
		     	{
		     		$("tr.tableItem").remove();
		     		
		     		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
		     		{
		     			$("tr.tableItem").remove();
		     			var tableItem="";
		     			var applyBusinessTypeChina="";
		     			
		     			$.each(data.result.content,function(entryIndex,entry) 
		     			{
		     				   //To:do
		     				switch(entry.applyBusinessType)
	     					{
	     					case "groupInternet":
	     						applyBusinessTypeChina = "集团互联网业务（仅访问官方网站、企业邮箱，默认选项）";
								break;
							case "commonInternet":
								applyBusinessTypeChina = "访问常用互联网资源（必须描述清楚访问用途和方式）";
								break;
							case "specialInternet":
								applyBusinessTypeChina = "访问特殊互联网资源（有特殊应用需求才可申请）";
								break;
							case "other":
								applyBusinessTypeChina = "其他";
								break;
	     					default :"";
	     						applyBusinessTypeChina="";
	     					}
		     				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"></td>";
		     				tableItem+="<td>"+entry.applyDept+"</td><td>"+entry.userName+"</td><td>"+entry.contactPhone+"</td><td>"+applyBusinessTypeChina+"</td><td>"+entry.implementPlace+"</td><td>";
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
		     
		     $.findByIdInternet = function(firUrl,id){
				 if(firUrl!="")
				   {	
						 $.ajax({
							   async: false,
							    url : firUrl+"/basicCrud/internetResourceBook/get/"+id,
								type : 'post',
								success: function(data, status, xhr) {
									if (status == "success" && data != null)
									{
										if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
										{
											var entry=data.result;
											var applyBusinessTypeChina="";
											var table2Item="",table3Item="";
											switch(entry.applyBusinessType)
					     					{
					     					case "groupInternet":
												applyBusinessTypeChina = "集团互联网业务（仅访问官方网站、企业邮箱，默认选项）";
												break;
											case "commonInternet":
												applyBusinessTypeChina = "访问常用互联网资源（必须描述清楚访问用途和方式）";
												break;
											case "specialInternet":
												applyBusinessTypeChina = "访问特殊互联网资源（有特殊应用需求才可申请）";
												break;
											case "other":
												applyBusinessTypeChina = "其它";
												break;
					     					default :"";
					     						applyBusinessType="";
					     					}
											switch(entry.post)
					     					{
					     					case "principal":
					     						postChina = "部门正职（主持工作）";
												break;
											case "deputy":
												postChina = "部门副职";
												break;
											case "staff":
												postChina = "科员";
												break;
					     					default :"";
					     						postChina="";
					     					}
											
					     					switch(entry.equipmentType)
					     					{
					     					case "desktop":
					     						equipmentTypeChina="台式机";
					     						break;
					     					case "mobileDevice":
					     						equipmentTypeChina="移动设备";
					     						break;
					     					case "specialDevice":
					     						equipmentTypeChina="专用设备";
					     						break;
					     					case "other":
					     						equipmentTypeChina="其它";
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
						     				table2Item="<tr><td class='lableTd t_r'>部门</td><td>"+entry.applyDept+"</td><td class='lableTd t_r'>使用人姓名</td><td>"+entry.userName+"</td></tr>";
						       				table2Item+="<tr><td class='lableTd t_r'>联系电话</td><td>"+entry.contactPhone+"</td><td class='lableTd t_r'>职务</td><td>"+entry.post+"</td></tr>";
						                    table2Item+="<tr><td class='lableTd t_r'>申请业务类型</td><td>"+applyBusinessTypeChina+"</td><td class='lableTd t_r'>申请使用日期</td><td>"+entry.applyUseTime+"</td></tr>";
						                    
						                    table2Item+="<tr><td class='lableTd t_r'>业务申请原因</td><td>"+entry.applyReason+"</td><td class='lableTd t_r'>开通位置</td><td>"+entry.usePlace+"</td></tr>";
						                   
						                    table2Item+="<tr><td class='lableTd t_r'>办理日期</td> <td>"+entry.implementTime+"</td><td class='lableTd t_r'>办理人</td><td>"+entry.implementEngineer+"</td> </tr><tr>";
						                    table2Item+="<td class='lableTd t_r' rowspan='2'>开通情况</td><td rowspan='3' colspan='3'>"+entry.remarks+"</td></tr>";
						       				$("#table2").append(table2Item);
						       				
						       				
						       				
						       				$("#tb2").html("");
						       				table3Item= "<tr><td class='lableTd t_r'>部门</td><td><input name='applyDept' type='text' class='input_large' value='"+entry.applyDept+"'/></td>";
						       				table3Item+="<td class='lableTd t_r'>使用人姓名</td><td><input name='userName' type='text'  class='input_large' value='"+entry.userName+"'/></td></tr>";
						       				table3Item+="<tr><td class='lableTd t_r'>联系电话</td><td><input name='contactPhone' type='text'  class='input_large' value='"+entry.contactPhone+"'/></td>";
						       				table3Item+="<td class='lableTd t_r'>职务</td><td><input name='post' type='text'  class='input_large' value='"+entry.post+"'/></td></tr>";
						       				table3Item+="<tr><td class='lableTd t_r'>申请业务类型</td>";
						       				table3Item+="<td><select name='applyBusinessType' style='width:160px;'> <option value=''>请选择</option> <option value='groupInternet'>集团互联网业务（仅访问官方网站、企业邮箱，默认选项）</option> <option value='commonInternet'>访问常用互联网资源（必须描述清楚访问用途和方式）</option>"; 
						       				table3Item+="<option value='specialInternet'>访问特殊互联网资源（有特殊应用需求才可申请）</option><option value='other'>其它</option></select></td>";
						       				
						       				table3Item+="<td class='lableTd t_r'>申请使用日期</td><td><input name='applyUseTime' type='text'  class='input_large' value='"+entry.applyUseTime+"'/></td></tr>";
						       				
						       				table3Item+= "<tr><td class='lableTd t_r'>业务申请原因</td><td><input name='applyReason' type='text' class='input_large' value='"+entry.applyReason+"'/></td>";
						       				table3Item+="<td class='lableTd t_r'>开通位置</td><td><input name='usePlace' type='text'  class='input_large' value='"+entry.usePlace+"'/></td></tr>";
						       				

						       				table3Item+="<tr><td class='lableTd t_r'>办理日期</td><td><input name='implementTime' type='text'  class='input_large' value='"+entry.implementTime+"'/></td>";
						       				table3Item+="<td class='lableTd t_r'>办理人</td><td><input name='implementEngineer' type='text'  class='input_large' value='"+entry.implementEngineer+"'/></td></tr>";
						       				table3Item+=" <tr> <td class='lableTd t_r' rowspan='2'>开通情况</td> <td rowspan='3' colspan='3'><textarea name='remarks' style='3px' rows='4' cols='3' >"+entry.remarks+"</textarea></td></tr>";
						       				$("#table3").append(table3Item);
						       				$("[name=applyBusinessType]").val(entry.applyBusinessType);
						       				$("#div1").html("");
						       				tableItem="<input type='submit' value='保 存' onclick='javascript:save("+entry.id+");'/>";
						     				$("#div1").append(tableItem);
						       				
										}
									}
								}
							});
				   		};
		     };
			
			
			$.delByIdInternet = function(firUrl,id){
				if(firUrl!="")
				   {	
						 $.ajax({
							    url : firUrl+"/basicCrud/internetResourceBook/del/"+id,
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
			
			$.postsaveInternet = function(Url,formName,otherData){
				var _data=$("#"+formName).serialize();
//		        return false;
				if(Url!="")
				   {					
						 $.ajax({
							    url : Url+"/basicCrud/internetResourceBook/save",
								type : 'post',
								data:_data+otherData,
								success: function(data, status, xhr) {
									if (status == "success" && data != null)
									{
										if (data.success == true) 
										{
										
											window.close();
											location.href = Url+"/internetResourceBook/internetAccounting";
											
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
			
			$.postSearchFormVpn = function(firUrl,paging){
				
				 paging+="&status_in=finish";
				 paging+="&sort=id desc";
				 if(firUrl!="")
				   {	
					 $.ajax({
							  async: false,
							    url : firUrl+"/basicCrud/vpnResourceBook/page",
								type : 'post',
								data: $("#projectAppform").serialize()+paging,
								success: function(data, status, xhr) {
									
									$.analyzeTableDataVpn(data, status, xhr,firUrl);
									$.setBtnVpn(firUrl);
									  
						           }, 
						           error: function() {
						              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
						           }
								});
				          }
			     };
			     
			     
			   //解析Table
			     $.analyzeTableDataVpn = function(data, status, xhr,firUrl)
			     {
			     	if (status == "success" && data != null)
			     	{
			     		$("tr.tableItem").remove();
			     		
			     		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
			     		{
			     			$("tr.tableItem").remove();
			     			var tableItem="";
			     			$.each(data.result.content,function(entryIndex,entry) 
			     			{
			     				   //To:do
			     				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"></td>";
			     				tableItem+="<td>"+entry.applyDept+"</td><td>"+entry.userName+"</td><td>"+entry.contactPhone+"</td><td>"+entry.accountName+"</td><td>";
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
			     			$("#table1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
			     			}
			     		  }
			     	}
			     };
			     
			     $.findByIdVpn = function(firUrl,id){
					 if(firUrl!="")
					   {	
							 $.ajax({
								   async: false,
								    url : firUrl+"/basicCrud/vpnResourceBook/get/"+id,
									type : 'post',
									success: function(data, status, xhr) {
										if (status == "success" && data != null)
										{
											if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
											{
												var entry=data.result;
												var applyBusinessTypeChina="";
												var table2Item="",table3Item="";
												switch(entry.applyBusinessType)
						     					{
						     					case "vpnForInnerNet":
													applyBusinessTypeChina = "集团管理网络VPN帐户，访问集团内部网络";
													break;
												case "vpnForPublishSite":
													applyBusinessTypeChina = "上海地铁官方网站VPN帐户，访问网站发布系统";
													break;
												case "other":
													applyBusinessTypeChina = "其它";
													break;
						     					default :"";
						     						applyBusinessType="";
						     					}
												switch(entry.post)
						     					{
						     					case "principal":
						     						postChina = "部门正职（主持工作）";
													break;
												case "deputy":
													postChina = "部门副职";
													break;
												case "staff":
													postChina = "科员";
													break;
						     					default :"";
						     						postChina="";
						     					}
												
						     					switch(entry.equipmentType)
						     					{
						     					case "desktop":
						     						equipmentTypeChina="台式机";
						     						break;
						     					case "mobileDevice":
						     						equipmentTypeChina="移动设备";
						     						break;
						     					case "specialDevice":
						     						equipmentTypeChina="专用设备";
						     						break;
						     					case "other":
						     						equipmentTypeChina="其它";
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
							     				table2Item="<tr><td class='lableTd t_r'>部门</td><td>"+entry.applyDept+"</td><td class='lableTd t_r'>使用人姓名</td><td>"+entry.userName+"</td></tr>";
							       				table2Item+="<tr><td class='lableTd t_r'>联系电话</td><td>"+entry.contactPhone+"</td><td class='lableTd t_r'>开通帐号</td><td>"+entry.accountName+"</td></tr>";
							                    table2Item+="<tr><td class='lableTd t_r'>访问权限</td><td>"+entry.permissions+"</td><td class='lableTd t_r'>用户组</td><td>"+entry.userGroup+"</td></tr>";
							                    
							                    table2Item+="<tr><td class='lableTd t_r'>业务类型</td><td>"+applyBusinessTypeChina+"</td><td class='lableTd t_r'>办理日期</td> <td>"+entry.implementTime+"</td></tr>";
							                   
							                    table2Item+="<tr><td class='lableTd t_r'>办理人</td><td>"+entry.implementEngineer+"</td> </tr><tr>";
							                    table2Item+="<td class='lableTd t_r' rowspan='2'>开通情况</td><td rowspan='3' colspan='3'>"+entry.remarks+"</td></tr>";
							       				$("#table2").append(table2Item);
							       				
							       				
							       				
							       				$("#tb2").html("");
							       				table3Item= "<tr><td class='lableTd t_r'>部门</td><td><input name='applyDept' type='text' class='input_large' value='"+entry.applyDept+"'/></td>";
							       				table3Item+="<td class='lableTd t_r'>使用人姓名</td><td><input name='userName' type='text'  class='input_large' value='"+entry.userName+"'/></td></tr>";
							       				table3Item+="<tr><td class='lableTd t_r'>联系电话</td><td><input name='contactPhone' type='text'  class='input_large' value='"+entry.contactPhone+"'/></td>";
							       				table3Item+="<td class='lableTd t_r'>开通帐号</td><td><input name='accountName' type='text'  class='input_large' value='"+entry.accountName+"'/></td></tr>";
							       				table3Item+="<tr><td class='lableTd t_r'>访问权限</td><td><input name='permissions' type='text'  class='input_large' value='"+entry.permissions+"'/></td>";
							       				table3Item+="<td class='lableTd t_r'>用户组</td><td><input name='userGroup' type='text' class='input_large' value='"+entry.userGroup+"'/></td></tr>";
							       				table3Item+="<tr><td class='lableTd t_r'>申请业务类型</td><td><select name='applyBusinessType' style='width:160px;'> <option value=''>请选择</option> <option value='vpnForInnerNet'>集团管理网络VPN帐户，访问集团内部网络</option> <option value='vpnForPublishSite'>上海地铁官方网站VPN帐户，访问网站发布系统</option>"; 
							       				table3Item+="<option value='other'>其它</option></select></td><td class='lableTd t_r'>办理日期</td><td><input name='implementTime' type='text'  class='input_large' value='"+entry.implementTime+"'/></td></tr>";

							       				table3Item+="<tr><td class='lableTd t_r'>办理人</td><td><input name='implementEngineer' type='text'  class='input_large' value='"+entry.implementEngineer+"'/></td></tr>";
							       				table3Item+=" <tr> <td class='lableTd t_r' rowspan='2'>开通情况</td> <td rowspan='3' colspan='3'><textarea name='remarks' style='3px' rows='4' cols='3' >"+entry.remarks+"</textarea></td></tr>";
							       				$("#table3").append(table3Item);
							       				$("[name=post]").val(entry.post);
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
			     };
				
				
				$.delByIdVpn = function(firUrl,id){
					if(firUrl!="")
					   {	
							 $.ajax({
								    url : firUrl+"/basicCrud/vpnResourceBook/del/"+id,
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
				
				$.postsaveVpn = function(Url,formName,otherData){
					var _data=$("#"+formName).serialize();
//			        return false;
					if(Url!="")
					   {					
							 $.ajax({
								    url : Url+"/basicCrud/vpnResourceBook/save",
									type : 'post',
									data:_data+otherData,
									success: function(data, status, xhr) {
										if (status == "success" && data != null)
										{
											if (data.success == true) 
											{
											
												window.close();
												location.href = Url+"/vpnResourceBook/vpnAccounting";
												
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
				
				
				$.postSearchFormVirtual = function(firUrl,paging){
					
					 paging+="&status_in=finish";
					 paging+="&sort=id desc";
					 if(firUrl!="")
					   {	
						 $.ajax({
								  async: false,
								    url : firUrl+"/basicCrud/virtualResourceBook/page",
									type : 'post',
									data: $("#projectAppform").serialize()+paging,
									success: function(data, status, xhr) {
										
										$.analyzeTableDataVirtual(data, status, xhr,firUrl);
										$.setBtnVirtual(firUrl);
										  
							           }, 
							           error: function() {
							              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
							           }
									});
					          }
				     };
				     
				     
				   //解析Table
				     $.analyzeTableDataVirtual = function(data, status, xhr,firUrl)
				     {
				     	if (status == "success" && data != null)
				     	{
				     		$("tr.tableItem").remove();
				     		
				     		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
				     		{
				     			$("tr.tableItem").remove();
				     			var tableItem="";
				     			$.each(data.result.content,function(entryIndex,entry) 
				     			{
				     				   //To:do
				     				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"></td>";
				     				tableItem+="<td>"+entry.applyDept+"</td><td>"+entry.userName+"</td><td>"+entry.contactPhone+"</td><td>"+entry.projectName+"</td><td>";
				     				tableItem+=entry.implementTime.substring(0,10)+"</td><td>"+entry.implementUser+"</td>";
				     				tableItem+="<td><a href=\"javascript:open("+entry.id+");\" style=\"display:inline\">详情 </a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:open2("+entry.id+");\" style=\"display:inline\">修改 </a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:del("+entry.id+");\" onclick=\"return confirm('确定将此记录删除?')\" style=\"display:inline\">删除 </a></td><td>&nbsp;</td>";
				     				$("#table1").append(tableItem);
				     				
				     			});
				     			$.setPageInfo(data.result);			
				     		}
				     		else
				     			{
				     			for(var i=0;i<=16;i++)
				     			{
				     			$("#table1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
				     			}
				     		  }
				     	}
				     };
				     
				     $.findByIdVirtual = function(firUrl,id){
						 if(firUrl!="")
						   {	
								 $.ajax({
									   async: false,
									    url : firUrl+"/basicCrud/virtualResourceBook/get/"+id,
										type : 'post',
										success: function(data, status, xhr) {
											if (status == "success" && data != null)
											{
												if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
												{
													var entry=data.result;
													var table2Item="",table3Item="";
													
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
								     				table2Item="<tr><td class='lableTd t_r'>部门</td><td>"+entry.applyDept+"</td><td class='lableTd t_r'>使用人姓名</td><td>"+entry.userName+"</td></tr>";
								       				table2Item+="<tr><td class='lableTd t_r'>联系电话</td><td>"+entry.contactPhone+"</td><td class='lableTd t_r'>所属项目</td><td>"+entry.projectName+"</td></tr>";
								                    table2Item+="<tr><td class='lableTd t_r'>项目负责人</td><td>"+entry.projectPrincipal+"</td><td class='lableTd t_r'>系统名称</td><td>"+entry.sysName+"</td></tr>";
								                    
								                    table2Item+="<tr><td class='lableTd t_r'>主机名</td><td>"+entry.hostName+"</td><td class='lableTd t_r'>IP</td><td>"+entry.ip+"</td></tr>";
								                    table2Item+="<tr><td class='lableTd t_r'>操作系统</td><td>"+entry.opsysDescription+"</td><td class='lableTd t_r'>操作系统个数</td><td>"+entry.opsys+"</td></tr>";
								                    
								                    table2Item+="<tr><td class='lableTd t_r'>中间件</td><td>"+entry.middlewareDescription+"</td><td class='lableTd t_r'>中间件个数</td><td>"+entry.middleware+"</td></tr>";
								                    table2Item+="<tr><td class='lableTd t_r'>数据库</td><td>"+entry.dbDescription+"</td><td class='lableTd t_r'>数据库个数</td><td>"+entry.db+"</td></tr>";
								                    
								                    table2Item+="<tr><td class='lableTd t_r'>安装软件</td><td>"+entry.software+"</td><td class='lableTd t_r'>CPU个数</td><td>"+entry.cpu+"</td></tr>";
								                    
								                    table2Item+="<tr><td class='lableTd t_r'>内存</td><td>"+entry.memory+"</td><td class='lableTd t_r'>硬盘</td><td>"+entry.hardDisk+"</td></tr>";
								                    table2Item+="<tr><td class='lableTd t_r'>办理日期</td> <td>"+entry.implementTime.substring(0,10)+"</td><td class='lableTd t_r'>办理人</td><td>"+entry.implementUser+"</td></tr>";
								                   
								                    table2Item+="<tr><td class='lableTd t_r' rowspan='2'>开通情况</td><td rowspan='3' colspan='3'>"+entry.remarks+"</td></tr>";
								       				$("#table2").append(table2Item);
								       				
								       				
								       				
								       				$("#tb2").html("");
								       				table3Item= "<tr><td class='lableTd t_r'>部门</td><td><input name='applyDept' type='text' class='input_large' value='"+entry.applyDept+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>使用人姓名</td><td><input name='userName' type='text'  class='input_large' value='"+entry.userName+"'/></td></tr>";
								       				table3Item+="<tr><td class='lableTd t_r'>联系电话</td><td><input name='contactPhone' type='text'  class='input_large' value='"+entry.contactPhone+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>所属项目</td><td><input name='projectName' type='text'  class='input_large' value='"+entry.projectName+"'/></td></tr>";
								       				table3Item+="<tr><td class='lableTd t_r'>项目负责人</td><td><input name='projectPrincipal' type='text'  class='input_large' value='"+entry.projectPrincipal+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>系统名称</td><td><input name='sysName' type='text' class='input_large' value='"+entry.sysName+"'/></td></tr>";
								       				table3Item+="<tr><td class='lableTd t_r'>主机名</td><td><input name='hostName' type='text'  class='input_large' value='"+entry.hostName+"'/></td>";
								       				
								       				table3Item+="<td class='lableTd t_r'>IP</td><td><input name='ip' type='text'  class='input_large' value='"+entry.ip+"'/></td></tr>";
								       				table3Item+="<tr><td class='lableTd t_r'>操作系统</td><td><input name='opsysDescription' type='text'  class='input_large' value='"+entry.opsysDescription+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>操作系统个数</td><td><input name='opsys' type='text'  class='input_large' value='"+entry.opsys+"'/></td></tr>";
								       				
								       				table3Item+="<tr><td class='lableTd t_r'>数据库</td><td><input name='dbDescription' type='text'  class='input_large' value='"+entry.dbDescription+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>数据库个数</td><td><input name='db' type='text'  class='input_large' value='"+entry.db+"'/></td></tr>";
								       				
								       				table3Item+="<tr><td class='lableTd t_r'>操作系统</td><td><input name='opsysDescription' type='text'  class='input_large' value='"+entry.opsysDescription+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>操作系统个数</td><td><input name='opsys' type='text'  class='input_large' value='"+entry.opsys+"'/></td></tr>";
								       				
								       				table3Item+="<tr><td class='lableTd t_r'>安装软件</td><td><input name='software' type='text'  class='input_large' value='"+entry.software+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>CPU个数</td><td><input name='cpu' type='text'  class='input_large' value='"+entry.cpu+"'/></td></tr>";
								       				table3Item+="<tr><td class='lableTd t_r'>内存</td><td><input name='memory' type='text'  class='input_large' value='"+entry.memory+"'/></td>";
								       				table3Item+="<td class='lableTd t_r'>硬盘</td><td><input name='hardDisk' type='text'  class='input_large' value='"+entry.hardDisk+"'/></td></tr>";
								       				
								       				
								       				table3Item+="<tr><td class='lableTd t_r'>办理日期</td><td><input name='implementTime' type='text'  class='input_large' value='"+entry.implementTime.substring(0,10)+"'/></td>";

								       				table3Item+="<td class='lableTd t_r'>办理人</td><td><input name='implementUser' type='text'  class='input_large' value='"+entry.implementUser+"'/></td></tr>";
								       				table3Item+=" <tr> <td class='lableTd t_r' rowspan='2'>开通情况</td> <td rowspan='3' colspan='3'><textarea name='remarks' style='3px' rows='4' cols='3' >"+entry.remarks+"</textarea></td></tr>";
								       				$("#table3").append(table3Item);
								       				$("[name=post]").val(entry.post);
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
				     };
					
					
					$.delByIdVirtual = function(firUrl,id){
						if(firUrl!="")
						   {	
								 $.ajax({
									    url : firUrl+"/basicCrud/virtualResourceBook/del/"+id,
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
					
					$.postsaveVirtual = function(Url,formName,otherData){
						var _data=$("#"+formName).serialize();
//				        return false;
						if(Url!="")
						   {					
								 $.ajax({
									    url : Url+"/basicCrud/virtualResourceBook/save",
										type : 'post',
										data:_data+otherData,
										success: function(data, status, xhr) {
											if (status == "success" && data != null)
											{
												if (data.success == true) 
												{
												
													window.close();
													location.href = Url+"/virtualResourceBook/virtualAccounting";
													
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

     