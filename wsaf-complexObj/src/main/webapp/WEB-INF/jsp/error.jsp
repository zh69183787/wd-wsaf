<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="org.apache.commons.logging.*" %> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<cw:base></cw:base>
</head>
<!-- <script type="text/javascript"> -->
// 	alert("错误");
// 	window.close();

<!-- </script>	 -->
<body> 
出错啦，请重新登录！
<% 
Log log = LogFactory.getLog("error.jsp"); 
log.error("error.jsp 调用 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!-----------------------------"); 
response.sendRedirect("/index.html"); 
%> 
</body>
</html>