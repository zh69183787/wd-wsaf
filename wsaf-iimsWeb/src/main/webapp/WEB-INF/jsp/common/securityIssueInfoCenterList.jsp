<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>信息安全事件</title>
    <meta charset="utf-8" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
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
    <script src="js/json2.js"></script>
     <script src="js/f.defaultJs.js"></script>
    <script src="js/f.securityEvent.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
        	$("[name=findTime_e]").datepicker({ dateFormat:"yy-mm-dd"}).click(function(){$(".ui-state-default").removeAttr("href"); });
        	$("[name=findTime_s]").datepicker({ dateFormat:"yy-mm-dd"}).click(function(){$(".ui-state-default").removeAttr("href"); });
         
        	 $.getListDetails = function (firUrl) {
                 var _retrunstr = 0;

                 if (firUrl != "") {
                     $.ajax({
                         async: false,
                         url: firUrl + "/basicCrud/manager/all?companyId=2549",
                         type: 'post',
                         success: function (data, status, xhr) {
                             if (status == "success" && data != null) {
                                 $.each(data.result, function (entryIndex, entry) {
                                 	  if (entry.loginName == $("#myname").text())
                                     {
                                         if(entry.role == "principal")
                                           {
                                             _retrunstr = 2;
                                           }
                                 	 }

                                 });
                             }
                         }
                     });
                 }
                 return _retrunstr;
             }
        	 
            $.securityIssueSearchForm = function (firUrl, paging, isleader) {
                if (firUrl != "") {
                    var otherData="&status_in=infoDeptReview,finish";

                    $.ajax({
                        async: false,
                        url: firUrl + "/basicCrud/securityIssue/page",
                        type: 'post',
                        data: $("#projectAppform").serialize() + paging + otherData,
                        success: function (data, status, xhr) {

                            $.analyzeEventSearch(data, status, xhr, firUrl, isleader);

                            $(".topage").click(function () {
                                $.securityIssueSearchForm(firUrl, "&pageSize=16&pageNum=" + $(this).text(), isleader);

                            });

                            $(".prepage").click(function () {
                                var nowpage = parseInt($(".selected a").text());

                                if (nowpage > 1) {
                                    var topage = nowpage - 1;
                                    $.securityIssueSearchForm(firUrl, "&pageSize=16&pageNum=" + topage, isleader);
                                }
                            });

                            $(".nextpage").click(function () {
                                var nextpage = parseInt($(".selected a").text()) + 1;

                                if (nextpage <= parseInt($("#gopage").attr("max")))
                                    $.securityIssueSearchForm(firUrl, "&pageSize=16&pageNum=" + nextpage, isleader);

                            });



                            $("#gopagebtn").click(function () {
                                var topage = parseInt($("#gopage").val());

                                if (topage <= parseInt($("#gopage").attr("max")) && topage >= 1) {
                                    $.securityIssueSearchForm(firUrl, "&pageSize=16&pageNum=" + topage, isleader);
                                }
                                else {
                                    alert("超出索引值");
                                }
                            });

                        },
                        error: function () {
                            hiAlert("对不起！你的请求出现异常，请联系服务人员！", "重要提示");
                        }
                    });
                }
            }

            //解析Table
            $.analyzeEventSearch = function (data, status, xhr, firUrl, isleader) {
                if (status == "success" && data != null) {
                    $("tr.tableItem").remove();

                    if (data.success == true ) {
                        $("tr.tableItem").remove();
                        var tableItem = "", projectTypeChina = "", statusChina = "", myindex = 1;
                        $.each(data.result.content, function (entryIndex, entry) {
                            var mycount = entryIndex + 1;

                            tableItem = "<tr class=\"tableItem\"><td class=\"t_c\"><input type=\"checkbox\" id=\"test_checkbox_1\" name=\"test_checkbox_1\" /></td>";
                            tableItem += "<td>" + myindex + "</td><td>" + entry.company + "</td><td>" +entry.findTime + "【发现日期】</td><td>" + entry.relateSys +"</td><td>"+ entry.issueDescription+"</td><td>";
                            tableItem += entry.issueSource  + "</td><td>【严重程度】</td><td>"+ $("[name=issueCate] option[value=" + entry.issueCate + "]").text() + "</td><td>" + $("[name=issueSubject] option[value=" + entry.issueSubject + "]").text() + "</td><td>" + $("[name=issueItem] option[value=" + entry.issueItem + "]").text() + "</td><td>"+ entry.rectifyPlan+ "</td><td>";
                            tableItem += entry.startTime+"</td><td>"+entry.finishTime+"</td><td>"+entry.actualSituation+"【实际情况】</td><td>"+entry.rectifyRemark+"</td><td>"+entry.traceDate+"</td><td>"+entry.checkSituation+"</td><td>"+entry.traceRemark+"</td>";
                            	
                            var newpage = "securityIssueDetail",strBtn="详情";
                           
                            if (isleader==2) {
                            	
                           	 if (entry.status == "infoDeptReview") {
                           		 
                           		 if(entry.handlerLoginname == $("#myname").text())
                                  {
                                        newpage = "securityIssueReview";
                                        strBtn="审查";
                                  }
                               }
                               
                           }
                          

                            tableItem += "<td><input type=\"button\" name=\"button\" id=\"edit\" value=\""+strBtn+"\" onclick=\"window.open('" + firUrl + "/securityIssue/" + newpage + "?id=" + entry.id + "');\" \></td></tr>";

                            $(".table_1").append(tableItem);
                            myindex += 1;
                        });

                        $.setPage(data.result);
                    }
                    else 
                    {
                        for (var i = 0; i <= 16; i++) {
                            $(".table_1").append("<tr class=\"tableItem\"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
                        }
                    }
                }
            }
            
           $.getMenu({ "url": "${pageContext.request.contextPath}", "modName": "securityIssue" });
           $.userIdentity({"url":"${pageContext.request.contextPath}","companyShow":false});
           var isleader = $.getListDetails("${pageContext.request.contextPath}");

            $.securityIssueSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", isleader);

            window.onfocus = function () {
               var _page = "1";
               if ($(".selected a").length > 0 && $(".selected a").text() != "")
                    _page = $(".selected a").text();

              $.securityIssueSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=" + _page, isleader);
            }



            $("#searchbtn").click(function () {
               $.securityIssueSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", isleader);
            });

            $("#renewbtn").click(function () {
                 $("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
                 $.securityIssueSearchForm("${pageContext.request.contextPath}", "&pageSize=16&pageNum=1", isleader);
            });
        });
    </script>
</head>

<body class="Flow">
    <div class="main">
        <div class="ctrl clearfix nwarp">
            <div class="fl">
                <img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
            <div class="posi fl nwarp">
                <ul>
                    <li><a>首页</a></li>
                    <li><a>安全管理</a></li>
                    <li><a>风险防控</a></li>
                    <li class="fin">信息安全问题管理<div id="myname" style="display: none"></div>
                        <input type="text" name="reportUnitId" style="display: none" />
                    </li>
                </ul>
            </div>
        </div>
        <div class="pt45">

            <div class="filter">
                <div class="query">
                    <div class="filter_search p8">
                        <!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                        <form id="projectAppform">
                            <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="t_r">单位名称</td>
                                    <td>
                                         <input type="text" name="company_l" class="input_large"/>
                                   
                                    </td>
                                    
                                    <td class="t_r">问题描述【不确定】</td>
                                    <td>
                                        <input type="text" name="issueDescription_l" class="input_large"/>
                                          <select name="issueCate" style="display:none" class="input_large">
                                        </select>
                                         <select name="issueSubject" style="display:none" class="input_large">
                                        </select>
                                          <select name="issueItem" style="display:none" class="input_large">
                                        </select>
                                    </td>
                                    <td class="t_r">严重程度【缺字段】</td>
                                    <td> <input type="text"  class="input_large"/></td>
                                </tr>
                                <tr>
                                <td class="t_r">检查日期【不确定】</td> <td colspan="4"><input type="text" name="findTime_s"  class="input_large" readonly="readonly"/>至<input type="text" name="findTime_e"  class="input_large" readonly="readonly"/></td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="t_c">
                                        <input type="button" id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" /></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="fn clearfix">
                    <h5 class="fl"><a class="fl">信息安全问题管理</a></h5>
                
                </div>
            </div>
            <!--Filter End-->
            <!--Table-->
            <div class="mb10">
                <table width="100%" class="table_1">
                    <tbody>
                        <tr class="tit">
                            <td class=" t_c">
                            <input type="checkbox" id="test_checkbox_1" name="test_checkbox_1" /></td>
                            <td class="sort"><a><span class="fl">序号</span></a></td>
                            <td class="sort"><a><span class="fl">单位名称</span></a></td>
                            <td class="sort"><a><span class="fl">检查日期</span></a></td>
                            <td class="sort"><a><span class="fl">关系系统</span></a></td>
                            <td class="sort"><a><span class="fl">问题描述</span></a></td>
                            <td class="sort"><a class="asc desc">问题来源</a></td>
                            <td class="sort"><a><span class="fl">严重程度</span></a></td>
                            <td class="sort"><a><span class="fl">业务类型</span></a></td>
                            <td class="sort"><a><span class="fl">科目  </span></a></td>
                            <td class="sort"><a><span class="fl">科目子类  </span></a></td>
                            <td class="sort"><a><span class="fl">整改方案  </span></a></td>
                            <td class="sort"><a><span class="fl">计划开始时间 </span></a></td>
                            <td class="sort"><a><span class="fl">计划完成时间 </span></a></td>
                            <td class="sort"><a><span class="fl">完成情况  </span></a></td>
                            <td class="sort"><a><span class="fl">备注  </span></a></td>
                            <td class="sort"><a><span class="fl">跟踪日期</span></a></td>
                            <td class="sort"><a><span class="fl">复核情况</span></a></td>
                            <td class="sort"><a><span class="fl">备注</span></a></td>
                            <td class="sort"><a><span class="fl"></span></a></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr class="tfoot">
                            <td colspan="21">
                                <div class="clearfix">
                                    <span class="fl"></span>
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
