<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 변경</title>
<style>
 
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
#reservation_time {
	margin: 50px;
	width: 600px;
	border-collapse: collapse;
	color: #505050;
}

#reservation_time td.top {
	padding-bottom: 20px;
	font-weight: 700;
	font-size: 25px;
}

#reservation_time td.content {
	padding-bottom: 50px;
}
#calendar{margin-bottom:50px; padding: 10px; color: #505050; border: 1px solid #dcdcdc;}

#calendar td {padding:10px;	}

#timeTable {
	text-align:center;
	margin-bottom: 50px;
	padding: 5px;
	width: 200px;
	color: #505050;
}

#timeTable td {
	padding: 8px;
}


#personTable{
	border: 1px solid #dcdcdc;
}
#date {
	width: 200px;
	height: 20px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}

#time {
	width: 200px;
	height: 20px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}

#price {
	width: 200px;
	height: 20px;
	padding: 10px;
	color: #505050;
	font-size: 17px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
}
#btnTime{
	text-align: center;
	text-decoration : none;
	color : #fff;
	background-color : #ace2f9;
	border : none;
	display : inline-block;
	height: 40px;
	width: 70px;
	border : 1px solid;
}
#btnTime:hover{
	text-align: center;
	text-decoration: none;
	color: #ace2f9;
	background-color: #fff;
	border: 1px solid #ace2f9;
	display: inline-block;
	
}
#btn_submit {
	margin: 0;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	color: #fff;
	background-color: #ace2f9;
	font-weight: 700;
	border: none;
	display: inline-block;
	width: 300px;
}

#btn_submit:hover {
	margin: 0;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	color: #ace2f9;
	background-color: #fff;
	font-weight: 700;
	border: 1px solid #ace2f9;
	display: inline-block;
	width: 300px;
}
#reslist{
	margin : 50px;
	text-align: center;
	padding:5px;
	color:#505050;
	border-collapse: collapse;
  	border-top: 3px solid #168;
}
#reslist th {
  color: #168;
  background: #f0f6f9;
}
#reslist th, #reslist td {
  padding: 10px;
  border: 1px solid #ddd;
}
#reslist th:first-child, #reslist td:first-child {
  border-left: 0;
}
#reslist th:last-child, #reslist td:last-child {
  border-right: 0;
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

		//요일 입력(셀 생성)
		for (i = 1; i <= lastDate.getDate(); i++) {
			//예약하지 못하는 조건일경우 +1 noCount가 0일시에만 클릭함수적용
			noCount = 0;
			cell = row.insertCell();
			
			//cell에 id부여
			cell.setAttribute('id', i);
			cell.innerHTML = i;
			cell.align = "center";
			
			//셀 생성 후 count 증가
			cnt += 1;
			
			// 일요일 빨갛게 표시
			if (cnt % 7 == 1) {
				cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
			}
			
			// 토요일 파랗게 표시
			if (cnt % 7 == 0) {
				cell.innerHTML = "<font color=skyblue>" + i + "</font>";
				row = calendar.insertRow();
			}
			
			//예약불가일 색상변경 (오늘 이전 또는 30일 이후) 및 사용자가 직접 지정한 경우
			etp = exchangeToPosibleDay(cnt)*1;
			
			if(nowMonth == realMonth && i <= realToday){
				noCount += 1;
			} else if (nowMonth > realMonth && i > realToday){
				noCount += 1;
			} 
			
			if (noCount > 0){
				cell.style.backgroundColor = "#E0E0E0";
				cell.innerHTML = "<font color='#C6C6C6' >" + i + "</font>";
			}else{
				cell.onclick = function() {
 				selectedTimeAndTotalPriceInit();	
 				personReset();
				//선택된 날의 연,월,일 계산
				clickedYear = today.getFullYear();
				clickedMonth = (1 + today.getMonth());
				clickedMonth = clickedMonth >= 10 ? clickedMonth : '0'
						+ clickedMonth;
				clickedDate = this.getAttribute('id');
				clickedDate = clickedDate >= 10 ? clickedDate : '0'
						+ clickedDate;
				clickedYMD = clickedYear + "-" + clickedMonth + "-"
						+ clickedDate;
				
				//하단에 예약일시 표시
				inputField = document.getElementById("date");
				inputField.value = clickedYMD;
				
				//선택된 월, 일 변수 저장
				selectedMonth = today.getMonth() +1;
				selectedDate = this.getAttribute('id');
				
				//선택된 셀 색 변화
				if(selectedCell != null){
					selectedCell.bgColor = "#FFFFFF";
				}
				selectedCell = this;
				this.bgColor = "#FBEDAA";
				
				//time table 생성
				timeTableMaker(today.getMonth()+ 1, this.getAttribute('id'));
				}
			}
		}
		//달의 마지막 날 뒤 행의 빈 공간을 셀로 채우기
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
	
	//사용자가 입력한 예약불가능 일자와 대조하기 위해 0~7의 환형 계산구조
	function exchangeToPosibleDay(num){
		result = num % 7;
		result -= 1;
		if (result == -1) {
			result = 6;
		}
		return result; 
	}
	
	function thisMonth(todayMonth, dateMonth){
		console.log("todayMonth : " + todayMonth + ", dateMonth : " + dateMonth);
		if(todayMonth*1 == dateMonth*1){
			return 0;
		}
		return 1;
	}	
	
	
	//----------time table ----------
	 var price = 50000;
	var startTime = 12;
	var endTime = 19; 
	
	//사용자가 시간표에서 선택한 시간
	var selectedFirstTime = 24*1;
	var selectedFinalTime = 0*1;
	
	//시간표 제작
	function timeTableMaker(selectedMonth, selectedDate){
		row = null;
		month = selectedMonth;
		date = selectedDate;
		var timeTable = document.getElementById("timeTable");

	//테이블 초기화
	while(timeTable.rows.length > 0){
		timeTable.deleteRow(timeTable.rows.length-1);
	}
	
	var startTimes = [12, 12.5, 13, 18, 18.5, 19];
	
	//시간표 테이블 생성
	for(i= 0; i < startTimes.length; i++){
		cellTime = startTimes[i];
		
		//12.5와 18.5로 나올때 12:30분과 18:30분으로 바꿔서 출력
		if (cellTime == 12.5){
			cellStartTimeText = "12:30";
			cellEndTimeText = "14:30";
		} else if (cellTime == 18.5){
			cellStartTimeText = "18:30";
			cellEndTimeText = "20:30";
		} else {
		cellStartTimeText = cellTime + ":00";
		cellEndTimeText = (cellTime + 2) + ":00";
		}
		
		inputCellText = cellStartTimeText + " ~ " + cellEndTimeText;
		
		row = timeTable.insertRow();
		cell = row.insertCell();
		cell.setAttribute('id', cellTime);
		cell.innerHTML = inputCellText;
		
		//cell 클릭이벤
		cell.onclick = function(){
			cellTime = this.getAttribute('id');
			cellTime = cellTime*1;
			
		//예약일시 입력처리
		if (selectedFirstTime && selectedFinalTime) {
  			if (cellTime <= selectedFinalTime || cellTime >= selectedFirstTime ) {
    		alert("2개 이상의 예약을 선택할 수 없습니다.");
    		return false;
  			}
		}
		
		this.bgColor = "#fbedaa";
		if(cellTime < selectedFirstTime){
			selectedFirstTime = cellTime
		}
		if(cellTime > selectedFinalTime){
			selectedFinalTime = cellTime
		}
		
		 
		//하단의 예약일시에 시간 표시
		if (selectedFirstTime == 12.5){
			selectedFirstTime = 12;
			selectedFinalTime = 14;
			resTime = selectedFirstTime + ":30 ~ " + selectedFinalTime + ":30";
		}else if (selectedFirstTime == 18.5){
			selectedFirstTime = 18;
			selectedFinalTime = 20;
			resTime = selectedFirstTime + ":30 ~ " + selectedFinalTime + ":30";
		}else{
			resTime = selectedFirstTime + ":00 ~ " + (selectedFinalTime + 2) + ":00";
		}
		resTimeForm = document.getElementById("time");
		resTimeForm.value = resTime;
	}
	}
	
// -------------- 인원수 -------------------- 
	
	var personTable = document.querySelectorAll("#personTable td");
	
	// 인원수를 가져옴
	var selectedPerson = document.querySelector("#personTable td.selected");

	for (i = 0; i < personTable.length; i++){
		personTable[i].onclick = function(){
			//클릭한 td의 색상변경
			this.style.backgroundColor = "#fbedaa";
			
			//다른 td들의 색상초기화
			for(j = 0; j < personTable.length; j++){
				if ( personTable[j] !== this){
					personTable[j].style.backgroundColor= "";
				}
			}
			
			//하단의 결제정보에 금액표시
			var personValue = parseInt(this.textContent);
			var resPriceForm = 	document.getElementById("price");
			var personForm = document.getElementById("person");
			resPriceForm.value = personValue * 50000;
			personForm.value = personValue;

		};
	}
	}
	
	
	function clearSelectedCell(){
		//선택된 셀의 색상 초기화
		if (selectedCell){
			selectedCell.bgColor = "#FFFFFF";
			selectedCell = null;
		}
		//선택된 일자 초기화
		selectedMonth = null;
		selectedDate = null;
	}
	
	
	//날자 클릭시 예약시간 및 결제정보 초기화
	function selectedTimeAndTotalPriceInit() {
  	resDateForm = document.getElementById("date");
  	resTimeForm = document.getElementById("time");
  	resPriceForm = document.getElementById("price");
  	
  	resTimeForm.value = "";
  	resDateForm.value = "";
  	resPriceForm.value = "";
  	
  	selectedFirstTime = 24*1;
  	selectedFinalTime = 0*1;
  	price = 0*1;
		selectedPerson = null;
		for (i = 0; i < personTable.length; i++){
			personTable[i].classList.remove("selected");
		}
}
	//인원수 초기화
	function personReset(){
		 var personTable = document.querySelectorAll("#personTable td");
		 for(var i = 0; i < personTable.length; i++){
			 personTable[i].style.backgroundColor ="";
		 }
		 var selectedPerson = document.querySelector("#personTable td.selected");
		 if (selectedPerson){
			 selectedPerson.classList.remove("selected");
		 }
	}
	
	//시간표 초기화
	function tableinit(){
		clearSelectedCell();
		selectedTimeAndTotalPriceInit();
		personReset(); 
		timeTableMaker(selectedMonth, selectedDate);
		buildCalendar();
		  
	}
	
	var queryString = window.location.search;
	var urlParams = new URLSearchParams(queryString);
	
	var no = urlParams.get('no');
	var name = urlParams.get('name');
	var phone = urlParams.get('phone');
	var date = urlParams.get('date');
	var time = urlParams.get('time');
	var person = urlParams.get('person');
	var notice = urlParams.get('notice');
	
	var reslistTable = document.getElementById("reslist");
	var row = reslistTable.insertRow(1); // 새로운 행 추가
	
	// 각 셀에 값 집어넣음
	row.insertCell(0).textContent = name;
	row.insertCell(1).textContent = phone;
	row.insertCell(2).textContent = date;
	row.insertCell(3).textContent = time;
	row.insertCell(4).textContent = person;
	row.insertCell(5).textContent = notice;
	
	//입력 안된곳 있을시 출력
	function submitRes(){
		var form = document.resupdateForm;
		arr = new Array();
		
		dateForm = document.getElementById("date");
		timeForm = document.getElementById("time");
		priceForm = document.getElementById("price");

		arr.push(dateForm);
		arr.push(timeForm);
		arr.push(priceForm);
		
		 for (i = 0; i < arr.length; i++) {
			    item = arr[i];
			    if (!item || !item.value) {
			      alert("미기입된 정보가 있습니다.");
			      if (item) {
			        item.focus();
			      }
			      return false;
			    }
			  }
		 
	 	form.submit();
	}
	
</script>
<body>
<%
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String person = request.getParameter("person");
	String notice = request.getParameter("notice");
%>
<div class="tp">
		<%@include file ="top.jsp" %>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<section>
	<h1>현재 예약시간</h1>
	<form action="resupdate"  name="resupdateForm" method="post">
		<table id="reslist" >
		<input type="hidden" name="no" value="<%=no %>">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="phone" value="<%=phone %>">
		<tr>
			<th>이름</th>
			<th>연락처</th>
			<th>날짜</th>
			<th>시간</th>
			<th>인원수</th>
			<th>특이사항</th>
		</tr>
		<tr>
			<td><%=name %></td>
			<td><%=phone %></td>
			<td><%=date %></td>
			<td><%=time %></td>
			<td><%=person %></td>
			<td><%=notice %></td>
		</tr>
	</table>
	<table id="reservation_time">
		<tr>
			<td class="top" align="left">시간선택</td>
			<td class="top" align="right"><button id="btnTime" type="button" onclick="tableinit()">초기화</button>	</td>
		</tr>
		<tr>
			<td>
				<table id="calendar" align="center" width="500" height="400">
					<tr>
						<td align="center"><label onclick="prevCalendar()"> ◀
						</label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶
						</label></td>
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
				<table id="timeTable">		</table>
			</td>
		</tr>
		<tr>
			<td class="top" align="left" colspan="2">인원수</td>
		</tr>
		<tr>
			<td>
				<table id="personTable" align="center"  width="500" height="30">	
					<tr>
						<td align="center">1명</td>
						<td align="center">2명</td>
						<td align="center">3명</td>
						<td align="center">4명</td>
						<td align="center">5명</td>
						<td align="center">6명</td>
						<td align="center">7명</td>
						<td align="center">8명</td>
					</tr>
				</table>
				<input type="hidden" id="person" name="person" value="">
			</td>
		</tr>
		<tr>
			<td class="top" align="left" colspan="2">예약일시</td>
		</tr>
		<tr>
			<td class="content" colspan="2" align="left">
			<input id="date" name="date" value="" readonly="readonly"></input>
			<input id="time" name="time" value="" readonly="readonly"></input>
			</td>
		</tr>
			<input type="hidden" id="price" style="text-align: right;" name="price" value="" readonly="readonly"> 
		<tr>
			<td class="top" align="left">특이사항</td>
		</tr>
		<tr>
			<td>
			<textarea id="notice" name="notice" rows="5" cols="70"></textarea>
			</td>
		</tr>	
		<tr>
			<td class="content" align="left" colspan="2">
			<input	id="btn_submit" type="button" value="예약 변경하기" onclick="submitRes()">
			</td>
		</tr>
	</table>
	</form>
	<script type="text/javascript">buildCalendar();</script>
	</section>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
	
</body>
</html>