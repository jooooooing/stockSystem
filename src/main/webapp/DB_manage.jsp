<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Mode</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<ul>
		<li><a href="./DB_create.jsp"> DB TABLE 생성</a></li>
		<li><a href="./DB_drop.jsp" > DB TABLE 삭제</a></li>
		<li><a href="./DB_insert.jsp"> DB 더미 data 생성</a></li>
	</ul>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>