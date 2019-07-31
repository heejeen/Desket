<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<!--<link rel = "stylesheet" href="css/bootstrab.css"> -->
	
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>


</head>
<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

   
                    
               <script>
				<c:if test="${not empty id}"> <%-- ${ eq  ==}--%> 
				location.href="/desket/home/index.do";
				</c:if>
				
				<c:if test="${empty id}">
				alert("로그인 실패");
				history.back();
				</c:if>
			
			</script>
                   
             
</body>
</html>