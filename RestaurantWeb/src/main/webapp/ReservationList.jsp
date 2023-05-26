<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약확인</title>
<style type="text/css">

.tp {
position :fixed;
  background-color: #1C1C1B;
  top: 0;
  left: 0;
  width: 100%;
  height: 50px;
}
.header {
  position : fixed;	
  background-color: #1C1C1B;
  top: 50px; /* top의 높이만큼 내려옴 */
  left: 0;
  width: 100%;
  height: 50px;
}
section {
	padding-top: 100px;
	padding-bottom: 63px;
}
footer {
	position: fixed;
	background-color: #141414;
	text-align: center;
	color: white;
	font-size: 6px;
	bottom: 0;
	left: 0;
	width: 100%;
}
body {
  display: flex;
  justify-content: center;
  align-items: center;
}
#reservationList {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
#reservationList th {
  color: #168;
  background: #f0f6f9;
}
#reservationList th, #reservationList td {
  padding: 10px;
  border: 1px solid #ddd;
  text-align: center;
}
#reservationList th:first-child, #reservationList td:first-child {
  border-left: 0;
}
#reservationList th:last-child, #reservationList td:last-child {
  border-right: 0;
}
</style>
<script type="text/javascript">

//예약 취소 확인창
function confirmCancellation(button) {
  var confirmation = confirm("예약을 취소 하시겠습니까?");
  
  if (confirmation) {
    // 사용자가 "확인"을 선택한 경우
    resdelete(button);
  } else {
    // 사용자가 "취소"를 선택한 경우
    // 추가로 실행할 로직을 작성하거나 아무 작업도 수행하지 않습니다.
  }
}

// 예약 취소
function resdelete(button) {
  var row = button.parentNode.parentNode; // 삭제할 행을 찾기 위해 버튼의 부모 요소들을 탐색합니다.
  row.parentNode.removeChild(row); // 행을 테이블에서 삭제합니다.

  var no = row.querySelector("input[name='no']").value; // 삭제할 데이터의 번호를 가져옵니다.

  var xhr = new XMLHttpRequest();
  xhr.open("POST", "resdelete", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        // 취소된 예약에 대한 추가 처리 로직을 작성할 수 있습니다.
      } else {
        alert("취소되었습니다.");
      }
    }
  };

  xhr.send("no=" + encodeURIComponent(no));
}

function resUpdate(button) {
  var row = button.parentNode.parentNode; // 버튼의 상위 요소인 <tr>을 가져옴
  var no = row.querySelector("#no").value; // 예약 번호 값
  var name = row.cells[0].textContent; // 이름 값
  var phone = row.cells[1].textContent; // 전화번호 값
  var date = row.cells[2].textContent; // 날짜 값
  var time = row.cells[3].textContent; // 시간 값
  var person = row.cells[4].textContent; // 인원수 값
  var notice = row.cells[5].textContent; // 메모 값

  // 값들을 다른 페이지로 전달하는 로직 작성
  // 예를 들어, URL 쿼리 파라미터를 통해 전달하거나 폼을 생성하여 값을 담고 페이지 이동 등을 수행할 수 있습니다.
  // 아래는 URL 쿼리 파라미터를 사용하여 값을 전달하는 예시입니다
	  var url = "ReservationUpdate.jsp" + "?no=" + encodeURIComponent(no) + "&name=" + encodeURIComponent(name) + "&phone=" + encodeURIComponent(phone) + "&date=" + encodeURIComponent(date) + "&time=" + encodeURIComponent(time) + "&person=" + encodeURIComponent(person) + "&notice=" + encodeURIComponent(notice);
	  
	  // 전달할 페이지로 이동
	  window.location.href = url;
}
</script>
</head>
<body>
<div class="tp">
		<%@include file ="top.jsp" %>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<section>
	<h1>내 예약 확인</h1>
	<table id="reservationList">
  <thead>
    <tr>
      <th>이름</th>
      <th>연락처</th>
      <th>날짜</th>
      <th>시간</th>
      <th>인원수</th>
      <th>메모</th>
      <th>변경</th>
      <th>취소</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="reservationList" items="${reservationList}">
      <tr>
<!--    <td>${reservation.no}</td>--> 
        <td> ${reservationList.name}</td>
        <td><c:set var="formattedPhone" value="${reservationList.phone.substring(0, 3)}-${reservationList.phone.substring(3, 7)}-${reservationList.phone.substring(7, 11)}" />
  			${formattedPhone}</td>
        <td>${reservationList.date}</td>
        <td>${reservationList.time}</td>
        <td>${reservationList.person}</td>
        <td>${reservationList.notice}</td>
        <td><input type="button" value="예약 변경" onclick="resUpdate(this)">
        	<input type="hidden" id="no" name="no" value="${reservationList.no}"/></td>
        <td><input type="button" value="예약 취소" onclick="confirmCancellation(this)"></td>
      </tr>
    </c:forEach>
    
  </tbody>
</table>
</section>
<footer>
		<%@include file="Footer.jsp"%>
	</footer>
</body>
</html>