$.getGroup = function(firUrl,mainId){
	if(firUrl != ""){
		$.ajax({
			url:firUrl+"/qteComplexInfo/findByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				var option = "";
				if (data.success == true && JSON.stringify(data.result) != "[]") {
					$.each(data.result, function (entryIndex, entry) {
						option += "<option value=\""+entry.id+"\">"+entry.name+"</option>";
					});
				}
				$("#groupId").append(option);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
}
$.getMainNameForAdd = function(firUrl,mainId){
	$.ajax({
		async:false,
		url:firUrl+"/basicCrud/qteMain/get/"+mainId,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.success==true){
				$("#title").append(data.result.title);
			}
		},
		error:function(){
			
		}
	
		
	});
}
$.validateForm = function () {
    var _return = "";
    if ($("#quesType").val() == "" || $("#quesType").val() == null) {
        _return += "\r\n请选择试题类型";
    }

    if ($("#quesOrders").val() == "" || $("#quesOrders").val() == null) {

        _return += "\r\n题号不能为空";
    }

//    if ($("#isDisplay").val() == "" || $("#isDisplay").val() == null) {
//
//        _return += "\r\n请选择是否显示题号";
//    }
    
    if ($("#groupId").val() == "" || $("#groupId").val() == null) {

        _return += "\r\n试题所属分组不能为空，如没有分组信息请回上级目录设置分组";
    }
    
    if ($("#quesContent").val() == "" || $("#quesContent").val() == null) {

        _return += "\r\n题干内容不能为空";
    }
    return _return;
}
$.postSaveQuestion = function (Url, formName,toUrl) {
    var _data = $("#" + formName).serialize();
    if (Url != "") {
        $.ajax({
        	 async: false,
            url: Url + "/basicCrud/qteQuestion/save",
            type: 'post',
            dataType : 'json',
            data: _data,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
                    	if(data.result.quesType=='radio'){
                    		$.postSaveRadioOption(Url,data.result.id);
                    	}
                    	if(data.result.quesType=='multiChoice'){
                    		$.postSaveMultiChoiceOption(Url,data.result.id);
                    	}
                    	
                        alert("操作成功！");
                        if (confirm("继续添加试题吗？")){
                        	location.href = Url + toUrl;
//                        	location.href = Url + toUrl + "?id=" + data.result.id;
                        }else{
//                        	  window.opener = null;
//                            window.open('', '_self');
                            window.close();
                        }
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

$.postSaveRadioOption = function(firUrl,quesId){
	var scount = $(".table_1").find(".sItem");
	$(".table_1 tbody .sItem").each(function(index,indexItem){
		var code = $(this).children("td").children("#code").val();
		var value = $(this).children("td").children("#value").val();
		var id = $(this).children("td").children("#rid").val();
		var data = "";
		if(id==""){
			data = "quesId="+quesId+"&code="+code+"&value="+value;
		}else{
			data = "quesId="+quesId+"&code="+code+"&value="+value+"&id="+id;//修改
		}
		$.ajax({
			async:false,
			url:firUrl+"/basicCrud/qteOption/save",
			type: 'post',
            dataType : 'json',
            data :data,
            success:function(data){
            	if(data.success==true){
//            		alert('选项添加成功');
            	}
            	
            },
            error:function(){
            	
            	
            }
		});
	});
//	alert(scount.length);
}
$.postSaveMultiChoiceOption = function(firUrl,quesId){
//	var scount = $(".table_1").find(".dItem");
	$(".table_1 tbody .dItem").each(function(index,indexItem){
		var code = $(this).children("td").children("#code").val();
		var value = $(this).children("td").children("#value").val();
		var id = $(this).children("td").children("#mid").val();
		var data = "";
		if(id==""){
			data = "quesId="+quesId+"&code="+code+"&value="+value;
		}else{
			data = "quesId="+quesId+"&code="+code+"&value="+value+"&id="+id;
		}
		 
		$.ajax({
			async:false,
			url:firUrl+"/basicCrud/qteOption/save",
			type: 'post',
            dataType : 'json',
            data :data,
            success:function(data){
            	if(data.success==true){
//            		alert('多选项添加成功');
            	}
            },
            error:function(){
            }
		});
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
							if(item.isDisplay == "true"){
								fillItem += "<label class=\"plr8 num \" >"+item.quesOrders+"</label >";
							}
							fillItem += " <label class=\"ml_5\"> "+item.quesContent+"(问答题)</label>"+
		                           	       "<div class=\"pl18 pt10 mlr10\" >"+
		                           	        "  <textarea  rows=\"3\"   disabled=\"true\" \>"+item.rightAnswer+"</textarea>"+
		                           	       "</div>";
							fillItem += " <div class=\"t_r cz\">"+
		                           	            "<a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionEdit?mainId="+mainId+"&quId="+item.id+"\">修改</a>|<a class=\"m6 del\" style=\" cursor :pointer;\" quesId=\""+item.id+"\">删除</a>|" +
		                           	            		"<a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionDetail?mainId="+mainId+"&quId="+item.id+"\">详情</a>"+
		                           	       "</div></div></div>";
		                           	 
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
							if(item.isDisplay == "true"){
								quesItem += "<label class=\"plr8 num \" >"+item.quesOrders+"</label >";
							}
							
							quesItem +=    " <label class=\"ml_5\"> "+item.quesContent+"(填写题)</label>"+
		                           	       "<div class=\"pl18 pt10 mlr10\" >"+
		                           	        "  <textarea  rows=\"3\"   disabled=\"true\" \>"+item.rightAnswer+"</textarea>"+
		                           	       "</div>";
							quesItem += " <div class=\"t_r cz\">"+
		                           	            "<a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionEdit?mainId="+mainId+"&quId="+item.id+"\">修改</a>|<a class=\"m6 del\" style=\" cursor :pointer;\" quesId=\""+item.id+"\">删除</a>|" +
		                           	            		"<a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionDetail?mainId="+mainId+"&quId="+item.id+"\">详情</a>"+
		                           	       "</div></div></div>";
		                           	 
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
					optionItem += "<div class=\"pl18 pt10 mlr10\" >";
					$.each(data.result, function (entryIndex, entry) {
						if(entry.quId ==quId){
							optionItem += "<label class=\"pl18\" ><input class=\"pl18\" type=\"radio\" name=\"an\" value=\"A\">"+entry.code+"."+entry.value+"</label>";
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
	optionItem += "</div><div class=\"t_r cz\"><a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionEdit?mainId="+mainId+"&quId="+quId+"\">修改</a>|<a class=\"m6 del\" style=\" cursor :pointer;\" quesId=\""+quId+"\">删除</a>|" +
			"<a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionDetail?mainId="+mainId+"&quId="+quId+"\">详情</a></div></div></div>";
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
					optionItem += "<div class=\"pl18 pt10 mlr10\" >";
					$.each(data.result, function (entryIndex, entry) {
						if(entry.quId ==quId){
							optionItem += "<label class=\"pl18\" ><input class=\"pl18\" type=\"checkbox\" name=\"an\" value=\"A\">"+entry.code+"."+entry.value+"</label>";
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
	optionItem += "</div><div class=\"t_r cz\"><a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionEdit?mainId="+mainId+"&quId="+quId+"\">修改</a>|<a class=\"m6 del\" style=\" cursor :pointer;\" quesId=\""+quId+"\">删除</a>|" +
			"<a target=\"_blank\" class=\"m6\" href=\" "+firUrl+"/qteQuestion/qteQuestionDetail?mainId="+mainId+"&quId="+quId+"\">详情</a></div></div></div>";
	return optionItem;
}


$.getQueDetailById = function(firUrl,id){
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/basicCrud/qteQuestion/get/"+id,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true && data != null) {
                    if (data.success == true) {
                        var entry = data.result;
                        $("#quesType").val(entry.quesType);
                        $("#quesOrders").val(entry.quesOrders);
                        $("#isDisplay").val(entry.isDisplay);
                        $("#groupId").val(entry.groupId);
                        $("#quesContent").val(entry.quesContent);
                        $("#rightAnswer").val(entry.rightAnswer);
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
$.getRaOptionDetail = function(firUrl,quesId){
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteOption/findByQuesId?quesId="+quesId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true && data != null) {
					$.each(data.result, function (entryIndex, entry) {
						$(".table_1 tbody .sItem").each(function(index,indexItem){
							var code = $(this).children("td").children("#code").val();
							if(entry.code==code){
								$(this).children("td").children("#value").val(entry.value);
								$(this).children("td").children("#rid").val(entry.id);
							}
						});
					});
                }
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
}
$.getMultiChoiceOptionDetail = function(firUrl,quesId){
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteOption/findByQuesId?quesId="+quesId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true && data != null) {
					$.each(data.result, function (entryIndex, entry) {
						$(".table_1 tbody .dItem").each(function(index,indexItem){
							var code = $(this).children("td").children("#code").val();
							if(entry.code==code){
								$(this).children("td").children("#value").val(entry.value);
								$(this).children("td").children("#mid").val(entry.id);
							}
						});
					});
                }
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
}








