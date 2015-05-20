<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	function checkEmail(){	
 		window.open("checkEmailForm.do", "", "width=350, height=200");
	}
	function checkId(){
		window.open("checkIdForm.do", "", "width=350, height=200");
	}
	
	function erase(){
		document.getElementById("member_id").value="";
	}
	
	function checkPassword(){
		var password=document.getElementById("password").value;
		var checkPwd=document.getElementById("checkPwd").value;
		var span =document.getElementById("span");
		if(password==checkPwd){
			span.textContent="비밀번호가 일치합니다.";
			document.getElementById("span").style.color="blue";
		}else{
			span.textContent="비밀번호가 일치하지 않습니다.";
			document.getElementById("span").style.color="red";
		}
	}
	
	function regist(){
		var email=document.getElementById("email").value;
		var password=document.getElementById("password").value;
		var checkPwd=document.getElementById("checkPwd").value;
		var id=document.getElementsByName("member_id")[0].value;
		if(email=="" || email==null){
			alert("이메일을 입력해주세요.");
		}else if(password=="" || password==null){
			alert("비밀번호를 입력해주세요.");
 			document.getElementById("password").value="";
 			document.getElementById("password").focus();
		}else if(password!=checkPwd){
 			alert("비밀번호를 확인해주세요.");
 			document.getElementById("checkPwd").value="";
 			document.getElementById("checkPwd").focus();
 		}else if(id=="" || id==null){
 			document.getElementsByName("member_id")[0].value=email;
 			document.forms["form"].submit();
 		}
 		else{
			document.forms["form"].submit();
 		}
	}
</script>

</head>

<body>
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

	<div id="content">
		<div class="form-content">		
		
		<form class="form-horizontal">
		  <div class="form-group">
		    <label for="email" class="col-sm-4 control-label">Email</label>
		    <div class="col-sm-5">
		      <input type="email" name="email" id="email" class="form-control" placeholder="Email" onclick="checkEmail()">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-4 control-label">Password</label>
		    <div class="col-sm-5">
		      <input type="password" name="password" id="password" class="form-control" placeholder="Password" onkeyup="checkPassword()">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="checkPwd" class="col-sm-4 control-label">Confirm Password</label>
		    <div class="col-sm-5">
		      <input type="password" name="checkPwd" id="checkPwd" class="form-control" placeholder="Confirm Password" onkeyup="checkPassword()">
		    </div>
		  </div>
		  	<div>	
			<span id="span"></span>
			</div>
			
		  <div class="form-group">
		    <label for="email" class="col-sm-4 control-label">Nick Name</label>
		    <div class="col-sm-5">
		    	<input type="text" name="member_id" id="member_id" class="form-control" placeholder="Nick Name" onclick="checkId()">
<!-- 		    	<button type="button" class="btn btn-default" onclick="erase()">지우기</button> -->
		    </div>
		  </div>
		  
		  <div>
				<label>선호국가</label>
				<input type="checkbox" name="like_country" value="한국"/> 한국 &nbsp;
				<input type="checkbox" name="like_country" value="중국"/> 중국 &nbsp;	
				<input type="checkbox" name="like_country" value="미국"/> 미국 &nbsp;	
				<input type="checkbox" name="like_country" value="일본"/> 일본 &nbsp;	
			</div>		
		  <hr>
		 
		      <button type="button" class="btn btn-default" onclick="regist()">회원가입</button>
		      <button type="button" class="btn btn-default" onclick="window.history.back(-1)">취소</button>
		    
		</form>

		</div>
	</div>

	<div class="container">		

	<footer>
		<p>&copy; CopyRight @ km</p>
	</footer>
	</div>
	<!-- /container -->

	<!--layer //-->
	<div class="layer">
		<div class="bg"></div>
		
		<div id="layer-login" class="pop-layer">
			<div class="pop-container">			
				<form action="memberLogin.do" method="post">
					<div class="input-login">
						<input type="email" class="form-control" name="email" placeholder=" E-mail">
					</div>
					<div class="input-login">
						<input type="password" class="form-control" name="password" placeholder=" Password">
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
