<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function findPWB() {
		location.href = "FindPWPage.jsp";
	}
	function findIDB() {
		location.href = "FindIDPage.jsp";
	}
	function SubB() {
		location.href = "SubPage.jsp";
	}
</script>
<meta charset="UTF-8">
<title>LOGIN | gildong</title>
<style type="text/css">
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
}
body {
	text-align: center;
}

.divv {
	text-align: center;
	border: 1px solid white;
	padding: 20px;
	width: 300px;
	margin: 0 auto;
	border-radius: 6px;
}

.a {
	width: 280px;
	height: 36px;
}

.b {
	width: 280px;
	height: 36px;
	border-radius: 6px;
	border-width: 1px;
}

#idt {
	border-radius: 6px 6px 0 0;
	border-width: 1px;
}

#pwt {
	border-radius: 0 0 6px 6px;
	border-width: 1px;
}

input[type=button] {
	background: none;
	border: none;
	cursor: pointer;
}
.c{
	color: white;
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
section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 300px;
	padding-bottom: 63px;
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
	<form action="login" method="post">
		<div class="divv">
			<input type="text" name="id" placeholder="아이디" class="a" id="idt"><br>
			<input type="password" name="pw" placeholder="비밀번호" class="a"
				id="pwt"><br>
			<br> <input type="submit" name="loginB" value="로그인" class="b">
		</div>
	</form>
	</section>
	<br>
	<input type="button" name="findPW" value="비밀번호 찾기" onclick="findPWB()" class="c">
	|
	<input type="button" name="findID" value="아이디 찾기" onclick="findIDB()" class="c">
	|
	<input type="button" name="Sub" value="회원가입" onclick="SubB()" class="c">
</body>
</html>