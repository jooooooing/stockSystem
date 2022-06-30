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
 margin-top : 5px;
 }
</style>
</head>
<%
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement();
String p_id_key = request.getParameter("p_id");
ResultSet rset = stmt.executeQuery("select * from stock where p_id='" + p_id_key + "';");
request.setCharacterEncoding("UTF-8"); // 한글 처리
rset.next();
Integer p_id = rset.getInt(1);//번호
String p_name = rset.getString(2); //상품명
String p_stock = rset.getString(3); //재고현황
String p_date = rset.getString(4); //상품등록날짜
String s_date = rset.getString(5); //재고등록날짜
String p_info = rset.getString(6); //상품설명
String p_image = rset.getString(7); // 사진
%>

<body>
	<jsp:include page="menu.jsp" />
	<form action="DB_write.jsp" method="post">
		<div class="container">
			<h3>재고수정</h3>
			<table
				class="table table-bordered table-striped table-sm thead-dark table-hover">
				<tr>
					<td>상품번호</td>
					<td><%=p_id%><input type=hidden name='p_id' value=<%=p_id%>></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><%=p_name%><input type=hidden name='p_id' value=<%=p_name%>></td>
				</tr>
				<tr>
					<td>재고 현황</td>
					<td><input type=number min="0" name='p_stock'
						placeholder="숫자만 입력해주셔요"
						required value=<%=p_stock%>></td>
				</tr>
				<tr>
					<td>상품등록일</td>
					<td><%=p_date%><input type=hidden name='p_date' value=<%=p_date%>></td>
				</tr>
				<tr>
					<td>재고파악일</td>
					<td><%=today%></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><%=p_info%><input type=hidden name='p_info' value=<%=p_info%>></td>
				</tr>
				<tr>
					<td>상품사진</td>
					<td><textarea
							type=hidden
							style='width: 400px; height: 250px; overflow-y: scroll'
							name=p_image cols=70 row=600><%=p_image%></textarea></td>
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
