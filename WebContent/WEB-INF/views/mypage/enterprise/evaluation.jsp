<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.table tr td:nth-child(1) { font-weight: bold; background-color: #D8D4FB; border: 1px solid #777; }
	.table tr td:nth-child(2) { text-align: left; background-color: #FFE4CA; border: 1px solid #777; }
	.table tr td:nth-child(3) { border: 1px solid #777; }
	
	.table tr th { font-size: 14px; }
	.table tr th:nth-child(1) { width: 120px; }
	.table tr th:nth-child(2) { width: 800px; }
	.table tr th:nth-child(3) { width: 280px; }
	
	.evaluation { width: 18px; height: 18px; }
	
	.btn1 { margin-left: 79px; }
	
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






                <div class="row">
                    <div class="col-12">
                        <div class="card" style="width: 1200px; margin: 0px auto;">
                            <div class="card-header">
                                <h4 class="card-title"></h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                        <!-- Info table about action starts -->
											<form method="POST" action="/desket/mypage/enterprise/evaluationok.do">
												<div style="text-align:center; width: 1000px; margin: 0px auto;">
													<h4 style="font-weight: bold;">공고 평가하기 <small> 질문이 마음에 드셨다면 예, 아니면 아니오를 선택해주세요.</small></h4>
													<table class="table">
														<thead style="background-color: #E0E0E2;">
															<tr>
																<th>유형</th>
																<th>질문</th>
																<th>평가</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	${fmlist.get(0).getEi()}${fmlist.get(0).getSn()}${fmlist.get(0).getTf()}${fmlist.get(0).getJp()}
																</td>
																<td>
											            			<c:forEach items="${fmlist}" var="fmdto" varStatus="fmstatus">
											            			<c:if test="${fmstatus.index % 5 == 0}">
											            				<div>-- ${fmstatus.count}번 ~ ${fmstatus.count + 4}번 --</div>
											            			</c:if>
												            			<div>${fmstatus.count}. ${fmdto.question}&nbsp;(${fmdto.score}점) [부합률: ${fmdto.complianceRate}%]</div>
											            			<c:if test="${fmstatus.count % 5 == 0 && fmstatus.index < fmlist.size() - 1 }">
												            			<br>
												            		</c:if>
											            			</c:forEach>
											            		</td> <!-- 질문 -->
																<td>
																	<c:forEach items="${fmlist}" var="fmdto" varStatus="fmstatus">
											            			<c:if test="${fmstatus.index % 5 == 0}">
											            				<div>-- ${fmstatus.count}번 ~ ${fmstatus.count + 4}번 --</div>
											            			</c:if>
												            			<div>
												            				<span style="font-size:18px;">${fmstatus.count}.</span><c:if test="${fmstatus.count < 10 }">&nbsp;</c:if>&nbsp;&nbsp;<input type="radio"  style="vertical-align: -4px;" class="evaluation" id="fmevaluation${fmstatus.count}" name="fmevaluation${fmstatus.count}" value="y" /> 예
												            								  &nbsp; <input type="radio" style="vertical-align: -4px;" class="evaluation" id="fmevaluation${fmstatus.count}" name="fmevaluation${fmstatus.count}" value="n" checked  /> 아니오
												            			</div>
											            			<c:if test="${fmstatus.count % 5 == 0 && fmstatus.index < fmlist.size() - 1 }">
												            			<br>
												            		</c:if>
											            			</c:forEach>
																</td> <!-- 평가 -->
															</tr>
														</tbody>
													</table>
													<table class="table">
														<thead style="background-color: #E0E0E2;">
															<tr>
																<th>유형</th>
																<th>질문</th>
																<th>평가</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<c:if test="${fhlist.get(0).getHolland() eq 'R'}">
												            			${fhlist.get(0).getHolland()}(현실형)
											            			</c:if>
											            			<c:if test="${fhlist.get(0).getHolland() eq 'I'}">
												            			${fhlist.get(0).getHolland()}(탐구형)
											            			</c:if>
											            			<c:if test="${fhlist.get(0).getHolland() eq 'C'}">
												            			${fhlist.get(0).getHolland()}(관습형)
											            			</c:if>
											            			<c:if test="${fhlist.get(0).getHolland() eq 'E'}">
												            			${fhlist.get(0).getHolland()}(기업형)
											            			</c:if>
											            			<c:if test="${fhlist.get(0).getHolland() eq 'S'}">
												            			${fhlist.get(0).getHolland()}(사회형)
											            			</c:if>
											            			<c:if test="${fhlist.get(0).getHolland() eq 'A'}">
												            			${fhlist.get(0).getHolland()}(예술형)
											            			</c:if>
																</td>
																<td>
																	<c:forEach items="${fhlist}" var="fhdto" varStatus="fhstatus">
												            			<c:if test="${fhstatus.index % 10 == 0}">
												            				<div>-- ${fhdto.type}형 --</div>
												            			</c:if>
													            			<div>${fhstatus.count}. ${fhdto.question}&nbsp;(${fhdto.score}점) [부합률: ${fhdto.complianceRate}%]</div>
													            		<c:if test="${fhstatus.count % 10 == 0  && fhstatus.index < fhlist.size() - 1 }">
													            			<br>
													            		</c:if>
												            		</c:forEach>
																</td> <!-- 질문 -->
																<td>
																	<c:forEach items="${fhlist}" var="fhdto" varStatus="fhstatus">
												            			<c:if test="${fhstatus.index % 10 == 0}">
												            				<div>-- ${fhdto.type}형 --</div>
												            			</c:if>
												            				<div>
												            				<span style="font-size:18px;">${fhstatus.count}.</span><c:if test="${fhstatus.count < 10 }">&nbsp;</c:if>&nbsp;&nbsp;<input type="radio"  style="vertical-align: -4px;" class="evaluation" id="fhevaluation${fhstatus.count}" name="fhevaluation${fhstatus.count}" value="y" /> 예
												            								  &nbsp; <input type="radio" style="vertical-align: -4px;" class="evaluation" id="fhevaluation${fhstatus.count}" name="fhevaluation${fhstatus.count}" value="n" checked /> 아니오
												            				</div>
													            		<c:if test="${fhstatus.count % 10 == 0  && fhstatus.index < fhlist.size() - 1 }">
													            			<br>
													            		</c:if>
												            		</c:forEach>
																</td> <!-- 평가 -->
															</tr>
														</tbody>
													</table>
													<table class="table">
														<thead style="background-color: #E0E0E2;">
															<tr>
																<th>유형</th>
																<th>질문</th>
																<th>평가</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<c:set var="flag" value="true" />
											            			<c:forEach items="${fhmlist}" var="i" varStatus="istatus">
											            			<c:if test="${flag eq 'true'}">
												            			<c:if test="${fhmlist.get(istatus.index).getQuestionTypeSeq() == 2}">
												            				<div>수리</div>
												            				<c:set var="flag" value="false" />
												            			</c:if>
											            			</c:if>
											            			</c:forEach>
											            			
											            			<c:set var="flag" value="true" />
											            			<c:forEach items="${fhmlist}" var="i" varStatus="istatus">
											            			<c:if test="${flag eq 'true'}">
												            			<c:if test="${fhmlist.get(istatus.index).getQuestionTypeSeq() == 4}">
												            				<div>언어</div>
												            				<c:set var="flag" value="false" />
												            			</c:if>
											            			</c:if>
											            			</c:forEach>
																</td>
																<td>
											            			<c:forEach items="${fhmlist}" var="fhmdto" varStatus="fhmstatus">
											            				<c:if test="${fhmstatus.index % 10 == 0}">
											            					<div> -- 수리영역 & 언어영역 -- </div>
											            				</c:if>
											            					<div>${fhmstatus.count}. ${fhmdto.question} (${fhmdto.score}점) [정답률: ${fhmdto.answerRate}%]</div>
											            					<div>① ${fhmdto.one} ② ${fhmdto.two} ③ ${fhmdto.three} ④ ${fhmdto.four}</div>
										            					<c:if test="${fhmstatus.index < fhmlist.size() - 1}">
											            					<br>
										            					</c:if>
											            			</c:forEach>
											            		</td> <!-- 질문 -->
																<td>
																	<c:forEach items="${fhmlist}" var="fhmdto" varStatus="fhmstatus">
											            				<c:if test="${fhmstatus.index % 10 == 0}">
											            					<div> -- 수리영역 & 언어영역 -- </div>
											            				</c:if>
											            					<div>
												            				<span style="font-size:18px;">${fhmstatus.count}.</span><c:if test="${fhmstatus.count < 10 }">&nbsp;</c:if>&nbsp;&nbsp;<input type="radio"  style="vertical-align: -4px;" class="evaluation" id="fhmevaluation${fhmstatus.count}" name="fhmevaluation${fhmstatus.count}" value="y" /> 예
												            								  &nbsp; <input type="radio" style="vertical-align: -4px;" class="evaluation" id="fhmevaluation${fhmstatus.count}" name="fhmevaluation${fhmstatus.count}" value="n" checked  /> 아니오
												            				</div>
										            					<c:if test="${fhmstatus.index < fhmlist.size() - 1}">
											            					<br>
										            					</c:if>
											            			</c:forEach>
																</td> <!-- 평가 -->
															</tr>
														</tbody>
													</table>
													<table class="table">
														<thead style="background-color: #E0E0E2;">
															<tr>
																<th>유형</th>
																<th>질문</th>
																<th>평가</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<c:set var="flag" value="true" />
											            			<c:forEach items="${fslist}" var="i" varStatus="istatus">
											            			<c:if test="${flag eq 'true'}">
												            			<c:if test="${fslist.get(istatus.index).getQuestionTypeSeq() == 1}">
												            				<div>Java</div>
												            				<c:set var="flag" value="false" />
												            			</c:if>
											            			</c:if>
											            			</c:forEach>
											            			
											            			<c:set var="flag" value="true" />
											            			<c:forEach items="${fslist}" var="i" varStatus="istatus">
											            			<c:if test="${flag eq 'true'}">
												            			<c:if test="${fslist.get(istatus.index).getQuestionTypeSeq() == 2}">
												            				<div>C언어</div>
												            				<c:set var="flag" value="false" />
												            			</c:if>
											            			</c:if>
											            			</c:forEach>
											            			
											            			<c:set var="flag" value="true" />
											            			<c:forEach items="${fslist}" var="i" varStatus="istatus">
											            			<c:if test="${flag eq 'true'}">
												            			<c:if test="${fslist.get(istatus.index).getQuestionTypeSeq() == 3}">
												            				<div>DB/SQL</div>
												            				<c:set var="flag" value="false" />
												            			</c:if>
											            			</c:if>
											            			</c:forEach>
																</td>
																<td>
											            			<c:forEach items="${fslist}" var="fsdto" varStatus="fsstatus">
											            				<c:if test="${fsstatus.index % 5 == 0}">
											            					<c:if test="${fsdto.questionTypeSeq == 1}">
												            					<div> ==== Java Programing ==== </div>
											            					</c:if>
											            					<c:if test="${fsdto.questionTypeSeq == 2}">
												            					<div> ==== C Programing ==== </div>
											            					</c:if>
											            					<c:if test="${fsdto.questionTypeSeq == 3}">
												            					<div> ==== DB/SQL 선언문 ==== </div>
											            					</c:if>
											            				</c:if>
											            					<div>${fsstatus.count}. ${fsdto.question} (${fsdto.score}점) [정답률: ${fsdto.answerRate}%]</div>
											            					<img src="/desket/app-assets/images/skillmatterimg/기술문제${fsdto.stSeq}번.PNG" alt="" style="width: 450px; height: 250px;" />
											            					<c:if test="${fsstatus.index < fslist.size() - 1}">
												            					<br><br>
											            					</c:if>
											            			</c:forEach>
											            		</td> <!-- 질문 -->
																<td>
																	<c:forEach items="${fslist}" var="fsdto" varStatus="fsstatus">
											            				<c:if test="${fsstatus.index % 5 == 0}">
											            					<div>-- ${fsstatus.count}번 ~ ${fsstatus.count + 4}번 --</div>
											            				</c:if>
											            					<div>
												            				<span style="font-size:18px;">${fsstatus.count}.</span><c:if test="${fsstatus.count < 10 }">&nbsp;</c:if>&nbsp;&nbsp;<input type="radio"  style="vertical-align: -4px;" class="evaluation" id="fsevaluation${fsstatus.count}" name="fsevaluation${fsstatus.count}" value="y" /> 예
												            								  &nbsp; <input type="radio" style="vertical-align: -4px;" class="evaluation" id="fsevaluation${fsstatus.count}" name="fsevaluation${fsstatus.count}" value="n" checked  /> 아니오
												            				</div>
										            					<c:if test="${fsstatus.index < fslist.size() - 1}">
											            					<br><br>
										            					</c:if>
											            			</c:forEach>
																</td> <!-- 평가 -->
															</tr>
														</tbody>
													</table>
												</div>
													
												<div class="btn1">
													<input type="submit" value="평가완료" class="btn btn-success" />
													<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='/desket/mypage/enterprise/feedback.do?seq=${seq}&feedbackStatus=${feedbackStatus}';" />
													<input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='/desket/mypage/enterprise/announcelist.do';" />
												</div>
												
												<input type="hidden" name="fmsize" value="${fmlist.size()}" />
												<input type="hidden" name="fhsize" value="${fhlist.size()}" />
												<input type="hidden" name="fhmsize" value="${fhmlist.size()}" />
												<input type="hidden" name="fssize" value="${fslist.size()}" />
												
												<c:forEach items="${fmlist}" var="fmdto" varStatus="seqNum1">
													<input type="hidden" name="mtSeq${seqNum1.count}" value="${fmdto.mtSeq}" />
												</c:forEach>
												<c:forEach items="${fhlist}" var="fhdto" varStatus="seqNum2">
													<input type="hidden" name="htSeq${seqNum2.count}" value="${fhdto.htSeq}" />
												</c:forEach>
												<c:forEach items="${fhmlist}" var="fhmdto" varStatus="seqNum3">
													<input type="hidden" name="hutSeq${seqNum3.count}" value="${fhmdto.hutSeq}" />
												</c:forEach>
												<c:forEach items="${fslist}" var="fsdto" varStatus="seqNum4">
													<input type="hidden" name="stSeq${seqNum4.count}" value="${fsdto.stSeq}" />
												</c:forEach>
												
												<input type="hidden" name="seq" value="${seq}" />
											</form>
										<!-- Info table about action Ends -->
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


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