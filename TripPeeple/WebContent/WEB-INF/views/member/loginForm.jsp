<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function layer_open(el) {

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		} else {
			temp.fadeIn();
		}
		
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
</script>

<script type="text/javascript">
	window.onresize = function () {
		var width = window.innerWidth;
	   	var menus = document.getElementsByName("menu-by-size");
		if (width < 768) {
	    	menus[0].innerHTML = "로그인";
	    	menus[1].innerHTML = "회원가입";
		} else {
			menus[0].innerHTML = "<span class='glyphicon glyphicon-log-in' aria-hidden='true'></span>";
			menus[1].innerHTML = "<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>";
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
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./index.do">Trip Peeple</a>				
			</div>
			
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#" name="menu-by-size" onclick="layer_open('layer-login');return false;" data-container="body" data-toggle="tooltip" title="로그인">
							<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="registerForm.do" name="menu-by-size" data-container="body" data-toggle="tooltip" title="회원가입">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>						
						</a>
					</li>
				</ul>					
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
<!-- //header -->


<!-- content -->
	<div id="content" style="background-image: url('./img/main_bg.jpg'); background-size: 100%; background-repeat: no-repeat;">
	<div id="main-content">
		<div class="container">
			<h1>Hello, world!</h1>
			<p>This is a template for a simple marketing or informational
				website. It includes a large callout called a jumbotron and three
				supporting pieces of content. Use it as a starting point to create
				something more unique.</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn
					more &raquo;</a>
			</p>
		</div>
	</div>
	</div>
<!-- //content -->


<!-- footer -->
	<div class="container">
	<footer>
		<p>&copy; CopyRight @ km</p>
	</footer>
	</div>
<!-- //footer -->

	<!--layer //-->
	<div class="layer">
		<div class="bg"></div>
		
		<div id="layer-login" class="pop-layer">
			<div class="pop-container">			
				<form action="memberLogin.do" method="post">
					<div class="input-login">
						<input type="email" class="form-control" name="email" placeholder=" E-mail" required="required">
					</div>
					<div class="input-login">
						<input type="password" class="form-control" name="password" placeholder=" Password" required="required">
					</div>
					<div class="btn-r">
						<button type="submit" class="cbtn">Log in</button>
					</div>
				</form>

			</div>
		</div>
		
	</div>
	<!--// layer-->

</body>
</html>
