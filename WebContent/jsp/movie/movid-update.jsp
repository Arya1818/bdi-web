<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Statement"%>
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
	<table border = "1">
		<form method = "get" action ="/bdi-web/jsp/movie/movie-update-ok.jsp">
	<tr>
		<th>수정할 영화 번호 : <%=request.getParameter("mi_num") %></th>
	</tr>
	<tr>
		<th>별점을 재입력 해주세요</th>
		<th><input type ="number" name ="mi_star_rate"></th>
	</tr>
		<button>입력</button>
		</form>
</table>
<%
String num = request.getParameter("mi_num");
String star_rate = request.getParameter("mi_star_rate");
String sql = "update movie_info set mi_star_rate ="+ star_rate + "where mi_num =" + num;



Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result==1){
	out.println("수정완료");
	con.commit();
}
%>

</body>
</html>