<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복체크</title>
<script type="text/javascript">
	function confirmChk(){
		var email=document.getElementById("email").value;
		location.href="checkEmail.do?email="+email;
	}
</script>
</head>
<body>
<form action="checkEmail.do" method="post">
<table>
	<tr>
		<td>이메일</td>
		<td><input type="email" name="email" required="required"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="중복확인">
		<input type="button" value="취소" onclick="self.close()">
		</td>
	</tr>
</table>
</form>
<div></div>
</body>
</html>