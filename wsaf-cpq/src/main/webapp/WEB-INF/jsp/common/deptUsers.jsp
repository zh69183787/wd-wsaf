<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>部门人员选择</title>
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
    <script src="js/cpqMain.js"></script>
    <script type="text/javascript">
        var zoneId = "${param.zoneId}"
        var zone = $("#" + zoneId, window.opener.document);
        //选择框初始化，将上次选择结果显示出来
        function init() {
            var loginNameArr = zone.parent("td").find("#loginNames").val()== null?[]:
                    zone.parent("td").find("#loginNames").val().split(",");
            var userNameArr = zone.parent("td").find("#userNames").val()==null?[]:
                    zone.parent("td").find("#userNames").val().split(",");

            for (var i = 0; i < loginNameArr.length; i++) {
                $(".cy").each(function (j, n) {
                    if ($(n).val() == loginNameArr[i]) {
                        $($(n).attr("checked", true));
                    }
                });
            }
            if (loginNameArr != null) {
                $("#returnValue").val(loginNameArr);
            }
            if (userNameArr != null) {
                $("#returnLabel").val(userNameArr);
            }
        }
        //响应确定按钮，返回选择结果
        function doReturn() {
            // 取得存放部门相关信息的控件
            var loginNames = document.getElementById('returnValue').value;
            var userNames = document.getElementById('returnLabel').value;
            zone.parent("td").find("#loginNames").val(loginNames);
            zone.parent("td").find("#userNames").val(userNames);
            window.close();
        }
        $(function () {
            $(document).on("click",".cy",function(){
                var key = "";
                var value = "";
                $(".cy").each(function(i,n){
                   if($(n).attr("checked")){
                       key += $(n).val()+",";
                       value += $(n).attr("label")+",";
                   }
                });
            document.getElementById("returnLabel").value = value.substr(0, value.length-1);
            document.getElementById("returnValue").value = key.substr(0, key.length-1);
            });

            $.ajax({
                url: "${pageContext.request.contextPath}" + "/ca/getDeptUser/",
                data: {"deptId": zone.val()},
                dataType: 'json',
                type: 'post',
                success: function (data, status, xhr) {
                    if (status == "success" && data != null) {
                        for (var key in data) {
                            $("#table").append("<tr><td>&nbsp;</td><td>" +
                                    "<input type='checkbox' name='checkboxes' value='" + key + "' label='" + data[key] + "' class='cy'" +
                                    "</td><td></td><td></td><td><span style='font-size:14px;'>" + data[key] + "</span></td></tr>")
                        }
                        init();
                    }
                },
                error: function () {
                    alert("对不起！你的请求出现异常，请联系服务人员！");
                }
            });
        })

    </script>
</head>
<body style="background-color: #fff;">
<div style="width:100%; overflow: auto; cursor: default; display: inline; position: absolute; height: 100%;">
    <table cellpadding='0' cellspacing='0'>
        <tr class="FixedTitleRow">
            <td><input type='text' id='returnLabel' readonly='true' size='40'/>
                <input type='hidden' id='returnValue'/>
                <input type='button' class="btn" value='确定' onclick='doReturn()'/>
                <input type='button' class="btn" value='关闭' onclick='javascript:window.close()'/>
            </td>
        </tr>
    </table>
    <div style="width:25%;float:left;">
        <table id="table">

        </table>
    </div>
</div>
</body>
</html>
