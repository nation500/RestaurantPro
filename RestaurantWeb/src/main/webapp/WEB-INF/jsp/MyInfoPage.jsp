<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=session.getAttribute("name") %></h3>
	<p>아이디 : <%=session.getAttribute("id") %>
	<p>전화번호 : <%=session.getAttribute("phone1") %>-<%=session.getAttribute("phone2") %>-<%=session.getAttribute("phone3") %><br><br>
	<input type="button" value="비밀번호 변경" onclick="location.href='ChangePWPage.jsp'">
	<input type="button" value="회원 탈퇴" onclick="location.href='DeletePage.jsp'">
	<input type="button" value="취소" onclick="location.href='Main.jsp'">
</body>
</html>