<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>기업정보</title>
<style>

	.enterprise-logo {
		width: 300px; 
		height: 100px; 
		background-repeat: no-repeat;
		background-position: center center;
		background-size: auto;
	}

</style>

<!-- CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
   
</head>

<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

   	<jsp:include page="/inc/home/sidebar.jsp" ></jsp:include>
    
    <!-- BEGIN: Content-->
    <div class="app-content content">
    
	    <!-- Headerbar -->
		<jsp:include page="/inc/home/headerbar.jsp" ></jsp:include>
          	
    	<div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">기업 정보</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/desket/home/index.do">메인</a>
                                    </li>
                                    <li class="breadcrumb-item active">기업 정보
                                    </li>
                                </ol>
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
                <!-- Data list view starts -->
                <section id="data-thumb-view" class="data-thumb-view-header">
                                        
                    <!-- 데이터 테이블 시작 -->
                    <div class="table-responsive">
                        <table class="table data-thumb-view">
                            <thead>
                                <tr>
                                	<th></th>
                                    <th style="width: 320px;">로고</th>
                                    <th>기업명</th>
                                    <th>업종</th>
                                    <th>규모</th>
                                    <th>설립년도</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list}" var="dto">
                                <tr onclick="location.href='/desket/enterpriseinfo/view.do?seq=${dto.seq}&menuid=b';">
                                	<td></td>
                                    <td><div class="enterprise-logo" style="background-image: url('/desket/assets/images/logo/${dto.seq}${dto.name}.png')"></div>
                                    </td>
                                    <td class="product-name">${dto.name}</td>
                                    <td class="product-category">${dto.field}</td>
                                    <td class="product-name">${dto.scale}</td>
                                    <td class="product-name">${dto.establishyear}년 (${dto.years}년차)</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- 데이터 테이블 끝 -->
                    
                </section>
                <!-- Data list view end -->
            </div>
            
        </div>
                   
    </div>       
    <!-- END: Content -->      

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

<!-- BEGIN: Footer-->
<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
<!-- END: Footer-->

</body>
</html>