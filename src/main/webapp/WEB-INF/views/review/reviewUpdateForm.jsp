<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행기 수정</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="/mtg/resources/ckeditor/ckeditor.js"></script>
<script src="/mtg/resources/ckeditor/config.js"></script>

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
	<script>
		// ckeditor setting

		var ckeditor_config = {
			resize_enabled : false, // 에디터 크기를 조절하지 않음
			enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
			shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
			toolbarCanCollapse : true,
			removePlugins : "elementspath", // DOM 출력하지 않음
			filebrowserUploadUrl : '/mtg/reviewfile_upload.mtg', // 파일 업로드를 처리 할 경로 설정.

			// 에디터에 사용할 기능들 정의
			toolbar : [
					/* [ 'Source', '-', 'NewPage', 'Preview' ],
					[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
					[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript',
							'Superscript' ],
					[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
							'JustifyBlock' ],
					'/', */
					[ 'Styles', 'Format', 'Font', 'FontSize' ],
					[ 'TextColor', 'BGColor' ],
					[ 'Image', 'Flash', 'Table', 'SpecialChar', 'Link',
							'Unlink' ], ]

		};

		var editor = null;

		jQuery(function() {
			// ckeditor 적용
			editor = CKEDITOR.replace("cont", ckeditor_config);
			editor2 = CKEDITOR.replace("main_img", ckeditor_config);
		});

		// 전송을 위한 체크 함수
		function form_save(form) {
			editor.updateElement();
			editor2.updateElement();
			if (is == true) {
				jQuery.ajax({
					type : 'POST',
					url : '/mtg/reviewUpdate.mtg',
					data : jQuery('#form:input').serialize()
				}).done(function(data) {
					var message = jQuery(data).find("message").text();
					var error = jQuery(data).find("error").text();
					alert(message);
					if (error == 'false')
						location.href = './';
				});
			}
		}
	</script>
	
		<div class="img">
			<span class="title">여행기</span>
		</div>
	
	<form action="reviewUpdate.mtg" method="post"
		onsubmit="return validation();">
		<input type="hidden" name="num" value="${review.num}" />
		 <input type="hidden" name="regdate" value="${review.regdate}" />

		<table align="center">
			<tr align="center" bgcolor="#ffffff">
				<td width="200" height="30">제목</td>
				<td width="600" height="30"><input type="text" id="title"
					name="title" theme="simple" value="${review.title}" maxlength="200" size="79px" /></td>
			</tr>
			<tr align="center" bgcolor="#ffffff">
				<td>대표이미지 등록하기</td>
				<td><textarea id="main_img" name="main_img" rows="10" cols="20"
						style="width: 766px; height: 412px;">${review.main_img}</textarea></td>
			</tr>
			<tr align="center" bgcolor="#ffffff">
				<td width="200" height="30">내용</td>
				<td width="600" height="30"><textarea id="cont" name="content"
						cols="95px" rows="20px">${review.content}</textarea></td>
			</tr>
			<tr>
				<td align="right" colspan="2"><input type="submit" id="save"
					value="등록"> <input type="button" value="목록"
					onclick="javascript:location.href='reviewList.mtg'"></td>
			</tr>
		</table>
	</form>
</body>
</html>