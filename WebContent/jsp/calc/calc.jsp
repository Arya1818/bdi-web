<%@ page language="java" contentType="text/html; charset=UTF-16"
    pageEncoding="UTF-16"%><!-- @는 앳, 파일에대한 설명서, text/html은 content 파일 중 하나  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-16">
<title>Insert title here</title>
</head>
<body>
<%! //선언부
public void test(){
//	out.print("하하~"); <-에러나는이유? 메서드를 벗어나서 선언이 되기 때문에  
}
//System.out.println("난 실행은 하는데 시스템에서 실행되지 브라우저에선 안보임");
%>

<% //꺽새-jsp, 실행부, 메서드안에있음(접근제어자못씀), 여기안에도 메서드 못넣음 
String op = request.getParameter("op");
out.println("원하는 연산자는 "+ op );

int result = 0;
int num1 = Integer.parseInt(request.getParameter("num1")); //request가 이미 선언되어있기때문에 사용가능한것
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
	<form>
		숫자1 : <input type="number" name=num1 value=0> <!-- value값 넣어서 기본값으로 줌 -->
		<select name="op">
			<option value=""> 선택</option> <!-- select box  -->
			<option value="+"> 더하기</option>
			<option value="-"> 빼기</option>
			<option value="*"> 곱하기</option>
			<option value="/"> 나누기</option>
		</select>
		숫자2 : <input type="number" name=num2 value=0>	
		=
		<input type ="number" name ="result" value="<%=result%>">
	<button>계산</button>
	</form>
</body>
</html>