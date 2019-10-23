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
<title>Insert title here</title>
</head>
<body>

	<form> <!-- 안넣어주면get -->
		<select name = "search">
			<option value ="ui_name"> 이름</option>
			<option value ="ui_id"> 아이디</option>
			<option value ="ui_age"> 나이</option>
		</select> : <input type ="text" name ="searchStr"><button>검색</button>
	</form>

	<table border = "1"> <!-- html문이 먼저 나오고 밑에 자바 --> 
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
		<th>나이</th>
		<th>etc</th>
		<th>hobby</th>
	</tr>
<%
String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");

String uiId = request.getParameter("ui_id");
String sql = "select * from user_info ";
if(search!=null){
	if("ui_name".equals(search)){
		sql += "where ui_name like?";
	}else if("ui_id".equals(search)){
		sql += "where ui_id like?";
	}else if("ui_age".equals(search)){
		sql += "where ui_age like?";
	}
}	
sql += " order by ui_num asc";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
if(search!=null){ //더 정확하게 하려고 추가해줌
	if("ui_name".equals(search)||"ui_id".equals(search)||"ui_age".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
	}
}	
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>
	<tr>
		<th><%=rs.getString("ui_num")%></th>
		<th><a href ="/bdi-web/jsp/user/user-update.jsp?ui_num=<%=rs.getString("ui_num")%>"><%=rs.getString("ui_id")%></a></th>
		<th><%=rs.getString("ui_pwd")%></th>
		<th><%=rs.getString("ui_name")%></th>
		<th><%=rs.getString("ui_age")%></th>
		<th><%=rs.getString("ui_etc")%></th>
		<th><%=rs.getString("hobby") %></th>
	</tr>
<%
}
%>

	</table> 
		<a href = "/bdi-web/jsp/user/login.jsp"><button>돌아가기</button></a> 

</body>
</html>