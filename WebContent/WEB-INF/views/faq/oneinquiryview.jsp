<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<%-- <script src="<%= request.getContextPath() %>/app-assets/js/core/libraries/jquery.min.js"></script> --%>
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
	
	function answer(oiSeq) {
		
		//답변하기 버튼 삭제
		$("#btnAnswer").remove();
		
		
		var temp = "";
		temp += "<hr style='margin-top: 50px;'>";
		
		$("#answer").before(temp);
		
		
		
		temp = "";
		temp += "<input type='text' class='form form-control' placeholder='제목을 입력해주세요.'>";
		temp += "<input type='text' class='form form-control' placeholder='내용을 입력해주세요.'>";
		
		$("#answer").append(temp);
		
		
		//완료 버튼 생성
		temp = "";
		temp += "<div style='clear: right;'></div>";
		temp += "<div style='margin: 0px auto; margin-top: 50px; width: 16%;'>";
			temp += "<input type='submit' class='btn btn-primary' value='완료' onclick=location.href='/desket/faq/	.do';>";
		temp += "</div>";
		$("#answer").after(temp);
	
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
            <div class="content-header row" style="width: 70%; margin: 0 auto;">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">1:1 문의</h2>
                            
                            
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
                <section id="card-actions">

                    <!-- Info table about action starts -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width: 70%; margin: 0 auto;">
                                <div class="card-header">
                                    <h4 class="card-title">${dto.questionTitle}</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                            	<!-- <div id="question" style="float: left;"> -->
                                               	<div id="question" style="float: left;">작성자 : <div class="form form-control" style="display: inline-block;" readonly>${dto.id}</div></div><div style="clear: left;"></div>
                                               	<div id="question" style="float: left;">등록일 : <div class="form form-control" style="display: inline-block;" readonly>${dto.questionDate}</div></div><div style="clear: left;"></div>
                                               	<div id="question" style="float: left;">내용 : <div class="form form-control" style="display: inline-block;" readonly>${dto.questionContent}</div></div><div style="clear: left;"></div>
                                            	<!-- </div> -->
												<!-- <div style="clear: left;"></div> -->
												
                                            	<!--  만들고 생각해보니 이건 출력용 -->
                                            	<%-- 
                                            	<hr style="margin-top: 50px;">
                                            	
                                            	<div id="answer" style="float: right;">
                                            		<h4 style="margin-top: 30px;">${dto.answerTitle}</h4>
	                                                답변자 : <div class="form form-control" readonly>${dto.managerSeq}</div>
	                                                등록일 : <div class="form form-control" readonly>${dto.answerDate}</div>
	                                                내용 : <div class="form form-control" readonly>${dto.answerContent}</div>
                                            	</div>
												<div style="clear: right;"></div>  
												--%>
												
												
												<!-- <hr style="margin-top: 50px;"> -->
                                            	<form method="POST" action="/desket/faq/oneinquiryviewok.do">
	                                            	<div id="answer" style="float: right; margin-top: 30px;">
														<!-- 	
		                                           		<input type="text" class="form form-control"  placeholder="제목">
		                                                <input type="text" class="form form-control" placeholder="내용">
														 -->
	                                            	</div> 
													<!-- 
													<div style="clear: right;"></div>   
													<input type="button" class="btn btn-primary" value="완료" onclick="location.href='/desket/faq/oneinquiryviewok.do';">
													-->
													<div id="btnAnswer" style='margin: 0px auto; margin-top: 50px; width: 16%;'>
														<input type="button" class="btn btn-primary" value="답변하기" onclick="answer(${dto.seq});">
													</div>
                                            	</form>
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Info table about action Ends -->

                </section>
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
