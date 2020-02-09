<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index.css">
</head>
<body>

	<c:import url="./public/header.jsp" />

	<div id="container">
		<div class="top-area">
			<div class="t-left">
				<img src="resources/img/map_seoul.JPG" width="550px" height="426px">
			</div>
			<div class="t-right">
				<h2 style="text-align:center;">서울시 상권분석 사이트</h2>
				<br>
				<h4>저희 사이트는 게시판을 통해 창,폐업 및 지역 상권 별 홍보, 의견 등을 공유하며, 데이터를 기반으로 한 지역별 상권 분석서비스를 제공합니다.</h4>
				<br>
				<br>
				<h5 style="text-align:right;"><a href="commercialDistricts">상권분석 페이지로 이동</a></h5>
				<h5 style="text-align:right;"><a href="Important_Notice">공지사항</a></h5>
				<h5 style="text-align:right;"><a href="Free_Board">자유게시판</a></h5>
				<h5 style="text-align:right;"><a href="Publicity_Activities">홍보</a></h5>
				<h5 style="text-align:right;"><a href="Tip">질문/답변</a></h5>	
			</div>
		</div>
	</div>

	<c:import url="./public/footer.jsp" />

</body>
</html>