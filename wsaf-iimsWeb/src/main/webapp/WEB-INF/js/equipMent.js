var  H,tableIteams,Mach=1,remark,checkNum,checkop,iframe_now;
$.defaultjs = function(){
	if(!placeholderSupport())
	{   // 判断浏览器是否支持 placeholder_html5中新增的属性用于设置初始提示内容为灰色显示
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
}


function loadSonSelect(selects,fatherSelect,selectobj){
		$.each(selectobj.result.fieldProperties,function(index,select){
			if(select.path=="equipmentNum"){
						$.each(select.codes,function(index,cselect){
							if(index==fatherSelect){
								$.each(cselect,function(index,sselect){
									if(index==""){
										selects.append('<option value=\"'+index+'\" selected>'+sselect+'</option>');
									}else{
										selects.append('<option value=\"'+index+'\" >'+sselect+'</option>');
									}							
								});
							}
						});
						
			}
	});
}		
		
		
function loadinformation(obj) {
	if (obj.success == true && JSON.stringify(obj.result.content) != "[]") {
		var quipementChinese = "";
		var tableteam="";
		$.each(obj.result.content, function(Index, equiment) {
			
			
			var leibie1 = equiment.equipmentNum[0].substr(0, 1);
			var leibie2 = equiment.equipmentNum[0].substr(1, 1);
			switch ("S") {
			case "S":
				 switch(leibie2){
				 case    "A": quipementChinese ="应用服务器";break;
                 case    "S": quipementChinese ="存储设备";break;
                 case    "O": quipementChinese ="其它";break;
                 default:
					quipementChinese = "";
					break;
				} 
				
			case "C":
				"个人计算机";
				 switch (leibie2) {
				case "L":
					quipementChinese = "笔记本";
					break;
				case "D":
					quipementChinese = "台式机";
					break;
				case "P":
					quipementChinese = "手持终端";
					break;
				case "O":
					quipementChinese = "其它";
					break;
				default:
					quipementChinese = "";
					break;
				}

				
			case "P":
				"打印机";
				 switch (leibie2) {
				case "T":
					quipementChinese = "针式打印机";
					break;
				case "I":
					quipementChinese = "喷墨打印机";
					break;
				case "L":
					quipementChinese = "激光打印机";
					break;
				case "A":
					quipementChinese = "一体机";
					break;
				case "O":
					quipementChinese = "其它";
					break;
				default:
					quipementChinese = "";
					break;
				} 
				
			case "A":
				"办公外设";
				 switch (leibie2) {
				case "F":
					quipementChinese = "传真机";
				case "D":
					quipementChinese = "复印机";
				case "S":
					quipementChinese = "扫描仪";
				case "P":
					quipementChinese = "投影仪";
				case "H":
					quipementChinese = "手写笔";
				case "O":
					quipementChinese = "其它";
					break;
				} 
				
			case "N":
				"网络设备";
				 switch (leibie2) {
				case "S":
					quipementChinese = "交换机";
					break;
				case "H":
					quipementChinese = "集线器";
					break;
				case "A":
					quipementChinese = "接入点";
					break;
				case "R":
					quipementChinese = "路由器";
					break;
				case "L":
					quipementChinese = "负载均衡";
					break;
				case "F":
					quipementChinese = "防火墙";
					break;
				case "I":
					quipementChinese = "防入侵";
					break;
				case "O":
					quipementChinese = "其它";
					break;
				default:
					quipementChinese = "";
					break;
				} 
				
			case "O":
				 switch (leibie2) {
				case "O":
					quipementChinese = "其它";
					break;
				default:
					quipementChinese = "";
					break;
				} 
				
			default:
				"";
			 	equipementChinese = ""; 
				break;
			}
			var mainStatus="",assetCategory="",importance="";
			switch(equiment.importance){
			   case("veryImportant"):
				   importance="非常重要";
				   break;
			   case("important"):
				   importance="重要";
				   break;
			   case("commonly"):
				   importance="一般";
				   break;
			   case("other"):
				   importance="其它";
			       break;
			
			}
			switch(equiment.assetCategory){
			   case("networkEquipment"):
				   assetCategory="网络设备";
				   break;
			   case("server"):
				   assetCategory="服务器";
				   break;
			   case("switch"):
				   assetCategory="交换机";
				   break;
			   case("store"):
				   assetCategory="存储";
			   　　　　　break;
			
			}
			switch(equiment.mainStatus){
			   case("working"):
				   mainStatus="运行";
				   break;
			   case("notRunning"):
				   mainStatus="未运行";
				   break;
			   case("noBoot"):
				   mainStatus="未开机";
				   break;
			   case("notOnline"):
				   mainStatus="未在线";
			   　　　　　break;
			   case("other"):
				   mainStatus="其他";
			   　　　　　break;
			
			}
			
			var equipmentUser="",equipmentNum="",modelNumber,equipmentName;
			if(equiment.equipmentUser==""||equiment.equipmentUser==null){
				equipmentUser=""
			}else{
				equipmentUser=equiment.equipmentUser;
			}
			if(equiment.equipmentNum==""||equiment.equipmentNum==null){
				equipmentNum=""
			}else{
				equipmentNum=equiment.equipmentNum;
			}
			if(equiment.modelNumber==""||equiment.modelNumber==null){
				modelNumber=""
			}else{
				modelNumber=equiment.modelNumber;
			}
			if(equiment.equipmentName==""||equiment.equipmentName==null){
				equipmentName=""
			}else{
				equipmentName=equiment.equipmentName;
			}
			 tableteam+="<tr class=\"tableItem\"><td>"
								+equipmentNum
								+ "</td><td>"+modelNumber+"</td><td>"+equipmentName+"</td><td>"+assetCategory+"</td><td>"+importance+"</td><td>"+mainStatus+"</td><td>"+equiment.physicalLocation+"</td>"+
								"<td>"+equipmentUser+"</td><td><a href=\"javascript:particulars("+equiment.id+");\" style=\"display:inline\">详情</a>&nbsp;&nbsp;&nbsp;";
			 if(IronMan){
				 tableteam+= "<a href=\"javascript:Modify("+equiment.id+");\" style=\"display:inline\">修改</a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:Delete("+equiment.id+");\" style=\"display:inline\">刪除</a>";
				 
			 }           
			 
			tableteam+="</td></tr>";
			 
		});
		$("#table_1 tbody").empty();
	 	$("#table_1 tbody").append(tableteam); 
	    
	  
	    
	
	    	if (obj.result.pageInfo != null) 
				{
				
					var _pageinfo=obj.result.pageInfo;
					
					var nowcount=$("#table_1").find(".tableItem");
				   
					if(_pageinfo.pageSize>nowcount.length)
						{
						var minMum=_pageinfo.pageSize-nowcount.length;
						for(var i=0;i<minMum;i++)
							{
							$("#table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
							}
						}
					
			         $(".tfoot span:first-child").text("共"+_pageinfo.totalRecord+"条记录，当前显示1-"+nowcount.length+"条");
			         
			         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
			         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
			        
			         var  pageStyle="";
			         if(_pageinfo.totalPages>7)
			        	 {
			        	 if(_pageinfo.currentPage<=1)
			        		 {
			        		 //pageStyle+="<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
			        		 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">5</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">3</a></li><li><a class=\"topage\">2</a></li><li class=\"selected\"><a class=\"topage\">1</a></li>";
			        		 }else if(_pageinfo.currentPage==2){
			        			 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li><li><a>...</a></li><li><a class=\"topage\">5</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">3</a></li><li class=\"selected\"><a class=\"topage\">2</a></li><li ><a class=\"topage\">1</a></li>";
			        		 }
			        	 else
			        		 {
			        		
			        			 if(_pageinfo.totalPages-_pageinfo.currentPage==0){
			        				 var pa=_pageinfo.currentPage-4; pb=_pageinfo.currentPage-3;pc=_pageinfo.currentPage-2; pd=_pageinfo.currentPage-1;
			        				 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li>  <li><a class=\"topage\">"+pd+"</a></li> <li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>";
			        			 }else if(_pageinfo.totalPages-_pageinfo.currentPage==1){
			        				 var pa=_pageinfo.currentPage-3; pb=_pageinfo.currentPage-2;pc=_pageinfo.currentPage-1; pd=_pageinfo.currentPage+1;
			        				 pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li> <li><a class=\"topage\">"+pd+"</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li>  <li><a class=\"topage\">"+pc+"</a></li><li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>"; 
			        			 }else{
			        				 var pa=_pageinfo.currentPage-2; pb=_pageinfo.currentPage-1;pc=_pageinfo.currentPage+1; pd=_pageinfo.currentPage+2;
				        		     pageStyle+="<li><a>"+_pageinfo.totalPages+"</a></li> <li><a>...</a></li> <li><a class=\"topage\">"+pd+"</a></li> <li><a class=\"topage\">"+pc+"</a></li><li class=\"selected\"><a >"+_pageinfo.currentPage+"</a></li> <li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pa+"</a></li>";
			        			 }
			        			
			        		 }
			        	 }
			         else
			        	 {
			        	for(var j=1;j<=_pageinfo.totalPages;j++)
							{
			        		if(j==_pageinfo.currentPage)
			        			{
			        			pageStyle="<li class=\"selected \"><a>"+j+"</a></li>"+pageStyle;
			        			
			        			}
			        		else
			        			{
			        			pageStyle="<li><a class=\"topage \">"+j+"</a></li>"+pageStyle;

			        			}
							}
			        	 }
			      
			         _menu+=pageStyle+"<li><a  class=\"prepage\">&lt;&lt;</a></li>";
			         $("ul.pager li").remove();
			         $("ul.pager").append(_menu);   
				}
     }else{
    	
    	   $(".tfoot span:first-child").text("无相关信息！请重新搜索！");
     }
	
}

function loadInfomationToIframe1(obj,selectobj){
	iframe_now=1;
	tableIteams="",remark="";
	var ifm= $("#table_2 tbody"),init=0,chinesename='',tableIteam='';
	ifm.empty();
	$.each(obj.result, function(Index, equiment){
		init++;
		if(init==1){
			isHidden(Index,selectobj);
			//alert(H);
			if(H==2){
				tableIteams+='<tr>';
			}else{
				init--;
				return true;
			}
		}
		$.findChineseName(ifm,Index,selectobj);
		if(Index=="remarks"){
			//alert(equiment);
			if(equiment==null||equiment=="null"){
				remark+='<td colspan="3" rowspan="3">未填</td></tr>';
			}else{
				remark+='<td colspan=4><textarea clos="20"  rows="5"  readonly  style="overflow:auto">'+equiment+'</textarea></td></tr>';
			}
			
			init--;
		}else{
			var e = equiment;
			//alert(e);
			if(e=="null"||e==null){
				//alert(0);
				e="未填";
			}
			//alert(e);
			switch(equiment){
			   case("veryImportant"):
				  e="非常重要";
				   break;
			   case("important"):
				   e="重要";
				   break;
			   case("commonly"):
				   e="一般";
				   break;
			   case("other"):
				   e="其它";
			       break;
			   case("networkEquipment"):
				   e="网络设备";
				   break;
			   case("server"):
				   e="服务器";
				   break;
			   case("switch"):
				   e="交换机";
				   break;
			   case("store"):
				   e="存储";
			   　　　　　break;
			   case("working"):
				   e="运行";
				   break;
			   case("notRunning"):
				   e="未运行";
				   break;
			   case("noBoot"):
				   e="未开机";
				   break;
			   case("notOnline"):
				  e="未在线";
			   　　　　　break;
			 
			}
			tableIteams+='<td>'+e+'</td>';
		}
		
		if(init==2){
			tableIteams+="</tr>"
		    init=0;
		}	
	});
	tableIteams+=remark;
	ifm.append(tableIteams);
	$("#iframe_xx").fadeIn();
}

function loadInfomationToIframe2(obj,selectobj){
	iframe_now=2;
	tableIteams="",remark="";
	var ifm= $("#table_3 tbody"),init=0,chinesename='';
	ifm.empty();
	$.each(obj.result, function(Index, equiment){
	    // 通过Index查找对应的中文名字
		init++;
		if(init==1){
			isHidden(Index,selectobj);
			if(H==2){
				tableIteams+='<tr>';
			}else{
				if(Index=="id"){
					$("#md").attr('onclick','javascript:modify('+equiment+');');
				}
				init--;
				return true;
			}
		}
		$.findChineseName(ifm,Index,selectobj);
		
		var e= equiment;
		if(e=="null"||e==null){
			e="";
		}
		$.each(selectobj.result.fieldProperties, function(Key, selectEntrty){
		
			if(Index== selectEntrty.path){
				
				
				 if(selectEntrty.operate=="input"){
					
					 if(Index=="remarks"){
						 remark+='<td colspan=4><textarea name="'+selectEntrty.path+'" clos="20"  rows="5"  >'+e+'</textarea></td>';
						 init--;
					 }else if(selectEntrty.path=="purchaseTime"){
						 tableIteams+='<td><input type="date" name=\"'+selectEntrty.path+'\"  class="input_large" value=\"'+e+'\"/></td>';
					 }else{
						 tableIteams+='<td><input type="text" name=\"'+selectEntrty.path+'\" value=\"'+e+'\" class="input_large"/></td>'; 
					 }
					 
					 
				 }else if(selectEntrty.operate=="select"){
					 if(selectEntrty.operate=="select"){
						 if(selectEntrty.path=="equipmentNum"){
							 var select1,select2;
							 tableIteams+='<td class="td_l" colspan="3" style="height:20px;"><select id="fselect"  style="width:100px" ></select>';
							 tableIteams+='&nbsp;&nbsp;&nbsp;<select id="sselect" style="width:100px" ></select>&nbsp;';
							 tableIteams+='<input type=\"text\" id="num" name=\"'+selectEntrty.path+'\" style="width:120px" value=\"'+e+'\" /></tr><tr>';
							
							
							 
							
							 
							 
						 }else{
							 tableIteams+='<td><select id=\"'+selectEntrty.path+'\" name=\"'+selectEntrty.path+'\" class="input_large" ">';
							 
						 }
						
					 }
					 }else if(selectEntrty.operate=="hidden"){
						 return true;
					 }
			    }
			});
		
		if(init==2){
			tableIteams+='</tr>';
		    init=0;
		}	
		
	});
	tableIteams+=remark;
	ifm.append(tableIteams);
	
	
 	 $.each(obj.result, function(Index, equiment){
 		 if(Index=="equipmentNum"){
 			 initselect( $("#fselect"),SelectObj,"equipmentNum");
 			 var f = equiment.substr(0,1);
 			 var s = equiment.substr(1,1);
 			// alert(s);
 			$("#fselect").find("option[value='"+f+"']").attr("selected",true);
 			 loadSonSelect($("#sselect"),$("#fselect").val(),SelectObj);
 			$("#sselect").find("option[value='"+s+"']").attr("selected",true);
 		 }else if(Index=="mainStatus"){
 			initselect( $("#mainStatus"),SelectObj,"mainStatus");
 			$("#mainStatus").find("option[value='"+equiment+"']").attr("selected",true);
 		 }else if(Index=="assetCategory"){
 			initselect( $("#assetCategory"),SelectObj,"assetCategory");
 			$("#assetCategory").find("option[value='"+equiment+"']").attr("selected",true);
 		 }else if(Index=="importance"){
 			initselect( $("#importance"),SelectObj,"importance");
 			$("#importance").find("option[value='"+equiment+"']").attr("selected",true);
 		 }
 	 });
 	 $("#iframe_gx").fadeIn();
 
	 $("#fselect").change(function() {
		   $("#sselect").empty(); 
		   var a = $("#fselect").val();
		   $("#num").val(a);
		  
		   loadSonSelect($("#sselect"),$("#fselect").val(),SelectObj);
		}); 
	 
	 $("#sselect").change(function() {
		   var a = $("#sselect").val();
		   $("#num").val( $("#num").val().substr(0,1)+a+$("#num").val().substr(2));
		}); 
		
	 
}
function loadInfomationToIframe3(selectobj){
	
	var ifm= $("#table_4 tbody"),init=0,chinesename='',tableIteams="";
	ifm.empty();
	$.each(selectobj.result.fieldProperties,function(Index,selectEntrty){
		
		if(init==0){
			tableIteams+="<tr>";
		}
		init++;	
		if(selectEntrty.operate!="hidden"){
			if(selectEntrty.path=="remarks"){
				tableIteams+="<tr>";
			}
			if(selectEntrty.path=="equipmentNum"||selectEntrty.path=="equipmentName"||selectEntrty.path=="equipmentUser"||selectEntrty.path=="physicalLocation"||selectEntrty.path=="ipAddress"||selectEntrty.path=="macAddress"){
				tableIteams+="<td class=\"lableTd t_r\"><span class=\"red\">*</span>"+selectEntrty.name+"</td>";
			}else{
				tableIteams+="<td class=\"lableTd t_r\">"+selectEntrty.name+"</td>";
			}
			

			 if(selectEntrty.operate=="input"){
				 if(selectEntrty.path=="remarks"){
					 tableIteams+='<td colspan=4><textarea  maxlength="500" name="'+selectEntrty.path+'" clos="20"  rows="5"></textarea></td>';
				 }else if(selectEntrty.path=="purchaseTime"){
					 tableIteams+='<td><input type="date" name=\"'+selectEntrty.path+'\"  class="input_large"/></td>';
				 }else{
					 tableIteams+='<td><input  maxlength="30" type="text" name=\"'+selectEntrty.path+'\"  class="input_large"/></td>'; 
				 }
			 }else if(selectEntrty.operate=="select"){
				 
				 if(selectEntrty.operate=="select"){
					 if(selectEntrty.path=="equipmentNum"){
						 var select1,select2;
						 tableIteams+='<td class="td_l" colspan="3" style="height:20px;"><select id="fselect"  style="width:100px" ></select>';
						 tableIteams+='&nbsp;&nbsp;&nbsp;<select id="sselect" style="width:100px" ></select>&nbsp;';
						 tableIteams+='<input type=\"text\" id="num" name=\"'+selectEntrty.path+'\" style="width:120px" /></tr><tr>';
						 init--;
					 }else{
						 tableIteams+='<td><select id=\"'+selectEntrty.path+'\" name=\"'+selectEntrty.path+'\" class=\"input_large\" ></select></td>';
						 
					 }
				 }
				 }
			
		}else{
			init--;
		}
		
		if(init==2){
			init=0;
			tableIteams+="</tr>";
		}
	    	
    });
	ifm.append(tableIteams);
	
 			initselect( $("#fselect"),SelectObj,"equipmentNum");
 		
 			initselect( $("#mainStatus"),SelectObj,"mainStatus");
 		
 			initselect( $("#assetCategory"),SelectObj,"assetCategory");
 			
 			initselect( $("#importance"),SelectObj,"importance");
 
	 $("#fselect").change(function() {
		   $("#sselect").empty(); 
		   var a = $("#fselect").val();
		   $("#num").val(a);
		  
		   //$("#equipmentNum").value()=$("#select_1").val();
		   loadSonSelect($("#sselect"),$("#fselect").val(),SelectObj);
		}); 
	  $("#iframe_xz").fadeIn();
	 $("#sselect").change(function() {
		   var a = $("#sselect").val();
		   $("#num").val( $("#num").val().substr(0,1)+a+$("#num").val().substr(2));
		}); 
		
	 
}
function isHidden(key,selectobj){
	
	$.each(selectobj.result.fieldProperties,function(index,eq){
		if(eq.path==key&&eq.operate=="hidden"){
			
			H =1;
			return false;
		}else{
			H =2;
		}
	});
}

$.findChineseName =function (Ifm,key,selectobj){ 
	var ifm= Ifm;
	var chinesename='';
	isHidden(key,selectobj);
	 var  fieldProperties = selectobj.result.fieldProperties;
	  $.each(fieldProperties, function(Index, selectEntrty){
		   
		  if(selectEntrty.path==key&&H==2){
			  chinesename =selectEntrty.name;
			  if(key=="remarks"){
				  remark+='<tr><td class=\"lableTd t_r\">'+chinesename+'</td>';
				 
			  }else{
				  if(selectEntrty.path=="equipmentNum"||selectEntrty.path=="equipmentName"||selectEntrty.path=="equipmentUser"||selectEntrty.path=="physicalLocation"||selectEntrty.path=="ipAddress"||selectEntrty.path=="macAddress"){
						
						if(selectEntrty.path=="equipmentNum"&&iframe_now==2){
							tableIteams+="<tr><td class=\"lableTd t_r\"><span class=\"red\">*</span>"+selectEntrty.name+"</td>";
						}else{
							tableIteams+="<td class=\"lableTd t_r\"><span class=\"red\">*</span>"+selectEntrty.name+"</td>";
						}
					}else{
						tableIteams+="<td class=\"lableTd t_r\">"+selectEntrty.name+"</td>";
					}
			  }
			
			  return false;
		  }else if(H==1){
			  return true;
		  }
		});
	
}

function findoprate(key,selectobj){
		 var  fieldProperties = selectobj.result.fieldProperties;
		  $.each(fieldProperties, function(Index, selectEntrty){
			  if(fieldProperties[Index].path==key){
				  return fieldProperties[Index].operate;
				  	  }
			});
		
	}

function close(){
	 $("#iframe_xx").fadeOut();
	 $("#iframe_gx").fadeOut();
	 $("#iframe_xz").fadeOut();
	 $("#iframe_xx tbody").empty();
	 $("#iframe_gx tbody").empty();
	 $("#iframe_xz tbody").empty();
	 var ifm= $("#table_2 tbody"),init=0,chinesename='',tableIteam='';
	setTimeout( ifm.empty(),100000);
	
	}


function validate(str){
	var strs= str.split("&");
	var mach="";
		//alert(0);
	$.each(strs,function(index,infs){
		var inf = infs.split("=");
		if(inf[0]=="equipmentNum"){
			mach= /[A-Z]{2}\d{5}/;
			//alert(inf[1]);
			//alert(0);
			if(inf[1]==""||!mach.test(inf[1])){
				Mach=1;
				alert("设备编号未填写或格式错误！格式为(SS88888)");
				return false;
			}
		} 
		//alert(checkop);
		  for(var i=0;i>0;i++){
			  if(checkop==2){
				  return false;
			  }
		  }
	    //alert(checkNum);
			if(checkNum==2){
				Mach=1;
				 return false;
			}else if(inf[0]=="equipmentName"){
				
				if(inf[1]==""){
					Mach=1;
					alert("厂商名称未填写！");
					return false;
				}
			}else if(inf[0]=="equipmentUser"){
				if(inf[1]==""){
					Mach=1;
					alert("使用人未填写！");
					return false;
				}
			}else if(inf[0]=="macAddress"){
				mach= /[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}/;
				if(inf[1]==""||!mach.test(inf[1])){
					Mach=1;
					alert("MAC未填写或格式错误！\n(格式为1D-ED-56-4R-FG-OP)");
					return false;
				}
			}else if(inf[0]=="ipAddress"){
				mach= /[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/;
				if(inf[1]==""||!mach.test(inf[1])){
					Mach=1;
					alert("IP地址未填写或格式错误！");
					return false;
				}
			}else{
				Mach=0;
			}
		
	});
	

}
