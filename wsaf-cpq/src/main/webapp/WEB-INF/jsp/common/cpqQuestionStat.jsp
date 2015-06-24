<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8" />
  <title>网上测评统计</title>
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
		var paramId="<%=request.getParameter("id")%>";
		function getData(){
			var total = {};
			$.post(
					"../basicCrud/cpqAnswer/all?submited=1&cpqId="+paramId,
					function (rtn){
// 						alert(JSON.stringify(rtn));
						var result = rtn["result"];

						if(rtn["success"] != true || result.length == 0){
							return;
						}else{
							for(var entry in result){
								var a = result[entry]["answer"];
								a =  $.parseJSON(a);
								
								for(var i in a){
									var b = a[i];
									for(var j in b){
										var p = $("#"+i+"_"+j+"_" + b[j]);
										var val = parseInt(p.html()) + parseInt(b[j]);
										if(typeof total[j] == "undefined"){
											total[j] = 0;
										}
										total[j] += val;
										p.html(val);
									}
								}
							}
							
							var tfoot = $("tr.thead").clone(true).removeClass("tit");
							tfoot.find("td").each(function (i){
								var $this = $(this);
								$this.removeClass("t_c").html(i== 3?"合计":"");
								if(i > 3){
									$this.html(0);
									var clz = $this.attr("class");
									$("#table1 div[id*=_"+clz+"_]").each(function (){
										$this.html(parseInt($this.html()) + parseInt($(this).html()) );
									});
								}
								$this.addClass("t_c");
							});
							$("#table1").append(tfoot);

	
						}
					}
			);

			
		};
		
  
      $(document).ready(function () {
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
								    url : "../basicCrud/cpqQuestion/page",
									type : 'post',
									success: function(data) {
										   $.analyzeTableData(data);
										   
							           }, 
							           error: function() {
							              alert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
							           }
									});
							 $("#btnSubmit1").click(function(){
								  var otherData="";
								  var id = "";
								  var id2 = "";
				             		   otherData+="&cpqId="+$("#cpqId").val();
				             	 	$.ajax({
										url :  "../basicCrud/cpqWorkflow/page",
										type : 'post',
										async : false,
										data:"cpqId="+$("#cpqId").val(),
										success : function(data2) {
											otherData+="&userLoginname="+data2.result.content[0].handlerLoginname+"&answerTime="+new Date().getTime()+"&submited=1";
											if(answer_id != ""){
												otherData += ("&id=" + answer_id);

											}
											id = data2.result.content[0].id;
										}
									});  
				          	   $.postsave("../basicCrud/cpqAnswer/save","form_1",otherData,"");
				          	   $.postsave("../basicCrud/cpqWorkflow/save","","id="+id+"&handleTime="+new Date().getTime(),"");
						}); 
							 $("#btnSubmit2").click(function(){
								 var id2 = "";
								  var otherData="";
				             		   otherData+="&cpqId="+$("#cpqId").val();
				             	 	$.ajax({
										url :  "../basicCrud/cpqWorkflow/page",
										type : 'post',
										async : false,
										data:"cpqId="+$("#cpqId").val(),
										success : function(data) {
											otherData+="&userLoginname="+data.result.handlerLoginname+"&answerTime="+new Date().getTime();
											if(answer_id != ""){
												otherData += ("&id=" + answer_id);

											}
										}
									});  
				          	   $.postsave("../basicCrud/cpqAnswer/save","form_1",otherData,"");
						}); 
		
      });
  

			$.analyzeTableData = function(data) {
				if (data != null) {
					if (data.success == true && data.result.content
							&& JSON.stringify(data.result.content) != "[]") {
						var itemType = "";
						var arr = new Array();
						tableItem = "<tr class='tit thead'>";
						tableItem += "<td class=\" t_c\">类别</td>";
						tableItem += "<td class=\" t_c\">考评项目</td>";
						tableItem += "<td class=\" t_c\" width=\"15%\">考评标准</td>";
						tableItem += "  <td class=\" t_c\">选项</td>";
						tableItem += " <input type=\"hidden\" value=\""+data.result.content[0].cpqId+"\" id=\"cpqId\">";
						$.ajax({
							url :  "../basicCrud/cpqAnswer/get/"+$("#cpqId").val(),
							type : 'post',
							async : false,
							success : function(data) {
								otherData+="&userLoginname="+data.result.handlerLoginname+"&answerTime="+new Date().getTime()+"&submited=1";
								id = data.result.id;
							}
						});  
						tableItem += " <input type=\"hidden\" value=\""+data.result.content[0].id+"\" id=\"answerId\">";
						$
								.ajax({
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
														var str = JSON.stringify(json1);
														arr = str.split(",");
														arr[0] = arr[0].substr(
																1, 4);
														arr[arr.length - 1] = arr[arr.length - 1].substr(0, 4);
														
														for (var i = 0; i < arr.length; i++) {
															tableItem += " <td class='t_c " + arr[i] + "'>"
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
						$.each(data.result.content,
								function(entryIndex, entry) {
									arr1[entryIndex] = entry.itemType;
								});
						$
								.each(
										data.result.content,
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
												tableItem += "  <td>A 优(10)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_10"+"\">0</div></td>";
												tableItem += "</tr> <tr><td>B 良(8)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_8"+"\">0</div></td>";
												tableItem += " </tr>  <tr><td>C 中(6)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_6"+"\">0</div></td>";
												tableItem += " </tr> <tr><td>D 差(3)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_3"+"\">0</div></td>";
												tableItem += " </tr> ";
											} else {
												tableItem = "<tr>";
												tableItem += "<td rowspan=\"4\" class=\"ys t_c\">"
														+ entry.item + "</td>";
												tableItem += " <td rowspan=\"4\" class=\"ys t_c\">"
														+ entry.standard
														+ "</td>";
												tableItem += "<td>A 优(10)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += "<td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_10"+"\">0</div></td>";
												tableItem += "</tr> <tr><td>B 良(8)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_8"+"\">0</div></td>";
												tableItem += "</tr> <tr><td>C 中(6)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_6"+"\">0</div></td>";
												tableItem += "</tr> <tr><td>D 差(3)</td>";
												for (var i = 0; i < arr.length; i++)
													tableItem += " <td class=\"t_c\"><div id=\""+entry.id+"_"+arr[i]+"_3"+"\">0</div></td>";
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
							if (status == "success" && data != null) {
								if (data.success == true) {
									if(Url=="../basicCrud/cpqAnswer/save"){
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
          <li class="fin">统计数据</li>
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
        <table width="100%"  class="table_1" id="table1">
          <tbody>
          </tbody>
	
        </table>
        </form>
      </div>
      <!--Table End--> 
    </div>
  </div>
</body>
</html>
