<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check==true}">
			<script type="text/javascript">
				alert("게시물이 등록 되었습니다.");
				location.href="listForm.do";
			</script>
	</c:if>
		
	<c:if test="${check==false}">
		<script type="text/javascript">
			alert("게시물이 등록 되지 않았습니다.");
			location.href="writeForm.do";
		</script>
	</c:if>
</body>
</html>