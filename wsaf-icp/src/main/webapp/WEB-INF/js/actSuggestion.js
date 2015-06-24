
/**
 * 处理分页
 */
$.setPage = function (result) {
    if (result.pageInfo != null) {
        var _pageinfo = result.pageInfo;
        var nowcount = $(".table_1").find(".tableItem");

        if (_pageinfo.pageSize > nowcount.length) {
            var minMum = _pageinfo.pageSize - nowcount.length, len = $(".table_1 .tit").children("td").length;

            for (var i = 0; i < minMum; i++) {
                var con = "<tr class=\"tableItem\">";
                for (var j = 0; j < len; j++) {
                    con += "<td>&nbsp;</td>";
                }
                $(".table_1").append(con + "</tr>");
            }
        }

        $(".tfoot span:first-child").text("共" + _pageinfo.totalRecord + "条记录，当前显示1-" + nowcount.length + "条");

        var _menu = "<li>Pages:" + _pageinfo.currentPage + "/" + _pageinfo.totalPages + "<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\"" + _pageinfo.totalPages + "\" step=\"1\" class=\"input_tiny\" />";
        _menu += " <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";

        var pageStyle = "";
        if (_pageinfo.totalPages > 7) {
            if (_pageinfo.currentPage <= 1) {
                pageStyle += "<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>" + _pageinfo.totalPages + "</a></li>";
            }
            else {
                var pa = _pageinfo.currentPage - 1;
                pb = _pageinfo.currentPage + 1;
                pc = _pageinfo.currentPage + 2;
                pd = _pageinfo.currentPage + 2;
                pageStyle += "<li ><a class=\"topage\">" + pa + "</a></li> <li><a class=\"selected\">" + _pageinfo.currentPage + "</a></li> <li><a class=\"topage\">" + pb + "</a></li> <li><a class=\"topage\">" + pc + "</a></li> <li><a class=\"topage\">" + pd + "</a></li> <li><a>...</a></li> <li><a>" + _pageinfo.totalPages + "</a></li>";

            }
        }
        else {
            for (var j = 1; j <= _pageinfo.totalPages; j++) {
                if (j == _pageinfo.currentPage) {
                    pageStyle = "<li class=\"selected\"><a>" + j + "</a></li>" + pageStyle;

                }
                else {
                    pageStyle = "<li><a class=\"topage\">" + j + "</a></li>" + pageStyle;

                }
            }
        }

        _menu += pageStyle + "<li><a class=\"prepage\">&lt;&lt;</a></li>";
        $("ul.pager li").remove();
        $("ul.pager").append(_menu);
    }
}
/**
 * 解析Table
 */


$.analyzeTableData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $("tr.tableItem").remove();

        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            var nowTime = new Date();
            var yyyy = nowTime.getFullYear();
            var MM = nowTime.getMonth();
            MM = parseInt(MM)+1;
            if(MM<10){MM="0"+MM;}
            var day = nowTime.getDate();
            if(day<10){day="0"+day;}
            nowTime = yyyy+"-"+MM+"-"+day;
            var loginName = $("#loginName").val();
            $("tr.tableItem").remove();
            $.each(data.result.content, function (entryIndex, entry) {
            	var canSug = checkSug(entry.id,loginName,firUrl);
            	tableItem = "<tr class=\"tableItem\">";
            	tableItem += "<td class=\" t_c\">" + entry.name +
            	"</td><td class=\" t_c\"><label class=\"category"+entry.id+"\" ></label></td>" +
                "<td class=\" t_c\">" + entry.createTime+"</td>" +
                "<td class=\" t_c\">" + entry.startTime + "</td>" +
                "<td class=\" t_c\">" + entry.endTime+"</td>" +
                "<td class=\" t_c\">" + entry.creater+"</td>" +
                "<td class=\" t_c\">" + entry.deptName+"</td>" ;
//                if(entry.endTime>nowTime && canSug == true){
            	if(canSug == true){
                	tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/actSuggestion/actSuggestionEdit?ctId="+entry.id+"  \" >提出意见</a>";
                }else{
//                	fbView(entry.id,firUrl);
                	tableItem += "<td class=\"t_c\"><a target=\"_blank\" class=\"mr_5\" href=\"  "+firUrl+"/actSuggestion/actSuggestionView?ctId="+entry.id+"  \">查看意见</a>" +
                			"<a target=\"_blank\" class=\"mr_5\" style=\" cursor :pointer;\"  onclick = \"fbView("+entry.id+",'"+firUrl+"');\" >查看反馈</a>";
                }
            	tableItem += "</td></tr>";
	           	$(".table_1").append(tableItem);
	           	if(entry.colCategory=="partyCategory"){
            		$(".category"+entry.id).append('党群类');
            	}
                if(entry.colCategory=="manageCategory"){
            		$(".category"+entry.id).append('管理类');
            	}
                if(entry.colCategory=="technologCategory"){
            		$(".category"+entry.id).append('技术类');
            	}
                if(entry.colCategory=="specialCategory"){
            		$(".category"+entry.id).append('专题类');
            	}
	           	
            });
            $.setPage(data.result);
        }

    }
}



/**
 * 检查是否可以查看反馈
 */
function fbView(ctId,firUrl){
	var loginName = $("#loginName").val();
	$.ajax({
        url: firUrl+"/actSuggestion/findByCtIdAndLoginName",
        type: 'post',
        async:false,
        dataType:'json',
        data: "ctId="+ctId+"&loginName="+loginName,
        success: function (data, status, xhr) {
	        	if(data.success==true){
		        	 if (data.result.fbTitle!=null) {
		        		 window.open(firUrl+"/actSuggestion/actSuggestionView?fbcheck=true&ctId= "+ctId);
		        	 }else if(data.result.fbTitle==null){
		        		 alert("没有反馈信息！");
		        	 }
	        	}
	        },
	        error: function () {
	            //alert("\\\\\\");
	        }
	    });
	
	return false;
}
/**
 * 检查是否可以评价
 * @param id 
 * @param loginName
 * @param firUrl
 * @returns {Boolean}
 */

function checkSug(id,loginName,firUrl){
	
	var can=false;
	$.ajax({
        url: firUrl+"/actSuggestion/findByCtIdAndLoginName",
        type: 'post',
        async:false,
        dataType:'json',
        data: "&ctId="+id+"&loginName="+loginName,
        success: function (data, status, xhr) {
	        	if(data.success==true){
		        	 if (data.result == null) {
		        		     can = true;
		        	 }else{
		        		 can = false;
		        	 }
	        	}
	        },
	        error: function () {
	            //alert("\\\\\\");
	        }
	    });
	return can;
}



/**
 *  查询列表
 */
$.postSearchForm = function (firUrl, paging) {
    var otherData = "";
    if (firUrl != "") {
    	var name=$("#name").val();
    	var loginName=$("#loginName").val();
    	var data;
    	if(typeof(name)=="undefined" || name==""){
    		data=paging+"&hql= and o.endTime> sysdate and (o.participant is null or o.participant like :participant_sl)";
    		data+=" and o.isOpend='yes' order by o.createTime desc&participant_sl="+loginName+"";
    	}else{
    		data=paging+"&hql= and o.endTime> sysdate and (o.participant is null or o.participant like :participant_sl)";
    		data+=" and o.isOpend='yes' and o.name like :name_sl order by o.createTime desc&participant_sl="+loginName+"&name_sl="+name;
    	}
    	
        $.ajax({ 
            url: firUrl + "/basicCrud/actTheme/page2",
            type: 'post',
            dataType:'json',
            data:data, 
            success: function (data, status, xhr) {
                $.analyzeTableData(data, status, xhr, firUrl);
                $.setBtn(firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
}
$.setBtn = function (firUrl) {
    $(".topage").click(function () {
        $.postSearchForm(firUrl, "&pageSize=10&pageNum=" + $(this).text());
    });

    $(".prepage").click(function () {
        var nowpage = parseInt($(".selected a").text());

        if (nowpage > 1) {
            var topage = nowpage - 1;
            $.postSearchForm(firUrl, "&pageSize=10&pageNum=" + topage);
        }
    });

    $(".nextpage").click(function () {
        var nextpage = parseInt($(".selected a").text()) + 1;

        if (nextpage <= parseInt($("#gopage").attr("max")))
            $.postSearchForm(firUrl, "&pageSize=10&pageNum=" + nextpage);

    });


    $("#gopagebtn").click(function () {
        var topage = parseInt($("#gopage").val());

        if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
            $.postSearchForm(firUrl, "&pageSize=10&pageNum=" + topage);
        }
        else {
            alert("超出索引值");
        }
    });
}
/**
 * 新增保存
 */
$.postSaveMain = function (Url, formName, otherData, toUrl) {
    var _data = $("#" + formName).serialize();
    if (Url != "") {
        $.ajax({
        	 async: false,
            url: Url + "/basicCrud/actSuggestion/save",
            type: 'post',
            dataType : 'json',
            data: _data + otherData,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
//                        if (toUrl != "")
//                        location.href = Url + toUrl + "?id=" + data.result.id+"&ctId="+data.result.ctId;
                    }
                    else {
                        alert("操作失败");
                    }
                }
                else {
                    alert("操作失败");
                }

            }
        });
    }

}
/**
 * 新增时判断文本框内容不能为空
 */
$.validateForm = function () {
    var _return = "";
    
    if ($("#content").val() == "" || $("#content").val() == null) {

        _return += "\r\意见内容不能为空";
    }

    return _return;
}
$.validatefbForm = function () {
    var _return = "";
    
    if ($("#fbTitle").val() == "" || $("#fbTitle").val() == null) {

        _return += "\r\反馈标题不能为空";
    }
    if ($("#fbContent").val() == "" || $("#fbContent").val() == null) {

        _return += "\r\反馈内容不能为空";
    }

    return _return;
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


$.postMainDetail = function (firUrl, ctId,id) {
    if (firUrl != "") {
    	if(ctId!=""){
    		 ctId=parseInt(ctId);
    		 $.ajax({
    	            
    	            url: firUrl + "/basicCrud/actTheme/get/" + ctId,
    	            dataType :'json',
    	            type: 'post',
    	            success: function (data, status, xhr) {

    	                if (status == "success" && data != null) {
    	                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
    	                        var entry = data.result;
    	                        $("#name").append(entry.name);
    	                        $("#colCategory").val(entry.colCategory);
    	                        $("#themecontent").append(entry.content);
    	                    }
    	                    if(entry.id !=null){
    	                    	$("#id").val(entry.id);
    	                    }
    	                }
    	            },
    	            error: function () {
    	                alert("对不起！你的请求出现异常，请联系服务人员！");
    	            }
    	        });
    	}
       
        if(id!=""){
        	id=parseInt(id);
	        $.ajax({
	            
	            url: firUrl + "/basicCrud/actSuggestion/get/" + id,
	            dataType :'json',
	            type: 'post',
	            success: function (data, status, xhr) {
	
	                if (status == "success" && data != null) {
	                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
	                        var entry = data.result;
	                        $("#content").val(entry.content);
	                    }
	                    if(entry.id !=null){
	                    	$("#id").val(entry.id);
	                    }
	                }
	            },
	            error: function () {
	                alert("对不起！你的请求出现异常，请联系服务人员！");
	            }
	        });
        }
    }     
}
/**
 * 查看页面获得THEME信息
 */
$.postMainDetailView = function (firUrl, ctId) {
    if (firUrl != "") {
    	ctId=parseInt(ctId);
        $.ajax({
            
            url: firUrl + "/basicCrud/actTheme/get/" + ctId,
            dataType :'json',
            type: 'post',
            success: function (data, status, xhr) {

                if (status == "success" && data != null) {
                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
                        var entry = data.result;
                        $("#name").append(entry.name);
                        $("#colCategory").val(entry.colCategory);
                        $("#isOpend").val(entry.isOpend);
                        $("#themecontent").val(entry.content);
                        $("#endTime").append(entry.endTime);
                        $("#startTime").append(entry.startTime);
                        //alert()
                        var person=eval('('+entry.participant+')');
                        var personCn=[];
                        for(var key in person){	
                        	personCn.push(person[key]);
                        }
                        $("#participant_cn").val(personCn.join(","));
                        $("#participant").append(entry.participant);
                    }
                    
                }
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
        
    }     
}
$.postFeedbackView = function (firUrl, paging) {
    var otherData = "";
    if (firUrl != "") {
        $.ajax({
            
            url: firUrl + "/basicCrud/actSuggestion/page",
            type: 'post',
            dataType:'json',
            data: $("#actSuggestionForm").serialize() + paging + "&sort=createTime desc",
            success: function (data, status, xhr) {
                $.analyzeFeedbackData(data, status, xhr, firUrl);
                $.setBtnView(firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
}

$.analyzeFeedbackData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $("tr.tableItem").remove();
        $("tr.Item").remove();

        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            $.each(data.result.content, function (entryIndex, entry) {
            	 
            	tableItem = "<tr class=\"tableItem\" style=\"\"><td colspan=\"4\" style=\" background-color:#f5f5f5;\"></td></tr>";
                tableItem += "<tr class=\"Item\"><td class=\"t_r\">提出人</td><td>"+entry.suggester+"</td><td class=\"t_r\">提出部门</td><td >"+entry.deptName+"</td></tr>" + 
                             "<tr class=\"Item\"><td class=\"t_r\">提出时间</td><td>"+entry.createTime+"</td><td ></td><td><input type=\"button\" value=\"反 馈\" onclick=\"open_back("+entry.id+");\" /></td></tr>"+
                             "<tr class=\"Item\"><td class=\"t_r\">意见内容</td><td colspan=\"3\"><textarea  rows=\"5\" disabled=\"disabled\">"+entry.content+"</textarea></td></tr>";
                	
                $(".table_1").append(tableItem);
            });
            $.setPageView(data.result);
        }

    }
}
$.setPageView = function (result) {
    if (result.pageInfo != null) {
        var _pageinfo = result.pageInfo;
        var nowcount = $(".table_1").find(".tableItem");

        if (_pageinfo.pageSize > nowcount.length) {
            var minMum = _pageinfo.pageSize - nowcount.length, len = $(".table_1 .tit").children("td").length;

            for (var i = 0; i < minMum; i++) {
                var con = "<tr class=\"tableItem\">";
                for (var j = 0; j < len; j++) {
                    con += "<td>&nbsp;</td>";
                }
                $(".table_1").append(con + "</tr>");
            }
        }

        $(".tfoot span:first-child").text("共" + _pageinfo.totalRecord + "条记录，当前显示1-" + nowcount.length + "条");

        var _menu = "<li>Pages:" + _pageinfo.currentPage + "/" + _pageinfo.totalPages + "<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\"" + _pageinfo.totalPages + "\" step=\"1\" class=\"input_tiny\" />";
        _menu += " <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";

        var pageStyle = "";
        if (_pageinfo.totalPages > 7) {
            if (_pageinfo.currentPage <= 1) {
                pageStyle += "<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>" + _pageinfo.totalPages + "</a></li>";
            }
            else {
                var pa = _pageinfo.currentPage - 1;
                pb = _pageinfo.currentPage + 1;
                pc = _pageinfo.currentPage + 2;
                pd = _pageinfo.currentPage + 2;
                pageStyle += "<li ><a class=\"topage\">" + pa + "</a></li> <li><a class=\"selected\">" + _pageinfo.currentPage + "</a></li> <li><a class=\"topage\">" + pb + "</a></li> <li><a class=\"topage\">" + pc + "</a></li> <li><a class=\"topage\">" + pd + "</a></li> <li><a>...</a></li> <li><a>" + _pageinfo.totalPages + "</a></li>";

            }
        }
        else {
            for (var j = 1; j <= _pageinfo.totalPages; j++) {
                if (j == _pageinfo.currentPage) {
                    pageStyle = "<li class=\"selected\"><a>" + j + "</a></li>" + pageStyle;

                }
                else {
                    pageStyle = "<li><a class=\"topage\">" + j + "</a></li>" + pageStyle;

                }
            }
        }

        _menu += pageStyle + "<li><a class=\"prepage\">&lt;&lt;</a></li>";
        $("ul.pager li").remove();
        $("ul.pager").append(_menu);
    }
}
$.setBtnView = function (firUrl) {
    $(".topage").click(function () {
        $.postFeedbackView(firUrl, "&pageSize=5&pageNum=" + $(this).text());
    });

    $(".prepage").click(function () {
        var nowpage = parseInt($(".selected a").text());

        if (nowpage > 1) {
            var topage = nowpage - 1;
            $.postFeedbackView(firUrl, "&pageSize=5&pageNum=" + topage);
        }
    });

    $(".nextpage").click(function () {
        var nextpage = parseInt($(".selected a").text()) + 1;

        if (nextpage <= parseInt($("#gopage").attr("max")))
            $.postFeedbackView(firUrl, "&pageSize=5&pageNum=" + nextpage);

    });


    $("#gopagebtn").click(function () {
        var topage = parseInt($("#gopage").val());
        if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
            $.postSearchForm(firUrl, "&pageSize=5&pageNum=" + topage);
        }
        else {
            alert("超出索引值");
        }
    });
}

$.getFileInfo = function(firUrl,otherdata){
    if(firUrl!="")
       { 
        $.ajax({
//              async: false,
                url : firUrl+"/basicCrud/attach/all?"+otherdata,
                type : 'post',
                dataType:'json',
                success: function(data, status, xhr) {
                        if (data.success == true ) 
                        {   
                            $("#tbfj tbody tr").remove();
                            $.each(data.result, function (entryIndex, entry) {
                            	id=parseInt(entry.id);
                            	$("#tbfj tbody").append("<tr name=\""+entry.id+"\"><td>"+entry.fileName+"</td><td>"+entry.fileSize+"</td><td>"+entry.uploadDate+"</td><td><a href=\" "+firUrl+"/attach/api/download/"+id+"\">下载</a></td></tr>");
                           });
                        }
                }
        });
       }
}


