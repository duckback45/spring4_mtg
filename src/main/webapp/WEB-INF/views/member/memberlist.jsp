<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>회원목록</title>

<style>
.title {
	color: white;
	position: absolute;
	top: 170px;
	margin-left: 600px;
	font-size: 70px
}

.img {
	width: 100%;
	height: 300px;
	background-image: url('./resources/image/member_cover.jpg');
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
#delete {
	text-decoration: none;
	color: gray;
}
</style>
</head>

<body>
	<div class="img">
		<span class="title">회원목록</span>
	</div>

	<table align="center">
		<tr align="center" bgcolor="#ffffff">
			<td width="15%"><strong><font color="#747979">ID</font></strong></td>
			<td width="15%"><strong><font color="#747979">닉네임</font></strong></td>
			<td width="20%"><strong><font color="#747979">전화번호</font></strong></td>
			<td width="30%"><strong><font color="#747979">이메일</font></strong></td>
			<td width="20%"><strong><font color="#747979">탈퇴</font></strong></td>
		</tr>

		<c:forEach var="list" items="${list}" varStatus="stat">
			<tr bgcolor="#ffffff" align="center" style="color: #747979;">
				<td align="center">${list.mem_id }</td>
				<td align="center">${list.mem_nickname}</td>
				<td align="center">${list.mem_mobile }</td>
				<td align="center">${list.mem_email}</td>
				<td align="center"><a id="delete" href="adminDelete.mtg?nickname=${list.mem_nickname}" >탈퇴</a></td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(list) le 0}">
			<tr bgcolor="#747979" align="center">
				<td colspan="5">가입한 회원이 없습니다.</td>
			</tr>
		</c:if>
	</table>
</body>
</html>
