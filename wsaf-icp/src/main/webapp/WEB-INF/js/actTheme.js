
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
$.analyzeTableData = function (data, status, xhr, firUrl,workOrder) {
    if (status == "success" && data != null) {
        $("tr.tableItem").remove();

        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            $.each(data.result.content, function (entryIndex, entry) {
                tableItem = "<tr class=\"tableItem\">";
                tableItem += "<td class=\" t_c\">" + entry.name +
                    "<td class=\" t_c\"><label class=\"category"+entry.id+"\"></label>" +"</td>" +
                    "<td class=\" t_c\">" + entry.createTime+"</td>" +
                    "</td><td class=\" t_c\">" + entry.startTime + "</td>" +
                    "<td class=\" t_c\">" + entry.endTime+"</td>" +
                    "<td class=\" t_c\">" + entry.creater+"</td>" +
                    "<td class=\" t_c\">" + entry.deptName+"</td>" ;
                var url = getBasePath()+"/actTheme/actThemeView?ctId= "+entry.id;
        tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/actTheme/actThemeView?ctId="+entry.id+"  \">查看</a>"+
	                 "<a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/actTheme/actThemeEdit?id="+entry.id+"  \" >修改</a>"+
	                 "<a target=\"_blank\" class=\"mr_5 del\" style=\" cursor :pointer;\" mainId='"+entry.id+"' >删除</a>"+
	                 "<a target=\"_blank\" class=\"mr_5\" href=\""+workOrder+"" +
//	                 "?"+encodeURI(+"\""+"operateType=add&steplabel=Begin&title="+entry.name+"&url="+entry.content+";查看详细信息:"+url+"\"")+"  \">联系单</a>";
        			 "?"+encodeURI(+"\""+"operateType=add&steplabel=Begin&deptId= &deptName= &title="+entry.name+"&url="+url+";查看详细信息:"+entry.content)+"  \">联系单</a>";
        
		                
                	tableItem += "</td></tr>";
                	//location.href='http"//ip/?'+encodeURI("url=添加附件  添加附件  添加附件  ;查看详细信息:http://localhost:8080/icp/actTheme/actThemeView?ctId= 81")
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
 * 查询列表
 */
$.postSearchForm = function (firUrl, paging,workOrder) {
	var json=$.getActThemeDeptType();
	var curUser=$.getCurrentUser();
	var curDeptId=curUser.deptId;
	var name=$("#name").val();
	var flag=false;
	var queryData = "";
	for(var i=0;i<json.length;i++){
		if(json[i].deptId==curDeptId){
			queryData=paging + "&sort=createTime desc&name_l="+name+"&deptId="+curDeptId+"&colCategory_in="+json[i].type;
			flag=true;
			break;
		}
	}

    if (flag&firUrl != "") {

        $.ajax({
            
            url: firUrl + "/basicCrud/actTheme/page",
            type: 'post',
            dataType:'json',
            data: queryData,
            success: function (data, status, xhr) {
            	$.analyzeTableData(data, status, xhr, firUrl,workOrder);
                $.setBtn(firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }else{
    	 alert("对不起！你无相关权限，请联系服务人员！");
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
            url: Url + "/basicCrud/actTheme/save",
            type: 'post',
            dataType : 'json',
            data: _data + otherData,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
                        
                        $("#tbfj tbody tr").each(function(fileIndex,files){
//                         alert($(this).attr("name"));
                       	   $.FileSave (Url,"adviceCollect",data.result.id,$(this).attr("name"));
                        });
//                        if (toUrl != ""){
//                            location.href = Url + toUrl + "?id=" + data.result.id+"&add=add";
//                        }
                        	
                    }
                    else {
                        alert("操作失败");
                        $(":button").attr("disabled",false);
                    }
                }
                else {
                    alert("操作失败");
                    $(":button").attr("disabled",false);
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
    if ($("#name").val() == "" || $("#name").val() == null) {
        _return += "\r\n征集名称不能为空";
    }
    if ($("#name").val().length > 20) {
        _return += "\r\n征集名称不能超过20";
    }
    if ($("#startTime").val() == "" || $("#startTime").val() == null) {

        _return += "\r\n开始时间不能为空";
    }

    if ($("#endTime").val() == "" || $("#endTime").val() == null) {

        _return += "\r\n结束时间不能为空";
    }

    if ($("#startTime").val() != "" && $("#startTime").val() != null
        && $("#endTime").val() != "" && $("#endTime").val() != null
        && $("#endTime").val() <= $("#startTime").val()) {

        _return += "\r\n结束时间不能小于开始时间";
    }

    if ($("#colCategory").val() == "" || $("#colCategory").val() == null) {

        _return += "\r\n意见类别不能为空";
    }
    
    if ($("#isOpend").val() == "" || $("#isOpend").val() == null) {

        _return += "\r\n请选择是否开放";
    }
    if ($("#content").val() == "" || $("#content").val() == null) {

        _return += "\r\n征集内容不能为空";
    }
    
    if ($("#content").val().length > 300) {
        _return += "\r\n详细内容不能超过300";
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


$.postMainDetail = function (firUrl, id) {
    if (firUrl != "") {
    	id=parseInt(id);
        $.ajax({
        	async:false,
            url: firUrl + "/basicCrud/actTheme/get/" + id,
            dataType :'json',
            type: 'post',
            success: function (data, status, xhr) {

                if (status == "success" && data != null) {
                    if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
                        var entry = data.result;
                        $("#name").val(entry.name);
                        $("#colCategory").val(entry.colCategory);
                        $("#isOpend").val(entry.isOpend);
                        $("#content").val(entry.content);
                        var person=eval('('+entry.participant+')');
                        var personCn=[];
                        var personDepts=[];
                        for(var key in person){	
                        	personCn.push(person[key]);
                        	var chosedDeptId=key.substr(key.length-4);
                        	if(personDepts.join(",").indexOf(chosedDeptId)<0){
                        		personDepts.push(chosedDeptId);
                        	}
                        }
                        $("#participant_cn").val(personCn.join(","));
                        $("#participantDepts").val(personDepts.join(","));
                        $("#participant").val(entry.participant);
                       
//                        $("#endTime").val(entry.endTime.substring(0,10));
//                        $("#startTime").val(entry.startTime.substring(0,10));
                        
                        $("#endTime").val(entry.endTime);
                        $("#startTime").val(entry.startTime);
                        
                        
                       
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
                            	$("#tbfj tbody").append("<tr class=\""+entry.id+"\" name=\""+entry.id+"\"><td>"+entry.fileName+"</td><td>"+entry.fileSize+"</td><td>"+entry.uploadDate+"</td><td><a href=\" "+firUrl+"/attach/api/download/"+id+"\">下载</a></td><td><a class=\"del\" onclick=\" $.FileDel('"+firUrl+"',"+id+",'0')\"  >删除</a></td></tr>");
                           });
                            
                        }
                }
        });
       }
}


$.FileDel = function(firUrl,_id,isRead){
    if(firUrl!="")
       { 
	        $.ajax({
	                async: false,
	                url : firUrl+"/attach/api/del/"+_id,
	                dataType:"json",
	                type:'post',
	                success: function(data, status, xhr) {
	                    alert("删除成功");
//	                    $("tbody."+_id).remove();
	                    alert(id);
	                    $("#tbfj tbody tr."+_id).remove();
	                    
	                }
	        });
       }
}



$.FileSave = function(firUrl,modelName,_id,_attachIds){
	
	
    if(firUrl!="")
         { 
	      $.ajax({
	             async: false,
	              url : firUrl+"/attach/api/bind",
	              type : 'post',
	              data: "&modelName="+modelName+"&modelId="+_id+"&attachIds="+_attachIds,
	              success: function(data, status, xhr) {
	                  
	              },
	             error:function(XMLHttpRequest, textStatus, errorThrown){
	             //alert(XMLHttpRequest+"save失败");
	             }
	         });
         }
  }
