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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	function check() {

		var f = document.memberModifyForm;

		if (f.mem_pw.value == "") {
			alert("비밀번호를 입력하세요");
			f.mem_pw.focus();
			return false;
		}

		else if ((f.mem_nickname.value == "") || (f.mem_nickname.value.length <= 1)) {
			alert("별명을 제대로 입력해 주세요");
			f.mem_nickname.focus();
			return false;
		}

	

		else if (f.mem_pw.value != f.passwd2.value) {
			alert("비밀번호가 일치하지 않습니다");
			f.passwd.value = "";
			f.passwd2.value = "";
			f.passwd.focus();
			return false;
		}

		

		else if (f.mem_mobile.value == "") {
			alert("휴대폰 번호를 입력하세요");
			f.mem_mobile.focus();
			return false;
		}
		else if (f.mem_email.value == "") {
			alert("이메일을 입력하세요");
			f.mem_email.focus();
			return false;

		return true;
	}
	}
	
</script>
<div class="mypage_grp">
	<div class="mypage_list">
		<ul>
			<li class="on"><a href="MemberMypage.mtg">회원정보수정</a></li>
			<li><a href="myArticleList.mtg">질문</a></li>
			<li><a href="myInforList.mtg">정보</a></li>
	<!-- 		<li><a href="/TorrentBox/mypage/wishList.torrent">보고싶은 영화</a></li>
			<li><a href="/TorrentBox/mypage/torrentPage.torrent">토렌트 코인</a></li> --> 
		</ul>
	</div>
	<div class="mypage_ct" width>
		<form action="memberModify.mtg" method="post" name="memberModifyForm" onsubmit="return check();">
			<div class="tbl_type_01">
				<table>
					<caption>회원 정보 수정</caption>
					<colgroup>
						<col style="width:120px" />
						<col />
					</colgroup>
						<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>
								<input type="text" class="txt w200" name="mem_id" value="${member.mem_id}"readonly="readonly" />
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td>
								<input type="password" class="txt w200" name="mem_pw" />
								<span class="bk"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" class="txt w200" name="passwd2" /></td>
						</tr>
						<tr>
							<th scope="row">별명</th>
							<td><input type="text" class="txt w200" value="${member.mem_nickname}" name="mem_nickname" /></td>
						</tr>
						
						
						<tr>
							<th scope="row">모바일</th>
							<td>
								<input type="text" class="txt w200" name="mem_mobile" maxlength="11" value="${member.mem_mobile}"/>
								<span class="ibk">" - " 없이 입력하세요.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td><input type="text" class="txt w200" name="mem_email" value="${member.mem_email}" /></td>
						</tr>
						<tr>
							<th scope="row">이메일 수신여부</th>
							<td>
								<span class="rdo_grp mr10">
									<input type="radio" id="email_res" name="email_res" checked="checked" />
									<label for="email_res">수신</label>
								</span>
								<span class="rdo_grp">
									<input type="radio" id="email_resno" name="email_res"/>
									<label for="email_resno">수신 거부</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_type_06">
				<a href="memberDelete.mtg?mem_nickname=${member.mem_nickname}" class="btn btnC_03 btnF_02 mr10">
					<span>회원탈퇴</span>
				</a>
			</div>
			<div class="btn_type_04">
				<a href="main.mtg" class="btn btnC_03 btnF_02 mr10">
					<span>취소</span>
				</a>
				<span class="btn btnC_04 btnF_02">
					<input type="submit" value="확인" name="membermod" />
				</span>
			</div>
		</form>
	</div>
</div>