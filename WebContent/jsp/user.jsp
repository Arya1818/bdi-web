<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% /*자바영역 다른 부분은 다 html영역*/
String trans = request.getParameter("trans");
if("man".equals(trans)){
	out.println("남자네");
}else if("woman".equals(trans)){
	out.println("여자네");
}else{
	out.println("누구냐넌...?");
}
%>
너님 여자군요.
</body>
</html>