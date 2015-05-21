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
	
	
		<div class="board-content">	
		<!-- top -->
			<div class="board-info1">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./img/img2.png" alt="프로필사진"></a>
					</div>
					<div class="media-body">
						<h4><a href="#" >Nick Name</a></h4>
						<h5><small>2015-05-15 23:42:11</small></h5>
					</div>
				</div>			
			</div>
		<!-- //top -->
		<!-- mid -->
		<div class="board-video">
			<img alt="" src="./img/img1.jpg" style="width: inherit;">
		</div>		
		<div class="board-info2">
			<p>안녕하세옄ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>			
		</div>		
		<!-- /mid -->
		<br/>
		<!-- bot -->
		<div class="board-info3">
			<h5><small>France, Paris 에서</small></h5>
			
			<hr>
			
			<a href="#" data-container="body" data-toggle="tooltip" title="Like">
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>						
			</a>		
			&nbsp;
			34
			&nbsp;&nbsp;&nbsp;
			<a href="#" data-container="body" data-toggle="tooltip" title="수정">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>						
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" data-container="body" data-toggle="tooltip" title="삭제">
				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
			</a>			
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




		<div class="board-content">
			<div class="board-info1">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./img/img2.png" alt="프로필사진"></a>
					</div>
					<div class="media-body">
						<h4><a href="#" >시발</a></h4>
						<h5><small>2015-05-15 22:12:11</small></h5>
					</div>
				</div>			
			</div>
			<!-- //top -->
			<!-- mid -->
			<div class="board-video">
				<img alt="" src="./img/main_bg.jpg" style="width: inherit;">
			</div>		
			<div class="board-info2">
				<p>반갑습니닼ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
			</div>		
			<!-- /mid -->
			<hr>
			<!-- bot -->
			<div class="board-info3">
				<a href="#" data-container="body" data-toggle="tooltip" title="Like">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>						
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" data-container="body" data-toggle="tooltip" title="수정">
					<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>						
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" data-container="body" data-toggle="tooltip" title="삭제">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
				</a>			
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
		
		
		
		
		<div class="board-content">
			<div class="board-info1">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./img/img2.png" alt="프로필사진"></a>
					</div>
					<div class="media-body">
						<h4><a href="#" >ㅋㅋㅋㅋ</a></h4>
						<h5><small>2015-05-15 20:10:51</small></h5>
					</div>
				</div>			
			</div>
			<!-- //top -->
			<!-- mid -->
			<div class="board-video">
				<video src="./video/exid.mp4" controls="controls" style="width: inherit;"></video>				
			</div>		
			<div class="board-info2">
				<p>올ㅋ</p>
			</div>		
			<!-- /mid -->
			<hr>
			<!-- bot -->
			<div class="board-info3">
				<a href="#" data-container="body" data-toggle="tooltip" title="Like">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>						
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" data-container="body" data-toggle="tooltip" title="수정">
					<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>						
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" data-container="body" data-toggle="tooltip" title="삭제">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
				</a>			
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
		
		
	</div>
	
<!-- //content -->


<!-- footer -->
	
	<footer>
		<p>&copy; Company 2014</p>
	</footer>
	
<!-- //footer -->
	

	
	
</body>
</html>