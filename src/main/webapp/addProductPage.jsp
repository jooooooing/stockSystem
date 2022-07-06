<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>


<html>
<head>
<title>Product Stock List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<SCRIPT LANGUAGE="JavaScript">
	//특수문자 금지 (이름)
	function characterCheck(obj) {
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		if (regExp.test(obj.value)) {
			alert("특수문자는 입력하실 수 없으셔요.");
			obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
		}
	}
</SCRIPT>
<style>
.container {
	margin-top: 5px;
}
</style>
</head>
<%
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form action="DB_write.jsp" method="post" enctype="multipart/form-data">
		<div class="container">
			<h3>재고현황-상품 상세</h3>
			<table class="table table-bordered table-striped table-sm thead-dark table-hover">
				<tr>
					<td align = 'center'>상품번호</td>
					<td>
						<input type=number min="1" name='p_id' placeholder="숫자만 입력해주셔요" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" required>
					</td>
				</tr>
				<tr>
					<td align = 'center'>상품명</td>
					<td>
						<input type=text name='p_name' onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" required>
					</td>
				</tr>
				<tr>
					<td align = 'center'>재고 현황</td>
					<td>
						<input type=number min="0" name='p_stock' placeholder="숫자만 입력해주셔요" required>
					</td>
				</tr>
				<tr>
					<td align = 'center'>상품등록일</td>
					<td><%=today%></td>
				</tr>
				<tr>
					<td align = 'center'>재고파악일</td>
					<td><%=today%></td>
				</tr>
				<tr>
					<td align = 'center'>상품설명</td>
					<td>
						<input type=text name='p_info' onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" required>
					</td>
				</tr>
				<tr>
					<td align = 'center'>상품사진</td>
					<td>
						<input type="file" name="file">
				</tr>
			</table>
			<div class="div_btn">
				<input type="submit" value="완료">
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</head>
