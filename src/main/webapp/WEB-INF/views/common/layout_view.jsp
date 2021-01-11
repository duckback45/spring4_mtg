<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행이 시작되는 곳 MTG</title>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-family: "맑은 고딕","Malgun Gothic","Helvetica Neue","Apple SD Gothic Neo",Helvetica,Arial,"Apple Gothic","돋움",Dotum,sans-serif!important;
}

#head {
	height: 70px;
	width: 100%;
	position: fixed;
	top: 0;
	background: #eeffff;
	z-index: 9999;
}

#body {
	margin: 80px 0;
	width: 100%;
	background: #f6f6f6;
	margin-top: 70px;
}
#sidebar {
    float: left;
    width: 5px;
    position: fixed;
    margin-top: 70px;
    margin-left: 280px;
    background: #f6f6f6;
    text-align: left;
   }

#footer {
	height: 50px;
	width: 100%;
	position: fixed;
	bottom: 0;
	background: #eeffff;
} 
</style>

</head>

<body>
	<div id="head">
		<tiles:insertAttribute name="header" />
	</div>

<div id="sidebar">
		<tiles:insertAttribute name="sidebar" />
	</div>
	<div id="body">
		<tiles:insertAttribute name="body" />
    </div> 
	    
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>