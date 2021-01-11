<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8"/>
<title>스프링프레임워크 게시판</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/mtg/resources/ckeditor/ckeditor.js"></script>
<script src="/mtg/resources/ckeditor/config.js"></script>

<link rel="stylesheet" type="text/css"
	href="/mtg/resources/css/planreg.css">

</head>
<body>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	<script>
            $(function() {
                
            
                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());

                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                //시작일.
                $('#fromDate').datepicker({
                    showOn: "focus",                     // 달력을 표시할 타이밍 (both: focus or button)
                    // 버튼 이미지
                              // 버튼 이미지만 표시할지 여부
                             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#toDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });

                //종료일
                $('#toDate').datepicker({
                    showOn: "focus", 
                     
                 
                   
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    //minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                      // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });
            
           
        </script>
          <table align="center" width= "800px">
          <tr align="center">
	  <td colspan="1" height="25">
	<div>
		오늘 날짜 : <span id="today"></span>
		<form>
			<label for="fromDate">여행시작!</label> <input type="text" name="fromDate"
				id="fromDate"> ~ <label for="toDate">여행끝!</label> <input
				type="text" name="toDate" id="toDate">
		<input type="button" onclick="calculator()" value="on">
		</form>
		
		
	</div></td></tr></table>
	<script> 
 function calculator(){
	 var from= document.getElementById('fromDate').value.split("-");	
	 var to= document.getElementById('toDate').value.split("-");	
var t = new Date(from[0], from[1] - 1, from[2]);
var f = new Date(to[0], to[1] - 1, to[2]);

var interval = f - t;
var days = interval/24/60/60/1000;


alert(days);


switch(days){
case 2: document.getElementById('con1').style.display = "block";
      break;

case 3: document.getElementById('con1').style.display = "block";
      document.getElementById('con2').style.display = "block";
      break;
case 4: document.getElementById('con1').style.display = "block";
document.getElementById('con2').style.display = "block";
document.getElementById('con3').style.display = "block";
break;
default : alert("fail");
} 

}
 </script>










	<table align="center" width= "800px" style="margin-top:10px">
	  <tr align="center" bgcolor="#ffffff">
	  <td colspan="3" height="400">
	<div id="test" class="map_wrap">
	<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=825281be88892b4544b286069fd9f6f7&libraries=services"></script>
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<script>
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
    
</script>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<p>
				<form onsubmit="searchPlaces(); return false;">
					키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
					<button type="submit">검색하기</button>
				</form>
				</p>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<script src="/mtg/resources/js/plan.map2.js"></script>

	<div id="addmap" style="width: 100%; height: 350px; display: none"></div>
	
	<div>
		<input type="button" id="button" value="resultmap" onclick="show()">
	</div>

	</td></tr></table>

	<script src="/mtg/resources/js/plan.map.js"></script>


	<form name="shit" method="post" action="/mtg/write_ok.mtg">
		<input type="hidden" id="idx" name="idx" value="${object.idx}" /> <input
			type="hidden" id="user_name" name="user_name"
			value="${object.user_name}" />
		<table align="center" width= "800px" style="margin-top:10px">
	 
		<div>
		 <tr align="center">
	  <td colspan="3" height="20">
			<span>제목</span> <input type="text" id="subject" name="subject"
				value="${object.subject}" />
		</td></tr></div>
		
		<tr align="center">
	  <td colspan="3" height="300">
		<div>
		
			<span>메인 여행일정 등록</span>
			<textarea id="cont" name="content" rows="10" cols="20">${object.content}</textarea>
		</div>

		<div id="con1" style="display: none">
		
			<span>세부 여행일정 등록</span>
			<textarea id="cont1" name="content2" rows="10" cols="20">${object.content2}</textarea>
			
		</div>

		<div id="con2" style="display: none">
		
			<span>세부 여행일정 등록2</span>
			<textarea id="cont2" name="content3" rows="10" cols="20">${object.content3}</textarea>

		</div>

		<div id="con3" style="display: none">
		
			<span>세부 여행일정 등록3</span>
			<textarea id="cont3" name="content4" rows="10" cols="20">${object.content4}</textarea>
		
		</div>

		<div id="con4" style="display: none">
		
			<span>세부 여행일정 등록4</span>
			<textarea id="cont4" name="content5" rows="10" cols="20">${object.content5}</textarea>
	
		</div>
	
		<div>
			<input type="hidden" id="maplat" name="maplat"
				value="${object.maplat}" />
		</div>

		<div>
			<input type="hidden" id="maplng" name="maplng"
				value="${object.maplng}" />
		</div>

		<div>
			<button id="save" onclick="showe();">저장</button>
			<a href="/mtg/planReg.mtg">목록</a>
		</div>

	</form></td></tr>
		</table>

	<script language="javascript">
window.onload = function ()
{
	 iddx ="${object.idx}";
	  if (iddx > 0) document.shit.action = '/mtg/planUpdate.mtg';
	  else document.shit.idx.value = 0;
	  var session_obj= '<%=session.getAttribute("session_member_name")%>';

			document.shit.user_name.value = session_obj;
			
		}
	</script>
</body>




</html>