<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String checkStr(String str, String targetStr){ //update화면에서 checked 되어 있어야하기때문에 선어문에 메서드 만듦
	String[] strs = str.split(",");
	for(String s:strs){
		if(s.equals(targetStr)){
			return "checked";
		}
	}
	return "";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String sq = request.getParameter("seq");
String sql = "select * from book_info where seq=?";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,sq);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
	out.println("찾을수없습니다");
}else{

%>
	<form method="post" action="/bdi-web/jsp/book/book-update_ok.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><%=rs.getString("seq")%></td> <!-- 수정폼x 그냥찍히게하려고  -->
				
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
				<input type="checkbox" name="bi_categ" value="자기계발" <%=checkStr(rs.getString("bi_categ"),"자기계발")%>>자기계발
				<input type="checkbox" name="bi_categ" value="경제경영" <%=checkStr(rs.getString("bi_categ"),"경제경영")%>>경제경영<br>
				<input type="checkbox" name="bi_categ" value="소설" <%=checkStr(rs.getString("bi_categ"),"소설")%>>소설
				<input type="checkbox" name="bi_categ" value="문학" <%=checkStr(rs.getString("bi_categ"),"문학")%>>문학	
				<input type="checkbox" name="bi_categ" value="it/컴퓨터" <%=checkStr(rs.getString("bi_categ"),"it/컴퓨터")%>>it/컴퓨터
				</td>			
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bi_title" value=<%=rs.getString("bi_title")%>></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" name="bi_writer" value=<%=rs.getString("bi_writer")%>></td>
			</tr>
			<tr>
				<th>책소개</th>
				<td><textarea name="bi_desc"><%=rs.getString("bi_desc")%></textarea></td> <!-- textarea는 조금다름! -->
			</tr>
			<tr>
				<th colspan="2"><a href="/bdi-web/jsp/book/book-update_ok.jsp"><button>수정하기</button></a></th>
			</tr>	
		</table>
	<input type="hidden" name="seq" value="<%=rs.getString("seq")%>">
	

<%
}
%>
	</form>
</body>
</html>