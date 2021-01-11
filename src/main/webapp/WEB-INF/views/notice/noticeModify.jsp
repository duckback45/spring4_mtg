<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
	function validation() {
		var frm = document.forms(0);

		if (frm.title.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		} else if (frm.content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		return true;
	}
</script>

<style>
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
	background-image: url('./resources/image/notice/notice_cover.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 70px
}

table {
	width: 800px;
	margin-top: 50px;
}

textarea {
	font-family: "맑은 고딕", "Malgun Gothic", "Helvetica Neue",
		"Apple SD Gothic Neo", Helvetica, Arial, "Apple Gothic", "돋움", Dotum,
		sans-serif !important;
}
</style>
</head>

<body>
	<div class="img">
		<span class="title">공지사항 작성</span>
	</div>

	<form action="noticeModify.mtg" method="post">
		<input type="hidden" name="num" value="${notice.num}" /> <input
			type="hidden" name="currentPage" value="${currentPage}" /> <input
			type="hidden" name="regdate" value="${notice.regdate}" />

		<table align="center">

			<tr align="center" bgcolor="#ffffff">
				<td width="200" height="30">제목</td>
				<td width="600" height="30"><input type="text" name="title"
					theme="simple" value="${notice.title}" maxlength="200" size="113" /></td>
			</tr>

			<tr align="center" bgcolor="#ffffff">
				<td width="200" height="30">내용</td>
				<td width="600" height="30"><textarea name="content"
						cols="110" rows="20px">${notice.content}</textarea></td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input id="submit" name="submit" type="image" align="right" value="submit" class="inputb" src="./resources/image/notice/ok.png" onClick="validation()">
					<a href="noticeList.mtg"><img src="./resources/image/notice/list.png" /></a> 
				</td>
			</tr>

		</table>
	</form>

	</td>
	</tr>
	</table>
</body>
</html>
