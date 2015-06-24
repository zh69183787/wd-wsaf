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
$.getMenu = function (firUrl, modName) {

    //$("#beTestDeptCn").val("党办,总体规划部,办公室,工会,审计室,合约管理部,团委,财务部,监察室,投资管理部,安监室,建管中心,组织人事部,企发部,信息中心,保卫部");
    //$("#beTestDept").val("2502,2506,2510,2503,2513,2508,2504,2507,2505,2509,2519,2551,2512,2518,2549,2514");
    //$("#testDeptCn").val("股份公司,资产经营管理公司,黄浦江大桥建设公司,运营管理中心,第一运营公司,第二运营公司,第三运营公司,第四运营公司,维护保障公司,教育培训中心,技术研究中心,隧道设计院,磁浮公司,申松线项目公司,十号线项目公司,申嘉线项目公司,十二号线项目公司,十三号线项目公司");
   // $("#testDept").val("2945,2946,2959,2920,2921,2922,2923,2924,2925,2944,2941,2943,2962,2953,2949,2954,2951,2952");
    //$("#testDeptCount").
    //    val("2945[10],2946[10],2959[10],2920[10],2921[10],2922[10],2923[10],2924[10],2925[10],2944[10],2941[10],2943[10],2962[10],2953[5],2949[5],2954[5],2951[5],2952[5]");
    if (firUrl != "") {
        $.ajax({
        	async: false,
            url: firUrl + "/basicCrud/" + modName + "/getEntityProperty",
            type: 'post',
            dataType: 'json',
            success: function (data, status, xhr) {
                if (data.success == true && data.result.fieldProperties && JSON.stringify(data.result.fieldProperties) != "[]") {
                    $.each(data.result.fieldProperties, function (entryIndex, entry) {
                        if (entry.operate == "select" && entry.path == "opened") {
                            $.analyzeSelMenu(entry.path, entry.option);
                        }
                    });

                    QueryString.Initial();

                    if (QueryString.GetValue('id') != null) {

                        $.postMainDetail(firUrl, QueryString.GetValue('id'));

                    }
                }
            }
        });

    }
    
    

}

$.analyzeSelMenu = function (dataname, _obj) {
    for (var sitem in _obj) {
        if ($("[name=" + dataname + "]").length > 0) {
            $("[name=" + dataname + "]").append("<option value='" + sitem + "'>" + _obj[sitem] + "</option>");
        }
    }
}


$.setBtn = function (firUrl) {
    $(".topage").click(function () {
        $.postSearchForm(firUrl, "&pageSize=10&pageNum=" + $(this).text()+"&sort=createTime desc");
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

$.postSearchForm = function (firUrl, paging,workOrder) {
	var json=$.getCptComplaintDeptType();
	var curUser=$.getCurrentUser();
	var curDeptId=curUser.deptId;
	var flag=false;
	var queryData = "";
	for(var i=0;i<json.length;i++){
		if(json[i].deptId==curDeptId){
			queryData=paging + "&situation_in="+json[i].type;
			flag=true;
			break;
		}
	}

    if (flag&firUrl != "") {
        $.ajax({
            
            url: firUrl + "/basicCrud/cptComplaint/page",
            type: 'post',
            dataType:'json',
            data: $("#cpqComplaintform").serialize() + queryData + "&sort=createTime desc",
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

//解析Table
$.analyzeTableData = function (data, status, xhr, firUrl,workOrder) {
    if (status == "success" && data != null) {
        $("tr.tableItem").remove();

        if (data.success == true && data.result.content && JSON.stringify(data.result.content) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            $.each(data.result.content, function (entryIndex, entry) {            
            	tableItem = "<tr class=\"tableItem\">";
                tableItem += "<td class=\"t_c\">" + entry.cptTitle +
                    "</td><td class=\"t_c\">" + entry.loginName + "</td><td class=\"t_c\">" + entry.createTime + "</td><td class=\"t_c\">" + entry.deptName + "</td>";
            /*
                	tableItem += "&nbsp;<td class=\"t_c\" ><input type=\"button\" name=\"button\" id=\"stat\" value=\"反馈\" onclick=\"window.open('" + firUrl + "/cpqQuestion/save?id=" + entry.id + "');\" \>";
                	tableItem += "&nbsp;<input type=\"button\" name=\"button\" id=\"edit\" value=\"查看\" onclick=\"window.open('" + firUrl + "/cptComplaint/cptComplaintDetail?id=" + entry.id + "');\" \>";              
                    tableItem += "&nbsp;<input type=\"button\" name=\"button\" id=\"edit\" value=\"修改\" onclick=\"window.open('" + firUrl + "/cptComplaint/cptComplaintEditV?id=" + entry.id + "');\" \>";            
                    tableItem += "&nbsp;<input mainId='"+entry.id+"'  type=\"button\" name=\"button\" class=\"del\" value=\"删除\"');\" \>";
            */
                var url = getBasePath()+"/cptComplaint/cptComplaintDetail?id="+entry.id;
	            	tableItem += "<td class=\"t_c\" ><a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/cptComplaint/cptComplaintFeedBack?id= "+entry.id+"  \" >反馈</a>"
	                +"<a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/cptComplaint/cptComplaintDetail?id= "+entry.id+"  \" >查看</a>"
	                +"<a target=\"_blank\" class=\"mr_5\" href=\" "+firUrl+"/cptComplaint/cptComplaintEditV?id= "+entry.id+"  \" >修改</a>"
	                +"<a target=\"_blank\" class=\"mr_5 del\" mainId='"+entry.id+"' style=\" cursor :pointer;\" >删除</a>"+
	                "<a target=\"_blank\"  class=\"mr_5\" href=\""+workOrder+"" +
	                "?"+encodeURI(+"'"+"operateType=add&steplabel=Begin&deptId= &deptName= &title="+entry.cptTitle+"&url="+url+";查看详细信息:"+entry.content+"'")+"  \">联系单</a>";
	                 
                tableItem += "</td></tr>";
                $(".table_1").append(tableItem);
            });

            $.setPage(data.result);
        }

    }
}




$.postMainDetail = function (firUrl, id) {
    if (firUrl != "") {
        $.ajax({
            
            url: firUrl + "/basicCrud/cptComplaint/get/" + id,
            dataType :'json',
            type: 'post',
            success: function (data, status, xhr) {

          //     if (status == "success" && data != null) {
           //         if (data.success == true && data.result && JSON.stringify(data.result) != "[]") {
                        var entry = data.result;
                        $("#id").val(entry.id);
                        $("#cptTitle").val(entry.cptTitle);
                        $("#situation").val(entry.situation);
                        $("#content").val(entry.content);
                        $("#linkMan").val(entry.linkMan);
                        $("#loginName").val(entry.loginName);
                        $("#deptName").val(entry.deptName);
                        $("#telephone").val(entry.telephone);
                        $("#email").val(entry.email);
                        $("#fbTitle").val(entry.fbTitle);
                        $("#fbContent").val(entry.fbContent); 
                        $("#fbName").val(entry.fbTitle);
                        $("#fbLoginName").val(entry.fbContent); 
                        $("#fbDeptName").val(entry.fbTitle);
                        $("#fbCreateTime").val(entry.fbContent); 
                        $("#fbDeptId").val(entry.fbTitle);


       //             }
        //        }
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
        });
    }
}


$.postSaveMain = function (Url, formName, otherData, toUrl) {
    var _data = $("#" + formName).serialize();
    var _id="";
    if (Url != "") {
        $.ajax({
        	async:false,
            url: Url + "/basicCrud/cptComplaint/save",
            type: 'post',
            dataType : 'json',
            data: _data + otherData,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
                    	$("#tbfj tbody tr").each(function(fileIndex,files){
                       	    $.FileSave (Url,"complaint",data.result.id,$(this).attr("name"));
                        });
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
    return _id;

}

$.postSaveWorkflow = function (base,url1, url2,otherData) {
    $("#status").val("doing");
    var _data = $("#cpqMainForm").serialize();
    $(":button").attr("disabled",true);
    if (url1 != null) {
        $.ajax({
            url: url1,
            type: 'post',
            dataType : 'json',
            data: _data + otherData,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
                        $.getDeptLeader(base,data.result);
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

$.getDeptLeader = function(base,mainBo){
    var deptId = "";
    var loginName = "";
    var userName = "";
    $.ajax({
        url: base + "/ca/getDeptSingleLeader",
        type: 'post',
        dataType : 'json',
        data: {"deptId":mainBo.testDept},
        success: function (data, status, xhr) {
            if (status == "success" && data != null) {
               count = mainBo.testDept.split(",").length;
               for(var key in data){
                   deptId = key;
                   if(deptId == "2959"){
                       loginName = "G060000000022959";
                       userName = "苏致雄";
                   }else if(deptId == "2921"){
                       loginName = "G010010000052921";
                       userName = "王伟雯";
                   }else{
                       loginName = (data[key].split(","))[0];
                       userName = (data[key].split(","))[1];
                   }

                   $.addWorkflow(base,mainBo,deptId,loginName,userName);
               }
            }
            else {
                alert("操作失败");
                $(":button").attr("disabled",false);
            }

        }
    });
}
var count = 0;
var counts = 0;
$.addWorkflow = function(base,mainBo,deptId,loginName,userName){
    $.ajax({
        url: base + "/basicCrud/cpqWorkflow/save",
        type: 'post',
        dataType : 'json',
        data: {
            "cpqId":mainBo.id,
            "testDept":deptId,
            "initiator":mainBo.creator,
            "initiatorLoginname":mainBo.creatorLoginName,
            "initiateTime":new Date().getTime(),
            "handler":userName,
            "handlerLoginname":loginName,
            "status":"assign"
        },
        success: function (data, status, xhr) {
            if (status == "success" && data != null) {
                if(data.success == true){
                    counts ++;
                    if(count == counts){
                        alert("操作成功！");
                        window.opener = null;
                        window.open("","_self");
                        window.close();
                    }
                }
            }
            else {
                alert("操作失败");
            }

        }
    });
}

$.validateForm = function () {

   var _return = "";
    if ($("#cptTitle").val() == "" || $("#cptTitle").val() == null) {
        _return += "\r\n标题不能为空";
    }

    if ($("#situation").val() == "" || $("#situation").val() == null) {

        _return += "\r\n情况分类不能为空";
    }
    
    
     if ($("#linkMan").val() == "" || $("#linkMan").val() == null) {
        _return += "\r\n联系人不能为空";
    }

    if ($("#deptName").val() == "" || $("#deptName").val() == null) {

        _return += "\r\n所在部门不能为空";
    }
     if ($("#telephone").val() == "" || $("#telephone").val() == null) {
        _return += "\r\n联系电话不能为空";
    }
     var regTel = /^(\d{8}|\d{11})$/;
     if(! regTel.test($("#telephone").val())){
    	 _return += "\r\n联系电话格式不正确";
     }
     var regMail = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
     if(! regMail.test($("#email").val())){
    	 _return += "\r\n邮箱格式不正确";
     }
     
    if ($("#content").val() == "" || $("#content").val() == null) {

        _return += "\r\n详细内容不能为空";
    }
    if ($("#content").val().length > 500) {
        _return += "\r\n详细内容不能超过500";
    }

   

    return _return;
}

$.validateForm2 = function () {

   var _return = "";
    if ($("#fbTitle").val() == "" || $("#fbTitle").val() == null) {
        _return += "\r\n反馈标题不能为空";
    }

    if ($("#fbContent").val() == "" || $("#fbContent").val() == null) {

        _return += "\r\n详细内容不能为空";
    }

   

    return _return;
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
        };
	
