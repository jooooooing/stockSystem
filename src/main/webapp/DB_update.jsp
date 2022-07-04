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
	String p_stock = request.getParameter("p_stock");

	out.println(today);
	String sql = "update stock set p_stock = ?, s_date = ? where p_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, p_stock);
	pstmt.setString(2, today);
	pstmt.setString(3, p_id);

	try {
		pstmt.executeUpdate();
		out.println("재고수정 완료");
	} catch (Exception e) {
		out.println("재고수정 실패");
		out.println(e.toString());
	}

	pstmt.close();
	conn.close();
	%>
	<script>
		alert("수정완료");
	/* 	window.location.href = "allStockList.jsp"; //특정페이지로의 이동 */
		history.go(-1);  //이전 페이지로의 이동
	</script> 
</body>
</html>