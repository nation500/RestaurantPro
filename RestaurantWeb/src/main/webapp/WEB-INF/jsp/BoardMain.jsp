<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="RestaurantJava.Board" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function writeBtn(){
		if("<%=session.getAttribute("id")%>" != "null"){
			location.href="BoardWritePage.jsp";
		}else{
			location.href="noSession.jsp";
		}
	}
	function runSearch(){
		var form = document.srch;
		var keyword = form.elements["keyword"].value;
		if(keyword === ""){
			alert("검색어를 입력해주세요")
		}else{
			form.submit();
		}
	}
</script>
<head>
<meta charset="UTF-8">
<title>QnA | gildong</title>
<style>
.container {
	margin: 4% auto;
	width: 1200px;
}
a{
	text-decoration:none;
}
a:hover{
	text-decoration:underline;
}
table{
	border-collapse: collapse;
}
.rows{
	border-bottom: 1px solid black;
}
th {
	background-color: #f2f2f2;
	padding: 14px;
}
td{
	padding: 14px;
}
.num{
	width: 120px
}
.title{
	width: 720px
}
.name{
	width: 120px
}
.date{
	width: 120px
}
.view{
	width: 120px
}
#title{
	text-align:left;
}
.top {
position :fixed;
  background-color: #1C1C1B;
  top: 0;
  left: 0;
  width: 100%;
  height: 50px;
  z-index: 1; /* 헤더가 위로 오도록 설정 */
}
.header {
  position : fixed;	
  background-color: #1C1C1B;
  top: 50px; /* top의 높이만큼 내려옴 */
  left: 0;
  width: 100%;
  height: 50px;
  z-index: 1; /* 헤더가 위로 오도록 설정 */
}
.writeBtn, .listBtn{
	width: 90px;
	height: 30px;
}
.btns{
	text-align: center;
}
</style>
</head>
<body>
<div class="top">
		<%@include file ="top.jsp" %>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<%List<Board> boardList = (List<Board>)session.getAttribute("list"); %>
	<h1 style="text-align: center">문의 게시판</h1>
	<div class="container">
		<table>
			<thead>
				<tr style="text-align: center">
					<th class="num">번호</th>
					<th class="title">제목</th>
					<th class="name">작성자</th>
					<th class="date">작성일</th>
					<th class="view">조회</th>
				</tr>
			</thead>
			<%for(int i = 0; i < boardList.size(); ++i) {%>
				<tr class= "rows" style="text-align: center">
					<td class="num"><%=boardList.get(i).getNum() %></td>
					<td><a href="select?contNum=<%=boardList.get(i).getNum() %>" class="title" id="title"><%=boardList.get(i).getTitle() %></a></td>
					<td class="name"><%=boardList.get(i).getName() %></td>
					<td class="date"><%=boardList.get(i).getDate().toLocalDate() %></td>
					<td class="view"><%=boardList.get(i).getView() %></td>
				</tr>
			<%} %>
		</table>
	</div>
	<div class="btns">
	<p><input type="button" value="글 목록" onclick="location.href=board?page=1" class="listBtn"><input type="button" value="글쓰기" onclick="writeBtn()" class="writeBtn"></p><br>
	<p><form action="board" method="get">
	<%for(int i = 1; i <= Integer.parseInt(session.getAttribute("Bcnt").toString()); ++i) {%>
		<button name = "page" value="<%=i%>"><%=i %></button>
	<%} %>
	</form>
	<p><form action="search" method="get" name="srch">
		<input type="text" name="keyword" placeholder="제목, 내용"><input type="button" value="검색" onclick="runSearch()"><input type="hidden" name="page" value="1">
	</form>
	</div>
</body>
</html>