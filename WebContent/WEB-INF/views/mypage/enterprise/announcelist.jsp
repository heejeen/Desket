<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.table.table-bordered.tblStyle { width: 1600px; }
	
	.table.table-bordered.tblStyle tr th { text-align: center; }
	.table.table-bordered.tblStyle tr td { text-align: center; }
		
	.table.table-bordered.tblStyle tr th:nth-child(1) { width: 70px; }
	.table.table-bordered.tblStyle tr th:nth-child(2) { width: 430px; }
	.table.table-bordered.tblStyle tr th:nth-child(3) { width: 900px; }
	.table.table-bordered.tblStyle tr th:nth-child(4) { width: 200px; }
	
	#tbl1 tbody tr:hover {
		background-color: #eee;
	}
	
	#tbl1 tbody tr:nth-child(1):hover {
		background-color: white;
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
                            <h2 class="content-header-title float-left mb-0">공고 목록</h2>
                            
                            
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






                <!-- card actions section start -->
                <table id="tbl1" class="table table-bordered tblStyle" style="background-color: white;">
                	<tbody>
	                	<tr>
	                		<th>번호</th>
	                		<th>기업명</th>
	                		<th>제목</th>
	                		<th>날짜</th>
	                	</tr>
	                	<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="4">등록된 게시물이 없습니다.</td>
						</tr>
						</c:if>
	                	<c:forEach items="${jobList}" var="dto">
	                	<tr>
	                		<td>${dto.seq}</td>
	                		<td>${dto.id}</td>
	                		<c:if test="${dto.storageStatus==0}">
	                		<td><a href="/desket/notice/view.do?seq=${dto.seq}&id=${dto.id}">${dto.title}</a></td>
	                		</c:if>
	                		<c:if test="${dto.storageStatus==1}">
	                		<td><a href="/desket/notice/view.do?seq=${dto.seq}&id=${dto.id}&status=closed">${dto.title}</a></td>       
	                		</c:if>
	                		<td>${dto.regdate}</td>
	                	</tr>
	                	</c:forEach>
                	</tbody>
                </table>
                <c:if test="${not empty id}">
					<input type="button" value="공고작성" class="btn btn-primary" onclick="location.href='/desket/mypage/enterprise/add.do';" />
				</c:if>
                <!-- // card-actions section end -->


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