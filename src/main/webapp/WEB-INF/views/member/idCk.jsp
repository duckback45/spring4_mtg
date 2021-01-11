<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원가입</title>
<script type="text/javascript">
function windowclose(){
	opener.filmcument.joinform.mem_id.value="${mem_id}";
	opener.filmcument.joinform.checkConfirmId.value="true";
	window.close();
}

function check() {
	
	var f=document.checkIdForm;  //문서.Form name="";
	  
	var idPs=/^[a-z0-9_]{4,8}$/;  //아이디 비밀번호 체크표현식
	
	if(f.mem_id.value==""){
		alert("아이디를 입력해주세요.");
		f.mem_id.focus();
		return false;
	}
	
	if(!mem_idPs.test(f.mem_id.value)){
		alert("유효한 아이디 형식이 아닙니다.");
		f.mem_id.value="";  //id작성했던 값을 비워줌
		f.mem_id.focus();  //id focus이동
		return false;
	}
}
</script>
</head>
<body>
<c:choose>
<c:when test="${chkId eq 1}">
	<form>
	<table width=400 border=0 cellspacing=0 cellpadding=5>
		<tr align=center>
			<td height=30>
				<font size=2><b>${mem_id}</b> 은(는) 이미 사용 중인 아이디입니다</font>
			</td>
		</tr>
	</table>
	<table width=400 border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td align=center>
				<font size=2>다른 아이디를 선택하세요</font><p>
				<input type=text size=10 maxlength=12 name=mem_id />
				<input type=submit value=중복확인>
			</td>
		</tr>
	</table>
	</form>
</c:when>

<c:otherwise>
	<table width=400 border=0 cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>
				<br><br>
				<font size=2>입력하신 <b>${mem_id}</b> 은(는) 사용할 수 있는 아이디입니다.</font>
				<br/><br/>
				<a href="javascript:window.close();"><B>닫기</B></a>
			</td>
		</tr>
	</table>
</c:otherwise>
</c:choose>
</body>
</html>