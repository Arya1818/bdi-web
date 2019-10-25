<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String sql = "insert into lotto(seq,num1,num2,num3,num4,num5,num6)";
sql += "values(seq_lotto_num.nextval,?,?,?,?,?,?)";


List<Integer> lottoList = new ArrayList<Integer>();
Random r = new Random();

for (int i = 0; i < 6; i++) {
	int num = r.nextInt(45) + 1;
	if (lottoList.indexOf(num) == -1) {
		lottoList.add(num);
	} else {
		i--;
	}
}

System.out.println(lottoList);
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

//ps.setInt(1,lottoList.get(0));
//ps.setInt(2,lottoList.get(1));


for(int i=0;i<lottoList.size();i++){
	ps.setInt(i+1,lottoList.get(i));
}

int result = ps.executeUpdate();
if (result == 1){
	out.println("생성완료");
	con.commit();
} else {
	out.println("에러발생");
	con.rollback();
}

%>
<a href = "/bdi-web/jsp/lotto/lotto-list.jsp"><button>목록보기</button></a>

</body>
</html>