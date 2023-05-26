<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONCEPT | gildong</title>
<style>
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

footer {
	position: fixed;
	background-color: #141414;
	text-align: center;
	color: white;
	font-size: 6px;
	bottom: 0px;
	left: 0;
	width: 100%;
}
section {
	top: 100px;
	background-color: #1A1A1A;
	padding-top: 100px;
	padding-bottom: 63px;
	text-align: center; /* 이미지를 가로 방향으로 가운데 정렬 */
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
		<img src="img/bg_concept1.png"/>
		<img src="img/txt_concept.png"/>
		<img src="img/bg_concept2.png"/>
	</section>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
</body>
</html>