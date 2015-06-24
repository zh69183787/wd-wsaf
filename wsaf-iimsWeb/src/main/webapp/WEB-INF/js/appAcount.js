var  H,tableIteams,Mach=1,remark,checkNum,checkop;
$.defaultjs = function(){
	if(!placeholderSupport())
	{   
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

function loadinformation(obj) {
	  var tableIteam,dept;
	    //alert(obj);
	   $.each(obj.result.content, function(Index, object){
		    dept=object.dept;
		   // alert(SelectObj);
		   $.each(SelectObj.result.fieldProperties,function(index,sl){
		    	if(sl.path=="dept"){
		    		$.each(sl.option,function(i,o){
		    			if(i==dept){
		    				dept=o;
		    			}
		    		});
		    	}
		    });
		   	tableIteam+="<tr class=\"tableItem\"><td>"+object.id+"</td><td><a href=\"javascript:minute(\'"+object.dept+"\',\'\',\'\',\'\');\">"+dept+"</a></td><td><a href=\"javascript:minute(\'\',\'"+object.deviceNum+"\',\'\',\'\');\">"+object.deviceNum+"</td>"+
		   	"<td><a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'yes\',\'opsys\');\" style=\"display:inline\">"+object.authorizeOpsys+"</a>&nbsp;/&nbsp;<a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'\',\'opsys\');\" style=\"display:inline\">"+object.opsys+"</td>"+
		   	"<td><a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'yes\',\'oa\');\" style=\"display:inline\">"+object.authorizeOa+"</a>&nbsp;/&nbsp;<a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'\',\'oa\');\" style=\"display:inline\">"+object.oa+"</td>"+
		   	"<td><a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'yes\',\'app\');\" style=\"display:inline\">"+object.authorizeApp+"</a>&nbsp;/&nbsp;<a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'\',\'app\');\" style=\"display:inline\">"+object.app+"</td>"+
		   	"<td><a href=\"javascript:minute(\'"+object.dept+"\',\'"+object.deviceNum+"\',\'\',\'\');\" style=\"display:inline\">详细</a>&nbsp;&nbsp;<a href=\"javascript:del("+object.id+");\" style=\"display:inline\">删除</a></td></tr>";	
	   });
		$("#table_1 tbody").empty();
	 	$("#table_1 tbody").append(tableIteam); 
	    
	   // alert(obj.result.pageInfo.pageSize);
	  
	    
	
	    	if (obj.result.pageInfo != null) 
				{
				
					var _pageinfo=obj.result.pageInfo;
					
					var nowcount=$("#table_1").find(".tableItem");
				   
					if(_pageinfo.pageSize>nowcount.length)
						{
						var minMum=_pageinfo.pageSize-nowcount.length;
						for(var i=0;i<minMum;i++)
							{
							$("#table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
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
			        		 //pageStyle+="<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
			        		 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">5</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
			        		 }else if(_pageinfo.currentPage==2){
			        			 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">5</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">3</a></li><li class=\"selected\"><a class=\"topage\">2</a></li><li ><a class=\"topage\">1</a></li>";
			        		 }
			        	 else
			        		 {
			        		
			        			 if(_pageinfo.totalPages-_pageinfo.currentPage==0){
			        				 var pa=_pageinfo.currentPage-4; pb=_pageinfo.currentPage-3;pc=_pageinfo.currentPage-2; pd=_pageinfo.currentPage-1;
			        				 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li>  <li><a class=\"topage\">"+pd+"</a></li> <li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>";
			        			 }else if(_pageinfo.totalPages-_pageinfo.currentPage==1){
			        				 var pa=_pageinfo.currentPage-3; pb=_pageinfo.currentPage-2;pc=_pageinfo.currentPage-1; pd=_pageinfo.currentPage+1;
			        				 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li> <li><a class=\"topage\">"+pd+"</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li>  <li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>"; 
			        			 }else{
			        				 var pa=_pageinfo.currentPage-2; pb=_pageinfo.currentPage-1;pc=_pageinfo.currentPage+1; pd=_pageinfo.currentPage+2;
				        		     pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li> <li><a class=\"topage\">"+pd+"</a></li> <li><a class=\"topage\">"+pc+"</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li> <li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>";
			        			 }
			        			
			        		 }
			        	 }
			         else
			        	 {
			        	for(var j=1;j<=_pageinfo.totalPages;j++)
							{
			        		if(j==_pageinfo.currentPage)
			        			{
			        			pageStyle="<li class=\"selected \"><a>"+j+"</a></li>"+pageStyle;
			        			
			        			}
			        		else
			        			{
			        			pageStyle="<li><a class=\"topage \">"+j+"</a></li>"+pageStyle;

			        			}
							}
			        	 }
			      
			         _menu+=pageStyle+"<li><a  class=\"prepage\">&lt;&lt;</a></li>";
			         //alert(pageStyle);
			         $("ul.pager li").remove();
			         $("ul.pager").append(_menu);   
				
   }else{
  	
  	   $(".tfoot span:first-child").text("无相关信息！请重新搜索！");
   }
	
} 





