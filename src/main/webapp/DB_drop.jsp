<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
	Statement stmt = conn.createStatement();
	%>
	<%
	try {
		stmt.execute("drop table stock");
		out.println("table 삭제 완료");
	} catch (Exception e) {
		out.println("table 삭제 실패");
	}
	%>

	<%
stmt.close();
conn.close();
%>

	<table width=540>
		<td width=500></td>
		<td><input type=button value="돌아가기"
			OnClick="location.href='./DB_manage.jsp'"></td>
	</table>

</body>
</html>