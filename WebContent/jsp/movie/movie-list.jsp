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
<%
Connection con = DBCon.getCon();
String sql = "select * from movie_info";
// Statement stmt = con.createStatement();
// int result = stmt.executeUpdate(sql); 

PreparedStatement ps = con.prepareStatement(sql); //sql을 준비한 Statement란 의미. 이미 머릿속에 담아둠(로딩해놓음). 
												//하지만 sql이 매번 다르다면? 그냥 Statement가나음
ResultSet rs = ps.executeQuery(); 
%>

<table border = "1"> <!-- html문이 먼저 나오고 밑에 자바 -->
<tr>
	<th>번호</th>
	<th>영화제목</th>
	<th>티켓가격</th>
	<th>개봉일</th>
	<th>영화설명</th>
	<th>연령등급</th>
	<th>영화평점</th>
	<th>삭제</th>
</tr>

<%
while(rs.next()){
	out.println("<tr>");
	out.println("<td>" + rs.getString("mi_num") + "</td>");
	out.println("<td>" + rs.getString("mi_name") + "</td>");
	out.println("<td>" + rs.getString("mi_price") + "</td>");
	out.println("<td>" + rs.getString("mi_date") + "</td>");
	out.println("<td>" + rs.getString("mi_desc") + "</td>");
	out.println("<td>" + rs.getString("mi_age") + "</td>");
	out.println("<td>" + rs.getString("mi_star_rate") + "</td>");
	out.println("<td><a href = \"/bdi-web/jsp/movie/movie-delete.jsp" + "?mi_num=" + rs.getString("mi_num") + "\"><button>삭제</button></a></td>");
	out.println("</tr>");
}
%>
</table> <!-- /table이 여기에 있어야함  -->
	<a href = "/bdi-web/jsp/movie/movie-insert.jsp"><button>입력하기</button></a> <!-- context root가 bdi니까 -->


</body>
</html>
<!-- 다른 실행부라도 다 같은 메서드에 담겨있기 때문에 변수 불러오고 출력하는거 다 가능. -->