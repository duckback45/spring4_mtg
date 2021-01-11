<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
	window.onload = function() {

		document.getElementById("searchN").value = $
		{
			searchN
		}
		;
		document.getElementById("search").value = $
		{
			search
		}
		;

	}
</script>
<style>
.title {
	color: white;
	position: absolute;
	top: 170px;
	margin-left: 700px;
	font-size: 60px
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

table {
	width: 800px;
	margin-top: 50px;
}

.button {
	margin-bottom: -10px
}
a{
text-decoration: none;}
textarea {
	font-family: "맑은 고딕", "Malgun Gothic", "Helvetica Neue",
		"Apple SD Gothic Neo", Helvetica, Arial, "Apple Gothic", "돋움", Dotum,
		sans-serif !important;
}
</style>
</head>

<body>
	<div class="img">
		<span class="title">질문게시판 작성</span>
	</div>

	<table align="center">
		<tr>
			<td><input id="submit" type="image" align="right" value="submit"
				class="inputb" src="./resources/image/insertQna.png"
				onClick="javascript:location.href='qnaWriteForm.mtg'"></td>
		</tr>
		<tr align="center" bgcolor="#ffffff">
			<td width="5%"><strong><font color="#747979">번호</font></strong></td>
			<td width="60%"><strong><font color="#747979">제목</font></strong></td>
			<td width="10%"><strong><font color="#747979">작성자</font></strong></td>
			<td width="15%"><strong><font color="#747979">등록일</font></strong></td>
			<td width="10%"><strong><font color="#747979">조회수</font></strong></td>
		</tr>

		<c:forEach var="list" items="${list }" varStatus="stat">

			<c:url var="viewURL" value="qnaView.mtg">
				<c:param name="no" value="${list.num }" />

				<c:param name="currentPage" value="${currentPage }" />


			</c:url>

			<tr bgcolor="#ffffff" align="center" style="color: #747979;">
				<td>${list.num }</td>
				<td align="center">&nbsp;&nbsp;&nbsp;<a href="${viewURL }"><font
						color="#747979">${list.title}</font> </a></td>
				<td align="center">${list.writer }</td>
				<td colspan="1" align="center"><fmt:formatDate
						value="${list.regdate}" pattern="yyyy.MM.dd"></fmt:formatDate></td>
				<td>${list.readhit }</td>
			</tr>
			<!-- 	<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
 -->
		</c:forEach>

		<c:if test="${fn:length(list) le 0}">

			<tr bgcolor="#747979" align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
			<!-- 	<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr> -->

		</c:if>

		<tr>
			<td colspan="5" align="center">${pagingHtml}</td>
		</tr>
		<tr>
			<td colspan="4" align="center" style="padding-left: 10px;">
				<form action="" method="post">
					<select name="searchN" id="searchN">
						<option value="0">제목</option>
						<option value="1">내용</option>
						<option value="2">제목+내용</option>
						<option value="3">글쓴이</option>
					</select> <input name="search" id="search" theme="simple" /> <input
						type="submit" value="검색" theme="simple" />
				</form>

			</td>

		</tr>

	</table>
</body>
</html>
