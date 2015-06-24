<!--2015.1.19 build-->
;(function($, window, document,undefined) { 
	//定义Beautifier的构造函数
    var Beautifier = function(ele, opt) {
        this.$element = ele,
        this.defaults = {
            'color': 'red',
            'fontSize': '12px',
            'textDecoration': 'none'
        },
        this.options = $.extend({}, this.defaults, opt)
    }
    
    //定义Beautifier的方法
    Beautifier.prototype = {
        beautify: function() {
            return this.$element.css({
                'color': this.options.color,
                'fontSize': this.options.fontSize,
                'textDecoration': this.options.textDecoration
            });
        }
    }
    
    //在插件中使用Beautifier对象
    $.fn.myPlugin = function(options) {
        //创建Beautifier的实体
        var beautifier = new Beautifier(this, options);
        //调用其方法
        return beautifier.beautify();
    }
    
<!-- --------------分割线以下是兼容性------------------------------------>
String.prototype.trim = function () {return this .replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );}
    
QueryString = {  
      data: {},  
      Initial: function () {  
	        var aPairs, aTmp;  
	        var queryString = new String(window.location.search);  
	        queryString = queryString.substr(1, queryString.length);       
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
<!-- --------------分割线以下是控件------------------------------------>
//默认时间为当前，格式：yyyy-mm-dd
 var GetDates = function(ele, opt) {
    	var d = new Date(); 
        this.$element = ele,
        this.defaults = {'mydata': d.getTime()},
        this.options = $.extend({}, this.defaults, opt)
}
    
GetDates.prototype = {
    		getDates: function() {  	
        	 var now = new Date(this.options.mydata),
             y = now.getFullYear(),
             m = now.getMonth() + 1, 
             d = now.getDate();
             m=m<10?"0"+m:m;
             d=d<10?"0"+d:d;
             return y+"-"+m+"-"+d;	
        }}
    
$.getDate = function(options) {
        var _getDate = new GetDates(this, options);
        return _getDate.getDates();
}
  
$.fn.isNullOrEmpty = function(_obj){
    if( this.val()==""||this.val()==null){return true;}else{return false;}	
}
    
var PostSave = function(ele, opt) {
        this.$element = ele,
        this.defaults = {
            'url': 'iims/',
            'formName': '',
            'modname': '',
            'otherData': '',
            'toUrl': '',
            'isGetData': false,
            'isClose': true,
            'isGoBack': false,
            'isUploadFile': false,
            'attachIds': ''
        },
        this.options = $.extend({}, this.defaults, opt)
}

PostSave.prototype = {
      postSave: function() {
       var _data="",myData=this.options;
	
       if(this.options.isGetData)
        _data=$("#"+this.options.formName).serialize();
       
	   if(this.options.url!="")
	   {					
			 $.ajax({
				    url : this.options.url+"/basicCrud/"+this.options.modname+"/save",
					type : 'post',
					async: false,
					data:_data+this.options.otherData,
					datatype:'json',
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{
							if (data.success == true) 
							{
							  if(myData.isGoBack)
								{
								  if(myData.toUrl!="")
								  location.href = myData.url+myData.toUrl;
								}	
							  
							  if(myData.isClose)
							  {
								  window.opener=null;
								  window.close();
							  }
							  
							  if(myData.isUploadFile)
								  {
									$.saveFile({"url":myData.url,"modelName":myData.modname,"modelId":data.result.id,"attachIds":myData.attachIds});
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
}

    $.postSave = function(options) {
        var _postSave = new PostSave(this, options);
        return _postSave.postSave();
}

var SaveFile = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
        'url': '',
        'modelName': '',
        'modelId': '',
        'attachIds': '' 
    },
    this.options = $.extend({}, this.defaults, opt)
}

SaveFile.prototype = {
		saveFile: function() {
			if(this.options.url!="")
			   {	

			$.ajax({
				  async: false,
				    url : this.options.url+"/attach/api/bind",
					type : 'post',
					data: "&modelName="+this.options.modelName+"&modelId="+this.options.modelId+"&attachIds="+this.options.attachIds,
					success: function(data, status, xhr) {
						
					},
			       error:function(XMLHttpRequest, textStatus, errorThrown){
			    	   //alert(XMLHttpRequest+"save失败");
			       }
			       });
			   }
    }
}

$.saveFile = function(options) {
    var _saveFile = new SaveFile(this, options);
    return _saveFile.saveFile();
}


var GetMenu = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
        'url': '',
        'modName': ''
    },
    this.options = $.extend({}, this.defaults, opt)
}

GetMenu.prototype = {
		getMenu: function() {
    	if(this.options.url!="")
		   {		
    		var _name=this.options.modName;
		 $.ajax({
			    async: false,
			    url  : this.options.url+"/basicCrud/"+this.options.modName+"/getEntityProperty",
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
										}
									   else if(_name=="projectPlan"&&entry.path=="status")
										{
										   $.analyzeSelMenu(entry.path,entry.codes.inDept);
										   $.analyzeSelMenu(entry.path,entry.codes.toInfoDept);
										
										}
									else
										{
										  $.analyzeSelMenu(entry.path,entry.option);	
										}
									}	
						           });
					}
				}
			});
			
	      }	
	  }
}

$.analyzeSelMenu= function(dataname,_obj)
{
	for ( var sitem in _obj) 
	{
	if($("select[name="+dataname+"]").length > 0 )
		{
		if(_obj[sitem]=="请选择")
		   $("[name="+dataname+"]").prepend("<option value='"+sitem+"'>"+_obj[sitem]+"</option>"); 
		else
		   $("[name="+dataname+"]").append("<option value='"+sitem+"'>"+_obj[sitem]+"</option>"); 
			
		}
	}
}

$.getMenu = function(options) {
    var _getMenu = new GetMenu(this, options);
    return _getMenu.getMenu();
}

var UserIdentity = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
        'url': '',
        'modName': '',
        'companyShow':true
    },
    this.options = $.extend({}, this.defaults, opt)
}

//用户身份0是普通人,1是领导，2是信息中心领导，3是hb，4是xwj，5是zsh，6是fz
UserIdentity.prototype = {
	userIdentity: function() {
       var _pi=0,myData=this.options;
		
 	   if(this.options.url!="")
       {
 		 $.ajax({
 			    async: false,
 			    url : this.options.url+"/ca/getCurrentLoginInfo",
 				type : 'post',
 				success: function(data, status, xhr) {
 					if (status == "success" && data != null)
 					{ 
 					   if (data.cookies&&JSON.stringify(data.cookies) != "[]") 	
 						{
 						      if($("#myname").length>0)
 						      $("#myname").text(data.cookies.loginName);
 						      
 						      if(myData.companyShow)
 						      {
 						    	  if($("#lreportUnit").length > 0)
 			 					  $("#lreportUnit").val(data.companyName);
 						    	  
 						    	  $("[name=reportUnit]").val(data.companyName);
 						    	  $("[name=reportUnitId]").val(data.companyId);
 						    	  $("#company_Id").text(data.companyId);
 						      }

							  $("[name=applyer]").val(data.cookies.userName);
							  $("#applyerLoginname").val(data.cookies.loginName);
 						     
 						       switch (data.cookies.loginName) {
 				                case "G002000000332549":
 				                    _pi = 3;
 				                    break;
 				                case "G020105000192549":
 				                    _pi = 4;
 				                    break;
 				                case "G001000001702549":
 				                    _pi = 5;
 				                    break;
 				                case "G010070003832549":
 				                    _pi = 6;
 				                    break;
 				                default:
 				                	
 				                    if (data.leaders != "") {
 				                        for (var sitem in data.leaders) {
				                            	$("#myhandlerLoginname").append("<option value='"+sitem+"'>"+data.leaders[sitem]+"</option>"); 
				                            	
 				                            if (data.cookies.loginName == sitem) {
 				                                if (data.cookies.deptName == "信息管理中心")
 				                                    _pi = 2;
 				                                else
 				                                    _pi = 1;
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
}

$.userIdentity = function(options) {
    var _userIdentity = new UserIdentity(this, options);
    return _userIdentity.userIdentity();
}

$.fn.getOptionVal = function(){
	var _option="";
    $(this).each(function(){
    	if($(this).text()!="请选择"&&$(this).text()!=""&&$(this).val()!=""&&$(this).val()!=null)
    		_option+=$(this).val()+",";
    });
    _option=_option.substring(0,_option.length-1);
    return _option;
}
    
$.fn.boxOpen = function(){
	  $(".ywbl").css("background-image", "url(css/default/images/icon_1.png)").parent("li").removeClass("disable").css("cursor", "pointer");
	
	  $(this).click(function () {
         $("#bt").height($(document).height());
         $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
         $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
         $(".f_window").css("display", "block");
         $("#bt").css("display", "block");
     });
}

$.fn.boxOpenSp = function(){
	   $(this).click(function () {
       $("#bt").height($(document).height());
       $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
       $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
       $(".f_window").css("display", "block");
       $("#bt").css("display", "block");
   });
}

var PostDele = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
       'url': 'iims/',
       'modname': '',
       'toUrl': '',
       'isGoBack': false,
       'isClose': false,
       'id':''
    },
    this.options = $.extend({}, this.defaults, opt)
}

PostDele.prototype = {
		postDele: function() {
			var myData=this.options;
			if(this.options.url!="")
			   {					
					 $.ajax({
						    url : this.options.url+"/basicCrud/"+ this.options.modname+"/del/" + this.options.id,
							type : 'post',
							success: function(data, status, xhr) {
								if (status == "success" && data != null)
								{
									if (data.success == true) 
									{
										if(myData.isGoBack)
										{
										  if(myData.toUrl!="")
										  location.href = myData.url+myData.toUrl;
										}	
									  
									    if(myData.isClose)
									    {
										  window.opener=null;
										  window.close();
									    }
									    
									    alert("删除成功");
									}
								}
								
						}
					});
			   }
       }
}

$.postDele = function(options) {
    var _postDele = new PostDele(this, options);
    return _postDele.postDele();
}

var GetRole = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
        'otherData': '',
        'url': '',
        'personDescribe': '',
        'inputId':'principalPeople'
    },
    this.options = $.extend({}, this.defaults, opt)
}

GetRole.prototype = {
		getRole: function() {
			var myData=this.options;
                if (this.options.url != "") {
                    $.ajax({
                        async: false,
                        url: this.options.url + "/basicCrud/manager/page?pageSize=1" ,
                        data:this.options.otherData,
                        type: 'post',
                        datatype:'json',
                        success: function (data, status, xhr) {

                            if (status == "success" && data != null) {
                                if (data.success == true ) {
                                    if (data.result.content.length > 0) {
                                        var entry = data.result.content[0];

                                        $("#"+myData.inputId).append("<option value=\"" + entry.loginName + "\">" + myData.personDescribe + entry.userName + "</option>");

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
    }

$.getRole = function(options) {
    var _getRole = new GetRole(this, options);
    return _getRole.getRole();
}


var VerificationAll = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
        'tableName': 'body'
    },
    this.options = $.extend({}, this.defaults, opt)
}

VerificationAll.prototype = {
		verificationAll: function() {
    	 var _obj = $(this.options.tableName).find("input[type=text],select,textarea"),yanzhen="";
    	    for (var i = 0; i < _obj.length; i++) { 
    	   	 if ($(_obj[i]).css("display") != "none" && $(_obj[i]).attr("disabled") != "disabled") {
    	            if ($(_obj[i]).val() == null || $(_obj[i]).val() == "") {
    	           	 var _str="";
    	           	     if(_obj[i].tagName=="SELECT" )
    	           	    	 {
    	           	    	 _str="必选选择一个\r";
    	           	    	 }
    	           	     else
    	           	    	 {
    	           	    	 _str="不能为空\r";
    	           	    	 }
    	           	     yanzhen += $(_obj[i]).parent("td").prev("td").text().trim() + _str;
    	            }
    	   	 }
    	    }
    	    return yanzhen;
    }
}

$.verificationAll = function(options) {
    var _verificationAll = new VerificationAll(this, options);
    return _verificationAll.verificationAll();
}

$.FileDel = function (firUrl, _id, isRead) {
    if (firUrl != "") {
        $.ajax({
            async: false,
            url: firUrl + "/attach/api/del/" + _id,
            dataType: "json",
            type: 'post',
            success: function (data, status, xhr) {

                //alert("删除成功");
            }
        });
    }
}
$.FileDel2 = function (firUrl, _id, isRead) {
    if (firUrl != "") {
        $.ajax({
            async: false,
            url: firUrl + "/attach/api/del/" + _id,
            dataType: "json",
            type: 'post',
            success: function (data, status, xhr) {

            }
        });
    }
}

var GetFile = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
        'type': '0',
        'url':'',
        'otherdata':''
    },
    this.options = $.extend({}, this.defaults, opt)
}

GetFile.prototype = {
		getFile: function() {
			var info="", myData=this.options;
			if(this.options.url!="")
			   {	
				
				 $.ajax({
					   async: false,
					    url : this.options.url+"/attach/api/all?"+this.options.otherdata,
						type : 'get',
						success: function(data, status, xhr) {

							if (status == "success" && data != null)
							{	
								if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
								{
									var entry=data.result;
									for ( var item in entry) 
									{
									       if(myData.type=="0")
									    	{
									    	   info+="<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td><a href=\""+myData.url+"/attach/api/download/"+entry[item].id+"\">下载</a></td><td><a class=\"del\">删除</a></td></tr>";
									    	}
									       else if(myData.type=="1")
									       {
									    	   info+="<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td><a href=\""+myData.url+"/attach/api/download/"+entry[item].id+"\">下载</a></td></tr>"
									       }
									       else if(myData.type=="2")
									       {
									    	   info+="<tr name=\""+entry[item].id+"\"><td><a href=\""+myData.url+"/attach/api/download/"+entry[item].id+"\">"+entry[item].fileName+"</a></td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td></td></tr>"
									       }
									}
								
								}
							}
						}
				 });
				 return info;
			   }
    }
}

$.getFile = function(options) {
    var _getFile = new GetFile(this, options);
    return _getFile.getFile();
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


var GetWorkflowId = function(ele, opt) {
    this.$element = ele,
    this.defaults = {
    		 'url':'iims/',
    	      'otherdata':''
    },
    this.options = $.extend({}, this.defaults, opt)
}


GetWorkflowId.prototype = {
		getWorkflowId: function() {
			var workflowId="";
			if(this.options.url!="")
			   {
			 $.ajax({
				    async: false,
				    url : this.options.url+"/basicCrud/workflowLog/all",
					type : 'post',
					data:this.options.otherdata,
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{ 
						   if (data.result&&JSON.stringify(data.result) != "[]") 	
							{
							   workflowId=data.result[0].id;
							}
						}
					}
				});
		    } 
			return workflowId;
    }

}


$.getWorkflowId = function(options) {
    var _getWorkflowId = new GetWorkflowId(this, options);
    return _getWorkflowId.getWorkflowId();
}




})(jQuery, window, document);

<!-- --------------分割线以下是js函数------------------------------------>
function placeholderSupport() {
    return 'placeholder' in document.createElement('input');
}

function checknum(obj) {
    if (/^\d+\.?\d{0,2}$/.test(obj.value)) {
        obj.value = obj.value;
    } else {
        obj.value = obj.value.substring(0, obj.value.length - 1);
    }

}

$(function(){
	if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
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
	};
	
	QueryString.Initial();
	
    $(".closewindow").click(function () {
        $(".f_window").css("display", "none");
        $("#bt").css("display", "none");
    });

})