<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    
        <meta charset="utf-8">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900">
 		<link rel="stylesheet" href="./resources/list/css/bootstrap.css">
        <link rel="stylesheet" href="./resources/list/css/font-awesome.css">
        <link rel="stylesheet" href="./resources/list/css/animate.css"> 
        <link rel="stylesheet" href="./resources/list/css/templatemo-misc.css">
        <link rel="stylesheet" href="./resources/list/css/templatemo-style.css">
        <script type="text/javascript" src="/mtg/resources/js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript"
	src="/mtg/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/mtg/resources/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="/mtg/resources/css/style.css" />
	<link rel="stylesheet" href="./resources/list/css/community-styles.css"> 
        
<script language="javascript"> 
 

</script> 
<script type="text/javascript">
$("#register_form").click(function() {
	$(".user_register").show();
	
	return false;
});
	</script> 
    </head>
    <body>
   <div id="community">
  <div class="community-top">
    <div class="top-img">
      <img src="https://wishbeen.akamaized.net/images/community-banner-01.png" onclick="location.href='./InformationWrite.mtg"/>
      <div class="img-black"></div>
    </div>
	<div class="country-name-select">
      <h2>여행정보 공유</h2>
      <form id="form_search" method="get" action="/mtg/InformationList.mtg">
          <select id="sch_type" name="sch_type">
	   <option value="title" selected="selected">제목</option>
	   <option value="content">내용</option>
	   <option value="content2">내용2</option>
	   <option value="writer">작성자</option>
	</select> 
      <div class="country-name">
 
        <input type="text" value="" id="sch_value" name="sch_value" value="${mapSearch.sch_value}" placeholder="여행 정보를 찾아보세요." onclick="search();">
      </div>
      </form>
    </div>
    </div>
    
    
   <%--  <div class="img">
		 <form id="form_search" method="get" action="/mtg/InformationList.mtg">
		<div class="title">
	<select id="sch_type" name="sch_type">
	   <option value="title" selected="selected">제목</option>
	   <option value="content">내용</option>
	   <option value="content2">내용2</option>
	   <option value="writer">작성자</option>
	</select>
	<input type="text" id="sch_value" name="sch_value" value="${mapSearch.sch_value}"/>
	<button type="button" onclick="search();">검색</button>
	</div>
	</form>
	</div> --%>
   <div class="content-wrapper">
            <div class="inner-container container">
                <div class="row">
                    <div class="section-header">
                        <h2>정보 커뮤니티</h2>
                        <span>여행의 정보가 한곳에</span>
                        
                         <span><img src="./resources/postWriteForm.png" onclick="location.href='./InformationWrite.mtg'" ></span>
                        
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->
               
                    <div class="projects-holder">
                        <div class="row">
                        <!-- 여행기 -->
         <%--                <c:forEach var="item" items="${list}" varStatus="status">
-   <tr>
        <td><button onclick="del(${item.idx});">${item.idx} 삭제</button></td>
        <td><a href="/mtg/${item.idx}.mtg">${item.subject}</a></td>
        <td>${item.user_name}</td>
        <td>${item.reg_datetime}</td>
        <td>${item.read_count}</td>
        <td><button onclick="likeArticle(${item.idx})">좋아요 :${item.planlike}</button>
    </tr>
    </c:forEach>  --%>
    
                        <c:forEach var="list" items="${list}" varStatus="stat">
                            <div class="col-md-4 project-item mix">
                                <div class="project-thumb">
                                    ${list.main_img}
                                    <div class="overlay-b">
                                    <div class="overlay-inner">
                                     <a href="/mtg/information${list.num}.mtg" class="fancybox fa fa-expand" title="상세보기"></a>
                                    
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                 <h2>${list.title}</a></h2>
                                   <img src="./resources/image/list/Recommand.png" class="alignleft" width="25" onclick="likeArticle(${list.num})" style="float:left;" >${list.count}<p style="float:right;">${list.writer}님</p>
                                    
                                </div>
                            </div> <!-- /.project-item -->
                            </c:forEach>
                            
                           
                            
                        </div> <!-- /.row -->
                        <div class="load-more">
                            <a href="javascript:void(0)" class="load-more">Load More</a>
                        </div>
                    </div> <!-- /.projects-holder -->
                </div> <!-- /.projects-holder-2 -->
            </div> <!-- /.inner-content -->
        </div> <!-- /.content-wrapper -->
        <script>
	   function search() {
	        var sch_value = jQuery('#form_search #sch_value').val();
	        if (sch_value == '') { }
	        else {
	             jQuery('#form_search').submit();
	        }
	   }
	   jQuery('#form_search #sch_type value').val('${mapSearch.sch_type}');
	   

			function likeArticle(num) {
				jQuery.ajax({
					type : 'POST' ,
			     url : '/mtg/informationLike.mtg',
				 data : 'num=' + num
			 }).done(function(data) {
		        	location.reload();
		       });
			}
		</script>

        <script src="./resources/list/js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="./resources/list/js/plugins.js"></script>
        <script src="./resources/list/js/main.js"></script>
        
        <!-- Preloader -->
        <script type="text/javascript">
            //<![CDATA[
            $(window).load(function() { 
                $('.loader-item').fadeOut(); 
                    $('#pageloader').delay(350).fadeOut('slow');
                $('body').delay(350).css({'overflow-y':'visible'});
            })
            //]]>
        </script>

    </body>
</html>
