<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--<script type="text/javascript">
	function verifyPW(){
		var form = document.changepw;
		var oldpw = form.oldpw.value;
		var pw = form.pw.value;
		var repw = form.repw.value;
		if(pw.equals(repw) && oldpw.equals(<%=session.getAttribute("oldpw") %>)){
			form.submit();
		}else if (!pw.equals(repw)){
			alert("재입력한 비밀번호가 일치하지 않습니다")
		}else{
			alert("현재 비밀번호가 틀렸습니다")
		}
	}
</script>
 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="changepw" method="post" name="changepwForm">
	<h3>비밀번호 변경</h3>
	<input type="password" placeholder="현재 비밀번호" name="oldpw"><br>
	<input type="password" placeholder="새 비밀번호" name="pw"><br>
	<input type="password" placeholder="비밀번호 재입력" name="repw"><br><br>
	<input type="submit" value="확인"><input type="button" value="취소" onclick="location.href='MyInfoPage.jsp'">
</form>
</body>
</html>