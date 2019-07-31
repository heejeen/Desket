<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>공고 상세정보</title>
<style>
.tbl1 {
	width: 1600px;
}

.tbl1 th:nth-child(1) {
	width: 750px;
	margin-right: 100px;
	display: inline-block;
}

.tbl1 th:nth-child(2) {
	width: 750px;
	display: inline-block;
}
#btnbox{
	position:absolute; 
	top:0px; 
	right: -350px;
}
#backbtn,#applybtn,#interestbtn,#interestbtn,#feedbackbtn{
	
	background-color: #7367F0; 
	border: 0px; 
	padding: 8px 13px;
	box-sizing: none;
	color:#EEE;	
	
}
#graph-row .card .graph-title{
	
	text-align: center;
	background-color: #7367F0; 	
	padding: 8px 13px;
	box-sizing: none;
	color:#EEE;	
	font-weight: bold;
	
}
#passtitle{
	text-align: center;
	background-color: #7367F0; 	
	padding: 8px 13px;
	box-sizing: none;
	color:#EEE;	
	font-weight: bold;
	
}

	#tbl1 tr td input[type=radio] {
		margin-left: 10px;
		margin-top: 5px;
	}
</style>


<!-- BEGIN : CSS -->
<jsp:include page="/inc/home/assettop.jsp"></jsp:include>
<!-- END : CSS -->
<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/vendors/css/charts/apexcharts.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/components.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/desket/app-assets/css/pages/card-analytics.css">
<!-- END: Page CSS-->
<script src="/desket/assets/js/jquery-1.12.4.js" type="text/javascript"></script>
<!--카카오맵  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a21b846a7a38c331fb20cb42cce31db"></script>
<script>
$(function() {
	var map;

	// 지도를 출력할 컨테이너
	var container = $("#container")[0]; //jquery 객체 지원 안함.

	//지도를 표기 설정
	var options = {
		center : new kakao.maps.LatLng(${idto.lat}, ${idto.lng}), //중심점
		level : 3
	//확대 레벨
	};
	// 지도 객체 생성
	map = new kakao.maps.Map(container, options);

	//마커를 초기화하면서 등록하기
	var marker = new kakao.maps.Marker({
		position:new kakao.maps.LatLng(${idto.lat}, ${idto.lng})
	});
	//지도에 마커를 추가하기
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">${idto.id}</div>', 
	iwPosition = new kakao.maps.LatLng(${idto.lat}, ${idto.lng})//인포윈도우 표시 위치입니다
   
	
	var infowindow = new kakao.maps.InfoWindow({
	    map: map, // 인포윈도우가 표시될 지도
	    position : iwPosition, 
	    content : iwContent	   
	});
	
	
	if(${isinterest}==1){
		$(".fonticon-wrap.test>i").css("color",'rgb(255,0,0)');
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
var processNum = 0;
	
	var mCNum = 0; //MBTI OX문항 수
	var mOXCNum = 0; //MBTI 선택형 문항 수
	var hoNum = 0; //Holland 문항 수
	var huNum = 0; //인적성 문항 수
	var skNum = 0; //인적성 문항 수
	
	var mbStatus = 0;
	var hoStatus = 0;
	var huStatus = 0;
	var skStatus = 0;
	
	$("#emptyForm").text("[MBTI검사를 시작하겠습니다. 항목을 선택해주세요.]").css("text-align","center").css("font-weight","bold");
	$("#hollandTest, #humanityTest, #skillTest").attr("disabled", true);
	
	
	
	$("#MBTITest").click(function() {
		
		mCNum = 0;
		mOXCNum = 0;
		mbStatus = 1;
		
		//다른 시험 > 지금 시험   다른 시험 문제 지우기
		$("#emptyForm").remove();
		
		//다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
		$("#test").append("<div id='emptyForm'></div>");
		
		$.ajax({
			type: "GET",
			url: "/desket/notice/supportok.do",
			data: "questionType=MBTI",
			dataType: "json",
			success: function(result) {
				
				var temp1 = "";
				var temp2 = "";
				
				//alert(${mblist.size()});
				
				
				$(result).each(function(index, item){
					
					if(item.question.indexOf("vs") > -1) {
						
						mCNum++;
						
						if($("#tbl2").length == 0) {
							
							temp2 += "<table id='tbl2' class='table table-bordered' style='width: 100%;'><thead><tr style='text-align:center; background-color: #ddd;'><th style='width: 13%;'>문항</th><th style='width: 39%;'>질문</th><th colspan='2' style='width: 48%;'>선택</th></tr></thead><tbody></tbody></table>"
							$("#emptyForm").append(temp2);
							temp2 = "";
							
						} 
						
						var choice = item.question.split('vs');
						
						if(item.type == "E") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='E' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='I' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "I") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='I' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='E' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "S") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='S' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='N' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "N") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='N' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='S' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "T") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='T' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='F' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "F") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='F' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='T' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "J") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='J' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='P' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						if(item.type == "P") {
							
							temp2 += "<tr>";
								temp2 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mCNum + "</td>";
								temp2 += "<td style='text-align:center;'>" + item.question + "</td>";
								temp2 += "<td><span style='float:right;'>" + choice[0] + "<input type='radio' name='mChoice" + mCNum + "' value='P' style='text-align:center;' checked></span><span style='clear: right;'></span></td>";
								temp2 += "<td><input type='radio' name='mChoice" + mCNum + "' value='J' style='text-align:center;'>" + choice[1] + "</td>";
							temp2 += "</tr>";
							
						}
						
						
						
						
							
						
					} else {
						
						mOXCNum++;
						
						if($("#tbl1").length == 0) {
							
							temp1 += "<table id='tbl1' class='table table-bordered' style='width: 100%;'><thead><tr style='text-align:center; background-color: #ddd;'><th style='width: 13%;'>문항</th><th>질문</th><th style='width: 8%;'>O</th><th style='width: 8%;'>X</th></tr></thead><tbody></tbody></table> "
							$("#emptyForm").append(temp1);
							temp1 = "";
							
						} 
						
						
						
						
						if(item.type == "E") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><div><input type='radio' name='mOXChoice" + mOXCNum + "' value='E' checked></div></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='I'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "I") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='I' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='E' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "S") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='S' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='N' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "N") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='N' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='S' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "T") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='T' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='F' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "F") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='F' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='T' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "J") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='J' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='P' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						}
						if(item.type == "P") {
						
							temp1 += "<tr>";
								temp1 += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + mOXCNum + "</td>";
								temp1 += "<td>" + item.question + "</td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='P' style='text-align:center;' checked></td>";
								temp1 += "<td><input type='radio' name='mOXChoice" + mOXCNum + "' value='J' style='text-align:center;'></td>";
							temp1 += "</tr>";
							
						} 
					}
					
					
				});//each
				
				/* 
				if(mCNum + mOXCNum == ${mblist.size()} && ) {
					$("#emptyForm").text("[MBTI검사 제출이 완료되었습니다.]");
				} 
				*/
				
				$("#tbl1 tbody").append(temp1);
				$("#tbl2 tbody").append(temp2);
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});//MBTITest.click
	
	
	
	
	$("#hollandTest").click(function() {
		
		hoNum = 0;
		hoStatus = 1;
		
		//다른 시험 > 지금 시험   다른 시험 문제 지우기
		$("#emptyForm").remove();
		
		//다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
		$("#test").append("<div id='emptyForm'></div>");
		
		$.ajax({
			type: "GET",
			url: "/desket/notice/supportok.do",
			data: "questionType=holland",
			dataType: "json",
			success: function(result) {
				
				var temp = "";
				//var hoNum = 1; //문항 수
				
				$(result).each(function(index, item){
					
					hoNum++;
						
					if($("#tbl1").length == 0) {
						
						temp += "<table id='tbl1' class='table table-bordered' style='width: 100%;'><thead><tr style='text-align:center; background-color: #ddd;'><th style='width: 13%;'>문항</th><th>질문</th><th style='width: 8%;'>O</th><th style='width: 8%;'>X</th></tr></thead><tbody></tbody></table>"
						$("#emptyForm").append(temp);
						temp = "";
						
					} 
					
					temp += "<tr>";
						temp += "<td style='text-align:center; background-color: #eee; font-weight: bold;'>" + hoNum + "</td>";
						temp += "<td>" + item.question + "</td>";
						temp += "<td><input type='radio' name='hOXChoice" + hoNum + "' value='O' checked></td>";
						temp += "<td><input type='radio' name='hOXChoice" + hoNum + "' value='X'></td>";
					temp += "</tr>";

					
					
					
				});
				
				$("#tbl1 tbody").append(temp);
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});//hollandTest.click
	
	
	
	
	$("#humanityTest").click(function() {
		
		hoNum = 0;
		huStatus = 1;
		
		//다른 시험 > 지금 시험   다른 시험 문제 지우기
		$("#emptyForm").remove();
		
		//다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
		$("#test").append("<div id='emptyForm'></div>");
		
		$.ajax({
			type: "GET",
			url: "/desket/notice/supportok.do",
			data: "questionType=humanity",
			dataType: "json",
			success: function(result) {
				
				var temp1 = "";
				
				$(result).each(function(index, item){
					
					huNum++;
					
					//객관식 주관식 구분 해야함(더미는 주관식이 아직 없음)
					
					//<table id="tbl1" class="table table-bordered" style="width: 100%;"><thead><tr><th style="text-align: center;" colspan="5">[객관식 문제]</th></tr></thead><tbody></tbody></table>
					if($("#tbl4").length == 0) {
						
						temp1 += "<table id='tbl4' class='table table-bordered' style='width: 100%;'><thead><tr style='text-align:center; background-color: #ddd;'><th style='text-align: center;' colspan='5'>[객관식 문제]</th></tr></thead><tbody></tbody></table>"
						$("#emptyForm").append(temp1);
						temp1 = "";
						
					} 
					
					
					/* 
					<tr>
						<td rowspan="2">문항1</td>
						<td colspan="4">질문</td>
					</tr>
					<tr>
						<td><input type="radio" name="huChoice1" value="1"> 1.&nbsp;&nbsp; 30분</td>
						<td><input type="radio" name="huChoice2" value="2"> 2.&nbsp;&nbsp; 40분</td>
						<td><input type="radio" name="huChoice3" value="3"> 3.&nbsp;&nbsp; 50분</td>
						<td><input type="radio" name="huChoice4" value="4"> 4.&nbsp;&nbsp; 60분</td>
					</tr>
					 */
					
					temp1 += "<tr>";
						temp1 += "<td rowspan='2' style='width: 13%; background-color: #eee; text-align:center; font-weight: bold;'>문항" + huNum + "</td>";
						temp1 += "<td colspan='4'>" + item.question + "</td>";
					temp1 += "</tr>";
					temp1 += "<tr>";
						temp1 += "<td style='width: 20%';><input type='radio' name='huChoice" + huNum + "' value='1' style='margin-right: 5px; style='margin-right: 5px;' checked> 1.&nbsp;&nbsp; " + item.choice1 + "</td>";
						temp1 += "<td style='width: 20%';><input type='radio' name='huChoice" + huNum + "' value='2' style='margin-right: 5px; style='margin-right: 5px;'> 2.&nbsp;&nbsp; " + item.choice2 + "</td>";
						temp1 += "<td style='width: 20%';><input type='radio' name='huChoice" + huNum + "' value='3' style='margin-right: 5px; style='margin-right: 5px;'> 3.&nbsp;&nbsp; " + item.choice3 + "</td>";
						temp1 += "<td style='width: 20%';><input type='radio' name='huChoice" + huNum + "' value='4' style='margin-right: 5px; style='margin-right: 5px;'> 4.&nbsp;&nbsp; " + item.choice4 + "</td>";
					temp1 += "</tr>";

					
					
					
				});
				
				$("#tbl4 tbody").append(temp1);
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});//humanityTest.click
	
	
	
	
	
	$("#skillTest").click(function() {
		
		skNum = 0;
		skStatus = 1;
		
		//다른 시험 > 지금 시험   다른 시험 문제 지우기
		$("#emptyForm").remove();
		
		//다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
		$("#test").append("<div id='emptyForm'></div>");
		
		$.ajax({
			type: "GET",
			url: "/desket/notice/supportok.do",
			data: "questionType=skill",
			dataType: "json",
			success: function(result) {
				
				var temp1 = "";
				
				$(result).each(function(index, item){
					
					skNum++;
					
					//객관식 주관식 구분 해야함(더미는 주관식이 아직 없음)
					
					//<table id="tbl1" class="table table-bordered" style="width: 100%;"><thead><tr><th style="text-align: center;" colspan="5">[객관식 문제]</th></tr></thead><tbody></tbody></table>
					if($("#tbl1").length == 0) {
						
						//<table id="tbl1" class="table table-bordered" style="width: 100%;"><thead><tr><th style="text-align: center;" colspan="5">[주관식 문제]</th></tr></thead><tbody></tbody></table>
						temp1 += "<table id='tbl1' class='table table-bordered' style='width: 100%;'><thead><tr style='text-align:center; background-color: #ddd;'><th style='text-align: center;' colspan='2'>[주관식 문제]</th></tr></thead><tbody></tbody></table>";
						
						$("#emptyForm").append(temp1);
						temp1 = "";
						
					} 
					
					
					 
					/* 
					<tr>
						<td rowspan="3">문항1</td>
						<td>질문</td>
					</tr>
					<tr>
						<td><img src="/desket/app-assets/images/skillmatterimg/기술문제1번.PNG" style="width: 100%;"></td>
					</tr>
					<tr>
						<td><input type="text" name="skAnswer" placeholder="정답을 입력해주세요"></td>
					</tr>
					 */
					
					temp1 += "<tr>";
						temp1 += "<td rowspan='3' style='width: 13%; background-color: #eee; text-align:center; font-weight: bold;'>문항" + skNum + "</td>";
						temp1 += "<td style='font-weight: bold;'>" + item.question + "</td>";
					temp1 += "</tr>";
					temp1 += "<tr>";
						temp1 += "<td><img src='/desket/app-assets/images/skillmatterimg/기술문제" + skNum + "번.PNG' style='width: 100%;'></td>";
					temp1 += "</tr>";
					temp1 += "<tr style='border-bottom: 6px solid #eee;'>";
						temp1 += "<td><input type='text' class='form form-control' name='skAnswer" + skNum + "' placeholder='정답을 입력해주세요' required></td>";
					temp1 += "</tr>";

					
					
					
				});
				
				$("#tbl1 tbody").append(temp1);
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});//skillTest.click
	
	
	
	
	
	
	$("#submit").click(function() {
		
			
		//alert("hi Hello!~~");
		if(mbStatus == 1 && processNum == 0) {

			$.ajax({
				type: "GET",
				url: "/desket/notice/supportsubmitok.do?mCNum=" + mCNum + "&mOXCNum=" + mOXCNum + "&processNum=" + processNum + "&advertisementNum=${seq}",
				data: $("#testForm").serialize(),
				dataType: "json",
				success: function(result) {
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
				
			//    ㄴ다른 시험 > 지금 시험   다른 시험 문제 지우기
			$("#emptyForm").remove();
			
			//    ㄴ다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
			$("#test").append("<div id='emptyForm'></div>");
			
			$("#emptyForm").text("[MBTI검사가 완료되었습니다. Holland 검사를 진행해주세요.]").css("text-align","center").css("font-weight","bold");
			$("#MBTITest").css("background-color", "#666666").css("color", "white");
			$("#MBTITest").parent().css("background-color", "#666666").css("color", "white");
			
			$("#hollandTest").css("background-color", "#ddd").css("color", "black");
			$("#hollandTest").parent().css("background-color", "#ddd").css("color", "black");
			
			
			$("#MBTITest").attr("disabled", true);
			$("#hollandTest").attr("disabled", false);
			
			
			processNum++;
			//단계 확인용
			//alert("processNum : " + processNum);
				
		} else if(hoStatus == 1 && processNum == 1) {
			
			$.ajax({
					type: "GET",
				url: "/desket/notice/supportsubmitok.do?hoNum=" + hoNum + "&processNum=" + processNum,
				data: $("#testForm").serialize(),
				dataType: "json",
				success: function(result) {
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			
			});
			
				
			//    ㄴ다른 시험 > 지금 시험   다른 시험 문제 지우기
			$("#emptyForm").remove();
			
			//    ㄴ다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
			$("#test").append("<div id='emptyForm'></div>");
			
			$("#emptyForm").text("[Holland검사가 완료되었습니다. 인적성 검사를 진행해주세요.]").css("text-align","center").css("font-weight","bold");
			$("#hollandTest").css("background-color", "#666666").css("color", "white");
			$("#hollandTest").parent().css("background-color", "#666666").css("color", "white");
			
			$("#humanityTest").css("background-color", "#ddd").css("color", "black");
			$("#humanityTest").parent().css("background-color", "#ddd").css("color", "black");
			
			$("#hollandTest").attr("disabled", true);
			$("#humanityTest").attr("disabled", false);
			
			processNum++;
			//alert("processNum : " + processNum);
			
		} else if(huStatus == 1 && processNum == 2) {
			$.ajax({
				
				type: "GET",
				url: "/desket/notice/supportsubmitok.do?huNum=" + huNum + "&processNum=" + processNum,
				data: $("#testForm").serialize(),
				dataType: "json",
				success: function(result) {
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			
			});
			
				
			//    ㄴ다른 시험 > 지금 시험   다른 시험 문제 지우기
			$("#emptyForm").remove();
			
			//    ㄴ다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
			$("#test").append("<div id='emptyForm'></div>");
			
			$("#emptyForm").text("[인적성검사가 완료되었습니다. 기술 검사를 진행해주세요.]").css("text-align","center").css("font-weight","bold");
			$("#humanityTest").css("background-color", "#aaa").css("background-color", "#666666").css("color", "white");
			$("#humanityTest").parent().css("background-color", "#666666").css("color", "white");
			
			$("#skillTest").css("background-color", "#ddd").css("color", "black");
			$("#skillTest").parent().css("background-color", "#ddd").css("color", "black");
			
			$("#humanityTest").attr("disabled", true);
			$("#skillTest").attr("disabled", false);
			
			processNum++;
			//alert("processNum : " + processNum);
			
		}else if(skStatus == 1 && processNum == 3) {
			$.ajax({
				
				type: "GET",
				url: "/desket/notice/supportsubmitok.do?skNum=" + skNum + "&processNum=" + processNum,
				data: $("#testForm").serialize(),
				dataType: "json",
				success: function(result) {
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			
			});
			
				
			//    ㄴ다른 시험 > 지금 시험   다른 시험 문제 지우기
			$("#emptyForm").remove();
			
			//    ㄴ다시 테이블, 문제 등 append 시켜줄 부모 태그 생성해주기.
			$("#test").append("<div id='emptyForm'></div>");
			
			
			
			
			$("#emptyForm").text("[기술검사가 완료되었습니다. 수고하셨습니다.]").css("text-align","center").css("font-weight","bold");
			$("#skillTest").css("background-color", "#aaa").css("background-color", "#666666").css("color", "white");
			$("#skillTest").parent().css("background-color", "#666666").css("color", "white");
			
			$("#skillTest").attr("disabled", true);
			$("#submit").text("검사 완료");
			
			processNum++;
			//alert("processNum : " + processNum);
			
		} else if(mbStatus == 1 && hoStatus == 1 && huStatus ==1 && skStatus == 1 && processNum == 4) {
			
			$("#submit").attr("data-dismiss", "modal");
			alert("[제출이 완료되었습니다.]");
			
		}
		
		
	}); //submit.click   
	
	
	
	$("#close").click(function() {
		
		$("#close").removeAttr("data-dismiss");
		var result = confirm("[시험이 종료되지 않았습니다. 정말 나가시겠습니까?]");
		
		if(result){
			
			$("#close").attr("data-dismiss", "modal");
			
		} else {
			
		}
		
	});

	
	
	
	
	
	
	
	
	
	
	
	
	
});//ready
		
	
	
</script>
</head>
<body
	class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	<jsp:include page="/inc/home/sidebar.jsp"></jsp:include>
	<!-- BEGIN: Content-->
	<div class="app-content content">

		<jsp:include page="/inc/home/headerbar.jsp"></jsp:include>
		<!-- END: Header-->


		<div class="content-wrapper">
			<div class="content-header row" style="position:relative;">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h2 class="content-header-title float-left mb-0">${adto.title }</h2>						
						</div>
						<div id="btnbox">
													
								
							
							<c:if test="${logintype=='member' }">
								
							<%-- "location.href='/desket/notice/interest.do?id=${id}&seq=${seq }'" --%>
									<div class="fonticon-wrap test " style="display: inline-block; " >
										<i id="heart"class="fa fa-heart" data-seq='${dto.seq }' style="font-size: 1.5em; cursor: pointer;"></i>
										<label  for="heart" style="font-size: 1em; cursor:pointer; " id="interestbtn">관심등록</label>
									</div>								
								<script>	
									$(".fonticon-wrap.test").click(function(){
									
									if($("#heart").css('color')=='rgb(255, 0, 0)'){
										$("#heart").css("color",'rgb(98, 98, 98)');
									}else{
										$("#heart").css("color",'rgb(255, 0, 0)');
									}									 
									
									 $.ajax({
											"type":"GET", 
											"url":"/desket/notice/interest.do", 
											"data":{'id':'${id}','seq':'${seq}'},								
											error:function(a,b,c){ //에러 발생시 자동 호출
												alert(a+b+c);
											}			
										});
								});
			 					</script>
								<input type="button" value="지원하기" id="applybtn" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
									<!--?seq=seq  -->
							</c:if>							
							<c:if test="${logintype=='enterprise'&& status=='closed' }">
								<c:if test="${adto.storageStatus == 0}">
								<input type="button" value="피드백하기" id="feedbackbtn"
									onclick="location.href='/desket/mypage/enterprise/feedback.do?seq=${seq}&id=${adto.id}&$feedbackStatus=${adto.feedbackStatus}';"/>
								</c:if>
								<c:if test="${adto.storageStatus == 1}">
								<input type="button" value="피드백하기" id="feedbackbtn"
									onclick="location.href='/desket/mypage/enterprise/feedback.do?seq=${seq}&id=${adto.id}&$feedbackStatus=${adto.feedbackStatus}&status=closed';"/>
								</c:if>
							</c:if>
								<input type="button" value="돌아가기" id="backbtn"
									onclick="location.href='/desket/notice/list.do?menuid=notice';"/>
							
						</div>
					</div>
				</div>				
			</div> <!--header  -->
			<div class="content-body" style="background-color: #fff">
			
				<!-- Info table about action starts -->
				
				
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="col-sm-4" style="text-align: center;">	    						
								<table class="table table-bordered" >
									<thead style="color: #fff; background-color: #7367F0">
										<tr>
											<th colspan="2">공고내용</th>											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>공고명</td>
											<td>${adto.title }</td>
										</tr>
										<tr>
											<td>직무</td>
											<td>${adto.job }</td>
										</tr>
										<tr>
											<td>지역</td>
											<td>${adto.region }</td>
										</tr>
										<tr>
											<td>학력</td>
											<td>${adto.education }이상</td>
										</tr>
										<tr>
											<td>연봉</td>
											<td>${adto.minimumAnnualSalary }~${adto.maximumAnnualSalary }
												만원</td>
										</tr>
										<tr>
											<td>나이</td>
											<td>${adto.minimumAge }~${adto.maximumAge }세</td>
										</tr>
										<tr>
											<td>경력</td>
											<td>${adto.career }</td>
										</tr>
										<tr>
											<td>모집인원</td>
											<td>${adto.fixedNumber }명</td>
										</tr>
										<c:if test="${logintype=='enterprise' }">
										<tr>
											<td>MBTI</td>
											<td>ESTJ</td>
										</tr>
										<tr>
											<td>Holland</td>
											<td>R</td>
										</tr>
										<tr>
											<td>인적성검사 커트라인</td>
											<td>80</td>
										</tr>
										<tr>
											<td>기술면접 커트라인</td>
											<td>70</td>
										</tr>
										</c:if>
										<tr>
											<td>마감일</td>
											<td>${adto.deadline }</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-sm-8" style="text-align: center;">
								<table class="table" >
									<thead style="color: #fff; background-color: #7367F0">
										<tr>
											<th colspan="2">기업정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="width: 30%;">기업이미지</td>
											<td
												style="background-image: url('/desket/images/${idto.pic}'); 
															background-size:contain; background-repeat:no-repeat; background-position:center;"></td>
										</tr>
										<tr>
											<td>기업명</td>
											<td><a href="/desket/enterpriseinfo/view.do?seq=2&menuid=b">${idto.id }</a></td>
										</tr>
										<tr>
											<td>설립연도</td>
											<td>${idto.establishYear }</td>
										</tr>
										<tr>
											<td>규모</td>
											<td>${idto.scale }</td>
										</tr>
										<tr>
											<td>종업원수</td>
											<td>${idto.employeeNumber }명</td>
										</tr>
										<tr>
											<td>분야</td>
											<td>${idto.field }</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>${idto.address }</td>
										</tr>
										<tr>
											<td>연락처</td>
											<td>${idto.tel }</td>
										</tr>
										<tr>
											<td>홈페이지</td>
											<td><a href="${idto.hompage }">${idto.hompage }</a></td>
										</tr>
									</tbody>
								</table>								
							</div>
							
							
							
						</div>
					</div>
				</div>
				
				
				
				<div class="row" id="graph-row">
					<div class="col-lg-4 col-12">
						<div class="card">
							<div class="graph-title">지원자 경력 현황</div>
							<div class="card-content">
								<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
								<div class="card-body pb-0">
									<c:if test="${ccnt.size()!=0 }">
									<canvas id="career"></canvas>
									</c:if>
									<c:if test="${ccnt.size()==0 }">
									지원자가 없습니다.
									</c:if>
								</div>
							</div>
							<script>
                                var ctx = document.getElementById('career').getContext('2d');
                                var chart = new Chart(ctx, {
                                    // The type of chart we want to create
                                    type: 'bar',

                                    // The data for our dataset
                                    data: {
                                        labels: [
                                        	<c:forEach items="${ccnt}" var="dto">
                                        	'${dto.career}년', 
                                        	</c:forEach>
                                        	],
                                        datasets: [{
                                            label: '지원자 경력 현황',
                                            backgroundColor: ['rgb(222, 70, 70)','rgb(247,96,2)','rgb(251,255,43)','rgb(78,92,244)'],
                                            borderColor: ['rgb(222, 70, 70)','rgb(247,96,2)','rgb(251,255,43)','rgb(78,92,244)'],
                                            data: [
                                            	<c:forEach items="${ccnt}" var="dto">
                                            	${dto.cnt}, 
                                            	</c:forEach>
                                            	]
                                        }]                                
                                    },

                                    // Configuration options go here
                                    options: {
                                    	layout: {
                                            padding: {
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 20
                                            }
                                        },                                        
                                    	
								        scales: {
								            yAxes: [{
								                ticks: {
								                    beginAtZero: true
								                }
								            }]
								        }
								    }
                                });
                                
                                </script>
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="card">
							<div class="graph-title">지원자 성별 현황</div>
							<div class="card-content">
								<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
								<div class="card-body pb-0">
									<c:if test="${gcnt.size()!=0 }">
									<canvas id="gender"></canvas>
									</c:if>
									<c:if test="${gcnt.size()==0 }">
									지원자가 없습니다.
									</c:if>
								</div>
							</div>
							<script>
                                var ctx = document.getElementById('gender').getContext('2d');
                                var chart = new Chart(ctx, {
                                    // The type of chart we want to create
                                    type: 'pie',

                                    // The data for our dataset
                                    data: {
                                        labels: [
                                        	<c:forEach items="${gcnt}" var="dto">
                                        	'${dto.gender}', 
                                        	</c:forEach>
                                        	],
                                        datasets: [{
                                            label: '지원자 성별 현황',
                                            backgroundColor: ['rgb(222, 70, 70)','rgb(78,92,244)'],
                                            borderColor: ['rgb(222, 70, 70)','rgb(78,92,244)'],
                                            data: [ 
                                            	<c:forEach items="${gcnt}" var="dto">
                                        		'${dto.cnt}', 
                                        		</c:forEach>
                                        		]
                                        }]
                                    },

                                    // Configuration options go here
                                    options: {
                                    	layout: {
                                            padding: {
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 20
                                            }
                                        }
                                    }
								        
                                });
                                </script>
						</div>
					</div>
					<div class="col-md-4 col-12">
						<div class="card">
							<div class="graph-title">지원자 학력 현황</div>
							<div class="card-content">
								<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
								<div class="card-body pb-0">
									<c:if test="${ecnt.size()!=0 }">
									<canvas id="education"></canvas>
									</c:if>
									<c:if test="${ecnt.size()==0 }">
									지원자가 없습니다.
									</c:if>									
								</div>
							</div>
							<script>
                                var ctx = document.getElementById('education').getContext('2d');
                                var chart = new Chart(ctx, {
                                    // The type of chart we want to create
                                    type: 'bar',

                                    // The data for our dataset
                                    data: {
                                        labels: [
                                        	<c:forEach items="${ecnt}" var="dto">
                                        	'${dto.education}', 
                                        	</c:forEach>
                                        	],
                                        datasets: [{
                                            label: '지원자 학력 현황',
                                            backgroundColor: ['rgb(222, 70, 70)','rgb(247,96,2)','rgb(251,255,43)','rgb(78,92,244)'],
                                            borderColor: ['rgb(222, 70, 70)','rgb(247,96,2)','rgb(251,255,43)','rgb(78,92,244)'],
                                            data: [
                                            	<c:forEach items="${ccnt}" var="dto">
                                            	${dto.cnt}, 
                                            	</c:forEach>
                                            	]
                                        }]
                                    },

                                    // Configuration options go here
                                    options: {
                                    	layout: {
                                            padding: {
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 20
                                            }
                                        }
                                    	,
								        scales: {
								            yAxes: [{
								                ticks: { 
								                    beginAtZero: true
								                }
								            }]
								        }
								    }
                                    
                                });
                                </script>
						</div>
					</div>
				</div>	
				<c:if test="${logintype=='enterprise'}">
				<div class="row"> <!-- 합격자 -->
					<div class="col-md-12 col-12">
						<div class="card">
							<div id = "passtitle" class="content-header-title  mb-0">합격자 정보</div>
							<div class="card-content">
								<div class="card-body pb-0">
									<div class="table-responsive col-sm-12">
										<table class="table data-list-view">
											<thead>
												<tr>
													<th>이름</th>
													<th>성별</th>
													<th>학력</th>
													<th>경력</th>
													<th>MBTI</th>
													<th>Holland</th>
													<th>인적성</th>
													<th>기술면접</th>
													<th>합격여부</th>
													<th>이력서보기</th>
												</tr>
											</thead>
											<tbody>
												<%-- <c:forEach items="${clist }" var="dto"> --%>
													<tr>
														<td class="name">박헌정</td>
														<td class="gender">남자</td>
														<td class="education">대학교(4년)졸업</td>
														<td class="careeer">2년</td>
														<td class="mbti">ESTJ</td>
														<td class="holland">R</td>
														<td class="humanity">90</td>
														<td class="skill">90</td>
														<td class="pass">합격</td>
														<td class="resume"><a href="/desket/mypage/member/resume/resumeview.do?id=qkrgjswjd100&seq=1">보기</a></td>
													</tr>
												<%-- </c:forEach> --%>
											</tbody>
										</table>
									</div>	
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<%-- <c:if test="${logintype == 'enterprise' }">
					<div>
						<input type="button" value="삭제하기" onclick="location.href='/desket/mypage/enterprise/del.do?seq=${adto.seq}'"
							class="form-control col-1 float-right" />
					</div>
					
					<div>
						<input type="button" value="돌아가기" onclick="location.href='/desket/mypage/enterprise/announcelist.do'"
							class="form-control col-1 float-right" style="margin-right: 15px;" />
					</div>
					<div>
						<input type="button" id="btn1" name="btn1" value="피드백 받기" onclick="location.href='/desket/mypage/enterprise/feedback.do?seq=${adto.seq}'"
							class="form-control col-1 float-right" style="margin-right: 15px;" />
					</div>
				</c:if> --%>
				
				
				
				<div class="row">
					<div class="col-sm-12" style="text-align: center;">
						<table class="table table-striped">
							<thead style="color: #fff; background-color: #7367F0">
								<tr>
									<th colspan='2'>지도</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2"> 
										<div id="container" style="border:1px solid black; width: 100%; height: 500px"></div>
									</td>
								</tr>
								
							</tbody>
						</table>								
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal">지원하기
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
					<div class="modal-header">
						<!-- 우측 상단 나가기 버튼(템플릿과 겹쳐서 깨짐)
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button> 
						-->
						<h4 class="modal-title" id="myModalLabel" style="margin: 0 auto; font-weight: bold;"></h4>
					</div>
				
					<div class="modal-body" id="modalContent">
						<div style="text-align:center; margin: 30px 0px;">
							<input type="button" value="MBTI" id="MBTITest" class="btn" style="background-color: #ddd; color: black;">
							<input type="button" value="홀랜드" id="hollandTest" class="btn" style="background-color: #666; color: white;">
							<input type="button" value="인적성" id="humanityTest" class="btn" style="background-color: #666; color: white;">
							<input type="button" value="기술" id="skillTest" class="btn" style="background-color: #666; color: white;">
						</div>
						
					
						<form id="testForm">
							<div id="test">
								<div id="emptyForm">
								
									
									
								</div>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="close">나가기</button>
							<button type="button" class="btn btn-primary" id="submit">제출하기</button>
						</div>
					</form>
					
					<!-- hidden태그로 구직자 번호, 공고글 번호 등 함께 전달 -->
			</div>
		</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- Content -->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Footer-->
	<jsp:include page="/inc/home/assetbottom.jsp"></jsp:include>
	<!-- END: Footer-->
	<!-- BEGIN: Vendor JS-->
	<script src="/desket/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script src="/desket/app-assets/vendors/js/charts/apexcharts.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="/desket/app-assets/js/core/app-menu.js"></script>
	<script src="/desket/app-assets/js/core/app.js"></script>
	<script src="/desket/app-assets/js/scripts/components.js"></script>
	<script src="/desket/app-assets/js/scripts/cards/card-analytics.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->



	<!-- END: Page JS-->
</body>
</html>