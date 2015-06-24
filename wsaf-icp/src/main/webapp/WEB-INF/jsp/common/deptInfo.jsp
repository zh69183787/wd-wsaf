<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <base href="<%=basePath%>">

    <title>部门选择</title>
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
        var deptIdId = "${param.deptIdId}"
        var deptNameId = "${param.deptNameId}"
        var deptCountId = "${param.deptCountId}"
        var zone = $("#" + zoneId, window.opener.document);
        var deptId = $("#" + deptIdId, window.opener.document);
        var deptName = $("#" + deptNameId, window.opener.document);
        var deptCount = $("#" + deptCountId, window.opener.document);
        var flag = false;
        if(deptCount.length > 0){
            flag = true;
        }

        function allClick(){
            $(".cy").attr("checked",true);
            var key = "";
            var value = "";
            $(".cy").each(function (i, n) {
                if ($(n).attr("checked")) {
                    key += $(n).val() + ",";
                    value += $(n).attr("label") + ",";
                }
            });
            document.getElementById("returnLabel").value = value.substr(0, value.length - 1);
            document.getElementById("returnValue").value = key.substr(0, key.length - 1);
        }

        function notClick(){
            $(".cy").each(function(i,n){
                $(n).attr("checked",!$(n).attr("checked"));
            })
            var key = "";
            var value = "";
            $(".cy").each(function (i, n) {
                if ($(n).attr("checked")) {
                    key += $(n).val() + ",";
                    value += $(n).attr("label") + ",";
                }
            });
            document.getElementById("returnLabel").value = value.substr(0, value.length - 1);
            document.getElementById("returnValue").value = key.substr(0, key.length - 1);
        }

        //选择框初始化，将上次选择结果显示出来
        function init() {
            var loginNameArr = deptId.val() == null ? [] :
                    deptId.val().split(",");
            var userNameArr = deptName.val() == null ? [] :
                    deptName.val().split(",");

            //被测评部门
            if(flag){
                var countArr = deptCount.val()==null?[]:
                        deptCount.val().split(",");
            }

            for (var i = 0; i < loginNameArr.length; i++) {
                $(".cy").each(function (j, n) {
                    if ($(n).val() == loginNameArr[i]) {
                        $($(n).attr("checked", true));
                    }
                    //被测评部门
                    if(flag){
                       if(countArr[i].indexOf($(n).val()+"[") >=0 ){
                           var reg = eval("/"+$(n).val()+"\\[(\\d+)\\]/");
                           $(n).parent().parent("tr").find(":text[name=count]").val((countArr[i].match(reg))[1]);
                       }
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

        function checkNum(obj){
            var r = /^[1-9]{1}\d*$/;
            if(!r.test(obj.value)){
                alert('请输入一个大于0的整数！');
                obj.value = 10;
                obj.focus();
            }
        }

        //响应确定按钮，返回选择结果
        function doReturn() {
            // 取得存放部门相关信息的控件
            var loginNames = document.getElementById('returnValue').value;
            var userNames = document.getElementById('returnLabel').value;

            deptId.val(loginNames);
            deptName.val(userNames);

            if(flag) {
                var returnCount = "";
                $(".cy").each(function (i, n) {
                    if ($(n).attr("checked")) {
                        returnCount += $(n).val() + "[" + $(n).parent().parent("tr").find(":text[name=count]").val() + "]" + ","
                    }
                });
                if (returnCount.length > 0) {
                    returnCount = returnCount.substr(0,returnCount.length-1);
                }
                deptCount.val(returnCount);
            }
            window.close();
        }
        $(function () {
            $(document).on("click", ".cy", function () {
                var key = "";
                var value = "";
                var count = "";
                $(".cy").each(function (i, n) {
                    if ($(n).attr("checked")) {
                        key += $(n).val() + ",";
                        value += $(n).attr("label") + ",";
                    }
                });
                document.getElementById("returnLabel").value = value.substr(0, value.length - 1);
                document.getElementById("returnValue").value = key.substr(0, key.length - 1);
            });

            $.ajax({
                url: "${pageContext.request.contextPath}" + "/ca/getDeptInfo/",
                data:
                {
                    "rootId": zone.val(),
                    "type": flag?"1":"0"
                },
                dataType: 'json',
                type: 'post',
                success: function (data, status, xhr) {
                    if (status == "success" && data != null) {
                            for (var key in data) {
                                var addHtml = "<tr><td>&nbsp;</td><td>" +
                                        "<input type='checkbox' name='checkboxes' value='" + (data[key]).id + "' label='" + (data[key]).name + "' class='cy'" +
                                        "</td><td></td><td></td><td><span style='font-size:14px;'>" + (data[key]).name + "</span></td>";
                                if(flag){
                                    addHtml += "<td></td><td><span style='font-size:14px;'>名额：</span>" +
                                            "</td><td><input onblur='checkNum(this);' class='input_small' type='text' name='count' value='10'></td>"
                                }
                                addHtml += "</tr>";
                                $("#table").append(addHtml)
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
                <input type='button' class="btn" value='全选' onclick='allClick()'/>
                <input type='button' class="btn" value='反选' onclick='notClick()'/>
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
