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

$.setBtn = function(searchbtn){
	 $(".topage").click(function(){
 		//$.postSearchForm(firUrl,"&pageSize=16&pageNum="+$(this).text(),isleader);
 		$("#gopage").val($(this).text());
 		$("#"+searchbtn).click();
	 });
	   
    $(".prepage").click(function(){
 	 var nowpage=parseInt($(".selected a").text());

 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$("#gopage").val(topage);
 		$("#"+searchbtn).click();
 		//$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage),isleader;
 		 }
		}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($(".selected a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   //$.postSearchForm(firUrl,"&pageSize=16&pageNum="+nextpage,isleader);
 	 		$("#gopage").val(nextpage);
 	$("#"+searchbtn).click();
		}); 
   
 
   
   $("#gopagebtn").click(function(){
 	  var topage=parseInt($("#gopage").val());
   
     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
 		 {
     		$("#gopage").val(topage);
     		$("#"+searchbtn).click();
 		//$.postSearchForm(firUrl,"&pageSize=16&pageNum="+topage,isleader);
 		 }
     	 else
     		 {
     		 alert("超出索引值");
     		 }
	});  
}

$.ajaxPage = function(firUrl,url,otherData,formid){
	var pageNum = $("#gopage").val();
	if(pageNum==""){pageNum=0;}
	var paging = "&pageSize=16&pageNum="+pageNum;
	
	var datastr = $("#"+formid).serialize()+paging+otherData+"";
	if(datastr.indexOf("removed")<0){
		datastr+="&removed=0"
	}
	$.openLoading();
	 $.ajax({
		  	async: false,
		    url : firUrl+url,
			type : 'post',
			data: datastr,
			success: function(data, status, xhr) {
				$.analyzeTableData(data, status, xhr,webpath,null);
				$.closeLoading();
        }, 
        error: function() {
           hiAlert("对不起！你的请求出现异常，请联系服务人员！");
           $.closeLoading();
        }
	});
}
$.setPage= function(result,searchbtn){
	var _pageinfo={"startRecord":0,"pageSize":16,"totalPages":0,"totalRecord":0,"currentPage":1,"hasNext":false,"hasPrevious":false};
	if (result!=null&&result.pageInfo != null) 
	{
		_pageinfo=result.pageInfo;
	}
		
		
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
         $("ul.pager").html(_menu);		        
         $("#gopage").val(_pageinfo.currentPage);
         $.setBtn(searchbtn);
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

$.postDele = function(Url){
	if(Url!="")
	   {	$.openLoading();
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
						$.closeLoading();
						}
			 
					});
	   }	
}


$.setUserInfo = function(Url){
	if(Url!="")
	   {
		$.openLoading();
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
				$.closeLoading();
			}
		});
    }	
  }
	
$.isleader = function(firUrl){
	var _isleader=false;
	
	if(firUrl!="")
	   {
		$.openLoading();
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
				$.closeLoading();
			}
		});
    }
	return _isleader;
  }

$.ajaxPageFormSubmit = function(formId){
	var url = $("#"+formId).attr("action");
	$.openLoading();
	$.ajax({
	    url :url,
		type : 'post',
		data:$("#"+formId).serialize(),
		success: function(data, status, xhr) {
			if (status == "success" && data != null){
				if  (data.success == true){
					alert("保存成功");
					$.closeLoading();
					location.reload();
				}else{
				alert("保存失败");
				$.closeLoading();
				}
			}else{
				alert("保存失败");
				$.closeLoading();
				}
			},
			dataType : 'json'
		});
}