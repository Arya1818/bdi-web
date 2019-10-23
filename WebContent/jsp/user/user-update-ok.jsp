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

	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("ui_id");
	String pwd = request.getParameter("ui_pwd");
	String name = request.getParameter("ui_name");
	String age = request.getParameter("ui_age");
	String etc = request.getParameter("ui_etc");
	String num = request.getParameter("ui_num");
	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "";
	for(int i=0; i<hobbies.length; i++){
		hobby += hobbies[i]+",";
	}
	hobby = hobby.substring(0,hobby.length()-1);
	
	String sql = "update user_info set ui_id=?, ui_pwd=?, ui_name=?, ui_age=?, ui_etc=?, hobby=? where ui_num=?";
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql);

	
	ps.setString(1,id);
	ps.setString(2,pwd);
	ps.setString(3,name);
	ps.setString(4,age);
	ps.setString(5,etc);
	ps.setString(6,num);
	ps.setString(7,hobby);

	int result = ps.executeUpdate();
	if (result == 1) {
		out.println("수정완료");
		con.commit();
	} else {
		out.println("에러발생");
		con.rollback();
	}
%>

<a href = "/bdi-web/jsp/user/login.jsp"><button>로그인하기</button></a>
<a href = "/bdi-web/jsp/user/user-list2.jsp"><button>회원목록보기</button></a>
</body>
</html>