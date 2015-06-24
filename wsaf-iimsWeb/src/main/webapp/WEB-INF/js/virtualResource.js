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

$.setBtnApply = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormApply(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormApply(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormApply(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#oututBtn")
			.click(
					function() {
						var paging = "";
						paging += "&status_in=draft,deptLeaderApproval,deptLeaderBack,infoDeptApproval,infoDeptBack,infoDeptLeaderApproval," +
						"infoDeptLeaderBack,waitForImplement,finish";
						paging+="&applyerLoginname="+$.getLoginname(firUrl);
						var content = $("#projectAppform").serialize()
								+ "&sort=id desc" + paging;
						window.location.href = firUrl
								+ "/basicCrud/virtualResource/export2Excel?"
								+ content + "&type=virtualResource";

					});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormApply(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};
$.setBtnInner = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormInner(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormInner(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormInner(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#oututBtn")
			.click(
					function() {
						var paging = "";
						paging += "&status_in=deptLeaderApproval&handler="+ $.isReviewPersonnel(firUrl);
						var content = $("#projectAppform").serialize()
								+ "&sort=id desc" + paging;
						window.location.href = firUrl
								+ "/basicCrud/virtualResource/export2Excel?"
								+ content + "&type=virtualResource";

					});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormInner(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};
$.setBtnInfoManage = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormInfoManage(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormInfoManage(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormInfoManage(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#oututBtn")
			.click(
					function() {
						var paging = "";
						paging += "&status_in=draft,deptLeaderApproval,infoDeptApproval,infoDeptLeaderApproval," +
						"infoDeptLeaderBack,waitForImplement,finish";
						var content = $("#projectAppform").serialize()
								+ "&sort=id desc" + paging;
						window.location.href = firUrl
								+ "/basicCrud/virtualResource/export2Excel?"
								+ content + "&type=virtualResource";

					});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormInfoManage(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};
$.setBtnInfoLeader = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormInfoLeader(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormInfoLeader(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormInfoLeader(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#oututBtn")
			.click(
					function() {
						var paging = "";
						paging += "&status_in=infoDeptLeaderApproval&handler="+ $.isReviewPersonnel(firUrl);//&handler="+ $.isReviewPersonnel(firUrl);
						var content = $("#projectAppform").serialize()
								+ "&sort=id desc" + paging;
						window.location.href = firUrl
								+ "/basicCrud/virtualResource/export2Excel?"
								+ content + "&type=virtualResource";

					});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormInfoLeader(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnImplement = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormImplement(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormImplement(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormImplement(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#oututBtn")
			.click(
					function() {
						var paging = "";
						paging += "&status_in=waitForImplement";//&handler="+ $.isReviewPersonnel(firUrl);
						var content = $("#projectAppform").serialize()
								+ "&sort=id desc" + paging;
						window.location.href = firUrl
								+ "/basicCrud/virtualResource/export2Excel?"
								+ content + "&type=virtualResource";

					});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormImplement(firUrl, "&pageSize=16&pageNum="
									+ topage);
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
				pd = _pageinfo.currentPage + 3;
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

$.postSearchFormApply = function(firUrl, paging) {
	if ($.isNullOrEmpty($("[name=status] option:selected"))) {
		paging += "&status_in=draft,deptLeaderApproval,deptLeaderBack,infoDeptApproval,infoDeptBack,infoDeptLeaderApproval," +
				"infoDeptLeaderBack,waitForImplement,finish";
		paging+="&applyerLoginname="+$.getLoginname(firUrl);
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
			url : firUrl + "/basicCrud/virtualResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			dataType : 'json',
			success : function(data, status, xhr) {
				$.analyzeTableData(data, status, xhr, firUrl);
				$.setBtnApply(firUrl);

			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};
$.postSearchFormInner = function(firUrl, paging) {
	if ($.isNullOrEmpty($("[name=status] option:selected"))) {
		paging += "&status_in=deptLeaderApproval&handler="+ $.isReviewPersonnel(firUrl);
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
			url : firUrl + "/basicCrud/virtualResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			dataType : 'json',
			success : function(data, status, xhr) {

				$.analyzeTableData(data, status, xhr, firUrl);
				$.setBtnInner(firUrl);

			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};
$.postSearchFormInfoManage = function(firUrl, paging) {
	if ($.isNullOrEmpty($("[name=status] option:selected"))) {
		paging += "&status_in=draft,deptLeaderApproval,infoDeptApproval,infoDeptLeaderApproval," +
		"infoDeptLeaderBack,finish";
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
			url : firUrl + "/basicCrud/virtualResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			dataType : 'json',
			success : function(data, status, xhr) {

				$.analyzeTableData(data, status, xhr, firUrl);
				$.setBtnInfoManage(firUrl);

			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};
$.postSearchFormInfoLeader = function(firUrl, paging) {
	if ($.isNullOrEmpty($("[name=status] option:selected"))) {
		paging += "&status_in=deptLeaderApproval,infoDeptLeaderApproval&handler="+ $.isReviewPersonnel(firUrl);//&handler="+ $.isReviewPersonnel(firUrl);
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
			url : firUrl + "/basicCrud/virtualResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			dataType : 'json',
			success : function(data, status, xhr) {

				$.analyzeTableData(data, status, xhr, firUrl);
				$.setBtnInfoLeader(firUrl);

			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};
$.postSearchFormImplement = function(firUrl, paging) {
	if ($.isNullOrEmpty($("[name=status] option:selected"))) {
		paging += "&status_in=waitForImplement";
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
			url : firUrl + "/basicCrud/virtualResource/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			dataType : 'json',
			success : function(data, status, xhr) {

				$.analyzeTableData(data, status, xhr, firUrl);
				$.setBtnImplement(firUrl);

			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};
// 解析Table
$.analyzeTableData = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();
		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "", statusChina = "";
			var i = 0;
			var name = $.getLoginname(firUrl);
			
			$.each(data.result.content,function(entryIndex, entry) {
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
				case "deptLeaderApproval":
					statusChina = "待部门领导审核";
					break;
				case "deptLeaderBack":
					statusChina = "部门领导退回";
					break;
				case "infoDeptApproval":
					statusChina = "待信息中心审核";
					break;
				case "infoDeptBack":
					statusChina = "信息中心退回";
					break;
				case "infoDeptLeaderApproval":
					statusChina = "待信息中心领导审核";
					break;
				case "infoDeptLeaderBack":
					statusChina = "信息中心领导退回";
					break;
				case "waitForImplement":
					statusChina = "待实施";
					break;
				case "finish":
					statusChina = "处理完毕";
					break;
				default:
					"";
					statusChina = "";
				}
				i += 1;
				tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\"  name=\"checkbox\" value="
						+ entry.id + "></td>";
				tableItem += "<td>" + i + "</td><td>"
						+ entry.userName + "</td><td>"
						+ entry.applyDept + "</td><td>"
						+ entry.projectName
						+ "</td><td id=" + entry.id + ">"
						+ statusChina + "</td><td>";
				tableItem += entry.applyUseTime.substring(0,10) + "</td>";

				var newpage = "";
				if (entry.status == "draft"
						|| entry.status == "deptLeaderBack"
						|| entry.status == "infoDeptBack") {
					newpage = "virtualResourceDraft";
				} else if (entry.status == "deptLeaderApproval") {
					newpage = "virtualResourceInnerAudit";
				} else if (entry.status == "infoDeptApproval"|| entry.status == "infoDeptLeaderBack") {
					newpage = "virtualResourceInfoManageAudit";
				} else if (entry.status == "infoDeptLeaderApproval") {
					newpage = "virtualResourceInfoLeaderAudit";
				}else if (entry.status == "waitForImplement") {
					newpage = "virtualResourceWaitForImplement";
				}else if (entry.status == "finish") {
					newpage = "virtualResourceFinish";
				}  else {
					newpage = "virtualResourceDraft";
				}

				tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"详情\" onclick=\"window.open('"
						+ firUrl
						+ "/virtualResource/"
						+ newpage
						+ "?id="
						+ entry.id
						+ "');\" \></td><td>&nbsp;</td><td>&nbsp;</td>";

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

$.postsave = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();
//	alert( _data + otherData);
//	return false;
	var id = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/virtualResource/save",
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
					url : Url + "/basicCrud/virtualResource/save",
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
$.postDele = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/netResource/del/" + id,
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

$.yanzhen = function() {
	var _return = "";

	if ($("[name=userName]").val() == "" || $("[name=userName]").val() == null) {
		_return += "\r\n使用人姓名不能为空";
	}
	if ($("[name=applyUseTime]").val() == ""
			|| $("[name=applyUseTime]").val() == null) {
		_return += "\r\n申请使用时间不能为空";
	}
	if ($("[name=projectName]").val() == ""
			|| $("[name=projectName]").val() == null) {
		_return += "\r\n所属项目不能为空";
	}
	if ($("[name=projectPrincipal]").val() == ""
			|| $("[name=projectPrincipal]").val() == null) {
		_return += "\r\n业项目负责人不能为空";
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
	if ($("[name=virtualServer]").val() == "" || $("[name=virtualServer]").val() == null) {
		_return += "\r\n虚拟服务器不能为空";
	}
	if ($("[name=cpu]").val() == "" || $("[name=cpu]").val() == null) {
		_return += "\r\nCPU不能为空";
	}
	if ($("[name=memory]").val() == "" || $("[name=memory]").val() == null) {
		_return += "\r\n内存大小不能为空";
	}
	if ($("[name=hardDisk]").val() == "" || $("[name=hardDisk]").val() == null) {
		_return += "\r\n硬盘大小不能为空";
	}

	if ($("[name=applyer]").val() == "" || $("[name=applyer]").val() == null) {
		_return += "\r\n申报人不能为空";
	}

	if ($("[name=applyTime]").val() == ""
			|| $("[name=applyTime]").val() == null) {
		_return += "\r\n填报时间不能为空";
	}
	if ($("#handler option:selected").val() == ""|| $("#handler option:selected").val() == null) {
		_return += "\r\n必须选择一个审核领导";
	}
	if ($("[name=opsysDescription]").val() == ""|| $("[name=opsysDescription]").val() == null) {
		_return += "\r\n操作系统描述不能为空";
	}
	if ($("[name=opsys]").val() == ""|| $("[name=opsys]").val() == null) {
		_return += "\r\n操作系个数为空";
	}
	if ($("[name=dbDescription]").val() == ""|| $("[name=dbDescription]").val() == null) {
		_return += "\r\n数据库描述不能为空";
	}
	if ($("[name=db]").val() == ""|| $("[name=db]").val() == null) {
		_return += "\r\n数据库个数不能为空";
	}
	if ($("[name=middlewareDescription]").val() == ""|| $("[name=middlewareDescription]").val() == null) {
		_return += "\r\n中间件描述不能为空";
	}
	if ($("[name=middleware]").val() == ""|| $("[name=middleware]").val() == null) {
		_return += "\r\n中间件个数不能为空";
	}

	return _return;
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
							+ "/basicCrud/workflowLog/all?ptype=virtualResource&pid="
							+ _id + "&sort=initiateTime desc",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.result&& JSON.stringify(data.result) != "[]") {
								$.each(data.result,function(entryIndex, entry) {
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
									case "信息中心退回":

										_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
										_str += "<i>信息中心管理岗</i><div><p>"
												+ entry.suggestion
												+ "</p></div><div class=\"t_r\">"
												+ entry.initiator
												+ "<span class=\"date_02 mr5\">"
												+ entry.initiateTime
												+ "</span></div></div></div>";

										break;

									case "待信息中心领导审核":
										_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
										_str += "<i>信息中心管理岗</i><div><p>"
											+ entry.suggestion
											+ "</p></div><div class=\"t_r\">"
											+ entry.initiator
											+ "<span class=\"date_02 mr5\">"
											+ entry.initiateTime
											+ "</span></div></div></div>";

										break;
									case "信息中心领导退回":
										_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
										_str += "<i>信息中心领导</i><div><p>"
											+ entry.suggestion
											+ "</p></div><div class=\"t_r\">"
											+ entry.initiator
											+ "<span class=\"date_02 mr5\">"
											+ entry.initiateTime
											+ "</span></div></div></div>";


										break;

									case "待实施":
										_str = "<div class=\"node\"><b class=\"fl\">部门意见</b><div class=\"clear\"></div><div class=\"con\">";
										_str += "<i>信息中心领导</i><div><p>"
												+ entry.suggestion
												+ "</p></div><div class=\"t_r\">"
												+ entry.initiator
												+ "<span class=\"date_02 mr5\">"
												+ entry.initiateTime
												+ "</span></div></div></div>";

										break;

									case "部门领导退回":
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
$.isleader = function(firUrl) {
	var _isleader = "applyer";

	if (firUrl != "") {
		$.ajax({
					async : false,
					url : firUrl + "/ca/getCurrentLoginInfo",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.cookies&& JSON.stringify(data.cookies) != "[]") {

								if (data.cookies.loginName == "G010070003832549") {
									_isleader = "fz";
								}else if (data.leaders != "") {
									for ( var sitem in data.deptLeaders) {
										if (data.cookies.loginName == sitem) {

											_isleader = "innerLeader";

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




$.getCompany=function(firUrl){
			var CompanyData=[];	
			 $.ajax({
				    url : firUrl +"/basicCrud/projectPlan/all?status=intoStore",
					type : 'post',
					async: false,
					datatype:'json',
					success: function(data, status, xhr) {
						if (status == "success" && data != null&&data!="[]"){	
							$.each(data.result,function(entryIndex, entry) {
								var dataX = {
										label: entry.projectName,
 		                                projectId: entry.id
								};
								CompanyData.push(dataX);
							});
						}						
				}
    	});
			 $("[name=projectName]").autocomplete({
				  source: CompanyData,
				  select: function (event, ui) {
	                    $("[name=projectId]").val(ui.item.projectId);
	                }

			});
			 
};

