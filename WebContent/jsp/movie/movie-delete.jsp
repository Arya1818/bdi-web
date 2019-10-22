<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
삭제할 영화 번호 : <%=request.getParameter("mi_num") %>

<%
String num = request.getParameter("mi_num");
String sql = "delete from movie_info where mi_num = '" + num + "'";

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result==1){
	out.println("삭제완료");
	con.commit();
}

%>


</body>
</html>