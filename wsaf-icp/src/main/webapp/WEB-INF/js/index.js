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

//
//$.getLoginUser = function(firUrl){
//	var loginName = "";
//	if(firUrl!=""){
//		$.ajax({
//	    	url:firUrl+"/ca/getCookies",
//	    	async:false,
//	    	type: 'post',
//	   		dataType : 'json',
//	   		data:{},
//	   		success: function (data) {
//	   				if(data!=null){
//	   					loginName = data.loginName+data.deptId;
//	   				}
//	   		}
//		});
//	}
//	return loginName;
//	
//}

$.getLoginName = function(firUrl){
	var loginName = "";
	if(firUrl!=""){
		$.ajax({
	    	url:firUrl+"/ca/getCookies",
	    	async:false,
	    	type: 'post',
	   		dataType : 'json',
	   		data:{},
	   		success: function (data) {
	   				if(data!=null){
	   					loginName = data.loginName;
	   				}
	   		}
		});
	}
	return loginName;
	
}


////////////////////////意见征集////////////////////////////
$.setThemeBtn = function (firUrl) {
    $(".themeprepage").click(function () {
        var nowpage = parseInt($("#themePageNum").val());
        if (nowpage > 1) {
            var topage = nowpage - 1;
            $.getThemeData(firUrl, "&pageSize=5&pageNum=" + topage);
        }
    });

    $(".themenextpage").click(function () {
        var nextpage = parseInt($("#themePageNum").val()) + 1;
        if (nextpage <= parseInt($("#themetotalPages").val()))
            $.getThemeData(firUrl, "&pageSize=5&pageNum=" + nextpage);
    });
}
$.getThemeData = function (firUrl, paging) {
	var loginName=$.getLoginName(firUrl); 
    if (firUrl != "") {
        $.ajax({
            url: firUrl + "/basicCrud/actSuggestion/page",
            type: 'post',
            dataType:'json',
            data: paging + "&sort=createTime desc&loginName_sl="+loginName,
            success: function (data, status, xhr) {
            	$.analyzeThemeData(data, status, xhr, firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
	
}
$.analyzeThemeData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $(".theme").empty();
        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            var item = "";
            $.each(data.result.content, function (entryIndex, entry) {
//            	var time = entry.createTime.substring(0,11);
            	var time = entry.createTime;
            	var ctId = entry.ctId;
            	var name = "";
            	$.ajax({
        	    	url:firUrl+"/basicCrud/actTheme/get/"+ctId,
        	    	async:false,
        	    	type: 'post',
        	   		dataType : 'json',
        	   		data:{},
        	   		success: function (data) {
        	   				if(data!=null && data.result!=null){
        	   					name = data.result.name;
        	   					name = name.substring(0, 40);
        	   					item += "<li class=\"clearfix\"><a target=\"_blank\"  href=\"  "+firUrl+"/actSuggestion/actSuggestionView?ctId= "+ctId+"\" style=\"color:#E27925;\">"+name+"</a><span style=\"color:#E27925;\">"+time+"</span></li>";
        	   				}
        	   		}
        		});
            	
            	
            	
            });
            $("#themePageNum").val(data.result.pageInfo.currentPage);
            $("#themetotalPages").val(data.result.pageInfo.totalPages);
            $(".theme").append(item);
            $.setThemeBtn(firUrl);
        }

    }
}
/////////////////问卷调查///////////////////////////////////////////
$.setQuesBtn = function (firUrl) {
    $(".quesprepage").click(function () {
        var nowpage = parseInt($("#quesPageNum").val());
        if (nowpage > 1) {
            var topage = nowpage - 1;
            $.getQuesData(firUrl, "&pageSize=5&pageNum=" + topage);
        }
    });

    $(".quesnextpage").click(function () {
        var nextpage = parseInt($("#quesPageNum").val()) + 1;
        if (nextpage <= parseInt($("#questotalPages").val()))
            $.getQuesData(firUrl, "&pageSize=5&pageNum=" + nextpage);
    });
}

$.getQuesData = function (firUrl, paging) {
	var loginName=$.getLoginName(firUrl); 
    if (firUrl != "") {
        $.ajax({
        	url: firUrl + "/basicCrud/qteUserMain/page",
            type: 'post',
            dataType:'json',
            data: paging + "&sort = fillTime desc&loginName_sl="+loginName,
            success: function (data, status, xhr) {
            	$.analyzeQuesData(data, status, xhr, firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
	
}
$.analyzeQuesData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $(".ques").empty();
        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            var item = "";
            $.each(data.result.content, function (entryIndex, entry) {
            	var time = entry.fillTime;
            	var mainTitle = entry.mainTitle.substring(0,40);
            	item += "<li class=\"clearfix\"><a target=\"_blank\" href=\" "+firUrl+"/qteUserAnswer/qteUserAnswerDetail?mainId= "+entry.mainId+"  \" style=\"color:#E27925;width: 74%;\">"+mainTitle+"</a><span style=\"color:#E27925;\">"+time+"</span></li>";
            });
            $("#quesPageNum").val(data.result.pageInfo.currentPage);
            $("#questotalPages").val(data.result.pageInfo.totalPages);
            $(".ques").append(item);
            $.setQuesBtn(firUrl);
        }

    }
}



/////////////////网上测评///////////////////////////////////////////

$.setCpqBtn = function (firUrl) {
    $(".cpqprepage").click(function () {
        var nowpage = parseInt($("#cpqPageNum").val());
        if (nowpage > 1) {
            var topage = nowpage - 1;
            $.getCpqData(firUrl, "&pageSize=5&pageNum=" + topage);
        }
    });

    $(".cpqnextpage").click(function () {
        var nextpage = parseInt($("#cpqPageNum").val()) + 1;
        if (nextpage <= parseInt($("#cpqtotalPages").val()))
            $.getCpqData(firUrl, "&pageSize=5&pageNum=" + nextpage);
    });
}

$.getCpqData = function (firUrl, paging) {
	var loginName=$.getLoginName(firUrl); 
	var otherData = "";
    if (firUrl != "") {
        $.ajax({
        	url: firUrl + "/basicCrud/cpqWorkflow/page",
            type: 'post',
            dataType:'json',
            data: paging + "&handlerLoginname_sl="+loginName+"&status=tmbk&sort=handleTime desc",
            success: function (data, status, xhr) {
            	$.analyzeCpqData(data, status, xhr, firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
}

$.getCpqMain=function(id){
	var cpqMain;
	$.ajax({
    	url: getBasePath() + "/basicCrud/cpqMain/get/"+id+"",
        type: 'post',
        dataType:'json',
        async:false,
        success: function (data, status, xhr) {
        	cpqMain=data.result;
        },
        error: function () {
            alert("对不起！你的请求出现异常，请联系服务人员！");
        }
    });
	return cpqMain;
}


$.analyzeCpqData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $(".cpq").empty();
        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            var item = "";
            $.each(data.result.content, function (entryIndex, entry) {
            	var handleTime=entry.handleTime;
            	var cpqMain=$.getCpqMain(entry.cpqId);
            	item += "<li class=\"clearfix\"><a href=\""+firUrl+"/cpqQuestion/toCpqQuestionEidt?id="+entry.cpqId+"\" style=\"color:#E27925;\">"+cpqMain.cpqName+"</a><span style=\"color:#E27925;\">"+handleTime+"</span></li>";
            });
            $("#cpqPageNum").val(data.result.pageInfo.currentPage);
            $("#cpqtotalPages").val(data.result.pageInfo.totalPages);
            $(".cpq").append(item);
            $.setQuesBtn(firUrl);
        }

    }
}


///////////////////////////////////////////投诉/////////////////////////////////////

$.setCptBtn = function (firUrl) {
    $(".cptprepage").click(function () {
        var nowpage = parseInt($("#cptPageNum").val());
        if (nowpage > 1) {
            var topage = nowpage - 1;
            $.getCpqData(firUrl, "&pageSize=5&pageNum=" + topage);
        }
    });

    $(".cptnextpage").click(function () {
        var nextpage = parseInt($("#cptPageNum").val()) + 1;
        if (nextpage <= parseInt($("#cpttotalPages").val()))
            $.getCpqData(firUrl, "&pageSize=5&pageNum=" + nextpage);
    });
}

$.getCptData = function (firUrl, paging) {
	var otherData = "";
	var loginName=$.getLoginName(firUrl); 
    if (firUrl != "") {
        $.ajax({
        	url: firUrl + "/basicCrud/cptComplaint/page",
            type: 'post',
            dataType:'json',
            data: paging + "&sort=createTime desc&loginName_sl="+loginName,
            success: function (data, status, xhr) {
            	$.analyzeCptData(data, status, xhr, firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
	
}
$.analyzeCptData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $(".cpt").empty();
        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            var item = "";
            $.each(data.result.content, function (entryIndex, entry) {
            	var time = entry.createTime;
            	var cptTitle = entry.cptTitle.substring(0,50);
            	item += "<li class=\"clearfix\"><a target=\"_blank\" href=\" "+firUrl+"/cptComplaint/cptComplaintDetail?id= "+entry.id+"  \" style=\"color:#E27925;\">"+cptTitle+"</a><span style=\"color:#E27925;\">"+time+"</span></li>";
            });
            $("#cptPageNum").val(data.result.pageInfo.currentPage);
            $("#cpttotalPages").val(data.result.pageInfo.totalPages);
            $(".cpt").append(item);
            $.setCptBtn(firUrl);
        }

    }
}





