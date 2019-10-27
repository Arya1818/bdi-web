<%@page import="java.sql.ResultSet"%>
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
	<h2 align="center">신간리스트</h2>
	
	<form>
		<select name="search">
			<option value="1">카테고리</option>
			<option value="2">제목</option>
			<option value="3">저자</option>
			<option value="4">책소개</option>
			<option value="5">제목+책소개</option>
			<option calue="6">제목+저자+책소개</option>
		</select>
		<input type="text" name="searchStr"><button>검색</button>
	</form>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>저자</th>
			<th>책소개</th>
			<th>삭제</th>
		</tr>
	
<%
String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");

request.setCharacterEncoding("utf-8");
String sql = "select * from book_info "; //띄어쓰기중요


if(search!=null){
	if("1".equals(search)){
		sql += "where bi_categ like?";
	}else if("2".equals(search)){
		sql += "where bi_title like?";
	}else if("3".equals(search)){
		sql += "where bi_writer like?";
	}else if("4".equals(search)){
		sql += "where bi_desc like?";
	}else if("5".equals(search)){
		sql += "where bi_title like? or bi_desc like?";
	}else if("6".equals(search)){
		sql += "where bi_title like? or bi_writer like? or bi_desc like?";
	}
}

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

if(search!=null){
	if("1".equals(search)||"2".equals(search)||"3".equals(search)||"4".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
	}else if("5".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
		ps.setString(2,"%" + searchStr + "%");
	}else if("6".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
		ps.setString(2,"%" + searchStr + "%");
		ps.setString(3,"%" + searchStr + "%");
	}
}


ResultSet rs = ps.executeQuery();

while(rs.next()){
	
%>
	<tr>
		<td><%=rs.getString("seq")%></td>
		<td><%=rs.getString("bi_categ")%></td>
		<td><a href="/bdi-web/jsp/book/book-update.jsp?seq=<%=rs.getString("seq")%>"><%=rs.getString("bi_title")%></a></td>
		<td><%=rs.getString("bi_writer")%></td>
		<td><%=rs.getString("bi_desc")%></td>
		<td><a href="/bdi-web/jsp/book/book-delete.jsp?seq=<%=rs.getString("seq")%>"><button>삭제</button></a></td>
	</tr>
<%
}
%>
	</table>
	<a href="/bdi-web/jsp/book/book-insert.jsp">등록하기</a>
</body>
</html>