<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action = "/bdi-web/jsp/board/board-insert-ok.jsp"> <!-- insert할 땐 post사용, update할 땐 엄밀히말하면 post가 아니지만 지금은 그렇게 씀-->
		<table border = "1">
			<tr>
				<th>제목<br></th>
				<th>
				<input type ="checkbox" name ="bi_title" value="교환">교환
				<input type ="checkbox" name ="bi_title" value="환불">환불
				<input type ="checkbox" name ="bi_title" value="배송">배송
				</th>
			</tr>
			<tr>
				<th>작성자<br></th>
				<td><input type ="text" name ="bi_user"></td>
			</tr>
			<tr>
				<th>내용<br></th>
				<td><textarea name ="bi_content" cols="22" rows="10"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록하기</button></th>
			</tr>
		</table>
			
	</form>

</body>
</html>