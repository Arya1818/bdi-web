<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/first.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<select name="search">
			<option value="1">제목</option>
			<option value="2">줄거리</option>
			<option value="3">제목+줄거리</option>
		</select>
			<input type="text" name="searchStr"><button>검색</button>
	</form>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>제목</th>
			<th>유형</th>
			<th>별점</th>
			<th>발행일</th>
			<th>줄거리</th>
			<th>삭제</th>
		</tr>	
	
<%
request.setCharacterEncoding("utf-8");

String sql = "select bi.bi_num, bi.bi_title, bi.bi_desc, bi.bi_star, bi.bi_credat, ";
sql += "(select bt.bt_name from books_type bt where bt.bt_num = bi.bi_type) bi_type ";
sql += "from books_info bi ";


String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");

if(search!=null){
	if("1".equals(search)){
		sql += "where bi_title like?";
	}else if("2".equals(search)){
		sql += "where bi_desc like?";
	}else if("3".equals(search)){
		sql += "where bi_title like? or where bi_desc like?";
	}
}

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql); //위치중요

if(search!=null){
	if("1".equals(search)||"2".equals(search)){
		ps.setString(1,"%"+searchStr+"%");
	}else if("3".equals(search)){
		ps.setString(1,"%"+searchStr+"%");
		ps.setString(2,"%"+searchStr+"%");
	}
}

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>	
	<tr>
		<td><%=rs.getString("bi_num") %></td>
		<td><img src ="<%=rootPath%>/imgs/bimg.jpg" width="100" height="50"></td>
		<td><a href="<%=rootPath%>/books/books-update.jsp?bi_num=<%=rs.getString("bi_num")%>"><%=rs.getString("bi_title") %></a></td>
		<td><%=rs.getString("bi_type") %></td>
		<td><%=rs.getString("bi_star") %></td>
		<td><%=rs.getString("bi_credat") %></td>
		<td><%=rs.getString("bi_desc") %></td>
		<td><a href="<%=rootPath%>/books/books-delete.jsp?bi_num=<%=rs.getString("bi_num")%>">삭제</a></td>
	</tr>	
	
<%
}
%>	
	</table>
<a href="<%=rootPath%>/books/books-insert.jsp"><button>등록하기</button></a>

</body>
</html>