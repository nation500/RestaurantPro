<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

header {
	position: fixed;
	background-color: #1C1C1B;
	top: 0;
	left: 0;
	width: 100%;
	height: 50px;
}

section {
	padding-top: 65px;
	padding-bottom: 11px;
}

footer {
	position: fixed;
	background-color: #141414;
	text-align: center;
	color: white;
	font-size: 6px;
	bottom: 0;
	left: 0;
	width: 100%;
}
body {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
<script type="text/javascript">
<%
	String name = (String)session.getAttribute("name");
	String phone = (String)session.getAttribute("phone");
	Date date = (Date)session.getAttribute("date");
	String time = (String)session.getAttribute("time");
	int person = (int)session.getAttribute("person");
	String notice = (String)session.getAttribute("notice");
	String phone1 = phone.substring(0, 3);
	String phone2 =	phone.substring(3, 7);
	String phone3 =	phone.substring(7, 11);
%>
function home() {
	window.location.href = "Main.jsp";
}
</script>
</head>
<body>
<header>
	<%@ include file = "Header.jsp" %>
</header>
	<section>
	<h1>예약 확인</h1>
		<table class="check" border="1">
		  <tr>
		    <th>예약자명</th>
    		<th>연락처</th>
    		<th>예약날짜</th>
    		<th>예약시간</th>
    		<th>인원</th>
    		<th>특이사항</th>
  		</tr>
  		<tr>
    		<td><%=name %></td>
    		<td><%=phone1 %>-<%=phone2 %>-<%=phone3%></td>
    		<td><%=date %></td>
    		<td><%=time %></td>
    		<td><%=person %>명</td>
    		<td><%=notice %></td>
  		</tr>
	</table>
	<input type="button" name="home" value="돌아가기" onclick="home()">
</section>
<footer>
	<%@ include file ="Footer.jsp" %>
</footer>
</body>
</html>