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
<a href="vpnResource/vpnAdd" target="test">vpnAdd</a>

<a href="projectPlan/projectMeetingList" target="test">项目计划申报表</a>

<a href="targetVersion/targetPlanList" target="test">项目年度目标计划表</a>
<a href="projectPlanTarget/projectPlanTargetList" target="test">项目目标计划导入及待发布</a>
<a href="projectplanimposed/projectImposedTargetList" target="test">项目实施计划待填报</a>
<a href="projectPlanTarget/projectPlanTargetFlow" target="test">项目实施计划填报待审核表</a>

<iframe src="#" name="test" id="test" align="MIDDLE" width="100%" height="100%" marginwidth="1" marginheight="1" frameborder="1" scrolling="Yes"></iframe>
<!-- <h2>Hello World!</h2>


<a href="vpnResource/vpnAdd" target="_blank">vpnAdd</a>

<p>
<a href="projectPlan/projectMeetingList" target="_blank">项目计划申报表</a>
</p>
<p>
<a href="targetVersion/targetPlanList" target="_blank">版本主表</a>
</p>
<p>
<a href="projectPlanTarget/projectPlanTargetList" target="_blank">导入详情表</a>
</p>
<p>
<a href="projectplanimposed/projectImposedTargetList" target="_blank">待填报</a>
</p>
<a href="projectPlanTarget/projectPlanTargetList" target="_blank">项目目标计划申报2</a>
 -->
</body>
</html>
