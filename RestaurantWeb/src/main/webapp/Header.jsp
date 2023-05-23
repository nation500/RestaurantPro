<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function clearSearch(){
		<%session.removeAttribute("searched"); %>
	}
</script>
<style type="text/css">
.button {
	display: inline-block;
	padding: 0.5rem 1rem;
	background-color: #1C1C1B;
	border: none;
	border-radius: 0.25rem;
	font-size: 1rem;
	color: white;
	text-align: center;
	text-decoration: none;
}
.button:hover {
	color: #847F71;
}
.mark{
	display: inline-block;
	padding: 0.5rem 1rem;
	background-color: #1C1C1B;
	border: none;
	border-radius: 0.25rem;
	font-size: 1.5rem;
	color: white;
	text-align: center;
	text-decoration: blink;
	margin-right: 20px;
}
.left{
	float: left;
	margin-left: 360px;
}
.right{
	float: right;
	margin-right: 360px;
}
.id, .pw, .loginBtn, .subBtn{
	display: inline-block;
	margin-top: 4px;
	margin-left: 4px;
	margin-right: 4px;
}
.loginBtn, .subBtn{
	background-color: #1C1C1B;
	color: #C0C0C0;
	border: 1px solid #C0C0C0;
	font-size: 12px;
	text-decoration: none;
	padding: 4px 6px;
}
.loginBtn, .subBtn:hover{
	cursor: pointer;
}
.hello{
	color: white;
}
</style>
<div class="left">
	<a href="Main.jsp" class="mark">gildong</a> <a href="Concept.jsp" class="button">CONCEPT</a>
	<a href="Menu.jsp" class="button">MENU</a> <a href="Reservation.jsp" class="button">RESERVATION</a>
</div>
<%if(session.getAttribute("id") == null) {%>
<div class="right">
	<a href="LoginPage.jsp" class="loginBtn">로그인</a>
	<a href="SubPage.jsp" class="subBtn">회원가입</a>
	<form action="board" method="get">
		<input type="submit" value="문의 게시판" onclick="clearSearch()">
		<input type="hidden" name="page" value="1">
	</form>
</div>
<%} else{%>
<div class="right">
	<p class = "hello">안녕하세요 <%=session.getAttribute("name")%>님</p>
	<input type="button" value="내 정보" onclick="location.href='MyInfoPage.jsp'">
	<form action="logout" method="get">
		<input type="submit" value="로그아웃">
	</form>
	<form action="board" method="get">
		<input type="submit" value="문의 게시판">
		<input type="hidden" name="page" value="1">
	</form>
	<%
	String userRole = (String)session.getAttribute("userRole");
	
	%>
<c:if test="${userRole!='admin' }">	
	<form action ="resview" method="post">
	<input type="submit" value="예약확인">
	</form>
</c:if>
<c:if test="${userRole=='admin' }">
	<form action ="alllist" method="post">
	<input type="submit" value="모든 예약확인">
	</form>
	<form action ="todaylist" method="post">
	<input type="submit" value="오늘의 예약확인">
	</form>
</c:if>
	
</div>
<%} %>

<!-- 	<input type="text" name="id" placeholder="아이디" class="id" size="12">
		<input type="password" name="pw" placeholder="비밀번호" class="pw" size="12"> -->