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
<%
String no_page = "1";
int size_page = 20;
int count_total = 0;
int size_group_page = 20;

if (request.getParameter("page") != null) {
	no_page = request.getParameter("page");
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "koposw31");
Statement stmt = conn.createStatement();//Statement 객체 생성
String sql1 = "select * from stock;";
ResultSet rset1 = stmt.executeQuery(sql1);
rset1.next();
count_total = rset1.getInt(1);

stmt = conn.createStatement();
String sql2 = "select * from stock limit " + ((Integer.parseInt(no_page) - 1) * size_page) + "," + size_page + ";";
ResultSet rset2 = stmt.executeQuery(sql2);
%>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<h3>재고현황</h3>
		<table cellspacing=1 width=600 border=1>
			<tr>
				<td width=50><p align=center>상품번호</p></td>
				<td width=50><p align=center>상품명</p></td>
				<td width=50><p align=center>현재 재고수</p></td>
				<td width=50><p align=center>재고파악일</p></td>
				<td width=50><p align=center>상품등록일</p></td>

			</tr>
			<%
			while (rset2.next()) {
				out.println("<tr>");
				out.println("<td>" + rset2.getInt("p_id") + "</td>");
				out.println("<td><a href='productOneView.jsp?id=" + rset2.getString("p_id") + "'>" + rset2.getString("p_name") + "</a></td>");
				out.println("<td>" + rset2.getInt("p_stock") + "</td>");
				out.println("<td>" + rset2.getDate("p_date") + "</td>");
				out.println("<td>" + rset2.getDate("s_date") + "</td>");
				out.println("</tr>");
			}
			%>
		</table>
		<br>


		<div class="pagination">
			<%
			// 페이징 처리
			int no_page_now = Integer.parseInt(no_page); // request 파라미터로 들어온 현재 페이지 번호를 int형으로 변환하여 변수에 저장

			int no_page_start = (no_page_now / size_group_page) * size_group_page + 1; // 페이징 그룹의 첫 페이지 번호
			if ((no_page_now % size_group_page) == 0) { // 페이징 사이즈로 나누어 떨어지는 마지막 번호를 누르면 페이지가 넘어가는 예외를 처리
				no_page_start -= size_group_page;
			}

			int no_page_last = 0; // 와이파이 게시판의 마지막 페이지 번호
			if ((count_total % size_page) == 0) { // 총 레코드수가 리스트 사이즈로 나눠 떨어지면 그 몫이 총 페이지 개수 이지만
				no_page_last = count_total / size_page;
			} else { // 안 나눠 떨어지면 +1해줘야 총 페이지 개수이다.
				no_page_last = count_total / size_page + 1;
			}

			out.println("<table>");

			if (no_page_start != 1) { // 첫 페이징 그룹이 아닐 때만 <와 << 표시
				out.println("<tr><td><a href='allStockList.jsp'>&lt;&lt;</a></td>"); // << 출력하고 첫 페이지로 이동 링크
				out.println("<td><a href='allStockList.jsp?page=" + (no_page_start - 1) + "'>&lt;</a></td>"); // < 출력하고 이전 페이징 그룹의 마지막 페이지 링크
			}

			for (int i = no_page_start; i < no_page_start + size_group_page; i++) { // 현재 페이지 번호가 속한 페이징의 그룹의 (첫 페이지 번호) 부터 (첫 페이지 번호+페이징 그룹의 크기) 까지 반복
				if (i > no_page_last) { // i가 마지막 페이지 번호이면 없는 이후 페이지 번호는 출력할 필요 없으므로
					break; //   반복문 종료
				}

				if (i == no_page_now) { // 현재에 해당하는 페이지 번호이면 굵은 글씨로 표시
					out.println("<td><b><a href='allStockList.jsp?page=" + i + "'>" + i + "</a></b></td>"); // 현재 페이징 그룹에 해당하는 페이지 번호 출력
				} else { // 아니면 일반 굵기로 표시
					out.println("<td><a href='allStockList.jsp?page=" + i + "'>" + i + "</a></td>"); // 현재 페이징 그룹에 해당하는 페이지 번호 출력
				}
			}

			if (!(no_page_start <= no_page_last && no_page_last <= no_page_start + size_group_page) && (no_page_last != 0)) { // 마지막 페이징 그룹이 아닐 때와 출력할 데이터가 있을 때만 >와 >> 표시
				out.println("<td><a href='allStockList.jsp?page=" + (no_page_start + size_group_page) + "'>&gt;</a></td>"); // > 출력하고 다음 페이징 그룹의 첫 페이지 링크
				out.println("<td><a href='allStockList.jsp?page=" + no_page_last + "'>&gt;&gt;</a></td>"); // >> 출력하고 마지막 페이지로 이동 링크
			}

			out.println("<tr></table>");
			%>
		</div>

		<div class="div-button">
			<input type="button" value="신규 등록"
				onclick="window.location='addProduct.jsp'">
		</div>
	</div>

	<%
	rset2.close();
	rset1.close();
	stmt.close();
	conn.close();
	%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</head>
