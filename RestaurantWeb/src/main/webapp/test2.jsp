<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	width: 100%;
    height: 100%;
}
.container{
	
}
.contentBox{

}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form name="subForm" method="post" action="insert">
		<div class="contentBox">
			<input type="text" name="id" placeholder="아이디" class="a"><input type="button"
				name="reId" value="ID중복확인" onclick="checkIdDup()" class="checkIdBtn">
				
			<input type="password" name="pw" placeholder="비밀번호" class="b">
			
			<input type="password" name="repw" placeholder="비밀번호 확인" class="b">
			
			<input type="text" name="name" placeholder="이름" class="b">
			
			<input type="text" name="phone" placeholder="전화번호 입력" class="b">
			
			<input type="button" value="가입하기" onclick="subButton()" class="c"><input
				type="button" value="메인으로" onclick="location.href='Main.jsp'" class="c">
		</div>
	</form>
</div>
</body>
</html>
