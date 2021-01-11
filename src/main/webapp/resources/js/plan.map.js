  var ckeditor_config = {
         resize_enabled : false, // 에디터 크기를 조절하지 않음
         enterMode : CKEDITOR.ENTER_BR , // 엔터키를 <br> 로 적용함.
         shiftEnterMode : CKEDITOR.ENTER_P ,  // 쉬프트 +  엔터를 <p> 로 적용함.
         toolbarCanCollapse : true , 
         removePlugins : "elementspath", // DOM 출력하지 않음
         filebrowserUploadUrl: '/mtg/file_upload.mtg', // 파일 업로드를 처리 할 경로 설정.

         // 에디터에 사용할 기능들 정의
         toolbar : [
           [ 'Source', '-' , 'NewPage', 'Preview' ],
           [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
           [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
           [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
           '/',
           [ 'Styles', 'Format', 'Font', 'FontSize' ],
           [ 'TextColor', 'BGColor' ],
           [ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink'],
           ]

		
       };
    
  
   
    var editor = null;
    var editor1 = null;
    var editor2 = null;
    var editor3 = null;
    var editor4 = null;
    var editor5 = null;
    

    jQuery(function() {
    	// ckeditor 적용
      editor = CKEDITOR.replace( "cont" , ckeditor_config );
      editor1 = CKEDITOR.replace( "cont1" , ckeditor_config );
      editor2 = CKEDITOR.replace( "cont2" , ckeditor_config );
      editor3 = CKEDITOR.replace( "cont3" , ckeditor_config );
      editor4 = CKEDITOR.replace( "cont4" , ckeditor_config );
      editor5 = CKEDITOR.replace( "cont5" , ckeditor_config );
    });
   
 // 전송을 위한 체크 함수
	function form_save(form1) {
		editor.updateElement();
		editor1.updateElement();
		editor2.updateElement();
		editor3.updateElement();
		editor4.updateElement();
		editor5.updateElement();
	    if (is == true) {
	    	  jQuery.ajax({
	    	      type : 'POST' , 
	    	      url : '/mtg/write_ok.mtg' ,
	    	      data : jQuery('#form1:input').serialize()
	    	      }).done(function(data) {
	    	      var message = jQuery(data).find("message").text();
	    	      var error = jQuery(data).find("error").text();
	    	      alert(message);
	    	      if (error == 'false') location.href = './';
	    	      });
	    	  }
	}

		
	$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileview tr').children().length;      
        $('#fileview').append(
                '<tr><td>'+
                '   <input type="file" name="files['+ fileIndex +']" />'+
                '</td></tr>');
    });     
});