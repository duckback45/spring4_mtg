<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기</title>

<script type="text/javascript">
	function memberFindChk() {

		var mem = eval("document.memberFindForm");

		if (mem.name.value == "") {
			alert('이름을 입력하세요');
			mem.name.focus();
			return false;
		}

		if (mem.jumin1.value == "") {
			alert('앞자리 주민등록번호를 입력하세요');
			mem.jumin1.focus();
			return false;
		}

		if (mem.jumin2.value == "") {
			alert('뒷자리 주민등록번호를 입력하세요');
			mem.jumin2.focus();
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

	<center>
		<table>
			<tr>
				<td><img style="width: 60px;"
					src="/StarBox/resources/image/title/join.png" /></td>
				<td><font
					style="color: white; font-size: 55px; font-weight: bold; margin: 25px; margin-bottom: 50px; font-family: 'Orbitron', cursive;">
						FIND&nbsp;&nbsp;ID/PW 찾기</font></td>
			</tr>
		</table>
	</center>

	<form name="memberFindForm" action=memberFindAction.film method="post"
		onsubmit="return memberFindChk()">

		<table width="740" height="80px" bgcolor="black" style="color:white" cellspacing="0"
			cellpadding="0" border="0" align="center">
			<tr align="center">
				<td>
					<b>이름 : </b> <input name="name" type="text" size="20" />
				</td>
			</tr>
			<tr align="center">
				<td>
					<b>주민등록번호 : </b> <input name="jumin1" type="text" size="9"
					maxlength="6" /> - <input name="jumin2" type="password" size="14"
					maxlength="7" />
				</td>
			</tr>
		</table>
		<br> 
		<div align="right" style="margin-right:25%">
		<input type="image" src="/StarBox/resources/image/find.gif" />
		</div>

	</form>
</body>
</html>


