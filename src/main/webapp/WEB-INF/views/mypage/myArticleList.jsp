<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/mtg/resources/css/import.css" />
<link rel="stylesheet" type="text/css" href="/mtg/resources/css/owl.carousel.css" />
<link rel="stylesheet" type="text/css" href="/mtg/resources/css/owl.transitions.css" />
<link rel="stylesheet" type="text/css" href="/mtg/resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="/mtg/resources/css/common.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div id="container">
<div class="mypage_grp">
	<div class="mypage_list">
		<ul>
			<li><a href="MemberMypage.mtg">회원정보수정</a></li>
			<li><a href="myArticleList.mtg">질문</a></li>
			<li class="on"><a href="myInforList.mtg">정보</a></li>
			<li><a href="myTourList.mtg">여행북</a></li>
		<!-- 	<li><a href="/TorrentBox/mypage/wishList.torrent">보고싶은 영화</a></li>
			<li><a href="/TorrentBox/mypage/torrentPage.torrent">토렌트 코인</a></li> --> 
		</ul>
	</div>

<div class="mypage_ct">
		<h3 class="sub_tit">내가 작성한 글</h3>
		<div class="tbl_type_02">
			<table>
				<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
				<colgroup>
					<col style="width:17%" />
					<col style="width:17%"/>
					<col style="width:17%" />
					<col style="width:17%" />
					<col style="width:17%" />
					<col style="width:17%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">작성자</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach var="mypage" items="${list}" varStatus="stat">
				<tr>
					<td>${mypage.num}</td>
					<td>${mypage.writer}</td>
					<td><a href="/qnaView.mtg?no=${mypage.num}">${mypage.title}</a></td>
					<td>${mypage.readhit}</td>
					<td><fmt:formatDate value="${mypage.regdate}"
							pattern="yy/MM/dd" /></td>
				
				</tr>
				
					
			</c:forEach>
				<c:if test="${totalCount<1}">
				<tr>
					<td colspan="10">취소내역이 없습니다.^^</td>
				</tr>
			</c:if>
				</tbody>
			</table>
		</div>
		<div class="paging">
			
			<span class="paging">${pagingHtml}</span>
		
		</div>
	</div>
</div>
</div>









