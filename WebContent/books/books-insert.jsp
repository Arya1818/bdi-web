<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = DBCon.getCon();
String sql = "select * from books_type order by bt_num";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>


<form method="post" action="<%=rootPath%>/books/books-insert_ok.jsp">
	<table border="1">
		<tr>
			<th>이미지</th>
			<td><img src ="<%=rootPath%>/imgs/bimg.jpg" width="100" height="50"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="bi_title"></td>
		</tr>
		<tr>
			<th>유형</th>
			<td><select name="bi_type">
				<%
				while(rs.next()){				
				%>
				<option value="<%=rs.getString("bt_num")%>"> <%=rs.getString("bt_name")%></option>
				<%
				}
				%>
				</select></td>
		</tr>
		<tr>
			<th>별점</th>
			<td><input type="text" name="bi_star"></td>
		</tr>
		<tr>
			<th>발행일</th>
			<td><input type="text" name="bi_credat"></td>
		</tr>
		<tr>
			<th>줄거리</th>
			<td><textarea name="bi_desc"></textarea></td>
		</tr>
		<tr>
			<th colspan="2"><button>입력하기</button></th>
		</tr>
	</table>
	
</form>
</body>
</html>