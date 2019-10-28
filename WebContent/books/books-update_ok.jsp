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

String sql ="update books_info ";
sql += "set bi_title=?, ";
sql += "bi_type=?, ";
sql += "bi_star=?, ";
sql += "bi_credat=?, ";
sql += "bi_desc=?" ;
sql += "where bi_num=?";

String biTitle = request.getParameter("bi_title");
String biType = request.getParameter("bi_type");
String biStar = request.getParameter("bi_star");
String biCredat = request.getParameter("bi_credat");
String biDesc = request.getParameter("bi_desc");
String biNum = request.getParameter("bi_num");

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,biTitle);
ps.setString(2,biType);
ps.setString(3,biStar);
ps.setString(4,biCredat);
ps.setString(5,biDesc);
ps.setString(6,biNum);

int result = ps.executeUpdate();
if(result==1){
	out.println("수정완료");
	con.commit();
}else {
	out.println("오류발생");
	con.rollback();
}

%>
</body>
</html>