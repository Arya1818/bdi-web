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
String sql = "select * from user_info order by ui_num desc";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<table border = "1">
	<th>아이디</th>
	<th>패스워드</th>
	<th>이름</th>
	<th>나이</th>
	<th>etc</th>
</tr>
<%
while(rs.next()){
	out.println("<tr>");
	out.println("<td>" + rs.getString("ui_id") + "</td>");
	out.println("<td>" + rs.getString("ui_pwd") + "</td>");
	out.println("<td>" + rs.getString("ui_name") + "</td>");
	out.println("<td>" + rs.getString("ui_age") + "</td>");
	out.println("<td>" + rs.getString("ui_etc") + "</td>");
	out.println("</tr>");
}
%>
</table> 
	<a href = "/bdi-web/jsp/user/login.jsp"><button>돌아가기</button></a> 

</body>
</html>