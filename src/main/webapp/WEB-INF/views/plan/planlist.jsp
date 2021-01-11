<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" href="./resources/list/css/community-styles.css"> 
        <script type="text/javascript"
	src="/mtg/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/mtg/resources/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="/mtg/resources/css/style.css" />
	<script language="javascript"> 
 
function OpenWindow(url,intWidth,intHeight) { 
      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1, directories=no, channelmode=yse") ; 
} 
</script> 
<script type="text/javascript">
$("#register_form").click(function() {
	$(".user_register").show();
	
	return false;
});
	</script> 

		<script>
    function del(idx) {
    	jQuery.ajax({
  	      type : 'POST' ,
            url : '/mtg/delete.mtg' ,
            data : 'idx=' + idx
        }).done(function(data) {
        	location.reload();
           var message = jQuery(data).find("message").text();
           var error = jQuery(data).find("error").text();
 	      alert(message);
 	      if (error == 'false') location.href = './';
        });
    }

  </script>
  
  </head>
  <body>
  
<div id="community">
  <div class="community-top">
    <div class="top-img">
      <img src="./resources/image/notice/notice.png" onclick="location.href='./write.mtg"/>
      <div class="img-black"></div>
    </div>
	<div class="country-name-select">
      <h2>여행일정 만들기</h2>
      <form id="form_search" method="get" action="/mtg/planReg.mtg">
          <select id="sch_type" name="sch_type">
	   <option value="subject" selected="selected">제목</option>
	   <option value="content">내용</option>
	   <option value="content2">내용2</option>
	   <option value="user_name">작성자</option>
	</select> 
      <div class="country-name">
 
        <input type="text" value="" id="sch_value" name="sch_value" value="${mapSearch.sch_value}" placeholder="여행 정보를 찾아보세요." onclick="search();">
      </div>
      </form>
    </div>
    </div>
 
  <div class="content-wrapper">
            <div class="inner-container container">
                <div class="row">
                    <div class="section-header">
                        <h2>여행 책자</h2>
                        <span>여행의 일정 계획</span>
                        <span><img src="./resources/postWriteForm.png" onclick="location.href='./write.mtg'" ></span>
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->
              
                    <div class="projects-holder">
                        <div class="row">
 
 
                        <c:forEach var="list" items="${list}" varStatus="stat">
                            <div class="col-md-4 project-item mix">
                                <div class="project-thumb">
                                    ${list.content}
                                    <div class="overlay-b">
                                    <div class="overlay-inner">
                                    <a href="/mtg/planview.mtg?idx=${list.idx}" class="fancybox fa fa-expand" title="상세보기"></a>
                                    <input type="hidden" id="idx" name="idx" value="${list.idx}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="/mtg/planview.mtg?idx=${list.idx}">${list.subject}</a></h2>
                                     <input type="hidden" id="idx" name="idx" value="${list.idx}" />
                                    <img src="./resources/image/list/Recommand.png" class="alignleft" width="25" onclick="likeArticle(${list.idx})" style="float:left;" >${list.planlike}<p style="float:right;">${list.user_name}님</p>
                                 
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
	   

			function likeArticle(idx) {
				jQuery.ajax({
					type : 'POST' ,
			     url : '/mtg/like.mtg',
				 data : 'idx=' + idx
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