<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
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
</head>

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

	
</script>
<body >

	<center style="margin-bottom:50px;">
		<table>
			<tr>
				<td><img style="width: 60px;" /></td>
				<td><font
					style="color: #1478CD; font-size: 55px; font-weight: bold; margin: 25px; margin-bottom: 30px; font-family: 'Orbitron', cursive;">
						&nbsp;&nbsp;회원정보수정</font></td>
			</tr>
		</table>
	</center>


	<form name="memberModifyForm" action="memberModify.mtg" method="post"
		onsubmit="return check()">
		<table width="740" height="500" cellspacing="0" cellpadding="0"
			border="0" align="center" style="margin-bottom: 330px;">

			<tr>
				<td>
					<div>
						<!--<h3 style=color:white> -->
						<h3 style="color: #1478CD; margin-bottom:15px;">※ 회원님의 정보를 정확히 입력해주세요.</h3>
					</div>
				</td>
			</tr>
			<!-- 표시작 -->
			<tr>
				<td colspan=2>
					<p align="center">
					<table bgcolor="#ffffff" border="3" width="80%" height="50%">
						<tr>
							<td align="center" height="50" width="80">
								
								<h3 style="color: grey">
									&nbsp;&nbsp;아이디
								</h3>
							</td>
							<td align="left"><input type="text" name="mem_id"
								value="${member.mem_id}" height="50" size="20"
								style="height: 35px; color: #C36666; background-color: #ffffff; border: #3f3f3f 1px solid"
								readonly /></td>
							<!--      style="font-size:14pt; height:30px; padding:5px" -->
						</tr>
						<tr>
							<td height="50" align="left">
								<h3 style="color: grey">
									&nbsp;&nbsp;비밀번호
								</h3>
							</td>
							<td align="left"><input type="password" name="mem_pw"
								size="20"
								style="height: 35px; color: #C36666; background-color: #ffffff; border: #3f3f3f 1px solid" />
								<!-- border: #000000 1px solid --> <font color=#1478CD size="2">
									</font></td>
						</tr>
						<tr>
							<td height="50" align="left">
								<h3 style="color: grey">
									&nbsp;&nbsp;비밀번호
									확인
								</h3>
							</td>
							<td align="left"><input type="password" name="password2"
								size="20"
								style="height: 35px; color: #C36666; background-color: #ffffff; border: #3f3f3f 1px solid" /></td>
						</tr>
					
				
						<tr>
							<td height="50" align="left">
								<h3 style="color: grey">
									&nbsp;&nbsp;별명
								</h3>
							</td>
							<td align="left"><input type="text" name="mem_nickname"
								value="${member.mem_nickname}" size="30"
								style="height: 35px; color: #C36666; background-color: #ffffff; border: #3f3f3f 1px solid" />
							</td>
				
				
				<tr>
							<td height="50" align="left">
								<h3 style="color: grey">
									&nbsp;&nbsp;휴대폰
								</h3>
							</td>
							<td align="left"><input type="text" name="mem_mobile"
								value="${member.mem_mobile}" size="30"
								style="height: 35px; color: #C36666; background-color: #ffffff; border: #3f3f3f 1px solid" />
							</td>
				
					
						<tr>
							<td height="50" align="left">
								<h3 style="color: grey">
									&nbsp;&nbsp;이메일
								</h3>
							</td>
							<td align="left"><input type="text" name="mem_email"
								value="${member.mem_email}" size="30"
								style="height: 35px; color: #C36666; background-color: #ffffff; border: #3f3f3f 1px solid" />
							</td>
						<tr>
							<td height="50" align="left">
								<h3 style="color: grey">
									&nbsp;&nbsp;수신확인
								</h3>
							</td>
							<td align="left"><font color=#828282 size="2">이메일</font> <input
								type="radio" name="emailagree" value="Y" checked /> <font
								color=#C36666 size="2">수신</font> <input type="radio"
								name="emailagree" value="N" /> <font color=#C36666 size="2">수신
									거부</font><br></td>
						</tr>
					</table> <br>

					<table width="100%">
						<tr>
							<td>
								<div align="center">
									<input type="image" src="./resources/image/submit.png" height="40px;" alt="회원탈퇴">
										<a href="main.mtg">
										<img src="./resources/image/cancel.png" height="40px;" alt="취소" /></a>
										<a href="memberWith.mtg">
										<img src="./resources/image/withdraw.png" style="margin-left:10px;" height="40px;" alt="수정" /></a>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

