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
	
	.table tr th:nth-child(1) { border-right: 1px solid #DCDCDC; }
	
	.table tr td:nth-child(1) { border-right: 1px solid #DCDCDC; }
		
</style>


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
                            
                            <div style="width: 600px; margin: 0px auto; ">
                            	<h2>공고 게시판</h2>
                            </div>
                            
                            
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
											<form method="POST" action="/desket/mypage/enterprise/addok.do?menuid=announcelist">
												<div style="text-align:center; width: 800px; margin: 0px auto;">
													<h4 style="font-weight: bold;">공고 작성</h4>
														<table class="table table-striped">
															<thead style="background-color: #D8D4FB;">
																<tr>
																	<th>비고</th>
																	<th>상세</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>공고명</td>
																	<td><input type="text" id="title" name="title" class="form-control long" required/></td>
																</tr>
																<tr>
																	<td>직무</td>
																	<td><input type="text" id="job" name="job" class="form-control long" /></td>
																</tr>
																<tr>
																	<td>지역</td>
																	<td><input type="text" id="region" name="region" class="form-control long" /></td>
																</tr>
																<tr>
																	<td>학력</td>
																	<td><input type="text" id="education" name="education" class="form-control short" placeholder="ex) 대졸,고졸" /></td>
																</tr>
																<tr>
																	<td>최소연봉</td>
																	<td><input type="text" id="minimumAnnualSalary" name="minimumAnnualSalary" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>최대연봉</td>
																	<td><input type="text" id="maximumAnnualSalary" name="maximumAnnualSalary" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>최소나이</td>
																	<td><input type="text" id="minimumAge" name="minimumAge" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>최대나이</td>
																	<td><input type="text" id="maximumAge" name="maximumAge" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>경력</td>
																	<td>
																		<input type="text" id="career" name="career" class="form-control short" placeholder="ex) 신입,1~3년" />
																	</td>
																</tr>
																<tr>
																	<td>MBTI유형</td>
																	<td>
																		<select name="mbtiTypeSeq" id="mbtiTypeSeq" class="form-control short">
																			<option value="1">ESTJ</option>
																			<option value="2">ESTP</option>
																			<option value="3">ESFJ</option>
																			<option value="4">ESFP</option>
																			<option value="5">ENTJ</option>
																			<option value="6">ENTP</option>
																			<option value="7">ENFJ</option>
																			<option value="8">ENFP</option>
																			<option value="9">INTJ</option>
																			<option value="10">INTP</option>
																			<option value="11">INFP</option>
																			<option value="12">INFJ</option>
																			<option value="13">ISTJ</option>
																			<option value="14">ISTP</option>
																			<option value="15">ISFJ</option>
																			<option value="16">ISFP</option>
																		</select>
																	</td>
																</tr>
																<tr>
																	<td>Holland유형</td>
																	<td><input type="text" id="holland" name="holland" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>인적성 커트라인</td>
																	<td><input type="text" id="humanityCutline" name="humanityCutline" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>기술 커트라인</td>
																	<td><input type="text" id="technicalCutline" name="technicalCutline" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>모집인원</td>
																	<td><input type="text" id="fixedNumber" name="fixedNumber" class="form-control short" /></td>
																</tr>
																<tr>
																	<td>마감일</td>
																	<td><input type="date" id="deadline" name="deadline" class="form-control long" /></td>
																</tr>
															</tbody>
														</table>
													</div>
													
													<div class="btn1">
														<input type="submit" value="글쓰기" class="btn btn-success" />
														<input type="button" value="저장하기" class="btn btn-warning" />
														<input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='/desket/mypage/enterprise/announcelist.do';" />
													</div>
												
												</form>
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