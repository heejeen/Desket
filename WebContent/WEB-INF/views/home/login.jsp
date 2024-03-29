<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Vuesax admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuesax admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>로그인</title>
    <link rel="apple-touch-icon" href="/desket/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/desket/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

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
    <link rel="stylesheet" type="text/css" href="/desket/app-assets/css/pages/authentication.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/desket/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  menu-collapsed blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-11 d-flex justify-content-center">
                        <div class="card bg-authentication rounded-0 mb-0">
                            <div class="row m-0">
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
                                    <img src="/desket/app-assets/images/pages/login.png" alt="branding logo">
                                </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 px-2">
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="mb-0">Login</h4>
                                            </div>
                                        </div>
                                        <p class="px-2">Welcome back, please login to your account.</p>
                                        <div class="card-content">
                                            <div class="card-body pt-1">
                                                <form action="/desket/home/loginok.do" method="post">
                                                 	 
                                                	 <fieldset class="form-label-group form-group position-relative has-icon-left">
                                                        <select name="logintype" id="logintype" class="form-control">
															<option value="member">일반</option>
															<option value="enterprise">기업</option>	
														<label for="logintype">회원 구분</label>						
													</select>
                                                    </fieldset>
                                                	
                                                
                                                    <fieldset class="form-label-group form-group position-relative has-icon-left">
                                                        <input type="text" class="form-control" id="id" name ="id" placeholder="Username" required>
                                                        <div class="form-control-position">
                                                            <i class="feather icon-user"></i>
                                                        </div>
                                                        <label for="user-name">Username</label>
                                                    </fieldset>

                                                    <fieldset class="form-label-group position-relative has-icon-left">
                                                        <input type="password" class="form-control" id="pw" name="pw"placeholder="Password" required>
                                                        <div class="form-control-position">
                                                            <i class="feather icon-lock"></i>
                                                        </div>
                                                        <label for="user-password">Password</label>
                                                    </fieldset>
                                                  
                                                  	<!--  빠른 로그인
                                                  	<fieldset class="form-label-group position-relative has-icon-left">
                                                        <a href="/desket/home/loginok.do?id=스탠드포인트&pw=1234&logintype=enterprise">스탠드포인트</a>
                                                    </fieldset>
                                                  	<fieldset class="form-label-group position-relative has-icon-left">
                                                        <a href="/desket/home/loginok.do?id=qkrgjswjd100&pw=1234&logintype=member">qkrgjswjd100</a>
                                                    </fieldset>
                                                  	<fieldset class="form-label-group position-relative has-icon-left">
                                                        <a href="/desket/home/loginok.do?id=admin&pw=1234&logintype=admin">admin</a>
                                                    </fieldset> 
                                                    -->
                                                    
                                                                                                     
                                                    <a href="/desket/home/resister.do" class="btn btn-outline-primary float-left btn-inline">Register</a>
                                                    <button type="submit" class="btn btn-primary float-right btn-inline">Login</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="login-footer">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!-- END: Content-->


    <!-- BEGIN: Vendor JS-->
    <script src="/desket/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/desket/app-assets/js/core/app-menu.js"></script>
    <script src="/desket/app-assets/js/core/app.js"></script>
    <script src="/desket/app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>


   