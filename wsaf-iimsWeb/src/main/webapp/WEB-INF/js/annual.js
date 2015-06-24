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
$.setBtnIndex_1 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormIndex_1(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormIndex_1(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormIndex_1(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormIndex_1(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnIndex_11 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormIndex_11(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormIndex_11(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormIndex_11(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormIndex_11(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnIndex_2 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormIndex_2(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormIndex_2(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormIndex_2(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormIndex_2(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnIndex_22 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormIndex_22(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormIndex_22(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormIndex_22(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormIndex_22(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};


$.setBtnIndex_3 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormIndex_3(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormIndex_3(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormIndex_3(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormIndex_3(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};


$.setBtnSpecial = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormSpecial(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormSpecial(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormSpecial(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormSpecial(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnSpecialOther = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormSpecialOther(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormSpecialOther(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormSpecialOther(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormSpecialOther(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnAnnualCost1 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormAnnualCost1(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormAnnualCost1(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormAnnualCost1(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormAnnualCost1(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnProjectCost = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormProjectCost(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormProjectCost(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormProjectCost(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormProjectCost(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnProjectCost1 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormProjectCost1(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormProjectCost1(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormProjectCost1(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormProjectCost1(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnAnnualCost2 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormAnnualCost2(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormAnnualCost2(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormAnnualCost2(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormAnnualCost2(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setBtnAnnualCost11 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormAnnualCost11(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormAnnualCost11(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormAnnualCost11(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormAnnualCost11(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};


$.setBtnAnnualCost22 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormAnnualCost22(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormAnnualCost22(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormAnnualCost22(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormAnnualCost22(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};



$.setBtnSpecialBudget = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormSpecialBudget(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormSpecialBudget(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormSpecialBudget(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormSpecialBudget(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};


$.setBtnSpecialBudget2 = function(firUrl) {
	$(".topage").click(
			function() {
				$.postSearchFormSpecialBudget2(firUrl, "&pageSize=16&pageNum="
						+ $(this).text());

			});

	$(".prepage").click(
			function() {
				var nowpage = parseInt($("#page>.selected a").text());

				if (nowpage > 1) {
					var topage = nowpage - 1;
					$.postSearchFormSpecialBudget2(firUrl, "&pageSize=16&pageNum=" + topage);
				}
			});

	$(".nextpage").click(
			function() {
				var nextpage = parseInt($("#page>.selected a").text()) + 1;

				if (nextpage <= parseInt($("#gopage").attr("max")))
					$.postSearchFormSpecialBudget2(firUrl,
							"&pageSize=16&pageNum=" + nextpage);

			});

	$("#gopagebtn")
			.click(
					function() {
						var topage = parseInt($("#gopage").val());

						if (topage <= parseInt($("#gopage").attr("max"))
								&& topage >= 1) {
							$.postSearchFormSpecialBudget2(firUrl, "&pageSize=16&pageNum="
									+ topage);
						} else {
							alert("超出索引值");
						}
					});
};

$.setPageInfo = function(result){
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
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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


$.setPageInfo_1= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$("#tableService").find(".tableItem");
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
				$("#tableService").append(con+"</tr>");
				}
			}
		
         $("#tableService .tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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

$.setPageInfo_11= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$("#tableService").find(".tableItem");
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
				$("#tableService").append(con+"</tr>");
				}
			}
		
         $("#tableService .tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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

$.setPageInfo_2= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$("#tableOrgan").find(".tableItem");
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
				$("#tableOrgan").append(con+"</tr>");
				}
			}
		
         $("#tableOrgan .tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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

$.setPageInfo_22 = function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$("#tableOrgan").find(".tableItem");
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
				$("#tableOrgan").append(con+"</tr>");
				}
			}
		
         $("#tableOrgan .tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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

$.setPageInfo_3= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$("#tableSpecial").find(".tableItem");
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
				$("#tableSpecial").append(con+"</tr>");
				}
			}
		
         $("#tableSpecial .tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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

$.setPageInfo_33= function(result){
	if (result.pageInfo != null) 
	{
		var _pageinfo=result.pageInfo;
		var nowcount=$("#tableSpecial").find(".tableItem");
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
				$("#tableSpecial").append(con+"</tr>");
				}
			}
		
         $("#tableSpecial .tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
         
         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
        
         var  pageStyle="";
         if(_pageinfo.totalPages>7){
        	 if(_pageinfo.currentPage<=1)
        		 {
        		   pageStyle+="<li><a class=\"topage\">"+_pageinfo.totalPages+"</a></li>"+"<li><a>...</a></li><li><a class=\"topage\">5</a></li><li><a class=\"topage\">4</a></li><li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
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

$.tab = function(){
	$("#service").click(function(){
		$(this).attr("class","selected");
		$("#organ").removeAttr("class","selected");
		$("#special").removeAttr("class","selected");
		$("#mb10_1").css("display","inline");
		$("#mb10_2").css("display","none");
		$("#mb10_3").css("display","none");
	});
	$("#organ").click(function(){
		$(this).attr("class","selected");
		$("#service").removeAttr("class","selected");
		$("#special").removeAttr("class","selected");
		$("#mb10_1").css("display","none");
		$("#mb10_2").css("display","inline");
		$("#mb10_3").css("display","none");
	});
	$("#special").click(function(){
		$(this).attr("class","selected");
		$("#organ").removeAttr("class","selected");
		$("#service").removeAttr("class","selected");
		$("#mb10_1").css("display","none");
		$("#mb10_2").css("display","none");
		$("#mb10_3").css("display","inline");
	});
};


$.postSearchFormIndex_1 = function(firUrl, paging) {
	paging += "&sort=id desc";
	paging += "&type=service";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/annualCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataIndex_1(data, status, xhr, firUrl);
				$.setBtnIndex_1(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataIndex_1 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("#tableService tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("#tableService tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						var totalBudget="",totalSigned="",totalPaied="",signedPercent="",
						paiedPercent="",totalUnsigned="",totalUnpaied="";
						if(entry.totalBudget!=null&&
								entry.totalSigned!=null&&
								entry.totalPaied!=null&&
								entry.signedPercent!=null&&
								entry.paiedPercent!=null&&
								entry.totalUnsigned!=null&&
								entry.totalUnpaied!=null){
						
							totalBudget=entry.totalBudget.toFixed(2);
							totalSigned=entry.totalSigned.toFixed(2);
							totalPaied=entry.totalPaied.toFixed(2);
							signedPercent=entry.signedPercent.toFixed(2);
							paiedPercent=entry.paiedPercent.toFixed(2);
							totalUnsigned=entry.totalUnsigned.toFixed(2);
							totalUnpaied=entry.totalUnpaied.toFixed(2);
						}
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.year + "</td><td>"
								+ totalBudget + "</td><td>"
								+ totalSigned + "</td><td>"
								+ totalPaied  + "</td><td>"
								+ Math.round(signedPercent*100) + "%</td><td>"
								+ Math.round(paiedPercent*100) + "%</td><td>"
								+ totalUnsigned + "</td><td>"
								+ totalUnpaied + "</td>";
						      
	
						
						tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/annualCost"
								+ "/annualCostAddService"
								+ "?id="
								+ entry.id
								+ "');\" \>"
								+"&nbsp;&nbsp;"
								+"<input type=\"button\" name=\"delete\"  value=\"删除\" onclick=\"del("+entry.id+");\" \></td>";
	
						$("#tableService").append(tableItem);
					});
		$.setPageInfo_1(data.result);
		} else {
			$("#tableService .tfoot span:first-child").text("当前无记录显示");
		}
	}
};

$.postSearchFormIndex_2 = function(firUrl, paging) {
	paging += "&sort=id desc";
	paging += "&type=groupUnit";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/annualCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataIndex_2(data, status, xhr, firUrl);
				$.setBtnIndex_2(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataIndex_2 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("#tableOrgan tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("#tableOrgan tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						var totalBudget="",totalSigned="",totalPaied="",signedPercent="",
						paiedPercent="",totalUnsigned="",totalUnpaied="";
						if(entry.totalBudget!=null&&
								entry.totalSigned!=null&&
								entry.totalPaied!=null&&
								entry.signedPercent!=null&&
								entry.paiedPercent!=null&&
								entry.totalUnsigned!=null&&
								entry.totalUnpaied!=null){
						
							totalBudget=entry.totalBudget.toFixed(2);
							totalSigned=entry.totalSigned.toFixed(2);
							totalPaied=entry.totalPaied.toFixed(2);
							signedPercent=entry.signedPercent.toFixed(2);
							paiedPercent=entry.paiedPercent.toFixed(2);
							totalUnsigned=entry.totalUnsigned.toFixed(2);
							totalUnpaied=entry.totalUnpaied.toFixed(2);
						}
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.year + "</td><td>"
								+ totalBudget + "</td><td>"
								+ totalSigned + "</td><td>"
								+ totalPaied  + "</td><td>"
								+ Math.round(signedPercent*100) + "%</td><td>"
								+ Math.round(paiedPercent*100) + "%</td><td>"
								+ totalUnsigned + "</td><td>"
								+ totalUnpaied + "</td>";
						      
	
						
						tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/annualCost"
								+ "/annualCostAddOrgan"
								+ "?id="
								+ entry.id
								+ "');\" \>"
								+"&nbsp;&nbsp;"
								+"<input type=\"button\" name=\"delete\"  value=\"删除\" onclick=\"del("+entry.id+");\" \></td>";
	
						$("#tableOrgan").append(tableItem);
					});
		$.setPageInfo_2(data.result);
		} else {
			$("#tableOrgan .tfoot span:first-child").text("当前无记录显示");
		}
	}
};


$.postSearchFormIndex_11 = function(firUrl, paging) {
	paging += "&sort=id desc";
	paging += "&type=service";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/annualCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataIndex_11(data, status, xhr, firUrl);
				$.setBtnIndex_11(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataIndex_11 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("#tableService tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("#tableService tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var totalBudget="",totalSigned="",totalPaied="",signedPercent="",
						paiedPercent="",totalUnsigned="",totalUnpaied="";
						if(entry.totalBudget!=null&&
								entry.totalSigned!=null&&
								entry.totalPaied!=null&&
								entry.signedPercent!=null&&
								entry.paiedPercent!=null&&
								entry.totalUnsigned!=null&&
								entry.totalUnpaied!=null){
						
							totalBudget=entry.totalBudget.toFixed(2);
							totalSigned=entry.totalSigned.toFixed(2);
							totalPaied=entry.totalPaied.toFixed(2);
							signedPercent=entry.signedPercent.toFixed(2);
							paiedPercent=entry.paiedPercent.toFixed(2);
							totalUnsigned=entry.totalUnsigned.toFixed(2);
							totalUnpaied=entry.totalUnpaied.toFixed(2);
						}
						
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.year + "</td><td>"
								+ totalBudget + "</td><td>"
								+ totalSigned + "</td><td>"
								+ totalPaied  + "</td><td>"
								+ Math.round(signedPercent*100) + "%</td><td>"
								+ Math.round(paiedPercent*100) + "%</td><td>"
								+ totalUnsigned + "</td><td>"
								+ totalUnpaied + "</td>";
						      
	
						
						tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/annualCost"
								+ "/annualCostAddServiceOther"
								+ "?id="
								+ entry.id
								+ "');\" \>"
								+"</td>";
	
						$("#tableService").append(tableItem);
					});
		$.setPageInfo_11(data.result);
		} else {
			$("#tableService .tfoot span:first-child").text("当前无记录显示");
		}
	}
};

$.postSearchFormIndex_22 = function(firUrl, paging) {
	paging += "&sort=id desc";
	paging += "&type=groupUnit";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/annualCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataIndex_22(data, status, xhr, firUrl);
				$.setBtnIndex_22(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataIndex_22 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("#tableOrgan tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("#tableOrgan tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var totalBudget="",totalSigned="",totalPaied="",signedPercent="",
						paiedPercent="",totalUnsigned="",totalUnpaied="";
						if(entry.totalBudget!=null&&
								entry.totalSigned!=null&&
								entry.totalPaied!=null&&
								entry.signedPercent!=null&&
								entry.paiedPercent!=null&&
								entry.totalUnsigned!=null&&
								entry.totalUnpaied!=null){
						
							totalBudget=entry.totalBudget.toFixed(2);
							totalSigned=entry.totalSigned.toFixed(2);
							totalPaied=entry.totalPaied.toFixed(2);
							signedPercent=entry.signedPercent.toFixed(2);
							paiedPercent=entry.paiedPercent.toFixed(2);
							totalUnsigned=entry.totalUnsigned.toFixed(2);
							totalUnpaied=entry.totalUnpaied.toFixed(2);
						}
						
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.year + "</td><td>"
								+ totalBudget + "</td><td>"
								+ totalSigned + "</td><td>"
								+ totalPaied  + "</td><td>"
								+ signedPercent*100 + "%</td><td>"
								+ paiedPercent*100 + "%</td><td>"
								+ totalUnsigned + "</td><td>"
								+ totalUnpaied + "</td>";
						      
	
						
						tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/annualCost"
								+ "/annualCostAddOrganOther"
								+ "?id="
								+ entry.id
								+ "');\" \>"
								+"</td>";
	
						$("#tableOrgan").append(tableItem);
					});
		$.setPageInfo_22(data.result);
		} else {
			$("#tableOrgan .tfoot span:first-child").text("当前无记录显示");
		}
	}
};


$.postSearchFormIndex_3 = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/special/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataIndex_3(data, status, xhr, firUrl);
				$.setBtnIndex_3(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataIndex_3 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("#tableSpecial tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("#tableSpecial tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						var planReportBudget = "",repliedBudget = "",
						unrepliedBudget = "",repliedPercent = "",
						lastYearBudget = "",thisYearBudget = "",
						planSignAmount = "",signedAmount = "",
						unsignedAmount = "",signedPercent = "",
						planPaiedAmount = "",paiedAmount = "",
						unpaiedAmount = "",paiedPercent = "";
						
						if(entry.planReportBudget!=null&&
								entry.repliedBudget!=null&&
								entry.unrepliedBudget!=null&&
								entry.repliedPercent!=null&&
								entry.lastYearBudget!=null&&
								entry.thisYearBudget!=null&&
								entry.planSignAmount!=null&&
								entry.signedAmount!=null&&
								entry.unsignedAmount!=null&&
								entry.signedPercent!=null&&
								entry.planPaiedAmount!=null&&
								entry.paiedAmount!=null&&
								entry.unpaiedAmount!=null&&
								entry.paiedPercent!=null){
						
								planReportBudget=entry.planReportBudget.toFixed(2);
								repliedBudget=entry.repliedBudget.toFixed(2);
								unrepliedBudget=entry.unrepliedBudget.toFixed(2);
								repliedPercent=entry.repliedPercent.toFixed(4);
								lastYearBudget=entry.lastYearBudget.toFixed(2);
								thisYearBudget=entry.thisYearBudget.toFixed(2);
								planSignAmount=entry.planSignAmount.toFixed(2);
								
								signedAmount=entry.signedAmount.toFixed(2);
								unsignedAmount=entry.unsignedAmount.toFixed(2);
								signedPercent=entry.signedPercent.toFixed(4);
								planPaiedAmount=entry.planPaiedAmount.toFixed(2);
								paiedAmount=entry.paiedAmount.toFixed(2);
								unpaiedAmount=entry.unpaiedAmount.toFixed(2);
								paiedPercent=entry.paiedPercent.toFixed(4);
						}
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.year + "</td><td>"
								+ planReportBudget + "</td><td>"
								+ repliedBudget + "</td><td>"
								+ unrepliedBudget  + "</td><td>"
								+ Math.round(repliedPercent*100) + "%</td><td>"
								+ lastYearBudget + "</td><td>"
								+ thisYearBudget + "</td><td>"
								+ planSignAmount + "</td><td>"
								
								+ signedAmount + "</td><td>"
								+ unsignedAmount + "</td><td>"
								+ Math.round(signedPercent*100) + "%</td><td>"
								+ planPaiedAmount  + "</td><td>"
								+ paiedAmount + "</td><td>"
								+ unpaiedAmount + "</td><td>"
								+ Math.round(paiedPercent*100) + "%</td>";
						      
						
						tableItem += "<td><input type=\"button\" name=\"button\"  value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/special"
								+ "/specialAdd"
								+ "?specialId="
								+ entry.id
								+ "');\" \>"
								+"&nbsp;&nbsp;"
								+"<td><input type=\"button\" name=\"delete\"  value=\"删除\" onclick=\"delSpecial("+entry.id+");\" \></td>";
						$("#tableSpecial").append(tableItem);
					});
		$.setPageInfo_3(data.result);
		} else {
			$("#tableSpecial .tfoot span:first-child").text("当前无记录显示");
		}
	}
};
$.postSearchFormIndex_33 = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/special/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataIndex_33(data, status, xhr, firUrl);
				$.setBtnIndex_3(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataIndex_33 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("#tableSpecial tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("#tableSpecial tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var planReportBudget = "",repliedBudget = "",
						unrepliedBudget = "",repliedPercent = "",
						lastYearBudget = "",thisYearBudget = "",
						planSignAmount = "",signedAmount = "",
						unsignedAmount = "",signedPercent = "",
						planPaiedAmount = "",paiedAmount = "",
						unpaiedAmount = "",paiedPercent = "";
						
						if(entry.planReportBudget!=null&&
								entry.repliedBudget!=null&&
								entry.unrepliedBudget!=null&&
								entry.repliedPercent!=null&&
								entry.lastYearBudget!=null&&
								entry.thisYearBudget!=null&&
								entry.planSignAmount!=null&&
								entry.signedAmount!=null&&
								entry.unsignedAmount!=null&&
								entry.signedPercent!=null&&
								entry.planPaiedAmount!=null&&
								entry.paiedAmount!=null&&
								entry.unpaiedAmount!=null&&
								entry.paiedPercent!=null){
						
								planReportBudget=entry.planReportBudget.toFixed(2);
								repliedBudget=entry.repliedBudget.toFixed(2);
								unrepliedBudget=entry.unrepliedBudget.toFixed(2);
								repliedPercent=entry.repliedPercent.toFixed(4);
								lastYearBudget=entry.lastYearBudget.toFixed(2);
								thisYearBudget=entry.thisYearBudget.toFixed(2);
								planSignAmount=entry.planSignAmount.toFixed(2);
								
								signedAmount=entry.signedAmount.toFixed(2);
								unsignedAmount=entry.unsignedAmount.toFixed(2);
								signedPercent=entry.signedPercent.toFixed(4);
								planPaiedAmount=entry.planPaiedAmount.toFixed(2);
								paiedAmount=entry.paiedAmount.toFixed(2);
								unpaiedAmount=entry.unpaiedAmount.toFixed(2);
								paiedPercent=entry.paiedPercent.toFixed(4);
						}
						
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.year + "</td><td>"
								+ planReportBudget + "</td><td>"
								+ repliedBudget + "</td><td>"
								+ unrepliedBudget  + "</td><td>"
								+ Math.round(repliedPercent*100) + "%</td><td>"
								+ lastYearBudget + "</td><td>"
								+ thisYearBudget + "</td><td>"
								+ planSignAmount + "</td><td>"
								
								+ signedAmount + "</td><td>"
								+ unsignedAmount + "</td><td>"
								+ Math.round(signedPercent*100) + "%</td><td>"
								+ planPaiedAmount  + "</td><td>"
								+ paiedAmount + "</td><td>"
								+ unpaiedAmount + "</td><td>"
								+ Math.round(paiedPercent*100) + "%</td>";
						      
						
						tableItem += "<td><input type=\"button\" name=\"button\"  value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/special"
								+ "/specialAddOther"
								+ "?specialId="
								+ entry.id
								+ "');\" \>"
								+"&nbsp;&nbsp;"
								+"</td>";
						$("#tableSpecial").append(tableItem);
					});
		$.setPageInfo_33(data.result);
		} else {
			$("#tableSpecial .tfoot span:first-child").text("当前无记录显示");
		}
	}
};

$.postSearchFormSpecial = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/contractCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataSpecial(data, status, xhr, firUrl);
				$.setBtnSpecial(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataSpecial = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var amount="",paied="",
						unpaied="",percent="",
						planAdvancePay="",actualAdvancePay="",
						planProgressPay="",actualProgressPay="",
						planAcceptancePay="",actualAcceptancePay="",
						planWarrantyPay="",actualWarrantyPay="";
						
						if(entry.amount!=null&&
								entry.paied!=null&&
								entry.unpaied!=null&&
								entry.percent!=null&&
								entry.planAdvancePay!=null&&
								entry.actualAdvancePay!=null&&
								entry.planProgressPay!=null&&
								entry.actualProgressPay!=null&&
								entry.planAcceptancePay!=null&&
								entry.actualAcceptancePay!=null&&
								entry.planWarrantyPay!=null&&
								entry.actualWarrantyPay!=null){
						
								amount=entry.amount.toFixed(2);
								paied=entry.paied.toFixed(2);
								unpaied=entry.unpaied.toFixed(2);
								percent=entry.percent.toFixed(4);
								planAdvancePay=entry.planAdvancePay.toFixed(2);
								actualAdvancePay=entry.actualAdvancePay.toFixed(2);
								planProgressPay=entry.planProgressPay.toFixed(2);
								actualProgressPay=entry.actualProgressPay.toFixed(2);
								planAcceptancePay=entry.planAcceptancePay.toFixed(2);
								actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
								planWarrantyPay=entry.planWarrantyPay.toFixed(2);
								actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						}
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.contractName + "</td><td>"
								+ entry.planSignTime + "</td><td>"
								+ amount + "</td><td>"
								+ paied  + "</td><td>"
								+ unpaied + "</td><td>"
								+ Math.round(percent*100) + "%</td><td>"
								+ planAdvancePay + "</td><td>"
								+ actualAdvancePay + "</td><td>"
						        + planProgressPay + "</td><td>"
						        + actualProgressPay + "</td><td>"
						        + planAcceptancePay + "</td><td>"
						        + actualAcceptancePay + "</td><td>"
						        + planWarrantyPay + "</td><td>"
						        + actualWarrantyPay + "</td><td>"
						        + entry.implementation + "</td>";
	
						
						tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/annualCost"
								+ "/specialService"
								+ "?id="
								+ entry.id
								+ "');\" \>"
								+"&nbsp;&nbsp;"
								+"<input type=\"button\" name=\"delete\" value=\"删除\" onclick=\"del("+entry.id+");\" \></td>";
	
						$(".table_1").append(tableItem);
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
};

$.postSearchFormSpecialOther = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/contractCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataSpecialOther(data, status, xhr, firUrl);
				$.setBtnSpecialOther(firUrl);
				
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataSpecialOther = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var amount="",paied="",
						unpaied="",percent="",
						planAdvancePay="",actualAdvancePay="",
						planProgressPay="",actualProgressPay="",
						planAcceptancePay="",actualAcceptancePay="",
						planWarrantyPay="",actualWarrantyPay="";
						
						if(entry.amount!=null&&
								entry.paied!=null&&
								entry.unpaied!=null&&
								entry.percent!=null&&
								entry.planAdvancePay!=null&&
								entry.actualAdvancePay!=null&&
								entry.planProgressPay!=null&&
								entry.actualProgressPay!=null&&
								entry.planAcceptancePay!=null&&
								entry.actualAcceptancePay!=null&&
								entry.planWarrantyPay!=null&&
								entry.actualWarrantyPay!=null){
						
								amount=entry.amount.toFixed(2);
								paied=entry.paied.toFixed(2);
								unpaied=entry.unpaied.toFixed(2);
								percent=entry.percent.toFixed(4);
								planAdvancePay=entry.planAdvancePay.toFixed(2);
								actualAdvancePay=entry.actualAdvancePay.toFixed(2);
								planProgressPay=entry.planProgressPay.toFixed(2);
								actualProgressPay=entry.actualProgressPay.toFixed(2);
								planAcceptancePay=entry.planAcceptancePay.toFixed(2);
								actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
								planWarrantyPay=entry.planWarrantyPay.toFixed(2);
								actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						}
						
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td>" + i + "</td><td>"
								+ entry.contractName + "</td><td>"
								+ entry.planSignTime + "</td><td>"
								+ amount + "</td><td>"
								+ paied  + "</td><td>"
								+ unpaied + "</td><td>"
								+ Math.round(percent*100) + "%</td><td>"
								+ planAdvancePay + "</td><td>"
								+ actualAdvancePay + "</td><td>"
						        + planProgressPay + "</td><td>"
						        + actualProgressPay + "</td><td>"
						        + planAcceptancePay + "</td><td>"
						        + actualAcceptancePay + "</td><td>"
						        + planWarrantyPay + "</td><td>"
						        + actualWarrantyPay + "</td><td>"
						        + entry.implementation + "</td>";
	
						
						tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
								+ firUrl
								+ "/annualCost"
								+ "/specialServiceOther"
								+ "?id="
								+ entry.id
								+ "');\" \>"
								+"</td>";
	
						$(".table_1").append(tableItem);
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
};

$.postSearchFormAnnualCost1 = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/projectCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataAnnualCost1(data, status, xhr, firUrl);
				$.setBtnAnnualCost1(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataAnnualCost1 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						i += 1;
					var reportBudget = "",budget = "";	
						
						if(entry.reportBudget!=null&&entry.budget!=null){
							reportBudget=entry.reportBudget.toFixed(2);
							budget=entry.budget.toFixed(2);
						}
						var tableItem_2 = $.postSearchFormAnnualCost2(firUrl,"",entry.id);
						var j = tableItem_2.indexOf("</tr>"),sum=0;
						while(j>-1){
							sum+=1;
							j = tableItem_2.indexOf("</tr>",j+1);
						}
						tableItem = "<tr class=\"tableItem\" id=\"t_"+i+"\">";
						tableItem += "<td rowspan='"+sum+"'>" + i + "</td><td rowspan='"+sum+"'>"
								+ entry.projectName + "</td><td rowspan='"+sum+"'>"
								+ reportBudget + "</td><td rowspan='"+sum+"'>"
								+ budget + "</td>";
						tableItem += tableItem_2;
								
						
						
	
						$(".table_1").append(tableItem);
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
};


$.postSearchFormProjectCost = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/projectCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataProjectCost(data, status, xhr, firUrl);
				$.setBtnProjectCost(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataProjectCost = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						i += 1;
						var budget = "";
						if(entry.budget!=null){
							budget=entry.budget.toFixed(2);
						}
						var tableItem_2 = $.postSearchFormProjectCost2(firUrl,"",entry.id);
						var j = tableItem_2.indexOf("</tr>"),sum=0;
						while(j>-1){
							sum+=1;
							j = tableItem_2.indexOf("</tr>",j+1);
						}
						tableItem = "<tr class=\"tableItem\" id=\"t_"+i+"\">";
						tableItem += "<td rowspan='"+sum+"'>" + i + "</td><td rowspan='"+sum+"'>"
								+ entry.projectName + "</td><td rowspan='"+sum+"' name='ysje'>"
								+ budget + "</td>";
						tableItem += tableItem_2;
								
						
						
	
						$(".table_1").append(tableItem);
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
};

$.postSearchFormProjectCost2 = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/contractCost/all?projectId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataProjectCost2(data, status, xhr, firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataProjectCost2 = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var amount="",paied="",
						unpaied="",percent="",
						planAdvancePay="",actualAdvancePay="",
						planProgressPay="",actualProgressPay="",
						planAcceptancePay="",actualAcceptancePay="",
						planWarrantyPay="",actualWarrantyPay="";
						
						if(entry.amount!=null&&
								entry.paied!=null&&
								entry.unpaied!=null&&
								entry.percent!=null&&
								entry.planAdvancePay!=null&&
								entry.actualAdvancePay!=null&&
								entry.planProgressPay!=null&&
								entry.actualProgressPay!=null&&
								entry.planAcceptancePay!=null&&
								entry.actualAcceptancePay!=null&&
								entry.planWarrantyPay!=null&&
								entry.actualWarrantyPay!=null){
						
								amount=entry.amount.toFixed(2);
								paied=entry.paied.toFixed(2);
								unpaied=entry.unpaied.toFixed(2);
								percent=entry.percent.toFixed(4);
								planAdvancePay=entry.planAdvancePay.toFixed(2);
								actualAdvancePay=entry.actualAdvancePay.toFixed(2);
								planProgressPay=entry.planProgressPay.toFixed(2);
								actualProgressPay=entry.actualProgressPay.toFixed(2);
								planAcceptancePay=entry.planAcceptancePay.toFixed(2);
								actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
								planWarrantyPay=entry.planWarrantyPay.toFixed(2);
								actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						}
						
						 if(i!=1){
							 tableItem+="<tr class=\"tableItem\">" ;
						 }
					  tableItem +="<td>"+ entry.contractName + "</td><td>"
								+ entry.planSignTime + "</td><td name='htje'>"
								+ amount + "</td><td name='yzf'>"
								+ paied  + "</td><td>"
								+ unpaied + "</td><td>"
								+ Math.round(percent*100) + "%</td><td>"
								+ planAdvancePay + "</td><td>"
								+ actualAdvancePay + "</td><td>"
						        + planProgressPay + "</td><td>"
						        + actualProgressPay + "</td><td>"
						        + planAcceptancePay + "</td><td>"
						        + actualAcceptancePay + "</td><td>"
						        + planWarrantyPay + "</td><td>"
						        + actualWarrantyPay + "</td><td>"
						        + entry.implementation + "</td>";
								
						
					  tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
							+ firUrl
							+ "/annualCost"
							+ "/specialOrganList"
							+ "?id="
							+ entry.projectId
							+ "');\" \>"
							+"&nbsp;&nbsp;"
							+"<input type=\"button\" name=\"delete\"  value=\"删除\" onclick=\"del("+entry.id+");\" \></td></tr>";

	
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
	return tableItem;
};

$.postSearchFormProjectCost1 = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/projectCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataProjectCost1(data, status, xhr, firUrl);
				$.setBtnProjectCost1(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataProjectCost1 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						i += 1;
						var budget = "";
						if(entry.budget!=null){
							budget=entry.budget.toFixed(2);
						}
						var tableItem_2 = $.postSearchFormProjectCost22(firUrl,"",entry.id);
						var j = tableItem_2.indexOf("</tr>"),sum=0;
						while(j>-1){
							sum+=1;
							j = tableItem_2.indexOf("</tr>",j+1);
						}
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td rowspan='"+sum+"'>" + i + "</td><td rowspan='"+sum+"'>"
								+ entry.projectName + "</td><td rowspan='"+sum+"'>"
								+ budget + "</td>";
						tableItem += tableItem_2;
								
						
						
	
						$(".table_1").append(tableItem);
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
};

$.postSearchFormProjectCost22 = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/contractCost/all?projectId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataProjectCost22(data, status, xhr, firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataProjectCost22 = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var amount="",paied="",
						unpaied="",percent="",
						planAdvancePay="",actualAdvancePay="",
						planProgressPay="",actualProgressPay="",
						planAcceptancePay="",actualAcceptancePay="",
						planWarrantyPay="",actualWarrantyPay="";
						
						if(entry.amount!=null&&
								entry.paied!=null&&
								entry.unpaied!=null&&
								entry.percent!=null&&
								entry.planAdvancePay!=null&&
								entry.actualAdvancePay!=null&&
								entry.planProgressPay!=null&&
								entry.actualProgressPay!=null&&
								entry.planAcceptancePay!=null&&
								entry.actualAcceptancePay!=null&&
								entry.planWarrantyPay!=null&&
								entry.actualWarrantyPay!=null){
						
								amount=entry.amount.toFixed(2);
								paied=entry.paied.toFixed(2);
								unpaied=entry.unpaied.toFixed(2);
								percent=entry.percent.toFixed(4);
								planAdvancePay=entry.planAdvancePay.toFixed(2);
								actualAdvancePay=entry.actualAdvancePay.toFixed(2);
								planProgressPay=entry.planProgressPay.toFixed(2);
								actualProgressPay=entry.actualProgressPay.toFixed(2);
								planAcceptancePay=entry.planAcceptancePay.toFixed(2);
								actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
								planWarrantyPay=entry.planWarrantyPay.toFixed(2);
								actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						}
						
						 if(i!=1){
							 tableItem+="<tr class=\"tableItem\">" ;
						 }
					  tableItem +="<td>"+ entry.contractName + "</td><td>"
								+ entry.planSignTime + "</td><td name='htje'>"
								+ amount + "</td><td name='yzf'>"
								+ paied  + "</td><td>"
								+ unpaied + "</td><td>"
								+ Math.round(percent*100) + "%</td><td>"
								+ planAdvancePay + "</td><td>"
								+ actualAdvancePay + "</td><td>"
						        + planProgressPay + "</td><td>"
						        + actualProgressPay + "</td><td>"
						        + planAcceptancePay + "</td><td>"
						        + actualAcceptancePay + "</td><td>"
						        + planWarrantyPay + "</td><td>"
						        + actualWarrantyPay + "</td><td>"
						        + entry.implementation + "</td>";
								
						
					  tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
							+ firUrl
							+ "/annualCost"
							+ "/specialOrganListOther"
							+ "?id="
							+ entry.projectId
							+ "');\" \>"
							+"</td></tr>";

	
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
	return tableItem;
};


$.postSearchFormAnnualCost2 = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/contractCost/all?projectId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataAnnualCost2(data, status, xhr, firUrl);
				$.setBtnAnnualCost2(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataAnnualCost2 = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var amount="",paied="",
						unpaied="",percent="",
						planAdvancePay="",actualAdvancePay="",
						planProgressPay="",actualProgressPay="",
						planAcceptancePay="",actualAcceptancePay="",
						planWarrantyPay="",actualWarrantyPay="";
						
						if(entry.amount!=null&&
								entry.paied!=null&&
								entry.unpaied!=null&&
								entry.percent!=null&&
								entry.planAdvancePay!=null&&
								entry.actualAdvancePay!=null&&
								entry.planProgressPay!=null&&
								entry.actualProgressPay!=null&&
								entry.planAcceptancePay!=null&&
								entry.actualAcceptancePay!=null&&
								entry.planWarrantyPay!=null&&
								entry.actualWarrantyPay!=null){
						
								amount=entry.amount.toFixed(2);
								paied=entry.paied.toFixed(2);
								unpaied=entry.unpaied.toFixed(2);
								percent=entry.percent.toFixed(4);
								planAdvancePay=entry.planAdvancePay.toFixed(2);
								actualAdvancePay=entry.actualAdvancePay.toFixed(2);
								planProgressPay=entry.planProgressPay.toFixed(2);
								actualProgressPay=entry.actualProgressPay.toFixed(2);
								planAcceptancePay=entry.planAcceptancePay.toFixed(2);
								actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
								planWarrantyPay=entry.planWarrantyPay.toFixed(2);
								actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						}
						
						 if(i!=1){
							 tableItem+="<tr class=\"tableItem\">" ;
						 }
					  tableItem +="<td>"+ entry.contractName + "</td><td>"
								+ entry.planSignTime + "</td><td name='htje'>"
								+ amount + "</td><td name='yzf'>"
								+ paied  + "</td><td>"
								+ unpaied + "</td><td>"
								+ Math.round(percent*100) + "%</td><td>"
								+ planAdvancePay + "</td><td>"
								+ actualAdvancePay + "</td><td>"
						        + planProgressPay + "</td><td>"
						        + actualProgressPay + "</td><td>"
						        + planAcceptancePay + "</td><td>"
						        + actualAcceptancePay + "</td><td>"
						        + planWarrantyPay + "</td><td>"
						        + actualWarrantyPay + "</td><td>"
						        + entry.implementation + "</td>";
								
						
					  tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
							+ firUrl
							+ "/annualCost"
							+ "/specialServiceList"
							+ "?id="
							+ entry.projectId
							+ "');\" \>"
							+"&nbsp;&nbsp;"
							+"<input type=\"button\" name=\"delete\"  value=\"删除\" onclick=\"del("+entry.id+");\" \></td></tr>";

	
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
	return tableItem;
};

$.postSearchFormAnnualCost11 = function(firUrl, paging) {
	paging += "&sort=id desc";

	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/projectCost/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				$.analyzeTableDataAnnualCost11(data, status, xhr, firUrl);
				$.setBtnAnnualCost11(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataAnnualCost11 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						i += 1;
						var reportBudget = "",budget = "";
						if(entry.reportBudget!=null&&entry.budget!=null){
							reportBudget=entry.reportBudget.toFixed(2);
							budget=entry.budget.toFixed(2);
						}
						var tableItem_2 = $.postSearchFormAnnualCost22(firUrl,"",entry.id);
						var j = tableItem_2.indexOf("</tr>"),sum=0;
						while(j>-1){
							sum+=1;
							j = tableItem_2.indexOf("</tr>",j+1);
						}
						tableItem = "<tr class=\"tableItem\">";
						tableItem += "<td rowspan='"+sum+"'>" + i + "</td><td rowspan='"+sum+"'>"
								+ entry.projectName + "</td><td rowspan='"+sum+"'>"
								+ reportBudget + "</td><td rowspan='"+sum+"'>"
								+ budget + "</td>";
						tableItem += tableItem_2;
								
						
						
	
						$(".table_1").append(tableItem);
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
};

$.postSearchFormAnnualCost22 = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/contractCost/all?projectId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataAnnualCost22(data, status, xhr, firUrl);
				$.setBtnAnnualCost22(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataAnnualCost22 = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var amount="",paied="",
						unpaied="",percent="",
						planAdvancePay="",actualAdvancePay="",
						planProgressPay="",actualProgressPay="",
						planAcceptancePay="",actualAcceptancePay="",
						planWarrantyPay="",actualWarrantyPay="";
						
						if(entry.amount!=null&&
								entry.paied!=null&&
								entry.unpaied!=null&&
								entry.percent!=null&&
								entry.planAdvancePay!=null&&
								entry.actualAdvancePay!=null&&
								entry.planProgressPay!=null&&
								entry.actualProgressPay!=null&&
								entry.planAcceptancePay!=null&&
								entry.actualAcceptancePay!=null&&
								entry.planWarrantyPay!=null&&
								entry.actualWarrantyPay!=null){
						
								amount=entry.amount.toFixed(2);
								paied=entry.paied.toFixed(2);
								unpaied=entry.unpaied.toFixed(2);
								percent=entry.percent.toFixed(4);
								planAdvancePay=entry.planAdvancePay.toFixed(2);
								actualAdvancePay=entry.actualAdvancePay.toFixed(2);
								planProgressPay=entry.planProgressPay.toFixed(2);
								actualProgressPay=entry.actualProgressPay.toFixed(2);
								planAcceptancePay=entry.planAcceptancePay.toFixed(2);
								actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
								planWarrantyPay=entry.planWarrantyPay.toFixed(2);
								actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						}
						
						 if(i!=1){
							 tableItem+="<tr class=\"tableItem\">" ;
						 }
					  tableItem +="<td>"+ entry.contractName + "</td><td>"
								+ entry.planSignTime + "</td><td name='htje'>"
								+ amount + "</td><td name='yzf'>"
								+ paied  + "</td><td>"
								+ unpaied + "</td><td>"
								+ Math.round(percent*100) + "%</td><td>"
								+ planAdvancePay + "</td><td>"
								+ actualAdvancePay + "</td><td>"
						        + planProgressPay + "</td><td>"
						        + actualProgressPay + "</td><td>"
						        + planAcceptancePay + "</td><td>"
						        + actualAcceptancePay + "</td><td>"
						        + planWarrantyPay + "</td><td>"
						        + actualWarrantyPay + "</td><td>"
						        + entry.implementation + "</td>";
								
						
					  tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\"查看详情\" onclick=\"window.open('"
							+ firUrl
							+ "/annualCost"
							+ "/specialServiceListOther"
							+ "?id="
							+ entry.projectId
							+ "');\" \>"
							+"</td></tr>";

	
					});
		$.setPageInfo(data.result);
		} else {
		}
	}
	return tableItem;
};

$.postsaveannual = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var annualId = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/annualCost/save",
			type : 'post',
			data : _data + otherData,
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						annualId=data.result.id;

					} else {
						
					}
				} else {
					
				}

			}
		});
	}
	return annualId;

};

$.postsaveproject = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();
//	alert(_data);
//	return false;
	var projectId = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/projectCost/save",
			type : 'post',
			data : _data + otherData,
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						projectId=data.result.id;
						

					} else {
					}
				} else {
				}

			}
		});
	}
	return projectId;

};

$.postsavecontract = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var id = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/contractCost/save",
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


$.postDele = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/annualCost/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
					}
				}

			}
		});
	}
};
$.postDeleSpecial = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/special/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
					}
				}

			}
		});
	}
};
$.postDeleContractCost = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/contractCost/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
					}
				}

			}
		});
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
						$("[name=applyerLoginname]").val(data.cookies.loginName);

					}
				}
			}

		});
	}

};

$.yanzhen = function() {
	var _return = "";

	if ($("[name=contractName]").val() == "" || $("[name=contractName]").val() == null) {
		_return += "\r\n合同名称不能为空";
	}
	if ($("[name=planSignTime]").val() == ""
			|| $("[name=planSignTime]").val() == null) {
		_return += "\r\n计划签订时间不能为空";
	}
	if ($("[name=amount]").val() == ""
			|| $("[name=amount]").val() == null) {
		_return += "\r\n合同金额不能为空";
	}
	if ($("[name=paied]").val() == ""
			|| $("[name=paied]").val() == null) {
		_return += "\r\n已支付不能为空不能为空";
	}

	if ($("[name=unpaied]").val() == "" || $("[name=unpaied]").val() == null) {
		_return += "\r\n未支付不能为空";
	}

	if ($("[name=planAdvancePay]").val() == ""
			|| $("[name=planAdvancePay]").val() == null) {
		_return += "\r\n计划预付款不能为空";
	}
	if ($("[name=actualAdvancePay]").val() == "" || $("[name=actualAdvancePay]").val() == null) {
		_return += "\r\n实际预付款不能为空";
	}
	if ($("[name=planProgressPay]").val() == "" || $("[name=planProgressPay]").val() == null) {
		_return += "\r\n计划进度款不能为空";
	}
	if ($("[name=actualProgressPay]").val() == "" || $("[name=actualProgressPay]").val() == null) {
		_return += "\r\n实际进度款不能为空";
	}
	if ($("[name=planAcceptancePay]").val() == "" || $("[name=planAcceptancePay]").val() == null) {
		_return += "\r\n计划验收款不能为空";
	}
	if ($("[name=actualAcceptancePay]").val() == "" || $("[name=actualAcceptancePay]").val() == null) {
		_return += "\r\n实际验收款不能为空";
	}
	if ($("[name=planWarrantyPay]").val() == "" || $("[name=planWarrantyPay]").val() == null) {
		_return += "\r\n计划质保款不能为空";
	}
	if ($("[name=actualWarrantyPay]").val() == "" || $("[name=actualWarrantyPay]").val() == null) {
		_return += "\r\n实际质保款不能为空";
	}
	if ($("[name=implementation]").val() == "" || $("[name=implementation]").val() == null) {
		_return += "\r\n执行情况说明不能为空";
	}
	if ($("[name=implementation]").val().length > 250) {
		_return += "\r\n执行情况说明不得超过250个字";
	}
	return _return;
};

$.yanzhenCostAdd1 = function() {
	var _return = "";
	if ($("[name=totalBudget]").val() == "" || $("[name=totalBudget]").val() == null) {
		_return += "\r\n年度下达预算不能为空";
	}
	
	if ($("[name=year]").val() == "" || $("[name=year]").val() == null) {
		_return += "\r\n年度不能为空";
	}
	
	return _return;
};

$.yanzhenCostAdd2 = function() {
	var _return = "";
	
	
	if ($("[name=year]").val() == "" || $("[name=year]").val() == null) {
		_return += "\r\n年度不能为空";
	}
	
	return _return;
};

$.yanzhenBudget = function() {
	var _return = "";
	
	if ($("[name=year]").val() == "" || $("[name=year]").val() == null) {
		_return += "\r\n项目预算年度不能为空";
	}
	if ($("[name=budget]").val() == "" || $("[name=budget]").val() == null) {
		_return += "\r\n项目年度预算不能为空";
	}
	
	return _return;
};

$.yanzhenProject = function() {
	var _return = "";
	
	if ($("[name=projectName]").val() == "" || $("[name=projectName]").val() == null) {
		_return += "\r\n项目名称不能为空";
	}
	if ($("[name=repliedBudget]").val() == "" || $("[name=repliedBudget]").val() == null) {
		_return += "\r\n项目批复预算不能为空";
	}
	if ($("[name=projectAmount]").val() == "" || $("[name=projectAmount]").val() == null) {
		_return += "\r\n项目金额不能为空";
	}
	if ($("[name=repliedType]").val() == "" || $("[name=repliedType]").val() == null) {
		_return += "\r\n预算批复状态不能为空";
	}
	
	return _return;
};

$.yanzhenContract = function() {
	var _return = "";
	
	if ($("[name=contractName]").val() == "" || $("[name=contractName]").val() == null) {
		_return += "\r\n合同名称不能为空";
	}
	if ($("[name=planSignTime]").val() == ""
			|| $("[name=planSignTime]").val() == null) {
		_return += "\r\n计划签订时间不能为空";
	}
	if ($("[name=signYear]").val() == ""
		|| $("[name=signYear]").val() == null) {
	_return += "\r\n合同签订年度不能为空";
	}
	if ($("[name=signType]").val() == ""
		|| $("[name=signType]").val() == null) {
	_return += "\r\n合同签订状态不能为空";
	}
	if ($("[name=signAmount]").val() == ""
			|| $("[name=signAmount]").val() == null) {
		_return += "\r\n合同签订金额不能为空";
	}
	if ($("[name=startYear]").val() == ""
		|| $("[name=startYear]").val() == null) {
	_return += "\r\n执行起始年度不能为空";
	}
	if ($("[name=endYear]").val() == ""
		|| $("[name=endYear]").val() == null) {
	_return += "\r\n执行终止年度不能为空";
	}
	
	if ($("[name=planPay]").val() == ""
			|| $("[name=planPay]").val() == null) {
		_return += "\r\n本年计划支付不能为空";
	}

	if ($("[name=paied]").val() == "" || $("[name=paied]").val() == null) {
		_return += "\r\n本年已支付不能为空";
	}
	
	if ($("[name=percent]").val() == ""
		|| $("[name=percent]").val() == null) {
	_return += "\r\n支付完成率不能为空";
	}

	if ($("[name=unpaied]").val() == "" || $("[name=unpaied]").val() == null) {
		_return += "\r\n本年未支付不能为空";
	}

	if ($("[name=totalPaied]").val() == ""
		|| $("[name=totalPaied]").val() == null) {
	_return += "\r\n累计支付不能为空";
	}
	
	if ($("[name=totalPaiedPercent]").val() == "" || $("[name=totalPaiedPercent]").val() == null) {
	_return += "\r\n累计支付率不能为空";
	}

	if ($("[name=planAdvancePay]").val() == ""
			|| $("[name=planAdvancePay]").val() == null) {
		_return += "\r\n计划预付款不能为空";
	}
	if ($("[name=actualAdvancePay]").val() == "" || $("[name=actualAdvancePay]").val() == null) {
		_return += "\r\n实际预付款不能为空";
	}
	if ($("[name=planProgressPay]").val() == "" || $("[name=planProgressPay]").val() == null) {
		_return += "\r\n计划进度款不能为空";
	}
	if ($("[name=actualProgressPay]").val() == "" || $("[name=actualProgressPay]").val() == null) {
		_return += "\r\n实际进度款不能为空";
	}
	if ($("[name=planAcceptancePay]").val() == "" || $("[name=planAcceptancePay]").val() == null) {
		_return += "\r\n计划验收款不能为空";
	}
	if ($("[name=actualAcceptancePay]").val() == "" || $("[name=actualAcceptancePay]").val() == null) {
		_return += "\r\n实际验收款不能为空";
	}
	if ($("[name=planWarrantyPay]").val() == "" || $("[name=planWarrantyPay]").val() == null) {
		_return += "\r\n计划质保款不能为空";
	}
	if ($("[name=actualWarrantyPay]").val() == "" || $("[name=actualWarrantyPay]").val() == null) {
		_return += "\r\n实际质保款不能为空";
	}
	if ($("[name=implementation]").val() == "" || $("[name=implementation]").val() == null) {
		_return += "\r\n执行情况说明不能为空";
	}
	if ($("[name=implementation]").val().length > 250) {
		_return += "\r\n执行情况说明不得超过250个字";
	}
	return _return;
};

$.yanzhenspecialList = function() {
	var _return = "";
	
	if ($("[name=projectName]").val() == "" || $("[name=projectName]").val() == null) {
		_return += "\r\n专项名称不能为空";
	}
	
	if ($("[name=reportBudget]").val() == "" || $("[name=reportBudget]").val() == null) {
		_return += "\r\n上报预算不能为空";
	}
	if ($("[name=budget]").val() == "" || $("[name=budget]").val() == null) {
		_return += "\r\n下达预算不能为空";
	}
	if (isNaN($("[name=reportBudget]").val())) {
		_return += "\r\n请正确填写上报预算";
	}
	if (isNaN($("[name=budget]").val())) {
		_return += "\r\n请正确填写下达预算";
	}
	return _return;
};

$.yanzhenOrganList = function() {
	var _return = "";
	
	if ($("[name=projectName]").val() == "" || $("[name=projectName]").val() == null) {
		_return += "\r\n项目名称不能为空";
	}
	
	if ($("[name=budget]").val() == "" || $("[name=budget]").val() == null) {
		_return += "\r\n预算金额不能为空";
	}
	
	return _return;
};

$.yanzhenSpecial = function() {
	var _return = "";
	
	if ($("[name=year]").val() == "" || $("[name=year]").val() == null) {
		_return += "\r\n年度不能为空";
	}
	
	if ($("[name=planReportBudget]").val() == "" || $("[name=planReportBudget]").val() == null) {
		_return += "\r\n当年计划上报项目预算不能为空";
	}
	if ($("[name=repliedBudget]").val() == "" || $("[name=repliedBudget]").val() == null) {
		_return += "\r\n当年已批复项目预算不能为空";
	}
	if ($("[name=unrepliedBudget]").val() == "" || $("[name=unrepliedBudget]").val() == null) {
		_return += "\r\n当年未批复项目预算不能为空";
	}
	
	if ($("[name=repliedPercent]").val() == "" || $("[name=repliedPercent]").val() == null) {
		_return += "\r\n批复率不能为空";
	}
	if ($("[name=lastYearBudget]").val() == "" || $("[name=lastYearBudget]").val() == null) {
		_return += "\r\n去年项目资金预算不能为空";
	}
	if ($("[name=thisYearBudget]").val() == "" || $("[name=thisYearBudget]").val() == null) {
		_return += "\r\n当年项目资金预算不能为空";
	}
	
	if ($("[name=planSignAmount]").val() == "" || $("[name=planSignAmount]").val() == null) {
		_return += "\r\n当年计划签订合同金额不能为空";
	}
	if ($("[name=signedAmount]").val() == "" || $("[name=signedAmount]").val() == null) {
		_return += "\r\n当年已签订合同金额不能为空";
	}
	if ($("[name=unsignedAmount]").val() == "" || $("[name=unsignedAmount]").val() == null) {
		_return += "\r\n当年未签订合同金额不能为空";
	}
	
	if ($("[name=signedPercent]").val() == "" || $("[name=signedPercent]").val() == null) {
		_return += "\r\n签订率不能为空";
	}
	if ($("[name=planPaiedAmount]").val() == "" || $("[name=planPaiedAmount]").val() == null) {
		_return += "\r\n应支付合同金额不能为空";
	}
	if ($("[name=paiedAmount]").val() == "" || $("[name=paiedAmount]").val() == null) {
		_return += "\r\n已支付合同金额不能为空";
	}
	
	if ($("[name=unpaiedAmount]").val() == "" || $("[name=unpaiedAmount]").val() == null) {
		_return += "\r\n未支付合同金额不能为空";
	}
	if ($("[name=paiedPercent]").val() == "" || $("[name=paiedPercent]").val() == null) {
		_return += "\r\n支付率不能为空";
	}
	
	return _return;
};

$.postcontractCostDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/contractCost/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				  for ( var item in entry) {
					try{ 										
					   if($("[name="+item+"]").length > 0 ){	
						 if(item=="applyTime"){
							$("[name="+item+"]").val(entry[item].substring(0,10));
						 }else{
							$("[name="+item+"]").val(entry[item]);
						}
					}
				}
				catch (e) 
				{ 
					//alert(e);
				}
			}
		}
   }
   }, 
   error: function() {
      hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
   }
});
	   }
};


$.postannualCostDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/annualCost/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				
				$("[name=type]").val(entry.type);
				$("[name=year]").val(entry.year);
				$("[name=totalBudget]").val(entry.totalBudget.toFixed(2));
				$("[name=annualId]").val(entry.id);
		}
  }
  }, 
  error: function() {
     hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
  }
});
	   }
};

$.postprojectCostDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/projectCost/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				
				$("[name=projectName]").val(entry.projectName);
				$("[name=reportBudget]").val(entry.reportBudget.toFixed(2));
				$("[name=budget]").val(entry.budget.toFixed(2));
				$("[name=annualId]").val(entry.annualId);
		}
 }
 }, 
 error: function() {
    hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
 }
});
	   }
};

$.postprojectCostDetail2 = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/projectCost/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				
				$("[name=projectName]").val(entry.projectName);
				$("[name=budget]").val(entry.budget.toFixed(2));
				$("[name=annualId]").val(entry.annualId);
		}
}
}, 
error: function() {
   hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
}
});
	   }
};



$.postsaveBudget = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var budgetId = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/specialBudget/save",
			type : 'post',
			data : _data + otherData,
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						budgetId=data.result.id;

					} else {
						
					}
				} else {
					
				}

			}
		});
	}
	return budgetId;

};

$.postsaveSpecial = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var specialId = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/special/save",
			type : 'post',
			data : _data + otherData,
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						specialId=data.result.id;
					} else {
						
					}
				} else {
					
				}

			}
		});
	}
	return specialId;

};

$.postsaveSpecialcontract = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var id = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/specialContract/save",
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

$.postSpecialContractDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/specialContract/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				  for ( var item in entry) {
					try{ 										
					   if($("[name="+item+"]").length > 0 ){	
						 if(item=="applyTime"){
							$("[name="+item+"]").val(entry[item].substring(0,10));
						 }else{
							$("[name="+item+"]").val(entry[item]);
						}
					}
				}
				catch (e) 
				{ 
					//alert(e);
				}
			}
		}
  }
  }, 
  error: function() {
     hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
  }
});
	   }
};

$.postsaveSpecialproject = function(Url, formName, otherData) {
	var _data = $("#" + formName).serialize();

	// return false;
	var id = "";
	if (Url != "") {
		$.ajax({
			async : false,
			url : Url + "/basicCrud/specialProject/save",
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

$.postSpecialDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/special/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				  for ( var item in entry) {
					try{ 										
					   if($("[name="+item+"]").length > 0 ){	
						 if(item=="applyTime"){
							$("[name="+item+"]").val(entry[item].substring(0,10));
						 }else{
							$("[name="+item+"]").val(entry[item]);
						}
					}
				}
				catch (e) 
				{ 
					//alert(e);
				}
			}
		}
 }
 }, 
 error: function() {
    hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
 }
});
	   }
};



$.postSearchFormSpecialBudget = function(firUrl, paging) {
	paging += "&sort=id desc";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/specialBudget/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {
				
				$.analyzeTableDataSpecialBudget(data, status, xhr, firUrl);
				$.setBtnSpecialBudget(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataSpecialBudget = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						i += 1;
						
						var budget=entry.budget.toFixed(2);
						var tableItem_2 = $.postSearchFormSpecialContract(firUrl,"",entry.id);
						var tableItem_3 = $.postSearchFormSpecialProject(firUrl,"",entry.id);
						var sum=0;
						var j = tableItem_2.indexOf("</tr>"),sum_1=0;
						while(j>-1){
							sum_1+=1;
							j = tableItem_2.indexOf("</tr>",j+1);
						}
						
						var k = tableItem_3.indexOf("<td name='bh'>"),sum_2=0;
						while(k>-1){
							sum_2+=1;
							k = tableItem_3.indexOf("<td name='bh'>",k+1);
						}
						if(sum_1>sum_2){
							sum=sum_1;
						}else{
							sum=sum_2;
						}
						tableItem += "<td rowspan='"+sum+"' name='ysnd'>"
								+ entry.year + "</td><td rowspan='"+sum+"' name='ndys' id='ndys_"+i+"'>"
								+ budget + "</td>";
							
						
						if(sum_1==1&&sum_2!=1){//合同为一项
							
							$(".table_1").append(tableItem_3);
							$("#p_1").append(tableItem);
							$("#p_1").append(tableItem_2);
							$("[name=t2]").attr("rowspan",sum);
						}else if(sum_2==1&&sum_1!=1){//项目为一项
							var tableItem_all = tableItem_3+tableItem+tableItem_2;
							$(".table_1").append(tableItem_all);
							
							$("#p_1").find("td").not("[name=t2]").attr("rowspan",sum);
						}else if(sum_1==1&&sum_2==1){
							var tableItem_all = tableItem_3+tableItem+tableItem_2;
							$(".table_1").append(tableItem_all);
							
							$("#p_1").find("td").not("[name=t2]").attr("rowspan",sum);
							
//							$(".table_1").append(tableItem_3);
//							$("#p_1").append(tableItem);
//							$("#p_1").append(tableItem_2);
//							$("[name=t2]").attr("rowspan",sum);
						}
						
						
						
						
					});
		$.setPageInfo(data.result);
		} else {
			
		}
	}
};

$.postSearchFormSpecialContract = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/specialContract/all?budgetId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataSpecialContract(data, status, xhr, firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataSpecialContract = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var signAmount=entry.signAmount.toFixed(2);
						var planPay=entry.planPay.toFixed(2);
						
						var paied=entry.paied.toFixed(2);
						var unpaied=entry.unpaied.toFixed(2);
						var percent=entry.percent.toFixed(4);
						
						var totalPaied=entry.totalPaied.toFixed(4);
						var totalPaiedPercent=entry.totalPaiedPercent.toFixed(4);
						
						
						var planAdvancePay=entry.planAdvancePay.toFixed(2);
						var actualAdvancePay=entry.actualAdvancePay.toFixed(2);
						var planProgressPay=entry.planProgressPay.toFixed(2);
						var actualProgressPay=entry.actualProgressPay.toFixed(2);
						var planAcceptancePay=entry.planAcceptancePay.toFixed(2);
						var actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
						var planWarrantyPay=entry.planWarrantyPay.toFixed(2);
						var actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						
						var signTypeChina = "";
						switch (entry.signType) {
						case "yes":
							signTypeChina = "已签订";
							break;
						case "no":
							signTypeChina = "未签订";
							break;
						default:
							"";
						signTypeChina = "";
						}
						
						 if(i!=1){
							 tableItem+="<tr class=\"tableItem\">" ;
						 }
					  tableItem +="<td name='t2'>"+ entry.contractName + "</td><td name='t2'>"
								+ entry.planSignTime + "</td><td name='t2' class='qdnd'>"
								+ entry.signYear + "</td><td name='t2' class='qdzt'>"
								+ signTypeChina + "</td><td name='t2' id='qdje_"+i+"'>"
								+ signAmount + "</td><td name='t2'>"
								+ entry.startYear + "</td><td name='t2'>"
								+ entry.endYear + "</td><td name='t2' class='jhzf'>"
								+ planPay + "</td><td name='t2' class='yzf'>"
								
								+ paied  + "</td><td name='t2'>"
								+ Math.round(percent*100) + "%</td><td name='t2'>"
								+ unpaied + "</td><td name='t2'>"
								+ totalPaied + "</td><td name='t2'>"
								+ Math.round(totalPaiedPercent*100) + "%</td><td name='t2'>"
								
								+ planAdvancePay + "</td><td name='t2'>"
								+ actualAdvancePay + "</td><td name='t2'>"
						        + planProgressPay + "</td><td name='t2'>"
						        + actualProgressPay + "</td><td name='t2'>"
						        + planAcceptancePay + "</td><td name='t2'>"
						        + actualAcceptancePay + "</td><td name='t2'>"
						        + planWarrantyPay + "</td><td name='t2'>"
						        + actualWarrantyPay + "</td><td name='t2'>"
						        + entry.implementation + "</td>";
								
					  tableItem += "<td name='t2'>"
						  +"<input type=\"button\"  value=\"查看详情\" onclick=\"window.open('"
						+ firUrl
						+ "/special"
						+ "/specialContractAdd?id="+ entry.id+ "&specialId="+QueryString.GetValue("specialId")+"');\" \>"
						+"</td>"
					    + "<td name='t2'>"
						+"<input type=\"button\" name=\"delete\"  value=\"删除\" onclick=\"delConstract("+entry.id+");\" \></td></tr>";
					  
					  
					});
		$.setPageInfo(data.result);
		} else {
			
		}
	}
	return tableItem;
};


$.postSearchFormSpecialProject = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/specialProject/all?budgetId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataSpecialProject(data, status, xhr, firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataSpecialProject = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var repliedBudget=entry.repliedBudget.toFixed(2);
						var projectAmount=entry.projectAmount.toFixed(2);
						
						var repliedTypeChina = "";
						switch (entry.repliedType) {
						case "yes":
							repliedTypeChina = "已批复";
							break;
						case "no":
							repliedTypeChina = "未批复";
							break;
						default:
							"";
						repliedTypeChina = "";
						}
						
						 
						 
							 tableItem+="<tr class=\"tableItem\" id='p_"+i+"'>" ;
						 
					  tableItem +="<td name='bh'>" + i + "</td><td>"+ entry.projectName + "</td><td name='pfys' id='pfys_"+i+"'>"
								+ repliedBudget + "</td><td name='pfzt'>"
								+ repliedTypeChina  + "</td><td>"
								+ projectAmount + "</td>";
								
					  tableItem += "<td>"
						  +"<input type=\"button\"  value=\"查看详情\" onclick=\"window.open('"
						+ firUrl
						+ "/special"
						+ "/specialProjectAdd"
						+ "?id="
						+ entry.id
						+ "');\" \>"
						+"</td>";
					  tableItem += "<td><input type=\"button\" name=\"delete\" value=\"删除\" onclick=\"delProject("+entry.id+");\" \></td>";

	
					});
		$.setPageInfo(data.result);
		} else {
			
		}
	}
	return tableItem;
};


$.postSearchFormSpecialBudget2 = function(firUrl, paging) {
	paging += "&sort=id desc";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/specialBudget/page",
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {
				
				$.analyzeTableDataSpecialBudget2(data, status, xhr, firUrl);
				$.setBtnSpecialBudget2(firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
};

// 解析Table
$.analyzeTableDataSpecialBudget2 = function(data, status, xhr, firUrl) {
	if (status == "success" && data != null) {
		$("tr.tableItem").remove();

		if (data.success == true && data.result.content
				&& JSON.stringify(data.result.content) != "[]") {
			$("tr.tableItem").remove();
			var tableItem = "";
			var i = 0;
			$.each(
					data.result.content,
					function(entryIndex, entry) {
						// To:do
						i += 1;
						
						var budget=entry.budget.toFixed(2);
						var tableItem_2 = $.postSearchFormSpecialContract2(firUrl,"",entry.id);
						var tableItem_3 = $.postSearchFormSpecialProject2(firUrl,"",entry.id);
						var sum=0;
						var j = tableItem_2.indexOf("</tr>"),sum_1=0;
						while(j>-1){
							sum_1+=1;
							j = tableItem_2.indexOf("</tr>",j+1);
						}
						
						var k = tableItem_3.indexOf("<td name='bh'>"),sum_2=0;
						while(k>-1){
							sum_2+=1;
							k = tableItem_3.indexOf("<td name='bh'>",k+1);
						}
						if(sum_1>sum_2){
							sum=sum_1;
						}else{
							sum=sum_2;
						}
						tableItem += "<td rowspan='"+sum+"' name='ysnd'>"
								+ entry.year + "</td><td rowspan='"+sum+"' name='ndys' id='ndys_"+i+"'>"
								+ budget + "</td>";
							
						
						if(sum_1==1){
							$(".table_1").append(tableItem_3);
							$("#p_1").append(tableItem);
							$("#p_1").append(tableItem_2);
							
							$("[name=t2]").attr("rowspan",sum);
						}else if(sum_2==1){
							var tableItem_all = tableItem_3+tableItem+tableItem_2;
							$(".table_1").append(tableItem_all);
							
							$("#p_1").find("td").not("[name=t2]").attr("rowspan",sum);
						}else{
							$(".table_1").append(tableItem_3);
							$("#p_1").append(tableItem);
							$("#p_1").append(tableItem_2);
							
							$("[name=t2]").attr("rowspan",sum);
						}
						
						
						
						
					});
		$.setPageInfo(data.result);
		} else {
			
		}
	}
};

$.postSearchFormSpecialContract2 = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/specialContract/all?budgetId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataSpecialContract2(data, status, xhr, firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataSpecialContract2 = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var signAmount=entry.signAmount.toFixed(2);
						var planPay=entry.planPay.toFixed(2);
						
						var paied=entry.paied.toFixed(2);
						var unpaied=entry.unpaied.toFixed(2);
						var percent=entry.percent.toFixed(4);
						
						var totalPaied=entry.totalPaied.toFixed(4);
						var totalPaiedPercent=entry.totalPaiedPercent.toFixed(4);
						
						
						var planAdvancePay=entry.planAdvancePay.toFixed(2);
						var actualAdvancePay=entry.actualAdvancePay.toFixed(2);
						var planProgressPay=entry.planProgressPay.toFixed(2);
						var actualProgressPay=entry.actualProgressPay.toFixed(2);
						var planAcceptancePay=entry.planAcceptancePay.toFixed(2);
						var actualAcceptancePay=entry.actualAcceptancePay.toFixed(2);
						var planWarrantyPay=entry.planWarrantyPay.toFixed(2);
						var actualWarrantyPay=entry.actualWarrantyPay.toFixed(2);
						
						var signTypeChina = "";
						switch (entry.signType) {
						case "yes":
							signTypeChina = "已签订";
							break;
						case "no":
							signTypeChina = "未签订";
							break;
						default:
							"";
						signTypeChina = "";
						}
						
						 if(i!=1){
							 tableItem+="<tr class=\"tableItem\">" ;
						 }
					  tableItem +="<td name='t2'>"+ entry.contractName + "</td><td name='t2'>"
								+ entry.planSignTime + "</td><td name='t2' class='qdnd'>"
								+ entry.signYear + "</td><td name='t2' class='qdzt'>"
								+ signTypeChina + "</td><td name='t2' id='qdje_"+i+"'>"
								+ signAmount + "</td><td name='t2'>"
								+ entry.startYear + "</td><td name='t2'>"
								+ entry.endYear + "</td><td name='t2' class='jhzf'>"
								+ planPay + "</td><td name='t2' class='yzf'>"
								
								+ paied  + "</td><td name='t2'>"
								+ Math.round(percent*100) + "%</td><td name='t2'>"
								+ unpaied + "</td><td name='t2'>"
								+ totalPaied + "</td><td name='t2'>"
								+ Math.round(totalPaiedPercent*100) + "%</td><td name='t2'>"
								
								+ planAdvancePay + "</td><td name='t2'>"
								+ actualAdvancePay + "</td><td name='t2'>"
						        + planProgressPay + "</td><td name='t2'>"
						        + actualProgressPay + "</td><td name='t2'>"
						        + planAcceptancePay + "</td><td name='t2'>"
						        + actualAcceptancePay + "</td><td name='t2'>"
						        + planWarrantyPay + "</td><td name='t2'>"
						        + actualWarrantyPay + "</td><td name='t2'>"
						        + entry.implementation + "</td>";
								
					  tableItem += "<td name='t2'>"
						  +"<input type=\"button\"  value=\"查看详情\" onclick=\"window.open('"
						+ firUrl
						+ "/special"
						+ "/specialContractOther?id="+ entry.id+ "&specialId="+QueryString.GetValue("specialId")+"');\" \>"
						+"&nbsp;&nbsp;"
					    + "</tr>";

	
					});
		$.setPageInfo(data.result);
		} else {
			
		}
	}
	return tableItem;
};


$.postSearchFormSpecialProject2 = function(firUrl, paging, id) {
	paging += "&sort=id desc";
	var tableItem="";
	if (firUrl != "") {
		$.ajax({
			async : false,
			url : firUrl + "/basicCrud/specialProject/all?budgetId="+id,
			type : 'post',
			data : $("#projectAppform").serialize() + paging,
			success : function(data, status, xhr) {

				tableItem+=$.analyzeTableDataSpecialProject2(data, status, xhr, firUrl);
			},
			error : function() {
				hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
			}
		});
	}
	return tableItem;
};

// 解析Table
$.analyzeTableDataSpecialProject2 = function(data, status, xhr, firUrl) {
	var tableItem = "";
	if (status == "success" && data != null) {
		if (data.success == true && data.result&& JSON.stringify(data.result) != "[]") {
			var i = 0;
			$.each(
					data.result,
					function(entryIndex, entry) {
						// To:do
						
						i += 1;
						
						var repliedBudget=entry.repliedBudget.toFixed(2);
						var projectAmount=entry.projectAmount.toFixed(2);
						
						var repliedTypeChina = "";
						switch (entry.repliedType) {
						case "yes":
							repliedTypeChina = "已批复";
							break;
						case "no":
							repliedTypeChina = "未批复";
							break;
						default:
							"";
						repliedTypeChina = "";
						}
						
						 
						 
							 tableItem+="<tr class=\"tableItem\" id='p_"+i+"'>" ;
						 
					  tableItem +="<td name='bh'>" + i + "</td><td>"+ entry.projectName + "</td><td name='pfys' id='pfys_"+i+"'>"
								+ repliedBudget + "</td><td name='pfzt'>"
								+ repliedTypeChina  + "</td><td>"
								+ projectAmount + "</td>";
								
					  tableItem += "<td>"
						  +"<input type=\"button\"  value=\"查看详情\" onclick=\"window.open('"
						+ firUrl
						+ "/special"
						+ "/specialProjectOther"
						+ "?id="
						+ entry.id
						+ "');\" \>"
						+"&nbsp;&nbsp;";

	
					});
		$.setPageInfo(data.result);
		} else {
			
		}
	}
	return tableItem;
};

$.postDeleConstract = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/specialContract/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
						location.reload(true); 
					}
				}

			}
		});
	}
};

$.postDeleProject = function(Url, id) {
	if (Url != "") {
		$.ajax({
			url : Url + "/basicCrud/specialProject/del/" + id,
			type : 'post',
			success : function(data, status, xhr) {
				if (status == "success" && data != null) {
					if (data.success == true) {
						alert("删除成功");
						location.reload(true); 
					}
				}

			}
		});
	}
};

$.postSpecialProjectDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/specialProject/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				  for ( var item in entry) {
					try{ 										
					   if($("[name="+item+"]").length > 0 ){	
						 if(item=="applyTime"){
							$("[name="+item+"]").val(entry[item].substring(0,10));
						 }else{
							$("[name="+item+"]").val(entry[item]);
						}
					}
				}
				catch (e) 
				{ 
					//alert(e);
				}
			}
		}
}
}, 
error: function() {
   hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
}
});
	   }
};


$.postSpecialContractDetail = function(firUrl,id){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/specialContract/get/"+id,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				  for ( var item in entry) {
					try{ 										
					   if($("[name="+item+"]").length > 0 ){	
						 if(item=="applyTime"){
							$("[name="+item+"]").val(entry[item].substring(0,10));
						 }else{
							$("[name="+item+"]").val(entry[item]);
						}
					}
				}
				catch (e) 
				{ 
					//alert(e);
				}
			}
		}
}
}, 
error: function() {
  hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
}
});
	   }
};

$.postSpecialBudgetDetail = function(firUrl,specialId){
	 if(firUrl!=""){	
		$.ajax({
		    async: false,
		    url : firUrl+"/basicCrud/specialBudget/all?specialId="+specialId,
			type : 'post',
			success: function(data, status, xhr) {
			if (status == "success" && data != null){
			 if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]"){
				var entry=data.result;
				$("[name=year]").val(entry[0].year);
				$("[name=budget]").val(entry[0].budget);
			 }
		}
}, 
error: function() {
 hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
}
});
	   }
};


$.isleader = function(firUrl) {
	var _isleader = "";

	if (firUrl != "") {
		$.ajax({
					async : false,
					url : firUrl + "/ca/getCurrentLoginInfo",
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.cookies&& JSON.stringify(data.cookies) != "[]") {
								 _isleader = data.cookies.loginName;

							}
						}
					}
				});
	}
	return _isleader;
};


$.isReview = function(firUrl) {
	var _isReview = false;
	var _isleader = $.isleader(firUrl);
	if (firUrl != "") {
		$.ajax({
					async : false,
					url : firUrl + "/basicCrud/power/all?modules=annual&users="+_isleader,
					type : 'post',
					success : function(data, status, xhr) {
						if (status == "success" && data != null) {
							if (data.result&& JSON.stringify(data.result) != "[]") {
								if(data.result[0].allowOperate=="allpower"){
									_isReview = true;
								}else{
									_isReview = false;
								}

							}else{
								_isReview = false;
							}
						}
					}
				});
	}
	return _isReview;
};



