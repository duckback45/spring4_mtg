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
<link type="text/css" rel="stylesheet" href="/mtg/resources/css/style.css" />
        
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
	<style type="text/css">
		.title {
	color: white;
	position: absolute;
	top: 170px;
	margin-left: 580px;
	font-size: 80px
}

.img {
	width: 100%;
	height: 300px;
	background-image: url('./resources/image/review/review.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 70px
}

	</style> 
    </head>
    <body>
   <div class="content-wrapper">
   
   <div class="img">
		<span class="title">여행기</span>
	</div>
   
            <div class="inner-container container">
                <div class="row">
                    <div class="section-header">
                        <img src="./resources/postWriteForm.png" onclick="location.href='reviewWriteForm.mtg'" >
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->
               
                    <div class="projects-holder">
                        <div class="row">
                        <c:forEach var="list" items="${getReviewList}" varStatus="stat">
                            <div class="col-md-4 project-item mix">
                                <div class="project-thumb">
                                    ${list.main_img}
                                    <div class="overlay-b">
                                    <div class="overlay-inner">
                                    <a href="reviewView.mtg?num=${list.num }" class="fancybox fa fa-expand" title="상세보기"></a>
                                    
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <p style="font-weight: bold;">${list.title}</p>
                                    <p style="text-align: right;">작성자 : ${list.writer}</p>
                                </div>
                            </div> <!-- /.project-item -->
                            </c:forEach>
                        </div> <!-- /.row -->
                       <!--  <div class="load-more">
                            <a href="javascript:void(0)" class="load-more">Load More</a>
                        </div> -->
                    </div> <!-- /.projects-holder -->
            </div> <!-- /.inner-content -->
        </div> <!-- /.content-wrapper -->

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
