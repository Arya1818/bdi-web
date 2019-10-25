<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
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
<table border="1">
<tr>
	<th>번호</th>
	<th>첫번째숫자</th>
	<th>두번째숫자</th>
	<th>세번째숫자</th>
	<th>네번째숫자</th>
	<th>다섯번째숫자</th>
	<th>여섯번째숫자</th>
</tr>	
<%
String sql = "select * from lotto";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql); 
ResultSet rs = ps.executeQuery();

while(rs.next()){
	
%>

	<tr>
		<td align="center"><%=rs.getString("seq")%></td>
		<td align="center"><%=rs.getString("num1")%></td>
		<td align="center"><%=rs.getString("num2")%></td>
		<td align="center"><%=rs.getString("num3")%></td>
		<td align="center"><%=rs.getString("num4")%></td>
		<td align="center"><%=rs.getString("num5")%></td>
		<td align="center"><%=rs.getString("num6")%></td>
	</tr>
	
<%
}
%>	
	<tr>
		<td colspan="7" align="center"><a href = "/bdi-web/jsp/lotto/lotto-insert.jsp"><button>번호생성!</button></a></td>
	</tr>
	</table>
	
</body>
</html>