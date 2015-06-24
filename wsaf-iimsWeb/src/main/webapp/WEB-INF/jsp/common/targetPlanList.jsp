<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    <title class="page_title">计划版本</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="X-UA-Compatible" content="IE=8" />
	
    <link rel="stylesheet" href="css/formalize.css" />
    <link rel="stylesheet" href="css/page.css" />
    <link rel="stylesheet" href="css/default/imgs.css" />
    <link rel="stylesheet" href="css/reset.css" />
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	
	<script src="js/html5.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.formalize.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/wirelessAccounting.js"></script>
	<script src="js/jquery.uploadify-3.1.js"></script>
	<script src="js/wd.public.page.js"></script>
    <script type="text/javascript">
    var webpath = "${pageContext.request.contextPath}";
		 $(document).ready(function () {
			 $.setPage(null,"searchbtn");
			 
			 $.showObjectOption();
			 var _page=$(".selected a").text();
//        	$.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
//        	window.onfocus = function(){
//        		var _page="1";
//        		if($(".selected a").length>0&&$(".selected a").text()!="")
//        			_page=$(".selected a").text();
//        		
//              $.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
//          	 };
//        	$("#searchbtn").click(function(){ 		
//				$.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
//			});
        	  
//        	$("#renewbtn").click(function(){ 
//				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
//				$.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
//			});
			
        	}); 	
        	

		function add(firUrl){
			window.open("/iims/wirelessResourceBook/wirelessNetAdd");
		}
		 $(document).ready(function () {
			$("#renewbtn").click(function(){ 
				$("#year").val("");
				 $.showObjectOption(null);
			});
		}); 
		function close(){
			var b = document.getElementById("iframe_gx");
			 b.style.display="none";
			}
			function open2(id){
				var a = document.getElementById("iframe_gx");
				a.style.display="";
				$.findById("${pageContext.request.contextPath}",id);
				}
			function del(id){
				$.delById("${pageContext.request.contextPath}",id);
				}
			function save(id){
				var otherData="&status=finish";
           		 
           		
           		 otherData+="&id="+id;
           		 
           		 alert(id);
				$.postsave("${pageContext.request.contextPath}","targetPlan",otherData);
			}
      
      	//查询年份
       function sercah(){
         $.showObjectOption(null);
       }
       //删除
			$.delById = function(firUrl,id){
		if(firUrl!="")
		   {	
				 $.ajax({
					    url : firUrl+"/basicCrud/targetVersion/del/"+id,
						type : 'post',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true) 
								{
									alert("删除成功");
									location.reload(true);
								}
							}
							
							}
						});
		   }	
	};
		
		
		
		$.showObjectOption = function(_page) {
			$.ajaxPage(webpath,"/basicCrud/targetVersion/page","&sort=id desc","searchform");
		/* $.ajax({
		      
					type : 'POST',
					url : "${pageContext.request.contextPath}/basicCrud/targetVersion/page?pageSize=18&pageNum="+_page,
					data : $("#searchform").serialize(),
					dataType : 'json',
					cache : false,
					error : function() {
						alert('系统连接失败，请稍后再试4！');
					},
					success : function(obj) {
						if (obj.success) {
							loadinformation(obj);
							
							//alert($("#s_groupCode").val()=="");
							changepage();
							$.setBtn();
						}
					}
				}); */
	}
		
		 $.analyzeTableData= function(data, status, xhr,firUrl,isPreliminaryPersonnel)
	       	{
			 loadinformation(data);
	           }	
		//查询代码
		function loadinformation(obj){
					var tableteam="";
				if(obj.success==true &&JSON.stringify(obj.result.content)!="[]"){
					
					
					$.each(obj.result.content,function(Index, target){
						var id="",year="",targetName="",orgCompany="",orgPeople="",targetState="",versionId="";
						
						if(target.id=="" || target.id==null){
							id="";
						}else{
							id= target.id;
						}
						if(target.year==""||target.year==null){
							year="";
						}else{
							year = target.year;
						}
						if(target.targetName==""||target.targetName==null){
							targetName="";
						}else{
							targetName = target.targetName;
						}
						
						if(target.orgCompany ==""||target.orgCompany==null){
							orgCompany="";
						}else{
							orgCompany = target.orgCompany;
						}
						
						if(target.orgPeople ==""||target.orgPeople==null){
							orgPeople="";
						}else{
							orgPeople =target.orgPeople;
						}
						
						if(target.targetState ==""||target.targetState==null){
							targetState="";
						}else{
							targetState =target.targetState;
						}
						if(target.versionId ==""||target.versionId==null){
							versionId="";
						}else{
							versionId =target.versionId/10;
						}
					//	if(target.versionId ==""||target.versionId==null){
					//		targetState=""
					//	}else{
					//		targetState =target.targetState;
					//	}
						if(targetState=="initial"){
							targetState ="初始状态";	
						}else if(targetState =="modify"){
							targetState="修改状态";
						}else if(targetState =="final"){
							targetState="最终状态";
						}else if(targetState =="waitfill"){
							targetState="待导入";
						}
						tableteam+= "<tr class=\"tableItem\"><td>"+id+"</td><td>"+year+"</td><td>"+targetName+"</td><td>"+orgCompany+"</td><td>"+orgPeople+"</td><td>"+targetState+"</td><td>"+versionId+"</td><td>";
					switch (target.targetState) {
					case "waitfill":
						tableteam +="";
						break;
					//初始版本,操作显示详情和删除
					case "initial":
						tableteam +="<a href=\"projectPlanTarget/projectPlanTargetList?id="+id+"\" style=\"display:inline\">详情</a>&nbsp;&nbsp;&nbsp;<a  class='histroy_hid' href=\"javascript:del("+target.id+");\" onclick=\"return confirm('确定将此记录删除?')\" style=\"display:inline\">删除</a>&nbsp;&nbsp;&nbsp;";
						break;
					//修改版本,操作显示修改发布和详情
					case "modify":
						tableteam +="<a href=\"projectPlanTarget/projectPlanTargetList?id="+id+"\" style=\"display:inline\">详情</a>&nbsp;&nbsp;&nbsp;<a  class='histroy_hid' href=\"javascript:Release("+target.id+")\" style=\"display:inline\">发布</a>&nbsp;&nbsp;&nbsp;";
						break;
					case "final":
						tableteam +="<a href=\"projectPlanTarget/projectPlanTargetList?id="+id+"\"  style=\"display:inline\">详情</a>&nbsp;&nbsp;&nbsp;<a  class='histroy_hid' href=\"javascript:del("+target.id+");\" onclick=\"return confirm('确定将此记录删除?')\" style=\"display:inline\">删除</a>&nbsp;&nbsp;&nbsp;";
						break;	
					default:
						break;
					}
					tableteam+="<a class='histroy_hid' href=\"javascript:sinputData("+target.id+");\" style=\"display:inline\">导入</a>&nbsp;&nbsp;&nbsp;";
					tableteam+="<a class='histroy_hid' href=\"javascript:histroySelect("+target.id+",'"+target.groupCode+"');\" style=\"display:inline\">历史版本</a></td></tr>";
					});	
				}
						//$("#table1 tbody").empty();$("#dr_div").fadeIn();
						//alert(tableteam);
								$("#table1_tbody").html(tableteam); 
		}
		
		function histroySelect(id,gcode){
			$("#s_showCode").val("");
			$("#s_groupCode").val(gcode);
			sercah();
			//$(".histroy_hid").hide();
		}
		
		function changepage(){
			if($("#s_groupCode").val()!=""){
				$(".histroy_hid").hide();
				$(".histroy_show").show();
				$(".page_title").html("项目计划历史版本");
			}else{
				$(".histroy_hid").show();
				$(".histroy_show").hide();
				$(".page_title").html("项目计划");
			}
			
		}
		function backSearch(){
			$("#s_showCode").val("1");
			$("#s_groupCode").val("");
			sercah();
		}
		
		function sinputData(id){
			$("#dr_div").fadeIn();
			$("#sinputdataVID").val(id);
			uploadifySet();
			//var url =  'basicCrud2/projectPlanTarget/importExcelPlan?type=planTarget_title&versionId='+id;
			//$('#uploadify').uploadifySettings('uploader',url);
			
		}
	</script>
	
	<script type="text/javascript">
		        	
	
	$.findById = function(firUrl,id){
		 if(firUrl!="")
		   {	
				 $.ajax({
					   async: false,
					    url : firUrl+"/basicCrud/targetVersion/get/"+id,
						type : 'post',
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]") 
								{
										var target=data.result;
								
							var table2Item="";
						if(target.id=="" || target.id==null){
							id=""
						}else{
							id= target.id;
						}
						if(target.year==""||target.year==null){
							year=""
						}else{
							year = target.year;
						}
						if(target.targetName==""||target.targetName==null){
							targetName=""
						}else{
							targetName = target.targetName;
						}
						
						if(target.orgCompany ==""||target.orgCompany==null){
							orgCompany="";
						}else{
							orgCompany = target.orgCompany;
						}
						if(target.orgPeople ==""||target.orgPeople==null){
							orgPeople=""
						}else{
							orgPeople =target.orgPeople;
						}
						if(target.targetState ==""||target.targetState==null){
							targetState=""
						}else{
							targetState =target.targetState;
						}
				       				
				       				$("#tb2").html("");
				       				table2Item+= "<tr><td class='lableTd t_r'>序号</td><td><input name='id' type='text' class='input_large' value='"+target.id+"'/></td></tr>";
				       				table2Item+= "<tr><td class='lableTd t_r'>年度</td><td><input name='year' type='text' class='input_large' value='"+target.year+"'/></td></tr>";
				       				table2Item+= "<tr><td class='lableTd t_r'>计划名称</td><td><input name='targetName' type='text' class='input_large' value='"+target.targetName+"'/></td></tr>";
				       				table2Item+= "<tr><td class='lableTd t_r'>编制单位</td><td><input name='orgCompany' type='text' class='input_large' value='"+target.orgCompany+"'/></td></tr>";
				       				table2Item+= "<tr><td class='lableTd t_r'>编制人</td><td><input name='orgPeople' type='text' class='input_large' value='"+target.orgPeople+"'/></td></tr>";
				       				table2Item+= "<tr><td class='lableTd t_r'>版本状态</td><td><input name='targetState' type='text' class='input_large' value='"+target.targetState+"'/></td></tr>";
				       				$("#tb2").append(table2Item);
				       			
				       				
				       				$("#div1").html("");
				       				tableItem="<input type='submit' value='保 存' onclick='javascript:save("+target.id+");'/>";
				     			
								}
							}
						}
					});
		   		};
		   		}
        	
        	
        	function open(id){
				var a = document.getElementById("iframe_xx");
				a.style.display="";
				$.findById("${pageContext.request.contextPath}",id);
				}
			function open2(id){
				var a = document.getElementById("iframe_gx");
				a.style.display="";
				$.findById("${pageContext.request.contextPath}",id);
				}
			function save(id){
				var otherData="&status=finish";
           		 otherData+="&id="+id;
           		 alert(id);
           		 
				$.postsave("${pageContext.request.contextPath}","targetPlan",otherData);

				}
		$.postsave = function(Url,formName,otherData){
		
		var _data=$("#"+formName).serialize();
//        return false;
		if(Url!="")
		   {		
				
				 $.ajax({
					    url : Url+"/basicCrud/targetVersion/save",
						type : 'post',
						data:_data+otherData,
						success: function(data, status, xhr) {
							if (status == "success" && data != null)
							{
								if  (data.success == true) 
								{
								
									window.close();
									location.href = Url+"/targetVersion/targetPlanList";
									
								}
								else
								{
								alert("修改失败");
								}
							}
							else
								{
								alert("修改失败");
								}
							
							},
							dataType : 'json'
						});
		   }	
		
	};	
			
					
		
	function close(){
		 $("#dr_div").fadeOut();
		}

	    	function setVersionId(versionId){
	    		}
	    	        
	        
	  function uploadifySet(){
	  		$("#uploadify").uploadify({
	  			   'auto' : false,
	  		       'method' : "post",
	  		       'height' : 20,
	  		       'width' : 100,
	  		       'swf' : 'js/uploadify.swf', 
	  		       'uploader' : '<%=basePath%>basicCrud2/projectPlanTarget/importExcelPlan?type=planTarget_title&versionId='+$("#sinputdataVID").val(),
	  		     'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',		//描述
	  		       'fileTypeExts' : '*.xls;*.xlsx;',			//文件类型
	  		       'fileSizeLimit' : '30000KB',			//文件大小
	  		       'buttonText' : '选择文件',			//按钮名称
	  		       'fileObjName'	:'uploadify',
	  		       'multi' :false,
	  		       'successTimeout' : 5,
	  		       'requeueErrors' : false,
	  		       'removeTimeout' : 1,
	  		       'removeCompleted' : true,
	  	       'onSelectError' : function(file,errorCode,errorMsg) {
	  	       		if(errorCode==-110){
	  	       			this.queueData.errorMsg = "文件太大，无法上传！";
	  	       		}
	  	        }, 
	  	       'onUploadSuccess' : function(file, data, response){
	  	    	   var attach = jQuery.parseJSON(data);
	  	       		$("#fileTable").show();
	  	       		var addHtml = "<a href='<%=basePath%>/attach/downloadAttach.action?attachId="+attach.id+"'>"+attach.filename+"."+attach.fileextname+"</a>";				
	  	       		$("#showTR").show();
	  	       		$("#showId").html(addHtml);
	  	       		$.showObjectOption();
	  	       		if (confirm("上传成功！是否继续上传?")){
	  	       		  
	  	       		}else{
	  	       		    close();
	  	       		}
	  	    	}
	  		});
	  	}
	  
	  
	  
	  function saveFirst(){
		    //alert($("#form_xz").serialize());
			 $.ajax({
				    url :"${pageContext.request.contextPath}/targetVersion/saveFirst",
					type : 'post',
					data:$("#form_xz").serialize(),
					success: function(data, status, xhr) {
						if (status == "success" && data != null)
						{
							if  (data.success == true) 
							{
								 $("#iframe_xz").fadeOut();
								 sercah();
								//location.href = Url+"/targetVersion/targetPlanList";
								
							}
							else
							{
							alert("保存失败");
							}
						}
						else
							{
							alert("保存失败");
							}
						
						},
						dataType : 'json'
					});
		  
	  }
	  
		function Release(id) {
			$.ajax({
			      
						type : 'POST',
						url : "${pageContext.request.contextPath}/targetVersion/targetVersion/Release?id="+id,
						data : $("#searchform").serialize(),
						dataType : 'json',
						cache : false,
						error : function() {
							alert('系统连接失败，请稍后再试4！');
						},
						success : function(obj) {
							if (obj.success) {
								loadinformation(obj);
								changepage();
								$.setBtn();
							}
						}
					});
		}
	  
	  function closeIframe(){
		  $("#iframe_xz").fadeOut();
	  }
	  
	  
	  function openIframe(){
		  $("#iframe_xz").fadeIn();
	  }
	  
	  
	</script>
  
</head>

<body class="Flow">
<input type="hidden" id="sinputdataVID" value="" />


<div id="iframe_xz" class="f_window"
		style="width:690px; display:none;   margin:10% 0% 0 25%;">

		<div class="con">
		<form id="form_xz">
			<table id="table_5" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="table_2">

				<thead>

					<th colspan="4">

						<h5 class="fl">版本新增</h5> <a 
						 	class="fr pt5 mr5" href="javascript:closeIframe();">关闭</a> </th>

				</thead>
				<tbody>
                <tr><td class="lableTd t_r"><span class="red">*</span>编制人</td>
                <td class="td_l"  style="height:20px;">
               <input type="text" name="orgPeople" class="input_large">
                </td>
                <td class="lableTd t_r">年份</td>
                <td><input maxlength="30" type="text" name="year" class="input_large" /></td>
                </tr>
                
                <tr>
                <td class="lableTd t_r">编制单位</td>
                <td><input  type="text" name="orgCompany" class="input_large"></td>
                <td class="lableTd t_r"><span class="red">*</span>计划名称</td>
                <td class="td_l"  style="height:20px;">
                <input type="text" name="targetName" class="input_large"/>
                     <input type="hidden" name="versionId" class="input_large" value="0" />
                </td>
                </tr>
                
         
             
				</tbody>
                <tfoot>
                <tr><td colspan="4" class=" t_c"><input type="button"  id="newbtn" onclick="saveFirst();" value="保 存" />&nbsp;&nbsp;&nbsp;<input type="button"  id=closebtn" onclick="closeIframe();" value="关 闭" /></td></tr>
                </tfoot>
			</table>


		</div>
		
		</form>
		
		<div class="button t_c"></div>

	</div>



	<div class="main">
	
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>项目进度管理</a></li>
                	  <li class="fin page_title">目标计划</li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
		
         
                    <div class="tabs_2">
                        <ul>
                            <li><a><span class="page_title">目标计划</span></a></li>
                            <!--
                            <li><a href="/iims/netResourceBook/netAccounting"><span>网络接入台帐</span></a></li>
                            <li><a href="/iims/accountResourceBook/accountAccounting"><span>系统账户台帐</span></a></li>
                            <li><a href="/iims/vpnResourceBook/vpnAccounting"><span>VPN台帐</span></a></li>
                            <li><a href="/iims/internetResourceBook/internetAccounting"><span>特定互联网台帐</span></a></li>
                            <li><a href="/iims/virtualResourceBook/virtualAccounting"><span>虚拟化资源台帐</span></a></li>
                              -->
                            
                        </ul>
        			</div>
                
          
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="searchform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr class="histroy_hid">
                    	<td class="t_r">年度</td>
                      	<td><input  type="text" class="input_large" id="year" name="year"/>
                      	<input  type="text"style="display:none"  class="input_large" id="s_showCode" name="showCode" value="1"/>
                      		<input style="display:none"  type="text" class="input_large" id="s_groupCode" name="groupCode" value=""/>
                      	</td>
                      	
                       <td><input type="button"   id="searchbtn" onclick="sercah();"  value="搜 索" />&nbsp;<input type="button" onclick="" id="renewbtn" value="重 置" /></td>
                     
                    </tr>
                    </table>
                </form>
            </div>
        </div>
         
        <div class="fn clearfix">
        	 <h5 class="fl"><a class="fl page_title">目标计划</a><a class="fl">申报表</a></h5>
           <!--xinxi-->
             <input type="button" id="addBtn" value="新 增" onclick="javascript:openIframe();" class="fr histroy_hid" style="margin:0 15px">   &nbsp;
             <input type="button"  value="后退" onclick="javascript:backSearch();" class="fr histroy_show" style="margin:0 15px;dispaly:none;">   &nbsp;
             
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1" id="table1">
        	<thead>
        	 <tr class="tit">
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">年度</span></a></td>
                       <td class="sort"><a ><span class="fl">计划名称</span></a></td>
                       <td class="sort"><a ><span class="fl">编制单位</span></a></td>
                       <td class="sort"><a ><span class="fl">编制人</span></a></td>
                       <td class="sort"><a ><span class="fl">版本状态</span></a></td>
                        <td class="sort"><a ><span class="fl">版本号</span></a></td>
                       <td class="sort"><a ><span class="fl">操作</span></a></td>
                   </tr>
        	</thead>
                <tbody id="table1_tbody">
                  
                   <tr class="tableItem">
                  
                   </tr>
                 </tbody>
                  <tfoot>
                   <tr class="tfoot">
                       <td colspan="10">
                         <div class="clearfix"><span class="fl"></span>
                           <ul class="fr clearfix pager"></ul>
                         </div>
                       </td>
                    </tr>
                  </tfoot>
           </table>
      </div>
        <!--Table End-->
     </div>
</div>



<div id="dr_div" class="f_window" 
		style="width:400px; display:none;   margin:10% 0% 0 36%;">

		<div class="con">
			<table id="table_2" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="table_2">

				<thead>

					<th colspan="4">

						<h5 class="fl">文件导入</h5> <a 
						 	class="fr pt5 mr5" href="javascript:close();">关闭</a> </th>

				</thead>
				<tbody>
    <tr> <td>	<input
									class="fr" type="button" value="取消"
									onclick="$('#uploadify').uploadify('stop');">
									<input class="fr"type="button" value="上传"
									onclick="$('#uploadify').uploadify('upload','*');"> 
						<input type="file" name="uploadify" class="fr"
									id="uploadify" value="浏览"/> 
    </td></tr>
				</tbody>

			</table>


		</div>


	</div>
</body>
</html>
