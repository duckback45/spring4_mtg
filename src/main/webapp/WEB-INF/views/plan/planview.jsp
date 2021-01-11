<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
    <style type="text/css">

.title {
	color: white;
	position: absolute;
	top: 170px;
	margin-left: 800px;
	font-size: 80px
}

.img {
	width: 100%;
	height: 300px;
	background-image: url('./resources/image/notice/notice.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 70px
}

.container {
  margin-right: auto;
  margin-left: auto;
  padding-left: 15px;
  padding-right: 15px;
}
.container:before, .container:after {
  content: " ";
  display: table;
}
.container:after {
  clear: both;
}
@media (min-width: 600px) {
  .container {
    width: 600px;
  }
}
@media (min-width: 600px) {
  .container {
    width: 600px;
  }
}
@media (min-width: 600px) {
  .container {
    width: 600px;
  }
}

.container-fluid {
  margin-right: auto;
  margin-left: auto;
  padding-left: 15px;
  padding-right: 15px;
}
.container-fluid:before, .container-fluid:after {
  content: " ";
  display: table;
}
.container-fluid:after {
  clear: both;
}
.menubar {
	margin-left: -40px;
	margin-top: 10px;
}

.list {
	float: left;
	margin-right: 15px;
}

li {
	list-style: none;
}

#logo {
	margin: 10px;
	margin-top: -5px;
	float: left;
	height: 45px;
}

.menubar a {
	margin-left: 20px;
	margin-top: 10px;
	font-weight: bold;
	font-size: 15pt;
	color: gray;
	cursor: pointer;
	text-decoration: none;
}
</style>
<meta charset="utf-8">
        <title>${object.subject} - ${object.user_name}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900">
        <!--
        Artcore Template
		http://www.templatemo.com/preview/templatemo_423_artcore
        -->
        <!--  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900"> -->
 	<!-- 	<link rel="stylesheet" href="./resources/list/css/bootstrap.css"> -->
        <link rel="stylesheet" href="./resources/list/css/font-awesome.css">
        <link rel="stylesheet" href="./resources/list/css/animate.css"> 
        <link rel="stylesheet" href="./resources/list/css/templatemo-misc.css">
        <link rel="stylesheet" href="./resources/list/css/templatemo-style.css">
        <script type="text/javascript" src="./resources/js/jquery-1.11.0.min.js"></script>
		  <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=825281be88892b4544b286069fd9f6f7&libraries=services"></script>
  </head>
  <body>
       	
    <script>
    function del(){
      if (confirm("삭제하시겠습니까?")) document.form.submit();
    }
    </script>

    
      <div class="inner-container container">
                <div class="row">
                    <div id="div1" class="section-header col-md-4">
                        <h2>${object.subject}</h2>
                        <span>${object.user_name}</span>
                         <p>등록일 : ${object.reg_datetime}</p>
                         <p>조회수 : ${object.read_count}</p>                        
                    </div> <!-- /.section-header -->
               <!--  </div> /.row -->
                <!-- <div class="project-detail row"> -->
                   <!--  <div class="project-slider col-md-12"> -->
                  
                      <!--   <a href="#" class="slidesjs-previous slidesjs-navigation">&lt;</a> 
                        <a href="#" class="slidesjs-next slidesjs-navigation">&gt;</a>  -->
                    </div> <!-- /.project-slider -->
                    <div class="project-infos col-md-12">
                   
                    <c:if test="${object.maplat != null}">
                     <table align="center" width= "800px" style="margin-top:50px">
                    <tr align="center" bgcolor="#ffffff">
                    <td colspan="3" height="400">
                    <div id="addmap" style="width:100%;height:100%;padding:25px;display:block"></div>
   					 </td></tr></table>
   					 </c:if>
   					
  <script>
  		var a = Array();
  		var b = Array();
  		a=('${object.maplat}').split("/"); 
  		b=('${object.maplng}').split("/"); 
  		
  	  bounds = new daum.maps.LatLngBounds(); 
	var addmapContainer = document.getElementById('addmap'), // 지도를 표시할 div  
	    addmapOption = { 
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		var linePath = [];
	var addmap = new daum.maps.Map(addmapContainer, addmapOption); // 지도를 생성합니다
	 
	// 마커 이미지의 이미지 주소입니다
	 var imageSr = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < a.length; i ++) {
		var placePos = new daum.maps.LatLng(a[i],b[i]);
	    // 마커 이미지의 이미지 크기 입니다
	    linePath.push(new daum.maps.LatLng(a[i],b[i]));
	     bounds.extend(placePos);
	    var imageSiz = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerIma = new daum.maps.MarkerImage(imageSr, imageSiz); 
	     bounds.extend(placePos); 

	    // 마커를 생성합니다
	   var marke = new daum.maps.Marker({
	        // 마커를 표시할 지도
	        position: placePos, // 마커를 표시할 위치
	        // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerIma // 마커 이미지 
	    });
	    marke.setMap(addmap);
	}
 
	//지도에 표시할 선을 생성합니다
	 var polyline = new daum.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	polyline.setMap(addmap);
	addmap.setBounds(bounds);
	document.getElementById('addmap').style.display = "block";
   
  </script>
   <table align="center" width= "800px" style="margin-top:50px">
                    <tr align="center" bgcolor="#ffffff">
                    <td colspan="3" height="400">
                        <div id="div2" class="box-content">                                                  
                           ${object.content2}                        
                        </div> <!-- /.box-content -->
                        </td></tr>
                        <c:if test="${object.content3 != null}">
                        <tr HEIGHT="25"> </tr>
                        <tr align="center" bgcolor="#ffffff">
                    <td colspan="3" height="400">
                        <div class="box-content">                                                  
                           ${object.content3}                        
                        </div> <!-- /.box-content -->
                        </td></tr>
                        </c:if>
                        <tr HEIGHT="25"> </tr>
                         <c:if test="${object.content4 != null}">
                         <tr align="center" bgcolor="#ffffff">
                    <td colspan="3" height="400">
                        <div class="box-content">                                                  
                           ${object.content4}                        
                        </div> <!-- /.box-content -->
                        </td></tr>
                         </c:if>
                        <tr HEIGHT="25"> </tr>
                         <c:if test="${object.content5 != null}">
                         <tr align="center" bgcolor="#ffffff">
                    <td colspan="3" height="400">
                        <div class="box-content">                                                  
                           ${object.content5}                        
                        </div> <!-- /.box-content -->
                         </td></tr></c:if>
                         
                         </table>
                             <form id="form" name="form" method="post" action="/mtg/delete.mtg">
      <input type="hidden" id="idx" name="idx" value="${object.idx}" />
    </form>
     
     
   	  <div id="div3" align="center" width= "800px">
      <c:if test="${sessionScope.session_member_name == object.user_name}">
      <button type="button" onclick="del()">삭제</button>
      <a href="/mtg/write.mtg?idx=${object.idx}">수정</a>
      </c:if>
      <a href="/mtg/planReg.mtg">목록</a>
      </div>
                    </div> <!-- /.project-infos -->
                </div> <!-- /.project-detail -->
            </div> <!-- /.inner-content2 -->
        </div> <!-- /.content-wrapper -->

        <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Preloader -->
        <script type="text/javascript">
            //<![CDATA[
            $(window).load(function() { // makes sure the whole site is loaded
                $('.loader-item').fadeOut(); // will first fade out the loading animation
                    $('#pageloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
                $('body').delay(350).css({'overflow-y':'visible'});
            })
            //]]>
        </script>
    
    
    
    
    
    
    
     
      

  </body>
</html>