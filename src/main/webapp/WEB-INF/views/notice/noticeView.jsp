<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>공지사항</title>
<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name,
				"scrollbars=no,status=no,resizable=no,width=300,height=150");
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
</style>
</head>

<body>
	<div class="img">
		<span class="title">공지사항</span>
	</div>

	<table align="center" width="800px" style="margin-top: 50px">

		<tr align="center" bgcolor="#ffffff">
			<td colspan="3" height="30"><strong><FONT
					color="#747979">${notice.title}</FONT></strong></td>

		</tr>
		<tr align="center" bgcolor="#ffffff">
			<td height="30" width="30%"><FONT color="#747979">${notice.writer}</FONT></td>
			<td height="30" width="30%"><FONT color="#747979">조회&nbsp;&nbsp;${notice.readhit }</FONT></td>

			<td height="30" width="30%"><FONT color="#747979"><fmt:formatDate
						value="${notice.regdate}" pattern="yyyy.MM.dd-hh:mm"></fmt:formatDate></FONT></td>

		</tr>
		<tr align="center" bgcolor="#ffffff">
			<td colspan="3" height="400"><FONT color="#747979">${notice.content}</FONT></td>
		</tr>
	</table>

	<table align="center">
		<td><input type="image" class="button" name="list" value="button"
			src="./resources/image/notice/list.png"
			onClick="javascript:location.href='noticeList.mtg?currentPage=${currentPage} '"></td>
		<c:if test="${sessionScope.mem.mem_nickname == notice.writer }">
			<td><input type="image" class="button" name="modify"
				value="button" src="./resources/image/notice/modify.png"
				onClick="javascript:location.href='noticeModifyForm.mtg?num=${notice.num}&currentPage=${currentPage}'" /></td>
			<td><input type="image" class="button" name="delete"
				value="button" src="./resources/image/notice/delete.png"
				onClick="javascript:location.href='noticeDelete.mtg?num=${notice.num}'" /></td>
		</c:if>
		</tr>

	</table>

</body>
</html>