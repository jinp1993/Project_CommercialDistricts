<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Clean &mdash; A free HTML5 Template by FREEHTML5.CO</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
	  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- Google Webfonts -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,300,100,500' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
	<!-- Theme Style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- Modernizr JS -->
	<script src="<c:url value="/resources/js/modernizr-2.6.2.min.js" />"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src=""<c:url value="/resources/js/respond.min.js" />"></script>
	<![endif]-->
	

</head>
<body>

	<c:import url="./public/header.jsp" />
	<!-- END .header -->

	<div id="fh5co-main">
		<div class="fh5co-intro text-center">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="intro-lead">Login Page</h1>
						<p class="">Login to <a href="http://freehtml5.co/" target="_blank">SUC</a></p>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-content">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<div class="col-md-3 animate-box">
								<h3>side bar</h3>
								<p>content</p>
								<ul class="fh5co-list-check">
									<li>Far far away</li>
									<li>The word mountains</li>
									<li>Far from the countries</li>
									<li>Bookmarksgrove right</li>
								</ul>
							</div>
							<div class="col-md-9">
								<div align="center">
									<h1>Welcome!</h1>
								</div>
								<form class="user">
									<div class="form-group" align="center">
										<input type="text" name="id" placeholder="ID">
									</div>
									<div class="form-group" align="center">
										<input type="password" name="pw" placeholder="Password">
									</div>
									<div class="form-group" align="center">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input"
												id="customCheck"> <label
												class="custom-control-label" for="customCheck">Remember
												Me</label>
										</div>
									</div>
									<div align="center"  width="300px">
									<!-- <a href="index.jsp" class="btn btn-primary btn-user btn-block"></a> -->
									<button type="submit" class="btn btn-primary">Login</button>
									</div>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="forgot-password.jsp">Forgot
										Password?</a>
								</div>
								<div class="text-center">
									<a class="small" href="register.jsp">Create an Account!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-services">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<h2 class="section-lead text-center">Features</h2>
							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate"><i class="icon-present"></i></div>
								<div class="fh5co-desc">
									<h3>100% Free</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>	
							</div>
							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate"><i class="icon-eye"></i></div>
								<div class="fh5co-desc">
									<h3>Retina Ready</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
							<div class="clearfix visible-sm-block visible-xs-block"></div>
							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate"><i class="icon-crop"></i></div>
								<div class="fh5co-desc">
									<h3>Fully Responsive</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>

							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate"><i class="icon-speedometer"></i></div>
								<div class="fh5co-desc">
									<h3>Lightweight</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>	
							</div>
							<div class="clearfix visible-sm-block visible-xs-block"></div>
							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate"><i class="icon-heart"></i></div>
								<div class="fh5co-desc">
									<h3>Made with Love</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate"><i class="icon-umbrella"></i></div>
								<div class="fh5co-desc">
									<h3>Eco Friendly</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
							<div class="clearfix visible-sm-block visible-xs-block"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<c:import url="./public/footer.jsp" />


	<!-- jQuery -->
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js" />"></script>
	<!-- Bootstrap -->
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<!-- Waypoints -->
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js" />"></script>
	<!-- Magnific Popup -->
	<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js" />"></script>
	<!-- Main JS -->
	<script src="<c:url value="/resources/js/main.js" />"></script>

	
	</body>
</html>