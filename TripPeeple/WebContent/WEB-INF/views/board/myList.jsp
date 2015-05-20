<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="./img/favicon.ico">

<title>Cover Template for Bootstrap</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Custom styles for this template -->
<link href="./css/cover.css" rel="stylesheet">

<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip({'placement': 'bottom'})
	})
</script>

<script type="text/javascript">
	window.onresize = function () {
		var width = window.innerWidth;
	   	var menus = document.getElementsByName("menu-by-size");
		if (width < 768) {
	    	menus[0].innerHTML = "회원정보수정";
	    	menus[1].innerHTML = "로그아웃";
		} else {
			menus[0].innerHTML = "<span class='glyphicon glyphicon-cog' aria-hidden='true'></span>";
			menus[1].innerHTML = "<span class='glyphicon glyphicon-log-out' aria-hidden='true'></span>";
		}
	}
</script>
<script type="text/javascript">
	function boardDelete(url, board_num){
		// alert(board_num);
		var str=url+"?board_num="+board_num;
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href=str;
		}else{   //취소
		    return;
		}
	}
	
	function boardUpdate(url, board_num){
		// alert(board_num);
		var str=url+"?board_num="+board_num;
		location.href=str;
	}
</script>

</head>

<body>
<!-- header -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project Name</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#" name="menu-by-size" data-container="body" data-toggle="tooltip" title="회원정보수정">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="./bHome02.jsp" name="menu-by-size" data-container="body" data-toggle="tooltip" title="로그아웃">
							<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>						
						</a>					
					</li>					
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>					
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
<!-- //header -->


<!-- content -->
	<c:set var="member_num" value="${member_num}" scope="session"/>
	<section>
		<c:forEach var="board" items="${boardList}">
			<c:if test="${board.board_num!=null&&board.member_num==member_num}">
				<div class="board-content">
					<c:if test="${board.member_num==member_num}">
						<span>${board.member_num}</span><br/>
						<span>${board.city_num}에서</span><br/><br/>
						<span>${board.content}</span><br/><br/>
						<span><fmt:formatDate value="${board.modify_time}" pattern="yyyy-MM-dd hh:mm:ss"/></span><br/>
						<span>${board.likes}${board.member_num}${member_num}</span><br/>
						
						<input type="button" value="글수정" onclick="javascript:boardUpdate('myUpdateForm.do','${board.board_num}')"/>
						<input type="button" value="글삭제" onclick="javascript:boardDelete('myDelete.do','${board.board_num}')"/>
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	</section>
	
<!-- //content -->


<!-- footer -->
	<div class="container">
		<footer>
			<p>&copy; Company 2014</p>
		</footer>
	</div>
<!-- //footer -->
	

	
	
</body>
</html>
