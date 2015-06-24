<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8" />
  <title>网上测评</title>
  <link rel="stylesheet" href="../css/formalize.css" />
  <link rel="stylesheet" href="../css/page.css" />
  <link rel="stylesheet" href="../css/default/imgs.css" />
  <link rel="stylesheet" href="../css/reset.css" />
  <link type="text/css" href="../css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
  <!--[if IE 6.0]>
         <script src="js/iepng.js" type="text/javascript"></script>
         <script type="text/javascript">
              EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
         </script>
     <![endif]-->
  <script src="../js/html5.js"></script>
  <script src="../js/jquery-1.7.1.min.js"></script>
  <script src="../js/jquery-ui-1.8.18.custom.min.js"></script>
  <script src="../js/jquery.formalize.js"></script>
  <script type="text/javascript">
		var answer_id = "";
		var handlerLoginname = "";
		var paramId="<%=request.getParameter("id")%>";
		//var questionCpqId=paramId;
		var questionCpqId="38";
		function getData(){
			$.post(
					"../basicCrud/cpqAnswer/all?userLoginname="+handlerLoginname+"&cpqId="  +paramId,
					function (rtn){
// 						alert(JSON.stringify(rtn));
						var content = rtn["result"];

						if(content.length != 1){
							return; 
						}else{
							var a = content[0]["answer"];
							if(content[0]["submited"] == "1"){
								$("#btns").hide();
							}
							answer_id = content[0]["id"];
							a =  $.parseJSON(a);
							for(var i in a){
								var b = a[i];
								for(var j in b){
									$("#"+i+"_"+j+"_" + b[j]).click();
								}
							}
						}
					}
			);

			
		};
		
  
      $(document).ready(function () {
      
      
      $.ajax( {
			async:false,
			url : "../ca/getCookies",
			type : 'post',
			dataType : 'json',
			success : function(data) {
				handlerLoginname = data.loginName;
				//$("#deptName").val(data.deptName);
			},
			error : function() {
				alert("接口调用异常,请联系管理员");
			}
		});
      
          var $tbInfo = $(".filter .query input:text");
          $tbInfo.each(function () {
              $(this).focus(function () {
                  $(this).attr("placeholder", "");
              });
          });
          
          var $tblAlterRow = $(".table_1 tbody tr:even");
          if ($tblAlterRow.length > 0)
              $tblAlterRow.css("background","#fafafa");			
              
              $("#outter").css("overflowX","auto");
              var w = $(window).width();
              if(w>1000){
                  $("#outter").width($(window).width());
              }else{
                  $("#outter").width(1000);
              }
              
              
              
              /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/ 
						   $.ajax({
								  async: false,
								    url : "../basicCrud/cpqQuestion/all?cpqId="  +questionCpqId,
									type : 'post',
									success: function(data) {
										   $.analyzeTableData(data);
										   
							           }, 
							           error: function() {
							              alert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
							           }
									});
							 $("#btnSubmit1").click(function(){
								 	if($(":radio:checked").length!=$(":radio").length/4){
								 		alert("请对所有项测评后再提交，否则请点保存");
								 		return;
								 	}
								  var otherData="";
								  var id = "";
								  var id2 = "";
				             		otherData+="&cpqId="+paramId;
				             	 	$.ajax({
										url :  "../basicCrud/cpqWorkflow/all",
										type : 'post',
										async : false,
										data:"status=tmbk&cpqId="+paramId+"&handlerLoginname="+handlerLoginname,
										success : function(data2) {
										//alert(JSON.stringify(data2.result[0]));
											otherData+="&userLoginname="+data2.result[0].handlerLoginname+"&answerTime="+new Date().getTime()+"&submited=1";
											if(answer_id != ""){
												otherData += ("&id=" + answer_id);

											}
											id = data2.result[0].id;
										}
									});  
									//alert(otherData);
				          	   $.postsave("../basicCrud/cpqAnswer/save","form_1",otherData,"");
				          	   $.postsave("../basicCrud/cpqWorkflow/save","","id="+id+"&handleTime="+new Date().getTime(),"");
						}); 
							 $("#btnSubmit2").click(function(){
								 var id2 = "";
								  var otherData="";
				             		   otherData+="&cpqId="+$("#cpqId").val();
				             	 	$.ajax({
										url :  "../basicCrud/cpqWorkflow/all",
										type : 'post',
										async : false,
										data:"status=tmbk&cpqId="+paramId+"&handlerLoginname="+handlerLoginname,
										success : function(data) {
										//alert("status=tmbk&cpqId="+paramId+"&handlerLoginname="+handlerLoginname);
											otherData+="&userLoginname="+data.result[0].handlerLoginname+"&answerTime="+new Date().getTime()+"&submited=0";
											
											if(answer_id != ""){
												otherData += ("&id=" + answer_id);

											}
										}
									});  
								//alert(otherData);
									
				          	   $.postsave("../basicCrud/cpqAnswer/save","form_1",otherData,"");
						}); 
		
      });
  

			$.analyzeTableData = function(data) {
				if (data != null) {
					if (data.success == true && data.result
							&& JSON.stringify(data.result) != "[]") {
						var itemType = "";
						var arr = new Array();
						tableItem = "<tr class=\"tit\">";
						tableItem += "<td class=\" t_c\">类别</td>";
						tableItem += "<td class=\" t_c\">考评项目</td>";
						tableItem += "<td class=\" t_c\" width=\"15%\">考评标准</td>";
						tableItem += "  <td class=\" t_c\">测评等级</td>";
						//tableItem += " <input type=\"hidden\" value=\""+data.result.content[0].cpqId+"\" id=\"cpqId\">";
						tableItem += " <input type=\"hidden\" value=\""+paramId+"\" id=\"cpqId\">";
//						$.ajax({
//							url :  "../basicCrud/cpqAnswer/all?cpqId="+paramId+"&userLoginname="+userLoginname,
//							type : 'post',
//							async : false,
//							success : function(data) {
//								otherData+="&userLoginname="+data.result[0].handlerLoginname+"&answerTime="+new Date().getTime()+"&submited=1";
//								id = data.result[0].id;
//							}
//						});  
//						tableItem += " <input type=\"hidden\" value=\""+data.result[0].id+"\" id=\"answerId\">";
						$.ajax({
									async : false,
									url : "../basicCrud/cpqMain/getEntityProperty?fieldFilter=beTestDept&isNeeded=true",
									type : 'post',
									success : function(data) {
										var json = data.result.fieldProperties[0].option;
										$
												.ajax({
													async : false,
													url : "../basicCrud/cpqMain/get/"+paramId,
													type : 'post',
													success : function(data1) {
														var json1 = data1.result.beTestDept;
														var str = JSON
																.stringify(json1);
														arr = str.split(",");
														arr[0] = arr[0].substr(
																1, 4);
														arr[arr.length - 1] = arr[arr.length - 1]
																.substr(0, 4);
														for (var i = 0; i < arr.length; i++) {
															tableItem += " <td class=\" t_c\">"
																	+ json[arr[i]]
																	+ "</td>";
														}
													},
													error : function() {
														alert(
																"对不起！你的请求出现异常，请联系服务人员！",
																"重要提示");
													}
												});
									},
									error : function() {
										alert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
									}
								});
						tableItem += "</tr>";
						$(".table_1").append(tableItem);
						var arr1 = new Array();
						$.each(data.result,
								function(entryIndex, entry) {
									arr1[entryIndex] = entry.itemType;
								});
						$
								.each(
										data.result,
										function(entryIndex, entry) {
											if (itemType != entry.itemType) {
												var j = 0;
												itemType = entry.itemType;
												for (var i = 0; i < arr1.length; i++) {
													if (arr1[i] == itemType) {
														j += 1;
													}
												}
												tableItem = "<tr>";
												tableItem += "<td rowspan=\""+j*4+"\" class=\"t_c ht\">"
														+ entry.itemType
														+ "</td>";
												tableItem += "<td rowspan=\"4\" class=\"ys t_c\">"
														+ entry.item + "</td>";
												tableItem += "  <td rowspan=\"4\" class=\"ys t_c\">"
														+ entry.standard
														+ "</td>";
												tableItem += "  <td>优</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+10+"\" id=\""+entry.id+"_"+arr[i]+"_10"+"\"></td>";
												tableItem += "</tr> <tr><td>良</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+8+"\" id=\""+entry.id+"_"+arr[i]+"_8"+"\"></td>";
												tableItem += " </tr>  <tr><td>一般</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+6+"\" id=\""+entry.id+"_"+arr[i]+"_6"+"\"></td>";
												tableItem += " </tr> <tr><td>差</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+3+"\" id=\""+entry.id+"_"+arr[i]+"_3"+"\"></td>";
												tableItem += " </tr> ";
											} else {
												tableItem = "<tr>";
												tableItem += "<td rowspan=\"4\" class=\"ys t_c\">"
														+ entry.item + "</td>";
												tableItem += " <td rowspan=\"4\" class=\"ys t_c\">"
														+ entry.standard
														+ "</td>";
												tableItem += "<td>优</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += "<td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+10+"\" id=\""+entry.id+"_"+arr[i] +"_10" +"\"></td>";
												tableItem += "</tr> <tr><td>良</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+8+"\" id=\""+entry.id+"_"+arr[i]+"_8"+"\"></td>";
												tableItem += "</tr> <tr><td>一般</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+6+"\" id=\""+entry.id+"_"+arr[i]+"_6"+"\"></td>";
												tableItem += "</tr> <tr><td>差</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><input type=\"radio\" name=\""+entry.id+"."+arr[i]+"\" value=\""+3+"\" id=\""+entry.id+"_"+arr[i]+"_3"+"\"></td>";
												tableItem += "</tr>";
											}
											$(".table_1").append(tableItem);
										});

					} else {
						for (var i = 0; i <= 16; i++) {
							$(".table_1")
									.append(
											"<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
						}
					}
					
				}
				getData();
				
				
			}
			$.postsave = function(Url, formName, otherData, toUrl) {
				var _data = "";
				if (formName != "") {
					var arr3 = $("#" + formName).serialize().split("&");
					var answer = "";
					var answers = {};
					for (var i = 0; i < arr3.length; i++) {
						var a = arr3[i].split(".");
						var b = a[1].split("=");
						if (typeof answers[a[0]] == "undefined") {
							answers[a[0]] = {};
						}
						answers[a[0]][b[0]] = b[1];
					}
					answer = JSON.stringify(answers);
					 _data = "answer=" + answer;
				}
				_data += otherData;
				if (Url != ""&&_data!="") {
					$.ajax({
						url : Url,
						type : 'post',
						async : false,
						data : _data,
						success : function(data, status, xhr) {
						//alert(JSON.stringify(data));
							if (status == "success" && data != null) {
								if (data.success == true) {
									if(Url=="../basicCrud/cpqAnswer/save"){
										answer_id=data.result.id;
										//alert(answer_id);
										alert("保存成功");
									}
								
// 									if (toUrl != "")
// 										location.href = Url + toUrl;

								} else {
									alert("修改失败");
								}
							} else {
								alert("修改失败");
							}
						}
					});
				}
			}
		</script>
  <style>
.table_1 .tit td {
	padding: 0 5px;
}
</style>
  </head>

  <body>
  <div class="main"> 
    <!--Ctrl-->
    <div class="ctrl clearfix nwarp">
      <div class="fl"><img src="../css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
      <div class="posi fl nwarp">
        <ul>
          <li><a href="#">首页</a></li>
          <li><a href="#">网上测评</a></li>
          <li class="fin">问卷填报</li>
        </ul>
      </div>
      <div class="fr lit_nav nwarp">
        <ul>
          <li class="selected"><a class="print" href="#">打印</a></li>
          <li><a class="express" href="#">导出数据</a></li>
          <li class="selected"><a class="table" href="#">表格模式</a></li>
          <li><a class="treeOpen" href="#">打开树</a></li>
          <li><a class="filterClose" href="#">关闭过滤</a></li>
        </ul>
      </div>
    </div>
    <!--Ctrl End-->
    <div class="pt45"> 
      <!--Filter-->
      <div class="filter">
        <div class="fn clearfix">
          <h5>满意度测评</h5>
        </div>
      </div>
      <!--Filter End--> 
      <!--Table-->
      <div class="mb10" id="outter">
      <form id="form_1">
        <table width="100%"  class="table_1">
          <tbody>
          </tbody>
          <tr class="tfoot" id="btns">
            <td colspan="20" class="t_c"><input type="button" id="btnSubmit1" value="保存并提交" class="m6"><input type="button"  id="btnSubmit2" value="保存" class="m6">
            <input name="" type="reset" class="m6"></td>
          </tr>
        </table>
        </form>
      </div>
      <!--Table End--> 
    </div>
  </div>
</body>
</html>
