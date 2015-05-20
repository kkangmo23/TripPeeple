<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div id="content">
		<div class="container">
			<div class="board-content">
				<p>안녕하세옄ㅋㅋ</p>
			</div>
		</div>	
	
		<div class="container">
			<div class="board-content">
				<p>반갑습니닼ㅋㅋㅋ</p>
			</div>
		</div>
	</div>
	
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
