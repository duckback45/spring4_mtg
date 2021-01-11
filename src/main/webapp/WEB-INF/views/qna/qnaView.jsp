
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
	background-image: url('./resources/image/information_cover.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 70px
}

#content table {
	width: 800px;
	margin-top: 50px;
}

#reple table {
	width: 800px;
	margin-top: 10px
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
		<span class="title">질문 상세보기</span>
	</div>

	<div id="content">
		<table align="center" width="800px" style="margin-top: 50px">

			<tr align="center" bgcolor="#ffffff">
				<td colspan="3" height="30"><strong><FONT
						color="#747979">${qnaModel.title}</FONT></strong></td>

			</tr>
			<tr align="center" bgcolor="#ffffff">
				<td height="30" width="30%"><FONT color="#747979">${qnaModel.writer}</FONT></td>
				<td height="30" width="30%"><FONT color="#747979">조회&nbsp;&nbsp;${qnaModel.readhit }</FONT></td>

				<td height="30" width="30%"><FONT color="#747979"><fmt:formatDate
							value="${qnaModel.regdate}" pattern="yyyy.MM.dd-hh:mm"></fmt:formatDate></FONT></td>

			</tr>
			<tr align="center" bgcolor="#ffffff">
				<td colspan="3" height="400"><FONT color="#747979">${qnaModel.content}</FONT></td>
			</tr>
		</table>
	</div>

	<table align="center">
		<td><input type="image" class="button" name="list" value="button"
			src="./resources/image/notice/list.png"
			onClick="javascript:location.href='qnaList.mtg?currentPage=${currentPage} '"></td>
		<c:if test="${sessionScope.mem.mem_nickname == qnaModel.writer }">
		<td><input type="image" class="button" name="modify"
			value="button" src="./resources/image/notice/modify.png"
			onClick="javascript:location.href='qnaModifyForm.mtg?num=${qnaModel.num}'" /></td>
		<td><input type="image" class="button" name="delete"
			value="button" src="./resources/image/notice/delete.png"
			onClick="javascript:location.href='qnaDelete.mtg?num=${qnaModel.num}'" /></td>
		</c:if>
		</tr>
	</table>



	<div id="reple" align="center" style="margin-bottom: 400px;">
		<table align="center">
			<c:forEach var="list" items="${qnaReply}" varStatus="stat">

				<tr align="center" bgcolor="white">
					<td align="left" width="50%" height="30">${list.reply_content}</td>
					<td align="center" width="20%" height="30">${list.reply_id}</td>
					<td colspan="1" width="20%" height="30" align="center"><fmt:formatDate
							value="${list.registDate}" pattern="MM.dd"></fmt:formatDate></td>
					<c:if test="${sessionScope.mem.mem_nickname == qnaModel.writer }">
						<td width="10%" height="30" align="center"><a
							href="qnaReplyDelete.mtg?reply_no=${list.reply_no}&num=${qnaModel.num}">삭제</a></td>
					</c:if>
				</tr>
				<tr>
					<td height="1" colspan="4"></td>
				</tr>
			</c:forEach>
		</table>

		<form action="qnaReplyInsert.mtg" method="post" name="Insert">
			<table>
				<tr bgcolor="white">
					<td height="10" width="780"><textarea name="content"
							cols="110" rows="10px"></textarea></td>
					<td align="center" height="10" width="20"><input type="hidden"
						name="board_no" value="${qnaModel.num}" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" value="입력" onclick="form.submit()" align="center" width="20"></input></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>