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
    <style type="text/css">
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
  margin-right: 600px;
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



</style>
		<script>
		 function del(){
		      if (confirm("삭제하시겠습니까?")) document.form.submit();
		    
		    }

  </script>
        <meta charset="utf-8">
        <title>${object.title} - ${object.writer}</title>
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
    </head>
    <body>
<!-- <div class="content-wrapper"> -->
            <div class="inner-container container">
                <div class="row">
                    <div class="section-header col-md-4">
                        <h2>${object.title}</h2>
                        <span>${object.writer}</span>
                        <p>등록일 : <fmt:formatDate value="${object.regdate}" pattern="MM.dd.hh.mm"></fmt:formatDate></p>
                         <p>조회수 : ${object.readhit } </p> 
                      
                    </div> <!-- /.section-header -->
               <!--  </div> /.row -->
                <!-- <div class="project-detail row"> -->
                   <!--  <div class="project-slider col-md-12"> -->
                  
                      <!--   <a href="#" class="slidesjs-previous slidesjs-navigation">&lt;</a> 
                        <a href="#" class="slidesjs-next slidesjs-navigation">&gt;</a>  -->
                    </div> <!-- /.project-slider -->
                    <div class="project-infos col-md-12">
                        <div class="box-content">
                            
                            
                            ${object.content}
                          <!--  
                            <ul class="project-meta">
                                <li><i class="fa fa-folder-open"></i>Photography</li>
                                <li><i class="fa fa-calendar-o"></i>31 October 2084</li>
                                <li><i class="fa fa-envelope-o"></i><a href="mailto:info@company.com">info@company.com</a></li> 
                            </ul> -->
                            <!-- reply -->
                            <div>
		<form action="infomationComWrite.mtg" method="post" >
			<table>
				<tr>
					<td height="100px">
					<textarea style="background-color:white; width:500px; height:80px; color:black;" name="content" cols="100" rows="10"></textarea></td>
				</tr>
				<tr>
					<td align="right">
						<input type="hidden" name="writer" value="${object.writer}"/> 
						<input type="hidden" name="num" value="${object.num}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글쓰기" onclick="form.submit()"></input>
					</td>
				</tr>
			</table>
		</form>
	</div>
                            <div align="center" style="margin-bottom: 400px;">
		 <table  style="color:black">
			<c:forEach var="infoCom" items="${infoCom}" varStatus="stat">

				<tr bgcolor="#ffffff" align="center">
					<td align="left" width="470">${infoCom.content} </td>
					<td align="center" width="70"> ${infoCom.writer}</td>
					<td colspan="1" width="70" align="center">
					<fmt:formatDate value="${infoCom.regdate}" pattern="MM.dd"></fmt:formatDate>
					</td>
					<c:if test="${sessionScope.mem.mem_nickname eq infoCom.writer}" >
					
					<td><a href="InformationComDelete.mtg?comment_num=${infoCom.comment_num}&num=${infoCom.num}&num=${object.num}">삭제</a></td>
					</c:if>
				</tr>
			
				<tr bgcolor="#777777">
					<td height="1" colspan="100"></td>
				</tr>
			</c:forEach>
		</table>
		
		<br/> 
		    <form id="form" name="form" method="post" action="/mtg/IndformationDelete.mtg">
      <input type="hidden" id="num" name="num" value="${object.num}" />
    </form>
		  <div align="center" width= "800px">
      <c:if test="${sessionScope.session_member_name eq object.writer}">
	
     <button type="button" onclick="del()">삭제</button>
      <a href="/mtg/InformationWrite.mtg?num=${object.num}">수정</a>
   
     
     
   	
  
			</c:if>
     
      <a href="/mtg/InformationList.mtg">목록</a>
      </div>
      
                        </div> <!-- /.box-content -->
                    </div> <!-- /.project-infos -->
                </div> <!-- /.project-detail -->
            </div> <!-- /.inner-content -->
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
    