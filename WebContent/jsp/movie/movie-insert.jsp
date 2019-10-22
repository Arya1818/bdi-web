<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "get" action ="/bdi-web/jsp/movie/movie-insert-ok.jsp">
		번호:<input type ="number" name ="mi_num"><br>
		영화제목:<input type ="text" name ="mi_name"><br>
		티켓가격:<input type ="number" name ="mi_price"><br>
		개봉일:<input type ="date" name ="mi_date"><br>
		영화설명:<input type ="text" name ="mi_desc"><br>
		연령등급:<input type ="number" name ="mi_age"><br>
		영화평점:<input type ="number" name ="mi_star_rate"><br>
		<button>입력</button>
	</form>


</body>
</html>