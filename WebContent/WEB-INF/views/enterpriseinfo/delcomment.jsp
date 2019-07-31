<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	
	<div id="main">

		<section id="detail">
			
			<script>
				<c:if test="${result == 1}">
					location.href = "/desket/enterpriseinfo/view.do?seq=${eiseq}";
				</c:if>
				
				<c:if test="${result == 0}">
					alert("댓글 삭제 실패");
					history.back();
				</c:if>
			</script>
			
		</section>
	</div>
	
</body>
</html>