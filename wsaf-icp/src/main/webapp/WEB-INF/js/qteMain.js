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
/**
 * 解析Table
 */
$.analyzeTableData = function (data, status, xhr, firUrl) {
    if (status == "success" && data != null) {
        $("tr.tableItem").remove();
        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            var count = "";
            $.each(data.result.content, function (entryIndex, entry) {
            	count = $.getCount(firUrl,entry.id)
                tableItem = "<tr class=\"tableItem \">";
                tableItem += "<td class=\" t_c\">" + entry.title +"</td>" +
		                	"<td class=\" t_c\">" + entry.creator+"</td>" +
		                    "<td class=\" t_c\">" + entry.startTime + "</td>" +
		                    "<td class=\" t_c\">" + entry.endTime+"</td>" +
		                    "<td class=\" t_c\">" + count +"</td>" +
                			"<td class=\" t_c\"><label class=\"mainType"+entry.id+"\"></label></td>" +
                			"<td class=\" t_c\"><label class=\"status"+entry.id+"\"></label></td>" ;
                
//                if(entry.status=="pass"){
//                	tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5 sat"+entry.id+"\" href=\" javascript:void(0);  \">统计</a>";
//                }
//                if(entry.status=="draf"||entry.status=="deptBack"||entry.status=="lineBack"){
//                	tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5 gr"+entry.id+"\" href=\" "+firUrl+"/qteGroup/qteGroupList?id= "+entry.id+"  \">分组设置</a>"+
//                    "<a target=\"_blank\" class=\"mr_5 q"+entry.id+"\" href=\" "+firUrl+"/qteQuestion/qteQuestionList?id= "+entry.id+" \">试题设置</a>"+
//	                 "<a target=\"_blank\" class=\"mr_5 e"+entry.id+"\" href=\" "+firUrl+"/qteMain/qteMainEdit?id= "+entry.id+"  \" >修改</a>"+
//	                 "<a target=\"_blank\" class=\"mr_5 del delete"+entry.id+"\" style=\" cursor :pointer;\" mainId='"+entry.id+"' >删除</a>"+
//	                 "<a target=\"_blank\" class=\"mr_5 sub"+entry.id+"\" onclick=\"$.submitToDeptAudit('"+firUrl+"',"+entry.id+",'');\" href=\"javascript:void(0);\">提交</a>" ;
//                	
//                }
//                if(entry.status=="inDeptAudit"||entry.status=="inLineAudit"){
//                	 tableItem += "<td class=\" t_c\"><a  >不可操作</a>";
//                }
                
        tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5 gr"+entry.id+"\" href=\" "+firUrl+"/qteGroup/qteGroupList?id="+entry.id+"  \">分组设置</a>"+
                     "<a target=\"_blank\" class=\"mr_5 q"+entry.id+"\" href=\" "+firUrl+"/qteQuestion/qteQuestionList?id="+entry.id+" \">试题设置</a>"+
	                 "<a target=\"_blank\" class=\"mr_5 e"+entry.id+"\" href=\" "+firUrl+"/qteMain/qteMainEdit?id="+entry.id+"  \" >修改</a>"+
	                 "<a target=\"_blank\" class=\"mr_5 del delete"+entry.id+"\" style=\" cursor :pointer;\" mainId='"+entry.id+"' >删除</a>"+
	                 "<a target=\"_blank\" class=\"mr_5 sub"+entry.id+"\" onclick=\"$.submitToDeptAudit('"+firUrl+"',"+entry.id+",'');\" >提交</a>" +
	                 "<a target=\"_blank\" class=\"mr_5 sat"+entry.id+"\" >统计</a>";
                	
                tableItem += "</td></tr>";
                $(".table_1").append(tableItem);
                
                if(entry.status=="draf"){
                	$(".status"+entry.id).append('草稿');
                	$(".sat"+entry.id).css("color","#dcdcdc");
                }
                if(entry.status=="inDeptAudit"){
                	$(".status"+entry.id).append('部门领导审核');
                	
                	$(".gr"+entry.id).removeAttr("href");
                	$(".q"+entry.id).removeAttr("href");
                	$(".e"+entry.id).removeAttr("href");
                	$(".delete"+entry.id).removeClass("del");
                	$(".sub"+entry.id).removeAttr("onclick");
                	
                	$(".gr"+entry.id).css("color","#dcdcdc");
                	$(".q"+entry.id).css("color","#dcdcdc");
                	$(".e"+entry.id).css("color","#dcdcdc");
                	$(".delete"+entry.id).css("color","#dcdcdc");
                	$(".sub"+entry.id).css("color","#dcdcdc");
                	$(".sat"+entry.id).css("color","#dcdcdc");
                }
                if(entry.status=="deptBack"){
                	$(".status"+entry.id).append('部门领导退回');
                	$(".sat"+entry.id).css("color","#dcdcdc");
                }
                if(entry.status=="inLineAudit"){
                	$(".status"+entry.id).append('条线管理员审核');
                	
                	$(".gr"+entry.id).removeAttr("href");
                	$(".q"+entry.id).removeAttr("href");
                	$(".e"+entry.id).removeAttr("href");
                	$(".delete"+entry.id).removeClass("del");
                	
                	$(".sub"+entry.id).removeAttr("onclick");
                	
                	$(".gr"+entry.id).css("color","#dcdcdc");
                	$(".q"+entry.id).css("color","#dcdcdc");
                	$(".e"+entry.id).css("color","#dcdcdc");
                	$(".delete"+entry.id).css("color","#dcdcdc");
                	$(".sub"+entry.id).css("color","#dcdcdc");
                	$(".sat"+entry.id).css("color","#dcdcdc");
                }
                if(entry.status=="lineBack"){
                	$(".status"+entry.id).append('条线管理员退回');
                	$(".sat"+entry.id).css("color","#dcdcdc");
                	
                }
                
                
                if(entry.status=="pass"){
                	$(".status"+entry.id).append('通过');
                    
                	$(".gr"+entry.id).removeAttr("href");
                	$(".q"+entry.id).removeAttr("href");
                	$(".e"+entry.id).removeAttr("href");
                	$(".delete"+entry.id).removeClass("del");
                	$(".sub"+entry.id).removeAttr("onclick");
                    
                    $(".gr"+entry.id).css("color","#dcdcdc");
                	$(".q"+entry.id).css("color","#dcdcdc");
                	$(".e"+entry.id).css("color","#dcdcdc");
                	$(".delete"+entry.id).css("color","#dcdcdc");
                	$(".sub"+entry.id).css("color","#dcdcdc");
                    
                	
                    //比较当前问卷结束时间，若小于当前系统时间，则表示问卷结束，可统计
                    var endTime=entry.endTime.substring(0,10);
                    var arr1= endTime.split("-");
                    var date1=new Date(parseInt(arr1[0]),parseInt(arr1[1])-1,parseInt(arr1[2]),0,0,0); 
                    endTime=date1.getTime();
                    var nowTime=new Date().getTime();
                    if(endTime<nowTime){
                    	$(".sat"+entry.id).attr("href",firUrl+"/qteMain/qteMainStatistics?id= "+entry.id);
                    }else{
//                    	$(".sat"+entry.id).attr("href","javascript:void(0);");
                    	$(".sat"+entry.id).css("color","#dcdcdc");
                    }
              
                    
                	
                	
                }

                
                if(entry.mainType=="party"){
                	$(".mainType"+entry.id).append('党委条线');
                }
                if(entry.mainType=="admin"){
                	$(".mainType"+entry.id).append('行政条线');
                }
                if(entry.mainType=="union"){
                	$(".mainType"+entry.id).append('工会条线');
                }
                if(entry.mainType=="youthLeague"){
                	$(".mainType"+entry.id).append('团委条线');
                }
                if(entry.mainType=="discipline"){
                	$(".mainType"+entry.id).append('纪委条线');
                }
                
                
                
                
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
				alert("对不起！你的请求出现异常，请联系服务人员2！");
			}
		},
		error: function () {
            alert("对不起！你的请求出现异常，请联系服务人员3！");
        }
	});
	return count;
}

/**
 * 查询列表
 */
$.postSearchForm = function (firUrl, paging) {
	
	var json=$.getQteMainType();
	var curUser=$.getCurrentUser();
	var curLoginName=curUser.loginName+curUser.deptId;
	var deptLeader=$.getSingleDeptLeader(curUser.deptId);
	//alert(deptLeader);
	var queryData="";
	var title=$("#title").val();
	if(typeof(title)=='undefined'){
		title="";
	}
	var flag=false;
	//根据当前部门比对当前用户是否是条线管理员或部门领导，是则查询出该条线的记录
	for(var i=0;i<json.length;i++){
		if(json[i].deptId==curUser.deptId){
			if(json[i].line==curLoginName||deptLeader==curUser.loginName){
				queryData=paging + "&sort=createTime desc&title_l="+title+"&mainType="+json[i].type;
				flag=true;
				break;
			}
			
		}
	}
	//如果不是条线管理员和领导，则查询出其创建的问卷
	if(!flag){
		queryData=paging + "&sort=createTime desc&title_l="+title+"&loginName="+curLoginName;
	}

    if (firUrl != "") {
    	
        $.ajax({
            url: firUrl + "/basicCrud/qteMain/page",
            type: 'post',
            dataType:'json',
            data: queryData,
            success: function (data, status, xhr) {
            	$.analyzeTableData(data, status, xhr, firUrl);
                $.setBtn(firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员4！");
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

$.validateForm = function () {
    var _return = "";
    if ($("#title").val() == "" || $("#title").val() == null) {
        _return += "\r\n问卷名称不能为空";
    }

    if ($("#startTime").val() == "" || $("#startTime").val() == null) {

        _return += "\r\n开始时间不能为空";
    }

    if ($("#endTime").val() == "" || $("#endTime").val() == null) {

        _return += "\r\n结束时间不能为空";
    }
    if ($("#mainType").val() == "" || $("#mainType").val() == null) {

        _return += "\r\n所属条线不能为空";
    }

    if ($("#startTime").val() != "" && $("#startTime").val() != null
        && $("#endTime").val() != "" && $("#endTime").val() != null
        && $("#endTime").val() < $("#startTime").val()) {

        _return += "\r\n结束时间不能小于开始时间";
    }

    if ($("#isOpend").val() == "" || $("#isOpend").val() == null) {

        _return += "\r\n请选择是否开放";
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

/**
 * 新增保存
 */
$.postSaveMain = function (Url, formName, otherData, toUrl,mode) {
    var _data = $("#" + formName).serialize();
    //alert(_data + otherData);
//    $(":button").attr("disabled",true);
    if (Url != "") {
        $.ajax({
        	 async: false,
            url: Url + "/basicCrud/qteMain/save",
            type: 'post',
            dataType : 'json',
            data: _data + otherData,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
                        if(mode!="edit"){
                        	$.postSaveWorkflow (Url,data.result.id);
                        }else if(mode=="edit"){
                        	$.submitToDeptAudit(Url,data.result.id,mode);
                        }
//                        if (toUrl != "")                        	
//                           location.href = Url + toUrl + "?id=" + data.result.id;
                    }
                    else {
                        alert("操作失败");
//                        $(":button").attr("disabled",false);
                    }
                }
                else {
                    alert("操作失败");
//                    $(":button").attr("disabled",false);
                }
            }
        });
    }

}

$.postSaveWorkflow = function (firUrl,mainId){
	var qteTitle = $("#title").val();
	var initiator = $("#creator").val();
	var initiatorLoginname = $("#loginName").val();
	var initiateTime =$("#createTime").val();
	var status = "draf";
	var data = "qteId="+mainId+"&qteTitle="+qteTitle+"&initiator="+initiator+"&initiatorLoginname="+initiatorLoginname+"&initiateTime="+initiateTime+"&status="+status;
	if(firUrl!=""){
		$.ajax({
			async: false,
            url: firUrl + "/basicCrud/qteMainWorkflow/save",
            type: 'post',
            dataType : 'json',
            data:data,
            success :function(data){
            	
            }
		});
	}
}


$.submitToDeptAudit = function(firUrl,mainId,mode){
//	alert(mode);
	var initiateTime = new Date().getTime();
	var status = "inDeptAudit";
	var handleTime="";
	
	if(mode =="edit"){
		 status = "draf";
	}
	var id = "";
	var deptId = "";
	var handlers = "";
	var handler = "";
	var handlerLoginname = "";
	$.ajax({
    	url:firUrl+"/ca/getCookies",
    	async:false,
    	type: 'post',
    	async: false,
   		dataType : 'json',
   		data:{},
   		success: function (data) {
   				if(data!=null){
   				 deptId = data.deptId;
   					
   					$.ajax({
   						url:firUrl+"/ca/getDeptSingleLeader?deptId="+deptId,
   				    	async:false,
   				    	type: 'post',
   				    	async: false,
   				   		dataType : 'json',
   				   		success :function(data){
   				   			handlers = data[deptId];
//   				   			alert(handlers);
   				   			  
   				   		}
   					});
   				}
   		}
    });
	var h = handlers.split(",");
	handlerLoginname = h[0]+deptId;
	handler = h[1];
	if(firUrl!=""){
		$.ajax({
			async: false,
            url: firUrl + "/qteMainWorkflow/findByQteId/"+mainId,
            type: 'post',
            dataType : 'json',
            data:data,
            success :function(data){
            	if(data.success==true){
            		id= data.result.id;
            		handleTime=data.result.handleTime;
            	}
            }
		});
		
		//修改的时候将处理时间置空
		if(handleTime==null || mode =="edit"){
			handleTime="";
		}
		var title=$("#title").val();
		var data;
		if(title==null || title==""){
			data = "initiateTime="+initiateTime+"&status="+status+"&id="+id+"&handler="+handler+"&handlerLoginname="+handlerLoginname+"&handleTime="+handleTime;
		}else{
			data = "initiateTime="+initiateTime+"&status="+status+"&id="+id+"&handler="+handler+"&handlerLoginname="+handlerLoginname+"&handleTime="+handleTime+"&qteTitle="+title;
		}
		$.ajax({
			async: false,
            url: firUrl + "/basicCrud/qteMainWorkflow/save",
            type: 'post',
            dataType : 'json',
            data:data,
            success : function(data){
            	if(data.success==true){
            		alert("提交成功！")
            		if(mode!="edit"){
            			$.postSearchForm(firUrl, "&pageSize=10&pageNum=1");
            		}
            	}
            	
            }
		});
	}
}





$.postMainDetail = function (firUrl, id) {
    if (firUrl != "") {
    	id=parseInt(id);
        $.ajax({
        	async:false,
            url: firUrl + "/basicCrud/qteMain/get/" + id,
            dataType :'json',
            type: 'post',
            success: function (data, status, xhr) {

                if (status == "success" && data != null) {
                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
                        var entry = data.result;
                        $("#title").val(entry.title);
                        
                        var person=eval('('+entry.participants+')');
                        var personCn=[];
                        var personDepts=[];
                        for(var key in person){	
                        	personCn.push(person[key]);
                        	var chosedDeptId=key.substr(key.length-4);
                        	if(personDepts.join(",").indexOf(chosedDeptId)<0){
                        		personDepts.push(chosedDeptId);
                        	}
                        }
                        //$("#participants_loginName").val(personLoginName.join(","));
                        $("#participants_cn").val(personCn.join(","));
                        $("#participantsDepts").val(personDepts.join(","));
                        $("#participants").val(entry.participants);
                        
                        //alert(111);
                        $("#mainType").val(entry.mainType);
                        $("#isOpend").val(entry.isOpend);
                        $("#description").val(entry.description);
                        
                        
                        $("#endTime").val(entry.endTime);
                        $("#startTime").val(entry.startTime);
                    }
                    if(entry.id !=null){
                    	$("#id").val(entry.id);
                    }
                }
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员5！");
            }
        });
    }
}

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

$.getSingleDeptLeader=function(deptId){
	var leader;
	$.ajax({
		url:getBasePath()+'/ca/getDeptSingleLeader?deptId='+deptId,
		type:'POST',
		dataType:'json',
		async:false,
		success:function(data){
			var info=data[deptId];
			leader=info.split(",")[0];
			
		}
	});
	return leader;
}



