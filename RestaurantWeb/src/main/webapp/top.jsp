<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.right {
  float: right;
  display: flex;  
  flex-direction: row;  
  align-items: center;  
}

.button {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #1C1C1B;
  border: none;
  border-radius: 0.25rem;
  font-size: 5px;
  color: white;
  text-align: center;
  text-decoration: none;
  position: relative;
  margin-right: 10px;
}
</style>
<script>
<%
String userRole = (String)session.getAttribute("userRole");
%>

function checkLogin() {
	var id = '<%=(String)session.getAttribute("id")%>';
		if(id=="null"){ 
        	alert("로그인이 필요한 항목입니다."); 
        	return false;
        }
		return true;
	}
</script>
</head>
<body>
	<div class="right">
		<c:if test="${userRole != 'admin'}">	
			<form action="resview" method="post">
				<input type="submit" value="예약확인" class="button" onclick="return checkLogin()" />
			</form>
		</c:if>
		<c:if test="${userRole == 'admin'}">
			<form action="alllist" method="post">
				<input type="submit" value="모든 예약확인" class="button" />
			</form>
			<form action="todaylist" method="post">
				<input type="submit" value="오늘의 예약확인" class="button" />
			</form>
		</c:if>
	</div>
</body>
</html>