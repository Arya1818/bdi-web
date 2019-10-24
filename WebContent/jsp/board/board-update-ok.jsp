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
<%
request.setCharacterEncoding("utf-8");
//String title = request.getParameter("bi_title");
String[] titles = request.getParameterValues("bi_title");
String title = "";
for(int i=0; i<titles.length; i++){
	title += titles[i]+",";
}
title = title.substring(0,title.length()-1);

String user = request.getParameter("bi_user");
String content = request.getParameter("bi_content");
String num = request.getParameter("bi_num");

String sql = "update board_info";
sql += " set bi_title=?,";
sql += " bi_user=?,";
sql += " bi_content=?,";
sql += " bi_moddat=TO_CHAR(SYSDATE,'YYYYMMDD'),";
sql += " bi_modtim=TO_CHAR(SYSDATE,'HH24MISS')";
sql += " where bi_num=?";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,title);
ps.setString(2,user);
ps.setString(3,content);
ps.setString(4,num);

int result = ps.executeUpdate();
if (result == 1) {
	out.println("수정완료");
	con.commit();
} else {
	out.println("에러발생");
	con.rollback();
}

%>
<a href = "/bdi-web/jsp/board/board-list.jsp"><button>회원목록보기</button></a>
</body>
</html>