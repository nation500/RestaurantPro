<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
	function subComment(){
		var form = document.delform;
		var body = document.getElementsByName("body")[0].value;
		if(body == ""){
			alert("내용을 입력해주세요");
		}else{
			form.submit();
		}
	}
//	function asdf(){
//		var currentURL = window.location.href;
//		var url = new URL(currentURL);
//		var path = url.pathname;
//	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=session.getAttribute("title")%>
	<p><%=session.getAttribute("writerName")%>,
		<%=session.getAttribute("date")%> <%=session.getAttribute("time")%>,
		<%=session.getAttribute("view")%>
	<p><%=session.getAttribute("body")%>
	<p><a href="board?page=1">목록</a>
	
<%if(session.getAttribute("id") != null && session.getAttribute("id").equals(session.getAttribute("writerID"))){
//	if((List)session.getAttribute("commentList") == null)%>
	<a href="BoardEditPage.jsp">글 수정</a>/<form action="deleteBoard" method="post" name="delForm"><input type="button" value="삭제" onclick="delFunction()"></form>
	<%}%><br>
	
<%if(session.getAttribute("id") == null){ %>
	<p>댓글작성 기능은 로그인 한 회원만 이용할 수 있습니다</p>
<%}else if(session.getAttribute("id") != null){
	List<Comment> commentList = (List<Comment>)session.getAttribute("commentList");
	for(i = 0; i < commentList.)
	%>
	<p><form action="subComment" method="post" name="comForm"><textarea rows="10" cols="40" name="body"></textarea><button onclick="subComment()">확인</button></form>
</body>
</html>