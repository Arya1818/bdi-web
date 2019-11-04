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

	<form method = "post" id="loginForm" action="/bdi-web/jsp/user/login-ok2.jsp"> <!-- 로그인은 예외로 post로 쓴다,  값이 가긴 하는데 주소로인해 가는게 아님 -->
		아이디 : <input type="text" name="id" id="id" > <br> <!--value="입력해주세요" 가능  -->
		비밀번호 : <input type = "password" name = "pwd" id="pwd"> <br>
		<button type="button" onclick="login()">로그인</button> <!--타입이 버튼이면 submit을 안함/submit도 이벤트 --> 
		
	</form>
	<script>
	function login(){
	//	alert("아 로그인을 클릭했군"); 
			//무조건 window꺼(브라우저가 기본적으로 제공해주는 내장객체. 원래는 window.alert()가 맞음)
		var idObj = document.getElementById("id"); //"id"는 인자값 //id라는 속성을 가지고있는 애들중에 id를 찾는것임. 
		var pwdObj = document.getElementById("pwd");
		var loginForm = document.getElementById("loginForm");
		var id = idObj.value;
		var pwd = pwdObj.value;
// 		alert(id.length);
// 		alert(pwd.length);
		
		if(id.length<5){
			alert("id는 5글자 이상 입력해야합니다");
			idObj.value = ''; //value를 빈문자열로 초기화
			idObj.focus(); //커서를 가게 하는것
			return; //if문을 만족하면 return 을 통해서 해당 함수를 빠져나감
		}
		if(pwd.length<5){
			alert("pwd는 5글자 이상 입력해야합니다");
			pwdObj.value = '';
			pwdObj.focus();
			return;
		}
		var loginForm = document.getElementById("loginForm");
		loginForm.submit(); //자기가 가지고있는 name과 value를 가지고 ~~ 암튼 실제로 submit은 일어난ㄴ것ㅇ.ㅁ
		
		//alert('로그인 로직 정상적으로 타야함');
	//	alert(idObj.value); //변수.속성
	//	alert(pwdObj.value);
	}
	//login();//무조건 window꺼. 	
	//window.onload= 윈도우가 로드될때 이벤트
	
	</script>
	
</body>
</html>

<!-- 
name은 중복 됨. 이름 가져올때 getElements
id는 중복안됨(오류는 아니지만 기본적으로 하면안됨)

 -->