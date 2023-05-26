<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--<script type="text/javascript">
	function verifyPW(){
		var form = document.changepw;
		var oldpw = form.oldpw.value;
		var pw = form.pw.value;
		var repw = form.repw.value;
		if(pw.equals(repw) && oldpw.equals(<%=session.getAttribute("oldpw") %>)){
			form.submit();
		}else if (!pw.equals(repw)){
			alert("재입력한 비밀번호가 일치하지 않습니다")
		}else{
			alert("현재 비밀번호가 틀렸습니다")
		}
	}
</script>
 -->
<head>
<style>
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
}
.topDiv {
	position :fixed;
	  background-color: #1C1C1B;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 50px;
	  z-index: 1; /* 헤더가 위로 오도록 설정 */
	}
.headDiv {
	  position : fixed;	
	  background-color: #1C1C1B;
	  top: 50px; /* top의 높이만큼 내려옴 */
	  left: 0;
	  width: 100%;
	  height: 50px;
	  z-index: 1; /* 헤더가 위로 오도록 설정 */
	}
section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 300px;
	padding-bottom: 63px;
	text-align: center;
}
.as{
	display: inline-block;
	margin-top: 4px;
	margin-left: 4px;
	margin-right: 4px;
}
.as{
	background-color: #1C1C1B;
	color: #C0C0C0;
	border: 1px solid #C0C0C0;
	font-size: 12px;
	text-decoration: none;
	padding: 4px 6px;
}
.as{
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="topDiv">
<%@include file="top.jsp"%>
</div>
<div class="headDiv">
<%@include file="Header.jsp" %>
</div>
<section>
<form action="changepw" method="post" name="changepwForm">
	<h3>비밀번호 변경</h3>
	<input type="password" placeholder="현재 비밀번호" name="oldpw"><br>
	<input type="password" placeholder="새 비밀번호" name="pw"><br>
	<input type="password" placeholder="비밀번호 재입력" name="repw"><br><br>
	<input type="submit" value="확인" class="as"><input type="button" value="취소"  class="as" onclick="location.href='MyInfoPage.jsp'">
</form>
</section>
</body>
</html>