<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
</head>
<body>
<h2 align="center">문의게시판</h2>
	<form>
		<select name ="search">
			<option value ="1">제목</option>
			<option value ="2">작성자</option>
			<option value ="3">내용</option>
			<option value ="4">제목+작성자</option>
			<option value ="5">제목+작성자+내용</option>
		</select>
		<input type ="text" name ="searchStr"><button>검색</button>
	</form>


	<table border = "1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>등록날짜</th>
		<th>등록시간</th>
		<th>수정날짜</th>
		<th>수정시간</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>	

	
	
<%
String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");

String sql = "select * from board_info ";

if(search!=null){
	if("1".equals(search)){
		sql += "where bi_title like?";
	}else if("2".equals(search)){
		sql += "where bi_user like?";
	}else if("3".equals(search)){
		sql += "where bi_content like?";
	}else if("4".equals(search)){
		sql += "where bi_title like? or bi_user like?";
	}else if("5".equals(search)){
		sql += "where bi_title like? or bi_user like? or bi_content like?";
	}
}	
sql += " order by bi_num desc";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

if(search!=null){
	if("1".equals(search)||"2".equals(search)||"3".equals(search)){
		ps.setString(1, "%"+ searchStr +"%");
	}else if("4".equals(search)){
		ps.setString(1, "%"+ searchStr +"%");
		ps.setString(2, "%"+ searchStr +"%");
	}else if("5".equals(search)){
		ps.setString(1, "%"+ searchStr +"%");
		ps.setString(2, "%"+ searchStr +"%");
		ps.setString(3, "%"+ searchStr +"%");
	}
}

ResultSet rs = ps.executeQuery();


while(rs.next()){

%>
	<tr >
		<td><%=rs.getString("bi_num")%></td>
		<td><%=rs.getString("bi_title")%></td>
		<td><%=rs.getString("bi_user")%></td>
		<td><%=rs.getString("bi_content")%></td>
		<td><%=rs.getString("bi_credat")%></td>
		<td><%=rs.getString("bi_cretim")%></td>
		<td><%=rs.getString("bi_moddat")%></td>
		<td><%=rs.getString("bi_modtim")%></td>
		<td><a href ="/bdi-web/jsp/board/board-update.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>수정</button></a></td>
		<td><a href ="/bdi-web/jsp/board/board-delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>삭제</button></a></td>
	</tr>

<%
}
%>	
	</table>
		<a href="/bdi-web/jsp/board/board-insert.jsp"><button>등록하기</button></a>
	
</body>
</html>