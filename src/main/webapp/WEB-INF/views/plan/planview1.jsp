<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.ct-btn.white,
.ct-btn.white:link,
.ct-btn.white:visited {
	color: #666;
	border: 1px solid #ebebeb;
	border-bottom-color: #fff666;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04);
	background: #fff;
	background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0 );/*IE*/
}
</style>
  <script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>
</head>
<body>
		<table>
    <tr><button class="ct-btn white" onclick="fnMove('1')">Top</button></tr>
    <tr><button class="ct-btn white" onclick="fnMove('2')">Day1</button></tr>
    <tr><button class="ct-btn white" onclick="fnMove('3')">End</button></tr>
    </table>
</body>
</html>