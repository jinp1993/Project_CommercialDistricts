<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>header</title>
<style type="text/css">
.modal-style {
	margin-top: 10px;
	margin-bottom: 10px;
}

.nav-border {
	border-bottom: 1px solid default;
}

.logo-test {
	border: 1px solid default;
	padding: 5% 10% 5% 10%;
	background-color: red;
	width: 60px;
	text-align: center;
}

.dropdown-toggle:after {
	border: none;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#login").click(function() {
		var id =  $("#id").val();
		var pw =  $("#pw").val();
		$.ajax({
			url: "login",
			type: "POST",
			data: {
				id : id,
				pw : pw
			},
			success: function(result) {
				if(result == 1) {
					alert("로그인 성공");
					location.reload();					
				} else {
					alert("로그인 실패");
				}
			},
			error:function(){
				alert("로그인 에러");
			}
		})
	});
});
</script>

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light nav-border">
		<a class="navbar-brand" href="#"><div class="logo-test text-white">SUC</div></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="index">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="commercialDistricts">Commercial
						Districts Info</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">board</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="Important_Notice">공지사항</a> <a
							class="dropdown-item" href="Free_Board">자유게시판</a>
							 <a class="dropdown-item" href="Publicity_Activities">홍보</a>
							<a class="dropdown-item" href="Tip">질문/답변</a>
					</div></li>

				<c:choose>
					<c:when test="${userId == null}">
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#myModal">login</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">log(${userId})</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="mypage">My page</a> <a
									class="dropdown-item" href="logout">Logout</a>
							</div></li>
					</c:otherwise>
				</c:choose>
				</ul>
		</div>
	</nav>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Login Modal</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="login">
						<div class="col-xs-3">
							<input class="form-control modal-style" id="id" type="text"
								placeholder="ID"> <input
								class="form-control modal-style" id="pw" type="password"
								placeholder="PW"> <br>

							<button type="button" class="btn btn-danger btn-block" id="login">Login</button>
							<button type="button" class="btn btn-danger btn-block"
								onclick="location.href='register1'">회원가입</button>
							<div class="modal-style" align="center">
								<a href="forgotidpw">아이디 / 비밀번호 찾기</a>
							</div>
						</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<br>
				</div>

			</div>
		</div>
	</div>
</body>
</html>