<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
숫자 1 : <input type="number" id="num1">
+
숫자 2 : <input type="number" id="num2">
<button onclick="calc();">계산하기</button> <!-- button 타입 submit/ on+이벤트 : click 이벤트가 일어남 / 자바스크립트영역 -->

<script>
	function calc(){ //함수의선언 //return하면 return하는 메서드가 되고 안쓰면 void가된다
		alert('날 호출했군..'); //일반적으로 js는 '', html에서는""씀
	}
	
//	calc(); //함수의호출
	
</script>
</body>
</html>

<!-- 모든 브라우저가 자바스크립트가 좀 다르게  -->