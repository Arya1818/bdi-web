<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp" %> <!-- first.jsp의 코드를 가져와서 java파일로 만듦 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=str %>
<img src="/bdi/imgs/bimg.jpg">
</body>
</html>

<!-- 
jsp 절대경로  jsp는 web Content 부터 (내 프로젝트가 있는 경로부터) 절대경로 
html 절대경로  bid-web부터 절대경로

include 사용해야하는 곳이 다르기때문에 두개가 존재함
-->