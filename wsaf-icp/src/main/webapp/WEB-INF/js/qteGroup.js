//   http://localhost:8080/wsaf-icp/qteComplexInfo/findByMainId/{id}
$.getGroup = function(firUrl,mainId){
	if(firUrl != ""){
		$.ajax({
			url:firUrl+"/qteComplexInfo/findByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
            	$.analyzeTableData(data, firUrl);
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
}

$.analyzeTableData = function (data, firUrl) {
    if (data.success == true && data != null) {
        $("tr.tableItem").remove();
        if (data.success == true && JSON.stringify(data.result) != "[]") {
            $("tr.tableItem").remove();
            var tableItem = "";
            $.each(data.result, function (entryIndex, entry) {
                tableItem = "<tr class=\"tableItem\">";
                tableItem += "<td class=\" t_c\">" + entry.name +"</td>" +
		                	"<td class=\" t_c\">" + entry.orders+"</td>" ;
                tableItem += "<td class=\" t_c\"><a target=\"_blank\" class=\"mr_5 ml_5 add\" onclick=\"$.editGroup("+entry.id+",'"+entry.name+ "',"+entry.orders+");  \"  style=\" cursor :pointer;\" \" >修改</a><label class=\"add\">-</label> "+
	                 "<a target=\"_blank\" class=\"mr_5 ml_5 del\" style=\" cursor :pointer;\" mainId='"+entry.id+"' >删除</a>";
	                
                	tableItem += "</td></tr>";
                	
                $(".table_1").append(tableItem);
                
                
            });

        }

    }
}
$.validateForm = function () {
    var _return = "";
    if ($("#name").val() == "" || $("#name").val() == null) {
        _return += "\r\n分组名称不能为空";
    }
    if ($("#orders").val() == "" || $("#orders").val() == null) {

        _return += "\r\n次序号不能为空";
    }
    return _return;
}

$.editGroup = function(id,name,orders){
	$("#id").attr("disabled",false);
	$("#id").val(id);
	$("#name").val(name);
	$("#orders").val(orders);
}



$.postSaveMain = function (Url, formName, toUrl) {
    var _data = $("#" + formName).serialize();
    if (Url != "") {
        $.ajax({
        	 async: false,
            url: Url + "/basicCrud/qteGroup/save",
            type: 'post',
            dataType : 'json',
            data: _data,
            success: function (data, status, xhr) {
                if (status == "success" && data != null) {
                    if (data.success == true) {
                        alert("操作成功！");
                        if (toUrl != "")
                           location.href = Url + toUrl + "?id=" + data.result.mainId;
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