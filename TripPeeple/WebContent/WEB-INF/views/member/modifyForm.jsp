<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="./img/favicon.ico">
<link rel="stylesheet" type="text/css" href="./css/basic.css" />
<script type="text/javascript">
	function checkEmail(){	
	 		window.open("checkEmailForm.do", "", "width=350, height=200");
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
		<div align="center">
			<font size="2"><b>회원정보수정(*필수입력사항입니다.)</b></font>
		</div>
		
		<div align="center">
		<form action="memberRegister.do" name="form" method="post">
			<div>
				<label>*이메일</label><input id="email" type="email" name="email" 
				readonly="readonly" onclick="checkEmail()">
			</div>
			
			<div>
				<label>*비밀번호</label><input type="password" id="password" name="password">
			</div>
			
			<div>
				<label>*비밀번호확인</label><input type="password" id="checkPwd" 
				name="checkPwd" onkeyup="checkPassword()"><span id="span"></span>
			</div>
			
			<div>
				<label>닉네임</label><input type="text" name="member_id">
			</div>
			
			<div>
				<label>선호국가</label>
				<input type="checkbox" name="like_country" value="한국"/> 한국 &nbsp;
				<input type="checkbox" name="like_country" value="중국"/> 중국 &nbsp;	
				<input type="checkbox" name="like_country" value="미국"/> 미국 &nbsp;	
				<input type="checkbox" name="like_country" value="일본"/> 일본 &nbsp;	
			</div>		
			
			<div>
				<input type="button" value="회원정보수정" onclick="modify()">
				<input type="button" value="취소" onclick="window.history.back(-1)">
			</div>
		</form>
	</div>	
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