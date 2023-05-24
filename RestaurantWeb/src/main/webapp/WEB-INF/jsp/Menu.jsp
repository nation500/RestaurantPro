<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<style type="text/css">
html{
	background-color: #1A1A1A;
	margin: 0;
  	padding: 0;
  	height: 100%;
}
header {
	position: fixed;
	background-color: #1C1C1B;
	top:0;
	left: 0;
	width: 100%;
	height: 50px;
}

section {
	background-color: #1A1A1A;
	color: white;
	padding-top: 65px;
	padding-bottom: 11px;
}

footer {
	position: fixed;
	background-color: #141414;
	text-align: center;
	color: white;
	font-size: 6px;
	left: 0;
	width: 100%;
	bottom: 0;
}
body {
text-align: center;
}
.button {
	display: inline-block;
	padding: 0.5rem 1rem;
	background-color: #1C1C1B;
	border: none;
	border-radius: 0.25rem;
	font-size: 1rem;
	color: white;
	text-align: center;
	text-decoration: none;
	
}
.button:hover {
	color: #847F71;
}
</style>
<script type="text/javascript">
function showImage(imageName) {
	  var imageElement = document.getElementById("image");
	  
	  // 이미지 경로를 imageName에 따라 설정합니다.
	  if (imageName === "image1") {
	    imageElement.src = "img/menu02.png";
	    imageElement.alt = "이미지 1";
	  } else if (imageName === "image2") {
	    imageElement.src = "img/menu03.png";
	    imageElement.alt = "이미지 2";
	  }
	}

</script>
</head>
<body onload="showImage('image1')">
	<header>
		<%@include file="Header.jsp"%>
	</header>
	<section>
		<button onclick="showImage('image1')" class="button">런치</button>
		<button onclick="showImage('image2')" class="button">디너</button>
			<div id="imageContainer">
 				 <img id="image" src="" alt="">
			</div>
	</section>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
</body>
</html>