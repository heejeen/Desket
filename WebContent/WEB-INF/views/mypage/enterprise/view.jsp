<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 사용하지 않는 뷰입니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.table.table-bordered.tblStyle { width: 1100px; margin: 0px auto; }
	
	.table.table-bordered.tblStyle tr th { text-align: center; }
		
	.table.table-bordered.tblStyle tr th:nth-child(1) { width: 200px; }
	.table.table-bordered.tblStyle tr th:nth-child(2) { width: 600px; }
	.table.table-bordered.tblStyle tr th:nth-child(3) { width: 300px; }

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
                            <h2 class="content-header-title float-left mb-0">공고상세내용</h2>
                            
                            
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
           	
           		<table id="tbl1" class="table table-bordered tblStyle" style="background-color: white;">
           			<tr>
           				<th>${dto.id}</th>
           				<th>${dto.title}</th>
           				<th>${dto.regdate.substring(0, 10)} ~ ${dto.deadline.substring(0, 10)}</th>
           			</tr>
           			<tr>
           				<td colspan="3">
           					<div><i class="fa fa-file-text-o"></i> 적극적으로 인재를 채용하기위해 서비스 이용 중 - <b>연락 올 가능성 높음</b></div>
           					<div><i class="fa fa-building-o"></i><b> 강소기업(100명이상)</b></div>
           					<div><i class="feather icon-aperture"></i> 4대보험 가입정보 - <b>국민연금, 건강보험, 고용보험, 산재보험</b></div>
           				</td>
           			</tr>
           			<tr>
           				<td colspan="3">
           					<div><img src="/desket/app-assets/images/스탠드포인트.jpg" style="width: 1100px;" /></div>
           					<ul>
           						<li>모집기간</li>
           						<li>공통지원자격</li>
           						<li>모집분야 및 자격요건</li>
           						<li>지원서 접수</li>
           						<li>전형절차</li>
           						<li>우대 사항</li>
           						<li>복리후생</li>
           						<li>기타사항</li>
           						<li>문의처</li>
           					</ul>
           				</td>
           			</tr>
           		</table>
           		
           		
           		
                <div>${dto.seq}</div>
                <div>${dto.id}</div>
                <div>${dto.title}</div>
                <div>${dto.regdate}</div>
                <div>${dto.mbti}</div>
                <div>${dto.holland}</div>
                <div>${dto.technicalCutline}</div>
                <div>${dto.humanityCutline}</div>
                <div>${dto.requiredLanguage}</div>
                <div>${dto.minimumAnnualSalary}</div>
                <div>${dto.maximumAnnualSalary}</div>
                <div>${dto.job}</div>
                <div>${dto.minimumAge}</div>
                <div>${dto.maximumAge}</div>
                <div>${dto.region}</div>
                <div>${dto.career}</div>
                <div>${dto.storageStatus}</div>
                <div>${dto.deadline}</div>
                <div>${dto.fixedNumber}</div>
                
                
                
                
                <div><input type="button" value="피드백받기" onclick="location.href='/desket/mypage/enterprise/feedback.do?seq=${dto.seq}'"></div>

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