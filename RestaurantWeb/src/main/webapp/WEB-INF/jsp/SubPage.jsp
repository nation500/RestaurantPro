<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script type="text/javascript">
	var idDup = true;
	function reIdCheck(){
		var form = document.subForm;
		var regExpId = /^(?=.*[a-zA-Z])[a-zA-Z0-9-_]+$/;
		if(!regExpId.test(form.id.value) || form.id.value.length < 4 || form.id.value.length > 12){
			alert("아이디를 확인해주세요\n4~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다");
			idDup = true;
			return;
		}else{
			var result = confirm("사용가능한 아이디입니다\n사용하시겠습니까?")
			if(result == true){
				document.getElementsByName("id")[0].readOnly = true;
				document.getElementsByName("reId")[0].disabled = true;
				idDup = false;
			}else{
				return;
			}
		}
	}
	function subButton(){
		var form = document.subForm;
		if (idDup){
			alert("아이디를 확인해주세요");
		}else{
			form.submit();
		}
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="subForm" method="post" action="insert">
		<p>
			아이디 : <input type="text" name="id"><input type="button"
				name="reId" value="ID중복확인" onclick="reIdCheck();">
		<p>
			비밀번호 : <input type="password" name="pw">
		<p>
			비밀번호 재확인 : <input type="password" name="repw">
		<p>
			이름 : <input type="text" name="name">
		<p>
			전화번호 : <input type="text" name="phone" placeholder="전화번호 입력">
			<!-- <input type="button" name="getConfirmNum" value="인증번호 받기"> (나중에 인증번호 random으로 구현해보기)-->
		<p>
			<input type="button" value="가입하기" onclick="subButton()"><input type="reset" value="초기화">
	</form>
</body>
</html>
