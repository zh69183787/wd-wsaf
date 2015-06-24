<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>监督投诉</title>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="IE=8">

    <link rel="stylesheet" href="css/formalize.css"/>
    <link rel="stylesheet" href="css/page.css"/>
    <link rel="stylesheet" href="css/default/imgs.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/uploadify.css" type="text/css" />
    
    
    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="js/jquery.formalize.js"></script>
    <script src="js/comConfig.js"></script>    
    <script src="js/cptComplain.js"></script>
    <script src="js/jquery.uploadify-3.1.js"></script>
   
    <style>
        .red {
            display: inline;
            color: red;
        }
        .w90{
            width:90%;
        }
    </style>
 <script type="text/javascript">
 $(function () {
         $("#cptComplaintList").click(function () {
               window.location.href = "<%=basePath%>cptComplaint/cptComplaintList";
            });  
            var time = new Date().getTime(); 
            var groupName='complaint'+time;
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
               alert("失败");
                     if(errorCode==-110){
                         this.queueData.errorMsg = "文件太大，无法上传！";
                     }
                },
                'onUploadSuccess' : function(file, data, response){
                 var attachs = jQuery.parseJSON(data);
                 var attach=attachs.result[0];
                 
                 if(attach.id!=null){
				     $("#tbfj tbody").append("<tr name=\""+attach.id+"\"  class=\""+attach.id+"\"><td>"+attach.fileName+"</td><td>"+attach.fileSize+"</td><td>"+attach.uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+attach.id+"\">下载</a></td><td><a class=\"del\" style=\" cursor :pointer;\" onclick=\" $.FileDel('${pageContext.request.contextPath}',"+attach.id+",'0')\"  >删除</a></td></tr>");
				        
				 }
            },
              
        });
        
        $.FileSave = function(firUrl,modelName,_id,_attachIds){
		    if(firUrl!="")
		         { 
			      $.ajax({
			             async: false,
			              url : firUrl+"/attach/api/bind",
			              type : 'post',
			              data: "&modelName="+modelName+"&modelId="+_id+"&attachIds="+_attachIds,
			              success: function(data, status, xhr) {
			                  
			              },
			             error:function(XMLHttpRequest, textStatus, errorThrown){
			             //alert(XMLHttpRequest+"save失败");
			             }
			         });
		         }
	  }
        
        $.FileDel = function(firUrl,_id,isRead){
		    if(firUrl!="")
		       { 
			        $.ajax({
			                async: false,
			                url : firUrl+"/attach/api/del/"+_id,
			                dataType:"json",
			                type:'post',
			                success: function(data, status, xhr) {
			                    alert("删除成功");
// 			                    alert(id);
			                    $("#tbfj tbody tr."+_id).remove();
			                }
			        });
		       }
		}
        
//         $.getAttachId = function(){
//     		var attachId="",_tr=$("#tbfj tbody").find("tr");
//    		 for (var i = 0; i < _tr.length; i++){
//   	  		attachId+=$(_tr[i]).attr("name")+",";
// 		}
//    		 if(attachId!=null||attachId!=""){
//     		return attachId=attachId.substring(0,attachId.length-1);
// 		}else{
//     		return attachId;
// 		}
// 	};
       
           $.ajax({
            	url:"${pageContext.request.contextPath}/ca/getCookies",
            	 async:false,
            	type: 'post',
//             	cache:false,
           		dataType : 'json',
           		data:{},
           		success: function (data) {
           				if(data!=null){
           					$("#creater").val(data.creater);
           					$("#loginName").val(data.loginName+data.deptId);
           					$("#deptName").val(data.deptName);
           					$("#deptId").val(data.deptId);
           					$("#linkMan").val(data.userName);
           					var json=$.getCptComplaintDeptType();
           					for(var i=0;i<json.length;i++){
								if(json[i].deptId==data.deptId){
									var types= json[i].type.split(",");									
									var typesAll= ["massWork","admimBusiness","disciplineSupervise"];
									var typeRemove=[];	
									
									$.each(typesAll,function(index,type){								
										if(types.join(",").indexOf(type)<0){
											typeRemove.push(type);
										}										
									});	
													
									$.each(typeRemove,function(j,type){	
										$("#situation option[value="+type+"]").remove();
									});	
								}
							}
           				}
           		}
            });
          
                $("#createTime").val(new Date().getTime());
            $("#btnSubmit").click(function () {
                $("#dialog-confirm").dialog({
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
                            }else{
	                            $.postSaveMain("${pageContext.request.contextPath}", "cptComplaintForm", otherData, "/cptComplaint/cptComplaintSave");
	                            $(this).dialog("close");
	                            alert("操作成功！");
	                            
	                            $("#btnSubmit").attr("disabled",true);
	//                          $.FileSave("${pageContext.request.contextPath}","complaint",_id,_attachIds);
                            }
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


        });
    </script>
</head>


<body>

<div class="main">
    	<!--Ctrl-->
		<div class="ctrl clearfix">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl">
            	<ul>
                	<li><a href="#">互动交流平台</a></li>
                	<li class="fin">监督投诉</li>
                </ul>
            </div>
            <div class="posi fr nwarp">
            	<ul>
                    <li class="fin"><a  href="<%=basePath%>cptComplaint/cptComplaintList">监督投诉管理</a>
                    </li>               
                </ul>
            </div>
   		</div>
        <!--Ctrl End-->
        <div class="pt45">
        <!--Tabs_2
        <div class="tabs_2">
        	<ul>
            	<li class="selected"><a href="#"><span>栏目名称</span></a></li>
            	<li><a href="#"><span>栏目名称栏目名称</span></a></li>
            	<li><a href="#"><span>栏目名称</span></a></li>
            	<li><a href="#"><span>栏目名称</span></a></li>
            </ul>
        </div>-->
        <!--Tabs_2 End-->
        <!--Filter--><!--Filter End-->
        <!--Table-->
        <div class="mb10">
        <form id="cptComplaintForm">
        	<table width="100%"  class="table_1">
                              <tbody>
                                
                              <tr>
                                <td class="t_r lableTd" style="font-weight:bold;">监督投诉</td>
                             
                                <td colspan="3"></td>
                                </tr>
                           
                              <tr>
                                <td class="t_r lableTd">标题</td>
                                <td colspan="3"><input type="text" id="cptTitle" name="cptTitle" placeholder="" class="input_xlarge" />  <label style="color:red">*</label></td>     
                                </tr>
                              <tr>
                                <td class="t_r lableTd">情况分类</td>
                                <td colspan="3"><select name="situation" id="situation" class="input_large" >
                                 <option value="">请选择</option>
                                <option value="massWork">党群工作类</option>
                                <option value="admimBusiness">行政业务类</option>
                                <option value="disciplineSupervise">纪检监察类</option>
                                </select>  <label style="color:red">*</label></td>                               
                                </tr>
                                
                               <tr>
                                <td class="t_r lableTd">附件上传   </br>(单个文件上传最大为10mb)</td>
                                <td colspan="3">   <input id="upload_photo" class="upload_button" type="button" value="本地上传" /></br></br>
 
                                 <input type="button" value="上传"  onclick="$('#upload_photo').uploadify('upload','*');">&nbsp;
                                 <input type="button" value="取消"  onclick="$('#upload_photo').uploadify('cancel','*');">
                                 <table id="tbfj">
					                 	<tbody>
					                 	
					                 	</tbody>
					                 </table>
                                  </td>
                                </tr>
                                
                                <tr>
                                <td class="t_r lableTd">详细内容</td>
                                <td colspan="3"><textarea id="content" name="content" rows="5" placeholder=""></textarea> </td>
                                </tr>
                            
                                
                               <tr>
                                <td class="t_r lableTd">联系人</td>
                                <td><input type="text" id="linkMan" name="linkMan" /><label style="color:red">*</label></td>
                                <td class="t_r lableTd">所在部门</td>
                                <td><input type="text" id="deptName" name="deptName" /><label style="color:red">*</label></td>
                                </tr> 
                                
                                      
                               <tr>
                                <td class="t_r lableTd">联系电话</td>
                                <td><input type="text" id="telephone" name="telephone" /> <label style="color:red">*</label> </td>
                                <td class="t_r lableTd">电子邮箱</td>
                                <td><input type="text" id="email" name="email" /></td>
                               </tr> 
                                </tbody>
                              
                            </table>
                             <input type="hidden" name="creater" id="creater" />
                             <input type="hidden" name="loginName"   id="loginName"/>
                             <input type="hidden" name="deptName"  id="deptName"/>
                             <input type="hidden" name="deptId"   id="deptId"/>
                             <input type="hidden" name="createTime"   id="createTime" />
       </form>
         <div class="mb10 t_c"  >
                          <table width="100%" class="table_1">
                            <tr class="tfoot"><td class=" t_r">
                            <input type="submit" id="btnSubmit" value="提 交" />&nbsp;
							<input type="reset" id="btnClose" value="返 回" />&nbsp; 
							<div id="dialog-confirm" title="" style="display:none">确认提交吗？</div>
							</td></tr>
						  </table>
			   </div>                      
      </div>
        <!--Table End-->
    	</div>
</div>

</body>
</html>
