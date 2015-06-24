/*
json表格颜色
*/
$.setRow = function(){
  var rows = $(".commtable").find("tr");

  for ( i = 0; i < rows.length; i++) 
	{
	  if (i % 2 == 0) 
	 {
	   $(rows[i]).addClass("evenrowcolor").removeClass("oddrowcolor").removeClass("importcolor");
	 }
	 else 
	 {
	   $(rows[i]).addClass("oddrowcolor").removeClass("evenrowcolor").removeClass("importcolor");
	 }
   }
}

$.getid = function(modname){
	var _Id="";
	var count=$(modname).find("input[name='cbitem']:checked");
	for (var i = 0; i < count.length; i++) 
	{
		var _mid=$(count[i]).parent().next().next().html();
		if(_mid!=""&&_mid!=null)
		{
			_Id=_Id+_mid+",";	
		}
	}
	_Id=_Id.substring(0,_Id.length-1);
	return _Id;
	}

//解析Table
$.analyzeTableData= function(data, status, xhr,modname,menuUrl)
{
	if (status == "success" && data != null)
	{

		$(modname + "  tr.tableItem").remove();
		
		if (data.success == true&&data.result.content &&JSON.stringify(data.result.content) != "[]") 
		{
			$(modname + " .tableItem").remove();
			var keycount = 1, tableTitle="";
			$.each(data.result.content,function(entryIndex,entry) 
			{
				var tableItem = "<tr  class=\"tableItem\"><td><input type=\"checkbox\" value=\"checkbox1\" name=\"cbitem\"></td>";

				for ( var item in entry) 
				{
				  if (entryIndex == 0) {
					keycount++;
					tableTitle += "<th class=\"tableItem\">"+ item+ "</th>";
				}

				 tableItem += "<td>"+ entry[item]+ "</td>";
				}
				
				$(modname+" tbody").append(tableItem+"<td class=\"lvitem\"><div style=\"display:none\" ><input type=\"button\" class=\"lv1\"  value=\"0\"><input type=\"button\" class=\"lv2\"  value=\"0\"><input type=\"button\" class=\"lv3\" value=\"0\"></div></td>");
			 });

			$(modname+" thead > tr").append(tableTitle+"<th class=\"tableItem\" style=\"width:100px;\"></th>");
			$.menuChina(menuUrl,modname);
			$.setRow();
			
			$(".v-menu").css("height", $(document).height());
			
			var tableColspan = Math.floor(keycount / 3);
			if(tableColspan<=1)
				{
				tableColspan=2;
				}
			var otherColspan = keycount- tableColspan+1;

			if (data.result.pageInfo != null) 
			{
				$(modname + " .firth").attr("colspan", tableColspan);
				$(modname + " .nexth").attr("colspan", otherColspan);
				$(modname + " .pageNow").text(data.result.pageInfo.currentPage+ "/"+ data.result.pageInfo.totalPages+ "("+ data.result.pageInfo.totalRecord+ " items)");

				if (data.result.pageInfo.hasNext == false) 
				{
					$(modname + " .btnNext").removeClass("btn-just-Icon").addClass("btn-just-Icon-b");
					$(modname + " .btnTolast").removeClass("btn-just-Icon").addClass("btn-just-Icon-b");
				}
				else
				{
					$(modname + " .btnNext").addClass("btn-just-Icon").removeClass("btn-just-Icon-b");
					$(modname + " .btnTolast").addClass("btn-just-Icon").removeClass("btn-just-Icon-b");
			
				}

				if (data.result.pageInfo.hasPrevious == false) 
				{
					$(modname + " .btnPrev").removeClass("btn-just-Icon").addClass("btn-just-Icon-b");
					$(modname + " .btnTotop").removeClass("btn-just-Icon").addClass("btn-just-Icon-b");
                }
				else
				{
					$(modname + " .btnPrev").addClass("btn-just-Icon").removeClass("btn-just-Icon-b");
					$(modname + " .btnTotop").addClass("btn-just-Icon").removeClass("btn-just-Icon-b");
					
				}
				$(modname + " .slider").slider('option', 'max',  data.result.pageInfo.totalPages);  
				
				$(modname +" table>tbody tr").click(function()
				   {
//						var pid = $(modname).attr("value"); 
//						var rule = $.getRuleByTypeAndPid("${pageContext.request.contextPath}/relationRule/api/findRule/",'${type}',pid);
//						 if(rule[0]!="undefined"){
//					           for(var a in rule){
//					        	   alert(rule[a]);
//					           }
//					      }
					    $(".lvitem").find("div").css("display","none");
						$(this).find(".lvitem").find("div").css("display","block");
						
						var thismod=$(this).parents(".userMod").find(".modName"),othermod=$(".modName").not(thismod);
					    var _othermod="",this_id=$(this).children("td").eq(2).text(),urlopen=menuUrl.split("/");
					    
						for (var i = 0; i < othermod.length; i++) 
						{
					       
							if($(othermod[i]).text()!=""&&$(othermod[i]).text()!=null)
							{
								_othermod=_othermod+$(othermod[i]).text()+",";	
							}
						}
						_othermod=_othermod.substring(0,_othermod.length-1);

			
						 var getbindurl="/"+urlopen[1]+"/relation/api/findPath/"+thismod.text()+"_"+this_id+"<"+_othermod;
						 var getNextBindurl="/"+urlopen[1]+"/relation/api/findTree/"+thismod.text()+"_"+this_id+">"+_othermod;
				
						 $.getBind(getbindurl,modname+" .lv1");
						 $.getBind(getbindurl+"<"+_othermod,modname+" .lv2");
						 $.getBind(getbindurl+"<"+_othermod+"<"+_othermod,modname+" .lv3");

						 switch($("#radio input:radio:checked").attr('id'))
						 {
						 case "rdoFir":
							 $.getNextBind(getNextBindurl,thismod.text());
							 break;
						 case "rdoSen":
							 $.getNextBind(getNextBindurl+">"+_othermod,thismod.text());
							 break;
						 case "rdoThi":
							 $.getNextBind(getNextBindurl+">"+_othermod+">"+_othermod,thismod.text());	
							 break;
						 }
						});
			}
		  }
		}
}

//提交查询表单
$.postSearchForm = function(firUrl,objname,paging){
	 if(firUrl!=""&&objname!="")
	   {
		 var menuUrl=firUrl+"/api/getEntityProperty";
	
			 $.ajax({
				    url : firUrl+"/api/page",
					type : 'post',
					 data: $(objname+"form").serialize()+paging,
					success: function(data, status, xhr) {
						//alert(data);
						$.analyzeTableData(data, status, xhr,objname,menuUrl);
			           }, 
			           error: function() {
			              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
			           }
					});
	   }
}


//得到查询表单
$.getSearchForm = function(firUrl,objname){
    if(firUrl!=""&&objname!="")
   {
   $.getJSON(firUrl+objname+"/api/getEntityProperty", function(data, status, xhr) {
		if (status == "success" && data != null)
		{
			if (data.success == true&&data.result.fieldProperties&&JSON.stringify(data.result.fieldProperties) != "[]") 
			{	
				//$("#searchForm>div").remove();
				var _items=data.result.fieldProperties;
				var formContent="";
				for ( var i = 0; i < _items.length; i++){
		
					switch(_items[i].operate)
					{
					case "input":
						formContent+="<div>"+_items[i].name+":<input name=\""+_items[i].path+"\" type=\"text\"/> </div>";
						break;
					case "range_long":
						formContent+="<div>"+_items[i].name+":<input name=\""+_items[i].path+"\" type=\"text\" onkeyup=\"this.value=this.value.replace(/[^\\d]/g,'')\" onafterpaste=\"this.value=this.value.replace(/[^\\d]/g,'')\" /> </div>";
						break;
					case "select":
						formContent+="<div>"+_items[i].name+":<select name=\""+_items[i].path+"\">";
						for ( var item in _items[i].option)
					     {
							formContent+="<option value=\""+item+"\">"+ _items[i].option[item]+"</option>";
					     }
						formContent+="</select></div>"
						break;
					}
					}
			     
				$("#"+objname+"form").append(formContent);
			}
		}

		});
    }
    }

//得到子节点
$.getNextBind = function(url,objname){
	 $.setRow();
    if(url!=""&&objname!="")
   {
	$.getJSON(url, function(data, status, xhr) {
	   if (status == "success" && data != null)
	  {
	    if (data.success == true&&data.result[objname]&&JSON.stringify(data.result[objname]) != "[]") 
		{
	       var _obj=data.result[objname],_objn=_obj[0].relatedNode.next;

	     	for ( var item in _objn)
	     {
			var _item=_objn[item],changeitem=$("#"+item+" tr");
			
			for ( var i = 0; i < _item.length; i++){
			
			//如果ID表格中不确定可修改此逻辑
			for ( var j = 1; j < changeitem.length-1; j++) 
			{
				var getTd=$(changeitem[j]).children('td').eq(1)
				if(_item[i].data==getTd.text())
					{
					//alert(_item[i].data+"有");
					getTd.parent("tr").addClass("importcolor").removeClass("evenrowcolor").removeClass("oddrowcolor");
					}
			  }
		    }
		 }			
	    }
	  }
	});
   }
    else
   {
    alert("数据不正确");	
   }
}

//得到父节点
$.getBind = function(url,objname){
    if(url!=""&&objname!="")
   {
	$.getJSON(url, function(data, status, xhr) {
		if (status == "success" && data != null)
		{
			if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
			{
				$(objname).val( data.result.length);
				 var _getBind = "";
				    for(var i=0;i<data.result.length ;i++)
				    {
				    	_getBind +=data.result[i]+",\r\n";
				    }
				$(objname).attr("title",_getBind.substring(0,_getBind.length-3));

				$(objname).mousemove(function(){
				    
		        	$(objname).tooltip({track : true});
				
					});
			}
			else
			{
				$(objname).val(0);
				$(objname).attr("title","");
				
			}
		}
	});
   }
    else
   {
    alert("数据不正确");	
   }
}

//保存子节点
$.saveBind = function(url,pmodname,nmodname,type){
	var _pType=$(pmodname+" .modName").text();
	var _nType=$(nmodname+" .modName").text();
	var pidcount=$(pmodname).find("input[name='cbitem']:checked");
	var _pId=$.getid(pmodname);
	var _nId=$.getid(nmodname);
	var _type = type;
    if(_pType!=""&&_pId!=""&&_nType!=""&&_nId!="")
   {
	$.getJSON(url,{ pType: _pType, pId: _pId, nType: _nType,nId: _nId ,type:_type}, function(data, status, xhr) {
		if (status == "success" && data != null)
		{
			if (data.success == true) 
			{
				alert("绑定成功");
			 }
			else
			{				
				alert("绑定失败");
			}
		}
	});
   }
    else
   {
    alert("数据不正确");	
   }
}
//解除绑定
$.removeBind = function(url,pmodname,nmodname,type){
	var _pType=$(pmodname+" .modName").text();
	var _nType=$(nmodname+" .modName").text();
	var pidcount=$(pmodname).find("input[name='cbitem']:checked");
	var _pId=$.getid(pmodname);
	var _nId=$.getid(nmodname);
	var _type = type;
    if(_pType!=""&&_pId!=""&&_nType!=""&&_nId!="")
   {
	$.getJSON(url,{ pType: _pType, pId: _pId, nType: _nType,nId: _nId ,type:_type}, function(data, status, xhr) {
		if (status == "success" && data != null)
		{
			if (data.success == true) 
			{
				alert("解绑成功");
			 }
			else
			{				
				alert("解绑失败");
			}
		}
	});
   }
    else
   {
    alert("数据不正确");	
   }
}

//中文菜单
$.menuChina = function(url,modname){
	$.getJSON(url,function(data, status, xhr) {
		if (status == "success" && data != null)
		{
			if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
			{
				$(modname+" h1").text(data.result.cnName);
				$(modname+" .modName").text(data.result.name);
				
				if(data.result.fieldProperties&&JSON.stringify(data.result.fieldProperties) != "[]")
					{
					$.each(data.result.fieldProperties,function(entryIndex,entry) 
							{
						$(modname+" th.tableItem").each(function(){
						     if(entry.path==$(this).text())
						    	 {
						    	 $(this).text(entry.name);
						    	 return false;
						    	 }
						});
							});
					}
				
			}
		
		}

	});
	}


//全选
$.selAll = function(){
	$("input[name='checkAll']").click(function(){
		  
		if(this.checked)
		{  
		   $(this).parents("table").find("input[name='cbitem']").each(function(){this.checked=true;});
		 }
		  else
		 {
		    $(this).parents("table").find("input[name='cbitem']").each(function(){this.checked=false;});
		 }
	});
	}

$.getTable = function(firUrl, modname){
	var url=firUrl+"/api/page";
	var menuUrl=firUrl+"/api/getEntityProperty";
	var seleBtns=$(modname).find("[name='number']");

	$.postSearchForm(firUrl,modname,"&pageSize="+seleBtns.val()+"&pageNum=1");
	//表格样式
	$.setRow();
	
	//全选
	$.selAll();
	
	//下拉表选页
	$(modname+ " #number").change(function(){ 
     var paging ="&pageSize="+ $(this).find("option:selected").text() +"&pageNum=1";
  	 $.postSearchForm(firUrl,modname,paging);
	});

	//滚动翻页
	$(modname + " .slider").slider({
		range : "max",
		min : 1,	
		value : 1,
		slide : function(event,ui) {
			$(modname+ " .slider").attr("title","Page "+ ui.value+ " of "+$(this).slider('option', 'max'));
			 var  pageSize=$(this).parents("table").find("[name='number']").val();	
		     var paging = "&pageSize="+ pageSize +"&pageNum="+ui.value;
		      
        	$(document).tooltip({track : true});
            $.postSearchForm(firUrl,modname,paging);
        	}
});

	//上 一页	
	$(modname+" .btnPrev").click(function(){
		if($(this).hasClass("btn-just-Icon-b"))
		return false

		var str = $(this).siblings(".pageNow").text().split("/"),nowPage=parseInt(str[0])-1, pageSize=$(this).parents("table").find("[name='number']").val();		
        var paging = "&pageSize="+ pageSize +"&pageNum="+nowPage;
        
        $.postSearchForm(firUrl,modname,paging);
        
        $(modname + " .slider").slider("option","value",nowPage);
		return false
	});
	//首页	
	$(modname+" .btnTotop").click(function(){
		if($(this).hasClass("btn-just-Icon-b"))
		return false
		var pageSize=$(this).parents("table").find("[name='number']").val();
		var paging = "&pageSize="+pageSize +"&pageNum=1";
		
		 $.postSearchForm(firUrl,modname,paging);
	     $(modname + " .slider").slider("option","value",1);
		return false
	});
	//下一页 
	$(modname+" .btnNext").click(function(){
		if($(this).hasClass("btn-just-Icon-b"))
		return false

		var str = $(this).siblings(".pageNow").text().split("/"),pageSize=$(this).parents("table").find("[name='number']").val();
		var nowPage=parseInt(str[0])+1,paging ="&pageSize="+pageSize +"&pageNum="+nowPage;
        
		$.postSearchForm(firUrl,modname,paging);

        $(modname + " .slider").slider("option","value",nowPage);
		return false
	});
	//最后一页
	$(modname+" .btnTolast").click(function(){
		if($(this).hasClass("btn-just-Icon-b"))
		return false

		var str = $(this).siblings(".pageNow").text().split("/") ,str2=str[1].split("("),nowPage=parseInt(str2[0]);
		var pageSize=$(this).parents("table").find("[name='number']").val(),paging = "&pageSize="+pageSize+"&pageNum="+nowPage;
        
		$.postSearchForm(firUrl,modname,paging);
		 $(modname + " .slider").slider("option","value",nowPage);
		return false
	});
	//增加记录
	$(modname+" .btnPlus").click(function(){
		 var seleBtn=$(this).parents("table").find("[name='number']"),itemCount = parseInt(seleBtn.val()) + 5;

		if(parseInt(seleBtn.val())>=15)
         return false;

		 if(itemCount>=15)
		 $(this).removeClass("btnIcon").addClass("btnIconb");
		    
		 var paging="&pageSize="+ itemCount + "&pageNum=1";
		    
		  $(this).siblings(".btnMin").removeClass("btnIconb").addClass("btnIcon");
			seleBtn.val(itemCount);
			$.postSearchForm(firUrl,modname,paging);
			return false;
	});
	//减少记录
	$(modname+" .btnMin").click(function(){		 
		var seleBtn=$(this).parents("table").find("[name='number']"),itemCount = parseInt(seleBtn.val())-5;

		if(parseInt(seleBtn.val())<=5)
        return false;

		 if(itemCount<=5)
			 $(this).removeClass("btnIcon").addClass("btnIconb");

		 var paging="&pageSize="+ itemCount + "&pageNum=1";
		  
		 $(this).siblings(".btnPlus").removeClass("btnIconb").addClass("btnIcon");
		 seleBtn.val(itemCount);
		 
		 $.postSearchForm(firUrl,modname,paging);
		 return false;
	});
	
	//根据规则类型和父节点获取规则
	$.getRuleByTypeAndPid = function(url,type,pid){
	    var rule="";
	    $.ajax({
			type: 'POST',
			url: url+type+'/'+pid+'',
			dataType:'json',
			cache : false,
			async:false,
			error:function(){alert('系统连接失败，请稍后再试！');},
			success: function(result){
				if(result.success){
				    rule = result.resultRule;
				}
			}	  
		});	
	    return rule;
	}
	
	$.getNext = function(url,pId,pType){
	    var result="";
	    $.ajax({
			type: 'POST',
			url: url,
			data:{
				'pId':pId,
				'pType':pType
			},
			dataType:'json',
			cache : false,
			async:false,
			error:function(){alert('系统连接失败，请稍后再试！');},
			success: function(data){
				if(data.success){
					result = data.result;
				}
			}	  
		});	
	    return result;
	}
}



