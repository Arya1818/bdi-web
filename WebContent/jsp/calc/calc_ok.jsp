<%@ page language="java" contentType="text/html; charset=UTF-16"
    pageEncoding="UTF-16"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-16">
<title>Insert title here</title>
</head>
<body>
<% //꺽새-jsp, 실행문 
String op = request.getParameter("op");
out.println("원하는 연산자는 "+ op );

int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));

if("+".equals(op)){ //string은 ==로 비교 못해
	out.println(num1 + num2);
}else if("-".equals(op)){
	out.println(num1 - num2);
}else if("*".equals(op)){
	out.println(num1*num2);
}else if("/".equals(op)){
	out.println(num1/num2);
}else{
	out.println("잘못된 연산입니다.");
}
%>
	<form action="/bdi-web/jsp/calc/calc_ok.jsp">
		숫자1 : <input type="number" name=num1 value=0> 	<!-- value값 넣어서 기본값으로 줌 -->
		<select name="op">
			<option value=""> 선택</option> 				<!-- select box  -->
			<option value="+"> 더하기</option>
			<option value="-"> 빼기</option>
			<option value="*"> 곱하기</option>
			<option value="/"> 나누기</option>
		</select>
		숫자2 : <input type="number" name=num2 value=0>	
	
		<button>계산</button>
	</form>
</body>
</html>