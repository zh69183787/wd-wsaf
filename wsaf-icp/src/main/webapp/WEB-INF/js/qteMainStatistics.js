$.getMainStatistics = function(firUrl,mainId){
	if(firurl!=""){
		$.ajax({
			url:firUrl+"/qteComplexInfo/getDeptStatistics/"+mainId,
			async:false,
			dataType :"json",
			type:"post",
			success : function(data){
				if(data.success == true &&JSON.stringify(data.result) != "[]"){
					alert(data.result);
				}
			}
			
		});
	}
}

$.getDeptAllType = function(firUrl){
	var dept = new Array();
	if(firUrl!=""){
		$.ajax({
			url:firUrl+"/ca/getDeptInfo?rootId=2500&type=0",
			async:false,
			dataType :"json",
			type:"post",
			success:function(data){
				$.each(data,function(index,item){
					dept.push(item);
				});
			}
		});
		
		$.ajax({
			url:firUrl+"/ca/getDeptInfo?rootId=2500&type=1",
			async:false,
			dataType :"json",
			type:"post",
			success:function(data){
				$.each(data,function(index,item){
					dept.push(item);
				});
			}
		});
	}
	return dept;
}


$.getHasDept = function(firUrl,mainId){
	var dept = new Array();
	if(firUrl!=""){
		$.ajax({
			url:firUrl+"/qteComplexInfo/getDeptsByMainId/"+mainId,
			async:false,
			dataType :"json",
			type:"post",
			success:function(data){
				$.each(data.result,function(index,item){
					dept.push(item);
				});
			}
		});
	}
	return dept;
}

$.getDeptHeader = function(firUrl,mainId){
	var item = "";
	var dept = $.getDeptAllType(firUrl);
	item += "<tr class=\"item\"><td>序号</td><td>题目</td><td>选项</td><td>值</td>";
	var ansdept = $.getHasDept(firUrl,mainId);
	$.each(ansdept,function(index,indexItem){
		$.each(dept,function(deptIndex,deptItem){
			if(indexItem==deptItem.id){
				item += "<td>"+deptItem.name+"</td>";
				
			}
		})
	});
	
	item += "<td>合计</td></tr>";
	$(".table_").append(item);
	
	
}


$.getQuestion = function(firUrl,mainId){
	var quesId = "";
	var quesItem = "";
	if(firUrl != ""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findMainDetailByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success: function (data) {
				if (data.success == true) {
					$.each(data.result, function (entryIndex, entry) {
							if(entry.quId!=quesId){
								quesItem += "<tr class=\"item\" ><td rowspan=\"4\"><label >"+entry.quesOrders+"</label></td>" +
										"<td rowspan=\"4\" class=\"tit\">"+entry.quContent+"</td>";
								quesItem += $.getOptionByQuid(firUrl,entry.quId,mainId);
								quesId = entry.quId;
							}
					});
				}
				
            },
            error: function () {
                alert("对不起！你的请求出现异常，请联系服务人员！");
            }
		});
	}
	
	$(".table_").append(quesItem);
}

$.getOptionByQuid = function(firUrl,quid,mainId){
	var option = "";
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/qteOption/findByQuesId?quesId="+quid,
			type:"post",
			dataType:"json",
			success :function(data){
				if(data.success==true){
					$.each(data.result,function(index,optionItem){
						option += "<td>"+optionItem.code+"</td><td class=\"num\">"+optionItem.value+"</td>";
						option += $.getNum(firUrl,quid,optionItem.id,mainId);
					});
				}
				
			}
		});
	}
	return option;
}
$.getNum = function(firUrl,quid,opid,mainId){
	var num = "";
	var sum = "";
	if(firUrl!=""){
		var dept = $.getHasDept(firUrl,mainId);
		$.each(dept,function(index,deptItem){
			$.ajax({
				async:false,
				url:firUrl+"/qteUserAnswer/findQteUserAnswers?questId="+quid+"&optionId="+opid+"&deptId="+deptItem,
				type:"post",
				dataType:"json",
				success :function(data){
					if(data.success==true){
						var count = new Array();
						$.each(data.result,function(index,indexItem){
							count.push(indexItem);
						});
						var ansNum = count.length;
						num += "<td>"+count.length+"</td>";
						sum += ansNum;
					}
					
				}
		    });
		});
			
		
	}
	num += "<td>"+sum+"</td></tr>";
	return num;
}
/////////////////////////////////饼图//////////////////////////////////////////
$.getPieStatictis = function(firUrl,mainId){
	var rtn = "";
	var i=0;
	var dept = $.getDeptAllType(firUrl);
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/getPieDataOfDept/"+mainId,
			type:"post",
			dataType:"json",
			success : function(data){
				if(data.success==true){
					rtn += "["
					for (var deptId in data.result)
				    {
						if(i>0){
							rtn += ",";
						}
						var deptName = "";
						$.each(dept,function(index,indexItem){
							if(indexItem.id==deptId){
								deptName=indexItem.name;
							}
						});
				        rtn +="['"+deptName+"',"+data.result[deptId]+"]";
				        i=i+1;
				    }
					rtn += "]"
				}
			}
		});
	}
	if (rtn) {
		var data = eval(rtn);//传来的json字符串需要变成数组
//		alert(data);
		$('#pie').highcharts(
						{
							credits : {
								enabled : false
							},
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false
							},
							title : {
								text : ''
							},
							tooltip : {
								pointFormat : '{series.name}: {point.percentage:.1f}%'
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									dataLabels : {
										enabled : true,
										color : '#000000',
										connectorColor : '#000000',
										format : '{point.name}<br/>({point.y}次) {point.percentage:.1f} %'
									},
									showInLegend : true
								}
							},
							series : [ {
								type : 'pie',
								name : '答题次数份额',
//									data : [
//                                              ['Firefox',   45.0],
//                                              ['IE',       26.8],
//                                              ['Safari',    8.5],
//                                              ['Opera',     6.2],
//                                              ['Others',   0.7]
//                                         ]
							    data : data
							} ],
							legend : {
								layout : 'vertical',
								align : 'right',
								verticalAlign : 'bottom',
								x : -10,
								y : 0,
								borderWidth : 0
							}
						});
	}
}
///////////////////////////////////////////////选项百分比统计///////////////////////////////////
$.getTotalCount = function(firUrl,mainId){
	var quesId = "";
	var count = "";
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/findUserCountByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.success==true){
					count = data.count;
					$("#count").append(count);
				}
			}
		});
	}
}


$.getRadioOption = function(firUrl,mainId){
	var quesId = "";
	var nextquesId = "";
	var radioItem = "";
	var flag =0;
	var order = 0;
	var quc = 0;
	var quesCount = 0;
	var quesCounts = new Array();
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/getQteMainByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.success==true){
					radioItem += "<tr><td colspan=\"9\" class=\"tit\" >单项选择题</td></tr>";
					
					$.each(data.result,function(index,indexItem){
						if(indexItem.quesType=="radio"){
							flag +=1;
							var num = $.getNumByQuidOpId(firUrl,indexItem.quesId,indexItem.opId);
							quesCount += num;
							if(flag==4){
								flag=0;
								quesCounts.push(quesCount);
								quesCount = 0;
							}
						}
					});
					
					
					
					$.each(data.result,function(index,indexItem){
						if(indexItem.quesType=="radio"){
							if(flag==0){
								order +=1;
								radioItem += "<tr><td class=\"num\">"+order+"</td>";
								$.each(quesCounts,function(index,indexItem){
									quc=indexItem;
								});
							}
							flag +=1;
							var num = $.getNumByQuidOpId(firUrl,indexItem.quesId,indexItem.opId);
							var per = parseFloat(num)/parseFloat(quc)*100;
							radioItem += "<td>"+indexItem.value+"</td><td>"+per+"%</td>";
							
							if(flag==4){
								radioItem += "</tr>";
								flag=0;
								quc = 0;
							}
						}
					});
					$(".table_2").append(radioItem);
					
				}
			}
		});
	}
	
}
$.getNumByQuidOpId = function(firUrl,quesId,opId){
	var num = "";
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/basicCrud/qteUserAnswer/all?quesId="+quesId+"&optionId="+opId,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.success==true){
						num = data.result.length;
				}
			}
		});
	}
	return num;
}



$.getMultiChoiceOption = function(firUrl,mainId){
	var quesId = "";
	var nextquesId = "";
	var multiChoiceItem = "";
	var flag =0;
	var order = 0;
	var quc = 0;
	var quesCount = 0;
	var quesCounts = new Array();
	if(firUrl!=""){
		$.ajax({
			async:false,
			url:firUrl+"/qteComplexInfo/getQteMainByMainId/"+mainId,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.success==true){
					multiChoiceItem += "<tr><td colspan=\"9\" class=\"tit\" >多项选择题</td></tr>";
					
					$.each(data.result,function(index,indexItem){
						if(indexItem.quesType=="multiChoice"){
							flag +=1;
							var num = $.getNumByQuidOpId(firUrl,indexItem.quesId,indexItem.opId);
							quesCount += num;
							if(flag==4){
								flag=0;
								quesCounts.push(quesCount);
								quesCount = 0;
							}
						}
					});
					$.each(data.result,function(index,indexItem){
						if(indexItem.quesType=="multiChoice"){
							quesId = indexItem.quesId;
							if(flag==0){
								order +=1;
								multiChoiceItem += "<tr><td class=\"num\">"+order+"</td>";
								$.each(quesCounts,function(index,indexItem){
									quc=indexItem;
								});
							}
							var num = $.getNumByQuidOpId(firUrl,indexItem.quesId,indexItem.opId);
							var per = parseFloat(num)/parseFloat(quc)*100;
							multiChoiceItem += "<td>"+indexItem.value+"</td><td>"+per+"%</td>";
							flag +=1;
							if(flag==4){
								multiChoiceItem += "</tr>";
								flag=0;
							}
						}
					});
					$(".table_2").append(multiChoiceItem);
					
				}
			}
		});
	}
	
}
////////////////////////////////////////
Date.prototype.Format = function(fmt)   { //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  
















