<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function test(){
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

	function checkId(){
		window.open("checkIdForm.do", "", "width=350, height=200");
	}
	
// 	function checkPassword(){
// 		var password=document.getElementById("password").value;
// 		var checkPwd=document.getElementById("checkPwd").value;
// 		var span =document.getElementById("span");
// 		if(password==checkPwd){
// 			span.textContent="비밀번호가 일치합니다.";
// 			document.getElementById("span").style.color="blue";
// 		}else{
// 			span.textContent="비밀번호가 일치하지 않습니다.";
// 			document.getElementById("span").style.color="red";
// 		}
// 	}
	
	function modify(){
		var password=document.getElementById("password").value;
		var checkPwd=document.getElementById("checkPwd").value;
		var id=document.getElementById("member_id").value;
		if(password=="" || password==null){
			alert("비밀번호를 입력해주세요.");
 			document.getElementById("password").value="";
 			document.getElementById("password").focus();
		}else if(password!=checkPwd){
 			alert("비밀번호를 확인해주세요.");
 			document.getElementById("checkPwd").value="";
 			document.getElementById("checkPwd").focus();
 		}else if(id=="" || id==null){
 			document.getElementById("member_id").value=email;
 			document.forms["form"].submit();
 		}
 		else{
			document.forms["form"].submit();
 		}
	}
</script>

<script type="text/javascript">
	function checkPassword() {
		var password=document.getElementById("password").value;
		var checkPwd=document.getElementById("checkPwd").value;
		var cp = document.getElementById("confirmPwd");
		var cpi = document.getElementById("confirmPwdIcon");
		if(password==checkPwd){
			cp.className = "form-group has-success has-feedback";
			cpi.className = "glyphicon glyphicon-ok form-control-feedback";			
		}else{
			cp.className = "form-group has-error has-feedback";
			cpi.className = "glyphicon glyphicon-remove form-control-feedback";
		}		
	}

</script>

<!-- onload functions -->
<script type="text/javascript">
	function addLoadEvent(func) {
	    var oldonload = window.onload;
	        if(typeof window.onload != 'function') {
	            window.onload = func;
	        } else {
	            window.onload = function() {
	                oldonload();
	                func();
	        }
	    }
	}
	
	addLoadEvent(setMenu);
	addLoadEvent(test);
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
				<a class="navbar-brand" href="./index.do">Project Name</a>
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
		<div class="form-content">		
		
		<form class="form-horizontal" action="updateMember.do" name="form" method="post">
		<input type="hidden" value="${dto.member_num}" name="member_num">
		
		 <div class="form-group">
		    <label for="email" class="col-sm-4 control-label">Email</label>
		    <div class="col-sm-5">
		    	<input type="text" name="email" id="email" class="form-control" value="${dto.email}" readonly="readonly" >
		    </div>
		  </div>		
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-4 control-label">Password</label>
		    <div class="col-sm-5">
		      <input type="password" name="password" id="password" class="form-control" value="${dto.password}" placeholder="Password" required="required" onkeyup="checkPassword()">
		    </div>
		  </div>
		  <div class="form-group" id="confirmPwd">
		    <label for="checkPwd" class="col-sm-4 control-label">Confirm Password</label>
		    <div class="col-sm-5">
		      <input type="password" name="checkPwd" id="checkPwd" class="form-control" placeholder="Confirm Password" value="${dto.password }"  required="required" onkeyup="checkPassword()">
		   		<span id="confirmPwdIcon" aria-hidden="true"></span> 				
		    </div>
		  </div>		  	
			
		  <div class="form-group">
		    <label for="member_id" class="col-sm-4 control-label">Nick Name</label>
		    <div class="col-sm-5">
		    	<input type="text" name="member_id" id="member_id" class="form-control" value="${dto.member_id}" readonly="readonly" placeholder="Nick Name" onclick="checkId()">
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
		 
		      <button type="button" class="btn btn-default" onclick="modify()">회원정보수정</button>
		      <button type="button" class="btn btn-default" onclick="window.history.back(-1)">취소</button>
		    
		</form>

		</div>
	</div>
	
<!-- //content -->


<!-- footer -->	
	<footer>
		<p>&copy; CopyRight @ km</p>
	</footer>	
<!-- //footer -->

	
</body>
</html>
