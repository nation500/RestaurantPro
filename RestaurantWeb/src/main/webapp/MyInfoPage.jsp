<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
}
body{
	display: flex;
	justify-content: center;
}
.topDiv {
position :fixed;
  background-color: #1C1C1B;
  top: 0;
  left: 0;
  width: 100%;
  height: 50px;
  z-index: 1; /* 헤더가 위로 오도록 설정 */
}
.headDiv {
  position : fixed;	
  background-color: #1C1C1B;
  top: 50px; /* top의 높이만큼 내려옴 */
  left: 0;
  width: 100%;
  height: 50px;
  z-index: 1; /* 헤더가 위로 오도록 설정 */
}
section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 300px;
	padding-bottom: 63px;
}
.btns{
	display: inline-block;
	margin-top: 4px;
	margin-left: 4px;
	margin-right: 4px;
}
.btns{
	background-color: #1C1C1B;
	color: #C0C0C0;
	border: 1px solid #C0C0C0;
	font-size: 12px;
	text-decoration: none;
	padding: 4px 6px;
}
.btns{
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>INFO | gildong</title>

</head>
<body>
<div class="topDiv">
<%@include file="top.jsp"%>
</div>
<div class="headDiv">
<%@include file="Header.jsp" %>
</div>
<section>
	<h3><%=session.getAttribute("name") %></h3>
	<p>아이디 : <%=session.getAttribute("id") %>
	<p>전화번호 : <%=session.getAttribute("phone1") %>-<%=session.getAttribute("phone2") %>-<%=session.getAttribute("phone3") %><br><br>
	<input type="button" value="비밀번호 변경" onclick="location.href='ChangePWPage.jsp'" class="btns">
	<input type="button" value="회원 탈퇴" onclick="location.href='DeletePage.jsp'" class="btns">
	<input type="button" value="취소" onclick="location.href='Main.jsp'" class="btns">
</section>
</body>
</html>