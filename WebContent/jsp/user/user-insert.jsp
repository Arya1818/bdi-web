<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action = "/bdi-web/jsp/user/user-insert-ok.jsp">
		<table border = "1">
			<tr>
				<th>아이디<br></th>
				<th><input type ="text" name ="ui_id"></th>
			</tr>
			<tr>
				<th>패스워드<br></th>
				<th><input type ="password" name ="ui_pwd"></th>
			</tr>
			<tr>
				<th>이름<br></th>
				<th><input type ="text" name ="ui_name"></th>
			</tr>
			<tr>
				<th>나이<br></th>
				<th><input type ="number" name ="ui_age"></th>
			</tr>
			<tr>
				<th>etc<br></th>
				<th><input type ="text" name ="ui_etc"></th>
			</tr>
			<tr>
				<th>hobby<br></th>
				<td>
					<input type ="checkbox" name ="hobby" value="movie">영화
					<input type ="checkbox" name ="hobby" value="game">게임
					<input type ="checkbox" name ="hobby" value="music">음악
					<input type ="checkbox" name ="hobby" value="drawing">그림
				</td>
			</tr>
		</table>
			<button>회원가입</button>
	</form>
</body>
</html>