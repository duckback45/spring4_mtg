<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <!-- ckediter -->
 <script src="/mtg/resources/ckeditor/ckeditor.js"></script>
    <script src="/mtg/resources/ckeditor/config.js"></script>  
  </head>
  <body>
	  
	<script>
		// ckeditor setting
		

   
    var editor = null;
    
   
	
	// 전송을 위한 체크 함수
	function form_save(form) {
		editor.updateElement();
	  
	    if (is == true) {
	    	  jQuery.ajax({
	    	      type : 'POST' , 
	    	      url : '/mtg/InformationWrite_ok1.mtg' ,
	    	      data : jQuery('#form:input').serialize()
	    	      }).done(function(data) {
	    	      var message = jQuery(data).find("message").text();
	    	      var error = jQuery(data).find("error").text();
	    	      alert(message);
	    	      if (error == 'false') location.href = './';
	    	      });
	    	  }
	}
	
	
	</script>

    <form id="form" method="post" action="/mtg/InformationWrite_ok1.mtg">
    
   
    <div>
    <span>내용</span>
    <textarea id="content" name="content" rows="10" cols="20">${object.content}</textarea>
    </div>

    <div>
    <input type="submit" id="save" onclick="form_save('#form');">저장</input>
    <a href="/mtg/InformationList.mtg">목록</a>
    </div>
    
    </form>
 
  </body>
</html>