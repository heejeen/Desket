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
   
   <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/plugins/forms/wizard.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/assets/css/style.css">
    <!-- END: Custom CSS-->
   
   
</head>
<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

   	<jsp:include page="/inc/home/sidebar.jsp" ></jsp:include>
    <!-- BEGIN: Content-->
    <div class="app-content content">
    
	<jsp:include page="/inc/home/headerbar.jsp" ></jsp:include>
    <!-- END: Header-->   
       
      
            
            
          <div class="content-wrapper">
            <div class="content-header row">
           		 <!-- Form wizard with number tabs section start -->
                <section id="steps-validation">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">공고 작성</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                       <form action="/desket/mypage/enterprise/notice/addok.do" class="steps-validation wizard-circle" method="post" enctype="multipart/form-data">
                                         <!-- Step 1 -->
                                            <h6>Step 1</h6>
                                            <fieldset>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="title">공고 제목 </label>
                                                            <input type="text" class="form-control required" id="title" name="title" value="test" >
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="job">직무</label> 
                                                            <select class="custom-select form-control required" id="job" name="job" >
                                                                <option value="웹퍼블리셔" selected>웹퍼블리셔</option>
                                                                <option value="웹개발">웹개발</option>
                                                                <option value="웹기획">웹기획</option>
                                                                <option value="프론트엔드">프론트엔드</option>
                                                                <option value="백엔드">백엔드</option>
                                                                <option value="응용프로그램개발">응용프로그램개발</option>
                                                                <option value="시스템개발">시스템개발</option>
                                                                <option value="데이터베이스">데이터베이스</option>
                                                                <option value="인공지능">인공지능</option>                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="time">근무일시</label>
                                                            <select class="custom-select form-control required" id="time" name="time" >
                                                                <option value="주4일" selected>주4일</option>
                                                                <option value="주5일">주5일</option>
                                                                <option value="주6일">주6일</option>                                                                
                                                            </select>
                                                        </div>
                                                    </div>                                                                                                                                      
                                                                                                    
                                                    
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="region">지역</label>
                                                            <input type="text" class="form-control required" id="region" name="region" value="test">
                                                        </div>
                                                    </div>
                                                </div>
                                                                                       
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="employtype">근무 형태</label>
                                                            <select class="custom-select form-control required" id="employtype" name="employtype" >
                                                                <option value="정규직" selected>정규직</option>
                                                                <option value="비정규직">계약직</option>
                                                                <option value="파견직">파견직</option>
                                                                <option value="인턴">인턴</option>
                                                            </select>
                                                        </div>
                                                    </div>                                          
                                                    
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label for="deadline">마감일</label>
                                                            <input type="date" id="deadline required" name="deadline" class="form-control" value="2019-07-18"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label for="fixednumber">인원(명)</label>
                                                            <input type="number" class="form-control required" id="fixednumber" name="fixednumber" value="3" >
                                                        </div>
                                                     </div> 
                                                </div>
                                            </fieldset>

                                            <!-- Step 2 -->
                                            <h6>Step 2</h6>
                                            <fieldset>
                                               
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="education">학력</label>
                                                            <input type="text" class="form-control required" id="education" name="education" value="test">
                                                        </div>
                                                     </div>   
                                                    <div class="col-sm-6">                                                     
                                                        <div class="form-group">
                                                            <label for="career">경력</label>
                                                            <input type="text" class="form-control required" id="career" name="career" value="test">
                                                        </div>
                                                    </div>                                                   
                                                </div> 
                                                 <div class="row">
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label for="minimumannualsalary">최소연봉(만원)</label>
                                                            <input type="number" class="form-control required" id="minimumannualsalary" name="minimumannualsalary" value="3000">
                                                        </div>
                                                     </div>   
                                                    <div class="col-sm-3">                                                     
                                                        <div class="form-group">
                                                            <label for="maximumannualsalary">최대연봉(만원)</label>
                                                            <input type="number" class="form-control required" id="maximumannualsalary" name="maximumannualsalary" value="3400">
                                                        </div>
                                                    </div>                                                   
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label for="minimumage">최소나이</label>
                                                            <input type="number" min="10" max="80" class="form-control required" id="minimumage" name="minimumage" value="25">
                                                        </div>
                                                     </div>   
                                                    <div class="col-sm-3">                                                     
                                                        <div class="form-group">
                                                            <label for="maximumage">최대나이</label>
                                                            <input type="number" min="10" max="80" class="form-control required" id="maximumage" name="maximumage" value="35">
                                                        </div>
                                                    </div>                                                   
                                                </div> 
                                                 <div class="row">
                                                    <div class="col-sm-6 ">
                                                        <div class="form-group  custom-checkbox">
                                                            <label for="langugeseq">사용언어</label> 
                                                            <select class="custom-select form-control required" id="langugeseq" name="langugeseq" >
                                                                <option value="1" selected>Java</option>
                                                                <option value="2">C</option>
                                                                <option value="3">C++</option>
                                                                <option value="4">Python</option>
                                                                <option value="5">VB.NET</option>
                                                                <option value="6">C#</option>
                                                                <option value="7">SQL</option>
                                                                <option value="8">JavaScript</option>
                                                                <option value="9">PHP</option>
                                                            </select>                                          
                                                        </div>
                                                     </div>   
                                                    <div class="col-sm-6">                                                     
                                                        <div class="form-group">
                                                            <label for="certificateseq">우대자격증</label>
                                                            <select class="custom-select form-control required" id="certificateseq" name="certificateseq" >
                                                                <option value="1" selected>정보처리기사</option>
                                                                <option value="2">정보기기운용기능사</option>
                                                                <option value="3">정보처리기능사</option>
                                                                <option value="4">IT+정보활용능력인증</option>
                                                                <option value="5">MOS</option>
                                                                <option value="6">ICDL</option>
                                                                <option value="7">CCNA</option>
                                                                <option value="8">OCJP</option>
                                                                <option value="9">SCEA</option>
                                                                <option value="10">CCNP</option>
                                                            </select>   
                                                        </div>
                                                    </div>                                                   
                                                </div> 
                                            </fieldset>
                                            

                                            <!-- Step 3 -->
                                            <h6>Step 3</h6>
                                            <fieldset>
                                            
                                            	MBTI, Holland 설명
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="mbtitypeseq">MBTI</label>                                                           
                                                            <select class="custom-select form-control required" id="mbtitypeseq" name="mbtitypeseq" >
                                                                <option value="1" seleted>ESTJ</option>
                                                                <option value="2">ESTP</option>
                                                                <option value="3">ESFJ</option>
                                                                <option value="4">ESFP</option>
                                                                <option value="4">ENTJ</option>
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
                                                        </div>
                                                     </div>   
                                                    <div class="col-sm-6">                                                     
                                                        <div class="form-group">
                                                            <label for="jobtitle">Holland</label>
                                                            <select class="custom-select form-control required" id="holland" name="holland" >
                                                                <option value="R" selected>R</option>
                                                                <option value="C">C</option>
                                                                <option value="S">S</option>
                                                                <option value="I">I</option>
                                                                <option value="E">E</option>
                                                                <option value="A">A</option>                                                            	
                                                            </select>                                                          
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
                                                            <input type="submit" class="form-control" id="save" name="save" value="Submit">
                                                        </div>
                                                    </div>                                                                                                       
                                                </div> 
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Form wizard with number tabs section end -->
           
            </div>                 
        </div>   
    <!-- END: Content-->
    </div>

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

<!-- BEGIN: Vendor JS-->
    <script src="/desket/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/desket/app-assets/vendors/js/extensions/jquery.steps.min.js"></script>
    <script src="/desket/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/desket/app-assets/js/core/app-menu.js"></script>
    <script src="/desket/app-assets/js/core/app.js"></script>
    <script src="/desket/app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/desket/app-assets/js/scripts/forms/wizard-steps.js"></script>
    <!-- END: Page JS-->



</body>
</html>