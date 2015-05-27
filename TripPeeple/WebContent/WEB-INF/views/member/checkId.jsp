<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>
<body>

	<div class="check-content">
		<c:if test="${check == false }">
			<h4><small>이미 사용중인 ID 입니다</small></h4>
			<form class="form-horizontal" action="checkId.do" method="post">
				<div class="form-group">					
					<div class="col-sm-5">
						<input type="text" name="member_id" id="member_id"class="form-control" required="required" placeholder="ID">
					</div>
				</div>
				<hr>
				<button type="submit" class="btn btn-default">중복확인</button>
				<button type="button" class="btn btn-default" onclick="self.close()">취소</button>
			</form>
		</c:if>
		
		<c:if test="${check== true}">
			<h4><small>사용 가능한 ID 입니다</small></h4>
			<script type="text/javascript">	
				opener.document.getElementById("member_id").value="${member_id}";
			</script>
			<hr>
			<button type="button" class="btn btn-default" onclick="self.close()">닫기</button>
		</c:if>
		
	</div>
	
</body>
</html>