<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
center {
	color: white;
	font-size: 55px;
	font-weight: bold;
	margin: 25px;
	margin-bottom: 80px;
}
</style>

<title>�α�����</title>
</head>
<body>

	<center>
		<table>
			<tr>
				<td><img style="width: 60px;"
					src="/mtg/resources/image/title/pwcheck.png" /></td>
				<td><font
					style="color: white; font-size: 55px; font-weight: bold; margin: 25px; margin-bottom: 50px; font-family: 'Orbitron', cursive;">
						PWCHECK&nbsp;&nbsp;��й�ȣȮ��</font></td>
			</tr>
		</table>
	</center>


	<div align="center">
		<table>
			<tr align="center">
				<td><img style="width: 300px; margin-bottom: 30px;"
					src="/mtg/resources/image/body/pwcheck.png" /></td>
			</tr>
			<tr align="center">
				<td>
					<form name="memberPassCk" action="MemberMypage.mtg" method="post">
						<input type="password" name="mem_pw" size="16" maxlength="12"
							placeholder="��й�ȣ Ȯ��" style="font-size: 14pt; height: 25;" />
				</td>
			<tr>
				<td align="center"> <input type="image"
					src="/mtg/resources/image/submit.png" style="margin-top:5px;" height="40px;"
					onclick="goMemberAuth()" value="Ȯ��" />

					</form></td>
			</tr>
		</table>
	</div>
</body>

</html>