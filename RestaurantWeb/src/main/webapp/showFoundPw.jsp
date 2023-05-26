<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css">
body {
	text-align: center;
}
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
}
.top {
position :fixed;
  background-color: #1C1C1B;
  top: 0;
  left: 0;
  width: 100%;
  height: 50px;
  z-index: 1; /* 헤더가 위로 오도록 설정 */
}
.header {
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
.c{
	display: inline-block;
	margin-top: 4px;
	margin-left: 4px;
	margin-right: 4px;
}
.c{
	background-color: #1C1C1B;
	color: #C0C0C0;
	border: 1px solid #C0C0C0;
	font-size: 12px;
	text-decoration: none;
	padding: 4px 6px;
}
.c{
	cursor: pointer;
}
</style>
</head>
<body>
<div class="top">
		<%@include file ="top.jsp" %>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<section>
<h2>당신의 PW는 "<%=session.getAttribute("foundPw") %>"입니다</h2>
<a href="logout" class="c">확인</a>
</section>
</body>
</html>