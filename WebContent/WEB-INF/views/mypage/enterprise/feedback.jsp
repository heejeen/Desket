<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<script src="<%= request.getContextPath() %>/app-assets/js/core/libraries/jquery.min.js"></script>
<!-- BEGIN: Head-->
<style>
	
	.table.table-bordered.tblStyle {
		width: 1580px;
		background-color: white;
		/* margin-left:280px; */
	}
	
	.table.table-bordered.tblStyle tr th { text-align: center; font-size: 14px; }
	.table.table-bordered.tblStyle tr td { text-align: center; }
	.table.table-bordered.tblStyle tr td:nth-child(1) { font-weight: bold; background-color: #D8D4FB; border: 1px solid #777; }
	.table.table-bordered.tblStyle tr td:nth-child(2) { border: 1px solid #777; }
	.table.table-bordered.tblStyle tr td:nth-child(3) { text-align: left; background-color: #FFE4CA; border: 1px solid #777; }
	.table.table-bordered.tblStyle tr td:nth-child(4) { border: 1px solid #777; }
	.table.table-bordered.tblStyle tr td:nth-child(5) { border: 1px solid #777; }
	.table.table-bordered.tblStyle tr td:nth-child(6) { text-align: left; background-color: #C3EFD7; border: 1px solid #777; }
	
	.table.table-bordered.tblStyle tr th:nth-child(1) { width: 100px; }
	.table.table-bordered.tblStyle tr th:nth-child(2) { width: 160px; }
	.table.table-bordered.tblStyle tr th:nth-child(3) { width: 500px; }
	.table.table-bordered.tblStyle tr th:nth-child(4) { width: 180px; }
	.table.table-bordered.tblStyle tr th:nth-child(5) { width: 150px; }
	.table.table-bordered.tblStyle tr th:nth-child(6) { width: 490px; }
	
	
</style>

<script>

	$(function() {
		
		//var evSuccess;
		
		$.ajax ({
			type: "GET",
			url: "/desket/mypage/enterprise/feedbackstatus.do",
			data: "seq=" + ${seq},
			dataType: "json",
			success: function(result) {
				
				$(result).each(function(index, item) {
					
					//item.feedbackStatus
					//alert(item.feedbackStatus);
					
					if (item.feedbackStatus == "yes") {
						$("#evBtn").attr("disabled", true).attr("class", "btn btn-secondary").val("평가완료");
					} else if (item.feedbackStatus == "no") {
						$("#evBtn").attr("disabled", false).attr("class", "btn btn-success");
					}
				});
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		})
		
	});
	
</script>

<head>
    <meta name="description" content="Vuesax admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuesax admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Feedback</title>
    <!-- 위쪽 css가 있던 부분 -->
    <jsp:include page="/inc/home/assettop.jsp"></jsp:include>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
	
	<jsp:include page="/inc/home/sidebar.jsp" ></jsp:include>
    <%-- <%@ include file="/inc/adminmenu.jsp" %> --%>
	<div class="app-content content">
    <!-- BEGIN: Content-->
    <!-- 원본 내용 -->
    <jsp:include page="/inc/home/headerbar.jsp" ></jsp:include>
        <!-- END: Header-->
        
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Feedback</h2>
                            
                            
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
        
        <!-- 가운데 내용 피드백 시작 -->
            <!-- <div><h3>기업공고 피드백 화면입니다.</h3></div> -->   
            
            <!-- MBTI -->
            <table id="tbl1" class="table table-bordered tblStyle">
            	<thead class="thead-dark">
	            	<tr>
	            		<th>유형</th>
	            		<th>합격률/불합격률</th>
	            		<th>질문</th>
	            		<th>선택유형과 합격자비율</th>
	            		<th>템플릿재조정유무</th>
	            		<th>템플릿재조정</th>
	            	</tr>
            	</thead>
            	<tbody>
	            	<tr>
	            		<td>
	            			${fmlist.get(0).getEi()}${fmlist.get(0).getSn()}${fmlist.get(0).getTf()}${fmlist.get(0).getJp()}
	            		</td>
	            		<td>
	            			<div>합격률 : ${fmlist.get(0).getPassRate()}%</div>
	            			<div>불합격률 : ${100 - fmlist.get(0).getPassRate()}%</div>
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
	            			부합률: ${fmlist.get(0).getAllComplianceRate()}%
	            		</td>
	            		<td>
	            			<c:if test="${fmlist.get(0).getAllComplianceRate() < 80}">
	            				유
	            			</c:if>
	            			<c:if test="${fmlist.get(0).getAllComplianceRate() >= 80}">
	            				무
	            			</c:if>
	            		</td>
	            		<td>
	            			<c:if test="${fmlist.get(0).getAllComplianceRate() < 80}">
	            				질문재조정에 들어갑니다.<br>
	            				<!-- 원래는 result 는 20이다. -->
	            				<%-- <c:if test="${result eq 13 || result eq 14 || result eq 15 || result eq 16 || result eq 17 || result eq 18 || result eq 19 || result eq 20}"> --%>
            					<div style="color: cornflowerblue;">[기존 리스트]</div>
            					<c:forEach items="${fmUpdateList}" var="fmudto" varStatus="fmustatus">
            					<c:if test="${fmustatus.index % 5 == 0}">
		            				<div>-- ${fmustatus.count}번 ~ ${fmustatus.count + 4}번 --</div>
		            			</c:if>
            						<div>${fmustatus.count}. ${fmudto.question}&nbsp; (${fmudto.score}점)</div>
           						<c:if test="${fmustatus.count % 5 == 0 && fmustatus.index < fmUpdateList.size() - 1 }">
			            			<br>
			            		</c:if>
            					</c:forEach>
            					<br>
            					<div style="color: tomato;">[New 리스트]</div>
            					<c:forEach items="${fmNewList}" var="fmndto" varStatus="fmnstatus">
            					<c:if test="${fmnstatus.index % 5 == 0}">
		            				<div>-- ${fmnstatus.count + 30}번 ~ ${fmnstatus.count + 34}번 --</div>
		            			</c:if>
            						<div>${fmnstatus.count + 30}. ${fmndto.question}&nbsp; (${fmndto.score}점)</div>
           						<c:if test="${fmnstatus.count % 5 == 0 && fmnstatus.index < fmNewList.size() - 1 }">
			            			<br>
			            		</c:if>
            					</c:forEach>
            					
            				</c:if>
            				<%-- <c:if test="${result eq 0}">
            					질문 재조정 실패
            				</c:if> --%>
	            			<%-- </c:if> --%>
	            			<c:if test="${fmlist.get(0).getAllComplianceRate() >= 80}">
	            				<div style="color: tomato; font-size: 22px; font-weight: bold;">질문재조정할 필요가 없습니다.</div>
	            			</c:if>
	            		</td>
	            	</tr>
            	</tbody>
            </table> 
            
            <!-- Holland -->
            <table id="tbl2" class="table table-bordered tblStyle">
            	<thead class="thead-dark">
	            	<tr>
	            		<th>유형</th>
	            		<th>합격률/불합격률</th>
	            		<th>질문</th>
	            		<th>선택유형과 합격자비율</th>
	            		<th>템플릿재조정유무</th>
	            		<th>템플릿재조정</th>
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
	            			<div>합격률 : ${fhlist.get(0).getPassRate()}%</div>
	            			<div>불합격률 : ${100 - fhlist.get(0).getPassRate()}%</div>
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
	            		</td><!-- 질문 -->
	            		<td>
	            			부합률: ${fhlist.get(0).getAllComplianceRate()}%
	            		</td>
	            		<td>
	            			<c:if test="${fhlist.get(0).getAllComplianceRate() < 80}">
	            				유
	            			</c:if>
	            			<c:if test="${fhlist.get(0).getAllComplianceRate() >= 80}">
	            				무
	            			</c:if>
	            		</td>
	            		<td>
	            			<c:if test="${fhlist.get(0).getAllComplianceRate() < 80}">
	            				질문재조정에 들어갑니다.<br>
	            				<!-- 원래는 result2는 30이다. -->
	            				<%-- <c:if test="${result2 eq 24 || result2 eq 25 || result2 eq 26 || result2 eq 27 || result2 eq 28 || result2 eq 29 || result2 eq 30}"> --%>
            					<div style="color: cornflowerblue;">[기존 리스트]</div>
            					<c:forEach items="${fhUpdateList}" var="fhudto" varStatus="fhustatus">
            					<c:if test="${fhustatus.index % 10 == 0}">
		            				<div>-- ${fhudto.type}형 --</div>
		            			</c:if>
            						<div>${fhustatus.count}. ${fhudto.question}&nbsp; (${fhudto.score}점)</div>
           						<c:if test="${fhustatus.count % 10 == 0 && fhustatus.index < fhUpdateList.size() - 1 }">
			            			<br>
			            		</c:if>
            					</c:forEach>
            					<br>
            					<div style="color: tomato;">[New 리스트]</div>
            					<c:forEach items="${fhNewList}" var="fhndto" varStatus="fhnstatus">
            					<c:if test="${fhnstatus.index % 10 == 0}">
		            				<div>-- ${fhndto.type}형 --</div>
		            			</c:if>
            						<div>${fhnstatus.count + 45}. ${fhndto.question}&nbsp; (${fhndto.score}점)</div>
           						<c:if test="${fhnstatus.count % 10 == 0 && fhnstatus.index < fhNewList.size() - 1 }">
			            			<br>
			            		</c:if>
            					</c:forEach>
            				</c:if>
            				<%-- <c:if test="${result2 eq 0}">
            					질문재조정실패
            				</c:if> --%>
	            			<%-- </c:if> --%>
	            			<c:if test="${fhlist.get(0).getAllComplianceRate() >= 80}">
	            				<div style="color: tomato; font-size: 22px; font-weight: bold;">질문재조정할 필요가 없습니다.</div>
	            			</c:if>
	            		</td>
	            	</tr>
            	</tbody>
            </table>
            
            <!-- Humanity -->
            <table id="tbl3" class="table table-bordered tblStyle">
            	<thead class="thead-dark">
	            	<tr>
	            		<th>유형</th>
	            		<th>합격률/불합격률</th>
	            		<th>질문</th>
	            		<th>선택유형과 정답률</th>
	            		<th>템플릿재조정유무</th>
	            		<th>템플릿재조정</th>
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
	            			<div>합격률 : ${fhmlist.get(0).getPassRate()}%</div>
	            			<div>불합격률 : ${100 - fhmlist.get(0).getPassRate()}%</div>
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
	            			통과율: ${fhmlist.get(0).getAllAnswerRate()}%
	            		</td>
	            		<td>
	            			<c:if test="${fhmlist.get(0).getAllAnswerRate() >= 70}">
	            				유
	            			</c:if>
	            			<c:if test="${fhmlist.get(0).getAllAnswerRate() < 70}">
	            				무
	            			</c:if>
	            		</td>
	            		<td>
							<c:if test="${fhmlist.get(0).getAllAnswerRate() >= 70}">
	            				질문재조정에 들어갑니다.
	            				<%-- <c:if test="${result3 eq 3 || result3 eq 4 || result3 eq 5 || result3 eq 6}"> --%> <!-- 원래는 result4가 무조건 6인데 더미때문에 어쩔수가없다. -->
	            				<div style="color: cornflowerblue;">[기존 리스트]</div>
	            				<c:forEach items="${fhmUpdateList}" var="fhmudto" varStatus="fhmustatus">
	            				<c:if test="${fhmustatus.index % 10 == 0}">
	            					<div> -- 수리영역 & 언어영역 -- </div>
            					</c:if>
            						<div>${fhmustatus.count}. ${fhmudto.question}&nbsp; (${fhmudto.score}점)</div>
            						<div>① ${fhmudto.one} ② ${fhmudto.two} ③ ${fhmudto.three} ④ ${fhmudto.four}</div>
           						<c:if test="${fhmustatus.index < fhmUpdateList.size() - 1}">
	            					<br>
            					</c:if>
            					</c:forEach>
	            				
	            				<br>
            					<div style="color: tomato;">[New 리스트]</div>
            					<c:forEach items="${fhmNewList}" var="fhmndto" varStatus="fhmnstatus">
            					<c:if test="${fhmnstatus.index % 10 == 0}">
		            					<div> -- 수리영역 & 언어영역 -- </div>
            					</c:if>
            						<div>${fhmnstatus.count + 7}. ${fhmndto.question}&nbsp; (${fhmndto.score}점)</div>
            						<div>① ${fhmndto.one} ② ${fhmndto.two} ③ ${fhmndto.three} ④ ${fhmndto.four}</div>
           						<c:if test="${fhmnstatus.index < fhmNewList.size() - 1}">
	            					<br>
            					</c:if>
            					</c:forEach>
            				</c:if>
	            			<%-- </c:if> --%>
	            			<c:if test="${fhmlist.get(0).getAllAnswerRate() < 70}">
	            				<div style="color: tomato; font-size: 22px; font-weight: bold;">질문재조정할 필요가 없습니다.</div>
	            			</c:if>	            			
	            		</td>
	            	</tr>
            	</tbody>
            </table>
            
            <!-- Skill -->
            <table id="tbl4" class="table table-bordered tblStyle">
            	<thead class="thead-dark">
	            	<tr>
	            		<th>유형</th>
	            		<th>합격률/불합격률</th>
	            		<th>질문</th>
	            		<th>선택유형과 합격자비율</th>
	            		<th>템플릿재조정유무</th>
	            		<th>템플릿재조정</th>
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
	            		</td> <!-- 유형 -->
	            		<td>
	            			<div>합격률 : ${fslist.get(0).getPassRate()}%</div>
	            			<div>불합격률 : ${100 - fslist.get(0).getPassRate()}%</div>
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
	            			통과율: ${fslist.get(0).getAllAnswerRate()}%
	            		</td>
	            		<td>
	            			<c:if test="${fslist.get(0).getAllAnswerRate() >= 50}">
	            				유
	            			</c:if>
	            			<c:if test="${fslist.get(0).getAllAnswerRate() < 50}">
	            				무
	            			</c:if>
	            		</td>
	            		<td>
	            			<c:if test="${fslist.get(0).getAllAnswerRate() >= 50}">
	            				질문재조정에 들어갑니다.
	            				<%-- <c:if test="${result4 eq 5 || result4 eq 6 || result4 eq 7 || result4 eq 8}"> --%> <!-- 원래는 result4가 무조건 8인데 더미때문에 어쩔수가없다. -->
	            				<div style="color: cornflowerblue;">[기존 리스트]</div>
	            				<c:forEach items="${fsUpdateList}" var="fsudto" varStatus="fsustatus">
	            					<c:if test="${fsudto.questionTypeSeq == 1}">
		            					<div> ==== Java Programing ==== </div>
	            					</c:if>
	            					<c:if test="${fsudto.questionTypeSeq == 2}">
		            					<div> ==== C Programing ==== </div>
	            					</c:if>
	            					<c:if test="${fsudto.questionTypeSeq == 3}">
		            					<div> ==== DB/SQL 선언문 ==== </div>
	            					</c:if>
	            					<div>${fsustatus.count}. ${fsudto.question} (${fsudto.score}점)</div>
	            					<img src="/desket/app-assets/images/skillmatterimg/기술문제${fsudto.stSeq}번.PNG" alt="" style="width: 450px; height: 250px;" />
	            					<c:if test="${fsustatus.index < fsUpdateList.size() - 1}">
		            					<br><br>
	            					</c:if>
		            			</c:forEach>
	            				<br><br>
	            				<div style="color: tomato;">[New 리스트]</div>
	            				<c:forEach items="${fsNewList}" var="fsndto" varStatus="fsnstatus">
	            					<c:if test="${fsndto.questionTypeSeq == 1}">
		            					<div> ==== Java Programing ==== </div>
	            					</c:if>
	            					<c:if test="${fsndto.questionTypeSeq == 2}">
		            					<div> ==== C Programing ==== </div>
	            					</c:if>
	            					<c:if test="${fsndto.questionTypeSeq == 3}">
		            					<div> ==== DB/SQL 선언문 ==== </div>
	            					</c:if>
	            					<div>${fsnstatus.count + 11}. ${fsndto.question} (${fsndto.score}점)</div>
	            					<img src="/desket/app-assets/images/skillmatterimg/기술문제${fsndto.seq}번.PNG" alt="" style="width: 450px; height: 250px;" />
	            					<c:if test="${fsnstatus.index < fsNewList.size() - 1}">
		            					<br><br>
	            					</c:if>
		            			</c:forEach>
	            			</c:if>
		            		<%-- </c:if> --%>
	            			<c:if test="${fslist.get(0).getAllAnswerRate() < 50}">
	            				<div style="color: tomato; font-size: 22px; font-weight: bold;">질문재조정할 필요가 없습니다.</div>
	            			</c:if>
	            		</td>
	            	</tr>
            	</tbody>
            </table>
            
            <input type="button" id="evBtn" value="평가하기" onclick="location.href='/desket/mypage/enterprise/evaluation.do?seq=${seq}';" 
            <%-- <c:if test="${evSuccess eq 'no'}">
            	class="btn btn-success" 
            </c:if>
            <c:if test="${evSuccess eq 'fin'}">
            	disabled
            	class="btn btn-default"
            	style="background-color: #ccc;"
            </c:if> --%>
            />
			
			<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='/desket/notice/view.do?seq=${seq}&id=${id}&status=closed&where=closed';" />
			
			
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
	<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
    <!-- END: Footer-->

	<!-- 원래 아래쪽에 스크립트가 있던부분 -->
    

</body>
<!-- END: Body-->

</html>