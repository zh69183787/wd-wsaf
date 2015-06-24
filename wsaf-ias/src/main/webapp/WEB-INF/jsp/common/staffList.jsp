<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>人员信息列表</title>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

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
        .ui-datepicker-title span {
            display: inline;
        }

        button.ui-datepicker-current {
            display: none;
        }
    </style>
    <script type="text/javascript">
       $(document).ready(function () {
       		$.getInitData("${pageContext.request.contextPath}");
       		$.setFormData("${pageContext.request.contextPath}","list");
       		
            $.postForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");

            $("#searchbtn").click(function () {
//             	$("#deptCode").attr("disabled","false");
                $.postForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");
                
            });
            $("#renewbtn").click(function () {
             	$("#staffName").val("");
				$("#staffType").attr("value","");
                
            });


            $(document).on("click", ".del", function () {
                if (confirm("确认删除该条记录吗？")) {
                    $.ajax({ 
                        url: "${pageContext.request.contextPath}" + "/basicCrud/iasStaff/del/" + $(this).attr("mainId"),

                        type: 'post',
                        dataType: 'json',
                        success: function (data, status, xhr) {
                            if (status == "success" && data != null) {
                                if (data.success == true) {
                                    alert("操作成功！");
                                    $.postForm("${pageContext.request.contextPath}", "&pageSize=10&pageNum=1");
                                }
                                else {
                                    alert("操作失败");
                                }
                            }
                            else {
                                alert("操作失败");
                            }

                        }
                    });
                }
            });
            
			$("#deptCode_in").change(function(){ 

				 $("#deptCode").val($(this).children("option:selected").val());
			}) ;
			


        });
        

    </script>
</head>

<body class="Flow">
<div class="main">
    <div class="ctrl clearfix nwarp">
        <div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
        <div class="posi fl nwarp">
            <ul>
                <li><a>首页</a></li>
                <li><a>考勤信息管理</a></li>
                <li><a>人员信息维护</a></li>
                
            </ul>
        </div>
    </div>
<!--     <div><input id='loginName' hidden> -->
<!--     <input id='dept' hidden> -->
<!--     </div> -->
    <div class="pt45">

        <div class="filter">
            <div class="query">
                <div class="filter_search p8">
                    <!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                    <form id="staffForm">
                        <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">

<!--                                 <td class="t_r">考勤月份</td> -->
<!--                                 <td><input readonly type="text" id="month" class="input_large" -->
<!--                                            name="month"/> -->

<!--                               </td> -->
                              
                              <tr>  
                                <td class="t_r">人员姓名</td>
                                <td>
                                		<input type="text" id="staffName" class="input_large" name="staffName_l"/>
                                </td>
                                
                             		<td class="t_r">员工性质</td>
                              		<td>
                              			<select id="staffType" name="staffType" class="input_large">
                                          <option value="">请选择</option>
          								  <option value="official">正式员工</option>
          								  <option value="loanedPersonnel">派遣工</option>
          								  <option value="dispatchingWorker">借调人员</option>
								           <option value="labor"> 劳务工</option>
								           <option  value="retire">退聘人员</option>
								        </select>

       								 </td>
       						
                                
       								 <td class="t_r">单位/部门</td>
       								 
       								 <td>
								        
								         <select  id="deptCode" name="deptCode_sl" >
                                          <option value="">请选择</option>
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

       								 </td>
                                <td class="t_r"></td>
                                <td></td>
                                
                            </tr>
                           
                        </table>
                            <div class="mb10 t_c">
                                    <input type="button" id="searchbtn" value="查 询"/>&nbsp;
                                    <input type=button id="renewbtn" value="重 置"/>
                            </div>
                    </form>
                </div>
            </div>
            <div class="fn clearfix">
                <h5 class="fl"><a class="fl">人员信息</a></h5>
                <input type="button" id="addbtn" value="新 增"
                        class="fr">

                       
            </div>
        </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
            <table width="100%" class="table_1">
            <col width="4%">
            <col width="8%">
            <col width="8%">
            <col width="8%">
            <col width="15%">
            <col width="23%">
            <col width="5%">
            <col width="5%">
            <col width="12%">
            <col width="12%">
                <tbody>
                <tr class="tit">
<!--                     <td  class=" t_c"><input type="checkbox" id="test_checkbox_1" -->
<!--                                                                name="test_checkbox_1"/></td> -->
                    <td class="sort" ><a><span class="fl">序号</span></a></td>
                    <td class="sort" ><a><span class="fl">人员编码</span></a></td>
                    <td class="sort" ><a><span class="fl">工号</span></a></td>
					<td class="sort" ><a><span class="fl">姓名</span></a></td>
                    <td class="sort" ><a><span class="fl">单位</span></a></td>
                    <td class="sort" ><a><span class="fl">部门</span></a></td>
                    <td class="sort" ><a><span class="fl">员工性质</span></a></td>
                    <td class="sort" ><a><span class="fl">人工录入</span></a></td>
                    <td class="sort" ><a><span class="fl">备注</span></a></td>
					<td class="sort" ><a><span class="fl">操作</span></a></td>
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
</body>
</html>

