<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>당신의 ID는 "<%=session.getAttribute("foundId") %>"입니다</h2>
<a href="logout">확인</a>
</body>
</html>