<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>SUC</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SUC &mdash; A Start-up Community</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" /> 
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />


<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Webfonts -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,300,100,500'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<!-- Simple Line Icons -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/simple-line-icons.css">
<!-- Theme Style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Modernizr JS -->
<script src="<c:url value="/resources/js/modernizr-2.6.2.min.js" />"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="<c:url value="/resources/js/respond.min.js" />"></script>
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
						<h1 class="intro-lead">Start-up Community</h1>
						<p class="">
							A start-up community by <a href="http://freehtml5.co/"
								target="_blank">my team</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-portfolio">
			<div class="fh5co-portfolio-item ">
				<div class="fh5co-portfolio-figure animate-box"
					style="background-image: url(./resources/images/work_1.jpg);"></div>
				<div class="fh5co-portfolio-description" align="right">
					<h2>Login</h2>
					<p>
						<input type="text" name="id" placeholder="ID"><br> <input
							type="text" name="pw" placeholder="PASSWORD">
					</p>
					<p>
						<button type="submit" class="btn btn-primary"></button>
							Login
					</p>
				</div>
			</div>
			<div class="fh5co-portfolio-item">
				<div class="fh5co-portfolio-figure animate-box"
					style="background-image: url(./resources/images/map_0.png); background-size: 400px;"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project Second</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean. A small river named Duden flows
						by their place and supplies it with the necessary regelialia.</p>
					<p>
						<a href="#" class="btn btn-primary">Read the casetudy</a>
					</p>
				</div>
			</div>
			<!--		<div class="fh5co-portfolio-item ">
				<div class="fh5co-portfolio-figure animate-box" style="background-image: url(./resources/images/work_3.jpg);"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project Third</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
					<p><a href="#" class="btn btn-primary">Read the casetudy</a></p>
				</div>
			</div>
	 		<div class="fh5co-portfolio-item fh5co-img-right">
				<div class="fh5co-portfolio-figure animate-box" style="background-image: url(./resources/images/work_4.jpg);"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project Fourth</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
					<p><a href="#" class="btn btn-primary">Read the casetudy</a></p>
				</div>
			</div> 
		</div>  -->

			<!-- 		<div id="fh5co-team">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<h2 class="section-lead text-center">Leadership</h2>
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure>
								<img src="./resources/images/user.jpg" alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
								</figure>
								<h3>Will Barrow</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul> 	
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure>
								<img src="./resources/images/user_2.jpg" alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
								</figure>
								<h3>Max Conversion</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul> 	
							</div>
							<div class="clearfix visible-sm-block visible-xs-block"></div>
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure>
								<img src="./resources/images/user_3.jpg" alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
								</figure>
								<h3>Hanson Deck</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul> 	
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure>
								<img src="./resources/images/user.jpg" alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
								</figure>
								<h3>Sue Shei</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul> 	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
-->
			<div id="fh5co-services">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="row">
								<!-- 여기 -->
								<h2 class="section-lead text-center">Daily Best</h2>
									<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
										<div class="fh5co-icon to-animate">
											<i class="icon-present"></i>
										</div>
										<div class="fh5co-desc">
											<h3>Free Board</h3>
											<table border="1">
												<tr>
													<th width="400px" align="center">제목</th>
													<th width="100px">작성자</th>
													<th width="100px">조회수</th>
												</tr>
												<tr>
													<td>요즘 어느 상권이 제일 유망한가요?</td>
													<td>pjy</td>
													<td>500</td>
												</tr>
												<tr>
													<td>이태원 젠트리피케이션으로 장사 접습니다</td>
													<td>hsc</td>
													<td>400</td>
												</tr>
												<tr>
													<td>카페도 잘 될 수 있겠죠?</td>
													<td>CO</td>
													<td>350</td>
												</tr>
											</table>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
										<div class="fh5co-icon to-animate">
											<i class="icon-eye"></i>
										</div>
										<div class="fh5co-desc">
											<h3>Tip & Q&A Board</h3>
											<table border="1">
												<tr>
													<th width="400px" align="center">제목</th>
													<th width="100px" align="center">작성자</th>
													<th width="100px" align="center">조회수</th>
												</tr>
												<tr>
													<td>창업 1년만에 월매출 1억 찍은 팁</td>
													<td>pjy</td>
													<td>500</td>
												</tr>
												<tr>
													<td>지금 진입하면 안되는 상권 정리</td>
													<td>hsc</td>
													<td>400</td>
												</tr>
												<tr>
													<td>효과적인 홍보 팁</td>
													<td>CO</td>
													<td>350</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="clearfix visible-sm-block visible-xs-block"></div>
								<!--						<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
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
							</div>  -->
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
		<!-- Main JS -->
		<script src="<c:url value="/resources/js/main.js" />"></script>
</body>
</html>