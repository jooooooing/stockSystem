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
		stmt.execute("create table stock(p_id int not null primary key, p_name varchar(70),"
		+ "p_stock int, p_date date, s_date date, p_info varchar(70), p_image varchar(70)) DEFAULT CHARSET=utf8");
		out.println("table 생성 완료");
	} catch (Exception e) {
		out.println("table 생성 실패");
		out.println(e.toString());
	}
	%>

	<%
stmt.close();
conn.close();
%>

	<table width=540>
		<td width=500></td>
		<td><input type=button value="돌아가기"
			OnClick="location.href='DBmanage.jsp'"></td>
	</table>

</body>
</html>