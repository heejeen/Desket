<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>이력서 관리</title>
<style>
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

</style>


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
							<h2 class="content-header-title float-left mb-0">이력서 관리</h2>
							<div class="breadcrumb-wrapper col-12">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/desket/home/index.do">Desket</a>
									</li>
									<li class="breadcrumb-item">마이페이지</li>
									<li class="breadcrumb-item active">이력서 관리</li>
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
				<!-- Data list view starts -->
				<section id="data-list-view" class="data-list-view-header">
					<div class="action-btns d-none">
						<div class="btn-dropdown mr-1 mb-1">
							<div class="btn-group dropdown actions-dropodown">
								<button type="button"
									class="btn btn-white px-1 py-1 dropdown-toggle waves-effect waves-light"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">메뉴선택 </button>      
								<div class="dropdown-menu">
									<a class="dropdown-item" href="/desket/mypage/member/resume/add.do?menuid=resumelist">이력서 등록</a> 
									<a class="dropdown-item" href="#">이력서 수정</a>
									<a class="dropdown-item" href="#">이력서 삭제</a>
									<a class="dropdown-item" href="#">이력서 복사</a>
								</div>
							</div>
						</div>
					</div>

					<!-- DataTable starts -->
					<div class="table-responsive">
						<table class="table data-list-view">
							<thead>
								<tr>
									<th></th>
									<th>이력서 제목</th>
									<th>업무 분야</th>
									<th>희망 연봉</th>
									<th>작성 상태</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="dto">
							<c:if test="${dto.storageStatus != 2}">
								<tr>
									<td></td>
									
									<c:if test="${not empty dto.title}">
									<td class="product-name" onclick="location.href='/desket/mypage/member/resume/resumeview.do?menuid=resumelist&seq=${dto.seq}';">${dto.title}</td>
									</c:if>
									<c:if test="${empty dto.title}">
									<td class="product-name" onclick="location.href='/desket/mypage/member/resume/resumeview.do?menuid=resumelist&seq=${dto.seq}';">${dto.regdate}에 임시저장된 이력서입니다.</td>
									</c:if>
									
									<c:if test="${not empty dto.task}">
									<td class="product-category">${dto.task}</td>
									</c:if>
									<c:if test="${empty dto.task}">
									<td class="product-category"> - </td>
									</c:if>

									<c:if test="${not empty dto.salary}">
									<td class="product-price">${dto.salary} <small>만원</small></td>
									</c:if>
									<c:if test="${empty dto.salary	}">
									<td class="product-category"> - </td>
									</c:if>

									<td>
										<c:if test="${dto.storageStatus == 0}">
										<div class="chip chip-warning"> <!-- success: 초록 warning:주황 primary:파랑 -->
											<div class="chip-body">
												<div class="chip-text">작성중</div>
											</div>
										</div>
										</c:if>
										<c:if test="${dto.storageStatus == 1}">
										<div class="chip chip-success"> <!-- success: 초록 warning:주황 primary:파랑 -->
											<div class="chip-body">
												<div class="chip-text">작성완료</div>
											</div>
										</div>
										</c:if>
									</td>
									<td class="product-price">${dto.regdate.substring(0, 10)}</td>
								</tr>
							</c:if>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- DataTable ends -->

					<!-- add new sidebar starts -->
					<div class="add-new-data-sidebar">
						<div class="overlay-bg"></div>
						<div class="add-new-data">
							<div
								class="div mt-2 px-2 d-flex new-data-title justify-content-between">
								<div>
									<h4>ADD NEW DATA</h4>
								</div>
								<div class="hide-data-sidebar">
									<i class="feather icon-x"></i>
								</div>
							</div>
							<div class="data-items pb-3">
								<div class="data-fields px-2 mt-3">
									<div class="row">
										<div class="col-sm-12 data-field-col">
											<label for="data-name">Name</label> <input type="text"
												class="form-control" id="data-name">
										</div>
										<div class="col-sm-12 data-field-col">
											<label for="data-category"> Category </label> <select
												class="form-control" id="data-category">
												<option>Audio</option>
												<option>Computers</option>
												<option>Fitness</option>
												<option>Appliance</option>
											</select>
										</div>
										<div class="col-sm-12 data-field-col">
											<label for="data-status">Order Status</label> <select
												class="form-control" id="data-status">
												<option>Pending</option>
												<option>Canceled</option>
												<option>Delivered</option>
												<option>On Hold</option>
											</select>
										</div>
										<div class="col-sm-12 data-field-col">
											<label for="data-price">Price</label> <input type="number"
												class="form-control" id="data-price">
										</div>
										<div class="col-sm-12 data-field-col data-list-upload">
											<form action="#" class="dropzone dropzone-area"
												id="dataListUpload">
												<div class="dz-message">Upload Image</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div
								class="add-data-footer d-flex justify-content-around px-3 mt-2">
								<div class="add-data-btn">
									<button class="btn btn-primary">Add Data</button>
								</div>
								<div class="cancel-data-btn">
									<button class="btn btn-outline-danger">Cancel</button>
								</div>
							</div>
						</div>
					</div>
					<!-- add new sidebar ends -->
				</section>
				<!-- Data list view end -->

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