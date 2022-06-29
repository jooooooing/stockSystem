<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	Date nowDate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
	String sql = "insert into stock(p_id, p_name, p_stock, p_date, s_date, p_info, p_image)"
			+ "values(?, ?, ?, ?, ?, ?, ?);";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	try {
		for (int i = 1; i < 121; i++) {
			pstmt.setInt(1, i);
			pstmt.setString(2, "품명" + i);
			pstmt.setInt(3, 1);
			pstmt.setString(4, sdf.format(nowDate));
			pstmt.setString(5, sdf.format(nowDate));
			pstmt.setString(6, "설명" + i);
			pstmt.setString(7, "사진" + i);

			pstmt.executeUpdate();
		}
		out.println("data 입력 완료");
	} catch (Exception e) {
		out.println("data 입력 실패");
	}

	pstmt.close();
	conn.close();
	%>

	<table width=540>
		<td width=500></td>
		<td><input type=button value="돌아가기"
			OnClick="location.href='DBmanage.jsp'"></td>
	</table>

</body>
</html>