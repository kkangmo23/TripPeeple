<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="./img/favicon.ico">

<title>TripPeeple</title>

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
	window.onload = setMenu;
	window.onresize = setMenu;	
	function setMenu() {
		var width = window.innerWidth;
	   	var menus = document.getElementsByName("menu-by-size");
		if (width < 768) {
			menus[0].innerHTML = "My Page";
			menus[1].innerHTML = "글쓰기";
	    	menus[2].innerHTML = "팔로우관리";
			menus[3].innerHTML = "회원정보수정";
	    	menus[4].innerHTML = "로그아웃";
		} else {
			menus[0].innerHTML = "${member_id}님";
			menus[1].innerHTML = "<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>";
			menus[2].innerHTML = "<span class='glyphicon glyphicon-user' aria-hidden='true'></span>";
			menus[3].innerHTML = "<span class='glyphicon glyphicon-cog' aria-hidden='true'></span>";
			menus[4].innerHTML = "<span class='glyphicon glyphicon-log-out' aria-hidden='true'></span>";
		}
	}
	
</script>

<script type="text/javascript">
	function boardUpdate() {
		var form = document.forms["boardUD"];
		form.action = "updateForm.do";
		form.method = "post";
		form.submit();
	}
	
	function boardDelete() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var form = document.forms["boardUD"];
			form.action = "delete.do";
			form.method = "post";
			form.submit();
		}else{   //취소
		    return;
		}
	}
</script>


</head>

<body>
<!-- header -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.do">Trip Peeple</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#" name="menu-by-size" data-container="body" data-toggle="tooltip" title="My Page">
							${member_id}님
						</a>
					</li>
					<li>
						<a href="#" name="menu-by-size" data-container="body" data-toggle="tooltip" title="글쓰기">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="#" name="menu-by-size" data-container="body" data-toggle="tooltip" title="팔로우관리">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="modifyForm.do" name="menu-by-size" data-container="body" data-toggle="tooltip" title="회원정보수정">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="logout.do" name="menu-by-size" data-container="body" data-toggle="tooltip" title="로그아웃">
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
	<div id="content">
		<c:set var="member_num" value="${member_num}" scope="session"/>
		
		<!-- forEach -->
		<c:forEach var="board" items="${boardList}">	
	
		<div class="board-content">	
		<!-- top -->
			<div class="board-info1">
				<div class="media">
					<div class="media-left">
						<a href="myListForm.do"><img class="media-object" src="./img/img2.png" alt="프로필사진"></a>
					</div>
					<div class="media-body">
						<h4><a href="myListForm.do" >${board.member_num}</a></h4>
						<h5><small><fmt:formatDate value="${board.modify_time}" pattern="yyyy-MM-dd hh:mm:ss"/></small></h5>
					</div>
				</div>			
			</div>
		<!-- //top -->
		
		<!-- mid -->
		<div class="board-video">
			<img alt="" src="./img/img1.jpg" style="width: inherit;">
		</div>		
		<div class="board-info2">
			<p>${board.content }</p>
		</div>		
		<!-- /mid -->
		<br/>
		<!-- bot -->
		<div class="board-info3">
			<h5><small>${board.city_num } 에서</small></h5>
			
			<hr>
			
			<a href="#" data-container="body" data-toggle="tooltip" title="Like">
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>						
			</a>
			&nbsp;
			${board.likes }
			&nbsp;&nbsp;&nbsp;
			
			<c:if test="${board.member_num==member_num}">			
				<form action="" method="post" name="boardUD">
					<input type="hidden" name="board_num" value="${board.board_num }">
					<a href="#" data-container="body" data-toggle="tooltip" title="수정">
						<span class="glyphicon glyphicon-edit" aria-hidden="true" onclick="boardUpdate()"></span>						
					</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" data-container="body" data-toggle="tooltip" title="삭제">
						<span class="glyphicon glyphicon-trash" aria-hidden="true" onclick="boardDelete()"></span>
					</a>
				</form>
			</c:if>	
			
		</div>
		<br/>
		<div class="board-reply">
			<h5><small>댓글</small></h5>
			<h5><small>댓글</small></h5>
			<h5><small>댓글</small></h5>
			<h5><small>댓글</small></h5>
		</div>
		<!-- /bot -->
		</div>
		
		</c:forEach>
		<!-- //forEach -->
		
		
	</div>	
<!-- //content -->


<!-- footer -->
	
	<footer>
		<p>&copy; Company 2014</p>
	</footer>
	
<!-- //footer -->
	

	
	
</body>
</html>
