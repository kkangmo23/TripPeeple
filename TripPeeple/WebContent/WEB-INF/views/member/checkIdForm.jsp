<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmChk(){
		var member_id=document.getElementById("member_id").value;
		location.href="checkId.do?member_id="+member_id;
	}
</script>
</head>
<body>
	<form action="checkId.do" method="post">
<table>
	<tr>
		<td>닉네임</td>
		<td><input type="text" name="member_id" required="required"></td>
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