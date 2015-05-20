<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="./img/favicon.ico">
<link rel="stylesheet" type="text/css" href="./css/basic.css" />
<script type="text/javascript">
	window.onload=function test(){
			var test="${dto.like_country}";
			var result=test.split(",");
			var test2=document.getElementsByName("like_country");
			
			for (var i = 0; i < result.length; i++) {
				for (var j = i; j < test2.length; j++) {
					if(result[i]==test2[j].value){
						test2[j].checked=true;
// 			parent.location.reload();
						break;
					}				
				}
			}
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
	
	function modify(){
		var password=document.getElementById("password").value;
		var checkPwd=document.getElementById("checkPwd").value;
		var id=document.getElementsByName("member_id")[0].value;
		if(password=="" || password==null){
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
${member_id}
${member_num}
	<div class="main_logo">
		<a href="./index.do"><img alt="메인로고" src="./img/mainLogo.png" width="40px" height="40px" /></a>
	</div>
	<div class="main_nav">
		<ul class="navigation">
			<li><a>${member_id}님</a></li>		
			<li><a href="modifyForm.do">수정</a></li>	
			<li><a href="logout.do">로그아웃</a></li>			
		</ul>		
	</div>	
</header>
<!--// header-->

<!--content //-->
<div id="content">
	<section>
		<div align="center">
			<font size="2"><b>회원정보수정</b></font>
		</div>
		
		<div align="center">
		<form action="updateMember.do" name="form" method="post">
			<input type="hidden" value="${dto.member_num}" name="member_num">
			<div>
				<label>이메일</label><input id="email" type="email" name="email" 
				readonly="readonly" value="${dto.email}">
			</div>
			
			<div>
				<label>비밀번호변경</label><input type="password" id="password" 
				name="password" onkeyup="checkPassword()" value="${dto.password}">
			</div>
			
			<div>
				<label>비밀번호확인</label><input type="password" id="checkPwd" 
				name="checkPwd" onkeyup="checkPassword()" value="${dto.password}">
			</div>
			<div>
				<span id="span"></span>
			</div>
			
			<div>
				<label>닉네임</label><input type="text" name="member_id" id="member_id"
				value="${dto.member_id}">
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