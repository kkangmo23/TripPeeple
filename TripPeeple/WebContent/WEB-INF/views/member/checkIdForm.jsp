<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nickname Check</title>

<link rel="icon" href="./img/favicon.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Custom styles for this template -->
<link href="./css/cover.css" rel="stylesheet">

<script type="text/javascript">
	function confirmChk(){
		var member_id=document.getElementById("member_id").value;
		location.href="checkId.do?member_id="+member_id;
	}
</script>
</head>
<body>

<div class="check-content">
	<h4><small>ID를 입력해주세요</small></h4>
	<form class="form-horizontal" action="checkId.do" method="post">
		<div class="form-group">			
			<div class="col-sm-5">
				<input type="text" name="member_id" id="member_id" class="form-control" required="required" placeholder="ID" >
			</div>
		</div>
		
		<hr>
		 
		<button type="submit" class="btn btn-default" >중복확인</button>
		<button type="button" class="btn btn-default" onclick="self.close()">취소</button>
		
	</form>
</div>

</body>
</html>