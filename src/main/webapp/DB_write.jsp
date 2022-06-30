<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	String title = request.getParameter("title");
	Date nowDate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String content = request.getParameter("content");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");

	String sql = "insert into stock (p_id, p_name, p_stock, p_date, s_date, p_info, p_image)"
			+ "values (?, ?, ?, ?, ?, ?, ?);";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("p_id"));
	pstmt.setString(2, request.getParameter("p_name"));
	pstmt.setString(3, request.getParameter("p_stock"));
	pstmt.setString(4, sdf.format(nowDate));
	pstmt.setString(5, sdf.format(nowDate));
	pstmt.setString(6, request.getParameter("p_info"));
	pstmt.setString(7, request.getParameter("p_image"));

	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	%>

	<script>
		alert("상품 등록완료");
		window.location.href = "allStockList.jsp"; //특정페이지로의 이동
	</script>
</body>
</html>