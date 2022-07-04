<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<html>
<head>
<title>Product Stock List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.div_btn {
}
</style>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement(); //Statement 객체 생성
String id_fromList = request.getParameter("p_id");
Integer id = Integer.parseInt(id_fromList);
String sql1 = "select * from stock where p_id = " + id + ";";
ResultSet rset = stmt.executeQuery(sql1);
rset.next();

Integer p_id = rset.getInt(1);//번호
String p_name = rset.getString(2); //상품명
String p_stock = rset.getString(3); //재고현황
String p_date = rset.getString(4); //상품등록날짜
String s_date = rset.getString(5); //재고등록날짜
String p_info = rset.getString(6); //상품설명
String p_image = rset.getString(7); // 사진
%>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<h3>재고현황-상품 상세</h3>
		<table
			class="table table-bordered table-striped table-sm thead-dark table-hover">
			<tr>
				<td>상품번호</td>
				<td><%=p_id%></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><%=p_name%></td>
			</tr>
			<tr>
				<td>재고 현황</td>
				<td><%=p_stock%></td>
			</tr>
			<tr>
				<td>상품등록일</td>
				<td><%=p_date%></td>
			</tr>
			<tr>
				<td>재고등록일</td>
				<td><%=s_date%></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><%=p_info%></td>
			</tr>
			<tr>
				<td>상품사진</td>
				<td><img src="<%=p_image%>"></td>
			</tr>
		</table>
	<div class="div_btn">
		<input type="button" value="돌아가기" onclick="window.location='allStockList.jsp'"> 
		<input type="button" value="상품삭제" onclick="window.location='DB_delete.jsp?p_id=<%=p_id%>'"> 
		<input type="button" value="재고수정"	onclick="window.location='updateProductPage.jsp?p_id=<%=p_id%>'">
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</head>
