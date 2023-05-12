<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function writeBtn(){
		if(<%=session.getAttribute("id")%> == null || <%=session.getAttribute("id")%>.equals("")){
			alert("로그인 한 회원만 이용할 수 있는 기능입니다");
			location.href="LoginPage.jsp"
		}
		location.href="BoardWritePage.jsp"
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판에 게시물이 없습니다!</h1>
<input type="button" value="글쓰기" onclick="writeBtn()">
</body>
</html>