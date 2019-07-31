<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
   body { font-family: "consolas"; }
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<script src="/desket/assets/js/jquery-1.12.4.js"></script>

<link rel="apple-touch-icon" href="<%= request.getContextPath() %>/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/app-assets/images/ico/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/charts/apexcharts.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/extensions/tether-theme-arrows.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/extensions/tether.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/extensions/shepherd-theme-default.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/components.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/themes/semi-dark-layout.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/pages/dashboard-analytics.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/pages/card-analytics.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/plugins/tour/tour.css">

<!-- 상민 -->


<!-- 헌정 -->


<!-- 주엽 -->
 	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/file-uploaders/dropzone.min.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/plugins/file-uploaders/dropzone.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/pages/data-list-view.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/style.css">

<!-- 예찬 -->

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/faq.css">

<!-- 희진 -->

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/file-uploaders/dropzone.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/components.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/plugins/file-uploaders/dropzone.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/app-assets/css/pages/data-list-view.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/style.css">
<!-- END: Custom CSS-->

<link rel="apple-touch-icon" href="<%= request.getContextPath() %>/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/app-assets/images/ico/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
