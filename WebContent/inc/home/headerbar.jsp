<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- BEGIN: Header-->
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                
                
                
                    <div class="navbar-collapse" id="navbar-mobile">
                        
                        
                        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                       <!--  
                            <ul class="nav navbar-nav">
                                <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                            </ul>
                            <ul class="nav navbar-nav bookmark-icons">
                                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-todo.html" data-toggle="tooltip" data-placement="top" title="Todo"><i class="ficon feather icon-check-square"></i></a></li>
                                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-chat.html" data-toggle="tooltip" data-placement="top" title="Chat"><i class="ficon feather icon-message-square"></i></a></li>
                                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-email.html" data-toggle="tooltip" data-placement="top" title="Email"><i class="ficon feather icon-mail"></i></a></li>
                                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-calender.html" data-toggle="tooltip" data-placement="top" title="Calendar"><i class="ficon feather icon-calendar"></i></a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <li class="nav-item d-none d-lg-block"><a class="nav-link bookmark-star"><i class="ficon feather icon-star warning"></i></a>
                                    <div class="bookmark-input search-input">
                                        <div class="bookmark-input-icon"><i class="feather icon-search primary"></i></div>
                                        <input class="form-control input" type="text" placeholder="Explore Vuesax..." tabindex="0" data-search="template-list" />
                                        <ul class="search-list"></ul>
                                    </div>
                                </li>
                            </ul>
                         -->
                        </div>
                        
                        
                        
                        <ul class="nav navbar-nav float-right">
                        
                        
                        
                        
                        
                        
                        
                            
                            <!-- 로그아웃 버튼 -->
                            
                            <c:if test="${not empty logintype}">
                            
                            <div style="margin-top:10px;">
                            	<input type="button" value="로그아웃" class="btn btn-light" onclick="location.href='/desket/home/logoutok.do';">                            	
                            </div>
                          	</c:if>   
                          	
                          	
                          	
                          	
                          	
                          	
                          	
                          	
                            <!-- 로그인 버튼 -->
                            <c:if test="${empty logintype}">
                            <div style="margin-top:10px;">
                            	<input type="button" value="로그인" class="btn btn-light" onclick="location.href='/desket/home/login.do';">                            	
                            	<input type="button" value="회원가입" class="btn btn-primary">                            	
                            </div>
                          	</c:if>   
                          	
                          	
                          	
                          	
                          	
                          	
                          	
                          	
                            <!-- ↓↓↓ 로그인 후 회원정보에 따라 정보 가져와서 출력하기 ↓↓↓ -->
                          	<c:if test="${not empty logintype}">                     
                           <!--  <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-bell"></i><span class="badge badge-pill badge-primary badge-up"> 5 </span></a>
                                <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                    <li class="dropdown-menu-header">
                                        <div class="dropdown-header m-0 p-2">
                                        
                                            <h3 class="white">5 New</h3><span class="notification-title">App Notifications</span>
                                            
                                        </div>
                                    </li>
                                    <li class="scrollable-container media-list"><a class="d-flex justify-content-between" href="javascript:void(0)">
                                            <div class="media d-flex align-items-start">
                                                <div class="media-left"><i class="feather icon-plus-square font-medium-5 primary"></i></div>
                                                <div class="media-body">
                                                    <h6 class="primary media-heading">You have new order!</h6><small class="notification-text"> Are your going to meet me tonight?</small>
                                                </div><small>
                                                    <time class="media-meta" datetime="2015-06-11T18:29:20+08:00">9 hours ago</time></small>
                                            </div>
                                        </a>
                                    </li>                                    
                                </ul>
                            </li> -->
                            <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                    <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">${id }</span></div><span><img class="round" src="/desket/images/${pic}" alt="avatar" height="40" width="40" /></span></a>
                                
                                <div class="dropdown-menu dropdown-menu-right">
                                	
                                	<c:if test="${logintype=='enterprise' }">
                                	<a class="dropdown-item" href="page-user-profile.html"><i class="feather icon-user"></i> 정보수정</a>
                                	<a class="dropdown-item" href="app-todo.html"><i class="feather icon-check-square"></i>공고알림</a>
                                	<a class="dropdown-item" href="app-email.html"><i class="feather icon-mail"></i> 쪽지함</a>
                                	<a class="dropdown-item" href="app-chat.html"><i class="feather icon-message-square"></i> 1:1문의</a>
                                	</c:if>
                                	
                                	<c:if test="${logintype=='member' }">
                                	<a class="dropdown-item" href="/desket/mypage/member/infomodify/infomodifylist.do?menuid=infomodifylist"><i class="feather icon-user"></i>정보수정</a>
                                	<a class="dropdown-item" href="app-todo.html"><i class="feather icon-check-square"></i> 공고알림</a>
                                	<a class="dropdown-item" href="app-email.html"><i class="feather icon-mail"></i>쪽지함</a>
                                	<a class="dropdown-item" href="app-chat.html"><i class="feather icon-message-square"></i> 1:1문의</a>
                                	</c:if>
                                	
                                	
                                	
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="/desket/home/logoutok.do"><i class="feather icon-power"></i>로그아웃</a>
                                </div>
                            </li>
                          	</c:if> 
                        </ul>                                                
                    </div>
                    
                    
                    
                    
                    
                    
                    
                </div>
            </div>
        </nav>
