<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>이력서 등록</title>
<script
	src="<%=request.getContextPath()%>/app-assets/js/core/libraries/jquery.min.js"></script>
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

.card-header {
	padding: 20px !important;
}

.card-body {
	padding: 40px !important;
	padding-bottom: 0px !important;
}

.point {
	color: red;
}

.fspn {
	font-size: 1.2em;
	color: black;
}

#letter {
	padding: 20px !important;
	padding-bottom: 0px !important;
}

#letterBtn {
	margin-top: 25px;
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
<script>
	var temp = "";
	var cnt = 0;
	var lanTemp = "";
	var lanCnt = 0;	
	var cerTemp = "";
	var cerCnt = 0;

	//자소서 항목 추가
	function addLetter() {
		cnt++;

		temp = "<textarea class='form-control letterTitle' name='letterTitle" + cnt + "' rows='3' placeholder='자소서 제목'></textarea><textarea class='form-control  letterContent' name='letterContent" + cnt + "' rows='20' placeholder='자소서 내용'></textarea>";

		$("#letterForm").append(temp);
		$(".letterTitle, .letterContent").css("resize", "none");
		$(".letterContent").css("margin-bottom", "40px");
		$("#cnt").attr("value", cnt);
	}//자소서 항목 추가

	//자소서 항목 삭제
	function delLetter() {
		if (cnt > 0) {
			cnt--;
		}
		$("textarea:last-child").remove();
		$("textarea:last-child").remove();

		$("#cnt").attr("value", cnt);
	}//자소서 항목 삭제
	
	
	
	
	//언어 추가
	function addLanguage(){
		lanCnt++;

		lanTemp = "<div class='col-12' style='height:45px;'><div class='form-group row'><div class='col-md-4'></div><div class='col-md-8'><!-- BEGIN : 언어 선택 --><select name='language" + lanCnt + "' class='form-control' style='width: 100%; display: block;'><option value=''>언어선택</option><c:forEach items='${languageList}' var='list'><option value='${list.seq}'>${list.language}</option></c:forEach></select><!-- END : 언어 선택 --></div></div></div></div>";              

		$("#languageForm").append(lanTemp);
		$("#lanCnt").attr("value", lanCnt);
	}//언어 추가
	
	//언어 삭제
	function delLanguage() {
		if (lanCnt > 0) {
			lanCnt--;
		}
		$("#languageForm > div:last-child").remove();

		$("#lanCnt").attr("value", lanCnt);
	}//언어 삭제
	
	
	
	
	//자격증 추가
	function addCertificate(){
		cerCnt++;

		cerTemp = "<div class='col-12' style='height:45px;'><div class='form-group row'><div class='col-md-4'></div><div class='col-md-8'><!-- BEGIN : 자격증 선택 --><select name='certificate" + cerCnt + "' class='form-control' style='width: 100%; display: block;'><option value=''>자격증선택</option><c:forEach items='${certificateList}' var='list'><option value='${list.seq}'>${list.certificateName}</option></c:forEach></select><!-- END : 자격증 선택 --></div></div></div></div>";              

		$("#certificateForm").append(cerTemp);
		$("#cerCnt").attr("value", cerCnt);
	}//자격증 추가
	
	//자격증 삭제
	function delCertificate() {
		if (cerCnt > 0) {
			cerCnt--;
		}
		$("#certificateForm > div:last-child").remove();

		$("#cerCnt").attr("value", cerCnt);
	}//자격증 삭제
	
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
							<h2 class="content-header-title float-left mb-0">이력서 등록</h2>
							<div class="breadcrumb-wrapper col-12">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="/desket/home/index.do">Desket</a></li>
									<li class="breadcrumb-item"><a
										href="/desket/mypage/member/resume/resumelist.do?menuid=resumelist">이력서
											관리</a></li>
									<li class="breadcrumb-item active">이력서 등록</li>
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


			<form method="POST" action="/desket/mypage/member/resume/addok.do">

				<!-- BEGIN : 자소서 -->
				<div class="content-body">
					<div class="card" style="width: 70%; margin: 50px auto 0px;">
						<div class="card-header">
							<div class="card-title"
								style="border-bottom: 1px solid #888; width: 100%;">
								<h2 style="display: inline-block;">
									<strong>자기소개서</strong>
								</h2>
							</div>
						</div>
						<div class="card-content">
							<div class="card-body" id="letter">
								<fieldset class="form-group">

									<!-- BEGIN : 자소서 내용 입력 -->
									<div id="letterForm">

										<input type="hidden" name="cnt" id="cnt" value="0">
									</div>
									<!-- END : 자소서 내용 입력 -->

									<div id="letterBtn" class="col-md-8 offset-md-4">
										<input type="button" class="btn btn-outline-success mr-1 mb-1"
											value="항목 추가" onclick="addLetter();"> <input
											type="button" class="btn btn-outline-danger mr-1 mb-1"
											value="항목 삭제" onclick="delLetter();">
									</div>
								</fieldset>
							</div>
						</div>
					</div>
				</div>
				<!-- END : 자소서 -->



				<!-- BEGIN : 기본정보 -->
				<div class="row">
					<div class="col-12 mt-3 mb-1" style="height: auto;">
						<h3 class="text-uppercase" style="width: 70%; margin: 0px auto;">
							<strong>기본 정보</strong>
						</h3>
					</div>
				</div>
				<div class="content-body">
					<div class="card" style="width: 70%; margin: auto;">
						<div class="card-content">
							<div class="card-body">
								<fieldset class="form-group">

									<!-- BEGIN : 기본정보 내용 입력 -->
									<div class="form-body">
										<div class="row">

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">이름</span><span class="point"><small>
																필수</small></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="infoName" class="form-control"
															name="infoName" placeholder="이름 입력" value="${name}"
															required>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">생년월일</span><span class="point"><small>
																필수</small></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="infoBirth" class="form-control"
															name="infoBirth" placeholder="YYMMDD"
															value="${birth.substring(2,10).replace('-','')}" required>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">성별</span><span class="point"><small>
																필수</small></span>
													</div>
													<div class="col-md-8 letterRadio">
														<c:if test="${gender == '남자'}">
															<label><input type="radio" name="infoGender"
																value="남자" checked>남자</label>
															<label><input type="radio" name="infoGender"
																value="여자">여자</label>
														</c:if>
														<c:if test="${gender == '여자'}">
															<label><input type="radio" name="infoGender"
																value="남자">남자</label>
															<label><input type="radio" name="infoGender"
																value="여자" checked>여자</label>
														</c:if>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">전화번호</span><span class="point"><small>
																필수</small></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="infoTel" class="form-control"
															name="infoTel" placeholder="전화번호 입력" value="${tel}"
															required>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">이메일</span><span class="point"><small>
																필수</small></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="infoEmail" class="form-control"
															name="infoEmail" placeholder="이메일 입력" value="${email}"
															required>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">주소</span><span class="point"><small>
																필수</small></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="infoAddress" class="form-control"
															name="infoAddress" placeholder="주소 입력" value="${address}"
															required>
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

										</div>
									</div>
									<!-- END : 기본정보 내용 입력 -->
								</fieldset>
							</div>
						</div>
					</div>
				</div>
				<!-- END : 기본정보 -->


				<!-- BEGIN : 추가정보 -->
				<div class="row">
					<div class="col-12 mt-3 mb-1" style="height: auto;">
						<h3 class="text-uppercase" style="width: 70%; margin: 0px auto;">
							<strong>추가 정보</strong>
						</h3>
					</div>
				</div>
				<div class="content-body">
					<div class="card"
						style="width: 70%; margin-left: auto; margin-right: auto;">
						<div class="card-content">
							<div class="card-body">
								<fieldset class="form-group">

									<!-- BEGIN : 추가정보 내용 입력 -->
									<div class="form-body">
										<div class="row">

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">이력서 제목</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeTitle" class="form-control"
															name="resumeTitle" placeholder="이력서 제목 입력">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">사진</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumePic" class="form-control"
															name="resumePic" placeholder="사진">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">희망업무</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeTask" class="form-control"
															name="resumeTask" placeholder="ex) 웹개발자">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">국적</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeNationality"
															class="form-control" name="resumeNationality"
															placeholder="ex) 대한민국">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">학력</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<select name="resumeEducation" id="resumeEducation"
															class="form-control">
															<option value="">학력 선택</option>
															<option value="초등학교">초등학교</option>
															<option value="중학교">중학교</option>
															<option value="고등학교">고등학교</option>
															<option value="대학(2,3년)">대학(2,3년)</option>
															<option value="대학교(4년)">대학교(4년)</option>
															<option value="대학원(석사)">대학원(석사)</option>
															<option value="대학원(박사)">대학원(박사)</option>
														</select>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">전공</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeMajor" class="form-control"
															name="resumeMajor" placeholder="ex) 컴퓨터공학">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">졸업구분</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<select name="resumeGraduation" id="resumeGraduation"
															class="form-control">
															<option value="">졸업 구분</option>
															<option value="졸업">졸업</option>
															<option value="재학중">재학중</option>
															<option value="휴학중">휴학중</option>
															<option value="수료">수료</option>
															<option value="중퇴">중퇴</option>
															<option value="자퇴">자퇴</option>
															<option value="졸업예정">졸업예정</option>
														</select>
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">학점</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeGrades" class="form-control"
															name="resumeGrades" placeholder="3.3 학점 점수로 변환">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">경력</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeCareer" class="form-control"
															name="resumeCareer" placeholder="년단위 입력 ex) 1">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">희망연봉</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumeSalary" class="form-control"
															name="resumeSalary" placeholder="ex) 3200 (단위: 만원)">
													</div>
												</div>
											</div>

											<div class="col-12">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">포트폴리오 주소</span><span class="point"></span>
													</div>
													<div class="col-md-8">
														<input type="text" id="resumePortfolio"
															class="form-control" name="resumePortfolio"
															placeholder="포트폴리오 주소 입력">
													</div>
												</div>
											</div>

											<div class="col-12" style="height: 45px;">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">가능 언어</span><span class="point"></span>
													</div>   
													<div class="col-md-8" style="padding-top: 3px;">
														<span>
															<input type="button" class="btn btn-icon btn-outline-primary feather ml-10 mr-0 mb-0 waves-effect waves-light icon-plus" onclick="addLanguage();" value=" 항목 추가">      
															<input type="button" class="btn btn-icon btn-outline-primary feather mr-0 mb-0 waves-effect waves-light icon-minus" onclick="delLanguage();" value=" 항목 삭제">
															<input type="hidden" name="lanCnt" id="lanCnt" value="0">
														</span>   
													</div>      
												</div>
											</div>

										</div>
										<!-- BEGIN: 언어 추가 -->
										<div id="languageForm" class="row">
										</div>
										<!-- END: 언어 추가 -->
										
										
									</div>
									
									
									<div class="form-body" style="padding-top: 10px;">
										<div id="languageForm" class="row">
										
											<div class="col-12" style="height: 45px;">
												<div class="form-group row">
													<div class="col-md-4">
														<span class="fspn">소유 자격증</span><span class="point"></span>
													</div>   
													<div class="col-md-8" style="padding-top: 3px;">
														<span>
															<input type="button" class="btn btn-icon btn-outline-primary feather ml-10 mr-0 mb-0 waves-effect waves-light icon-plus" onclick="addCertificate();" value=" 항목 추가">      
															<input type="button" class="btn btn-icon btn-outline-primary feather mr-0 mb-0 waves-effect waves-light icon-minus" onclick="delCertificate();" value=" 항목 삭제">
															<input type="hidden" name="cerCnt" id="cerCnt" value="0">
														</span>   
													</div>      
												</div>
											</div>
									
										</div>
										<!-- BEGIN: 자격증 추가 -->
										<div id="certificateForm" class="row">
										</div>
										<!-- END: 자격증 추가 -->
									</div>
									<!-- END : 추가정보 내용 입력 -->

									<div class="col-md-8 offset-md-4" style="padding-top: 15px;">
										<button type="submit" class="btn btn-primary mr-1 mb-1">이력서
											저장</button>
										<button type="reset" class="btn btn-outline-warning mr-1 mb-1">초기화</button>
									</div>
								</fieldset>
							</div>
						</div>
					</div>
				</div>
				<!-- END : 추가정보 -->

			</form>
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