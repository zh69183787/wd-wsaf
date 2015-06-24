<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>人员信息</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="css/formalize.css" />
    <link rel="stylesheet" href="css/page.css" />
    <link rel="stylesheet" href="css/default/imgs.css" />
    <link rel="stylesheet" href="css/reset.css" />
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />

    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.formalize.js"></script>
   <script src='js/dynatree/jquery.cookie.js' type="text/javascript"></script>
   <link rel='stylesheet' type='text/css' href='js/dynatree/skin/ui.dynatree.css'>
   <script src='js/dynatree/jquery.dynatree.min.js' type="text/javascript"></script>

    <script src="js/f.defaultJs.js"></script>
    <script src="js/f.securityLevel.js"></script>
    <style type="text/css">

        .table_2 input[type=checkbox]
        {
            margin: 0 1px 0 15px;
        }

     
        .mytable2 tbody td
        {
            text-align: center;
            vertical-align: middle;
            border-left: 1px #e4e4e4 solid;
        }
       .userName,#FormName
        {
       display:none;
        }
        tbody tr.bg2 td
        {
            background-color: #F8F8F8;
        }

            .table_2 input[type=checkbox]:first-child, .companyAddress select:first-child
            {
                margin: 0 3px 0 0;
            }
    </style>
    <script type="text/javascript">
        $(function () {
        	$.fn.postManagerDetail = function(firUrl,otherData){
   			 if(firUrl!="")
   			   {	
   				 var obj=$(this);
   					 $.ajax({
   						   async: false,
   						    url : firUrl+"/basicCrud/manager/all",
   						    data: otherData,
   						    datatype:'json',
   						    type : 'post',
   							success: function(data, status, xhr) {
   		
   								if (status == "success" && data != null)
   								{
   									if (data.result[0]!= null) 
   									{
   										var entry=data.result[0];
                                          
   										  var userName="";
   										  $("#mycompany").val(data.result[0].company);
   										   obj.find(".myId").text(data.result[0].id);
   										   
   										if(data.result[0].role=="member")
   										{
   											obj.find("#sp_name").val(data.result[0].userName);
   											obj.find("#sp_nameId").text(data.result[0].loginName);
   										 if(data.result[0].loginName!=null);
   										 {
   											 var strArry = data.result[0].loginName.split(",");
   											$("[name=memberName]").val(strArry);
   										 }

   										}
   										else
   										{
   									     	obj.find(".userName").val(data.result[0].loginName);
   									     	obj.find(".userNameZW").val(data.result[0].userName);;
   									    
   										}
   										
   										for ( var item in entry) 
   										{
   										  try 
   										{ 									
   											obj.find("[name="+item+"]").val(entry[item]);
	 
   										}
   											catch (e) 
   											{ 
   												alert(e);
   											}
   										}
   										
   									
   										
   									}
   							   }
   					           }, 
   					           error: function() {
   					              hiAlert("对不起！你的请求出现异常，请联系服务人员！","重要提示");
   					           }
   							});
   			   }
   		}
        	
        	$(".myId").css("display","none");
        	$.getMenu({"url":"${pageContext.request.contextPath}", "modName":"manager"});
        
        	  if (QueryString.GetValue('id') != null) {
        	
        	$.getUserNameInfo("${pageContext.request.contextPath}", "?deptId=" + QueryString.GetValue('id'));
        	var _form=$("form");
        	for(var i=0;i<_form.length;i++)
        	{
        		var otherData="role="+$(_form[i]).children("table").attr("id")+"&companyId="+QueryString.GetValue('id');
        		$(_form[i]).postManagerDetail("${pageContext.request.contextPath}",otherData);
        	}
        	$("#memberForm #sp_name").click(function () {
                $("#bt").height($(document).height());
                $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
                $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
                $("#win1").css("display", "block");
                $("#bt").css("display", "block");
            });
        		
        	
        	$(".addManager").click(function () {
        		if($("#mycompany").val()==null||$("#mycompany").val()=="")
        		{
        			alert("公司名字不能为空。");
        			return false;
        		}
        		if($(this).parents("table").attr("id")=="member")
        			{
        			if($(this).parents("table").find("#sp_name").val()==null||$(this).parents("table").find("#sp_name").val()=="")
            		{
            			alert("必须选择一个人");
            			return false;
            		}
        			}
        		else
        			{
        		if($(this).parents("table").find(".userName").val()==null||$(this).parents("table").find(".userName").val()=="")
        		{
        			alert("必须选择一个人");
        			return false;
        		}
        		
        			}
        		var _name=$(this).parents("table").attr("id"),otherData="&companyId="+QueryString.GetValue('id')+"&company="+$("#mycompany").val()+"&role="+_name;
        		if(_name=="member")
        			{
        			otherData+="&userName=" + $(this).parents("table").find("#sp_name").val() + "&loginName=" + $(this).parents("table").find("#sp_nameId").text() ;
        			}
        		else
        			{
        		otherData+="&userName=" + $(this).parents("table").find(".userNameZW").val() + "&loginName=" + $(this).parents("table").find(".userName").val() ;
        			}
        		
        		
        		if($(this).parents("table").find(".myId").text()!=null&&$(this).parents("table").find(".myId").text()!="")
        			otherData+="&id="+$(this).parents("table").find(".myId").text();
        		
        		$.postSave({"url":"${pageContext.request.contextPath}","formName":_name+"Form","isGetData":true,"modname":"manager","otherData":otherData+"&businessType=securityLevel","isClose":false});
        	});
        	
        	
        	$("#btnSubmit").click(function () { 
        		if($("#mycompany").val()==null||$("#mycompany").val()=="")
        		{
        			alert("公司名字不能为空。");
        			return false;
        		}
        		
        		var _form=$("form");
        		
            	for(var i=0;i<_form.length;i++)
            	{
            		if($(_form[i]).children("table").attr("id")=="member")
        			{
        			if($(_form[i]).children("table").find("#sp_name").val()==null||$(_form[i]).children("table").find("#sp_name").val()=="")
            		{
            			alert("信息安全工作组成员必须选择一个人");
            			return false;
            		}
        			}
        		else
        			{
        		if($(_form[i]).children("table").find(".userName").val()==null||$(_form[i]).children("table").find(".userName").val()=="")
        		{
        			alert($(_form[i]).children("table").find("h5").text()+"必须选择一个人");
        			
        			return false;
        		}
        		
        			}
        		
            	}
            	for(var j=0;j<_form.length;j++)
            	{
            		var _name=$(_form[j]).children("table").attr("id"),otherData="&companyId="+QueryString.GetValue('id')+"&company="+$("#mycompany").val()+"&role="+_name;
            		if(_name=="member")
            			{
            			otherData+="&userName=" + $(_form[j]).children("table").find("#sp_name").val() + "&loginName=" + $(_form[j]).children("table").find("#sp_nameId").text() ;
            			}
            		else
            			{
            		otherData+="&userName=" + $(_form[j]).children("table").find(".userNameZW").val() + "&loginName=" + $(_form[j]).children("table").find(".userName").val() ;
            			}
            		
            		if($(_form[j]).children("table").find(".myId").text()!=null&&$(_form[j]).children("table").find(".myId").text()!="")
            			otherData+="&id="+$(_form[j]).children("table").find(".myId").text();
            		
            		$.postSave({"url":"${pageContext.request.contextPath}","formName":_name+"Form","isGetData":true,"modname":"manager","otherData":otherData+"&businessType=securityLevel"});
            	}
            	
            	location.reload(); 
            	  window.opener=null;
				  window.close();
            });

            $("#btndel").click(function () {
                window.close();

                location.href = "${pageContext.request.contextPath}/manager/managerList";
            });


        	var treeLoad=false;//标示树形结构是否构建完毕

             $.ajax({
              url:"${pageContext.request.contextPath}/ca/getOrganTree",
              type: 'post',
                  dataType : 'json',
                  data:{"deptId":QueryString.GetValue('id')},
                  success: function (data) {
                         if(data!=null){   
 
                         $(".selPersonTable").dynatree({
                               noLink:true,
                               selectMode: 3,
                               checkbox: true,
                               children:{title:"当前单位",key:QueryString.GetValue('id'),isFolder:true,isLazy: true}             
                          });


                           var person=$("#sp_nameId").text();
                            var tree=$(".selPersonTable").dynatree("getTree");
                            for(var i=0;i<data.length;i++){
                            var pnode=tree.getNodeByKey(data[i].pkey);
                            if(person.indexOf(data[i].key)>=0&&data[i].key.length>4){
                                pnode.addChild({key:data[i].key,title:data[i].title,select:true}); 
                            }else{
                                pnode.addChild({key:data[i].key,title:data[i].title});  
                            }
                            
                         }
                         
                         treeLoad=true;
                         }
                  }
            });
        	
            
             
             var treeLoad2=false;//标示树形结构是否构建完毕

             $.ajax({
              url:"${pageContext.request.contextPath}/ca/getOrganTree",
              type: 'post',
                  dataType : 'json',
                  data:{"deptId":QueryString.GetValue('id')},
                  success: function (data) {
                         if(data!=null){   
 
                         $(".selPersonTable2").dynatree({
                               noLink:true,
                               selectMode: 1,
                               checkbox: true,
                               children:{title:"当前单位",key:QueryString.GetValue('id'),isFolder:true,isLazy: true}             
                          });

                            var tree=$(".selPersonTable2").dynatree("getTree");
                            for(var i=0;i<data.length;i++){
                            var pnode=tree.getNodeByKey(data[i].pkey);
                                pnode.addChild({key:data[i].key,title:data[i].title});                  
                         }
                         
                            treeLoad2=true;
                         }
                  }
            });
             
             $(".userNameZW").click(function () {
                 $("#bt").height($(document).height());
                 $(".f_window").css("margin-top", ($(window).height() - $('.f_window').outerHeight()) / 2 + $(document).scrollTop());
                 $(".f_window").css("margin-left", ($(window).width() - $('.f_window').outerWidth()) / 2);
                 $("#win2").css("display", "block");
                 $("#bt").css("display", "block");

                 var selId=$(this).next(".userName:first").val();
                 $(".selPersonTable2").dynatree("getTree").selectKey(selId);
                 
                 $("#FormName").text($(this).parents("form").attr("id"));
                 
                
             });
             
             $(".submit2").click(function () {
            		if(treeLoad2){        
            			   var _key="",_title="",selectArr=[],selectTitleArr=[],tree=$(".selPersonTable").dynatree("getTree"), root=tree.getNodeByKey(QueryString.GetValue('id'));
            			    

            			         var selectNodes=$(".selPersonTable2").dynatree("getSelectedNodes")[0];
            			          if(selectNodes.hasChildren()) 
            			        {
            			        	  alert("成员不为某组,请重新选择");
            			        	  return false;
            			        }
            			         _key= selectNodes.data.key,_title=selectNodes.data.title;
            			             
            			      
            			   var formNames=$("#FormName").text();

            			   $("#"+formNames).find(".userNameZW:first").val(_title);
            			   $("#"+formNames).find(".userName:first").val(_key);                         

            		}
            		
            		$(".f_window").css("display", "none");
                 $("#bt").css("display", "none");
            	});
             
             $(".submit").click(function () {
          		if(treeLoad){   
          			//以下是获取被选中节点并组合返回信息的逻辑                 
          			   var selectArr=[],selectTitleArr=[],tree=$(".selPersonTable").dynatree("getTree"), root=tree.getNodeByKey(QueryString.GetValue('id'));

          			         var selectNodes=$(".selPersonTable").dynatree("getSelectedNodes");
          			                                
          			            var selectNodesKey=$.map(selectNodes,function(node){                                 
          			            	if(node.hasChildren()==false)                         
          			                  return node.data.key;        
          			              });
          			     
          			              for(var k in selectNodesKey){                           
          			                    var key=selectNodesKey[k];
          			                    var title=tree.getNodeByKey(key).data.title;
          			                                              
          			                     selectTitleArr.push(title);
          			                     selectArr.push(key);
          			                   }
          			      
          			                              
          			
          			    var person=selectArr.join(",");
          			    var personCn=selectTitleArr.join(",");
               
          			    $("#sp_name").val(personCn);
          			    $("#sp_nameId").text(person);
          		}
          		
          		$(".f_window").css("display", "none");
                 $("#bt").css("display", "none");
          	});
             
        	  }

             
        })

    </script>
</head>

<body class="Flow">
 <div id="bt" class="transparent" style="display:none"></div>

    <div class="f_window" id="win1" style="display:none">
      <h3 class="clearfix mb10"><span class="fl">请选择成员</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="selPersonTable">

      </div>
<div class="clearfix"></div>
      <div class="button t_c">

        	<input type="button" class="submit" value="确认" />

        </div>

    </div>
    
    <div class="f_window" id="win2" style="display:none">
      <h3 class="clearfix mb10"><span class="fl">请选择人员</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>
<div id="FormName"></div>
        <div class="selPersonTable2">

      </div>
<div class="clearfix"></div>
      <div class="button t_c">

        	<input type="button" class="submit2" value="确认" />

        </div>

    </div>
    
    <div class="f_bg">
        <!--Panel_6-->
        <div class="Divab1">
            <!--1st-->
            <div class="panel_6">
                <div class="divT">
                    <div class="mb10 icon icon_1"></div>
                    <div class="more_4"><a title="更多">更多</a></div>
                </div>
                <div class="divH">
                    <div class="divB">
                        <h5 class="clearfix">业务办理</h5>
                        <div class="con">
                            <ul class="button clearfix" style="filter: Gray">
                                <li class="disable"><a class="ywbl">业务办理</a></li>
                                <li class="disable"><a class="print">打印</a></li>
                                <li class="disable"><a class="jk">业务监控</a></li>
                                <li class="disable"><a class="tips">小提示</a></li>
                                <li class="disable"><a class="imp">公文导入</a></li>
                                <li class="disable"><a class="exp">公文导出</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="divF"></div>
                </div>
            </div>
            <!--1st End-->

        </div>
        <!--Panel_6 End-->
        <div class="logo_1"></div>
        <div class="gray_bg">
            <div class="gray_bg2">
                <div class="w_bg">
                    <div class="Bottom">
                        <div class="Top">
                            <h1 class="t_c">上海申通地铁集团有限公司<br>
                                人员信息</h1>
                            <div class="mb10">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                    <thead>
                                        <th colspan="4" class="f1">
                                            <h5 class="fl">基本信息</h5>
                                        </th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="lableTd t_r">组织/单位</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" id="mycompany" />
                                                <div id="company_Id" style="display: none;"></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <form id="principalForm">
                                    <table id="principal" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">信息安全责任人信息</h5>
                                                <span class="fr mr5">
                                                    <input type="button" class="addManager" value="保存" /></span>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">人员信息</td>
                                                <td colspan="3" style="padding: 0">
                                                    <table width="100%" class="mytable">
                                                        <tr>
                                                            <td>姓名</td>
                                                            <td colspan="3">
                                                                <input type="text" class="input_small userNameZW" readonly="readonly"/><input type="text" class="input_small userName" readonly="readonly"/><div class="myId"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>部门</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="dept" /></td>
                                                            <td>职务</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="post" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">办公电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="office" /></td>
                                                            <td style="border-bottom: 0px;">移动电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="mobile" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">传真</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="fix" /></td>
                                                            <td style="border-bottom: 0px;">电子邮件</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="email" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <form id="producePrincipalForm">
                                    <table id="producePrincipal" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">生产信息安全工作负责人信息</h5>
                                                <span class="fr mr5">
                                                    <input type="button" class="addManager" value="保存" /></span></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">人员信息</td>
                                                <td colspan="3" style="padding: 0">
                                                    <table width="100%" class="mytable">
                                                        <tr>
                                                            <td>姓名</td>
                                                            <td colspan="3">
                                                                 <input type="text" class="input_small userNameZW" readonly="readonly"/><input type="text" class="input_small userName" readonly="readonly"/><div class="myId"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>部门</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="dept" /></td>
                                                            <td>职务</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="post" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">办公电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="office" /></td>
                                                            <td style="border-bottom: 0px;">移动电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="mobile" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">传真</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="fix" /></td>
                                                            <td style="border-bottom: 0px;">电子邮件</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="email" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <form id="enterprisePrincipalForm">
                                    <table id="enterprisePrincipal" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">企业信息安全工作负责人信息</h5>
                                                <span class="fr mr5">
                                                    <input type="button" class="addManager" value="保存" /></span></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">人员信息</td>
                                                <td colspan="3" style="padding: 0">
                                                    <table width="100%" class="mytable">
                                                        <tr>
                                                            <td>姓名</td>
                                                            <td colspan="3">
                                                                <input type="text" class="input_small userNameZW" readonly="readonly"/><input type="text" class="input_small userName" readonly="readonly"/><div class="myId"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>部门</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="dept" /></td>
                                                            <td>职务</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="post" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">办公电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="office" /></td>
                                                            <td style="border-bottom: 0px;">移动电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="mobile" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">传真</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="fix" /></td>
                                                            <td style="border-bottom: 0px;">电子邮件</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="email" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <form id="linkmanAForm">
                                    <table id="linkmanA" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">信息安全工作联络人（A角）信息</h5>
                                                <span class="fr mr5">
                                                    <input type="button" class="addManager" value="保存" /></span></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">人员信息</td>
                                                <td colspan="3" style="padding: 0">
                                                    <table width="100%" class="mytable">
                                                        <tr>
                                                            <td>姓名</td>
                                                            <td colspan="3">
                                                                 <input type="text" class="input_small userNameZW" readonly="readonly"/><input type="text" class="input_small userName" readonly="readonly"/><div class="myId"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>部门</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="dept" /></td>
                                                            <td>职务</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="post" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">办公电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="office" /></td>
                                                            <td style="border-bottom: 0px;">移动电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="mobile" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">传真</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="fix" /></td>
                                                            <td style="border-bottom: 0px;">电子邮件</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="email" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <form id="linkmanBForm">
                                    <table id="linkmanB" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">信息安全工作联络人（B角）信息</h5>
                                                <span class="fr mr5">
                                                    <input type="button" class="addManager" value="保存" /></span></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">人员信息</td>
                                                <td colspan="3" style="padding: 0">
                                                    <table width="100%" class="mytable">
                                                        <tr>
                                                            <td>姓名</td>
                                                            <td colspan="3">
                                                                 <input type="text" class="input_small userNameZW" readonly="readonly"/><input type="text" class="input_small userName" readonly="readonly"/><div class="myId"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>部门</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="dept" /></td>
                                                            <td>职务</td>
                                                            <td>
                                                                <input type="text" class="input_large" name="post" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">办公电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="office" /></td>
                                                            <td style="border-bottom: 0px;">移动电话</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="mobile" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-bottom: 0px;">传真</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_small" name="fix" /></td>
                                                            <td style="border-bottom: 0px;">电子邮件</td>
                                                            <td style="border-bottom: 0px;">
                                                                <input type="text" class="input_large" name="email" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <form id="memberForm">
                                    <table id="member" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">信息安全工作组成员信息</h5>
                                                <span class="fr mr5">
                                                    <input type="button" class="addManager" value="保存" /></span>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="lableTd t_r">人员信息</td>
                                                <td colspan="3" style="padding: 0">
                                                    <table width="100%" class="mytable">
                                                        <tr>
                                                            <td>姓名</td>
                                                            <td colspan="3">
                                                                 <textarea rows="3" cols="20" readonly="readonly" id="sp_name"></textarea><div id="sp_nameId" style="display:none"></div><div class="myId"></div></td>
                                                        </tr>
                                                        
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="mb10 t_c">
                                <input type="button" id="btnSubmit" value="保存全部" />
                                &nbsp;<input type="button" id="btndel" value="取 消" />
                                &nbsp;<div class="footer"></div>
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</body>
</html>