<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	top: 15px;
	left: 0;
	width: 100%;
	height: 50px;
}

section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 65px;
	padding-bottom: 11px;
}

footer {
	position: fixed;
	background-color: #141414;
	text-align: center;
	color: white;
	font-size: 6px;
	bottom: 5px;
	left: 0;
	width: 100%;
}
</style>
</head>
<body>
	<header>
		<%@include file="Header.jsp"%>
	</header>
	<section>
		<h1>예약 로직</h1>
	</section>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
	

</body>
</html>