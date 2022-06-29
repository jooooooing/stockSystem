<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>

</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">
		<div class="text-center">
			<h3>Welcome to Stock Management System!</h3>

			<%
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss a");
			%>
			현재 접속 시각 :
			<%=format.format(now)%>

		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>