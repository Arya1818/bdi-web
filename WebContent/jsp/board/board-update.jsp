<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
public String checkStr(String str, String targetStr){
	String[] strs = str.split(",");
	for(String s:strs){
		if(s.equals(targetStr)){
			return "checked";
		}
	}
	return "";
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String num = request.getParameter("bi_num");

String sql = "select * from board_info where bi_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, num);
ResultSet rs = ps.executeQuery();
if(!rs.next()){   //re.next에서 나오는 값은 true or false //false일때
	out.println(num + "에 해당하는 게시물은 존재하지 않습니다.");
}else{	

%>
	<form method = "post" action = "/bdi-web/jsp/board/board-update-ok.jsp"> <!-- insert할 땐 post사용, update할 땐 엄밀히말하면 post가 아니지만 지금은 그렇게 씀-->
		<table border = "1">
				<tr>
						<th>번호</th>
						<td><%=rs.getString("bi_num")%></td>
				</tr>
				<tr>
						<th>제목<br></th>
						<th><input type ="checkbox" name ="bi_title" value="교환" <%=checkStr(rs.getString("bi_title"),"교환")%>>교환
							<input type ="checkbox" name ="bi_title" value="환불" <%=checkStr(rs.getString("bi_title"),"환불")%>>환불
							<input type ="checkbox" name ="bi_title" value="배송" <%=checkStr(rs.getString("bi_title"),"배송")%>>배송
						</th>
				</tr>
				<tr>
						<th>작성자<br></th>
						<th><input type ="text" name ="bi_user" value="<%=rs.getString("bi_user")%>"></th>
				</tr>
				<tr>
						<th>내용<br></th>
						<th><textarea name="bi_content" cols="22" rows="10" ><%=rs.getString("bi_content")%></textarea></th>
				</tr>
				<tr>	
						<th>작성일</th>
						<td><%=rs.getString("bi_credat")%><%=rs.getString("bi_cretim")%></td>
				</tr>
				<tr>	
						<th>수정일</th>
						<td><%=rs.getString("bi_moddat")%><%=rs.getString("bi_modtim")%></td>
				</tr>
				<tr>
						<th colspan="2"><button>게시글 수정</button></th>
				</tr>
				
		</table>
		
		<input type ="hidden" name="bi_num" value ="<%=rs.getString("bi_num") %>">
			
<%
}
%>	
	</form>
</body>
</html>