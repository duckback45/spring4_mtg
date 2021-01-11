<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행기 상세보기</title>
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

	<div class="img">
		<span class="title">여행기</span>
	</div>

	<table align="center" width= "800px" style="margin-top:50px">

		<tr align="center" bgcolor="#ffffff">
			<td colspan="3" height="30">
				<strong><font color="#747979">${review.title}</font></strong>
			</td>
		</tr>
		
		<tr align="center" bgcolor="#ffffff">
			<td height="30" width="30%"><font color="#747979">${review.writer}</font></td>
			<td height="30" width="30%"><font color="#747979">조회&nbsp;&nbsp;${review.readhit }</font></td>
			
			<td height="30" width="30%">
				<font color="#747979">
					<fmt:formatDate value="${review.regdate}" pattern="yyyy.MM.dd-hh:mm" />
				</font>
			</td>
		</tr>
		<tr align="center" bgcolor="#ffffff">
			<td colspan="3" height="400"><font color="#747979">${review.content}</font></td>
		</tr>
	</table>
	
	<table border="1" align="center">
	<c:forEach var="reviewCom" items="${reviewComList }" varStatus="stat">
		<tr>
			<td${reviewCom.content }></td>
			<td>${reviewCom.writer }</td>
			<td><fmt:formatDate value="${reviewCom.regdate }" pattern="MM.dd"/></td>
			<c:if test="${sessionScope.mem.mem_nickname eq reviewCom.writer }">
			<td><a href="reviewComDel.mtg?comment_num=${reviewCom.comment_num }&num=${reviewCom.num}">삭제</a></td>
			</c:if>
		</tr>
	</c:forEach>
	</table>
	
	<form action="reviewComWrite.mtg" method="post" >
			<table align="center">
				<tr>
					<td height="100px">
					<textarea style="background-color:white; width:500px; height:80px; color:black;" name="content" cols="100" rows="10"></textarea></td>
				</tr>
				<tr>
					<td align="right">
						<%-- <input type="hidden" name="writer" value="${review.writer}"/>  --%>
						<input type="hidden" name="num" value="${review.num}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${sessionScope.mem != null }">
						<input type="button" value="글쓰기" onclick="form.submit()"></input>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	
	<table align="center">
		<tr>
			<td>
				<input type="button" value="목록" onclick="location.href='reviewList.mtg'">
			</td>
			<c:if test="${sessionScope.mem.mem_nickname == review.writer }">
				<td>
					<input type="button" value="수정" onclick="location.href='reviewUpdateForm.mtg?num=${review.num}'">
				</td>
				<td>
					<input type="button" value="삭제" onclick="location.href='reviewDelete.mtg?num=${review.num}'">
			</c:if>
				</tr>
	</table>

</body>
</html>