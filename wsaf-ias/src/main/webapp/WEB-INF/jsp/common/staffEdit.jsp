<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>人员信息</title>
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
    <script src="js/staff.js"></script>
    <style>
        .red {
            display: inline;
            color: red;
        }

        .w90 {
            width: 90%;
        }
    </style>
    <script type="text/javascript">

        $(function () {
			$.getInitData("${pageContext.request.contextPath}");
            $.initEditPage("${pageContext.request.contextPath}");
            
			$("#unitCode_select").change(function(){  
				$("#unit").val($(this).children("option:selected").text());   
				$("#unitCode").val($(this).children("option:selected").val()); 
			}) ;
			$("#deptCode_select").change(function(){ 
				$("#dept").val($(this).children("option:selected").text()); 
				$("#deptCode").val($(this).children("option:selected").val());      
			}) ;
			
			$("#manualEntry_select").change(function(){ 
				$("#manualEntry").val($(this).children("option:selected").val());      
			}) ;


			$('#inTime').datepicker({
                inline: true,
                changeYear: true,
                changeMonth: true
            });
			
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
                                alert(info );
                                $(this).dialog("close");
                                return false;
                            }
                            var otherData = "";
                            if (QueryString.GetValue('id') != null) {
                                otherData += "&id=" + QueryString.GetValue('id');
                            }
                            $.postSaveMain("${pageContext.request.contextPath}", "staffForm", otherData, "/staff/edit");
                            $(this).dialog("close");
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

<body class="Flow">

<div class="f_bg">

    <div class="logo_1"></div>

    <div class="gray_bg">

        <div class="gray_bg2">

            <div class="w_bg">

                <div class="Bottom">

                    <div class="Top" style="min-height: 0px;">

                        <h1 class="t_c" id="title">考勤人员信息</h1>

                        <div class="mb10">
                        
                        
                            <form id="staffForm">
                            	
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                    <thead>
                                    <th colspan="4" class="f1"><h5 class="fl">基本信息</h5>
                                    </th>
                                    </thead>

                                    <tr>
                                        <td class="lableTd t_r">
                                            姓名：
                                        </td>
                                        <td >
                                            <input  id="staffName"  name="staffName" type="text" class="input_large" maxlength="30">
                                            <div class="red"> *</div>
                                        </td>
                                        <td class="lableTd t_r">
                                            人员编码：
                                        </td>
                                        <td >
                                            <input  id="staffCode" name="staffCode" type="text" class="input_large"  maxlength="30">
                                            <div class="red"> *</div>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td class="lableTd t_r">
                                            身份证号：
                                        </td>
                                      <td >
                                            <input  id="idCard"  name="idCard" type="text" class="input_large"  maxlength="30">
                                        </td>
                                         <td class="lableTd t_r">
                                            工号：
                                        </td>
                                        <td >
                                            <input id='loginName' type="text" class="input_large" name="loginName" value=""  maxlength="30"/> 
											
											
                                        </td>                                        
                                    </tr>
                                    <tr>

                                <td class="lableTd t_r">
                                            性别：
                                        </td>
                                        <td >
                                            <input type="radio" name="gender" value="male" /> 男
											
											<input type="radio" name="gender" value="female" /> 女
											<div class="red"> *</div>
                                        </td>  
                        <td class="lableTd t_r">
                                     员工性质:
                        </td>
                                <td>   <select id='staffType' name='staffType' class="input_large" >
                                          <option  value="" >请选择</option>
          								  <option  value="official">正式员工</option>
          								  <option  value="loanedPersonnel">派遣工</option>
          								  <option  value="dispatchingWorker">借调人员</option>
								           <option  value="labor"> 劳务工</option>
								           <option  value="retire">退聘人员</option>
								        </select>
								        <div class="red"> *</div>
                                </td>
                                

                                    </tr>
 							<tr>
 							 <td class="lableTd t_r">
                                            单位：
                                        </td>
                                        <td>
                                         <input id="unit_label" type="text" value="" disabled="disabled" style="width:250px"/>
                                         <!--  
       								     <select name="unitCode_select" id="unitCode_select">
                                          <option value="">请选择</option>
          								  <option value="00">集团公司本部</option>
								        </select>
								        -->
								        </td>
							 <td class="lableTd t_r">
                                            部门：
                 			 </td>
								        <td>
								         <input id="dept_label" type="text"  value="" disabled="disabled" style="width:250px"/>
								         <select name="deptCode_select" id="deptCode_select">
											<option value=''>请选择</option>
											<option value='0006'>党委办公室</option>
											<option value='0004'>工会</option>
											<option value='0008'>团委</option>
											<option value='0010'>投资管理部</option>
											<option value='0014'>组织人事部</option>
											<option value='0009'>总体规划部</option>
											<option value='0015'>审计室</option>
											<option value='0011'>财务部</option>
											<option value='0016'>运营安全监察室</option>
											<option value='0013'>企业管理发展部</option>
											<option value='0007'>办公室</option>
											<option value='0012'>合约管理部</option>
											<option value='0005'>监察室</option>
											<option value='0018'>建设管理中心</option>
											<option value='0019'>信息管理中心</option>
											<option value='0017'>保卫部</option>
											<option value="1121">上海轨道交通申松线发展有限公司</option>
                                            <option value="1123">上海轨道交通申嘉线发展有限公司</option>
                                            <option value="1122">上海轨道交通十号线发展有限公司</option>
                                            <option value="1124">上海轨道交通十二号线发展有限公司</option>
                                            <option value="1125">上海轨道交通十三号线发展有限公司</option>
								        </select>
								        
<!-- 								        <div class="red"> *</div> -->
								        
<!-- 								         <select name="deptCode" id="deptCode"> -->
<!--                                           <option value="">请选择</option> -->
<!--           								  <option value="0019">信息中心</option> -->

<!-- 								        </select> -->
<!-- 								        <div class="red"> *</div> -->
                                        </td>
 	 							</tr>
 							
 							<tr>
 							          <td class="lableTd t_r">
                                            是否人工录入：
                                        </td>
                                        <td colspan="1" >
                                            <select  name="manualEntry_select" id="manualEntry_select">
                                            <option value="">请选择</option>
                                   			 <option value="YES" >是</option>
                                   			 <option value="NO">否</option>
                                   			 </select>
                                   			 <div class="red"> *</div>
                                        </td>
 							
 							</tr>
                                     <tr>
                                        <td class="lableTd t_r">
                                            调入时间：
                                        </td>
                                        <td >
                                            <input  id="inTime" name="inTime" type="text" class="input_large" readonly="true">
                                        </td>
                                        <td colspan="2">
<!--                                       <td class="lableTd t_r">
                                            调出时间：
                                        </td>
                                        <td >
                                            <input  id="outTime" name="outTime" type="text" class="input_large" readonly="true">
                                        </td>
                                        --> 
                                    </tr>
                                    

                                    <tr>
                                        <td class="lableTd t_r">
                                            备注：
                                        </td>
                                        <td colspan="3" >
                                            <textarea  id="remark" name="remark" rows="7" class="w90"  maxlength="500"></textarea>
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" name="manualEntry" id="manualEntry">
                                <input type="hidden" name="unitCode" id="unitCode">
                                <input type="hidden" name="deptCode" id="deptCode">                                
                                <input type="hidden" name="unit" id="unit">
                                <input type="hidden" name="dept" id="dept">
                                <input type="hidden" name="id" id="id">
                                <input type="hidden" name="removed" id="removed">
                            </form>
                        </div>
                        <div class="mb10 t_c">
                            <input type="button" id="btnSubmit" value="保存"/>
<!--                             &nbsp; -->
<!--                             <input style="display: none;" type="button" id="btnStart" value="开始测评"/> -->
                            &nbsp;
                            <input type="button" id="btnClose" value="关闭"/>
                            &nbsp; </div>
                        <div class="footer"></div>
                        <div id="dialog-confirm" title="提 示" style="display:none">确认提交吗？</div>
                    </div>

                </div>

            </div>

        </div>

    </div>
</div>
</body>
</html>
