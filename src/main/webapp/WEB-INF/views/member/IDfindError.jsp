<%@ page contentType="text/html; charset=UTF-8"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>아이디/비밀번호 찾기 오류</title>

<script>
	window.onload = function(){
		var chk = ${memberFindChk}
		alert(chk);
		if(chk == -1){
			alert('주민등록번호가 틀립니다');
			history.back();
		}
		if(chk == 0){
			alert('가입되어 있지 않는 이름입니다');
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>