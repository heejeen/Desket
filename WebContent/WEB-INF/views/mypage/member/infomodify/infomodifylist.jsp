<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>정보 수정</title>
<style>
	.card-body {
		padding: 40px !important;
	}
	
	.point {
		color: red;
	}
	
	.fspn {
		font-size: 1.2em;
		color: black;    
	}
	
	.col-12 {
	height: 58px;
	}
	
	.col-md-4 {
		padding-top: 8px;
	}
	
	.letterRadio {
		padding-top: 12px;
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
							<h2 class="content-header-title float-left mb-0">정보 수정</h2>
							<div class="breadcrumb-wrapper col-12">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/desket/home/index.do">Desket</a>
									</li>
									<li class="breadcrumb-item">마이페이지</li>
									<li class="breadcrumb-item active">정보 수정</li>
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
			<section id="group">
			<div class="row">
				<div class="col-12 mt-3 mb-1" style="height: auto;">
					<h3 class="text-uppercase" style="width: 70%; margin: 0px auto;"><strong>기본 정보</strong></h3>
				</div>
			</div>
			<div class="content-body">
				<!-- Basic Horizontal form layout section start -->
				<section id="basic-horizontal-layouts">
					<div class="row match-height">
						<div class="card" style="width: 70%; margin: 0px auto;">
							<div class="card-content">
								<div class="card-body">
									<form class="form form-horizontal" method="POST" action="/desket/mypage/member/infomodify/editok.do">
										<div class="form-body">
											<div class="row">

												<div class="col-12">
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">이름</span><span class="point"><small> 필수</small></span>
														</div>
														<div class="col-md-8">
															<input type="text" id="infoName" class="form-control"
																name="infoName" placeholder="이름 입력" value="${name}" required>
														</div>
													</div>
												</div>

												<div class="col-12">
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">생년월일</span><span class="point"><small> 필수</small></span>
														</div>
														<div class="col-md-8">
															<input type="text" id="infoBirth" class="form-control"
																name="infoBirth" placeholder="YYMMDD" value="${birth.substring(2,10).replace('-','')}" required>
														</div>
													</div>
												</div>

												<div class="col-12">                
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">성별</span><span class="point"><small> 필수</small></span>
														</div>
														<div class="col-md-8 letterRadio">
															<c:if test="${gender == '남자'}">     
															<label><input type="radio" name="infoGender" value="남자" checked>남자</label>
															<label><input type="radio" name="infoGender" value="여자">여자</label>
															</c:if>
															<c:if test="${gender == '여자'}">     
															<label><input type="radio" name="infoGender" value="남자">남자</label>
															<label><input type="radio" name="infoGender" value="여자" checked>여자</label>
															</c:if>
														</div>
													</div>
												</div>

												<div class="col-12">
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">전화번호</span><span class="point"><small> 필수</small></span>
														</div>
														<div class="col-md-8">
															<input type="text" id="infoTel" class="form-control"
																name="infoTel" placeholder="전화번호 입력" value="${tel}" required>
														</div>
													</div>
												</div>

												<div class="col-12">
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">이메일</span><span class="point"><small> 필수</small></span>
														</div>
														<div class="col-md-8">
															<input type="text" id="infoEmail" class="form-control"
																name="infoEmail" placeholder="이메일 입력" value="${email}" required>
														</div>
													</div>
												</div>

												<div class="col-12">
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">주소</span><span class="point"><small> 필수</small></span>
														</div>
														<div class="col-md-8">
															<input type="text" id="infoAddress" class="form-control"
																name="infoAddress" placeholder="주소 입력" value="${address}" required>
														</div>
													</div>
												</div>

												<div class="col-12">
													<div class="form-group row">
														<div class="col-md-4">
															<span class="fspn">사진</span>
														</div>
														<div class="col-md-8">
														<c:if test="${pic == 'nopic.png'}">
															<input type="text" id="infoPic" class="form-control"
																name="infoPic" value="" placeholder="사진">
														</c:if>
														<c:if test="${pic != 'nopic.png'}">
															<input type="text" id="infoPic" class="form-control"
																name="infoPic" value="${pic}" placeholder="사진">
														</c:if>
														</div>
													</div>
												</div>

												<div class="col-md-8 offset-md-4" style="padding-top: 15px;">
													<button type="submit" class="btn btn-primary mr-1 mb-1">수정 완료</button>
													<button type="reset" class="btn btn-outline-warning mr-1 mb-1">초기화</button>
												</div>

											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- // Basic Floating Label Form section end -->

			</div>
			</section>
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