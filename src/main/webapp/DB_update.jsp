<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
</head>
<body>
	<%
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
	String p_id = request.getParameter("p_id");
	String sql = "delete from stock where p_id= " + p_id + ";";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try {
		pstmt.executeUpdate();
		out.println("상품삭제 완료");
	} catch (Exception e) {
		out.println("상품삭제 실패");
		out.println(e.toString());
	}

	pstmt.close();
	conn.close();
	%>

 	<script>
		alert("삭제완료");
		window.location.href = "allStockList.jsp"; //특정페이지로의 이동
	</script>
</body>
</html>