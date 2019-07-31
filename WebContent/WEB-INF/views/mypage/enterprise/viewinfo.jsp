<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form-control.long {
		width: 400px;
	}
	
	.form-control.short {
		width: 200px;
	}
	
	.btn1 {
		width: 800px;
		margin: 0px auto;
	}
	
	.btn1 input {
		color: black;
	}
		
	.btn1 input:nth-child(1):hover {
		opacity: 0.8;
		color: white;
	}
	
	.btn1 > input:nth-child(2):hover {
		opacity: 0.8;
		color: white;
	}
	
	.table tbody tr td:nth-child(2) { text-align: left; }
	.table tbody tr td { height: 70px; }
</style>

<script>
	
	$(function() {
		
	
		
	});
	
</script>

<!-- BEGIN : CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
<!-- END : CSS -->
   
</head>
<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

   	<jsp:include page="/inc/home/sidebar.jsp" ></jsp:include>
    <!-- BEGIN: Content-->
    <div class="app-content content">
    
	<jsp:include page="/inc/home/headerbar.jsp" ></jsp:include>
    <!-- END: Header-->   
       
      
    <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Home</h2>
                            
                            
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                    <div class="form-group breadcrum-right">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings"></i></button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">






                <div class="row">
                    <div class="col-12">
                        <div class="card" style="width: 1000px; margin: 0px auto;">
                            <div class="card-header">
                                <h4 class="card-title"></h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                        <!-- Info table about action starts -->
												<div style="text-align:center; width: 800px; margin: 0px auto;">
													<h4 style="font-weight: bold;">내정보 보기</h4>
														<table class="table table-striped">
															<thead style="background-color: #D8D4FB;">
																<tr>
																	<th>비고</th>
																	<th>상세정보</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>기업명</td>
																	<td><div>${dto.enterpriseName}</div></td>
																</tr>
																<tr>
																	<td>아이디</td>
																	<td><div>${dto.id}</div></td>
																</tr>
																<tr>
																	<td>비밀번호</td>
																	<td>
																		<div id="pw1">
																			${dto.pw.substring(0, 1)} ***** ${dto.pw.substring(dto.pw.length()-1, dto.pw.length())}
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>사업자등록번호</td>
																	<td><div>${dto.businessNumber}</div></td>
																</tr>
																<tr>
																	<td>전화번호</td>
																	<td><div>${dto.tel}</div></td>
																</tr>
																<tr>
																	<td>주소</td>
																	<td><div>${dto.address}</div></td>
																</tr>
																<tr>
																	<td>규모</td>
																	<td><div>${dto.scale}</div></td>
																</tr>
																<tr>
																	<td>업종</td>
																	<td><div>${dto.field}</div></td>
																</tr>
																<tr>
																	<td>설립연도</td>
																	<td><div>${dto.establishYear}</div></td>
																</tr>
																<tr>
																	<td>기업소개</td>
																	<td><div>${dto.introduction}</div></td>
																</tr>
															</tbody>
														</table>
													</div>
													
													<div class="btn1">
														<input type="button" value="수정하기" class="btn btn-warning" onclick="location.href='/desket/mypage/enterprise/edit.do?id=${dto.id}';" />
														<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='/desket/home/index.do';" />
													</div>
												
												
												<!-- Info table about action Ends -->
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>     
                   
    </div>       
    <!-- Content -->      

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

<!-- BEGIN: Footer-->
<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
<!-- END: Footer-->

</body>
</html>