var  H,tableIteams,Mach,remark;
$.defaultjs = function(){
	if(!placeholderSupport())
	{   // �ж�������Ƿ�֧�� placeholder_html5�������������������ó�ʼ��ʾ����Ϊ��ɫ��ʾ
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
	// alert(fatherSelect);
	// alert(0);
	// alert(selectobj.result.fieldProperties);
		$.each(selectobj.result.fieldProperties,function(index,select){
			// alert(index);
			if(select.path=="equipmentNum"){
				// alert(2);
						$.each(select.codes,function(index,cselect){
						// alert(index);
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
						
				/*	*/
			}
	});
}		
		
		
function loadinformation(obj) {
	 //alert(0);
	if (obj.success == true && JSON.stringify(obj.result.content) != "[]") {
		var quipementChinese = "";
		var tableteam="";
		$.each(obj.result.content, function(Index, equiment) {
			// alert(equiment.equipmentNum[0]);
			var leibie1 = equiment.equipmentNum[0].substr(0, 1);
			var leibie2 = equiment.equipmentNum[0].substr(1, 1);
			switch ("S") {
			case "S":
				 switch(leibie2){
				 case    "A": quipementChinese ="Ӧ�÷�����";break;
                 case    "S": quipementChinese ="�洢�豸";break;
                 case    "O": quipementChinese ="����";break;
                 default:
					quipementChinese = "";
					break;
				} 
				
			case "C":
				"���˼����";
				 switch (leibie2) {
				case "L":
					quipementChinese = "�ʼǱ�";
					break;
				case "D":
					quipementChinese = "̨ʽ��";
					break;
				case "P":
					quipementChinese = "�ֳ��ն�";
					break;
				case "O":
					quipementChinese = "����";
					break;
				default:
					quipementChinese = "";
					break;
				}

				
			case "P":
				"��ӡ��";
				 switch (leibie2) {
				case "T":
					quipementChinese = "��ʽ��ӡ��";
					break;
				case "I":
					quipementChinese = "��ī��ӡ��";
					break;
				case "L":
					quipementChinese = "�����ӡ��";
					break;
				case "A":
					quipementChinese = "һ���";
					break;
				case "O":
					quipementChinese = "����";
					break;
				default:
					quipementChinese = "";
					break;
				} 
				
			case "A":
				"�칫����";
				 switch (leibie2) {
				case "F":
					quipementChinese = "�����";
				case "D":
					quipementChinese = "��ӡ��";
				case "S":
					quipementChinese = "ɨ����";
				case "P":
					quipementChinese = "ͶӰ��";
				case "H":
					quipementChinese = "��д��";
				case "O":
					quipementChinese = "����";
					break;
				} 
				
			case "N":
				"�����豸";
				 switch (leibie2) {
				case "S":
					quipementChinese = "������";
					break;
				case "H":
					quipementChinese = "������";
					break;
				case "A":
					quipementChinese = "�����";
					break;
				case "R":
					quipementChinese = "·����";
					break;
				case "L":
					quipementChinese = "���ؾ���";
					break;
				case "F":
					quipementChinese = "����ǽ";
					break;
				case "I":
					quipementChinese = "������";
					break;
				case "O":
					quipementChinese = "����";
					break;
				default:
					quipementChinese = "";
					break;
				} 
				
			case "O":
				 switch (leibie2) {
				case "O":
					quipementChinese = "����";
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
				   importance="�ǳ���Ҫ";
				   break;
			   case("important"):
				   importance="��Ҫ";
				   break;
			   case("commonly"):
				   importance="һ��";
				   break;
			   case("other"):
				   importance="����";
			       break;
			
			}
			switch(equiment.assetCategory){
			   case("networkEquipment"):
				   assetCategory="�����豸";
				   break;
			   case("server"):
				   assetCategory="������";
				   break;
			   case("switch"):
				   assetCategory="������";
				   break;
			   case("store"):
				   assetCategory="�洢";
			   ����������break;
			
			}
			switch(equiment.mainStatus){
			   case("working"):
				   mainStatus="����";
				   break;
			   case("notRunning"):
				   mainStatus="δ����";
				   break;
			   case("noBoot"):
				   mainStatus="δ����";
				   break;
			   case("notOnline"):
				   mainStatus="δ����";
			   ����������break;
			   case("other"):
				   mainStatus="����";
			   ����������break;
			
			}
			
			
			 tableteam+="<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\""+equiment.id+"\" name=\"test_checkbox_1\"></td><td>"
								+ equiment.equipmentNum
								+ "</td><td>"+equiment.modelNumber+"</td><td>"+equiment.equipmentName+"</td><td>"+assetCategory+"</td><td>"+importance+"</td><td>"+mainStatus+"</td><td>"+equiment.physicalLocation+"</td>"+
								"<td>"+equiment.equipmentUser+"</td><td><a href=\"javascript:particulars("+equiment.id+");\" style=\"display:inline\">����</a>&nbsp;&nbsp;&nbsp;";
			 if(IronMan){
				// alert(0);
				 tableteam+= "<a href=\"javascript:Modify("+equiment.id+");\" style=\"display:inline\">�޸�</a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:Delete("+equiment.id+");\" style=\"display:inline\">�h��</a>";
				 
			 }           
			 
			tableteam+="</td></tr>";
			 
		});
		$("#table_1 tbody").empty();
	 	$("#table_1 tbody").append(tableteam); 
	    
	   // alert(obj.result.pageInfo.pageSize);
	  
	    
	
	    	if (obj.result.pageInfo != null) 
				{
				
					var _pageinfo=obj.result.pageInfo;
					
					var nowcount=$("#table_1").find(".tableItem");
				   
					if(_pageinfo.pageSize>nowcount.length)
						{
						var minMum=_pageinfo.pageSize-nowcount.length;
						for(var i=0;i<minMum;i++)
							{
							$("#table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
							}
						}
					
			         $(".tfoot span:first-child").text("��"+_pageinfo.totalRecord+"����¼����ǰ��ʾ1-"+nowcount.length+"��");
			         
			         var _menu="<li>Pages:"+_pageinfo.currentPage+"/"+_pageinfo.totalPages+"<input type=\"number\" id=\"gopage\" name=\"number\" min=\"0\" max=\""+_pageinfo.totalPages+"\" step=\"1\" class=\"input_tiny\" />";
			         _menu+=" <input type=\"button\" name=\"button\" id=\"gopagebtn\" value=\"Go\"></li><li><a class=\"nextpage\">&gt;&gt;</a></li>";
			        
			         var  pageStyle="";
			         if(_pageinfo.totalPages>7)
			        	 {
			        	 if(_pageinfo.currentPage<=1)
			        		 {
			        		 pageStyle+="<li class=\"selected\"><a class=\"topage\">1</a></li> <li><a class=\"topage\">2</a></li> <li><a class=\"topage\">3</a></li> <li><a class=\"topage\">4</a></li> <li><a class=\"topage\">5</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
			        		 }
			        	 else
			        		 {
			        		 var pa=_pageinfo.currentPage-1; pb=_pageinfo.currentPage+1;pc=_pageinfo.currentPage+2; pd=_pageinfo.currentPage+2;
			           		 pageStyle+="<li ><a class=\"topage\">"+pa+"</a></li> <li><a class=\"selected\">"+_pageinfo.currentPage+"</a></li> <li><a class=\"topage\">"+pb+"</a></li> <li><a class=\"topage\">"+pc+"</a></li> <li><a class=\"topage\">"+pd+"</a></li> <li><a>...</a></li> <li><a>"+_pageinfo.totalPages+"</a></li>";
						      
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
    	
    	 
    	   $(".tfoot span:first-child").text("�������Ϣ��������������");
     }
	
}

function loadInfomationToIframe1(obj,selectobj){
	
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
				remark+='<td colspan="3" rowspan="3">δ��</td></tr>';
			}else{
				remark+='<td colspan="3" rowspan="3">'+equiment+'</td></tr>';
			}
			
			init--;
		}else{
			var e = equiment;
			//alert(e);
			if(e=="null"||e==null){
				//alert(0);
				e="δ��";
			}
			//alert(e);
			switch(equiment){
			   case("veryImportant"):
				  e="�ǳ���Ҫ";
				   break;
			   case("important"):
				   e="��Ҫ";
				   break;
			   case("commonly"):
				   e="һ��";
				   break;
			   case("other"):
				   e="����";
			       break;
			   case("networkEquipment"):
				   e="�����豸";
				   break;
			   case("server"):
				   e="������";
				   break;
			   case("switch"):
				   e="������";
				   break;
			   case("store"):
				   e="�洢";
			   ����������break;
			   case("working"):
				   e="����";
				   break;
			   case("notRunning"):
				   e="δ����";
				   break;
			   case("noBoot"):
				   e="δ����";
				   break;
			   case("notOnline"):
				  e="δ����";
			   ����������break;
			 
			}
		   /* if(e==null){
		     	e="δ��д";
		    }*/
			tableIteams+='<td>'+e+'</td>';
		}
		
		if(init==2){
			tableIteams+="</tr>"
		    init=0;
		}	
	});
	tableIteams+=remark;
	//alert(tableIteams);
	ifm.append(tableIteams);
	$("#iframe_xx").fadeIn();
}
function isHidden(key,selectobj){
	
	$.each(selectobj.result.fieldProperties,function(index,eq){
		// alert(key+""+eq.path);
		if(eq.path==key&&eq.operate=="hidden"){
			
			//alert(eq.path+eq.operate);
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
// alert(selectobj);
	// alert(key)
	isHidden(key,selectobj);
	// alert(H);
	 var  fieldProperties = selectobj.result.fieldProperties;
	  $.each(fieldProperties, function(Index, selectEntrty){
		 // alert(key);
		   
		  if(selectEntrty.path==key&&H==2){
			// alert(fieldProperties[Index].name);
			  chinesename =selectEntrty.name;
			// alert(chinesename);
			  if(key=="remarks"){
				  remark+='<tr><td class=\"lableTd t_r\">'+chinesename+'</td>';
				 
			  }else{
				  tableIteams+='<td class=\"lableTd t_r\">'+chinesename+'</td>';
			  }
			
			  return false;
		  }else if(H==1){
			  return true;
		  }
		});
	
}

function findoprate(key,selectobj){
	// alert(selectobj);
		 var  fieldProperties = selectobj.result.fieldProperties;
		  $.each(fieldProperties, function(Index, selectEntrty){
			  if(fieldProperties[Index].path==key){
				// alert(fieldProperties[Index].operate);
				  return fieldProperties[Index].operate;
				  	  }
			});
		
	}

function close(){
	 $("#iframe_xx").fadeOut();
	 $("#iframe_gx").fadeOut();
	 $("#iframe_xz").fadeOut();
	 var ifm= $("#table_2 tbody"),init=0,chinesename='',tableIteam='';
	setTimeout( ifm.empty(),100000);
	
	}


function validate(str){
	var strs= str.split("&");
	var mach="";
	//alert(strs);
	$.each(strs,function(index,infs){
		
		var inf = infs.split("=");
		if(inf[0]=="equipmentNum"){
			mach= /[A-Z]{2}\d{6}/;
			//alert(inf[1]);
			if(inf[1]==""||!mach.test(inf[1])){
				Mach=1;
				alert("�豸���δ��д���ʽ���󣡸�ʽΪ(SS888888)");
				return false;
			}
		}else if(inf[0]=="equipmentName"){
			if(inf[1]==""){
				Mach=1;
				alert("��������δ��д��");
				return false;
			}
		}else if(inf[0]=="equipmentUser"){
			if(inf[1]==""){
				Mach=1;
				alert("ʹ����δ��д��");
				return false;
			}
		}else if(inf[0]=="macAddress"){
			mach= /[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}/;
			if(inf[1]==""||!mach.test(inf[1])){
				Mach=1;
				alert("MACδ��д���ʽ����\n(��ʽΪ1D-ED-56-4R-FG-OP)");
				return false;
			}
		}else if(inf[0]=="ipAddress"){
			mach= /[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/;
			if(inf[1]==""||!mach.test(inf[1])){
				Mach=1;
				alert("IP��ַδ��д���ʽ����");
				return false;
			}
		}else if(inf[0]=="purchaseTime"){
			mach= /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
			if(inf[1]==""||!mach.test(inf[1])){
				Mach=1;
				alert("�ɹ�ʱ���ʽ����(��ʽΪ1999-01-01)");
				return false;
			}
		}
		Mach=0;
	});
}
