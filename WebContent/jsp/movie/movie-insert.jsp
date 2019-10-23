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
	<table border = "1">
		<tr>	
			<th>번호<br></th>
			<th><input type ="number" name ="mi_num"></th>
		</tr>
		<tr>
			<th>영화제목<br></th>
			<th><input type ="text" name ="mi_name"></th>
		</tr>
		<tr>
			<th>티켓가격<br></th>
			<th><input type ="number" name ="mi_price"></th>
		</tr>
		<tr>
			<th>개봉일<br></th>
			<th><input type ="date" name ="mi_date"></th>
		</tr>
		<tr>
			<th>영화설명<br></th>
			<th><input type ="text" name ="mi_desc"></th>
		</tr>
		<tr>
			<th>연령등급<br></th>
			<th><input type ="number" name ="mi_age"></th>
		</tr>
		<tr>
			<th>영화평점<br></th>
			<th><input type ="number" name ="mi_star_rate"></th>
		</tr>
		</table>
			
		<button>입력</button> <!-- 폼태그안에있어야함  -->
	</form>
</body>
</html>