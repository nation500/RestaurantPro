<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gildong</title>
<style type = "text/css">
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
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
section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 100px;
	padding-bottom: 63px;
}
footer {
	position: fixed;
	background-color: #141414;
	text-align: center;
	color: white;
	font-size: 6px;
	bottom: 0px;
	left: 0;
	width: 100%;
}
body {
	text-align: center;
}

/* 이미지 서서히 나타나는 효과를 위한 CSS */
#image {
  opacity: 0;
  transition: opacity 1s ease-in-out;
}
</style>
<script type="text/javascript">
// 이미지 파일 경로 배열
var imageFiles = ["img/bg_body01.jpg", "img/bg_body02.jpg"];
var currentIndex = 0; // 현재 이미지 인덱스
var isFirstLoad = true; // 페이지 첫 로딩 여부

//이미지 변경 함수
function changeImage() {
  var image = document.getElementById("image");
  image.style.opacity = "0"; // 이미지의 투명도를 0으로 설정하여 서서히 사라지게 함

  // 일정 시간 후에 다음 이미지로 변경
  setTimeout(function () {
    image.src = imageFiles[currentIndex];
    image.style.opacity = "1"; // 이미지의 투명도를 1로 설정하여 서서히 나타나게 함
    currentIndex = (currentIndex + 1) % imageFiles.length; // 다음 이미지 인덱스로 변경

    // 마지막 이미지인 경우 첫 번째 이미지로 돌아감
    if (currentIndex === 0) {
      setTimeout(changeImage, 3000); // 3초 후에 이미지 변경 시작
    } else {
      setTimeout(changeImage, 3000); // 3초 후에 이미지 변경 시작
    }
  }, 1000); // 1초 후에 이미지 변경
}

// 페이지 로드 시 이미지 초기화
function initImage() {
  var image = document.getElementById("image");
  image.src = imageFiles[currentIndex];
  image.style.opacity = "1"; // 이미지를 나타내기 위해 투명도를 1로 설정

  if (isFirstLoad) {
    isFirstLoad = false;
    currentIndex = 1; // 이미지 변경을 위해 두 번째 이미지 인덱스로 설정
    setTimeout(changeImage, 3000); // 3초 후에 이미지 변경 시작
  } else {
    setTimeout(changeImage, 3000); // 이미지 변경 시작
  }
}
// 페이지 로드 시 초기화 함수 호출
window.onload = initImage;

</script>
<body>
	<div class="top">
		<%@include file ="top.jsp" %>
	</div>
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<section>
		<img id="image" src="" alt="">
	</section>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
</body>
</html>