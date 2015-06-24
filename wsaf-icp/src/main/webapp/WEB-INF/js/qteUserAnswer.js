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
$.canAnswer = function(firUrl,mainId,loginName){
	var canAns = true;
	if(firUrl!=""){
		$.ajax({
			url:firUrl+"/qteUserMain/findByMainIdAndLoginName?mainId="+mainId+"&loginName="+loginName,
			async:false,
			type:"post",
			dataType:"json",
			success : function(data){
				if(data.success==true&&data.result!=null){
					canAns = false;
				}
			}
		});
	}
	return canAns;
}
/**
 * 解析Table
 */

$.analyzeTableData = function (data, status, xhr, firUrl,loginName) {
    if (status == "success" && data != null) {
        $("tr.tableItem").remove();
        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            var count = "";
            $.each(data.result.content, function (entryIndex, entry) {
            	count = $.getCount(firUrl,entry.id);
            	var can = $.canAnswer(firUrl,entry.id,loginName);
                tableItem = "<tr class=\"tableItem\">";
                tableItem += "<td class=\" t_c\">" + entry.title +"</td>" +
		                	"<td class=\" t_c\">" + entry.creator+"</td>" +
		                    "<td class=\" t_c\">" + entry.startTime + "</td>" +
		                    "<td class=\" t_c\">" + entry.endTime+"</td>" +
		                    "<td class=\" t_c\">" + count +"</td>" ;
                if(can==true){
                	tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/qteUserAnswer/qteUserAnswerEdit?mainId= "+entry.id+"  \">开始考试</a>";
                    
                }else{
                	tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/qteUserAnswer/qteUserAnswerDetail?mainId= "+entry.id+"  \">查看答题记录</a>";
                    
                }
                	
                tableItem += "</td></tr>";
                $(".table_1").append(tableItem);
            });
            $.setPage(data.result);
        }
    }
}

$.getCount = function(firUrl,id){
	var count="0";
	$.ajax({
		async:false,
		url:firUrl+"/qteComplexInfo/findCountByMainId/"+id,
		dataType :"json",
		type:"post",
		success:function(data){
			if(data.success==true){
				count=data.result;
			}
			else{
				alert("对不起！你的请求出现异常，请联系服务人员！");
			}
		},
		error: function () {
            alert("对不起！你的请求出现异常，请联系服务人员！");
        }
	});
	
	
	return count;
	
}

//获取当前用户信息
$.getCurrentUser=function(){
	var curUser;
	$.ajax({
		url:getBasePath()+'/ca/getCookies',
		type:'POST',
		dataType:'json',
		async:false,
		success:function(data){
			curUser=data;
		}
	});
	return curUser;
}


/**
 * 查询列表,将当前用户可以参与的问卷查询出来
 */
$.postSearchForm = function (firUrl, paging,loginName) {
	var otherData = "";
	var data;
    if (firUrl != "") {
    	var title=$("#title").val();
    	if(typeof(title)=="undefined" || title==""){
    		data=paging+"&hql= and (o.participants is null or o.participants like :participants_sl)"
            data+=" and status=:status order by o.createTime desc&participants_sl="+loginName+"&status=pass";
    	}else{
    		data=paging+"&hql= and (o.participants is null or o.participants like :participants_sl) and o.title like :title_sl"
            data+=" and status=:status order by o.createTime desc&participants_sl="+loginName+"&title_sl="+title+"&status=pass";
    	}
        $.ajax({
            url: firUrl + "/basicCrud/qteMain/page2",
            type: 'post',
            dataType:'json',
            data: data,
            success: function (data, status, xhr) {
            	$.analyzeTableData(data, status, xhr, firUrl,loginName);
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



$.getMainName = function(firUrl,mainId){
	$.ajax({
		url : firUrl+"/qteComplexInfo/findMainDetailByMainId/"+mainId,
		type:"post",
		dataType:"json",
		success:function(data){
			var mTitle = "";
			var groupId = "";
			if(data.success==true && JSON.stringify(data.result) != "[]" ){
				$.each(data.result,function(entryIndex, entry){
					$("#mTitle").empty();
					$("#mTitle").append(entry.mTilte);
				});
			}
		}
	});
}
$.groupHasItem = function(firUrl,mainId,groupId){
	var has = false;
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/qteQuestion/findByMainIdAndGroupId?mainId="+mainId+"&groupId="+groupId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (JSON.stringify(data.result) != "[]") {
					has = true;
				}
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
	
	return has;
}

$.getGroupByMainId = function(firUrl,mainId){
	var item = "";
	var groupId = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				
				if (data.success == true && JSON.stringify(data.result) != "[]") {
					$.each(data.result, function (entryIndex, entry) {
						var has = $.groupHasItem(firUrl,mainId,entry.id);
						if(has==true){
							if(entry.id!=groupId){
								item += "<div class=\"L_08\"><h4>"+entry.name+"</h4></div>";
								groupId = entry.id;
							}
							
							item += $.getRadioQuestionByGroupId(firUrl,entry.id,mainId,"radio");
							item += $.getMultiChoiceQuestionByGroupId(firUrl,entry.id,mainId,"multiChoice");
							item += $.getFullQues(firUrl,mainId,entry.id,"fill");
							item += $.getQuesQues(firUrl,mainId,entry.id,"ques");
						}
					});
				}
				
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
		$(".mainQuest").append(item);
	}
}

$.getRadioQuestionByGroupId = function(firUrl,groupId,mainId,quesType){
	var quesId = "";
	var quesItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findMainDetailByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true) {
					
					$.each(data.result, function (entryIndex, entry) {
						if(entry.gId ==groupId&&entry.quesType == quesType){
								if(entry.quId!=quesId){
									quesItem += "<div class=\"m10\"><div class=\"pl18 pt10 mlr10 mb10\">";
									if(entry.isDisplay == "true"){
										quesItem += " <label class=\"plr8 num \" >"+entry.quesOrders+"</label >" ;
									}else{
									}
									
									quesItem += "<label class=\"ml_5\">"+entry.quContent+"(单选题)</label>";
									quesId = entry.quId;
									quesItem += $.getRadioOptionByQid(firUrl,entry.quId,mainId);
								}
						}
					});
				}
				
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
	return quesItem;
}
$.getMultiChoiceQuestionByGroupId = function(firUrl,groupId,mainId,quesType){
	var quesId = "";
	var quesItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findMainDetailByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true) {
					
					$.each(data.result, function (entryIndex, entry) {
						if(entry.gId ==groupId&&entry.quesType == quesType){
								if(entry.quId!=quesId){
									quesItem += "<div class=\"m10\"><div class=\"pl18 pt10 mlr10 mb10\">";
									if(entry.isDisplay == "true"){
										quesItem += " <label class=\"plr8 num \" >"+entry.quesOrders+"</label >";
									}
									quesItem += "<label class=\"ml_5\">"+entry.quContent+"(多选题)</label>";
									quesId = entry.quId;
									quesItem += $.getMultiChoiceOptionByQid(firUrl,entry.quId,mainId);
								}
						}
					});
				}
				
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
	return quesItem;
}

$.getFullQues = function(firUrl,mainId,groupId,quesType){
	var fillItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteQuestion/findByMainIdAndGroupId?mainId="+mainId+"&groupId="+groupId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if(data.success == true){
					$.each(data.result,function(itemIndex,item){
						if(item.quesType==quesType){
							fillItem += "<div class=\"m10\"><div class=\"pl18 pt10 mlr10 mb10\">";
							fillItem += "<label class=\"plr8 num \" >"+item.quesOrders+"</label >"+
		                           	      " <label class=\"ml_5\"> "+item.quesContent+"(问答题)</label>"+
		                           	       "<div class=\"pl18 pt10 mlr10\" >"+
		                           	        "  <textarea quesId=\""+item.id+"\" optionId=\"\" class=\"fill\" rows=\"3\"    \></textarea>"+
		                           	       "</div>";
							fillItem += " </div></div>";
		                           	 
						}
						else{
							
						}
					});
				}
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
	
	return fillItem;
}

$.getQuesQues = function(firUrl,mainId,groupId,quesType){
	var quesItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteQuestion/findByMainIdAndGroupId?mainId="+mainId+"&groupId="+groupId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if(data.success == true){
					$.each(data.result,function(itemIndex,item){
						if(item.quesType==quesType){
							quesItem += "<div class=\"m10\"><div class=\"pl18 pt10 mlr10 mb10\">";
							quesItem += "<label class=\"plr8 num \" >"+item.quesOrders+"</label >"+
		                           	    "<label class=\"ml_5\"> "+item.quesContent+"(填写题)</label>"+
		                           	    "<div class=\"pl18 pt10 mlr10\" >"+
		                           	        "<textarea quesId=\""+item.id+"\" optionId=\"\" class=\"fill\" rows=\"3\" \></textarea>"+
		                           	       "</div>";
							quesItem += " </div></div>";
		                           	 
						}
						else{
							
						}
					});
				}
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
	
	return quesItem;
}

$.getRadioOptionByQid = function(firUrl,quId,mainId){
	var optionItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findMainDetailByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true) {
					optionItem += "<div class=\"pl18 pt10 mlr10 radioAnswer\"  >";
					$.each(data.result, function (entryIndex, entry) {
						if(entry.quId ==quId){
							optionItem += "<label class=\"pl18\" ><input  quesId=\""+entry.quId+"\" optionId=\""+entry.opId+"\" class=\"pl18 answer\" type=\"radio\" name=\""+entry.quId+"\" value=\"A\">"+entry.code+"."+entry.value+"</label>";
						}
					});
				}
				
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
//	alert(quId);
	optionItem += "</div></div></div>";
	return optionItem;
}

$.getMultiChoiceOptionByQid = function(firUrl,quId,mainId){
	var optionItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findMainDetailByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true) {
					optionItem += "<div class=\"pl18 pt10 mlr10 multiChoiceAnswer\" >";
					$.each(data.result, function (entryIndex, entry) {
						if(entry.quId ==quId){
							optionItem += "<label class=\"pl18\" ><input quesId=\""+entry.quId+"\" optionId=\""+entry.opId+"\" class=\"pl18 answer\" type=\"checkbox\" name=\""+entry.quId+"\" value=\"A\">"+entry.code+"."+entry.value+"</label>";
						}
					});
				}
				
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
//	alert(quId);
	optionItem += "</div></div></div>";
	return optionItem;
}


$.saveRadioAnswer = function(firUrl,mainId){
	if(firUrl != null){
		var count = $(".mainQuest").find(".radioAnswer .answer"); 
		$(".mainQuest .radioAnswer .answer").each(function(index,indexItem){
			var quesId = $(this).attr("quesId");
			var optionId = $(this).attr("optionId");
			if($(this).attr("checked")){
				$.saveUserAnswer(firUrl,mainId,quesId,optionId,"");
				
			}
		});
	}
}

$.saveMultiChoiceAnswer = function(firUrl,mainId){
	if(firUrl != null){
		var count = $(".mainQuest").find(".multiChoiceAnswer .answer"); 
		$(".mainQuest .multiChoiceAnswer .answer").each(function(index,indexItem){
			var quesId = $(this).attr("quesId");
			var optionId = $(this).attr("optionId");
			if($(this).attr("checked")){
				$.saveUserAnswer(firUrl,mainId,quesId,optionId,"");
				
			}
		});
	}
}

$.saveTextAnswer = function(firUrl,mainId){
	if(firUrl != null){
		var count = $(".mainQuest").find(".fill"); 
		$(".mainQuest .fill").each(function(index,indexItem){
			var quesId = $(this).attr("quesId");
			var answerTxt = $(this).val();
		    $.saveUserAnswer(firUrl,mainId,quesId,"",answerTxt);
				
		});
	}
}


$.saveUserAnswer = function(firUrl,mainId,questId,optionId,answerTxt){
	if(firUrl!=""){
		var loginName = $("#loginName").val();
		var deptId = $("#deptId").val();
		var data = "loginName="+loginName+"&deptId="+deptId+"&questId="+questId+"&optionId="+optionId+"&answerTxt="+answerTxt;
		$.ajax({
			async: false,
			url: firUrl+"/basicCrud/qteUserAnswer/save",
			data: data,
			type:"post",
			dataType:"json",
			success : function(data){
				if(data.success==true){
				}
			}
			
		});
	}
}
$.saveUserMain = function(firUrl,mainId){
	if(firUrl!=""){
		var fillTime = new Date().getTime();
		var loginName = $("#loginName").val();
		var mainTitle = $("#mTitle").text();
		var data = "loginName="+loginName+"&fillTime="+fillTime+"&mainTitle="+mainTitle+"&mainId="+mainId;
		$.ajax({
			url:firUrl+"/basicCrud/qteUserMain/save",
			data:data,
			async:false,
			type:"post",
			dataType:"json",
			success : function(data){
				if(data.success==true){
				}
			}
			
		});
	}
	
}





$.getRadioAnswerDetail = function(firUrl,loginName){
	var count = $(".mainQuest").find(".answer"); 
	
	$(".mainQuest .answer").each(function(index,indexItem){
		var questId = $(this).attr("quesId");
		var optionId = $(this).attr("optionId");
		var data = "questId="+questId+"&optionId="+optionId+"&loginName="+loginName;
		var one = $.getOneAnser(firUrl,data);
		if(one==true){
			$(this).attr("checked",true);
		}
		
	});
}
$.getOneAnser = function(firUrl,data){
	var one = false;
	$.ajax({
		url:firUrl+"/qteUserAnswer/findQteUserAnswer",
		data:data,
		async:false,
		type:"post",
		dataType:"json",
		data:data,
		success : function(data){
			if(data.success==true && data.result!=null){
				one = true;
			}
		}
	});
	return one;
}

$.getFillAnswerDetail = function(firUrl,loginName){
    var count = $(".mainQuest").find(".fill"); 
	var text = "";
	$(".mainQuest .fill").each(function(index,indexItem){
		var questId = $(this).attr("quesId");
		var data = "questId="+questId+"&loginName="+loginName;
		$.ajax({
			url:firUrl+"/qteUserAnswer/findQteUserAnswer",
			data:data,
			async:false,
			type:"post",
			dataType:"json",
			data:data,
			success : function(data){
				if(data.success==true && data.result!=null){
					text = data.result.answerTxt;
				}
			}
		});
		$(this).val(text);
		
	});
}





