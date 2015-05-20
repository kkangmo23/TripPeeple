<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="index.do"><img alt="메인로고" src="./img/mainLogo.png" width="40px" height="40px" /></a>
	</div>
	<div class="main_nav">
		<ul class="navigation">
			<li><a href="#" onclick="layer_open('layer-login');return false;">로그인</a></li>
			<li><a href="#">회원가입</a></li>					
		</ul>		
	</div>	
</header>
<!--// header-->

<!--content //-->
<div id="content">
	<section>
	
	<form action="myUpdate.do"  method="post" enctype="multipart/form-data">
	<c:set var="member_num" value="${member_num}" scope="session"/>
		<div>
			<label>도시</label>
			<span >
				<input type="hidden" name="board_num" value="${board.board_num}"/>
				<input type="hidden" name="likes" value="${board.likes}"/>
				<input type="text" name="city_num" value="${board.city_num}"/>
			</span>
		</div>
					
		<div>
			<label>내용</label>
			<span >
				<textarea rows="14" cols="58" name="content">${board.content}</textarea>
			</span>
		</div>
		
		<div >
			<label>파일명</label>
			<span >
<!-- 				<input type="file" name="file_name" size="40"/> -->
			</span>
		</div>
		
		<div>
			<input type="submit" value="수정하기"/>
			<a href="myListForm.do">목록보기</a>
		</div>
					
	</form>

		
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