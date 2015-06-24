var  H,tableIteams,Mach=1,remark,checkNum,checkop;
$.defaultjs = function(){
	if(!placeholderSupport())
	{   
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


function loadinformationToVersionAdd(obj){
	var tableItem="",tableItemEqu="",tableItemApp="",initEqu=0,initApp=0;
	tableItemEqu+="<tr><td class=\"lableTd t_r\"><h4>设备信息</h4></td><td></td><td></td><td></td></tr>";
	tableItemApp+=" <tr><td class=\"lableTd t_r\"><h4>软件信息</h4></td><td></td><td ></td><td></td></tr>";
  $.each(obj.result.fieldProperties,function(index,object){
	  if(object.operate!="hidden"&&object.path!="deviceName"){
		 
		  if(object.path=="dept"||object.path=="deviceNum"||object.path=="deviceName"||object.path=="macAddress"){
			
			  if(initEqu==0){
				//  alert(initEqu);
				  tableItemEqu+="<tr>";
			  }
			  initEqu++;	  
			  if(object.operate=="input"){
				  tableItemEqu+=" <td class=\"lableTd t_r\">"+object.name+" </td><td> <input  type=\"text\" class=\"input_large\" name=\""+object.path+"\" placeholder=\"请输入"+object.name+"\"/></td>";
			  }else{
				  tableItemEqu+="<td class=\"lableTd t_r\" >"+object.name+"</td><td><select name=\""+object.path+"\" class=\"input_large\"></select></td>";
			  }
			  if(initEqu==2){
				  tableItemEqu+="</tr>";
				  initEqu=0;
			  }
			  
		  }else{

			  if(initApp==0){
				  tableItemApp+="<tr>";
			  }
			  initApp++;	  
			  if(object.operate=="input"){
				  tableItemApp+=" <td class=\"lableTd t_r\">"+object.name+" </td><td> <input   type=\"text\" class=\"input_large\" name=\""+object.path+"\" placeholder=\"请输入"+object.name+"\"/></td>";
			  }else{
				  if(object.path=="appLevel"){
					  tableItemApp+="<td class=\"lableTd t_r\" >"+object.name+"</td><td><select disabled name=\""+object.path+"\" class=\"input_large\"></select></td>";
				  }else{
					  tableItemApp+="<td class=\"lableTd t_r\" >"+object.name+"</td><td><select  name=\""+object.path+"\" class=\"input_large\"></select></td>";
				  }
				  
			  }
			  if(initApp==2){
				  tableItemApp+="</tr>";
				  initApp=0;
			  }
		  }
	  }
  });
	//alert(tableItemEqu);
	//alert(tableItemApp);
	tableItem+=tableItemEqu;
	tableItem+=tableItemApp;
	//alert(tableItem);
	$("#table_addnew tbody").empty();
 	$("#table_addnew tbody").append(tableItem); 
    
 	InitSelect();
 	addListen();
}


function InitSelect(){
	$.each(SelectObj.result.fieldProperties,function(index,object){
		if(object.path=="dept"||object.path=="appType"||object.path=="authorize"){
			$.each(object.option,function(index,option){
				if(index==""){
					$("[name='"+object.path+"']").append("<option value=\""+index+"\" selected>"+option+"</option>");
				}else{
					$("[name='"+object.path+"']").append("<option value=\""+index+"\">"+option+"</option>");
				}
			});
		}
	});
}

function addListen(){
	$("[name='appType']").change(function(){
		//alert($("[name='appType']").val());
	   if($("[name='appType']").val()=="oa"){
		   $("[name='appName']").empty();
		   $("[name='appVersion']").empty();
		  // alert(0);
		   $("[name='appLevel']").attr("disabled",false);
		 //  alert(0);
		   loadSonSelect("appLevel","appType");
			$("[name='appLevel']").change(function(){
				//alert($("[name='appType']").val());
				$("[name='appName']").empty();
				   loadSonSelect("appName","appLevel");
				});
	   }else{
		   $("[name='appLevel']").attr("disabled",true);
		   $("[name='appName']").empty();
		   $("[name='appLevel']").empty();
		   $("[name='appVersion']").empty();
		   loadSonSelect("appName","appType");
	   }
	});
	
	$("[name='appName']").change(function(){
		$("[name='appVersion']").empty();
		
		   loadSonSelect("appVersion","appName");
	});
}
	
function loadSonSelect(selectname,selectname2){//子选项，父选项
	//alert(SelectObj.result.fieldProperties);
	$.each(SelectObj.result.fieldProperties,function(index,obj){
		//alert(obj.path);
		if(obj.path==selectname){
			$.each(obj.codes,function(i,o){
				//alert($("[name='"+selectname2+"']").val());
				if($("[name='"+selectname2+"']").val()==i){
					$.each(o,function(a,b){
						if(a==""){
							$("[name='"+selectname+"']").append("<option value=\""+a+"\" selected>"+b+"</option>");
						}else{
							$("[name='"+selectname+"']").append("<option value=\""+a+"\">"+b+"</option>");
						}
					});
				}
			});
		}
	});
}	
	
	

function loadinformationToVersionModify(obj){
	var tableItem="",tableItemEqu="",tableItemApp="",initEqu=0,initApp=0;
	tableItemEqu+="<tr><td class=\"lableTd t_r\"><h4>设备信息</h4></td><td></td><td></td><td></td></tr>";
	tableItemApp+=" <tr><td class=\"lableTd t_r\"><h4>软件信息</h4></td><td></td><td ></td><td></td></tr>";
  $.each(obj.result.fieldProperties,function(index,object){
	  if(object.operate!="hidden"&&object.path!="deviceName"){
		  if(object.path=="dept"||object.path=="deviceNum"||object.path=="macAddress"){
			
			  if(initEqu==0){
				//  alert(initEqu);
				  tableItemEqu+="<tr>";
			  }
			  initEqu++;	  
			  if(object.operate=="input"){
				  tableItemEqu+=" <td class=\"lableTd t_r\">"+object.name+" </td><td> <input  type=\"text\" class=\"input_large\" name=\""+object.path+"\" placeholder=\"请输入"+object.name+"\"/></td>";
			  }else{
				  tableItemEqu+="<td class=\"lableTd t_r\" >"+object.name+"</td><td><select name=\""+object.path+"\" class=\"input_large\"></select></td>";
			  }
			  if(initEqu==2){
				  tableItemEqu+="</tr>";
				  initEqu=0;
			  }
			  
		  }else{

			  if(initApp==0){
				  tableItemApp+="<tr>";
			  }
			  initApp++;	  
			  if(object.operate=="input"){
				  tableItemApp+=" <td class=\"lableTd t_r\">"+object.name+" </td><td> <input   type=\"text\" class=\"input_large\" name=\""+object.path+"\" placeholder=\"请输入"+object.name+"\"/></td>";
			  }else{
				  if(object.path=="appLevel"){
					  tableItemApp+="<td class=\"lableTd t_r\" >"+object.name+"</td><td><select disabled name=\""+object.path+"\" class=\"input_large\"></select></td>";
				  }else{
					  tableItemApp+="<td class=\"lableTd t_r\" >"+object.name+"</td><td><select  name=\""+object.path+"\" class=\"input_large\"></select></td>";
				  }
				  
			  }
			  if(initApp==2){
				  tableItemApp+="</tr>";
				  initApp=0;
			  }
		  }
	  }
  });
	//alert(tableItemEqu);
	//alert(tableItemApp);
	tableItem+=tableItemEqu;
	tableItem+=tableItemApp;
	//alert(tableItem);
	$("#table_addnew tbody").empty();
 	$("#table_addnew tbody").append(tableItem); 
    
 	InitSelect();
 	addListen();
 	InitInfomationToModify();
}
//$("[name='"+selectname+"']")
//$("#assetCategory").find("option[value='"+equiment+"']").attr("selected",true);
function loadInfomationTomodify(obj){
	$.each(obj.result,function(index,ims){
		if(index=="id"){
			$("#md").attr('onclick','javascript:modify('+ims+');');
	   }
		if(index!="deviceName"){
			$.each(SelectObj.result.fieldProperties,function(i,s){
				if(s.path==index){
					if(s.operate!="hidden"){
						if(index=="dept"||index=="deviceNum"||index=="macAddress"||index=="appType"||index=="authorize"){
							if(s.operate=="select"){
								$("[name='"+index+"']").find("option[value='"+ims+"']").attr("selected",true);	
							}else{
								$("[name='"+index+"']").val(ims);
							}
							if(index=="appType"){
								if(ims=="oa"){
									 $("[name=appLevel]").attr("disabled",false);
									  loadSelect("appLevel",ims);
								}else{
									 loadSelect("appName",ims);
								}
							}
						}else{
						   if(index=="appLevel"){
							   $("[name='"+index+"']").find("option[value='"+ims+"']").attr("selected",true);	
							   loadSelect("appName",ims);
						   }else if(index=="appName"){
							   $("[name='"+index+"']").find("option[value='"+ims+"']").attr("selected",true);	
							  // alert(ims);
							   loadSelect("appVersion",ims);
						   }else if(index=="appVersion"){
							   $("[name='"+index+"']").find("option[value='"+ims+"']").attr("selected",true);
							//   alert(ims);
						   }
						}
					}
				}
			});
		}
	});
}

	
	
function loadSelect(sonselect,selectname){
	$.each(SelectObj.result.fieldProperties,function(index,object){
	   if(object.path==sonselect){
		  $.each(object.codes,function(i,s){
			  if(i==selectname){
				  $.each(s,function(a,b){
						if(a==""){
							$("[name='"+sonselect+"']").append("<option value=\""+a+"\" selected>"+b+"</option>");
						}else{
							$("[name='"+sonselect+"']").append("<option value=\""+a+"\">"+b+"</option>");
						}
				  });
			  }
		  });
	   }
	});
}	
	
function validate(str){
	//alert(str);
	var strs= str.split("&");
	var mach="";
	$.each(strs,function(index,infs){
		var inf = infs.split("=");
		if(inf[1]==""){
		if(inf[0]=="dept"){
			alert("请选择部门！");
			Mach=2;
			check();
			return false;
		}else if(inf[0]=="deviceNum"){
			alert("请填写设备编号！");
			Mach=2;
			check();
			return false;
		}else if(inf[0]=="macAddress"){
			alert("请填写mac地址！");
			Mach=2;
			check();
			return false;
		}else if(inf[0]=="appType"){
			alert("请选择软件类型！");
			Mach=2;
			check();
			return false;
		}else if(inf[0]=="appName"){
			alert("请选择软件名称！");
			Mach=2;
			check();
			return false;
		}else if(inf[0]=="appVersion"){
			alert("请选择版本号！");
			Mach=2;
			check();
			return false;
		}else if(inf[0]=="authorize"){
			alert("请选择授权情况！");
			Mach=2;
			check();
			return false;
		}else if($("[name=appType]").val()=="oa"&&inf[0]=="appLevel"){
			alert("请选择软件等级！");
			Mach=2;
			check();
			return false;
		   }
		}else if(inf[0]=="macAddress"){
			mach= /[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{2}/;
			if(!mach.test(inf[1])){
				Mach=2;
				alert("mac地址格式错误！\n(格式为1D-ED-56-4R-FG-OP)");
				check();
				return false;
			}
		}else{
			Mach=1;
		}
	  });
	//alert(0);
	
}
function check(){
	if(power=="no"){
		 $("[name='dept']").attr("disabled",true);
		}
	
}	
	
	