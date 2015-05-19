<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<link rel="shortcut icon" href="./img/favicon.ico">
<link rel="stylesheet" type="text/css" href="./css/basic.css" />
<script type="text/javascript">
	function boardDelete(url){
	var board_num="${boardDto.board_num}";
	var str=url+"?board_num="+board_num;
	
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		location.href=str;
	}else{   //취소
	    return;
	}
	
	
}
</script>

</head>
<body>

<!--header //-->
<header>
	<div class="main_logo">
		<a href="#"><img alt="메인로고" src="./img/mainLogo.png" width="40px" height="40px" /></a>
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
		<c:forEach var="board" items="${boardList}">
			<div class="board-content">
				<span>${board.member_num}</span><br/>
				<span>${board.city_num}에서</span><br/><br/>
				<span>${board.content}</span><br/><br/>
				<span><fmt:formatDate value="${board.modify_time}" pattern="yyyy-MM-dd hh:mm:ss"/></span><br/>
				<span>${board.likes}</span><br/>
				<input type="button" value="글수정" onclick="javascript:boardUpdate('update.do')"/>
				<input type="button" value="글삭제" onclick="javascript:boardDelete('deleteForm.do')"/>
			</div>
		</c:forEach>
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