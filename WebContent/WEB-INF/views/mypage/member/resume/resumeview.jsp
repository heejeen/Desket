<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>이력서 보기</title>
<style>
.card-body ul {
	width: 100%;
	margin-top: 20px;
	background-color: #F7F7F7;
	border: 1px solid #ddd;
	display: table;
	padding: 0px;
	position: relative;
}

.card-body li {
	display: table-cell;
	padding-top: 20px;
	padding-bottom: 20px;
	text-align: center;
	width: 20%;
}

.card-body li:after {
	display: block;
	position: absolute;
	width: 1px;
	content: '';
	background: #ddd;
	height: 48px;
	margin-top: -24px;
	top: 50%;
}

.card-body li:first-child:after {
	display: none
}

.resumetable p {
	margin-top: 10px;
}

.resumetable ul li strong {
	color: black;
}

.resumeinfo {
	margin-top: 5px;
}

table {
	width: 100%;
	border-collapse: collapse;
	height: 100px;
	outline: none;
}

table th, table td {
	text-align: center;
}

table strong {
	font-size: 14px;
}

table td, table th {
	border: 1px solid #ddd;
	width: 20%;
	padding-top: 15px;
	padding-bottom: 15px;
}

table thead tr {
	background-color: #F7F7F7;
	color: black;
	border-top: 2px solid #666;
}

.certificate th:nth-child(3) {
	width: 40%;
}

.certificate td:nth-child(3) {
	text-align: left;
	padding-left: 15px;
	padding-right: 15px;
}

#letter {
	margin-top: 15px;
	margin-bottom: 35px;
}

#letter td {
	padding-top: 20px;
	padding-left: 30px;
	padding-right: 30px;
	padding-bottom: 20px;
	text-align: left;
}

#resumeBtn {
	margin-top: 20px;
	margin-bottom: 25px;
}

.languageTd {
	width: auto;
}
</style>

<script>


	
	function delLetter() {
		if(confirm("정말 삭제 하시겠습니까?")) {
			location.href = '/desket/mypage/member/resume/delok.do?menuid=resumelist&seq=${seq}';
		} else {
		}
	}
	 
</script>


<!-- BEGIN : CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
<!-- END : CSS -->

</head>
<body
	class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	<jsp:include page="/inc/home/sidebar.jsp"></jsp:include>

	<!-- BEGIN: Content-->
	<div class="app-content content">

		<!-- BEGIN: Header-->
		<jsp:include page="/inc/home/headerbar.jsp"></jsp:include>
		<!-- END: Header-->

		<div class="content-wrapper">
		<div class="content-header row">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h2 class="content-header-title float-left mb-0">이력서 보기</h2>
							<div class="breadcrumb-wrapper col-12">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/desket/home/index.do">Desket</a>
									</li>
									<li class="breadcrumb-item"><a href="/desket/mypage/member/resume/resumelist.do?menuid=resumelist">이력서 관리</a></li>
									<li class="breadcrumb-item active">이력서 보기</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
					<div class="form-group breadcrum-right">
						<div class="dropdown">
							<button
								class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle"
								type="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="feather icon-settings"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="#">Chat</a><a
									class="dropdown-item" href="#">Email</a><a
									class="dropdown-item" href="#">Calendar</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content-body">
				<div class="card" style="width: 70%; margin-left: auto; margin-right: auto;">
					<div class="card-header">
						<div class="card-title"
							style="border-bottom: 1px solid #888; width: 100%;">
							<h2 style="display: inline-block;">
								<c:if test="${not empty resume.title}">
								<strong>${resume.title}</strong>
								</c:if>
								<c:if test="${empty resume.title}">
								<strong>${resume.regdate}에 임시저장된 이력서입니다.</strong>
								</c:if>
							</h2>
							<c:if test="${resume.storageStatus == 0}">
								<div class="chip chip-warning">
									<!-- success: 초록 warning:주황 primary:파랑 -->
									<div class="chip-body">
										<div class="chip-text">작성중</div>
									</div>
								</div>
							</c:if>
							<c:if test="${resume.storageStatus == 1}">
								<div class="chip chip-success">
									<!-- success: 초록 warning:주황 primary:파랑 -->
									<div class="chip-body">
										<div class="chip-text">작성완료</div>
									</div>
								</div>
							</c:if>
							<span style="float: right;"><small>최근 수정일
									${resume.regdate.substring(0,10)}</small></span>
						</div>
					</div>
					<div class="card-content">
						<div class="card-body">

							<div>
								<h3 style="display: inline-block;">
									<c:if test="${not empty name}">
									<strong>${name}</strong>
									</c:if>
									<c:if test="${empty name}">
									<strong>박헌정</strong>
									</c:if>
								</h3>
								<c:if test="${not empty name}">
								${birth.substring(0,4)}년 (${2019 - birth.substring(0,4) + 1}세)
								${gender}
								</c:if>
								<c:if test="${empty name}">
								1992년 (28세) 남자
								</c:if>
								
							</div>
							<div class="resumeinfo">
								<c:if test="${not empty name}">
								<span class="feather icon-mail"> ${email}</span>&nbsp; <span
									class="feather icon-smartphone"> ${tel}</span>
								</c:if>
								<c:if test="${empty name}">
								<span class="feather icon-mail"> gjswjd100@daum.net</span>&nbsp; <span
									class="feather icon-smartphone"> 010-1234-5678</span>
								</c:if>
							</div>
							<div class="resumeinfo">
								<c:if test="${not empty name}">
								<span class="feather icon-map"> ${address}</span>
								</c:if>
								<c:if test="${empty name}">
								<span class="feather icon-map"> 경기도 고양시 일산서구</span>
								</c:if>
							</div>
							<div class="resumetable">
								<ul>
									<li><strong>학력사항</strong>
									<c:if test="${not empty resume.education}">
										<p>${resume.education}</p>
									</c:if>
									<c:if test="${empty resume.education}">
										<p>-</p>
									</c:if>
										
									</li>
									<li><strong>희망업무</strong>
									<c:if test="${not empty resume.task}">
										<p>${resume.task}</p>
									</c:if>
									<c:if test="${empty resume.task}">
										<p>-</p>
									</c:if>
									</li>
										
									<li><strong>희망연봉</strong>
									<c:if test="${not empty resume.salary}">
										<p>${resume.salary}
											<small>만원</small>
										</p>
									</c:if>
									<c:if test="${empty resume.salary}">
										<p>-</p>
									</c:if>
									
									</li>
									<li><strong>희망근무지</strong>
									<c:if test="${not empty resume.salary}">
										<p>서울전체</p>
									</c:if>
									<c:if test="${empty resume.salary}">
										<p>-</p>
									</c:if>
									</li>
									<li><strong>포트폴리오</strong> 
									<c:if test="${empty resume.portfolio}">
										<p>-</p>
									</c:if> 
									<c:if test="${not empty resume.portfolio}">
										<p>${resuem.portfolio}</p>
									</c:if></li>
								</ul>
							</div>
							<div>
								<h3 style="display: inline-block; margin-top: 40px;">
									<strong>학력</strong>
								</h3>
								최종학력 ${resume.education}
								<table>
									<thead>
										<tr>
											<th><strong>재학기간</strong></th>
											<th><strong>구분</strong></th>
											<th><strong>학교명(소재지)</strong></th>
											<th><strong>전공</strong></th>
											<th><strong>학점</strong></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:if test="${not empty resume.graduation}">
											<td>2011.03 ~ 2017.02</td>
											</c:if>
											<c:if test="${empty resume.graduation}">
											<td> - </td>
											</c:if>
											
											<c:if test="${not empty resume.graduation}">
											<td>${resume.graduation}</td>
											</c:if>
											<c:if test="${empty resume.graduation}">
											<td> - </td>
											</c:if>
											
											<c:if test="${not empty resume.graduation}">
											<td>쌍용대학교</td>
											</c:if>
											<c:if test="${empty resume.graduation}">
											<td> - </td>
											</c:if>
											
											<c:if test="${not empty resume.major}">
											<td>${resume.major}</td>
											</c:if>
											<c:if test="${empty resume.major}">
											<td> - </td>
											</c:if>
											
											<c:if test="${not empty resume.grades}">
											<td>${resume.grades}</td>
											</c:if>
											<c:if test="${empty resume.grades}">
											<td> - </td>
											</c:if>
											
										</tr>
									</tbody>
								</table>
							</div>
							<div>
								<h3 style="display: inline-block; margin-top: 40px;">
									<strong>경력</strong>
								</h3>
								<table>
									<thead>
										<tr>
											<th><strong>재직기간</strong></th>
											<th><strong>직종</strong></th>
											<th><strong>회사명</strong></th>
											<th><strong>직급</strong></th>
											<th><strong>총 경력</strong></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:if test="${not empty resume.task}">
											<td>2017.03 ~ 2019.03</td>
											</c:if>
											<c:if test="${empty resume.task}">
											<td> - </td>
											</c:if>

											<c:if test="${not empty resume.task}">
											<td>${resume.task}</td>
											</c:if>
											<c:if test="${empty resume.task}">
											<td> - </td>
											</c:if>

											<c:if test="${not empty resume.task}">
											<td>삼성전자</td>
											</c:if>
											<c:if test="${empty resume.task}">
											<td> - </td>
											</c:if>

											<c:if test="${not empty resume.task}">
											<td>대리</td>
											</c:if>
											<c:if test="${empty resume.task}">
											<td> - </td>
											</c:if>

											<c:if test="${not empty resume.task}">
											<td>${resume.career}</td>
											</c:if>
											<c:if test="${empty resume.task}">
											<td> - </td>
											</c:if>
											
										</tr>
									</tbody>
								</table>
							</div>
							<div>
								<h3 style="margin-top: 40px;">
									<strong>언어</strong>
								</h3>
								<table>
									<thead>
										<tr>
											<th
												<c:forEach items="${language}" var="language" varStatus="status">
											<c:if test="${status.last}">
											colspan="${status.index+1}" </c:if></c:forEach>><strong>가능
													언어</strong></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach items="${language}" var="language"
												varStatus="status">
												<td class="languageTd">${language}</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>
							</div>
							<div>
								<h3 style="margin-top: 40px;">
									<strong>자격증/수상내역</strong>
								</h3>
								<table class="certificate">
									<thead>
										<tr>
											<th><strong>취득일/수상일</strong></th>
											<th><strong>구분</strong></th>
											<th><strong>자격/수상내역</strong></th>
											<th><strong>합격/점수</strong></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${certificate}" var="certificate">
											<tr>
												<td>2017.01</td>
												<td>자격증/면허증</td>
												<td>${certificate}(국가공인)</td>
												<td>최종합격</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<c:if test="${logintype == 'member'}">
					<div id="resumeBtn" class="col-md-10 offset-md-3">    
						<input type="button" class="btn btn-outline-success mr-1 mb-1" value="이력서 등록" onclick="location.href='/desket/mypage/member/resume/add.do?menuid=resumelist';"> 
						<input type="button" class="btn btn-outline-warning mr-1 mb-1" value="이력서 수정" onclick="location.href='/desket/mypage/member/resume/edit.do?menuid=resumelist&seq=${seq}';"> 
						<input type="button" class="btn btn-outline-danger mr-1 mb-1" value="이력서 삭제" onclick="delLetter();">
					</div>
					</c:if>
				</div>

				<c:if test="${not empty letter}">
				<div class="card" style="width: 70%; margin: 50px auto;">
					<div class="card-header">
						<div class="card-title"
							style="border-bottom: 1px solid #888; width: 100%;">
							<h2 style="display: inline-block;">
								<strong>자기소개서</strong>
							</h2>
						</div>
					</div>
					<div class="card-content">
						<div class="card-body">
							<c:forEach items="${letter}" var="letter">
							<strong>${letter.title}</strong>
							<table id="letter">
								<thead>
									<tr>
										<th><strong>내용</strong></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${letter.content}</td>
									</tr>
								</tbody>
							</table>
							</c:forEach>
						</div>
					</div>
				</div>
				</c:if>
				
				
			</div>
		</div>
	</div>
	<!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Footer-->
	<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
	<!-- END: Footer-->
</body>
</html>