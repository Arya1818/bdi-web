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
request.setCharacterEncoding("utf-8");

String sql = "delete from book_info where seq=?";

String bInum = request.getParameter("seq");

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bInum);

int result = ps.executeUpdate();
if(result==1){
	out.println("삭제완료");
	con.commit();
}else{
	out.println("오류가발생했습니다");
	con.rollback();
}
%>

<a href="/bdi-web/jsp/book/book-list.jsp">돌아가기</a>
</body>
</html>