<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		display:inline-block;
	}
	.tbl1 th:nth-child(2) {
		width: 750px;
		display:inline-block;
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



					



                <!-- card actions section start -->
                <section id="card-actions">
						
						
						
                    <!-- Info table about action starts -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                   
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="feather icon-chevron-down"></i></a></li>
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show" style="padding:20px;">
                                  <form action="/desket/mypage/enterprise/notice/addok.do" method="post">
                                         <!-- Step 1 -->
                                            <h6>Step 1</h6>
                                          
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="title">공고 제목 </label>
                                                            <input type="text" class="form-control required" id="xtitle" name="xtitle" value="test" >
                                                        </div>
                                                    </div>
                                                </div>
                                               
                                                                                          <div class="row">
                                                    <div class="col-sm-1">
                                                        <div class="form-group">
                                                            <label for="mbtitypeseq">저장하기</label> 
                                                            <input type="button" class="form-control" id="save" name="save" onclick="location.href='/desket/mypage/enterprise/notice/save.do'">
                                                        </div>
                                                    </div>                                                                                                       
                                                    <div class="col-sm-1">
                                                        <div class="form-group">
                                                            <label for="mbtitypeseq">Submit</label> 
                                                            <input type="submit" class="form-control" id="save" name="save" value="">
                                                        </div>
                                                    </div>                                                                                                       
                                                </div> 
                                           
                                        </form>
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