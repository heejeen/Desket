<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>이력서 등록</title>
<style>
	.tbl1 {
		width: 1600px;
	}
	.tbl1 th:nth-child(1) {
		width: 750px;
		margin-right: 100px;
		display:inline-block;
	}
	.tbl1 th:nth-child(2) {
		width: 750px;
		display:inline-block;
	}

</style>


<!-- BEGIN : CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
<!-- END : CSS -->
   
</head>
<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

   	<jsp:include page="/inc/home/sidebar.jsp" ></jsp:include>
    <!-- BEGIN: Content-->
    <div class="app-content content">
    
    <!-- BEGIN: Header-->
	<jsp:include page="/inc/home/headerbar.jsp" ></jsp:include>
    <!-- END: Header-->   
       
    <script>
	<c:if test="${seq==0}">
		alert("이력서 등록을 실패했습니다.");
		history.back();
	</c:if>
	<c:if test="${seq!=0}">
		alert("이력서 등록을 성공했습니다.");
		location.href="/desket/mypage/member/resume/resumelist.do?menuid=resumelist";
	</c:if>
	<c:if test="${letterResult==0}">
		alert("자소서 등록을 실패했습니다.");
		history.back();
	</c:if>
	<c:if test="${languageResult==0}">
		alert("언어 등록을 실패했습니다.");
		history.back();
	</c:if>
	<c:if test="${certificateResult==0}">
		alert("자격증 등록을 실패했습니다.");
		history.back();
	</c:if>
	</script>
                   
    </div>       
    <!-- Content -->      

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

<!-- BEGIN: Footer-->
<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
<!-- END: Footer-->

</body>
</html>