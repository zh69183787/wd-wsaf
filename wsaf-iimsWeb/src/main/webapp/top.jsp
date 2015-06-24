<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<style type="text/css">
body a{float: left;padding: 5px; margin-left: 10px;}

</style>

</head>
<body>



<a href="vpnResource/vpnAdd" target="_blank">vpnAdd</a>

<a href="projectPlan/projectMeetingList" target="_blank">项目计划申报表</a>

<a href="targetVersion/targetPlanList" target="_blank">版本主表</a>

<a href="projectPlanTarget/projectPlanTargetList" target="_blank">导入详情表</a>

<a href="projectplanimposed/projectImposedTargetList" target="_blank">待填报</a>

<a href="projectPlanTarget/projectPlanTargetList" target="_blank">项目目标计划申报2</a>

</body>
</html>
