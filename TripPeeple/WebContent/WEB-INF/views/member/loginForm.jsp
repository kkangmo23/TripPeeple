<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<title>Insert title here</title>

<link rel="shortcut icon" href="./img/favicon.ico">
<link rel="stylesheet" type="text/css" href="./css/basic.css" />

<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('top', '100px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>

</head>
<body>

<!--header //-->
<header>
	<div class="main_logo">
		<a href="./index.do"><img src="./img/mainLogo.png" width="40px" height="40px" /></a>
	</div>
	<div class="main_nav">
		<ul class="navigation">
			<li><a href="#" onclick="layer_open('layer-login');return false;">로그인</a></li>
			<li><a href="registerForm.do">회원가입</a></li>	
			<li>${member_id}</li>				
		</ul>		
	</div>	
</header>
<!--// header-->

<!--content //-->
<div id="content">
	<section>
		<img alt="메인 이미지" src="./img/img1.jpg">
	</section>
</div>
<!--// content-->	

<!--footer //-->
<footer>
	<div id="copyRight">CopyRight @ km</div>
</footer>
<!--// footer-->

<!--layer //-->
<div class="layer">
	<div class="bg"></div>
	<div id="layer-login" class="pop-layer">
		<div class="pop-container">
			
			<form action="memberLogin.do" method="post">
				<div class="input-login"><input type="email" name="email" placeholder=" E-mail"></div>
				<div class="input-login"><input type="password" name="password" placeholder=" Password"></div>
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