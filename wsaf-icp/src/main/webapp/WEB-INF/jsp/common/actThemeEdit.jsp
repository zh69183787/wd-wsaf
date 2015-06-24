<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<head>
		<base href="<%=basePath%>">
		
		<title>发起征集</title>
	    <meta charset="utf-8"/>
	    <meta http-equiv="x-ua-compatible" content="IE=8">
	
	    <link rel="stylesheet" href="css/formalize.css"/>
	    <link rel="stylesheet" href="css/page.css"/>
	    <link rel="stylesheet" href="css/default/imgs.css"/>
	    <link rel="stylesheet" href="css/reset.css"/>
	    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
        <link type="text/css" href="css/skin/ui.dynatree.css" rel="stylesheet" >
       	<script src="js/dynatree/jquery.js"></script>
		<script src="js/dynatree/jquery-ui.custom.js"></script>
		<script src="js/dynatree/jquery.cookie.js"></script>

	    <script src="js/html5.js"></script>
	    <script src="js/jquery-1.7.1.min.js"></script>
	    <script src="js/jquery.uploadify-3.1.js"></script>
	    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
	    <script src="js/jquery.formalize.js"></script>
	    <script src="js/comConfig.js"></script>
	    <script src="js/actTheme.js"></script>
	    <script src="js/dynatree/jquery.dynatree.js"></script>
		<!--[if IE 6.0]>
           <script src="js/iepng.js" type="text/javascript"></script>
           <script type="text/javascript">
                EvPNG.fix('div, ul, ol, img, li, input, span, a, h1, h2, h3, h4, h5, h6, p, dl, dt');
           </script>
       <![endif]-->
       <script type="text/javascript">
        $(function () {
            var id="${id}";
            var add = "${add}";
            if(add=="add"){
            	$("#btnSubmit").attr("disabled","disabled");
            }
            if(id!=""){
                 $("#id").removeAttr("disabled");
            	 $.postMainDetail("${pageContext.request.contextPath}","${id}");
            }
            id=parseInt(id);
		    $.getFileInfo("${pageContext.request.contextPath}","modelName=adviceCollect&modelId="+id);
		    

            $.ajax({
            	url:"${pageContext.request.contextPath}/ca/getCookies",
            	async:false,
            	type: 'post',
//             	cache:false,
           		dataType : 'json',
           		data:{},
           		success: function (data) {
           				if(data!=null){
           					$("#creater").val(data.userName);
           					$("#loginName").val(data.loginName+data.deptId);
           					$("#deptName").val(data.deptName);
           					$("#deptId").val(data.deptId);
           					var json=$.getActThemeDeptType();
           					for(var i=0;i<json.length;i++){
								if(json[i].deptId==data.deptId){
									var types= json[i].type.split(",");	
										
									var typesAll=["partyCategory","manageCategory","technologCategory","specialCategory"];	
									
									var typeRemove=[];													
									$.each(typesAll,function(index,type){								
										if(types.join(",").indexOf(type)<0){
											typeRemove.push(type);
										}										
									});	
														
									$.each(typeRemove,function(index,type){	
										$("#colCategory option[value="+type+"]").remove();
									});
								}
							}
           				}
           		}
            });
          
            $("#createTime").val(new Date().getTime());
            
            $('#startTime,#endTime').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true
            });

            $("#btnSubmit").click(function () {
                $("#dialog-confirm").dialog({
                    title: "提示",  
                    resizable: false,
                    height: 140,
                    width: 200,
                    modal: true,
                    buttons: {
                        "确认": function () {
                            var info = $.validateForm();
                            if (info != "") {
                                alert(info + "\r\n请您修改");
                                $(this).dialog("close");
                                return false;
                            }
                            var otherData = "";
                            if (QueryString.GetValue('id') != null) {
                                otherData += "&id=" + QueryString.GetValue('id');
                            }
                            $.postSaveMain("${pageContext.request.contextPath}", "actThemeForm", otherData, "/actTheme/actThemeEdit");
                            $(this).dialog("close");
                            $("#btnSubmit").attr("disabled",true);
                            alert("操作成功！");
                            
                            
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }
                });
            });
            
			$("#btnClose").click(function () {
                window.opener = null;
                window.open('', '_self');
                window.close();
            });
            
            var time = new Date().getTime(); 
            var groupName='adviceCollect'+time;
            var uploader = $("#loginName").val();
            $("#upload_photo").uploadify({
				    'auto' : false,
				    'method' : "post",
				    'height' : 20,
				    'width' : 100,
				    'swf' : 'js/uploadify.swf', 
				    'uploader' : '<%=basePath%>attach/api/upload?groupName='+groupName+'&uploader='+uploader,
				    'fileTypeDesc' : '格式:txt,xls，xlsx,doc,docx,rar,zip,jpg,png,pdf',     //描述
				    'fileTypeExts' : '*.txt;*.xls;*.xlsx;*.doc;*.docx;*.rar;*.zip;*.jpg;*.png;*.pdf',         //文件类型
				    'fileSizeLimit' : '10000KB',          //文件大小
				    'buttonText' : '选择文件',         //按钮名称
				    'fileObjName' :'uploadify',
				    'multi' :true,
				    'successTimeout' : 5,
				    'requeueErrors' : false,
				    'removeTimeout' : 1,
				    'removeCompleted' : true,
				    'onSelectError' : function(file,errorCode,errorMsg) {
				          if(errorCode==-110){
				              this.queueData.errorMsg = "文件太大，无法上传！";
				          }
				          alert("失败");
				     }, 
				     'onUploadSuccess' : function(file, data, response){
				      var attachs = jQuery.parseJSON(data);
				      var attach=attachs.result[0];
// 				      alert(attach.id);
				        if(attach.id!=null){
				        	$("#tbfj tbody").append("<tr name=\""+attach.id+"\"  class=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td>"+attach.uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\" style=\" cursor :pointer;\" onclick=\" $.FileDel('${pageContext.request.contextPath}',"+attach.id+",'0')\"  >删除</a></td></tr>");
				        
				        }
				        
				       
				 }
			});
            //defined the root node key
            var rootNodeKey="2500";
            //init the tree
             $("#dynaTree").dynatree({
                 noLink:true,
                 selectMode: 3,
                 checkbox: true,
                 children:{title:"申通地铁集团有限公司",key:rootNodeKey,isFolder:true,isLazy: true},                 
                 onLazyRead:function(node){
                      lazyLoadChildNodes("getChildDepts",node);
                 }
                 
             });
             //get chosed user's dept
            var depts=$("#participantDepts").val();           
            if(depts!=""){            	
            	$.ajax({
		          	url:"${pageContext.request.contextPath}/ca/getRelatedDepts",
		          	async:false,
		          	type: 'post',
		         		dataType : 'json',
		         		data:{"deptId":depts},
		         		success: function (data) {
			          		if(data!=null){	          			
			          			 loadChosedChildNodes("getChildDepts",rootNodeKey,data);			          			 			          			
			         		}
		         		}
		          });
            }
            
            
            $("#participant_cn").click(function () {
                $("#dialog-tree").dialog({
                    resizable: false,
                   	height: 600,
                    width: 500,
                    modal: true,
                    buttons: {
                        "确认": function () {    
	                        //if(treeLoad){                    
								var selectArr=[];
								var selectTitleArr=[];
								//var selectKeyArr=[];
	                        	var tree=$("#dynaTree").dynatree("getTree");
			                   	var root=tree.getNodeByKey(rootNodeKey);
	
			                   if(!root.isSelected()){
				                   var selectNodes=$("#dynaTree").dynatree("getSelectedNodes");
									
									var selectNodesKey=$.map(selectNodes,function(node){								
					                   if(node.hasChildren()==false){		                   
					                      return node.data.key;
					                   }
				                   });
	 
				                   for(var k in selectNodesKey){			                   
				                   		var key=selectNodesKey[k];
				                   		
				                   		var title=tree.getNodeByKey(key).data.title;
				                   		
				                   		//selectKeyArr.push(key);			                  
				                   		selectTitleArr.push(title);
				                   		selectArr.push('"'+key+'":"'+title+'"');
				                   }
			                   	   
			                   }
			                   var person=selectArr.join(",");
			                   if(""!=person){
			                   	person="{"+person+"}";
			                   }
			                   var personCn=selectTitleArr.join(",");
			                  // var personLoginName=selectKeyArr.join(",");
			                   
			                   $("#participant").val(person);
			                   $("#participant_cn").val(personCn);
			                   //$("#participants_loginName").val(personLoginName);
		                   //}
		                   
                            $(this).dialog("close");
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }
                });
            });


        });
        
        
	function loadChosedChildNodes(apiMethod,pkey,chosedData){            
		$.ajax({
          	url:"${pageContext.request.contextPath}/ca/"+apiMethod,
          	async:false,
          	type: 'post',
         		dataType : 'json',
         		data:{"deptId":pkey},
         		success: function (data) {
	          		if(data!=null){	          			
						var res = [];	          			
	          			var i=0;
	          			var hasChild=false;
	          			
	          			if("getChildDepts"==apiMethod){
	          				hasChild=true;
	          			}
	          			
	          			var tree=$("#dynaTree").dynatree("getTree");
	          			var person=$("#participant").val(); 
	          			
						var pnode=tree.getNodeByKey(pkey);								
							
	          			for(var keyValue in data){	
	          				i++;		
	          				if("getDeptUser"==apiMethod){	     
								
		          				if(person.indexOf(keyValue+pkey)>=0){
		          					res.push({title: data[keyValue],key:keyValue+pkey,isLazy: hasChild,select:true});
		          				}else{
		          					res.push({title: data[keyValue],key:keyValue+pkey,isLazy: hasChild});
		          				}     				

	          				}else{
	          					res.push({title: data[keyValue],key:keyValue,isLazy: hasChild});
	          				}	          				
	          			}
	          			
	          			if(i!=0){
	                 		pnode.addChild(res);
	                 			
	                 		var nextChosedNodes=chosedData[pkey];
	                 		
	                 		if(nextChosedNodes!=null){
	                 			var nextChosedNodeArr=nextChosedNodes.split(",");
	                 			for(var j in nextChosedNodeArr){
	                 				loadChosedChildNodes("getChildDepts",nextChosedNodeArr[j],chosedData);
	                 			}
	                 		}

	                	}else if("getChildDepts"==apiMethod){
	                		loadChosedChildNodes("getDeptUser",pkey,chosedData);
	                	}	
	         		}
         		}
          });
   }
   
   
   function lazyLoadChildNodes(apiMethod,node){
   		$.ajax({
          	url:"${pageContext.request.contextPath}/ca/"+apiMethod,
          	async:false,
          	type: 'post',
         		dataType : 'json',
         		data:{"deptId":node.data.key},
         		success: function (data) {
	          		if(data!=null){
	          			var res = [];	          			
	          			var i=0;
	          			var selected=node.isSelected();
	          			var hasChild=false;
	          			if("getChildDepts"==apiMethod){
	          				hasChild=true;
	          			}
	          			for(var keyValue in data){	
	          				i++;		
	          				if("getDeptUser"==apiMethod){	           				
	          					res.push({title: data[keyValue],key:keyValue+node.data.key,isLazy: hasChild,select:selected});
	          				}else{
	          					res.push({title: data[keyValue],key:keyValue,isLazy: hasChild,select:selected});
	          				}	          				
	          			}
	          			
	          			if(i!=0){
	                 		node.addChild(res);	
	                	}else if("getChildDepts"==apiMethod){
	                		lazyLoadChildNodes("getDeptUser",node);
	                	}	
	         		}
         		}
          });
   
   }
    </script>
</head>

<body>
	<div class="main">
    	<!--Ctrl-->
		<div class="ctrl clearfix">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl">
            	<ul>
<!--                 	<li><a href="#">首页</a></li> -->
                	<li><a href="#">意见管理</a></li>
                	<li class="fin">发起征集</li>
                </ul>
            </div>
           
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        
        <!--Filter-->
         <div class="filter">
            <div class="fn clearfix">
            	<h5 class="fl"><a href="#" class="colSelect fl">发起征集</a></h5>
            </div>
         </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<form id="actThemeForm">
        	<table width="100%"  class="table_1"  >
                              <tbody>
                              <tr>
                                <td class="t_r lableTd">征集名称</td>
                                <td colspan="3"><input class="input_full" type="text" id="name" name="name"  /></td>
                                <td></td>
                                <td></td>
                              </tr>
                              
                              <tr>
                                <td class="t_r lableTd"    >意见类别</td>
                                <td>
                                	<select id="colCategory" name="colCategory" class="input_large">
                                		<option value="">请选择</option>
                                		<option value="partyCategory">党群类</option>
                                		<option value="manageCategory">管理类</option>
                                		<option value="technologCategory">技术类</option>
                                		<option value="specialCategory">专题类</option>
                                	</select>
                                </td>
                                <td class="t_r lableTd">是否开放</td>
                                <td>
                                	<select  id="isOpend" name="isOpend"   class="input_large">
                                		<option value="">请选择</option>
                                		<option value="yes">开放</option>
                                		<option value="no">不开放</option>
                                	</select>
                                </td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                              	  <td class="lableTd t_r" >添加附件</td>
				                  <td colspan="3">
					                 <input id="upload_photo" name="uploadify" class="upload_button"  type="button" value="本地上传" />
					                 <input type="button" value="上传"  onclick="$('#upload_photo').uploadify('upload','*');">
					                 <input type="button" value="取消"  onclick="$('#upload_photo').uploadify('cancel','*');">
					                 <table id="tbfj">
					                 	<tbody>
					                 	
					                 	</tbody>
					                 </table>
				                  </td>
                              	
<!--                                 <td class="t_r lableTd">附件上传</td> -->
<!--                                 <td colspan="3"><input type="file" id="file" name="file" /> -->
<!--                                		   附件说明 -->
<!--                                   <select name="select2" id="select2"> -->
<!--                                     <option>正文</option> -->
<!--                                   </select> -->
<!--                                 </td> -->
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">开始时间</td>
                                <td><input readonly id="startTime" name="startTime" type="text"
                                                   class="input_large">
                                </td>
                                <td class="t_r lableTd">结束时间</td>
                                <td><input readonly id="endTime" name="endTime" type="text"
                                                   class="input_large"></td>
                              	<td></td>
                              	<td></td>
                              </tr>
                               <tr>
                                <td class="t_r lableTd">选择参与人员</td>
                                <td colspan="3">
                                	<textarea readonly id="participant_cn"  rows="5"></textarea>
                                	<input type="hidden" id="participant" name="participant"/>
                                	<input type="hidden" id="participantDepts"/>
                                	<!-- input type="hidden" id="participants_loginName"/-->
                                </td> 
                                
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <td class="t_r lableTd">征集内容</td>
                                <td colspan="3"><textarea  id="content" name="content"   rows="5" placeholder=""></textarea></td>
                                <td></td>
                                <td></td>
                              </tr>
                              </tbody>
                              
                            </table>
                                <input type="hidden" name="creater" id="creater">
                                <input type="hidden" name="loginName" id="loginName">
                                <input type="hidden" name="deptName" id="deptName">
                                <input type="hidden" name="deptId" id="deptId" >
                                <input type="hidden" name="createTime" id="createTime" >
                                <input type="hidden" name="id" id="id" disabled="disabled" >
                                
                                
                               
              </form>
              <div class="mb10 t_c"  >
                          <table width="100%" class="table_1">
                            <tr><td class=" t_c">
                            <input type="button" id="btnSubmit" value="提 交"  />&nbsp;
							<input type="button" id="btnClose" value="返 回" />&nbsp; 
							
							</td></tr>
						  </table>
			   </div>
			   <div id="dialog-confirm" title="" style="display:none">确认提交吗？</div>
			   <div id="dialog-tree" title="人员组织结构" style="display:none;overflow: scroll;">
                      <div id="dynaTree">组织机构正在加载中，请稍候.......</div>
               </div>   
      </div>
        <!--Table End-->
    	</div>
</div>
</body>
</html>
