<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
body {
	text-align: center;
}

div {
	text-align: center;
	border: 1px solid black;
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
</style>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function findPWB() {
		location.href = "MainFindPW.jsp";
	}
	function findIDB() {
		location.href = "MainFindID.jsp";
	}
	function SubB() {
		location.href = "MainSub.jsp";
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br><br><br><br><br><br><br><br><br><br>
	<form action="login" method="post">
		<div>
			<input type="text" name="id" placeholder="아이디" class="a" id="idt"><br>
			<input type="password" name="pw" placeholder="비밀번호" class="a"
				id="pwt"><br>
			<br> <input type="submit" name="loginB" value="로그인" class="b">
		</div>
	</form>
	<br>
	<input type="button" name="findPW" value="비밀번호 찾기" onclick="findPWB()">
	|
	<input type="button" name="findID" value="아이디 찾기" onclick="findIDB()">
	|
	<input type="button" name="Sub" value="회원가입" onclick="SubB()">
</body>
</html>