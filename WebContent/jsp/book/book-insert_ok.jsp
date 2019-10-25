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
String sql = "insert into book_info(seq,bi_categ,bi_title,bi_writer,bi_desc)";
sql += "values(seq_book_info_num.nextval,?,?,?,?)";

String biCateg = request.getParameter("bi_categ");
String biTitle = request.getParameter("bi_title");
String biWriter = request.getParameter("bi_writer");
String biDesc = request.getParameter("bi_desc");

Connection con = DBCon.getCon(); //디비콘에 연결한다(서버연결)
PreparedStatement ps = con.prepareStatement(sql); //준비한 sql문을 ps에 대입 

ps.setString(1,biCateg);//sql문의 ?에 set함
ps.setString(2,biTitle);
ps.setString(3,biWriter);
ps.setString(4,biDesc);

int result = ps.executeUpdate();
if(result==1){
	out.println("등록완료");
	con.commit();
}else{
	out.println("등록이실패하였습니다.");
	con.rollback();
}

%>
</body>
</html>