/**
 * js获取系统的根路径
 * @returns
 */
function getBasePath(){
	var obj=window.location;
	var contextPath=obj.pathname.split("/")[1];
	var basePath=obj.protocol+"//"+obj.host+"/"+contextPath;
	return basePath;
};    

    //初始化单位select框
    function  initDeptSelect(){
         $.ajax({  
		    url :getBasePath()+'/crmInfo/findAllDepartment',
			type : 'post',
			async:false,
			dataType:'json',
			success: function(data) {
			    if(data.depFacies!=null){
				      for(var i=0;i<data.depFacies.length;i++){
				        if(""==data.depFacies[i]){
				           continue;
				        }
				         var depStr="<option value='"+data.depFacies[i]+"'>"+data.depFacies[i]+"</option>";
				         $("#dept").append(depStr);
				      }
				  }
			}	
		});
    }
    
    //表单搜索
    function searchForm(topage){
         var dept =$("#dept").val();
         var sortItem=$("#sortItem").val();
         var sortStyle=$("#sortStyle").val();
         $.ajax({  
		    url :getBasePath()+'/crmInfo/findByPage',
		    data:'dept='+dept+'&sortItem='+sortItem+'&sortStyle='+sortStyle+'&pageSize=10&pageNum='+topage,
			type : 'post',
			async:false,
			dataType:'json',
			success: function(data) {
			    if(data.success==true){
				   //先清空
				   $("#maintable tbody").html("");
				   //再设置
				   for(var i=0;i<data.result.content.length;i++){
				       var element=data.result.content[i];
				       var trItem="";
				       trItem+="<tr>";
				       trItem+="<td>"+(i+1)+"</td>";
				       trItem+="<td><a href='"+getBasePath()+"/crmInfo/toCrmDetail?serialNo="+element.serialNo+"' style='text-decoration: underline;'><font color='blue'>"+element.faciClass+"-"+element.serialNo+"</font></a></td>";
				       trItem+="<td><a href='"+getBasePath()+"/toCrmDetail?serialNo="+element.serialNo+"' style='text-decoration: underline;'><font color='blue'>"+element.assetNo+"</font></a></td>";
				       trItem+="<td>"+element.department+"</td>";
				       if(element.department2.length>6){
				    	   trItem+="<td>"+element.department2.substring(0,9)+"...</td>"; 
				       }else{
				    	   trItem+="<td>"+element.department2+"</td>";
				       }
				       trItem+="<td>"+element.userName+"</td>";
				       trItem+="<td>"+element.userPhone1+"</td>";
				       trItem+="<td>"+element.brand+"</td>";
				       trItem+="<td>"+element.styleNo+"</td>";
				       trItem+="<td>"+element.coreFire+"</td>";
				       trItem+="<td>"+element.ram+"</td>";
				       trItem+="<td>"+element.hdSize+"</td>";
				       trItem+="<td>"+element.screenSize+"</td>";
				       trItem+="<td>"+element.macAddress+"</td>";
				       trItem+="<td>"+element.ipAddress+"</td>";
				       trItem+="<td>"+element.os+"</td>";
				       trItem+="</tr>";
				       $("#maintable tbody").append(trItem);
				   }
				   //分页栏目
				   $.setPageInfo(data.result);
				   //设置分页页码点击事件
				   $.setBtn();
			}	
		}
    });
 }
 
 $.setBtn=function(){
      $(".topage").click(function(){
             searchForm($(this).text());
		 });
		   
	    $(".prepage").click(function(){
		 	 var nowpage=parseInt($(".selected a").text());
		 	 if(nowpage>1){
		 		 var topage=nowpage-1;
		 		 searchForm(topage);
		 	}
		}); 
	  
	   $(".nextpage").click(function(){
		 	 var nextpage=parseInt($(".selected a").text())+1;
		 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		 	       searchForm(nextpage);
		}); 
	   
	   $("#gopagebtn").click(function(){
	 	     var topage=parseInt($("#gopage").val());
	     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1){
	     	    searchForm(topage);
	 		 }
	     	 else{
	     		 alert("超出索引值");
	     	 }
		});  
 }

$.setPageInfo= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=10;
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
		
         $(".tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount+"条");
         
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
}
 