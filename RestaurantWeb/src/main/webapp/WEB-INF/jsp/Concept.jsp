<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Concept</title>
<style>
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
}
header {
	position: fixed;
	background-color: #1C1C1B;
	top: 0px;
	left: 0;
	width: 100%;
	height: 50px;
}

section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 65px;
	padding-bottom: 11px;
	 display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
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
body {
text-align: center;
}
</style>
</head>
<body>
	<header>
		<%@include file="Header.jsp"%>
	</header>
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