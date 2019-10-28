<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
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
String sq = request.getParameter("bi_num");
String sql = "select * from books_info where bi_num=?";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,sq);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
	out.println("찾을수없습니다");
}else{

%>
<form method="post" action="<%=rootPath%>/books/books-update_ok.jsp">
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%=rs.getString("bi_num") %></td>
			
		</tr>
		<tr>
			<th>이미지</th>
			<td><img src ="<%=rootPath%>/imgs/bimg.jpg" width="100" height="50"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="bi_title" value=<%=rs.getString("bi_title") %>></td>
		</tr>
		<tr>
			<th>유형</th>
			<td><input type="text" name="bi_type" value=<%=rs.getString("bi_type") %>></td>
		</tr>
		<tr>
			<th>별점</th>
			<td><input type="text" name="bi_star" value=<%=rs.getString("bi_star") %>></td>
		</tr>
		<tr>
			<th>발행일</th>
			<td><input type="text" name="bi_credat" value=<%=rs.getString("bi_credat") %>></td>
		</tr>
		<tr>
			<th>줄거리</th>
			<td><textarea name="bi_desc"><%=rs.getString("bi_desc") %></textarea></td>
		</tr>
		<tr>
			<th colspan="2"><button>입력하기</button></th>
		</tr>
	</table>
	<input type="hidden" name="bi_num" value="<%=rs.getString("bi_num") %>">
	
</form>



<%
}
%>
</body>
</html>