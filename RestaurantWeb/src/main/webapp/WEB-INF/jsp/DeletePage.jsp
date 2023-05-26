<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function clicked(){
		var isChecked = document.getElementsByName("check")[0].checked;
		var password = document.getElementsByName("pw")[0].value;
		if (isChecked && password != ""){
			document.deleteForm.submit();
		}else if (!isChecked){
			alert("내용을 확인하고 체크를 해주세요");
			return;
		}else if (password == ""){
			alert("비밀번호를 확인해주세요");
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	text-align: center;
}
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
}
.c{
	display: inline-block;
	margin-top: 4px;
	margin-left: 4px;
	margin-right: 4px;
}
.c{
	background-color: #1C1C1B;
	color: #C0C0C0;
	border: 1px solid #C0C0C0;
	font-size: 12px;
	text-decoration: none;
	padding: 4px 6px;
}
.c{
	cursor: pointer;
}
</style>
</head>
<body>
<div class="topDiv">
<%@include file="top.jsp"%>
</div>
<div class="headDiv">
<%@include file="Header.jsp" %>
</div>
<section>
	<input type="checkbox" value="yes" name="check">탈퇴에 동의합니다.<br><br>
	<form action="delete" method="post" name="deleteForm">
		<input type="password" name="pw" placeholder="비밀번호 입력">
		<input type="button" value="탈퇴" onclick="clicked()" class="c">
	</form>
</section>
</body>
</html>