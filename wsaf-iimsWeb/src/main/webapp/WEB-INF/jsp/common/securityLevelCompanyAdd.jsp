<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>单位基础信息</title>
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
    <script src="js/f.defaultJs.js"></script>
    <script src="js/f.securityLevel.js"></script>
    

    <script type="text/javascript">
        $(function () {
        	$.postsecurityLevelCompanyDetail = function(firUrl,otherData){
      			 if(firUrl!="")
      			   {	
      					 $.ajax({
      						   async: false,
      						    url : firUrl+"/basicCrud/securityLevelCompany/all",
      						    data: otherData,
      						    datatype:'json',
      						    type : 'post',
      							success: function(data, status, xhr) {     		
      								if (status == "success" && data.result[0]!= null)
      								{
      									 var entry = data.result[0];

                                         $("#mycompany").val(data.result[0].company);
                                         
                                         $("#company_Id").text(data.result[0].companyId);
                                         $("#my_Id").text(data.result[0].id);
                                         
                                         for (var item in entry) {
                                             try {
                                                 if ($("[name=" + item + "]").length > 0) {
                                                     if (entry[item] == "other" && $("input[name=" + item + "Other]").length > 0) {
                                                         $("[name=" + item + "]").parent("td").attr("colspan", "1");
                                                         $("input[name=" + item + "Other]").parent().css("display", "table-cell");
                                                         $("input[name=" + item + "Other]").parent().prev().css("display", "table-cell");
                                                     }

                                                     $("[name=" + item + "]").val(entry[item]);
                                                 }
                                             }
                                             catch (e) {
                                                 alert(e);
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
        	
        	$.getMenu({"url":"${pageContext.request.contextPath}", "modName":"securityLevelCompany"});
        	$.userIdentity({"url":"${pageContext.request.contextPath}"});
        	//$.postManager("${pageContext.request.contextPath}", "&companyId=" + $("#company_Id").text() + "&role=principal");

        	$.postsecurityLevelCompanyDetail("${pageContext.request.contextPath}","companyId="+$("#company_Id").text());
        	
        	
        	$("#btnSubmit").click(function () {
                var otherData = "", totalNum = 0;

                var yanzhen = "";
                var _obj = $("input[type=text]"), _obj2 = $("select");
                for (var i = 0; i < _obj.length; i++) {
                    if ($(_obj[i]).css("display") != "none" && $(_obj[i]).parents("tr").css("display") != "none" && $(_obj[i]).parent("td").css("display") != "none" && $(_obj[i]).attr("disabled") != "disabled") {
                        if ($(_obj[i]).val() == null || $(_obj[i]).val() == "") {
                            if ($(_obj[i]).attr("readonly") == "readonly") {
                                yanzhen += "单位负责人信息(" + $(_obj[i]).parent("td").prev("td").text().trim() + ")为空，请联系管理人员配置\r";
                            }
                            else
                                if ($(_obj[i]).parent("td").prev("td").find("select").length == 0 && $(_obj[i]).attr("id") != "otherName" && $(_obj[i]).attr("id") != "otherSysServicesName" && $(_obj[i]).parent("td").prev("td").length > 0) {
                                    yanzhen += $(_obj[i]).parent("td").prev("td").text().trim() + "不能为空\r";
                                }
                        }
                    }

                }
                for (var j = 0; j < _obj2.length; j++) {
                    if ($(_obj2[j]).css("display") != "none" && $(_obj2[j]).parents("tr").css("display") != "none" && $(_obj2[j]).parent("td").css("display") != "none" && $(_obj2[j]).attr("disabled") != "disabled") {
                        if ($(_obj2[j]).val() == null || $(_obj2[j]).val() == "") {
                            if ($(_obj2[j]).parent("td").prev("td").find("input").length > 0 && $(_obj2[j]).attr("id") != "otherHas" && $(_obj2[j]).parent("td").prev("td").prev("td").length > 0) {
                                yanzhen += $(_obj2[j]).parent("td").prev("td").prev("td").text().trim() + "使用国产品率必须选择一个\r";
                            }
                            else {
                                if ($(_obj2[j]).parent("td").prev("td").find("select").length == 0 && $(_obj2[j]).parent("td").prev("td").length > 0)
                                    yanzhen += $(_obj2[j]).parent("td").prev("td").text().trim() + "必须选择一个\r";
                            }
                        }
                    }

                }

                if (yanzhen != "") {
                    alert(yanzhen);
                    return false;
                }
                
                if($("#my_Id").text()!=null&&$("#my_Id").text()!="")
                	otherData+="&id="+$("#my_Id").text();
                		
            	$.postSave({"url":"${pageContext.request.contextPath}","formName":"projectPlanForm","isGetData":true,"modname":"securityLevelCompany","otherData":otherData+"&companyId="+$("#company_Id").text()+"&company="+$("#mycompany").val(),"isClose":true});
            });

            $("#btndel").click(function () {
                window.close();

                location.href = "${pageContext.request.contextPath}/securityLevelCompany/securityLevelCompanyList";
            });

            $("select").change(function () {
                var _str = $(this).attr("name") + "Other";

                if ($(this).val() == "other") {
                    if ($("input[name=" + _str + "]").length > 0) {
                        if ($("input[name=" + _str + "]").parents(".mytable").length > 0) {
                            $("input[name=" + _str + "]").css("display", "inline");
                        }
                        else {
                            $(this).parent("td").attr("colspan", "1");
                            $("input[name=" + _str + "]").parent().css("display", "table-cell");
                            $("input[name=" + _str + "]").parent().prev().css("display", "table-cell");
                        }
                    }
                }
                else {
                    if ($("input[name=" + _str + "]").length > 0) {

                        $(this).parent("td").attr("colspan", "3");
                        $("input[name=" + _str + "]").parent().css("display", "none");
                        $("input[name=" + _str + "]").parent().prev().css("display", "none");

                    }
                }
            });
        })
    </script>
</head>

<body class="Flow">

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
                                单位基础信息</h1>

                            <div class="mb10">
                                <form id="projectPlanForm">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2">
                                        <thead>
                                            <th colspan="4" class="f1">
                                                <h5 class="fl">单位基本情况</h5>
                                            </th>
                                        </thead>
                                        <tr>
                                            <td class="lableTd t_r">单位名称</td>
                                            <td colspan="3">
                                                <input type="text" class="input_large" id="mycompany" />
                                                <div id="company_Id" style="display:none;"></div>
                                                 <div id="my_Id" style="display:none;"></div>
                                                </td>
                                        </tr>
                                        <tr class="companyAddress">
                                            <td class="lableTd t_r">单位地址</td>
                                            <td colspan="3">
                                                <input type="text" name="companyProvince" class="input_small" maxlength="20">
                                                省(自治区、直辖市)<input type="text" name="companyCity" class="input_small" maxlength="20">
                                                地(区、市、州、盟)<input type="text" name="companyCounty" class="input_small" maxlength="20">
                                                县(区、市、旗)</td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">邮政编码</td>
                                            <td>
                                                <input type="text" class="input_small" name="zipCode" maxlength="20" /></td>
                                            <td class="lableTd t_r">行政区划代码</td>
                                            <td>
                                                <input type="text" class="input_small" name="addressCode" maxlength="20" /></td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">单位负责人</td>
                                            <td colspan="3" style="padding: 0">
                                                <table width="100%" class="mytable">
                                                    <tr>
                                                        <td>姓名</td>
                                                        <td>
                                                            <input type="text" class="input_small" name="leaderName"  /></td>
                                                        <td>职务/职称</td>
                                                        <td>
                                                            <input type="text" class="input_small" name="leaderPost"  /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>办公电话</td>
                                                        <td>
                                                            <input type="text" class="input_small" name="leaderPhone" /></td>
                                                        <td>电子邮件</td>
                                                        <td>
                                                            <input type="text" class="input_large" name="leaderEmail" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-bottom: 0px;">移动电话</td>
                                                        <td style="border-bottom: 0px;" colspan="3">
                                                            <input type="text" class="input_small" name="leaderMobile" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="lableTd t_r">隶属关系 </td>
                                            <td colspan="3">
                                                <select name="subordinateRelation" class="input_large"></select></td>
                                            <td class="lableTd t_r" style="display: none">隶属关系其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="subordinateRelationOther" maxlength="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">单位类型</td>
                                            <td colspan="3">
                                                <select name="companyType" class="input_large"></select></td>
                                            <td class="lableTd t_r" style="display: none">单位类型其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="companyTypeOther" maxlength="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableTd t_r">行业类别</td>
                                            <td colspan="3">
                                                <select name="businessCategory" class="input_large"></select></td>
                                            <td style="display: none" class="lableTd t_r">行业类别其他内容 </td>
                                            <td style="display: none">
                                                <input type="text" class="input_small" name="businessCategoryOther" maxlength="20" />
                                            </td>
                                        </tr>
                                     
                                    </table>
                                </form>
                            </div>
                            <div class="mb10 t_c">
                                <input type="button" id="btnSubmit" value="提 交" />
                                &nbsp;
                                <input type="button" id="btndel" value="取 消" />
                                &nbsp;
                             
                            </div>
                            <div class="footer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
