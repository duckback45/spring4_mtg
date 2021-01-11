<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
img {
	border: 0;
	margin: 0;
}

center {
	color: white;
	font-size: 55px;
	font-weight: bold;
	margin: 25px;
	margin-bottom: 80px;
}
</style>
<script>
	function check() {

		var f = document.joinform; //문서.Form name="";
		var idPs = /^[a-z0-9_]{4,12}$/; //아이디 비밀번호 체크표현식

		if (f.mem_id.value == "") {
			alert("아이디를 입력해주세요.");
			f.mem_id.focus();
			return false;
		}

		if (!idPs.test(f.mem_id.value)) {
			alert("유효한 아이디 형식이 아닙니다.");
			f.mem_id.value = ""; //id작성했던 값을 비워줌
			f.mem_id.focus(); //id focus이동
			return false;
		}

		if (f.confirm_id.value == "") {
			alert("아이디 중복확인을 해주십시요.");
			return false;
		}

		if (f.mem_pw.value == "") {
			alert("비밀번호를 입력해주십시요.");
			f.mem_pw.focus();
			return false;
		}

		if (!idPs.test(f.passwd.value)) {
			alert("유효한 비밀번호 형식이 아닙니다.");
			f.mem_pw.value = ""; //id값을 비워줌
			f.mem_pw.focus(); //id focus이동
			return false;
		}

		if (f.mem_pw.value != f.passwd2.value) {
			alert("비빌번호를 다르게 입력했습니다.");
			f.passwd2.select();
			return false;
		}

		if (f.name.value == "") {
			alert("이름을 입력해주십시요.");
			f.mem_nickname.focus();
			return false;
		}
		
	   if (f.mem_mobile.value == "") {
			alert("핸드폰번호를 입력해주세요.");
			f.mem_mobile.focus();
			return false;
		}

		if (f.mem_email.value == "") {
			alert("이메일을 입력해주세요.");
			f.mem_email.focus();
			return false;
		}

		var eCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!eCheck.test(f.email.value)) {
			alert("잘못된 이메일 형식입니다.");
			f.email.value = "";
			f.email.focus();
			return false;
		}

		else {
			f.submit();
		}
	}

	function openConfirmId(joinform) {

		var url = "memberIdChkAction.mtg?mem_id=" + document.joinform.mem_id.value;

		var f = document.joinform; //문서.Form name="";

		var idPs = /^[a-z0-9_]{4,12}$/; //아이디 비밀번호 체크표현식

		if (f.mem_id.value == "") {
			alert("아이디를 입력해주세요.");
			f.mem_id.focus();
			return false;
		}

		if (!idPs.test(f.mem_id.value)) {
			alert("유효한 아이디 형식이 아닙니다.");
			f.mem_id.value = ""; //id작성했던 값을 비워줌
			f.mem_id.focus(); //id focus이동
			return false;
		}

		open(
				url,
				"confirm",
				"toolbar=no, location=no, status=co, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
	}

	
</script>
<title>회원가입폼</title>
</head>

<body>

	<center style="margin-bottom: 30px;">
		<table>
			<tr>
				<td><img style="width: 60px;"
					src="/mtg/resources/image/title/join.png" /></td>
				<td><font
					style="color: white; font-size: 55px; font-weight: bold; margin: 25px; margin-bottom: 50px; font-family: 'Orbitron', cursive;">
						JOIN&nbsp;&nbsp;회원가입</font></td>
			</tr>
		</table>
	</center>

	<form name="joinform" action="memberend.mtg" method="post"
		onsubmit="return check(this)">
		<!-- 		<div align="center">
			<img src="/mtg/resources/image/step2.JPG" alt="회원정보입력" /><br>
			<br> <br>
		</div> -->

		<table width="740" height="500" cellspacing="0" cellpadding="0"
			border="0" align="center" style="margin-bottom: 430px;">

			<!-- 표시작 -->
			<tr>
				<td>
					<table>
						<tr>
							<td width="300" align="left">
								<!-- <img src="http://image.megabox.co.kr/Images/img/tit/h3_join_01.gif" alt="회원정보입력" /> -->
								<h3 style="color: #1478CD">
									<br> <br>※ 회원님의 정보를 정확히 입력해주세요.
								</h3>
							</td>
							<td width="440" align="right"><img
								src="/mtg/resources/image/bu1.gif" /><font color=#C36666
								size="2">표시필수입력사항</font></td>
						</tr>
					</table>
				</td>
			</tr>
			<br />

			<tr>
				<td colspan=2>

					<p align="center">
					<table border="3" width="105%" height="80%">

						<tr>
							<td align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp;아이디
								</h3></td>
							<td align="left"><c:choose>
									<c:when test="${resultClass==null}">
										<input type="text" name="mem_id" size="20" class="off"
											onfocus="on(this)" onblur="off(this)"
											style="height: 35px; color: #C36666; background-color: #000000; border: #3f3f3f 1px solid"
											ime-mode: disabled;" />
										<input type="button" name="confirm_id" class="input"
											style="color: #1478CD; background-color: #3f3f3f; border: #3f3f3f 1px solid"
											value="중복확인" onclick="openConfirmId(this.form)" />
										<font color=#1478CD size="2"> 영문 또는 영문/숫자 조합1~12자리</font>
									</c:when>
									<c:otherwise>
										<b>${resultClass.mem_id}</b>
									</c:otherwise>
								</c:choose></td>
						</tr>

						<tr>
							<td align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp;비밀번호
								</h3></td>
							<td align="left"><input type="password" name="mem_pw"
								style="height: 35px; color: #C36666; background-color: #000000; border: #3f3f3f 1px solid"
								size="20" onfocus="on(this)" onblur="off(this)" /> <font
								color=#1478CD size="2"> 아이디영문, 숫자, 특수문자 중 2가지 이상</font></td>
						</tr>

						<tr>
							<td align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp;비밀번호
									확인
								</h3></td>
							<td align="left"><input type="password" name="passwd2"
								style="height: 35px; color: #C36666; background-color: #000000; border: #3f3f3f 1px solid"
								size="20" onfocus="on(this)" onblur="off(this)" /></td>
						</tr>
						<tr>
							<td width="17%" align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp; 별명
								</h3></td>
							<td align="left"><input type="text" name="mem_nickname" size="20"
								style="height: 35px; color: #C36666; background-color: #000000; border: #3f3f3f 1px solid" />
							</td>
						</tr>

						
					
						<tr>
							<td align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp;전화번호
								</h3></td>
							<td align="left">								
								<font color=#828282 size="2">휴대폰</font> <input type="text"
								name="mem_mobile" size="15" maxlength="10"
								style="height: 35px; color: #C36666; background-color: #000000; border: #3f3f3f 1px solid" />
								<font color=#1478CD size="2"> "-" 없이 입력하세요.</font></td>
						</tr>

						<tr>
							<td align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp;이메일
								</h3></td>
							<td align="left"><input type="text" name="mem_email" size="30"
								style="height: 35px; color: #C36666; background-color: #000000; border: #3f3f3f 1px solid" />
						<tr>
							<td align="left" height="50" width="60"><h3
									style="color: white">
									<img src="/mtg/resources/image/bu1.gif" />&nbsp;&nbsp;수신확인
								</h3></td>
							<td align="left"><font color=#828282 size="2">이메일</font> <input
								type="radio" name="emailagree" value="Y" checked /><font
								color=#C36666 size="2">수신</font> <input type="radio"
								name="emailagree" value="N" /> <font color=#C36666 size="2">수신
									거부</font><br>
						</tr>
					</table> <br> <br>

					<table width="100%">
						<tr>
							<td>
								<div align="center">
									<a href="main.mtg"> <img
										src="/mtg/resources/image/cancel.png" height="42px;"
										alt="취소" /></a> <input type="image" value="회원가입"
										src="/mtg/resources/image/submit.png" height="42px;"
										alt="확인"> <br>
								</div>
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
		</table>
</body>
</html>
