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

    <script src="js/html5.js"></script>
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="js/jquery.formalize.js"></script>
    <script src="js/cptComplain.js"></script>
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
        $(function(){ 
         var ids="${ids}";
          $("#cptComplaintList").click(function () {
               window.location.href = "<%=basePath%>cptComplaint/cptComplaintList";
            }); 
           $("#cptComplaintList1").click(function () {
               window.location.href = "<%=basePath%>cptComplaint/cptComplaintList";
            }); 
                           
         $.getFileInfo = function(firUrl,otherdata){
            if(firUrl!="")
               {
                $.ajax({
                       async: false,
                        url : firUrl+"/attach/api/all?"+otherdata,
                        type : 'get',
                        success: function(data, status, xhr) {
   
                            if (status == "success" && data != null)
                            {  
                                if (data.success == true&&data.result&&JSON.stringify(data.result) != "[]")
                                {
                                    $("#tbfj tbody tr").remove();
                                    var entry=data.result;
                                    for ( var item in entry)
                                    {
                                        
                                         $("#tbfj tbody").append("<tr name=\""+entry[item].id+"\"><td>"+entry[item].fileName+"</td><td>"+entry[item].fileSize+"</td><td>"+entry[item].uploadDate+"</td><td><a href=\"${pageContext.request.contextPath}/attach/api/download/"+entry[item].id+"\">下载</a></td></tr>");
 
                                    }
                                   
                                }
                            }
                        }
                });
               }
        }
         
          　　　　　
      
            $.getMenu("${pageContext.request.contextPath}","cptComplaint");
            $.getFileInfo("${pageContext.request.contextPath}","modelName=complaint&modelId="+${ids});

            $("#btnClose").click(function(){
                window.close();
            });
        })

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
                    <li class="fin"><a target="_blank" href="<%=basePath%>cptComplaint/cptComplaintList">监督投诉管理</a>
                    </li>               
                </ul>
            </div>
   		</div>
        <div class="pt45">
        <div class="mb10">
        <table width="100%"  class="table_1">
                             <tbody>                               
                              <tr>
                                <td class="t_r lableTd" style="font-weight:bold;">监督投诉<input type="hidden" class="ss" name="id" id="id"/></td>
                                <td colspan="3"></td>
                                </tr>
                           
                              <tr>
                                <td class="t_r lableTd">标题</td>
                                <td colspan="3"><input type="text" id="cptTitle" name="cptTitle" placeholder="" class="input_xlarge"  disabled="disabled"/></td>     
                                </tr>
                                <tr>
                                <td class="t_r lableTd">情况分类</td>
                                <td colspan="3"><select name="situation" id="situation" class="input_large" disabled="disabled" >
                                <option value="">请选择</option>
                                <option value="massWork">党群工作类</option>
                                <option value="admimBusiness">行政业务类</option>
                                <option value="disciplineSupervise">纪检监察类</option>
                                </select></td>                               
                                </tr>
                                
                                <tr>
                                <td class="t_r lableTd">附件详情   </br>(单个文件上传最大为10mb)</td>
                                <td colspan="3">   
                                 <table id="tbfj">
					                 	<tbody>
					                     	
					                 	</tbody>
					                 </table>
                                  </td>
                                </tr>
                                
                                <tr>
                                <td class="t_r lableTd">详细内容</td>
                                <td colspan="3"><textarea id="content" name="content" rows="5" placeholder="" disabled="disabled"></textarea></td>
                                </tr>
                              <tr>
                                
                               <tr>
                                <td class="t_r lableTd">联系人</td>
                                <td><input type="text" id="linkMan" name="linkMan" disabled="disabled"/></td>
                                <td class="t_r lableTd">所在部门</td>
                                <td><input type="text" id="deptName" name="deptName" disabled="disabled"/></td>
                                </tr> 
                                
                                      
                               <tr>
                                <td class="t_r lableTd">联系电话</td>
                                <td><input type="text" id="telephone" name="telephone" disabled="disabled"/></td>
                                <td class="t_r lableTd">电子邮箱</td>
                                <td><input type="text" id="email" name="email" disabled="disabled"/></td>
                               </tr> 
                              </tbody>
                              <tr class="tfoot">
                                <td colspan="4" class="t_r">
<input type="button" value="返 回" id="cptComplaintList" />
</td>

                              </tr>
                            </table>

      </div>
        <!--Table End-->
    	</div>
</div>
</body>

</body>
</html>
