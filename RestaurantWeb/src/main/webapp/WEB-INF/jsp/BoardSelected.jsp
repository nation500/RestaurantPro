<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function delFunction(){
		var result = confirm("게시물을 삭제하시겠습니까?");
		if (result){
			document.delForm.submit();
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=session.getAttribute("title")%>
	<p><%=session.getAttribute("writerName")%>,
		<%=session.getAttribute("date")%>,
		<%=session.getAttribute("view")%>
	<p><%=session.getAttribute("body")%>
	<p><a href="board?page=1">목록</a>
	
<%if(session.getAttribute("id") != null && session.getAttribute("id").equals(session.getAttribute("writerID"))){%>
	<a href="BoardEditPage.jsp">글 수정</a>/<form action="deleteBoard" method="post" name="delForm"><input type="button" value="삭제" onclick="delFunction()"></form>
	<%} %>
</body>
</html>