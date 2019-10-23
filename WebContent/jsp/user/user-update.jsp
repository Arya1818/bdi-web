<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
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
String num = request.getParameter("ui_num");

String sql = "select * from user_info where ui_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, num);
ResultSet rs = ps.executeQuery();
if(!rs.next()){   //re.next에서 나오는 값은 true or false //false일때
	out.println(num + "에 해당하는 게시물은 존재하지 않습니다.");
}else{	

%>
	<form method = "post" action = "/bdi-web/jsp/user/user-update-ok.jsp">
		<table border = "1">
			<tr>
				<th>번호</th>
				<td><%=num %></td>
			</tr>
			<tr>
				<th>아이디<br></th>
				<th><input type="text" name="ui_id" value ="<%=rs.getString("ui_id")%>"></th>
			</tr>
			<tr>
				<th>패스워드<br></th>
				<th><input type="password" name="ui_pwd" value ="<%=rs.getString("ui_pwd")%>"></th>
			</tr>
			<tr>
				<th>이름<br></th>
				<th><input type="text" name="ui_name" value ="<%=rs.getString("ui_name")%>"></th>
			</tr>
			<tr>
				<th>나이<br></th>
				<th><input type="number" name="ui_age" value ="<%=rs.getString("ui_age")%>"></th>
			</tr>
			<tr>
				<th>etc<br></th>
				<th><input type="text" name="ui_etc" value ="<%=rs.getString("ui_etc")%>"></th>
			</tr>
			<tr>
				<th>hobby<br></th>
				<th><input type="checkbox" name="hobby" value="movie">영화
					<input type="checkbox" name="hobby" value="game">게임
					<input type="checkbox" name="hobby" value="music">음악
					<input type="checkbox" name="hobby" value="drawing">그림
				</th>
			</tr>
			<tr>
				<th colspan ="2"><button>수정하기</button></th>
			</tr>
		</table>
			<input type ="hidden" name="ui_num" value ="<%=num %>">
<%
}
%>	
</form>
</body>
</html>