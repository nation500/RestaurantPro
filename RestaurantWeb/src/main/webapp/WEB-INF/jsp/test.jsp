<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function reIdCheck(){
		alert("a")
		fetch("idCheck")
			.then((response) => {
				if(!response.ok){
					alert("c")
				}
				return response.json()
			})
			.then((result) => {
				console.log(result)
			})
			.catch(() => {
				console.log("에러남")
			})
		alert("b")
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form name="subForm" method="post" action="insert">
		<p>
			아이디 : <input type="text" name="id"><input type="button"
				name="reId" value="ID중복확인" onclick="reIdCheck();">
	</form>
</body>
</html>