<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	text-align: center;
}
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
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
<div class="topDiv">
<%@include file="top.jsp"%>
</div>
<div class="headDiv">
<%@include file="Header.jsp" %>
</div>
<section>
	<form action=findID method="post">
		<h3>ID 찾기</h3>
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="phone" placeholder="휴대전화"><br><br>
		<input type="submit" value="확인" class="c"><input type="button" value="취소" class="c" onclick="location.href='LoginPage.jsp'">
	</form>
</section>
</body>
</html>