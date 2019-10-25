<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/bdi-web/jsp/book/book-insert_ok">
		<table border="1">
			<tr>
				<th>카테고리</th>
				<td>
				<input type="checkbox" name="bi_categ" value="자기계발">자기계발
				<input type="checkbox" name="bi_categ" value="경제경영">경제경영<br>
				<input type="checkbox" name="bi_categ" value="소설">소설
				<input type="checkbox" name="bi_categ" value="문학">문학	
				<input type="checkbox" name="bi_categ" value="it/컴퓨터">it/컴퓨터
				</td>			
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bi_title"></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" name="bi_writer"></td>
			</tr>
			<tr>
				<th>책소개</th>
				<td><textarea name="bi_desc"></textarea>
			</tr>
			<tr>
				<th colspan="2"><a href="/bdi-web/jsp/book/book-insert_ok"><button>입력하기</button></a></th>
			</tr>	
		</table>
	</form>


</body>
</html>