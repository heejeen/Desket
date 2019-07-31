<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="/desket/home/index.do">
                    <div class="brand-logo"></div>          
                    <h2 class="brand-text mb-0">Desket</h2>
                </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
        </ul>  
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">



			<c:if test="${empty logintype}">  <!--로그인 화면 이동  --><!-- #인 애들은 나중에 수정요망 -->
				<!-- 비 회원 -->
               <li class=" navigation-header"><span>메뉴</span>
               </li>

                <li id="notice" class=" nav-item side"><a href="/desket/notice/list.do?menuid=notice"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">공고</span></a>
                </li>
            
             <li id="b" class=" nav-item side"><a href="/desket/enterpriseinfo/list.do?menuid=b"><i class="fa fa-cube"></i><span class="menu-title" data-i18n="Card">기업정보 게시판</span></a>
            </li>
        
            <li class=" nav-item"><a href="#"><i class="feather icon-layout"></i><span class="menu-title" data-i18n="Profile">마이페이지</span></a>
                <ul class="menu-content">
                    <li id="resumemanagement" class="side"><a href="/desket/home/login.do"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="resumeManagement">이력서 관리</span></a>
                    </li>
                    <li id="datalistview" class="side"><a href="/desket/home/login.do"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="supportList">지원 내역</span></a>
                    </li>
                    <li id="e" class="side"><a href="/desket/home/login.do"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="interestedAdvertisement">관심 공고</span></a>
                    </li>
                    <li id="f" class="side"><a href="/desket/home/login.do"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="infoModify">정보 수정</span></a>
                    </li>
                </ul>
            </li>
            
            <li class=" nav-item"><a href="#"><i class="fa fa-question"></i><span class="menu-title" data-i18n="Icons"> &nbsp;&nbsp;FAQ</span></a>
                <ul class="menu-content">
                    <li id="faq" class="side"><a href="/desket/faq/faq.do?menuid=faq"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Feather">자주묻는 질문</span></a>
                    </li>
                    <li id="h" class="side"><a href="/desket/home/login.do"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Font Awesome">1:1 문의하기</span></a>
                    </li>
                </ul>
            </li>
			</c:if>
			
			
			
			<c:if test="${logintype=='member'}">
				<!-- 일반 회원 -->
               <li class=" navigation-header"><span>메뉴</span>
               </li>

                <li id="notice" class=" nav-item side"><a href="/desket/notice/list.do?menuid=notice"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">공고 게시판</span></a>
                </li>
            
            <li id="b" class=" nav-item side"><a href="/desket/enterpriseinfo/list.do?menuid=b"><i class="fa fa-cube"></i><span class="menu-title" data-i18n="Card">기업정보 게시판</span></a>
            </li>
        
             <li class=" nav-item"><a href="#"><i class="feather icon-layout"></i><span class="menu-title" data-i18n="Profile">마이페이지</span></a>
                <ul class="menu-content">
                    <li id="resumelist" class="side a"><a href="/desket/mypage/member/resume/resumelist.do?menuid=resumelist"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="resumelist">이력서 관리</span></a>
                    </li>
                    <li id="supportlist" class="side"><a href="/desket/mypage/member/supportlist/supportlist.do?menuid=supportlist"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="supportlist">지원 내역</span></a>
                    </li>
                    <li id="noticeinterestlist" class="side"><a href="/desket/mypage/member/noticeinterest/noticeinterestlist.do?menuid=noticeinterestlist"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="noticeinterestlist">관심 공고</span></a>
                    </li>
                    <li id="infomodifylist" class="side"><a href="/desket/mypage/member/infomodify/infomodifylist.do?menuid=infomodifylist"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="infomodifylist">정보 수정</span></a>
                    </li>
                </ul>
            </li>
            
            <li class=" nav-item"><a href="#"><i class="fa fa-question"></i><span class="menu-title" data-i18n="Icons"> &nbsp;&nbsp;FAQ</span></a>
                <ul class="menu-content">
                    <li id="faq" class="side"><a href="/desket/faq/faq.do?menuid=faq"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Feather">자주묻는 질문</span></a>
                    </li>
                    <li id="oneinquiry" class="side"><a href="/desket/faq/oneinquiry.do?menuid=oneinquiry"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Font Awesome">1:1 문의하기</span></a>
                    </li>
                </ul>
            </li>
			</c:if>
			


			<c:if test="${logintype=='enterprise'}">
				<!--  기업 회원 -->
               <li class=" navigation-header"><span>메뉴</span>
               </li>

                <li id="notice" class=" nav-item side"><a href="/desket/notice/list.do?menuid=notice"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">공고 게시판</span></a>
                </li>
            
            <li id="b" class=" nav-item side"><a href="/desket/enterpriseinfo/list.do?menuid=b"><i class="fa fa-cube"></i><span class="menu-title" data-i18n="Card">기업정보 게시판</span></a>
            </li>
        
            <li class=" nav-item"><a href="page-faq.html"><i class="feather icon-layout"></i><span class="menu-title" data-i18n="Profile">마이페이지</span></a>
                <ul class="menu-content">
                    <li id="add" class="side"><a href="/desket/mypage/enterprise/add.do?menuid=add"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="resumeManagement">공고작성 </span></a>
                    </li>
                    <li id="announcelist" class="side"><a href="/desket/mypage/enterprise/announcelist.do?menuid=announcelist"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="supportList">공고목록</span></a>
                    </li>
                    <li id="viewinfo" class="side"><a href="/desket/mypage/enterprise/viewinfo.do?menuid=viewinfo"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="infoModify">정보 수정</span></a>
                    </li>
                </ul>
            </li>
            
            <li class=" nav-item"><a href="#"><i class="fa fa-question"></i><span class="menu-title" data-i18n="Icons"> &nbsp;&nbsp;FAQ</span></a>
                <ul class="menu-content">
                    <li id="faq" class="side"><a href="/desket/faq/faq.do?menuid=faq"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Feather">자주묻는 질문</span></a>
                    </li>
                    <li id="oneinquiry" class="side"><a href="/desket/faq/oneinquiry.do?menuid=oneinquiry"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Font Awesome">1:1 문의하기</span></a>
                    </li>
                </ul>
            </li>
            </c:if>
            
            
            
            
            
            
			<c:if test="${logintype=='admin'}">
				<!-- 관리자 -->
               <li class=" navigation-header"><span>메뉴</span>
               </li>

                <li id="notice" class=" nav-item side"><a href="/desket/notice/list.do?menuid=notice"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">공고게시판</span></a>
                </li>
            
            
        
            <li class=" nav-item"><a href="#"><i class="feather icon-layout"></i><span class="menu-title" data-i18n="Profile">회원관리</span></a>
                <ul class="menu-content">
                    <li id="fasdfsda" class="side"><a href="#"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="resumeManagement">기업회원</span></a>
                    </li>
                    <li id="dfadfsaf" class="side"><a href="#"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="supportList">일반회원</span></a>
                    </li>                    
                </ul>
            </li>
            <li id="b" class=" nav-item side"><a href="/desket/enterpriseinfo/list.do?menuid=b"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">기업정보 게시판</span></a>
                </li>
            
            <li id="notice" class=" nav-item side"><a href="#"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">신고게시판</span></a>
                </li>
            <li id="questionmanage" class=" nav-item side"><a href="/desket/question/questionmanage.do?menuid=questionmanage"><i class="fa fa-wpforms"></i><span class="menu-title" data-i18n="Data List">문제 관리</span></a>
                </li>
            <li class=" nav-item"><a href="#"><i class="fa fa-question"></i><span class="menu-title" data-i18n="Icons"> &nbsp;&nbsp;FAQ</span></a>
                <ul class="menu-content">
                    <li id="faq" class="side"><a href="/desket/faq/faq.do?menuid=faq"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Feather">자주묻는 질문</span></a>
                    </li>
                    <li id="oneinquiry" class="side"><a href="/desket/faq/oneinquiry.do?menuid=oneinquiry"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Font Awesome">1:1 문의하기</span></a>
                    </li>
                </ul>
            </li>
            </c:if>
            
            
            
            
            
            
            
            
        </ul>
    </div>
</div>

<script>

	window.onload = function() {
		
		
		var menuid = document.getElementById('${menuid}');
		//alert(this.getAttribute('class'));
		if(menuid != null){
			menuid.setAttribute('class', menuid.getAttribute('class') + ' active');
		}
	};


</script>
<!-- END: Main Menu-->