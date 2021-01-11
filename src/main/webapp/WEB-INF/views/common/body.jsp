<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>

<meta charset="utf-8">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900">
<link rel="stylesheet" href="./resources/list/css/bootstrap.css">
<link rel="stylesheet" href="./resources/list/css/font-awesome.css">
<link rel="stylesheet" href="./resources/list/css/animate.css">
<link rel="stylesheet" href="./resources/list/css/templatemo-misc.css">
<link rel="stylesheet" href="./resources/list/css/templatemo-style.css">
<script type="text/javascript"
	src="/mtg/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/mtg/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/mtg/resources/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="/mtg/resources/css/style.css" />

<script language="javascript">
	function OpenWindow(url, intWidth, intHeight) {
		window.open(url, "_blank", "width=" + intWidth + ",height=" + intHeight
				+ ",resizable=1,scrollbars=1, directories=no, channelmode=yse");
	}
</script>
<script type="text/javascript">
	$("#register_form").click(function() {
		$(".user_register").show();

		return false;
	});
</script>
</head>
	<!-- #region Jssor Slider Begin -->

	<!-- Generated by Jssor Slider Maker. -->
	<!-- This demo works with jquery library -->

	<!-- <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script> -->
	<script type="text/javascript"
		src="./resources/js/jssor.slider.mini.js"></script>
	<!-- use jssor.slider.debug.js instead for debug -->
	<script>
		jQuery(document).ready(function($) {

			var jssor_1_options = {
				$AutoPlay : true,
				$SlideWidth : 1100,
				$Cols : 2,
				$Align : 435,
				$ArrowNavigatorOptions : {
					$Class : $JssorArrowNavigator$
				},
				$BulletNavigatorOptions : {
					$Class : $JssorBulletNavigator$
				}
			};

			var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

			//responsive code begin
			//you can remove responsive code if you don't want the slider scales while window resizing
			function ScaleSlider() {
				var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
				if (refSize) {
					refSize = Math.min(refSize, 2000);
					jssor_1_slider.$ScaleWidth(refSize);
				} else {
					window.setTimeout(ScaleSlider, 30);
				}
			}
			ScaleSlider();
			$(window).bind("load", ScaleSlider);
			$(window).bind("resize", ScaleSlider);
			$(window).bind("orientationchange", ScaleSlider);
			//responsive code end
		});
	</script>
	
	<style type="text/css">
/* jssor slider bullet navigator skin 01 css */
/*
        .jssorb01 div           (normal)
        .jssorb01 div:hover     (normal mouseover)
        .jssorb01 .av           (active)
        .jssorb01 .av:hover     (active mouseover)
        .jssorb01 .dn           (mousedown)
        */
.jssorb01 {
	position: absolute;
}

.jssorb01 div, .jssorb01 div:hover, .jssorb01 .av {
	position: absolute;
	/* size of bullet elment */
	width: 12px;
	height: 12px;
	filter: alpha(opacity = 70);
	opacity: .7;
	overflow: hidden;
	cursor: pointer;
	border: #000 1px solid;
}

.jssorb01 div {
	background-color: gray;
}

.jssorb01 div:hover, .jssorb01 .av:hover {
	background-color: #d3d3d3;
}

.jssorb01 .av {
	background-color: #fff;
}

.jssorb01 .dn, .jssorb01 .dn:hover {
	background-color: #555555;
}

/* jssor slider arrow navigator skin 13 css */
/*
        .jssora13l                  (normal)
        .jssora13r                  (normal)
        .jssora13l:hover            (normal mouseover)
        .jssora13r:hover            (normal mouseover)
        .jssora13l.jssora13ldn      (mousedown)
        .jssora13r.jssora13rdn      (mousedown)
        */
.jssora13l, .jssora13r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 40px;
	height: 50px;
	cursor: pointer;
	background: url('img/a13.png') no-repeat;
	overflow: hidden;
}

.jssora13l {
	background-position: -10px -35px;
}

.jssora13r {
	background-position: -70px -35px;
}

.jssora13l:hover {
	background-position: -130px -35px;
}

.jssora13r:hover {
	background-position: -190px -35px;
}

.jssora13l.jssora13ldn {
	background-position: -250px -35px;
}

.jssora13r.jssora13rdn {
	background-position: -310px -35px;
}

</style>

<body style="padding: 0px; margin: 0px; background-color: #fff; font-family: Arial, sans-serif; height: 100%" >
	
	<!-- body : 슬라이드 부분 -->
	
	<div id="jssor_1"
		style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 2000px; height: 420px; overflow: hidden; visibility: hidden;">
		<!-- Loading Screen -->
		<div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
			<div
				style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
			<div
				style="position: absolute; display: block; background: url('img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
		</div>
		<div data-u="slides"
			style="cursor: default; position: relative; top: 0px; left: 0px; width: 2000px; height: 420px; overflow: hidden;">
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen1.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen2.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen3.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen1.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen2.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen3.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen1.png" />
			</div>
			<div data-p="112.50" style="display: none;">
				<img data-u="image" src="img/screen2.png" />
			</div>
			<a data-u="ad" href="http://www.jssor.com" style="display: none">jQuerySlider</a>
		</div>
		<!-- Bullet Navigator -->
		<!--  <div data-u="navigator" class="jssorb01" style="bottom:16px;right:16px;" data-autocenter="1">
            <div data-u="prototype" style="width:12px;height:12px;"></div>
        </div> -->
		<!-- Arrow Navigator -->
		<span data-u="arrowleft" class="jssora13l"
			style="top: 0px; left: 30px; width: 40px; height: 50px;"
			data-autocenter="2"></span> <span data-u="arrowright"
			class="jssora13r"
			style="top: 0px; right: 30px; width: 40px; height: 50px;"
			data-autocenter="2"></span>
	</div>
	<!-- #endregion Jssor Slider End -->
	
	<!-- body : 이미지 부분 -->
	
	<div style="margin-left: 150px; margin-top: 50px;">
		<font style="font-size: 15pt; font-weight: bold;">추천 콘텐츠</font>
	</div>
	
	 <div class="col-md-4 project-item mix" style="margin-top: 50px; margin-left: 140px;">
	 	<div class="project-thumb">
        	<img alt="곡성 세계장미축제" src="./resources/image/main/rose.PNG" style="height: 350px; width: 300px;">
            <div class="overlay-b" style="width: 300px;">
               	<div class="overlay-inner">
                   	<a href="#" class="fancybox fa fa-expand" title="상세보기"></a>
                   </div>
     		</div>
        </div>
        <div class="box-content project-detail">
        	<p style="font-weight: bold; ">곡성 세계장미축제</p>
        </div>
     </div> <!-- /.project-item -->
	
	 <div class="col-md-4 project-item mix" style="margin-top: 50px; margin-left: -70px;">
	 	<div class="project-thumb">
        	<img alt="해운대 모래축제" src="./resources/image/main/send.jpg" style="height: 350px; width: 300px;">
            <div class="overlay-b" style="width: 300px;">
               	<div class="overlay-inner">
                   	<a href="#" class="fancybox fa fa-expand" title="상세보기"></a>
                   </div>
     		</div>
        </div>
        <div class="box-content project-detail">
        	<p style="font-weight: bold; ">해운대 모래축제</p>
        </div>
     </div> <!-- /.project-item -->
	
	 <div class="col-md-4 project-item mix" style="margin-top: 50px; margin-left: -70px;">
	 	<div class="project-thumb">
        	<img alt="부산항 축제" src="./resources/image/main/busan.jpg" style="height: 350px; width: 300px;">
            <div class="overlay-b" style="width: 300px;">
               	<div class="overlay-inner">
                   	<a href="#" class="fancybox fa fa-expand" title="상세보기"></a>
                   </div>
     		</div>
        </div>
        <div class="box-content project-detail">
        	<p style="font-weight: bold; ">부산항 축제</p>
        </div>
     </div> <!-- /.project-item -->
	
	 <div class="col-md-4 project-item mix" style="margin-top: 10px; margin-left: 140px;">
	 	<div class="project-thumb">
        	<img alt="호수장미 페스티벌" src="./resources/image/main/hosu.jpg" style="height: 350px; width: 300px;">
            <div class="overlay-b" style="width: 300px;">
               	<div class="overlay-inner">
                   	<a href="#" class="fancybox fa fa-expand" title="상세보기"></a>
                   </div>
     		</div>
        </div>
        <div class="box-content project-detail">
        	<p style="font-weight: bold; ">호수장미 페스티벌</p>
        </div>
     </div> <!-- /.project-item -->
	
	 <div class="col-md-4 project-item mix" style="margin-top: 10px; margin-left: -70px;">
	 	<div class="project-thumb">
        	<img alt="대구 치맥 페스티벌" src="./resources/image/main/chicken.png" style="height: 350px; width: 300px;">
            <div class="overlay-b" style="width: 300px;">
               	<div class="overlay-inner">
                   	<a href="#" class="fancybox fa fa-expand" title="상세보기"></a>
                   </div>
     		</div>
        </div>
        <div class="box-content project-detail">
        	<p style="font-weight: bold; ">대구 치맥 페스티벌</p>
        </div>
     </div> <!-- /.project-item -->
	
	 <div class="col-md-4 project-item mix" style="margin-top: 10px; margin-left: -70px;">
	 	<div class="project-thumb">
        	<img alt="보령 머드축제" src="./resources/image/main/mud.jpg" style="height: 350px; width: 300px;">
            <div class="overlay-b" style="width: 300px;">
               	<div class="overlay-inner">
                   	<a href="#" class="fancybox fa fa-expand" title="상세보기"></a>
                   </div>
     		</div>
        </div>
        <div class="box-content project-detail">
        	<p style="font-weight: bold;">보령 머드축제</p>
        </div>
     </div> <!-- /.project-item -->
	
</body>
</html>