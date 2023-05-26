<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<style>

.tp {
position :fixed;
  background-color: #1C1C1B;
  top: 0;
  left: 0;
  width: 100%;
  height: 50px;
}
.header {
  position : fixed;	
  background-color: #1C1C1B;
  top: 50px; /* top의 높이만큼 내려옴 */
  left: 0;
  width: 100%;
  height: 50px;
}
section {
	padding-top: 100px;
	padding-bottom: 63px;
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
.check {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.check th {
  color: #168;
  background: #f0f6f9;
}
.check th, .check td {
  padding: 10px;
  border: 1px solid #ddd;
}
.check th:first-child, .check td:first-child {
  border-left: 0;
}
.check th:last-child, .check td:last-child {
  border-right: 0;
}
</style>
<script type="text/javascript">
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
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
	<div class="tp">
		<%@include file ="top.jsp" %>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
<section>
	<div class="reservationCheck">
	<h1>예약 확인</h1>
		<table class="check"  >
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
    		<td><%=phone%></td>
    		<td><%=date %></td>
    		<td><%=time %></td>
    		<td><%=person %>명</td>
    		<td><%=notice %></td>
  		</tr>
	</table>
	</div>
	<input type="button" name="home" value="돌아가기" onclick="home()">
</section>
<footer>
	<%@ include file ="Footer.jsp" %>
</footer>
</body>
</html>