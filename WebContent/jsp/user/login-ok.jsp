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
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id!=null){ //빈문자열이 전송된것임
	String sql = "select * from user_info where ui_id = ? and ui_pwd = ?"; //자동으로 ''에 묶임, ?만
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,id); //첫번째 물음표에 id set하렴 , id가 unique이기 때문에 re next 한번 돌아야함 (if문에 돌려도됨)
	ps.setString(2,pwd); 
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		out.println(rs.getString("ui_name") + "님 안녕하세요~");
	}else{
		out.println("아이디 비번 잘못 입력!!");
	}
	
//	out.println("니가 입력한 아이디: " + id);
}
%>
</body>
</html>