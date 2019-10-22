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
		String num = request.getParameter("mi_num");
		String name = request.getParameter("mi_name");
		String price = request.getParameter("mi_price");
		String date = request.getParameter("mi_date");
		date = date.replace("-", "");
		String desc = request.getParameter("mi_desc");
		String age = request.getParameter("mi_age");
		String star_rate = request.getParameter("mi_star_rate");

		// if(num!=null){
		// 	out.println("니가 입력한 번호 : " + num + "<br>");
		// 	out.println("니가 입력한 영화제목 : " + name + "<br>");
		// 	out.println("니가 입력한 티켓가격 : " + price + "<br>");
		// 	out.println("니가 입력한 개봉일 : " + date + "<br>");
		// 	out.println("니가 입력한 영화설명 : " + desc + "<br>");
		// 	out.println("니가 입력한 연령등급 : " + age + "<br>");
		// 	out.println("니가 입력한 영화평점 : " + star_rate + "<br>");
		String sql = "insert into movie_info(mi_num,mi_name,mi_price,mi_date,mi_desc,mi_age,mi_star_rate)";
		sql += " values('" + num + "','" + name + "','" + price + "','" + date + "','" + desc + "','" + age + "','"
				+ star_rate + "')";
		System.out.println(sql);
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement();
		int result = stmt.executeUpdate(sql);
		if (result == 1) {
			out.println("영화등록완료");
			con.commit();
		} else {
			out.println("에러발생");
			con.rollback();
		}
	%>

</body>
</html>