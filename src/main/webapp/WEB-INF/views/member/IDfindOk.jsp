<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>

<script language="javascript">
	function windowclose() {
		opener.filmcument.loginform.mem_id.value = "${member.mem_id}";
		opener.filmcument.loginform.mem_pw.value = "${member.mem_pw}";
		self.close();
	}
</script>
<style>
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
	background-image: url('./resources/image/notice/notice.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 70px
}

table {
	width: 800px;
	margin-top: 50px;
}

font{
	color: gray;
}
</style>

</head>
<body>
	<div class="img">
		<span class="title">ID/PASSWORD 찾기</span>
	</div>


	<table align="center">

		<tr align="center" bgcolor="#ffffff">
			<td>
				<font size=3><strong>${member.mem_nickname}</strong></font>
				<font size=2> 님의 아이디는 </font> <font size=3><strong>${member.mem_id}</strong></font><font
				size=2> 입니다.</font></td>
		</tr>
	</table>
	<br>

	<table align="center">

		<tr>
			<td>
				<div align="center">
					<a href="main.mtg">메인으로</a>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>




