<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function reIdCheck(){
		var form = document.subForm;
		var id = form.id.value;
		var IdChecked = false;
		fetch("idCheck", {
			method: "POST",
			headers:{
				"Content-Type": "text/plain"
			},
			body: id
			})
			.then((response) => {
				if(!response.ok){
					alert("not ok")
					return;
				}
				return response.text()
			})
			.then((result) => {
				if(result === "Dup"){
					IdChecked = false;
					alert(IdChecked);
				}else{
					IdChecked = true;
					alert("b");
				}
			})
		
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form name="subForm" method="post" action="">
		<p>
			아이디 : <input type="text" name="id"><input type="button"
				name="reId" value="ID중복확인" onclick="reIdCheck()">
	</form>
</body>
</html>