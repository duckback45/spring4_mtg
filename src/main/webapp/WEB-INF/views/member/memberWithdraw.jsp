<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
function memberDeleteCheck () {
	if(document.memberDeleteform.passwd.value=="") {
		alert("비밀번호를 입력하세요");
		document.memberDeleteform.passwd.focus();
		return false;
	}
	return true;
}
</script>
<style>
center {
	color: white;
	font-size: 55px;
	font-weight: bold;
	margin: 25px;
	margin-bottom: 80px;
}
</style>
</head>
<body>

<form name="memberDeleteform" action="memberDelete.film" method="post" onsubmit="return memberDeleteCheck()">

	<!-- <img src="/StarBox/resources/image/h3_mypage_21.gif" alt="회원탈퇴"/> -->
	
	<center>
		<table>
			<tr>
				<td><img style="width: 60px;"
					src="/StarBox/resources/image/title/join.png" /></td>
				<td><font
					style="color: white; font-size: 55px; font-weight: bold; margin: 25px; margin-bottom: 50px; font-family: 'Orbitron', cursive;">
						WITHDRAW&nbsp;&nbsp;회원탈퇴</font></td>
			</tr>
		</table>
	</center>
	
	<hr width="740" size="2" color="59CABD" /><br>
	<table width="740" cellspacing="0" cellpadding="0" border="0" align="center" style="color:white;">
		<tr>
			<td>
			<font size ="2">스타박스 회원탈퇴 시 회원님께 보유하신 정보가 즉시 삭제 됩니다.</font><br><br>
			<strong>[주의] 스타박스 탈퇴 전, 아래 사항을 숙지 하여 주시기 바랍니다.</strong><br><br>
			<img src="/StarBox/resources/image/bu1.gif"><strong> 30일간 회원 재가입이 불가능합니다.</strong><br>
			- <font size ="2">회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</font><br><br><br>
			<img src="/StarBox/resources/image/bu1.gif"><strong> 탈퇴 후 삭제 내역</strong><br>
			<font size ="2">* 회원 탈퇴 하시면 회원 정보와 개인 정보가 삭제되며 데이터는 영원히 복구 되지 않습니다.</font><br>
			- <font size ="2">관람권 및 쿠폰</font><br>
			- <font size ="2">영화 관람 내역</font><br><br>
			</td>
		</tr>
	</table>
	<hr width="740" size="2" color="59CABD" /><br>
	<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">
		<tr>
			<td align="left">
			<font size ="2" color="white">회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</font>
			</td>
		</tr>
		<tr>
			<td bgcolor="000000" align="center" style="color:white">
			<b>비밀번호 입력 &nbsp;</b><input type="password" name="passwd" size = "12" maxlength="6"/><br><br>
			</td>
		</tr>
	</table><br>
	<table align="right" style="margin-right:25%">
		<tr >
			<td align="right">
			<input type="image" src="/StarBox/resources/image/bt_out_02.gif">
				<a href="main.film">
			<img src="/StarBox/resources/image/no.gif" alt="취소"/></a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>