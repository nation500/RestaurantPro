<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function clicked(){
		var isChecked = document.getElementsByName("check")[0].checked;
		var password = document.getElementsByName("pw")[0].value;
		if (isChecked && password != ""){
			document.deleteForm.submit();
		}else if (!isChecked){
			alert("내용을 확인하고 체크를 해주세요");
			return;
		}else if (password == ""){
			alert("비밀번호를 확인해주세요");
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="checkbox" value="yes" name="check">탈퇴에 동의합니다.<br><br>
	<form action="delete" method="post" name="deleteForm">
		<input type="password" name="pw" placeholder="비밀번호 입력">
		<input type="button" value="탈퇴" onclick="clicked()">
	</form>
</body>
</html>