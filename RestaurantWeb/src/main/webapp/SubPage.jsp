<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function checkIdDup(){
		var regExpId = /^(?=.*[a-zA-Z])[a-zA-Z0-9-_]+$/;
		var form = document.subForm;
		var userId = form.id.value;
		fetch("idCheck", {
			method: "POST",
			headers:{
				"Content-Type": "text/plain"
			},
			body: userId
			})
			.then((response) => {
				if(!response.ok){
					return;
				}
				return response.text()
			})
			.then((result) => {
				if(result === "Dup"){
					alert("사용중인 아이디입니다");
					return;
				}else{
					if(!regExpId.test(form.id.value) || form.id.value.length < 4 || form.id.value.length > 12){
						alert("아이디를 확인해주세요\n4~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다");
						return;
					}else{
						if(document.subForm.reId.value === "ID변경하기"){
							document.getElementsByName("id")[0].readOnly = false;
							document.getElementsByName("reId")[0].value = "ID중복확인";
						}else{
							alert("사용가능합니다")
							document.getElementsByName("id")[0].readOnly = true;
							document.getElementsByName("reId")[0].value = "ID변경하기";
						}
				}
			}
		})
	}
	function subButton(){
		var phonePattern = /^\d+$/;
		var form = document.subForm;
		if (form.reId.value === "ID중복확인"){
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
			return;
		}else{
			alert("회원가입 완료되었습니다");
			form.submit();
		}
	}
</script>
<style type="text/css">
body{
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 100%;
}
.container{
	border: 1px solid black;
	width: 700px;
	height: 800px;
}
.thisform{
border: 1px solid red;
	width:100%;
	height: 80%;
	flex-glow:1;
	
}
.Btns{
border: 1px solid blue;
	width:100%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
	box-sizing: border-box;
}
.a{
	display: block;
	width:60%;
	padding: 10px;
	margin: 20px 0px 20px 20px;
}
.checkIdBtn{
	width:10%;
	padding: 9px;
	margin: 0;

}
.b{
	display: block;
	width:70%;
	padding: 10px;
	margin: 20px;
}
.c{
	display: block;
	width:40%;
	padding: 10px;
	margin: 20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form name="subForm" method="post" action="insert">
		<div class="thisform">
			<input type="text" name="id" placeholder="아이디" class="a"><input type="button"
				name="reId" value="ID중복확인" onclick="checkIdDup()" class="checkIdBtn">
				
			<input type="password" name="pw" placeholder="비밀번호" class="b">
			
			<input type="password" name="repw" placeholder="비밀번호 확인" class="b">
			
			<input type="text" name="name" placeholder="이름" class="b">
			
			<input type="text" name="phone" placeholder="전화번호 입력" class="b">
			</div>
			<div class="Btns">
			<input type="button" value="가입하기" onclick="subButton()" class="c"><input
				type="button" value="메인으로" onclick="location.href='Main.jsp'" class="c">
			</div>
	</form>
</div>
</body>
</html>

<!-- async function reIdCheck(){
		var regExpId = /^(?=.*[a-zA-Z])[a-zA-Z0-9-_]+$/;
		const isDup = await checkIdDup();
		alert("a")
		if(isDup === 1){
			alert("사용중인 아이디입니다");
			return;
		}else{
			alert(isDup)
			if(!regExpId.test(form.id.value) || form.id.value.length < 4 || form.id.value.length > 12){
				alert("아이디를 확인해주세요\n4~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다");
				return;
			}else{
				if(document.subForm.reId.value === "ID변경하기"){
					document.getElementsByName("id")[0].readOnly = false;
					document.getElementsByName("reId")[0].value = "ID중복확인";
				}else{
					document.getElementsByName("id")[0].readOnly = true;
					document.getElementsByName("reId")[0].value = "ID변경하기";
				}
			}
		}
	} -->
<!-- <input type="button" name="getConfirmNum" value="인증번호 받기"> (나중에 인증번호 random으로 구현해보기)-->