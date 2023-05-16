<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="edit" method="post">
	<input type="text" name="title" placeholder="제목" value="<%=session.getAttribute("title")%>"><br><br>
	<textarea name="body" placeholder="본문" style="width:500px; height:300px;"><%=session.getAttribute("body")%></textarea><br><br>
	<input type="submit" value="수정">
</form>
</body>
</html>