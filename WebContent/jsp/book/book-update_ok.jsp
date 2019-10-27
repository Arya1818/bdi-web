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

String sql = "update book_info";
sql += " set bi_categ=?,";
sql += " bi_title=?,";
sql += " bi_writer=?,";
sql += " bi_desc=?"; //""랑 , 찍는거 유의하기!!
sql += " where seq=?";


String bi_categs[] = request.getParameterValues("bi_categ");
String bi_categ="";
for(int i=0;i<bi_categs.length;i++){
	bi_categ += bi_categs[i]+",";
}
String biCateg = bi_categ.substring(0,bi_categ.length()-1);
String biTitle = request.getParameter("bi_title");
String biWriter = request.getParameter("bi_writer");
String biDesc = request.getParameter("bi_desc");
String seQ = request.getParameter("seq");



Connection con = DBCon.getCon(); //디비콘에 연결한다(서버연결)
PreparedStatement ps = con.prepareStatement(sql); //준비한 sql문을 ps에 대입 


ps.setString(1,biCateg);//sql문의 ?에 set함
ps.setString(2,biTitle);
ps.setString(3,biWriter);
ps.setString(4,biDesc);
ps.setString(5,seQ);

int result = ps.executeUpdate();
if(result==1){
	out.println("수정완료");
	con.commit();
}else{
	
	out.println("수정이실패하였습니다.");
	con.rollback();
}

%>
<a href="/bdi-web/jsp/book/book-list.jsp">목록보기</a>
</body>
</html>