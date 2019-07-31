<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<meta charset="UTF-8">
<title>공고</title>
<style>
body{
	font-family: consolas;
}

.tbl1 {
	width: 1600px;
}

.tbl1 th:nth-child(1) {
	width: 750px;
	margin-right: 100px;
	display: inline-block;
}

.tbl1 th:nth-child(2) {
	width: 750px;
	display: inline-block;
	

}
#writebtn{
	position:absolute; 
	top:10px; 
	right: 50px;
	background-color: #7367F0; 
	border: 0px; 
	padding: 8px 13px;
	box-sizing: none;
	color:#EEE;
}

</style>

<script src="/desket/assets/js/jquery-1.12.4.js" type="text/javascript"></script>
<!-- BEGIN : CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
<!-- END : CSS -->
<script type="text/javascript">
	$(function() {
		//관심일때 아닐때
		
		
		$("#selPage").change(function() {
			location.href = "/myhome/board/list.do?page=" + $(this).val();

		});//selpage
				
		
	});//ready	
</script>
<!-- BEGIN: Vendor CSS-->
<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/vendors/css/file-uploaders/dropzone.min.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/components.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/plugins/file-uploaders/dropzone.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/pages/data-list-view.css">

</head>
<body
	class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	<jsp:include page="/inc/home/sidebar.jsp"></jsp:include>
	<!-- BEGIN: Content-->
	<div class="app-content content">

		<jsp:include page="/inc/home/headerbar.jsp"></jsp:include>
		<!-- END: Header-->


		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h2 class="content-header-title float-left mb-0">공고게시판</h2>
								

						</div>
					</div>
				</div>				
			</div>
			<div class="content-body">
				<!-- Basic tabs start -->
				<section id="basic-tabs-components">
					<div class="row">
						<div class="col-sm-12">
							<div class="container col-sm-12" style="background-color: #fff;">
								<ul class="nav nav-tabs" role="tablist" style="position: relative;">
									<li class="nav-item"><a class="nav-link active"
										id="all-tab" data-toggle="tab" href="#all" aria-controls="all"
										role="tab" aria-selected="false">전체공고</a></li>
									<li class="nav-item"><a class="nav-link" id="profile-tab"
										data-toggle="tab" href="#recommand" aria-controls="profile"
										role="tab" aria-selected="false">추천공고</a></li>
										
									<c:if test="${logintype=='enterprise' }">	
									<li class="nav-item"><a class="nav-link" id="profile-tab"
										data-toggle="tab" href="#closed" aria-controls="profile"
										role="tab" aria-selected="false">마감공고</a></li>
									</c:if>	
										
									<c:if test="${logintype=='member' }">

										<li class="nav-item"><a class="nav-link "
											id="profile-tab" data-toggle="tab" href="#interest"
											aria-controls="profile" role="tab" aria-selected="false">관심공고</a>
										</li>
									</c:if>
									<c:if test="${logintype=='enterprise' }">	
									<li>
										<div>
											<input id="writebtn" class="" type="button" value="공고작성" onclick="location.href='/desket/mypage/enterprise/add.do?menuid=add';">
										</div>
									</li>									
									</c:if>	
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="all" aria-labelledby="all-tab"
										role="tabpanel">
										<section id="data-list-view" class="data-list-view-header">
											<div class="action-btns d-none">
												<div class="btn-dropdown mr-1 mb-1"></div>
											</div>
											<div class="table-responsive col-sm-12">
												<table class="table data-list-view"
													style="text-align: center;">
													<thead>
														<tr>
															<th>기업명</th>
															<th>공고제목</th>															
															<th>직무</th>
															<th>지역</th>
															<th>학력</th>
															<th>경력</th>
															<th>나이</th>
															<th>연봉(만원)</th>
															<th>등록일/마감일</th>
															<th>조회수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${alist }" var="dto" >
															<tr>
																<td class="id">${dto.id } </td>
																<td class="title"><a
																	<c:if test="${not empty id }">
																	 href="/desket/notice/view.do?seq=${dto.seq }&id=${dto.id }&menuid=notice"
																	</c:if>
																	<c:if test="${empty id }">
																	 href="/desket/home/login.do"
																	</c:if>>${dto.title }</a></td>															
																<td class="job">${dto.job }</td>
																<td class="region">${dto.region }</td>
																<td class="education">${dto.education }</td>
																<td class="career">${dto.career }</td>
																<td class="age">${dto.minimumAge } ~
																	${dto.maximumAge }</td>
																<td class="salary">${dto.minimumAnnualSalary } ~
																	${dto.maximumAnnualSalary }</td>
																<td class="date">${dto.regdate } ~ ${dto.deadline }</td>
																<td>${dto.count }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</section>
									</div>
									<div class="tab-pane" id="recommand"
										aria-labelledby="profile-tab" role="tabpanel">
										<section id="data-list-view" class="data-list-view-header">
											<div class="action-btns d-none">
												<div class="btn-dropdown mr-1 mb-1"></div>
											</div>
											<div class="table-responsive col-sm-12">
												<table class="table data-list-view">
													<thead>
														<tr>
															<th>기업</th>
															<th>공고제목</th>
															<th>직무</th>
															<th>지역</th>
															<th>학력</th>
															<th>경력</th>
															<th>나이</th>
															<th>연봉(만원)</th>
															<th>규모</th>
															<th>등록일/마감일</th>
															<th>조회수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${rlist }" var="dto">
															<tr>
																<td class="id">${dto.id }</td>
																<td class="title"><a
																	<c:if test="${not empty id }">
																	 href="/desket/notice/view.do?seq=${dto.seq }&id=${dto.id }&menuid=notice"
																	</c:if>
																	<c:if test="${empty id }">
																	 href="/desket/home/login.do"
																	</c:if>>${dto.title }</a></td>
																<td class="job">${dto.job }</td>
																<td class="region">${dto.region }</td>
																<td class="education">${dto.education }</td>
																<td class="career">${dto.career }</td>
																<td class="age">${dto.minimumAge } ~
																	${dto.maximumAge }</td>
																<td class="salary">${dto.minimumAnnualSalary } ~
																	${dto.maximumAnnualSalary }</td>
																<td class="scale">${dto.scale }</td>
																<td class="date">${dto.regdate } ~ ${dto.deadline }
																<td>${dto.count }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</section>
									</div>

									<div class="tab-pane" id="interest" role="tabpanel"
										aria-labelledby="dropdown31-tab" aria-expanded="false">
										<section id="data-list-view" class="data-list-view-header">
											<div class="action-btns d-none">
												<div class="btn-dropdown mr-1 mb-1"></div>
											</div>
											<div class="table-responsive col-sm-12">
												<table class="table data-list-view">
													<thead>
														<tr>
															<th>기업</th>
															<th>공고제목</th>
															<th>직무</th>
															<th>지역</th>
															<th>학력</th>
															<th>경력</th>
															<th>나이</th>
															<th>연봉(만원)</th>
															<th>등록일/마감일</th>
															<th>조회수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${ilist }" var="dto">
															<tr>
																<td class="id">${dto.id }</td>
																<td class="title"><a
																	<c:if test="${not empty id }">
																	 href="/desket/notice/view.do?seq=${dto.seq }&id=${dto.id }&menuid=notice"
																	</c:if>
																	<c:if test="${empty id }">
																	 href="/desket/home/login.do"
																	</c:if>>${dto.title }</a></td>
																<td class="job">${dto.job }</td>
																<td class="region">${dto.region }</td>
																<td class="education">${dto.education }</td>
																<td class="career">${dto.career }</td>
																<td class="age">${dto.minimumAge } ~
																	${dto.maximumAge }</td>
																<td class="salary">${dto.minimumAnnualSalary } ~
																	${dto.maximumAnnualSalary }</td>
																<td class="date">${dto.regdate } ~ ${dto.deadline }
																<td>${dto.count }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</section>
									</div>
									<c:if test="${logintype=='enterprise' }">	
									<div class="tab-pane" id=closed role="tabpanel"
										aria-labelledby="dropdown31-tab" aria-expanded="false">
										<section id="data-list-view" class="data-list-view-header">
											<div class="action-btns d-none">
												<div class="btn-dropdown mr-1 mb-1"></div>
											</div>
											<div class="table-responsive col-sm-12">
												<table class="table data-list-view">
													<thead>
														<tr>
															<th>기업</th>
															<th>공고제목</th>
															<th>직무</th>
															<th>지역</th>
															<th>학력</th>
															<th>경력</th>
															<th>나이</th>
															<th>연봉(만원)</th>
															<th>등록일/마감일</th>
															<th>조회수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${clist }" var="dto">
															<tr>
																<td class="id">${dto.id }</td>
																<td class="title"><a
																	<c:if test="${not empty id }">
																	 href="/desket/notice/view.do?seq=${dto.seq }&id=${dto.id }&status=closed&menuid=notice"
																	</c:if>
																	<c:if test="${empty id }">
																	 href="/desket/home/login.do"
																	</c:if>>${dto.title }</a></td>
																<td class="job">${dto.job }</td>
																<td class="region">${dto.region }</td>
																<td class="education">${dto.education }</td>
																<td class="career">${dto.career }</td>
																<td class="age">${dto.minimumAge } ~
																	${dto.maximumAge }</td>
																<td class="salary">${dto.minimumAnnualSalary } ~
																	${dto.maximumAnnualSalary }</td>
																<td class="date">${dto.regdate }~${dto.deadline }
																<td>${dto.count }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</section>
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Basic Tag Input end -->


				






			</div>
		</div>

	</div>
	<!-- Content -->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Vendor JS-->
	<script src="/desket/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script src="/desket/app-assets/vendors/js/extensions/dropzone.min.js"></script>
	<script
		src="/desket/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
	<script
		src="/desket/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
	<script
		src="/desket/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
	<script
		src="/desket/app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js"></script>

	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="/desket/app-assets/js/core/app-menu.js"></script>
	<script src="/desket/app-assets/js/core/app.js"></script>
	<script src="/desket/app-assets/js/scripts/components.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script src="/desket/app-assets/js/scripts/ui/data-list-view.js"></script>



</body>
</html>