<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Desket</title>
<style>

	#basicinfo th {
		width: 10%;
	}

	#basicinfo tr td:nth-child(1) {
		width: 30%;
	}
	
	p {
		padding-top: 15px;
	}
	
	#infoimg {
		width: 80%;
	}

	#commentwrite input:first-child {
		width: 84%;
		height: 45px;
		display: inline-block;
	}

	#commentwrite input:nth-child(2) {
		width: 14%;
		height: 45px;
		margin-left: 10px;
		display: inline-block;
	}
	
	#map {
		width: 100%;
		height: 520px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	
	#comment {
		width: 100%;
		margin: 10px 5px 5px 5px;
	}
	
	#comment tr {
		padding: 5px;
		border-top: 1px solid #eee;
	}
	
	#comment tr:first-child {
		padding: 5px;
		border-top: 0px
	}
	
	#comment tr td {
		padding: 10px;
	}
	
	#ccontent {
		width: 90%;
	}
	
	#comment tr td:nth-child(1) {	
		width: 75%;
	}
	
	#comment tr td:nth-child(2) {	
		width: 10%;
		padding-left: 20px;
	}
	
	#comment tr td:nth-child(3) {	
		width: 10%;
	}
	
	#comment tr td:nth-child(4) {	
		width: 5%;
	}
	
	#nocomment {
		text-align: center;
	}
	
	#commentread {
		height: 296px;
		overflow: auto;
		overflow-x: hidden;
		margin-top: 10px;
	}
	
	.finfobox {
		 height: 80px; 
		 margin-top: 20px;
	}

	.finance-text {
		margin: auto;
		width: 70%;
		height: 80%;
		margin-bottom: 0px;
		padding: 0px;
		text-align: center;
	}
	
	.finance-text tr:first-child {
		height: 40%;
	}
	
	.finance-text td {
		border: 0px solid red;
		collapse: collapse;
		width: 50%;
	}
	
	.finance-text tr:nth-child(2) td {
		font-size: 1.6em;
		color: black;
		font-weight: bold;
	}
	
	.finance-text tr td:first-child {
		border-right: 1px solid #ddd;
	}
	
	canvas {
		min-height: 450px;
	}
	
</style>


<!-- BEGIN : CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
<!-- END : CSS -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a21b846a7a38c331fb20cb42cce31db"></script>

<script>
	
	
 
	$(window).on("load", function () {

//----------------------------------------------------------------------------------------
		$("#btntest").click(function() {
    			

   				$.ajax({
   					type: "GET",
   					url: "/desket//enterpriseinfo/comment_data.do",
   					data: "eiseq=" + ${eidto.seq},
   					dataType: "xml", 				// 응답 데이터의 타입 (text, xml, json)
   					success: function(result) {
   						
   						// 기존 검색 결과 지우기
   						$("#tbltest").html("");
   						
   						$(result).find("item").each(function(index, item) {
   							
   							$("#tbltest").append("<tr><td>" + $(item).find("mcontent").text() + "</td></tr>");
   							
   						});
   					},
   					error: function(a, b, c) {
   						console.log(a, b, c);
   					}
   				});		

    			
    			});
		/* $("#csubmit").click(function() {
			
			var ajax = new XMLHttpRequest();

			ajax.onreadystatechange = function() {
				

				if (ajax.readyState == 4 && ajax.status == 200) {	
					
					$("#comment").text(ajax.responseText);
				}
			};
			
			ajax.open("GET", "/desket/enterpriseinfo/comment_data.do?eiseq=" + ${eidto.seq});
			
			ajax.send();
			
		}); */
		
//----------------------------------------------------------------------------------------
		
	  var $primary = '#7367F0';
	  var $success = '#28C76F';
	  var $danger = '#EA5455';
	  var $warning = '#FF9F43';
	  var $label_color = '#1E1E1E';
	  var grid_line_color = '#dae1e7';
	  var scatter_grid_color = '#f3f3f3';
	  var $scatter_point_light = '#D1D4DB';
	  var $scatter_point_dark = '#5175E0';
	  var $white = '#fff';
	  var $black = '#000';
	  var $gray = '#ccc';

	  var themeColors = [$gray, $gray, $gray, $primary, $label_color];

	  
	  var saleschart = $("#sales-chart");

	  // Chart Options
	  var barchartOptions = {
	    elements: {
	      rectangle: {
	        borderWidth: 2,
	        borderSkipped: 'left'
	      }
	    },
	    responsive: true,
	    maintainAspectRatio: false,
	    responsiveAnimationDuration: 500,
	    legend: { display: false },
	    scales: {
	      xAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        }
	      }],
	      yAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        },
	        ticks: {
	          stepSize: 50
	        },
	      }],
	    },
	    title: {
	      display: false,
	      text: ''
	    },

	  };

	  // Chart Data
	  var barchartData = {
	    labels: ["2015", "2016", "2017", "2018"],
	    datasets: [{
	      label: "억원",
	      data: [${sdto.fifteenth}, ${sdto.sixteenth}, ${sdto.seventeenth}, ${sdto.eighteenth}],
	      backgroundColor: themeColors,
	      borderColor: "transparent"
	    }]
	  };

	  var barChartconfig = {
	    type: 'bar',

	    // Chart Options
	    options: barchartOptions,

	    data: barchartData
	  };

	  // Create the chart
	  var barChart = new Chart(saleschart, barChartconfig);
	  
	  
	  // 영업 차트 --------------------------------------------------
	  var profitchart = $("#profit-chart");

	  // Chart Options
	  var barchartOptions = {
	    elements: {
	      rectangle: {
	        borderWidth: 2,
	        borderSkipped: 'left'
	      }
	    },
	    responsive: true,
	    maintainAspectRatio: false,
	    responsiveAnimationDuration: 500,
	    legend: { display: false },
	    scales: {
	      xAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        }
	      }],
	      yAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        },
	        ticks: {
	          stepSize: 10
	        },
	      }],
	    },
	    title: {
	      display: false,
	      text: ''
	    },

	  };

	  // Chart Data
	  var barchartData = {
	    labels: ["2015", "2016", "2017", "2018"],
	    datasets: [{
	      label: "억원",
	      data: [${pdto.fifteenth}, ${pdto.sixteenth}, ${pdto.seventeenth}, ${pdto.eighteenth}],
	      backgroundColor: themeColors,
	      borderColor: "transparent"
	    }]
	  };

	  var barChartconfig = {
	    type: 'bar',

	    // Chart Options
	    options: barchartOptions,

	    data: barchartData
	  };

	  // Create the chart
	  var barChart = new Chart(profitchart, barChartconfig);
	  
	  
	  // 순이익 차트 --------------------------------------------------
	  var netincomchart = $("#netincome-chart");

	  // Chart Options
	  var barchartOptions = {
	    elements: {
	      rectangle: {
	        borderWidth: 2,
	        borderSkipped: 'left'
	      }
	    },
	    responsive: true,
	    maintainAspectRatio: false,
	    responsiveAnimationDuration: 500,
	    legend: { display: false },
	    scales: {
	      xAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        }
	      }],
	      yAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        },
	        ticks: {
	          stepSize: 5
	        },
	      }],
	    },
	    title: {
	      display: false,
	      text: ''
	    },

	  };

	  // Chart Data
	  var barchartData = {
	    labels: ["2015", "2016", "2017", "2018"],
	    datasets: [{
	      label: "억원",
	      data: [${nidto.fifteenth}, ${nidto.sixteenth}, ${nidto.seventeenth}, ${nidto.eighteenth}],
	      backgroundColor: themeColors,
	      borderColor: "transparent"
	    }]
	  };

	  var barChartconfig = {
	    type: 'bar',

	    // Chart Options
	    options: barchartOptions,

	    data: barchartData
	  };

	  // Create the chart
	  var barChart = new Chart(netincomchart, barChartconfig);
	  
	  
	  // 총자산 차트 --------------------------------------------------
	  var totalassetchart = $("#totalasset-chart");

	  // Chart Options
	  var barchartOptions = {
	    elements: {
	      rectangle: {
	        borderWidth: 2,
	        borderSkipped: 'left'
	      }
	    },
	    responsive: true,
	    maintainAspectRatio: false,
	    responsiveAnimationDuration: 500,
	    legend: { display: false },
	    scales: {
	      xAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        }
	      }],
	      yAxes: [{
	        display: true,
	        gridLines: {
	          color: grid_line_color,
	        },
	        scaleLabel: {
	          display: true,
	        },
	        ticks: {
	          stepSize: 1
	        },
	      }],
	    },
	    title: {
	      display: false,
	      text: ''
	    },

	  };

	  // Chart Data
	  var barchartData = {
	    labels: ["2015", "2016", "2017", "2018"],
	    datasets: [{
	      label: "억원",
	      data: [${tadto.fifteenth}, ${tadto.sixteenth}, ${tadto.seventeenth}, ${tadto.eighteenth}],
	      backgroundColor: themeColors,
	      borderColor: "transparent"
	    }]
	  };

	  var barChartconfig = {
	    type: 'bar',

	    // Chart Options
	    options: barchartOptions,

	    data: barchartData
	  };

	  // Create the chart
	  var barChart = new Chart(totalassetchart, barChartconfig);

	  
	  //map
	  
	 	 var map;

		// 지도를 출력할 컨테이너
		var container = $("#map")[0]; //jquery 객체 지원 안함.
	
		//지도를 표기 설정
		var options = {
			center : new kakao.maps.LatLng(${eidto.lat}, ${eidto.lng}), //중심점
			level : 3
		//확대 레벨
		};
		// 지도 객체 생성
		map = new kakao.maps.Map(container, options);
	
		//마커를 초기화하면서 등록하기
		var marker = new kakao.maps.Marker({
			position:new kakao.maps.LatLng(${eidto.lat}, ${eidto.lng})
		});
		//지도에 마커를 추가하기
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;">${eidto.name}</div>', 
		iwPosition = new kakao.maps.LatLng(${eidto.lat}, ${eidto.lng})//인포윈도우 표시 위치입니다
	   
		
		var infowindow = new kakao.maps.InfoWindow({
		    map: map, // 인포윈도우가 표시될 지도
		    position : iwPosition, 
		    content : iwContent	   
		});
	  
	});	
	

	function del(cseq) {
		
		if (confirm("댓글을 정말 삭제하시겠습니까?")) {
			
			location.href='/desket/enterpriseinfo/delcomment.do?cseq=' + cseq + '&eiseq=${enterpriseinfoseq}';
		}
		
	};

	
	function edit(ccontent, cseq) {
	
		$("#ccontent").val(ccontent);
		$("#csubmit").val("수정");
		$("#cform").attr("action", '/desket/enterpriseinfo/editcomment.do?cseq=' + cseq + '&eiseq=${enterpriseinfoseq}');
		$("#ccontent").focus();
		
		/* location.href = '/desket/enterpriseinfo/editcomment.do?' + cseq + '&eiseq=${enterpriseinfoseq}'; */
	}
  
</script> 
  
  
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
	
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb" style="border: 0px;">
                                    <li class="breadcrumb-item"><a href="/desket/home/index.do">메인</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/desket/enterpriseinfo/list.do">기업 정보</a>
                                    </li>
                                    <li class="breadcrumb-item active">상세보기 : ${eidto.name}
                                    </li>
                                </ol>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                    <div class="form-group breadcrum-right">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary" type="button" onclick="location.href='/desket/enterpriseinfo/list.do?menuid=${menuid}';"><i class="fa fa-list"></i>목록보기</button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">

			<!-- Input Validation start -->
                <section class="input-validation">
                    <div class="row">
                        <div class="col-md-12">
                        	
                        	<!-- 로고 + 회사이름 + 홈페이지 시작 -->
                        	<div class="card">
                                <div class="card-content">
                                    <div class="card-body">

                                    	<table class="table" id="basic">
                                    		<tr>
                                    			<td rowspan="2" style="width: 300px; padding-right: 30px;">
                                    			<div id="logoimg"><img src="/desket/assets/images/logo/${eidto.seq}${eidto.name.toLowerCase()}.png" style="width: 300px;"></div>
                                    			</td>
                                    			<td id="e_name" style="font-size: 3em; font-weight: bold; padding-top: 20px; padding-bottom: 5px;">${eidto.name}</td>
                                    		</tr>
                                    		<tr>
                                    			<td id="url"><a href="${eidto.homepage}" style="color: #bbb; ">${eidto.homepage}</a></td>
                                    		</tr>
                                    	</table>
                                    
                                    </div>
                                </div>
                                
                            </div>
                            <!-- 로고 + 회사이름 + 홈페이지 끝 -->
                            
                            <!-- 기본 정보 시작 -->
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"><i class="fa fa-suitcase"></i> 기본 정보</h4>
                                </div>
                                
                                <div class="card-content">
                                    <div class="card-body">

										<div></div>
                                    	<table class="table table-bordered" id="basicinfo">
                                    		<tr>
                                    			<th>분야</th>
                                    			<td>${eidto.field}</td>
                                    			<th>주소</th>
                                    			<td>${eidto.address}</td>
                                    		</tr>
                                    		<tr>
                                    			<th>규모</th>
                                    			<td>${eidto.scale}</td>
                                    			<th>전화</th>
                                    			<td>${eidto.tel}</td>
                                    		</tr>
                                    		<tr>
                                    			<th>사원수</th>
                                    			<td>${eidto.employeenumber}명</td>
                                    			<th>설립년도</th>
                                    			<td>${eidto.establishyear} (${eidto.years}년차)</td>
                                    		</tr>
                                    		<tr>
                                    			<th>소개</th>
                                    			<td colspan="3"><p>${eidto.introduction}</p></td>
                                    		</tr>
                                    	</table>
                                    
                                    </div>
                                </div>
                                
                            </div>
                            <!-- 기본 정보 끝-->
                            
                        </div>
                    </div>
                </section>
                
                <!-- Input Validation end -->
                
                
                
                <section id="content-types">
                    <div class="row match-height">
                    	
                    	<!-- 차트 카드 시작 -->	
                        <div class="col-xl-4 col-md-6">
                            <div class="card">
                                <div class="card-header mb-1">
                                    <h4 class="card-title">매출액</h4>
                                </div>
                                <div class="finfobox">
                                
                                <table class="finance-text">
                                	<tr>
                                		<td>2018 매출액</td>
                                		<td>전년 대비</td>
                                	</tr>
                                	<tr>
                                		<td>${sdto.eighteenth}억원</td>
                                		
                                		<c:if test="${scomp > 0}">
                                		<td style="color: tomato;">${scomp}% <i class="fa fa-chevron-up"></i></td>
                                		</c:if>
                                		<c:if test="${scomp == 0}">
                                		<td>${scomp}% <i class="fa fa-minus"></i></td>
                                		</c:if>
                                		<c:if test="${scomp < 0}">
                                		<td style="color: cornflowerblue;">${-scomp}% <i class="fa fa-chevron-down"></i></td>
                                		</c:if>
                                	</tr>
                                </table>
                                
                                </div>
                               <!-- 차트 시작 -->
							  <div>
		                          <div class="card-content">
		                              <div class="card-body">
		                                  <div>
		                                      <canvas id="sales-chart"></canvas>
		                                  </div>
		                              </div>
		                          </div>
			                  </div>
			                  <!-- 차트 끝 -->
                            </div>
                        </div>
                        <!-- 차트 카드 끝 -->
                        
                    
                    	<!-- 차트 카드 시작 -->	
                        <div class="col-xl-4 col-md-6">
                            <div class="card">
                                <div class="card-header mb-1">
                                    <h4 class="card-title">영업이익</h4>
                                </div>
                                <div class="finfobox">
                                
                                <table class="finance-text">
                                	<tr>
                                		<td>2018 영업이익</td>
                                		<td>전년 대비</td>
                                	</tr>
                                	<tr>
                                		<td>${pdto.eighteenth}억원</td>
                                		
                                		<c:if test="${pcomp > 0}">
                                		<td style="color: tomato;">${pcomp}% <i class="fa fa-chevron-up"></i></td>
                                		</c:if>
                                		<c:if test="${pcomp == 0}">
                                		<td>${pcomp}% <i class="fa fa-minus"></i></td>
                                		</c:if>
                                		<c:if test="${pcomp < 0}">
                                		<td style="color: cornflowerblue;">${-pcomp}% <i class="fa fa-chevron-down"></i></td>
                                		</c:if>
                                	</tr>
                                </table>
                                
                                </div>
                               <!-- 차트 시작 -->
							  <div>
		                          <div class="card-content">
		                              <div class="card-body">
		                                  <div>
		                                      <canvas id="profit-chart"></canvas>
		                                  </div>
		                              </div>
		                          </div>
			                  </div>
			                  <!-- 차트 끝 -->
                            </div>
                        </div>
                        <!-- 차트 카드 끝 -->
                    
                    	<!-- 차트 카드 시작 -->	
                        <div class="col-xl-4 col-md-6">
                            <div class="card">
                                <div class="card-header mb-1">
                                    <h4 class="card-title">순이익</h4>
                                </div>
                                <div class="finfobox">
                                
                                <table class="finance-text">
                                	<tr>
                                		<td>2018 순이익</td>
                                		<td>전년 대비</td>
                                	</tr>
                                	<tr>
                                		<td>${nidto.eighteenth}억원</td>
                                		
                                		<c:if test="${nicomp > 0}">
                                		<td style="color: tomato;">${nicomp}% <i class="fa fa-chevron-up"></i></td>
                                		</c:if>
                                		<c:if test="${nicomp == 0}">
                                		<td>${nicomp}% <i class="fa fa-minus"></i></td>
                                		</c:if>
                                		<c:if test="${nicomp < 0}">
                                		<td style="color: cornflowerblue;">${-nicomp}% <i class="fa fa-chevron-down"></i></td>
                                		</c:if>
                                	</tr>
                                </table>
                                
                                </div>
                               <!-- 차트 시작 -->
							  <div>
		                          <div class="card-content">
		                              <div class="card-body">
		                                  <div>
		                                      <canvas id="netincome-chart"></canvas>
		                                  </div>
		                              </div>
		                          </div>
			                  </div>
			                  <!-- 차트 끝 -->
                            </div>
                        </div>
                        <!-- 차트 카드 끝 -->
                        
                    </div>
                </section>
                <!-- Content types section end -->
                
                <div class="row match-height">
	                <!-- 차트 카드 시작 -->	
                        <div class="col-xl-4 col-md-6">
                            <div class="card">
                                <div class="card-header mb-1">
                                    <h4 class="card-title">총 자산</h4>
                                </div>
                                <div class="finfobox">
                                
                                <table class="finance-text">
                                	<tr>
                                		<td>2018 순이익</td>
                                		<td>전년 대비</td>
                                	</tr>
                                	<tr>
                                		<td>${tadto.eighteenth}억원</td>
                                		
                                		<c:if test="${tacomp > 0}">
                                		<td style="color: tomato;">${tacomp}% <i class="fa fa-chevron-up"></i></td>
                                		</c:if>
                                		<c:if test="${tacomp == 0}">
                                		<td>${tacomp}% <i class="fa fa-minus"></i></td>
                                		</c:if>
                                		<c:if test="${tacomp < 0}">
                                		<td style="color: cornflowerblue;">${-tacomp}% <i class="fa fa-chevron-down"></i></td>
                                		</c:if>
                                	</tr>
                                </table>
                                
                                </div>
                               <!-- 차트 시작 -->
							  <div>
		                          <div class="card-content">
		                              <div class="card-body">
		                                  <div>
		                                      <canvas id="totalasset-chart"></canvas>
		                                  </div>
		                              </div>
		                          </div>
			                  </div>
			                  <!-- 차트 끝 -->
                            </div>
                        </div>
                        <!-- 차트 카드 끝 -->
                        
	                <!--  지도 카드 시작 -->
	                <div class="col-xl-8 col-md-6">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4 class="card-title"><i class="fa fa-compass"></i> 지도</h4>
	                        </div>
	                        <div style="margin: 15px 20px 0px 20px;">${eidto.address}</div>
	                        <div class="card-content">
	                            <div class="card-body">
	                                <div id="map"></div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!--  지도 카드 끝 -->
            	</div>
            	
            	<section>
                    <div class="row">
                    
                        <!-- 댓글 -->
                        <div class="col-lg-12 col-md-12"> 
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"><i class="fa fa-quote-left"></i> 댓글</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                    
                                    	<form id="cform" method="POST" action="/desket/enterpriseinfo/addcomment.do">
                                    	<div id="commentwrite">
                                        	<input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="댓글 내용">
                                        	<input type="submit" value="등록" class="form-control" id="csubmit">
                                        	<input type="hidden" name="enterpriseinfoseq" value="${enterpriseinfoseq}">
                                        </div>
                                        </form>
                                        
                                        <div id="commentread">
                                        	<table id="comment">

                                        		<c:if test="${eiclist.size() == 0}">
                                        		<tr id="nocomment">
                                        			<td style="padding-top: 20px;">등록된 댓글이 없습니다.</td>
                                        		</tr>
                                        		</c:if>
                                        		
                                        		<c:if test="${eiclist != null}">
                                        		<c:forEach items="${eiclist}" var="eicdto">
                                        		<tr>
                                        			<td id="commentcontent">
                                        				<div id="ccontent2">${eicdto.content}</div>
                                        			</td>
                                        			<td id="cwriter">
                                        				${eicdto.writer}
                                        			</td>
                                        			<td id="cregdate">
                                        				${eicdto.regdate}
                                        			</td>
                                        			<td id="cbutton">
	                                        			<c:if test="${eicdto.writer == loginid}">
	                                        			<div id="login-buttons">
		                                        			<i id="edit" class="feather icon-edit" onclick="edit('${eicdto.content}', ${eicdto.seq});" title="수정하기"></i> <i id="del" class="feather icon-trash-2" title="삭제하기" onclick="del(${eicdto.seq});"></i>
	                                        			</div>
	                                        			</c:if>
                                        			</td>
                                        		</tr>
                                        		</c:forEach>
                                        		</c:if>
                                        		
                                        	</table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </section>
                
                <c:if test="${eidto.seq < 5}">
                <section>
                    <div class="row">
                    
                        <!-- 추가이미지 -->
                        <div class="col-lg-12 col-md-12"> 
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"><i class="fa fa-folder-open"></i> 기타 정보</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body" style="height: 800px">
                                    	<img src="/desket/images/${eidto.seq}${eidto.name}_info.png" style="width: 70%; margin-top: 60px; margin-left: 50px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </section>
            	</c:if>
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