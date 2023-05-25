<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script type="text/javascript">
	var idDup = true;
	function reIdCheck(){
		var form = document.subForm;
		var regExpId = /^(?=.*[a-zA-Z])[a-zA-Z0-9-_]+$/;
		var userId = form.id.value;
		var idCheck = false;
		alert("a")
		fetch('idCheck').then((response) => {return response.json()}).then((result) => idCheck = result)
		alert("b")
		if(!regExpId.test(form.id.value) || form.id.value.length < 4 || form.id.value.length > 12){
			alert("c")
			alert("아이디를 확인해주세요\n4~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다");
			idDup = true;
			return;
		}else if(result){ //중복
			alert("d")
		}else{
			alert("e")
			if(document.subForm.reId.value === "ID변경하기"){
				document.getElementsByName("id")[0].readOnly = false;
				document.getElementsByName("reId")[0].value = "ID중복확인";
				idDup = false;
			}else{
				document.getElementsByName("id")[0].readOnly = true;
				document.getElementsByName("reId")[0].value = "ID변경하기";
				idDup = true;
			}
		}
	}
	function subButton(){
		var phonePattern = /^\d+$/;
		var form = document.subForm;
		if (idDup){
			alert("아이디 중복검사를 클릭하세요");
			form.id.focus();
			return;
		}else if(form.pw.value.length < 4){
			alert("비밀번호의 길이는 4자리 이상이어야합니다");
			form.pw.focus();
			return;
		}else if(form.pw.value !== form.repw.value){
			alert("비밀번호 재확인값이 다릅니다");
			form.pw.focus();
			return;
		}else if(form.name.value.trim() === "" || form.name.value.trim() > 16){
			alert("이름을 입력해주세요");
			form.name.focus();
			return;
		}else if(!phonePattern.test(form.phone.value)){
			alert("휴대폰 번호를 확인해주세요");
			form.phone.focus();
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
			<input type="button" value="가입하기" onclick="subButton()"><input
				type="reset" value="초기화"><input type="button" value="메인으로"
				onclick="location.href='Main.jsp'">
	</form>
</body>
</html>
