
$.defaultjs = function(){
	if(!placeholderSupport())
	{   // 判断浏览器是否支持 placeholder_html5中新增的属性用于设置初始提示内容为灰色显示
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

function initDeptUserInfo(){
    $.ajax({
    	async: false,
		type : 'POST',
		url : contextPath+"/ca/getCookies",
		data :"",
		dataType : 'json',
		cache : false,
		error : function() {
		},
		success : function(obj) {
		    deptId=obj.deptId;
		    deptName=obj.deptName;
		    userName=obj.userName;
		    loginName=obj.loginName;					    			
		}
		
	});				
}



function mod(id){   
	$.ajax({
		type : 'POST',
		url : contextPath+"/basicCrud/cpqPartyLife/get/"+ id,
		data : "",
		dataType : 'json',
		cache : false,
		error : function() {
			alert('系统连接失败，请稍后再试3！')
		},
		success : function(obj) {
			if (obj.success) {
				loadEditForm(obj);							
			}
		}
	});
}

function del(id){
	if(confirm("确认删除？")){
	  $.ajax({
			type : 'POST',
			url : contextPath+"/basicCrud/cpqPartyLife/del/"+id,
			data : "",
			dataType : 'json',
			cache : false,
			error : function() {
				alert('系统连接失败，请稍后再试1！');
			},
			success : function(selectobj) {
				if(selectobj.success==true){
			   		alert("删除成功！");
			   		$("#table_1 tbody").empty();
					showObjectOption();	
			  	}
			}
			
		});
					

	}
}	

function save(){
   var success=validate($("#editFrom").serialize());
   if(success){
	    $.ajax({
			type : 'POST',
			url : contextPath+"/basicCrud/cpqPartyLife/save",
			data : $("#editFrom").serialize(),
			dataType : 'json',
			cache : false,
			error : function() {
				alert('系统连接失败，请稍后再试1！');
			},
			success : function(selectobj) {
			
			   if(selectobj.success==true){
			   		alert("保存成功！");
			   		showObjectOption();	
			   		close();
			  }
			}
			
		});
	}
   
}	


function showObjectOption(_page) {
	var initParams="&pageSize=18&pageNum="+_page; 
	if(role!='admin'){
		initParams+="&deptId="+deptId;
	}
	$.ajax({		      
		type : 'POST',
		url : contextPath+"/basicCrud/cpqPartyLife/page?sort=createTime desc"+initParams,
		data : getQueryParam($("#searchform").serialize()),
		dataType : 'json',
		cache : false,
		error : function() {
			alert('系统连接失败，请稍后再试4！');
		},
		success : function(obj) {
			if (obj.success) {
				loadList(obj);
				setBtn();
			}
		}
	});
}

function setBtn(){
	 $(".topage").click(function(){
 		$.showObjectOption($(this).text()); 		
	 });
	    
    $(".prepage").click(function(){
	 	 var nowpage=parseInt($("#page>.selected  a").text());
	 	 if(nowpage>1){
	 		var topage=nowpage-1;
	 		$.showObjectOption(topage);
	 	}
		
	}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($("#page>.selected  a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max"))){
		  $.showObjectOption(nextpage);
		}

	});  
		
     $("#gopagebtn").click(function(){
         var topage=parseInt($("#gopage").val());
     
       	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1){
      		 $.showObjectOption(topage);
      	}else{
       		 alert("超出索引值");
       	}
	}); 
	
 }
	
		
		
function loadList(obj) {
	if (obj.success == true && JSON.stringify(obj.result.content) != "[]") {
		var tableteam="";
		$.each(obj.result.content, function(Index, record) {
			
			 tableteam+="<tr class=\"tableItem\">";
			 tableteam+="<td>"+record.deptName+ "</td>";
			 tableteam+="<td>"+record.year+ "</td>";
			 tableteam+="<td>"+record.jan+ "</td>";
			 tableteam+="<td>"+record.feb+ "</td>";
			 tableteam+="<td>"+record.mar+ "</td>";
			 tableteam+="<td>"+record.apr+ "</td>";
			 tableteam+="<td>"+record.may+ "</td>";
			 tableteam+="<td>"+record.jun+ "</td>";
			 tableteam+="<td>"+record.jul+ "</td>";
			 tableteam+="<td>"+record.aug+ "</td>";
			 tableteam+="<td>"+record.sep+ "</td>";
			 tableteam+="<td>"+record.oct+ "</td>";
			 tableteam+="<td>"+record.nov+ "</td>";
			 tableteam+="<td>"+record.dece+ "</td>";			 
			 tableteam+="<td>"+record.creator+ "</td>";
			 tableteam+="<td>"+record.createTime+ "</td>";
			 tableteam+="<td><a href=\"javascript:mod("+record.id+");\" style=\"display:inline\">修改</a>&nbsp;&nbsp;&nbsp;";
			 tableteam+= "<a href=\"javascript:del("+record.id+");\" style=\"display:inline\">刪除</a>";				 			           			
			 tableteam+="</td></tr>";			 
		});
		$("#table_1 tbody").empty();
	 	$("#table_1 tbody").append(tableteam); 

    	if (obj.result.pageInfo != null) 
			{
			
				var _pageinfo=obj.result.pageInfo;
				
				var nowcount=$("#table_1").find(".tableItem");
			   
				if(_pageinfo.pageSize>nowcount.length)
					{
					var minMum=_pageinfo.pageSize-nowcount.length;
					for(var i=0;i<minMum;i++)
						{
						$("#table_1").append("<tr class=\"tableItem\">"
								+"<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>"
								+"<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>"
								+"</tr>");
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
		         $("ul.pager li").remove();
		         $("ul.pager").append(_menu);   
			}
     }else{    	
    	   $(".tfoot span:first-child").text("无相关信息！请重新搜索！");
     }
	
}

function addnew(){
	$("#deptId").val(deptId);
	$("#deptName").val(deptName);
	$("#creator").val(userName);
	$("#creatorLoginname").val(loginName);
	//$("#removed").val("0");
	$("#year").val(new Date().getFullYear());
	$("#editDiv").show();
} 

function loadEditForm(obj){
	var record=obj.result;
	$("#id").removeAttr("disabled");
	$("#id").val(record.id);
	$("#deptId").val(record.deptId);
	$("#deptName").val(record.deptName);
	$("#year").val(record.year);
	$("#jan").val(record.jan);
	$("#feb").val(record.feb);
	$("#mar").val(record.mar);
	$("#apr").val(record.apr);
	$("#may").val(record.may);
	$("#jun").val(record.jun);
	$("#jul").val(record.jul);
	$("#aug").val(record.aug);
	$("#sep").val(record.sep);
	$("#oct").val(record.oct);
	$("#nov").val(record.nov);
	$("#dece").val(record.dece);
	$("#creator").val(record.creator);
	$("#creatorLoginname").val(record.creatorLoginname);
	$("#createTime").val(record.createTime);
	//$("#removed").val(record.removed);
	$("#editDiv").show();
	
}
function close(){	
	 $("#editDiv").fadeOut();
	 $("#editDiv").find("input[type='text']").each(function(){
		 if($(this).name!="createTime"){
			 $(this).val("0"); 
		 }
     });
	 
	 $("#editDiv").find("input[type='hidden']").each(function(){
		 if($(this).name!="removed"){
			 $(this).val(""); 
		 }
     });

	}
function getQueryParam(str){
	var strs= str.split("&");
	var newStr="";
	$.each(strs,function(index,infs){
		var inf = infs.split("=");
		if(inf[1]!=""){
			if(newStr!=""){
				newStr+="&";
			}
			newStr+=inf[0]+"="+inf[1];
		}
		  
		
	});
	
	return newStr;
}

function validate(str){
	var returnValue=true;
	var strs= str.split("&");
	
	var mach="";
		//alert(0);
	$.each(strs,function(index,infs){
		var inf = infs.split("=");
		if(inf[0]=="year"){
			mach= /[0-9]{4}/;
			if(inf[1]==""){
				alert("年度未填写");
				returnValue= false;
			}else if(!mach.test(inf[1])){
				alert("年度格式错误,格式为:2014")
				returnValue= false;
			}
		}else if(inf[0]=="jan"||inf[0]=="feb"||inf[0]=="mar"||inf[0]=="apr"||inf[0]=="may"||inf[0]=="jun"
			||inf[0]=="jul"||inf[0]=="aug"||inf[0]=="sep"||inf[0]=="oct"||inf[0]=="nov"||inf[0]=="dece"){
			mach= /[0-9]{1,5}/;
			if(!mach.test(inf[1])){
				alert("各个月份需填写数字")
				returnValue= false;
			}
		}else if(inf[0]=="id"&&inf[1]==""){
			$("#id").attr("disabled","disabled");			
		}else if(inf[0]=="createTime"){
			$("#createTime").val(new Date().getTime());
		}else if(inf[0]=="removed"&&inf[1]==""){
			$("#removed").val("0");
		}		
		
	});
	
	return returnValue;
}
