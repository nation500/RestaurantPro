<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="submitBoard" method="post">
	<input type="text" name="title" placeholder="제목"><br><br>
	<textarea name="body" placeholder="본문" style="width:500px; height:300px;"></textarea><br><br>
	<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
	<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
	<input type="submit" value="작성">
</form>
</body>
</html>