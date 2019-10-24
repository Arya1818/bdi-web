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
request.setCharacterEncoding("UTF-8");//request는 요청객체

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id!=null){ //빈문자열이 전송된것임?
	String sql = "select * from user_info where ui_id=? and ui_pwd=?"; //?는 자동으로 ''에 묶임. (?만) //database는 1부터 시작 
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql); //statement만들때 sql머리에 넣어놔./
	ps.setString(1,id); //첫번째 물음표에 id set하렴 , id가 unique이기 때문에 re next 한번 돌아야함 (if문에 돌려도됨)
	ps.setString(2,pwd); 
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		out.println(rs.getString("ui_name") + "님 안녕하세요~");//if(rs.next()) return true일때
	}else{
		out.println("아이디 비번 잘못 입력!!"); //if(rs.next()) return false일때
	}
	
//	out.println("니가 입력한 아이디: " + id);
}


%>

	<form method = "post" > <!-- 로그인은 예외로 post로 쓴다,  값이 가긴 하는데 주소로인해 가는게 아님 -->
		아이디 : <input type = "text" name = "id"> <br>
		비밀번호 : <input type = "password" name = "pwd"> <br>
		<button>로그인</button> <!-- 폼태그안에 있어야함 -->
	</form>
	<form method = "post" action = "/bdi-web/jsp/user/user-insert.jsp" > 
		<button>회원가입</button>
	</form>
	<form method = "post" action = "/bdi-web/jsp/user/user-list2.jsp" > 
		<button>회원정보보기</button>
	</form>
</body>
</html>