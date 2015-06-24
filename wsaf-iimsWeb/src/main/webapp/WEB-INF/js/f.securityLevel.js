;(function($, window, document,undefined) { 
	
    var GetCompanyInfo = function(ele, opt) {
        this.$element = ele,
        this.defaults = {
            'url': 'iims/',
            'otherData': ''
        },
        this.options = $.extend({}, this.defaults, opt)
    }

    GetCompanyInfo.prototype = {
    		getCompanyInfo: function() {
    			var myData=this.options,CompanyData=[];
    			if(this.options.url!="")
    			   {					
    					 $.ajax({
    						    url : this.options.url+"/ca/getDepts",
    							type : 'post',
    							async: false,
    							data:this.options.otherData,
    							datatype:'json',
    							success: function(data, status, xhr) {
    								if (status == "success" && data != null&&data!="[]")
    								{	 
    									var datasX;
    									for (var sitem in data) {
    									 datasX = {
    										label: data[sitem],
    		                                CompanyId: sitem
    		                            };
    									 
    									 if(datasX!=null)
    	    							CompanyData.push(datasX);
    									} 									
    								}						
    						}
    		    	});
    		 }
    		
    			return CompanyData;
        }
    }

    $.getCompanyInfo = function(options) {
        
        var _getCompanyInfo = new GetCompanyInfo(this, options);
        //调用其方法
        return _getCompanyInfo.getCompanyInfo();
    }
    
    $.postManager = function (firUrl, otherData) {
        if (firUrl != "") {
            $.ajax({
                async: false,
                url: firUrl + "/basicCrud/manager/page?pageSize=1" + otherData,
                type: 'post',
                success: function (data, status, xhr) {

                    if (status == "success" && data != null) {
                        if (data.success == true ) {
                            if (data.result.content.length > 0) {
                                var entry = data.result.content[0];
                                $("#mycompany").val(entry.company);
                                $("[name=leaderName]").val(entry.userName);
                                $("[name=leaderPost]").val(entry.post);
                                $("[name=leaderPhone]").val(entry.office);
                                $("[name=leaderEmail]").val(entry.email);
                                $("[name=leaderMobile]").val(entry.mobile);
                            }
                            else {
                            	$("#mycompany").val("");
                                $("[name=leaderName]").val("");
                                $("[name=leaderPost]").val("");
                                $("[name=leaderPhone]").val("");
                                $("[name=leaderEmail]").val("");
                                $("[name=leaderMobile]").val("");
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
    
    $.getUserNameInfo = function (firUrl, otherData) {
        if (firUrl != "") {
            $.ajax({
                async: false,
                url: firUrl + "/ca/getDeptUser" + otherData,
                type: 'post',
                success: function (data, status, xhr) {
                    if (status == "success" && data != null) {
                        var info = "<option value=\"\">请选择</option>",sel="";
                        $(".userName option").remove();
                        for (var item in data) {
                            info += "<option value=\"" + item + "\">" + data[item] + "</option>";
                             sel+="<li class=\"fl w25p\"><input type=\"checkbox\" name=\"memberName\" value=\""+item+"\">"+"<span style=\"display:inline\" class=\"tname\">"+data[item]+"</span></li>";
                        }
                                          
                        $(".userName").append(info);
                        $(".selPersonTable").append(sel);               
                    }
                }
            });
        }
    }
    
})(jQuery, window, document);