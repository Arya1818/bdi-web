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

String sql = "insert into board_info(bi_num,bi_title,bi_user,bi_content,bi_credat,bi_cretim,bi_moddat,bi_modtim)"
		+" values(seq_ui_num.nextval,?,?,?,TO_CHAR(SYSDATE,'YYYYMMDD'),TO_CHAR(SYSDATE,'HH24MISS'),TO_CHAR(SYSDATE,'YYYYMMDD'),TO_CHAR(SYSDATE,'HH24MISS'))";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,title);
ps.setString(2,user);
ps.setString(3,content);


int result = ps.executeUpdate();
if (result == 1) {
	out.println("등록완료");
	con.commit();
} else {
	out.println("에러발생");
	con.rollback();
}
%>
<a href = "/bdi-web/jsp/board/board-list.jsp"><button>목록보기</button></a>
</body>
</html>