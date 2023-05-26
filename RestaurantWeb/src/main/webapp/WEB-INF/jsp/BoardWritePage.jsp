<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA | gildong</title>
<style type="text/css">
body {
	text-align: center;
}

html {
	margin: 0;
	padding: 0;
	height: 100%;
}

.top {
	position: fixed;
	background-color: #1C1C1B;
	top: 0;
	left: 0;
	width: 100%;
	height: 50px;
	z-index: 1; /* 헤더가 위로 오도록 설정 */
}

.header {
	position: fixed;
	background-color: #1C1C1B;
	top: 50px; /* top의 높이만큼 내려옴 */
	left: 0;
	width: 100%;
	height: 50px;
	z-index: 1; /* 헤더가 위로 오도록 설정 */
}

section {
	color: white;
	padding-top: 300px;
	padding-bottom: 63px;
}
</style>
<script type="text/javascript">
	function back(){
		location.href = "BoardMain.jsp"
		
		
	}

</script>
</head>
<body>
	<div class="top">
		<%@include file="top.jsp"%>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<section>
		<form action="submitBoard" method="post">
			<input type="text" name="title" placeholder="제목" style="width: 500px;"><br>
			<br>
			<textarea name="body" placeholder="본문"
				style="width: 500px; height: 300px;"></textarea>
			<br>
			<br> <input type="hidden" name="id"
				value="<%=session.getAttribute("id")%>"> <input
				type="hidden" name="name" value="<%=session.getAttribute("name")%>">
			<input type="submit" value="작성">
			<input type="button" value="뒤로가기" onclick="back()">
		</form>
	</section>
</body>
</html>