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
	function calc(){ 
		var n1 = document.getElementById("num1"); //id가 num1인 ~를 가져와라
		var n2 = document.getElementById("num2")
//		document.getElementsByname(""); //name은 중복이 되기 때문에 	
		
//		alert(n1.value);
//		alert(n2.value);

//	 	alert(parseInt(n1.value)+parseInt(n2.value)); //parseInt앞에 생략된것
	 	
	 	n1 = parseInt(n1.value);
	 	n2 = parseInt(n2.value);
	 	alert(n1+n2);
	 	alert(n1==n2);
	}
	
</script>
</body>
</html>

<!-- 모든 브라우저가 자바스크립트가 좀 다르게 동작
브라우저가 첨부터끝까지 다 읽고(그릴때,렌더링하고) 버튼을 보여준다. 렌더링할때 이미 읽었기 때문에 함수를 위에서 호출가능. 
돈계산,포인트,아이디비번같이 critical한 작업은 브라우저의 스크립트로하지않음  까는게 가능하기ㄸㅁ-->