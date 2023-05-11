<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function confirmDel(){
		var form = document.deleteForm;
		var pw = prompt("비밀번호를 입력해주세요", "password");
		if(pw != null){
			form.elements["pw"].value = pw;
			form.submit();
		}else{
			alert("비밀번호를 입력해주세요");
			location.href="MyInfoPage.jsp";
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=session.getAttribute("name") %></h3>
	<p>아이디 : <%=session.getAttribute("id") %>
	<p>전화번호 : <%=session.getAttribute("phone1") %>-<%=session.getAttribute("phone2") %>-<%=session.getAttribute("phone3") %><br><br>
	<form action="delete" method="post" name="deleteForm">
		<input type="button" value="비밀번호 변경" onclick="location.href='ChangePWPage.jsp'">
		<input type="button" value="회원 탈퇴" onclick="confirmDel()">
		<input type="hidden" id = "pw" name="pw">
		<input type="button" value="취소" onclick="location.href='Main.jsp'">
	</form>
</body>
</html>