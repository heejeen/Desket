<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>1:1문의</title>
<style>
	.tbl1 {
		width: 1600px;
	}
	.tbl1 th:nth-child(1) {
		width: 750px;
		margin-right: 100px;
		display:inline-block;
	}
	.tbl1 th:nth-child(2) {
		width: 750px;
		display:inline-block;
	}

</style>
<script>

	window.onload = function() {
		/* 
		$.ajax({
			type: "GET",
			url: "/desket/faq/oneinquirylist.do",
			dataType: "json",
			success: function(result) {
				var temp = "";
				var oiNum = 1;
				$(result).each(function(index, item) {
					//console.log(item.seq);
					temp += "<tr id='oi" + oiNum + "' onclick=location.href='/desket/faq/oneinquiryview.do?seq=" + item.seq + "';>";
						temp += "<td></td>";
						temp += "<td class='product-name'> " + item.seq + "</td>";
						temp += "<td class='product-name'> " + item.questionTitle + "</td>";
						temp += "<td class='product-name'> " + item.id + "</td>";
						temp += "<td class='product-name'> " + item.questionDate + "</td>";
					temp += "</tr>";
					
					oiNum++;
				});
				
				$("#oneInquiryList").append(temp);
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
			
		});
		 */
		
	});
		
		
	
	function oiView() {
		
		
		
	}


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
                            <h2 class="content-header-title float-left mb-0">1:1문의 게시판</h2>
                            
                            
                            
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





				<!--  -->
				
				
				<!-- Data list view starts -->
                <section id="data-list-view" class="data-list-view-header">
                    <div class="action-btns d-none">
                        <div class="btn-dropdown mr-1 mb-1">
                            <div class="btn-group dropdown actions-dropodown">
                                <button type="button" class="btn btn-white px-1 py-1 dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    메뉴
                                </button>
                                <div class="dropdown-menu">
                                
                                	<c:if test="${logintype eq 'member' || logintype eq 'enterprise'}">
                                    	<a class="dropdown-item" href="#">글 작성</a>
                                    	<a class="dropdown-item" href="#">글 삭제</a>
                                	</c:if>
                                	<c:if test="${logintype eq 'admin'}">
                                    	<a class="dropdown-item" href="#">글 삭제</a>
                                	</c:if>
                                    
                                    
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
                                    <th>글 번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody id="oneInquiryList">
                                <c:if test="${logintype eq 'admin' }">
                                <c:forEach items="${aList}" var="adto" varStatus="aStatus">
                                <tr id="oi${aStatus.count}" onclick="location.href='/desket/faq/oneinquiryview.do?seq=${adto.seq}';">
									<td></td>
									<td class="product-name">${adto.seq}</td>
									<td class="product-name">${adto.questionTitle}</td>
									<td class="product-name">${adto.id}</td>
									<td class="product-name">${adto.questionDate}</td>
								</tr>
                                </c:forEach>
                                </c:if>
                                
                                <c:if test="${logintype eq 'member' }">
                                <c:forEach items="${mList}" var="mdto" varStatus="mStatus">
                               <tr id="oi${mStatus.count}" onclick="location.href='/desket/faq/oneinquiryview.do?seq=${mdto.seq}&menuid=oneinquiry';">
									<td></td>
									<td class="product-name">${mdto.seq}</td>
									<td class="product-name">${mdto.questionTitle}</td>
									<td class="product-name">${mdto.id}</td>
									<td class="product-name">${mdto.questionDate}</td>
								</tr>
                                </c:forEach>
                                </c:if>
                                <!-- 
                                <tr>
                                    <td></td>
                                    <td class="product-name">Apple Watch series 4 GPS</td>
                                    <td class="product-category">Computers</td>
                                    <td>
                                        <div class="progress progress-bar-success">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="40" aria-valuemax="100" style="width:97%"></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="chip chip-warning">
                                            <div class="chip-body">
                                                <div class="chip-text">on hold</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="product-price">$69.99</td>
                                </tr> 
                                -->
                            </tbody>
                        </table>
                    </div>
                    <!-- DataTable ends -->

                    
                </section>
                <!-- Data list view end -->
				
				
				
				<!--  -->
                


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