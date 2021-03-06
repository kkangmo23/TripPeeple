<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	});

function fInsert(num){
	var fNum=num;
 	var $asd = $("input[name='fnum']:input[value='"+fNum+"']").parent().find("button");
	$.ajax({
		url:"followInsert.do",	//요청할 페이지 주소
		data: "num="+fNum,
		method:"post",
		async:true,
		success:function(obj){
			$($asd).removeClass("btn btn-success").addClass("btn btn-info")
			.text(" friend ").attr("disabled",true);
		},
		error:function(){
			alert("데이터 받기 실패");
		}
	});
}

function reload(){
	location.href="followForm.do";
}

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

		<div class="follow-content">

			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active" onclick="reload()"><a href="#" aria-controls="following" role="tab" data-toggle="tab">내가 팔로우</a></li>
					<li role="presentation"><a href="#follower" aria-controls="follower" role="tab" data-toggle="tab">나를 팔로우</a></li>

				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
				
				
				<div role="tabpanel" class="tab-pane fade in active" id="following">
					<c:choose>
						<c:when test="${empty followingLists}">
							 <tr>
							 	<td colspan="3">팔로윙이 없습니다.</td>
							 </tr>
						</c:when>
					<c:otherwise>					

						<div class="row">
						
							<c:forEach var="following" items="${followingLists}">
								<form id="followDelete" action="followDelete.do" method="post">
									<input type="hidden" name="num" value="${following.member_num}">
									<div class="col-md-6">
										<div class="follow-box">
<!-- 											<span> -->
<!-- 												<img alt="" src="/repo/profile/profile.jpg" style="width: 20%; "> -->
<!-- 											</span> -->
											<span style="padding-left: 10px">
												${following.member_id}
											</span>
											<span style="float: right; margin-top: 10px;">										
												<button type="submit" class="btn btn-danger">unfollow</button>										
											</span>
										</div>
									</div> 	
								</form>
							</c:forEach>							
  											
						</div>
						
						</c:otherwise>
					</c:choose>

					</div>




					<div role="tabpanel" class="tab-pane fade" id="follower">

						<c:choose>
							<c:when test="${empty followerLists}">
								<tr>
									<td colspan="3">팔로워가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>

								<div class="row">

									<c:forEach var="follower" items="${followerLists}">
										<c:choose>
										<c:when test="${follower.follow_check eq 'doDelete'}">
<!-- 										<form action="followDelete.do" method="post"> -->
<%-- 										<input type="hidden" name="num" value="${follower.member_num}"> --%>
																										
										<div class="col-md-6">
											<div class="follow-box">
<!-- 												<span> <img alt="" src="/repo/profile/profile.jpg" -->
<!-- 													style="width: 20%;"> -->
<!-- 												</span> -->
												<span style="padding-left: 10px">${follower.member_id} </span>
												<span style="float: right; margin-top: 10px;">
													<button class="btn btn-info" disabled="disabled">friend</button>
												</span>
											</div>
										</div>
<!-- 										</form> -->
										</c:when>

										<c:otherwise>
<!-- 										<form action="followInsert.do" method="post"> -->
										<div class="col-md-6">
											<div class="follow-box">
												<input type="hidden" name="fnum" value="${follower.member_num}"> 
<!-- 												<span> <img alt="" src="/repo/profile/profile.jpg" -->
<!-- 													style="width: 20%;"> -->
<!-- 												</span> -->
												<span style="padding-left: 10px">${follower.member_id} </span>
												<span style="float: right; margin-top: 10px;">
													<button id="asd" onclick="fInsert(${follower.member_num})" class="btn btn-success">follow</button>	
												</span>
											</div>
										</div>
<!-- 										</form> -->
										

										</c:otherwise>
										</c:choose>											
									</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>

					</div>

				</div>
			</div>
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
