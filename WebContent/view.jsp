<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
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
 <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/vendors/css/charts/apexcharts.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/pages/card-analytics.css">
    <!-- END: Page CSS-->
    <script src = "/desket/assets/js/jquery-1.12.4.js"type="text/javascript"></script>
    <script>
	
		
	
	
	</script>
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
							<h2 class="content-header-title float-left mb-0">상세보기</h2>


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
				<!-- card actions section start -->
				<section id="card-actions">
					<!-- Info table about action starts -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">									
									<a class="heading-elements-toggle"><i
										class="fa fa-ellipsis-v font-medium-3"></i></a>
									<div class="heading-elements">
										<ul class="list-inline mb-0">
											<li><a data-action="collapse"><i
													class="feather icon-chevron-down"></i></a></li>
											<li><a data-action="reload"><i
													class="feather icon-rotate-cw"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="card-content collapse show">
									<div class="card-body">
										<div class="row">											
											<div class="col-sm-6" style="text-align:center;">
												<h4 style="font-weight: bold;">공고 내용</h4>
												<table class="table table-striped">
													<thead>
														<tr>
															<th>비고</th>
															<th>상세</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>공고명</td>
															<td>${adto.title }</td>
														</tr>
														<tr>
															<td>직무</td>
															<td>${adto.job }</td>
														</tr>
														<tr>
															<td>지역</td>
															<td>${adto.region }</td>
														</tr>
														<tr>
															<td>학력</td>
															<td>${adto.education } 이상</td>
														</tr>
														<tr>
															<td>연봉</td>
															<td>${adto.minimumAnnualSalary }~${adto.maximumAnnualSalary } 만원</td>
														</tr>
														<tr>
															<td>나이</td>
															<td>${adto.minimumAge }~${adto.maximumAge }세</td>
														</tr>
														<tr>
															<td>경력</td>
															<td>${adto.career }</td>
														</tr>
														<tr>
															<td>모집인원</td>
															<td>${adto.fixedNumber }명</td>
														</tr>
														<tr>
															<td>마감일</td>
															<td>${adto.deadline }</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-sm-6" style="text-align:center;">
												<h4 style="font-weight: bold;">기업 정보</h4>
												<table class="table table-striped" >
													<thead>
														<tr>
															<th>비고</th>
															<th>상세</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>기업이미지</td>
															<td style="background-image: url('/desket/images/${idto.pic}'); 
															background-size:contain; background-repeat:no-repeat; background-position:center;"></td>
														</tr>
														<tr>
															<td>기업명</td>
															<td>${idto.id }</td>
														</tr>
														<tr>
															<td>설립연도</td>
															<td>${idto.establishYear }</td>
														</tr>
														<tr>
															<td>규모</td>
															<td>${idto.scale }</td>
														</tr>
														<tr>
															<td>분야</td>
															<td>${idto.field }</td>
														</tr>
														<tr>
															<td>주소</td>
															<td>${idto.address }</td>
														</tr>
														<tr>
															<td>연락처</td>
															<td>${idto.tel }</td>
														</tr>
														<tr>
															<td>홈페이지</td>
															<td><a href="${idto.hompage }">${idto.hompage }</a> </td>
														</tr>
														<tr>
															<td>기업소개(상세보기)</td>
															<td><a href="">${idto.introduction }</a></td>
														</tr>
													</tbody>
												</table>											
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Info table about action Ends -->
					</section>
					
                    <div class="row">
                        <div class="col-lg-4 col-12">
                              <div class="card">                                
                                <div class="card-content">
                                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
                                    <div class="card-body pb-0">
                                      	<canvas id="career"></canvas>
                                    </div>
                                </div>
                                <script>
                                var ctx = document.getElementById('career').getContext('2d');
                                var chart = new Chart(ctx, {
                                    // The type of chart we want to create
                                    type: 'bar',

                                    // The data for our dataset
                                    data: {
                                        labels: [
                                        	<c:forEach items="${ccnt}" var="dto">
                                        	'${dto.career}년', 
                                        	</c:forEach>
                                        	],
                                        datasets: [{
                                            label: '지원자 경력 현황',
                                            backgroundColor: 'rgb(255, 99, 132)',
                                            borderColor: 'rgb(255, 99, 132)',
                                            data: [
                                            	<c:forEach items="${ccnt}" var="dto">
                                            	${dto.cnt}, 
                                            	</c:forEach>
                                            	]
                                        }]
                                    },

                                    // Configuration options go here
                                    options: {
                                    	layout: {
                                            padding: {
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 20
                                            }
                                        },                                        
                                    	
								        scales: {
								            yAxes: [{
								                ticks: {
								                    beginAtZero: true
								                }
								            }]
								        }
								    }
                                });
                                </script>
                            </div>
                        </div>                       
                        <div class="col-lg-4 col-12">
                           <div class="card">                                
                                <div class="card-content">
                                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
                                    <div class="card-body pb-0">
                                      	<canvas id="gender"></canvas>
                                    </div>
                                </div>
                                <script>
                                var ctx = document.getElementById('gender').getContext('2d');
                                var chart = new Chart(ctx, {
                                    // The type of chart we want to create
                                    type: 'pie',

                                    // The data for our dataset
                                    data: {
                                        labels: [
                                        	<c:forEach items="${gcnt}" var="dto">
                                        	'${dto.gender}', 
                                        	</c:forEach>
                                        	],
                                        datasets: [{
                                            label: '지원자 성별 현황',
                                            backgroundColor: ['rgb(255, 99, 132)','rgb(70, 99, 132)','rgb(70, 99, 132)'],
                                            borderColor: ['rgb(255, 99, 132)','rgb(70, 99, 132)'],
                                            data: [
                                            	<c:forEach items="${gcnt}" var="dto">
                                        		'${dto.cnt}', 
                                        		</c:forEach>
                                        		]
                                        }]
                                    },

                                    // Configuration options go here
                                    options: {
                                    	layout: {
                                            padding: {
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 20
                                            }
                                        }
                                    }
								        
                                });
                                </script>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="card">                                
                                <div class="card-content">
                                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
                                    <div class="card-body pb-0">
                                      	<canvas id="education"></canvas>
                                    </div>
                                </div>
                                <script>
                                var ctx = document.getElementById('education').getContext('2d');
                                var chart = new Chart(ctx, {
                                    // The type of chart we want to create
                                    type: 'bar',

                                    // The data for our dataset
                                    data: {
                                        labels: [
                                        	<c:forEach items="${ecnt}" var="dto">
                                        	'${dto.education}', 
                                        	</c:forEach>
                                        	],
                                        datasets: [{
                                            label: '지원자 학력 현황',
                                            backgroundColor: 'rgb(255, 99, 132)',
                                            borderColor: 'rgb(255, 99, 132)',
                                            data: [
                                            	<c:forEach items="${ccnt}" var="dto">
                                            	${dto.cnt}, 
                                            	</c:forEach>
                                            	]
                                        }]
                                    },

                                    // Configuration options go here
                                    options: {
                                    	layout: {
                                            padding: {
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 20
                                            }
                                        }
                                    	,
								        scales: {
								            yAxes: [{
								                ticks: { 
								                    beginAtZero: true
								                }
								            }]
								        }
								    }
                                    
                                });
                                </script>
                            </div>
                        </div>
                    </div>  
					<div>
						<input type="button" value="돌아가기" onclick="location.href='/desket/notice/list.do'"
							class="form-control col-1 float-right" />
					</div>
				<c:if test="${logintype=='member' }">
					<div>
						<input type="button" value="지원하기"
							class="form-control col-1 float-right" /> <!--?seq=seq  -->
					</div>
				</c:if>
				<c:if test="${logintype=='member' }">
					<div>
						<%-- "location.href='/desket/notice/interest.do?id=${id}&seq=${seq }'" --%>
						<input id="test1"type="button" value="관심등록"
							class="form-control col-1 float-right"/> 
					</div>
					<script>		
													
						$( "#test1" ).click(function() {
						 $(this).attr('value','ok')
						 
						 $.ajax({
								"type":"GET", 
								"url":"/desket/notice/interest.do", 
								"data":{'id':'${id}','seq':'${seq}'},								
								error:function(a,b,c){ //에러 발생시 자동 호출
									alert(a+b+c);
								}			
							});
						 
						});
							
							
						
 						
 					</script>
					
				</c:if>
			</div>
		</div>
	</div>
	<!-- Content -->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Footer-->
	<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
	<!-- END: Footer-->
	 <!-- BEGIN: Vendor JS-->
    <script src="/desket/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/desket/app-assets/vendors/js/charts/apexcharts.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/desket/app-assets/js/core/app-menu.js"></script>
    <script src="/desket/app-assets/js/core/app.js"></script>
    <script src="/desket/app-assets/js/scripts/components.js"></script>
    <script src="/desket/app-assets/js/scripts/cards/card-analytics.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
   
   
   
    <!-- END: Page JS-->
</body>
</html>