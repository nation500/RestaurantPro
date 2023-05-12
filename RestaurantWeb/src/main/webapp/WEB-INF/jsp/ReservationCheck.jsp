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
</style>
<script type="text/javascript">
<%
	String name = (String)session.getAttribute("name");
	String phone = (String)session.getAttribute("phone");
	Date date = (Date)session.getAttribute("date");
	String time = (String)session.getAttribute("time");
	int person = (int)session.getAttribute("person");
	String notice = (String)session.getAttribute("notice");

%>

</script>
</head>
<body>
<header>
	<%@ include file = "Header.jsp" %>
</header>
<%
//	List<ReservationDto> resList =
//			(ArrayList<ReservationDto>)request.getAttribute("resList");
//		for(ReservationDto reservationDto : resList){

%>

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
    		<td><%=phone %></td>
    		<td><%=date %></td>
    		<td><%=time %></td>
    		<td><%=person %>명</td>
    		<td><%=notice %></td>
  		</tr>
	</table>
	<input type="button" name="" value="예약수정">
	<input type="button" name="" value="돌아가기">
</body>
<footer>
	<%@ include file ="Footer.jsp" %>
</footer>
</html>