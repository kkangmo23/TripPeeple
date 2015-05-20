<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<c:if test="${check == false }">
				<div align="center">
					이미 사용중인 닉네임 입니다.
					<form id="form" action="checkId.do" method="post">
						<input type="text" name="member_id" required="required"/>
						<input type="submit" value="확인"/>
					</form>
				</div>
		</c:if>
		
		<c:if test="${check== true}">
			<div align="center">사용 가능한 닉네임 입니다.</div>
			<script type="text/javascript">	
				opener.document.getElementById("member_id").value="${member_id}";
			</script>
		</c:if>
		<br/>
			
		<div align="center">
			<a href="javascript:self.close()">닫기</a>
		</div>
	</div>
</body>
</html>