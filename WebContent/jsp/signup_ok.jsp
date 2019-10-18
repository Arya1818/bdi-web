<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id"); 
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");

if(id!=null){
	out.println("니가 입력한 아이디 : " + id + "<br>");
	out.println("니가 입력한 pwd : " + pwd + "<br>");
	out.println("니가 입력한 name : " + name + "<br>");
	out.println("니가 입력한 age : " + age + "<br>");
	out.println("니가 입력한 etc : " + etc + "<br>");
	
	Connection con = DBCon.getCon(); //ctrl space 두개 다 
	Statement stmt = con.createStatement();
	String sql = "insert into user_info(ui_id,ui_pwd,ui_name,ui_age,ui_etc)";
	sql += " values('" + id + "','" + pwd + "','" + name + "','" + age + "','" + etc + "')";
	int result = stmt.executeUpdate(sql); 
	if(result==1){
		out.println("회원가입완료"); //누군가 try catch를 해주고있음.
	}
	con.commit();//전화끊음(없애는게아님) 후에 다시 getCon하면 안걸려있는상태임(1핸폰 없애던가, 2다시 걸던가 해야함)
}



%>

<a href = "/bdi-web/jsp/signup.jsp">돌아가기</a>
