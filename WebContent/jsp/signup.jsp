<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Signup</title>
</head>
<body>
<%
String id = request.getParameter("id"); 
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");
out.println("니가 입력한 아이디 : " + id + "<br>");
out.println("니가 입력한 pwd : " + pwd + "<br>");
out.println("니가 입력한 name : " + name + "<br>");
out.println("니가 입력한 age : " + age + "<br>");
out.println("니가 입력한 etc : " + etc + "<br>");
%> 

	<form>
		ID:<input type = "text" name = "id"> <br>
		Password : <input type = "password" name = "pwd"> <br> <!-- 비번 한글안먹음 -->
		Name : <input type = "text" name = "name"> <br> 
		Age : <input type = "number" name = "age"> <br> <!-- 숫자밖에안들어감 -->
		Etc : <textarea name = "etc"></textarea><br>
		<button>Signup</button> 
	</form>
	
</body>
</html>


<!--
버튼 태그가 폼태그 안에있어야한다.
폼태그 안에 있고 타입 없다면 디폴트타입은 서브밋 -> 나 자신에게 보냄. 

요즘은 폼태그 잘안쓰고 aject? 씀

jsp에 database에 입력하려고 

1.request(요청) 2.response(응답) 둘 중 하나라도 잘못된다면 화면이 나올수가없음.
한 개의 요청 - 한 개의 응답 1대1공존, 

-니가 보낸 주소중에서 id를 찾아보>

&를 기준으로 키밸류를 여러개넣을수있다.
html에서 ? 를 get방식이라한다(표준). 뭔가를 조회할때,검색할때 사용. (규칙임)
?를 기준으로 왼쪽이 요청주소, 오른쪽이 내가 보려는 키,밸류

""와 null은 다르다

-->







