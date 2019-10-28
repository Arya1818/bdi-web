<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/first.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//String rootPath = request.getContextPath();
out.write(rootPath);
%>
<img src ="<%=rootPath%>/imgs/bimg.jpg">
</body>
</html>