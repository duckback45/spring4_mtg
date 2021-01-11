<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8" />
<title>M.T.G-당신만의 여행을 꿈꾸세요.</title>
<script type="text/javascript"
	src="/mtg/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/mtg/resources/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="/mtg/resources/css/style.css" />
<style type="text/css">
.menubar {
	margin-left: -40px;
	margin-top: 10px;
}

.list {
	float: left;
	margin-right: 15px;
}
a{
text-decoration: none;}
li {
	list-style: none;
}

#login {
	margin-left: 1300px;
	margin-top: 0px;
}

#admin {
	margin-left: 200px
}

#member {
	margin-left: 240px;
}

#logout {
	margin-left: 320px;
}

#mtglogo {
	margin: 10px;
	margin-top: -5px;
	float: left;
	height: 45px;
}

.menubar a {
	margin-left: 20px;
	margin-top: 10px;
	font-size: 15pt;
	color: gray;
	cursor: pointer;
	text-decoration: none;
}
</style>
<body>
	<h1>
		<img src="./resources/image/header/logo.png"
			onclick="location.href='main.mtg'" id="mtglogo">
	</h1>

	<div class="menubar">
		<ul>
			<li class="list"><a href="planReg.mtg">일정 만들기</a></li>
			<li class="list"><a href="reviewList.mtg">나의 여행기</a></li>
			<li class="list"><a href="InformationList.mtg">여행정보 공유</a></li>
			<li class="list"><a href="qnaList.mtg">질문있어요</a></li>
			<c:if test="${sessionScope.mem.mem_type==1}">
				<li class="list"><a href="memList.mtg">회원목록</a></li>
			</c:if>
		</ul>
	</div>
	<!-- menubar -->

	<div id="login">
		<c:if test="${sessionScope.mem.mem_type==1}">
			<li><a id="admin"><font color="#797474"><b>${sessionScope.mem.mem_nickname}</b></font></a><font
				color="#797474">로 로그인하셨습니다.</font></li>
			<a id="logout" href="logout.mtg"><font color="#797474">로그아웃</font></a>
		</c:if>
		<c:if test="${sessionScope.mem.mem_type==0}">
			<li><a id="member" href="./myInforList.mtg"><font
					color="#797474"><b>${sessionScope.mem.mem_nickname}</b></font></a><font
				color="#797474">님, 환영합니다!</font></li>
			<a id="logout" href="logout.mtg"><font color="#797474">로그아웃</font></a>
		</c:if>
		<c:if test="${sessionScope.mem == null}">
			<div 
				style="position: absolute; top: -80px; left: 1200px;">				<a id="modal_trigger" href="#modal" class="btn">Login</a>

				<div id="modal" class="popupContainer" style="display: none;">
					<header class="popupHeader"> <span class="header_title">Login</span>
					<span class="modal_close"><i class="fa fa-times"></i></span> </header>

					<section class="popupBody"> <!-- Social Login -->
					<div class="social_login">
						<!--       <div class="">
                  <a href="#" class="social_box fb"> <span class="icon"><i
                        class="fa fa-facebook"></i></span> <span class="icon_title">Connect
                        with Facebook</span>

                  </a> <a href="#" class="social_box google"> <span class="icon"><i
                        class="fa fa-google-plus"></i></span> <span class="icon_title">Connect
                        with Google</span>
                  </a>
               </div>

               <div class="centeredText">
                  <span>Or use your Email address</span>
               </div> -->

						<div class="action_btns">
							<div class="one_half">
								<a href="#" id="login_form" class="btn">Login</a>
							</div>
							<div class="one_half last">
								<a href="#" id="register_form" class="btn">Sign up</a>
							</div>
						</div>
					</div>

					<!-- Username & Password Login form -->
					<div class="user_login">
						<form action="login.mtg" method="post">
							<label>ID</label> <input type="text" name="mem_id" /> <br /> <label>Password</label>
							<input type="password" name="mem_pw" /> <br />

							<div class="action_btns">
								<div class="one_half">
									<a href="#" class="btn back_btn"><i
										class="fa fa-angle-double-left"></i> Back</a>
								</div>
								<div class="one_half last">
									<input type="submit" class="btn btn_red" value="Login">
								</div>
							</div>
						</form>

						<a href="#" class="forgot_id">Forgot ID?</a> <a href="#"
							class="forgot_pw">Forgot PASSWORD?</a>
					</div>

					<!-- Find ID -->
					<div class="find_id">
						<form action="idfind.mtg" method="post">
							<label>Nickname</label><input type="text" name="mem_nickname" /><br />
							<labe>Email</label> <input type="text" name="mem_email" /> <br />
							<div class="action_btns">
								<div class="one_half">
									<a href="#" class="btn back_btn"><i
										class="fa fa-angle-double-left"></i> Back</a>
								</div>
								<div class="one_half last">
									<input type="submit" class="btn btn_red" value="Find">
								</div>
							</div>
						</form>
					</div>

					<!-- Find PASSWORD -->
					<div class="find_pw">
						<form action="pwfind.mtg" method="post">
							<label>ID</label><input type="text" name="mem_id" /><br />
							<labe>Email</label> <input type="text" name="mem_email" /> <br />
							<div class="action_btns">
								<div class="one_half">
									<a href="#" class="btn back_btn"><i
										class="fa fa-angle-double-left"></i> Back</a>
								</div>
								<div class="one_half last">
									<input type="submit" class="btn btn_red" value="Find">
								</div>
							</div>
						</form>
					</div>

					<!-- Register Form -->
					<div class="user_register">
						<form action="memberend.mtg" method="post">
							<label>ID</label> <input type="text" name="mem_id" /> <br /> <label>Password</label>
							<input type="password" name="mem_pw" /> <br /> <label>Nickname</label>
							<input type="text" name="mem_nickname" /> <br /> <label>Email
								Address</label> <input type="text" name="mem_email" /> <br /> <label>Mobile</label>
							<input type="text" name="mem_mobile" /> <br />

							<!-- <div class="checkbox">
                     <input id="send_updates" type="checkbox" /> <label
                        for="send_updates">Send me occasional email updates</label>
                  </div> -->

							<div class="action_btns">
								<div class="one_half">
									<a href="#" class="btn back_btn"><i
										class="fa fa-angle-double-left"></i> Back</a>
								</div>
								<div class="one_half last">
									<input type="submit" class="btn btn_red" value="Register">
								</div>
							</div>
						</form>
					</div>







					</section>
				</div>
			</div>
		</c:if>
	</div>
	<script type="text/javascript">
		$("#modal_trigger").leanModal({
			top : 200,
			overlay : 0.6,
			closeButton : ".modal_close"
		});

		$(function() {
			$("#modal_trigger").click(function(){
				$(".find_id").hide();
				$(".find_pw").hide();
				return false;
			});
			// Calling Login Form
			$("#login_form").click(function() {
				$(".social_login").hide();
				$(".find_id").hide();
				$(".find_pw").hide();
				$(".user_login").show();
				return false;
			});

			// Calling Register Form
			$("#register_form").click(function() {
				$(".social_login").hide();
				$(".find_id").hide();
				$(".find_pw").hide();
				$(".user_register").show();
				$(".header_title").text('Register');
				return false;
			});

			// Going back to Social Forms
			$(".back_btn").click(function() {
				$(".user_login").hide();
				$(".user_register").hide();
				$(".find_id").hide();
				$(".find_pw").hide();
				$(".social_login").show();
				$(".header_title").text('Login');
				return false;
			});

			$(".forgot_id").click(function() {
				$(".user_login").hide();
				$(".find_pw").hide();
				$(".find_id").show();
				return false;
			});
			
			$(".forgot_pw").click(function() {
				$(".user_login").hide();
				$(".find_id").hide();
				$(".find_pw").show();
				return false;
			});
		})
	</script>

</body>
</html>