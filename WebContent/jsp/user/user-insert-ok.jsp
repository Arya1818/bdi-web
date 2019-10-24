<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
		String[] hobbies = request.getParameterValues("hobby"); //hobby라는 파라메터를 가져와라. request는 변수.
		String hob = "";
		for(int i=0; i<hobbies.length; i++){
			hob += hobbies[i]+",";
		}
		hob = hob.substring(0,hob.length()-1);
		out.println(hob);
	
		String id = request.getParameter("ui_id"); //""라면 null 값이 돈다.
		String pwd = request.getParameter("ui_pwd");
		String name = request.getParameter("ui_name");
		String age = request.getParameter("ui_age");
		String etc = request.getParameter("ui_etc");
//		String hob = request.getParameter("hobby");

		
		String sql = "insert into user_info(ui_num,ui_id,ui_pwd,ui_name,ui_age,ui_etc,hobby)"
						+" values(seq_ui_num.nextval,?,?,?,?,?,?)";
//		System.out.println(sql);
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,pwd);
		ps.setString(3,name);
		ps.setString(4,age);
		ps.setString(5,etc);
		ps.setString(6,hob);

		int result = ps.executeUpdate();
		if (result == 1) {
			out.println("회원가입완료");
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