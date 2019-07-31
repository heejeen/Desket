<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>자주묻는 질문</title>
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
	//$(window).on("load", function () {
		
		$.ajax({
			type: "GET",
			url: "/desket/faq/faqlist.do",
			dataType: "json",
			success: function(result) {
				
				var temp;
				var FAQNum = 1;
				var answerNum = 1;
				
				$(result).each(function(index, item) {
					
					/*
					if(item){   반환값 없으면 !!!!
						temp = "<tr><td colspan="3">[현재 내용물이 존재하지 않습니다.]</td></tr>"
						("#FAQList tbody").append(temp);
						temp = "";
					} 
					*/
					
					
					/*  + + + + + + + + + +        content 길면 잘라서 ... 으로 보여주기       + + + + + + + + + + +  */
					
					/* 
					<div class="collapse-margin search-content">
                        <div class="card-header" id="headingThirteen">
                            <span class="lead collapse-title collapsed" role="button" data-toggle="collapse" data-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
                                Is this item still 'royalty free'?
                            </span>
                        </div>
                        <div id="collapseThirteen" class="collapse" aria-labelledby="headingThirteen" data-parent="#accordionExample">
                            <div class="card-body">
                                Yes. Royalty free means you pay for the item once for each end product, and you don't need to pay any additional or ongoing fees for each person who sees or uses it. This is separate to whether you need a clearance from the owner of rights in the real world product or trademark within an item.
                            </div>
                        </div>
                    </div>
                     */
                    
                    
					temp += "<div class='collapse-margin search-content mt-0'>";
						temp += "<div class='card-header' id='FAQ" + FAQNum + "'>";
							temp += "<span class='lead collapse-title' role='button' data-toggle='collapse' data-target='#answer" + answerNum + "' aria-expanded='false' aria-controls='answer" + answerNum + "' style='font-size: 1.3em;'>";
								temp += item.title;
							temp += "</span>";
						temp += "</div>";
						temp += "<div id='answer" + answerNum + "' class='collapse' aria-labelledby='FAQ" + FAQNum + "' data-parent='#FAQList'>";
							temp += "<div class='card-body'>";
								temp += item.content;
							temp += "</div>";
						temp += "</div>";
					temp += "</div>";
					
					FAQNum++;
					answerNum++;
				});
				
				$("#FAQList").append(temp);
				
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
			
		
	};// onload
	//});

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
                            <h2 class="content-header-title float-left mb-0">자주묻는 질문</h2>
                            
                            
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


				<section class="faq">
                    <div class="row">
                        <div class="col-xl-9 col-md-7 col-12">
                            <div class="card bg-transparent border-0 shadow-none collapse-icon accordion-icon-rotate">
                                <div class="card-body p-0">
                                    <div class="accordion search-content-info" id="FAQList">

										<c:forEach items="${list}" var="dto" varStatus="status">
										<div class="collapse-margin search-content mt-0">
											<div class="card-header" id="FAQ${status.count}">
												<span class="lead collapse-title" role="button" data-toggle="collapse" data-target="#answer${status.count}" aria-expanded="false" aria-controls="answer${status.count}" style="font-size: 1.3em;"">
													${dto.title}
												</span>
											</div>
											<div id="answer${status.count}" class="collapse" aria-labelledby="FAQ${status.count}" data-parent="#FAQList">
												<div class='card-body'>
													${dto.content}
												</div>
											</div>
										</div>
										</c:forEach>		
														
										
                                        <!-- 
                                        <div class="collapse-margin search-content mt-0">
                                            
                                            <div class="card-header" id="headingOne">
                                                <span class="lead collapse-title" role="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                    What does royalty free mean?
                                                </span>
                                            </div>
                                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    Royalty free means you just need to pay for rights to use the item once per end product. You don't need to pay additional or ongoing fees for each person who sees or uses it. Please note that there may be some limits placed on uses under the different license types available on the marketplaces, such as our Photo and Music Licenses.
                                                </div>
                                            </div>

                                        </div> 
                                        -->

                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>




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