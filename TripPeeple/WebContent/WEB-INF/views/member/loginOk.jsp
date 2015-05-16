<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="./img/favicon.ico">
<link rel="stylesheet" type="text/css" href="./css/basic.css" />

</head>
<body>

<!--header //-->
<header>
	<div class="main_logo">
		<a href="./index.do"><img alt="메인로고" src="./img/mainLogo.png" width="40px" height="40px" /></a>
	</div>
	<div class="main_nav">
		<ul class="navigation">
			<li><a>${member_id}님</a></li>		
			<li><a href="#">수정</a></li>	
			<li><a href="logout.do">로그아웃</a></li>			
		</ul>		
	</div>	
</header>
<!--// header-->

<!--content //-->
<div id="content">
	<section>
		
	</section>
</div>
<!--// content-->	

<!--footer //-->
<footer>
	<div id="copyRight">CopyRight @ km</div>
</footer>
<!--// footer-->

</body>
</html>