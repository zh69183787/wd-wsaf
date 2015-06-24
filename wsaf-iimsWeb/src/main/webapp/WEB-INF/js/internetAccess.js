QueryString = {
	data : {},
	Initial : function() {
		var aPairs, aTmp;
		var queryString = new String(window.location.search);
		queryString = queryString.substr(1, queryString.length); // remove
																	// "?"
		aPairs = queryString.split("&");
		for ( var i = 0; i < aPairs.length; i++) {
			aTmp = aPairs[i].split("=");
			this.data[aTmp[0]] = aTmp[1];
		}
	},
	GetValue : function(key) {
		if (this.data[key] != null)
			return decodeURIComponent(this.data[key]);
		else
			return null;
	}
};
String.prototype.trim = function() {
	return Trim(this);
};

function LTrim(str) {
	var i;
	for (i = 0; i < str.length; i++) {
		if (str.charAt(i) != " " && str.charAt(i) != " ")
			break;
	}
	str = str.substring(i, str.length);
	return str;
}
function RTrim(str) {
	var i;
	for (i = str.length - 1; i >= 0; i--) {
		if (str.charAt(i) != " " && str.charAt(i) != " ")
			break;
	}
	str = str.substring(0, i + 1);
	return str;
}
function Trim(str) {
	return LTrim(RTrim(str));
}

$.defaultjs = function() {
	if (!placeholderSupport()) { // 判断浏览器是否支持 placeholder
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
	}

	function placeholderSupport() {
		return 'placeholder' in document.createElement('input');
	}
};

$.isNullOrEmpty = function(_obj) {
	if (_obj.val() == "" || _obj.val() == null) {
		return true;
	} else {
		return false;
	}
};
$.setBtn2=function(firUrl){
	$(".topage").click(function(){
 		$.postSearchForm2(firUrl,"&pageSize=16&pageNum="+$(this).text());
 		
		});
	   
    $(".prepage").click(function(){
 	 var nowpage=parseInt($("#page>.selected a").text());

 	 if(nowpage>1)
 		 {
 		 var topage=nowpage-1;
 		$.postSearchForm2(firUrl,"&pageSize=16&pageNum="+topage);
 		 }
		}); 
  
   $(".nextpage").click(function(){
 	 var nextpage=parseInt($("#page>.selected a").text())+1;

 	 if(nextpage<=parseInt($("#gopage").attr("max")))
		   $.postSearchForm2(firUrl,"&pageSize=16&pageNum="+nextpage);

		}); 
   
   $("#oututBtn").click(function(){
	  var paging="";
			paging+="&status_in=waitForImplement";
		
 	  var content =$("#projectAppform").serialize()+"&sort=id desc"+paging;
 	  window.location.href=firUrl+"/basicCrud/internetResource/export2Excel?"+content+"&type=internetResource";

   }); 
   
   $("#gopagebtn").click(function(){
 	  var topage=parseInt($("#gopage").val());
   
     	 if(topage<=parseInt($("#gopage").attr("max"))&&topage>=1)
 		 {
 		$.postSearchForm2(firUrl,"&pageSize=16&pageNum="+topage);
 		 }
     	 else
     		 {
     		 alert("超出索引值");
     		 }
			});
}
$.setBtn = function(firUrl, isleader) {
	$(".topage").click(
			function() {
				$.postSearchForm(firUrl, "&pageSize=16&pageNum="
						+ $(this).text(), isleader);

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchForm(firUrl, "&pageSize=16&pageNum=" + topage),
							isleader;
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchForm(firUrl,
							"&pageSize=16&pageNum=" + nextpage, isleader);

			});

	$("#oututBtn")
			.click(
					function() {
						var isleader = $.isleader(firUrl);
						var paging = "";
						if (isleader == "信息管理中心方政" || isleader == "江啸栋") {
							paging += "&status_in=innerApproval,innerTurnBack,infoDeptApproval,serviceDeptApproval,selfDealWith,turnBack,serviceDeptBack,finish";
						}
						if (isleader == "维保部门") {
							paging += "&status_in=serviceDeptApproval,serviceDeptBack";
						}
						if (isleader == "本部门领导") {
							paging += "&status_in=innerApproval,infoDeptApproval&handler="
									+ $.isReviewPersonnel(firUrl);
						}
						if (isleader == "不是领导") {
							paging += "&status_in=innerApproval,infoDeptApproval,draft,innerTurnBack,turnBack,serviceDeptBack,serviceDeptApproval,finish";
						}

						var content = $("#projectAppform").serialize()
								+ "&sort=id desc" + paging;
						window.location.href = firUrl
								+ "/basicCrud/internetResource/export2Excel?"
								+ content + "&type=internetResource";

					});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchForm(firUrl, "&pageSize=16&pageNum="
									+ topage, isleader);
						} else {
							alert("超出索引值");
						}
					});
};

$.setPage = function(result) {
	if (result.pageInfo != null) {
		var _pageinfo = result.pageInfo;
		var nowcount = $(".table_1").find(".tableItem");

		if (_pageinfo.pageSize > nowcount.length) {
			var minMum = _pageinfo.pageSize - nowcount.length;
			for ( var i = 0; i < minMum; i++) {
				$(".table_1")
						.append(
								"<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
			}
		}

		$(".tfoot span:first-child").text(
				"共" + _pageinfo.totalRecord + "条记录，当前显示1-" + nowcount.length
						+ "条");

		var _menu = "<li>Pages:"
				+ _pageinfo.currentPage
				+ "/"
				+ _pageinfo.totalPages
				+ "<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""
				+ _pageinfo.totalPages
				+ "\" step=\"1\" class=\"input_tiny\" />";
		_menu += " <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";

		var pageStyle = "";
		if (_pageinfo.totalPages > 7) {
			if (_pageinfo.currentPage <= 1) {
				pageStyle += "<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>"
						+ _pageinfo.totalPages + "</a></li>";
			} else {
				var pa = _pageinfo.currentPage - 1;
				pb = _pageinfo.currentPage + 1;
				pc = _pageinfo.currentPage + 2;
				pd = _pageinfo.currentPage + 2;
				pageStyle += "<li ><a class=\"topage\">" + pa
						+ "</a></li> <li><a class=\"selected\">"
						+ _pageinfo.currentPage
						+ "</a></li> <li><a class=\"topage\">" + pb
						+ "</a></li> <li><a class=\"topage\">" + pc
						+ "</a></li> <li><a class=\"topage\">" + pd
						+ "</a></li> <li><a>...</a></li> <li><a>"
						+ _pageinfo.totalPages + "</a></li>";

			}
		} else {
			for ( var j = 1; j <= _pageinfo.totalPages; j++) {
				if (j == _pageinfo.currentPage) {
					pageStyle = "<li class=\"selected\"><a>" + j + "</a></li>"
							+ pageStyle;

				} else {
					pageStyle = "<li><a class=\"topage\">" + j + "</a></li>"
							+ pageStyle;

				}
			}
		}

		_menu += pageStyle + "<li><a class=\"prepage\">&lt;&lt;</a></li>";
		$("ul.pager li").remove();
		$("ul.pager").append(_menu);
	}
};
$.setPageInfo= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$(".table_1").find(".tableItem");
		if(_pageinfo.pageSize>nowcount)
			{
			var minMum=_pageinfo.pageSize-nowcount,len=16;
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
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>"
        		 }
        	 else{ 
      		   if(_pageinfo.currentPage==_pageinfo.totalPages){
      			   var pa=_pageinfo.currentPage-4; pb=_pageinfo.currentPage-3;pc=_pageinfo.currentPage-2; pd=_pageinfo.currentPage-1;
        		   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pd+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>";
        		   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-1){
      			   var pa=_pageinfo.currentPage-3; pb=_pageinfo.currentPage-2;pc=_pageinfo.currentPage-1;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
      			   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>";
        		   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-2){
      			   var pa=_pageinfo.currentPage-2; pb=_pageinfo.currentPage-1;pc=_pageinfo.currentPage+1;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
            	   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
      			   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
            	   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
            	   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>";
            	   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-3){
      			   var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
        		   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
        		   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>"; 
        		   pageStyle+="<li><a>...</a></li>";
      		   }else if(_pageinfo.currentPage==_pageinfo.totalPages-4){
      			   var pa=_pageinfo.currentPage+1; pb=_pageinfo.currentPage+2;pc=_pageinfo.currentPage+3;
      			   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>";
      			   pageStyle+="<li><a class=\"topage\">"+pc+"</a></li>";
      			   pageStyle+="<li><a class=\"topage\">"+pb+"</a></li>";
      			   pageStyle+="<li><a class=\"topage\">"+pa+"</a></li>"; 
      			   pageStyle+="<li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li>";
      			   pageStyle+="<li><a>...</a></li>";
      		   }else{
      			   if(_pageinfo.currentPage==2){
      				 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+3;
            		 pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">"+pd+"</a></li><li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li><li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li><li ><a class=\"topage\">"+pa+"</a></li>";
      			   }else{
      				 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+3;
            		 pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">"+pd+"</a></li><li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li><li class=\"selected\"><a>"+_pageinfo.currentPage+"</a></li><li ><a class=\"topage\">"+pa+"</a></li><li><a>...</a></li>";
      			   }
          		
      		    }
        	   }
        	 }else
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
         $("ul.pager").html(_menu);		        
	}
};

$.postSearchForm = function(firUrl, paging, isleader) {

	if (isleader != "不是领导") {
		if (isleader == "本部门领导") {
			$("option[value=draft]").remove();
			$("option[value=turnBack]").remove();
			$("option[value=serviceDeptApproval]").remove();
			$("option[value=serviceDeptBack]").remove();
			$("option[value=waitForImplement]").remove();
			$("option[value=selfDealWith]").remove();
			$("option[value=finish]").remove();
		}
		if (isleader == "信息管理中心方政" || isleader == "江啸栋") {
			$("option[value=waitForImplement]").remove();
		}
		if (isleader == "维保部门") {
			$("option[value=draft]").remove();
			$("option[value=turnBack]").remove();
			$("option[value=innerApproval]").remove();
			$("option[value=innerTurnBack]").remove();
			$("option[value=finish]").remove();
			$("option[value=selfDealWith]").remove();
			$("option[value=waitForImplement]").remove();
		}
		if ($.isNullOrEmpty($("[name=status] option:selected"))) {
			if (isleader == "信息管理中心方政" || isleader == "江啸栋") {
				paging += "&status_in=draft,innerApproval,innerTurnBack,infoDeptApproval,serviceDeptApproval,turnBack,serviceDeptBack,finish";
			}
			if (isleader == "维保部门") {
				paging += "&status_in=serviceDeptApproval,serviceDeptBack";
			}
			if (isleader == "本部门领导") {
				paging += "&status_in=innerApproval,infoDeptApproval&handler="
						+ $.isReviewPersonnel(firUrl);
				// paging+=$.isInnerReview(firUrl);
				// paging+="&handler=G010070003832549";
			}
		}
	}
	if (isleader == "不是领导") {
		$("option[value=selfDealWith]").remove();
		if ($.isNullOrEmpty($("[name=status] option:selected"))) {
			paging += "&status_in=draft,innerApproval,infoDeptApproval,turnBack,innerTurnBack,finish,serviceDeptBack,serviceDeptApproval,waitForImplement";
			paging+="&applyerLoginname="+$.getLoginname(firUrl);
		}
	}

	if ($("[name=date1]").val() != "" && $("[name=date2]").val() != "") {
		var date1 = $("[name=date1]").val();
		var date2 = $("[name=date2]").val();

		paging += "&applyUseTime_s=" + date1 + "&applyUseTime_e=" + date2;

	} else if ($("[name=date1]").val() != "" && $("[name=date2]").val() == "") {
		alert("请选择结束时间！");
		return false;
	} else if ($("[name=date1]").val() == "" && $("[name=date2]").val() != "") {
		alert("请选择开始时间！");
		return false;
	}

	paging += "&sort=id desc";

	if (firUrl != "") {

		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/internetResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableData(data, status, xhr, firUrl, isleader);
				$.setBtn(firUrl, isleader);

			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableData = function(data, status, xhr, firUrl, isleader) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "",equipmentTypeChina="";
			var i = 0;
			var name = $.getLoginname(firUrl);
			$
					.each(
							data.result.content,
							function(entryIndex, entry) {
								// To:do
								if(entry.applyerLoginname!=name&&entry.status=="draft"){
									return true;
								}
								switch (entry.applyType) {
								case "apply":
									applyTypeChina = "申请";
									break;
								case "change":
									applyTypeChina = "变更";
									break;
								case "cancel":
									applyTypeChina = "注销";
									break;
								default:
									"";
									applyTypeChina = "";
								}
								switch (entry.status) {
								case "draft":
									statusChina = "草稿";
									break;
								case "innerApproval":
									statusChina = "待内部审核";
									break;
								case "infoDeptApproval":
									statusChina = "待信息中心审核";
									break;
								case "innerTurnBack":
									statusChina = "内部领导退回";
									break;
								case "turnBack":
									statusChina = "信息中心领导退回";
									break;
								case "serviceDeptApproval":
									statusChina = "待维保公司审核";
									break;
								case "serviceDeptBack":
									statusChina = "维保公司退回";
									break;
								case "waitForImplement":
									statusChina = "待实施";
									break;
								case "selfDealWith":
									statusChina = "自行处理";
									break;
								case "finish":
									statusChina = "处理完毕";
									break;
								default:
									"";
									statusChina = "";
								}

								switch (entry.equipmentType) {
								case "desktop":
									equipmentTypeChina = "台式机";
									break;
								case "mobileDevice":
									equipmentTypeChina = "移动设备";
									break;
								case "specialDevice":
									equipmentTypeChina = "专用设备";
									break;
								case "other":
									equipmentTypeChina = "其它";
									break;
								default:
									"";
									equipmentTypeChina = "";
								}
								i += 1;
								tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\"  name=\"checkbox\" value="
										+ entry.id + "></td>";
								tableItem += "<td>" + i + "</td><td>"
										+ entry.userName + "</td><td>"
										+ entry.applyDept + "</td><td>"
										+ equipmentTypeChina
										+ "</td><td>"+entry.usePlace + "</td><td id=" + entry.id + ">"
										+ statusChina + "</td><td>";
								tableItem +=  entry.applyUseTime + "</td>";

								var newpage = "";
								if (entry.status == "draft"
										|| entry.status == "turnBack"
										|| entry.status == "innerTurnBack") {
									newpage = "internetAccessDetail";
								} else if (entry.status == "innerApproval") {
									newpage = "internetAccessReviewDetail";
								} else if (entry.status == "infoDeptApproval") {
									newpage = "internetAccessReviewDetail";
								} else if (entry.status == "serviceDeptApproval"
										|| entry.status == "selfDealWith"
										|| entry.status == "finish"
										|| entry.status == "waitForImplement") {
									newpage = "internetAccessReviewDetail";
								} else {
									newpage = "internetAccessDetail";
								}

								tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"
										+ firUrl
										+ "/internetResource/"
										+ newpage
										+ "?id="
										+ entry.id
										+ "');\" \></td><td>&nbsp;</td>";

								$(".table_1").append(tableItem);
							});
			$.setPageInfo(data.result);
		} else {
			for ( var i = 0; i <= 16; i++) {
				$(".table_1")
						.append(
								"<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
			}
		}
	}
};

$.postSearchForm2 = function(firUrl, paging) {

	paging += "&status_in=waitForImplement,selfDealWith";
	paging += "&sort=id desc";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/internetResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableData2(data, status, xhr, firUrl);
				$.setBtn2(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

$.analyzeTableData2 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "", equipmentTypeChina = "";
			var i = 0;
			$
					.each(
							data.result.content,
							function(entryIndex, entry) {
								// To:do
								switch (entry.applyType) {
								case "apply":
									applyTypeChina = "申请";
									break;
								case "change":
									applyTypeChina = "变更";
									break;
								case "cancel":
									applyTypeChina = "注销";
									break;
								default:
									"";
									applyTypeChina = "";
								}
								switch (entry.status) {
								case "draft":
									statusChina = "草稿";
									break;
								case "innerApproval":
									statusChina = "待内部审核";
									break;
								case "infoDeptApproval":
									statusChina = "待信息中心审核";
									break;
								case "innerTurnBack":
									statusChina = "本部门领导退回";
									break;
								case "turnBack":
									statusChina = "信息中心领导退回";
									break;
								case "serviceDeptApproval":
									statusChina = "待维保公司审核";
									break;
								case "serviceDeptBack":
									statusChina = "维保公司退回";
									break;
								case "waitForImplement":
									statusChina = "待实施";
									break;
								case "selfDealWith":
									statusChina = "自行处理";
									break;
								case "finish":
									statusChina = "处理完毕";
									break;
								default:
									"";
									statusChina = "";
								}

								switch (entry.equipmentType) {
								case "desktop":
									equipmentTypeChina = "台式机";
									break;
								case "mobileDevice":
									equipmentTypeChina = "移动设备";
									break;
								case "specialDevice":
									equipmentTypeChina = "专用设备";
									break;
								case "other":
									equipmentTypeChina = "其它";
									break;
								default:
									"";
									equipmentTypeChina = "";
								}
								i += 1;
								tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\"checkbox\" name=\"checkbox\" /></td>";
								tableItem += "<td>" + i + "</td><td>"
									+ entry.userName + "</td><td>"
									+ entry.applyDept + "</td><td>"
									+ equipmentTypeChina
									+ "</td><td>"+entry.usePlace + "</td><td id=" + entry.id + ">"
									+ statusChina + "</td><td>";
								tableItem +=  entry.applyUseTime + "</td>";

								var newpage = "";
								if (entry.status == "draft"
										|| entry.status == "turnBack"
										|| entry.status == "innerTurnBack") {
									newpage = "internetAccessDetail";
								} else if (entry.status == "innerApproval") {
									newpage = "internetAccessReviewDetail";
								} else if (entry.status == "infoDeptApproval"
										|| entry.status == "serviceDeptBack") {
									newpage = "internetAccessReviewDetail";
								} else if (entry.status == "serviceDeptApproval") {
									newpage = "internetAccessReviewDetail";
								} else if (entry.status == "selfDealWith"
										|| entry.status == "waitForImplement"
										|| entry.status == "finish") {
									newpage = "internetAccessReviewDetail";
								} else {
									newpage = "internetAccessDetail";
								}

								tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"
										+ firUrl
										+ "/internetResource/"
										+ newpage
										+ "?id="
										+ entry.id
										+ "');\" \></td><td>&nbsp;</td>";

								$(".table_1").append(tableItem);
							});
			$.setPageInfo(data.result);
		} else {
			for ( var i = 0; i <= 16; i++) {
				$(".table_1")
						.append(
								"<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
			}
		}
	}
};

$.postDetail = function(firUrl, id, isread, isleader) {
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/internetResource/get/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true && data.result
							&& JSON.stringify(data.result) != "[]") {
						var entry = data.result;
						for ( var item in entry) {
							if ($("[name=" + item + "]").length > 0) {
								$("[name=" + item + "]").val(entry[item]);
							}
						}

					}

				}

			}
		});
	}
};

$.postDele = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/internetResource/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
						window.close();
					}
				}

			}
		});
	}
};

$.getOtherData = function() {
	var otherData = "";
	if ($.getline() != "") {
		otherData += "&line=" + $.getline();
	}
	if ($.getRequirement() != "") {
		otherData += "&resourceRequirement={" + $.getRequirement() + "}";

	}
	if ($("#planStartYear").val() != "" && $("#planStartMon").val() != "") {
		otherData += "&planStartDate=" + $("#planStartYear").val() + "-"
				+ $("#planStartMon").val() + "-01";
	}
	if ($("#planEndYear").val() != "" && $("#planEndYearMon").val() != "") {

		otherData += "&planEndDate=" + $("#planEndYear").val() + "-"
				+ $("#planEndYearMon").val() + "-01";

	}
	return otherData;
};

$.postsave = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var id = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/internetResource/save",
			type : 'post',
			data : _data + otherData,
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("操作成功");
						id=data.result.id;
						
					} else {
						alert("修改失败");
					}
				} else {
					alert("修改失败");
				}

			}
		});
	}
	return id;

};
var x = 0;
$.postsave2 = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();
	
	
	// alert(_data+otherData);
	//return false;

	if (Url != "") {
		$.ajax({
					url : Url + "/basicCrud/internetResource/save",
					type : 'post',
					data : _data + otherData,
					success : function(data,status, xhr) {
						if (status == "success" && data != null) {
							if (data.success == true) {
								var b = $("input:checkbox:checked").length;
								x++;
								if(x==b){
									alert("操作成功");
								}
								window.close();
								location.href = Url
										+ "/internetResource/internetAccessList";
							} else {
								alert("修改失败");
							}
						} else {
							alert("修改失败");
						}

					}
				});
	}

};

$.setUserInfo = function(Url) {
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						$("[name=reportUnit]").val(data.companyName);
						$("[name=reportUnitId]").val(data.companyId);
						$("[name=applyer]").val(data.cookies.userName);
						$("[name=applyerLoginname]")
								.val(data.cookies.loginName);

						if (data.leaders != "") {
							for ( var sitem in data.leaders) {
								$("[name=myhandlerLoginname]").append(
										"<option value='" + sitem + "'>"
												+ data.leaders[sitem]
												+ "</option>");
							}

						}
					}
				}
			}
		});
	}
};

$.isleader = function(firUrl) {
	var _isleader = "不是领导";

	if (firUrl != "") {
		$
				.ajax({
					async : false,
					url : firUrl + "/ca/getCurrentLoginInfo",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.cookies
									&& JSON.stringify(data.cookies) != "[]") {

								if (data.cookies.loginName == "G010070003832549") {
									_isleader = "信息管理中心方政";
								} else if (data.cookies.loginName.substring(0,12) == "G01006001622") {
									_isleader = "江啸栋";
								}

								else if (data.leaders != "") {
									for ( var sitem in data.deptLeaders) {
										if (data.cookies.loginName == sitem) {

											_isleader = "本部门领导";

										}
									}
								}
							}
						}
					}
				});
	}
	return _isleader;
};
$.isInfoLeader = function(firUrl) {
	var isInfoLeader = false;

	if (firUrl != "") {
		$
				.ajax({
					async : false,
					url : firUrl + "/ca/getCurrentLoginInfo",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.cookies&& JSON.stringify(data.cookies) != "[]") {
								for ( var sitem in data.deptLeaders) {
									if (data.cookies.loginName == sitem&&data.cookies.deptId=="2549") {
										
										isInfoLeader = true;

									}
								}
							}
						}
					}
				});
	}
	return isInfoLeader;
};

$.yanzhen = function() {
	var _return = "";

	if ($("[name=userName]").val() == "" || $("[name=userName]").val() == null) {
		_return += "\r\n使用人姓名不能为空";
	}
	if ($("[name=usePlace]").val().length > 50) {
		if ($("[name=usePlace]").val() == ""
				|| $("[name=usePlace]").val() == null) {
			_return += "\r\n位置不能为空";
		} else {
			_return += "\r\n位置不能超过50个字";
		}

	}
	if ($("[name=applyUseTime]").val() == ""
			|| $("[name=applyUseTime]").val() == null) {
		_return += "\r\n申请使用时间不能为空";
	}
	if ($("[name=applyType] option:selected").val() == ""
			|| $("[name=applyType] option:selected").val() == null) {
		_return += "\r\n申请/注销不能为空";
	}

	var a = /^[0-9]*$/;
	var t1 = $("[name=contactPhone]").val();
	if (!a.test(t1)) {
		if ($("[name=contactPhone]").val() == ""
				|| $("[name=contactPhone]").val() == null) {
			_return += "\r\n联系电话不能为空";
		}
		_return += "\r\n请输入正确的联系电话";
	}
	if ($("[name=applyBusinessType]").val() != "addLocal") {
		if ($("[name=applyReason]").val().length < 5
				|| $("[name=applyReason]").val().length > 500) {
			if ($("[name=applyReason]").val() == ""
					|| $("[name=applyReason]").val() == null) {
				_return += "\r\n业务申请原因不能为空";
			} else {
				_return += "\r\n业务申请原因字数必须在5~500之间";
			}
		}
	}

	if ($("[name=applyer]").val() == "" || $("[name=applyer]").val() == null) {
		_return += "\r\n申报人不能为空";
	}

	if ($("[name=applyTime]").val() == ""
			|| $("[name=applyTime]").val() == null) {
		_return += "\r\n填报时间不能为空";
	}
	if ($("#handler option:selected").val() == ""
			|| $("#handler option:selected").val() == null) {
		_return += "\r\n必须选择一个审核领导";
	}

	return _return;
};

$.yanzhen2 = function() {
	var _return = "";
	if ($("[name=implementEngineer]").val() == ""
			|| $("[name=implementEngineer]").val() == null) {
		_return += "\r\n办理工程师不能为空";
	}
	if ($("[name=implementTime]").val() == ""
			|| $("[name=implementTime]").val() == null) {
		_return += "\r\n办理时间不能为空";
	}
	if ($("[name=implementPlace]").val() == ""
			|| $("[name=implementPlace]").val() == null) {
		_return += "\r\n开通位置不能为空";
	}
	if ($("[name=implementTime]").val() < $("[name=applyUseTime]").val()) {
		_return += "\r\n办理时间不能在申请使用时间之前";
	}
	return _return;
};

$.getListDetail = function(firUrl) {

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						$("[name=applyer]").val(data.cookies.userName);
						$("#deptName").val(data.cookies.deptName);
						$("[name=applyDept]").val(data.cookies.deptName);
						$("[name=applyDeptId]").val(data.cookies.deptId);
						$("[name=applyerLoginname]")
								.val(data.cookies.loginName);
						$("[name=initiator]").val(data.cookies.userName);
						$("[name=initiatorLoginname]").val(
								data.cookies.loginName);
						var selectItem = "<option value=''>请选择</option>";
						for ( var key in data.deptLeaders) {
							selectItem += "<option value='" + key + "'>"
									+ data.deptLeaders[key] + "</option>";
						}
						$("#handler").append(selectItem);

					}
				}
			}

		});
	}

};

$.getExport = function(firUrl, _data) {

	if (firUrl != "") {

		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/internetResource/iimsExcel",
			type : 'Get',
			datatype : 'json',
			data : "excelContent=" + _data,
			success : function(data, status, xhr) {

			}
		});

	}

};

$.getMenu = function(firUrl) {

	if (firUrl != "") {
		$
				.ajax({
					async : false,
					url : firUrl
							+ "/basicCrud/internetResource/getEntityProperty",
					type : 'post',
					datatype : 'json',
					success : function(data, status, xhr) {
						if (data.success == true
								&& data.result.fieldProperties
								&& JSON.stringify(data.result.fieldProperties) != "[]") {
							$.each(data.result.fieldProperties, function(
									entryIndex, entry) {
								if (entry.operate == "select") {
									if (entry.path == "resourceRequirement") {
										$.analyzeSelMenu(
												"myresourceRequirement",
												entry.option);
										return true;
									}

									$.analyzeSelMenu(entry.path, entry.option);
								}
							});
						}
					}
				});

	}

};

$.analyzeSelMenu = function(dataname, _obj) {
	for ( var sitem in _obj) {
		if ($("[name=" + dataname + "]").length > 0) {
			$("[name=" + dataname + "]").append(
					"<option value='" + sitem + "'>" + _obj[sitem]
							+ "</option>");
		}
	}
};

$.isPreliminaryPersonnel = function(firUrl) {
	var _isleader = false;

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						if (data.cookies.loginName == "G010070003832549") {
							_isleader = true;

						}
					}
				}
			}
		});
	}
	return _isleader;
};

$.isReviewPersonnel = function(firUrl) {
	var _isleader = false;

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						_isleader = data.cookies.userName;

					}
				}
			}
		});
	}
	return _isleader;
};

$.getPerson = function(firUrl) {
	var _isleader = "";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						_isleader = "&initiator=" + data.cookies.userName
								+ "&initiatorLoginname="
								+ data.cookies.loginName;

					}
				}
			}
		});
	}
	return _isleader;
};

$.getSuggestInDept = function(firUrl, _id) {
	if (firUrl != "") {
		$
				.ajax({
					async : false,
					url : firUrl
							+ "/basicCrud/workflowLog/all?ptype=internetResource&pid="
							+ _id + "&sort=initiateTime desc",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.result
									&& JSON.stringify(data.result) != "[]") {
								$
										.each(
												data.result,
												function(entryIndex, entry) {
													var _str = "";
													// alert(entry.status);
													switch (entry.status) {
													case "待信息中心审核":
														_str = "<div class=\"node\"><b class=\"fl\">本部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>"
																+ $(
																		"[name=applyDept]")
																		.val()
																+ "</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">"
																+ entry.initiator
																+ "<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;
													case "信息中心领导退回":

														_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>信息中心资源主管</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">"
																+ entry.initiator
																+ "<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;

													case "自行处理":
														_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>信息中心资源主管</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">方政<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;
													case "待维保公司审核":
														_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>信息中心资源主管</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">方政<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;

													case "待实施":
														_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>维保部门领导</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">"
																+ entry.initiator
																+ "<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;
													case "维保公司退回":
														_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>维保部门领导</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">"
																+ entry.initiator
																+ "<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;

													// case "处理完毕":
													// _str="<div
													// class=\"node\"><b
													// class=\"fl\">部门意见</b><div
													// class=\"clear\"></div><div
													// class=\"con\">";
													// _str+="<i>实施公司领导</i><div><p>"+entry.suggestion+"</p></div><div
													// class=\"t_r\">"+entry.initiator+"<span
													// class=\"date_02
													// mr5\">"+entry.initiateTime+"</span></div></div></div>";

													// break;
													case "内部退回":
														_str = "<div class=\"node\"><b class=\"fl\">本部门意见</b><div class=\"clear\"></div><div class=\"con\">";
														_str += "<i>"
																+ $(
																		"[name=applyDept]")
																		.val()
																+ "</i><div><p>"
																+ entry.suggestion
																+ "</p></div><div class=\"t_r\">"
																+ entry.initiator
																+ "<span class=\"date_02 mr5\">"
																+ entry.initiateTime
																+ "</span></div></div></div>";

														break;

													}

													$(
															"#leaderSuggest tbody tr td")
															.append(_str);
												});
							}
						}
					}
				});
	}

};

$.isInfoCenterleader = function(firUrl) {
	var _isleader = false;

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {

						if (data.leaders != ""
								&& data.cookies.deptName == "信息管理中心") {
							for ( var sitem in data.leaders) {

								if (data.cookies.loginName == sitem) {
									_isleader = true;

								}
							}
						}
					}
				}
			}
		});
	}
	return _isleader;
};

$.isInnerReview = function(firUrl) {
	var paging = "";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {
						paging += "&handler=" + data.cookies.loginName;
					}

				}
			}
		});
	}
	return paging;
};

$.getline = function() {
	var s = '';
	var cbline = $(".line:checked");

	for ( var i = 0; i < cbline.length; i++) {
		s += cbline[i].value + ','; // 如果选中，将value添加到变量s中
	}

	s = s.substring(0, s.length - 1);
	return s

};

$.getRequirement = function() {
	var s = '';
	var cbRequirement = $(".cbRequirement");

	for ( var i = 0; i < cbRequirement.length; i++) {
		s += "\"" + $(cbRequirement[i]).next("div").text() + '\":';

		var _Requirenum = $(cbRequirement[i]).nextAll("input[type=number]"), _rn = "";
		if (_Requirenum.length > 0 && _Requirenum.val() != "")
			_rn = _Requirenum.val();

		s += "\"{\\\"num\\\":";
		s += "\\\"" + _rn + '\\\",', s += "\\\"reason\\\":";
		s += "\\\"" + $(cbRequirement[i]).nextAll("input[type=text]").val()
				+ '\\\"}\",';
	}

	s = s.substring(0, s.length - 1);
	return s

};
$.getLoginname = function(firUrl) {
	var _isleader = "";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/ca/getCurrentLoginInfo",
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.cookies && JSON.stringify(data.cookies) != "[]") {

						_isleader = data.cookies.loginName;

					}
				}
			}
		});
	}
	return _isleader;
};
