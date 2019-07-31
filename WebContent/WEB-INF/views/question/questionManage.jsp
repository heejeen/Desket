<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.table.table-striped thead tr th:nth-child(1) { width: 50px; }	
	.table.table-striped thead tr th:nth-child(2) { width: 75px; }
	.table.table-striped thead tr th:nth-child(3) { width: 500px; text-align: left; }
	.table.table-striped thead tr th:nth-child(4) { width: 75px; }
	.table.table-striped thead tr th:nth-child(5) { width: 150px; }
	
	#pagebar { 
	
		margin: 400px; 
		width: 400px; 
		margin-top: 30px; 
		color: white;
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
                        <div class="card" style="width: 1000px; height: 800px; margin: 0px auto;">
                            <div class="card-header">
                                <h4 class="card-title"></h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                        <!-- Info table about action starts -->
												<div style="text-align:center; width: 900px; margin: 0px auto;">
													<h4 style="font-weight: bold;">질문 관리하기</h4>
														<table class="table table-striped">
															<thead style="background-color: #D8D4FB;">
																<tr>
																	<th></th>
																	<th>유형</th>
																	<th>질문</th>
																	<th>신뢰도</th>
																	<th>삭제</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${mlist}" var="mdto" varStatus="mStatus" >
																<tr>
																	<td>${mdto.seq}</td>
																	<td>${mdto.type}</td>
																	<td>${mdto.question}</td>
																	<td>${mdto.confidence}</td>
																	<td>[삭제]</td>
																</tr>
																</c:forEach>
															</tbody>
														</table>
														<div style="text-align: left;">
															<input type="button" value="추가하기" id="qAdd" name="qAdd" class="btn btn-primary" onclick="location.href='#'" />
														</div>
													</div>
													<div id="pagebar">${pagebar}</div>
													
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