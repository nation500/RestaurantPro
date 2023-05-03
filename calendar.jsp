<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
<style>
	#reservation_time{
		margin:50px;
		width:600px;
		border-collapse:collapse;
		color: #505050;
	}
	#reservation_time td.top{
		padding-bottom: 20px;
		font-weight:700;
		font-size:25px;
	}
	#reservation_time td.content{
		padding-bottom: 50px;
	}
	#timeTable{margin-bottom:50px; padding:5px; width:200px; color:#505050;}
	#timeTable td{padding:8px;}
	
	#selectedDate{width: 200px; height: 20px; padding: 10px; 
				  color: #505050; font-size: 17px; background-color: #fff; border: 1px solid #dcdcdc;}
	#selectedTime{width: 200px; height: 20px; padding: 10px;
				  color: #505050; font-size: 17px; background-color: #fff; border: 1px solid #dcdcdc;}
	#selectedPrice{width: 200px; height: 20px; padding: 10px;
					color: #505050; font-size:17px; background-color: #fff; border: 1px solid #dcdcdc;}
	
	#btn_submit{
		margin:0;
		padding:20px;
		text-align: center;
		text-decoration: none;
		font-size: 20px; color:#fff;
		background-color: #ace2f9;
		font-weight: 700;
		border: none;
		display: inline-block;
		width: 300px;
	}
	
	#btn_submit:hover{
		margin:0;
		padding: 20px;
		text-align: center;
		text-decoration: none;
		font-size: 20px; color:#ace2f9;
		background-color: #fff;
		font-weight: 700;
		border: 1px solid #ace2f9;
		display: inline-block;
		width: 300px;
	}
	
</style>
</head>
<script type="text/javascript">
	//------------- calendar----------------
	var today = new Date();
	var date = new Date();
	//사용자가 클릭한 셀 객체 저장
	var selectedCell;

	//사용자가 클릭한 일자의 월, 일 객체
	var selectedMonth = null;
	var selectedDate = null;
	//오늘 기준으로 구현하는 월, 일 객체
	var realMonth = date.getMonth() + 1;
	var realToday = date.getDate();
	
	//달력 제작(이번달 기준)
	function buildCalendar() {
		var row = null
		var cnt = 0;
		//달력객체
		var calendarTable = document.getElementById("calendar");
		//달력의 타이틀 객체획득
		var calendarTableTitle = document.getElementById("calendarTitle");
		//타이틀 수정
		calendarTableTitle.innerHTML = today.getFullYear() + "년"
				+ (today.getMonth() + 1) + "월";
		//현재 참조중인 월
		var nowMonth = today.getMonth() + 1;
		//이번달이면 0, 다음달이면 1리턴
		var monthEquals = thisMonth(nowMonth, realMonth);

		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

		//테이블 초기화
		while (calendarTable.rows.length > 2) {
			calendarTable.deleteRow(calendarTable.rows.length - 1);
		}
		//셀 입력을 위해 테이블 개행
		row = calendarTable.insertRow();

		//달의 첫 날 전까지 빈 셀 생성
		for (i = 0; i < firstDate.getDay(); i++) {
			cell = row.insertCell();
			cnt += 1;
		}

		row1 = calendarTable.insertRow();

		for (i = 1; i <= lastDate.getDate(); i++) {
			cell = row.insertCell();
			cnt += 1;

			cell.setAttribute('id', i);
			cell.innerHTML = i;
			cell.align = "center";

			cell.onclick = function() {
				clickedYear = today.getFullYear();
				clickedMonth = (1 + today.getMonth());
				clickedDate = this.getAttribute('id');

				clickedDate = clickedDate >= 10 ? clickedDate : '0'
						+ clickedDate;
				clickedMonth = clickedMonth >= 10 ? clickedMonth : '0'
						+ clickedMonth;
				clickedYMD = clickedYear + "-" + clickedMonth + "-"
						+ clickedDate;

				opener.document.getElementById("date").value = clickedYMD;
				self.close();
			}

			if (cnt % 7 == 1) {
				cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
			}

			if (cnt % 7 == 0) {
				cell.innerHTML = "<font color=skyblue>" + i + "</font>";
				row = calendar.insertRow();
			}
		}

		if (cnt % 7 != 0) {
			for (i = 0; i < 7 - (cnt % 7); i++) {
				cell = row.insertCell();
			}
		}
	}

	//전달 달력
	function prevCalendar(){
		if (today.getMonth() < realMonth){
			alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");	
			return false;
		}
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
	//다음달 달력
	function nextCalendar(){
		if(today.getMonth()+1 == (realMonth + 1)){
			alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
			return false;
		}
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
	
	// 예약불가능한 일자 계산
	function exchangeToPosiblyDay(num){
		result = num % 7;
		result -= 1;
		if(result == -1){
			result = 6;
		}
		return result;
	}
	
	function thisMonth(todayMonth, dateMonth){
		if(todayMonth*1 == dateMonth*1){
			return 0;
		}
		return 1;
	}	
	
</script>
<body>
	<table id ="reservation_time">
		<tr>
			<td class="top" align="left">시간선택</td>
			<td class="top" align="right">
			<table id="timeTable"></table>
			<button class="btnTime" type="button" onclick="tableinit()">초기화</button></td>
		</tr>	
		<tr>
			<td>
				<table id="calendar" align="center" width="500" height="400">
					<tr>
						<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
					</tr>
					<tr>
						<td align="center"><font color="#F79DC2">일</td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color="skyblue">토</td>
					</tr>
				</table>
			</td>
			<td>
				<table id="timeTable">	</table>
			</td>
		</tr>
		<tr>
			<td class="top" align="left" colspan="2">예약일시</td>
		</tr>
		<tr>
			<td class="content" colspan="2" align="left">
				<input id="selectedDate"  name="selectedDate" value="" readonly="readonly"></input>
				<input id="selectedTime"  name="selectedTime" value="" readonly="readonly"></input>
			</td>
		</tr>
		<tr>
			<td class="top" align="left">결제정보</td>
		</tr>
		<tr>
			<td class="content" align="left" colspan="2">
				<input id="selectedPrice"  style="text-align:right;" name="selectedPrice" value="" readonly="readonly">원</input>
			</td>
		</tr>
		<tr>
			<td class="content" align="left" colspan="2">
			<input id="btn_submit" type="button" value="결제하기" onclick="submitRes()"></td>
		</tr>
	</table>
<script type="text/javascript">buildCalendar();</script>
</body>
</html>