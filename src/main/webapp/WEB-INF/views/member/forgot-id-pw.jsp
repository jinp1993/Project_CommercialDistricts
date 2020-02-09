<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.test-body {
	padding: 25px 20%;
}

.nav-css {
	list-style-type: none;
	text-align: center;
}

.nav-css li {
	padding: 10px;
}

.btn-css {
	width: 150px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#find-id").click(function() {
			var name = $("#id_name").val();
			var email = $("#id_email").val();
			var tel = $("#id_phone-num").val();
			$.ajax({
				url : "find_id",
				type : "POST",
				data : {
					name : name,
					email : email,
					tel : tel
				},
				success : function(result) {
					var list = "";
					if (result != null) {
						for (var i = 0; i < result.length; i++) {
							list += (result[i] + ", ");
						}
						alert(list);
					} else {
						alert("입력하신 정보가 잘못되었거나 아이디가 존재하지 않습니다.");
					}
				}
			})
		});
	});

	$(document).ready(function() {
		$("#find-pw").click(function() {
			var id = $("#pw_uname").val();
			var name = $("#pw_name").val();
			var tel = $("#pw_phone-num").val();
			$.ajax({
				url : "find_pw",
				type : "POST",
				data : {
					id : id,
					name : name,
					tel : tel
				},
				success : function(result) {
					if(result != null) {
						alert(result);
					}	
				}
			})
		});
	});
</script>

</head>
<body>

	<c:import url="../public/header.jsp" />

	<div class="container">
		<div class="row">
			<br>
			<div style="padding-top: 20px; width: 100%;">
				<div class="form-body">
					<ul class="nav nav-tabs tab nav-css justify-content-center">
						<li><a data-toggle="tab" href="#sectionA"
							class="btn btn-danger btn-css">아이디 찾기</a></li>

						<li><a data-toggle="tab" href="#sectionB"
							class="btn btn-danger btn-css">비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>

		</div>
		<div class="tab-content">
			<div id="sectionA" class="tab-pane fade in active">
				<div id="section-area" align="center" style="padding: 10px 15%;">

					<div class="test-body">
						<h3>아이디 찾기</h3>
						<br>
						<div class="form-group">
							<label for="name">이름 :</label> <input type="text"
								class="form-control" id="id_name" placeholder="Enter name"
								name="name">
							<div id="name-feedback"></div>
						</div>
						<div class="form-group">
							<label for="name">이메일 :</label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="e-mail"
									id="id_email" name=email aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</div>
						</div>
						<div class="form-group">
							<label for="name">전화번호 :&nbsp;<b class="text-secondary">(
									- 없이 숫자만 입력해 주세요!!)</b></label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="id_phone-num"
									name="phone-num" placeholder="phone number">
							</div>
							<div id="phone-num-feedback"></div>
						</div>
						<div>
							<br> <input type="button" class="btn btn-danger btn-css"
								id="find-id" value="아이디 찾기">
						</div>

					</div>
				</div>
			</div>
			<div id="sectionB" class="tab-pane fade">
				<div id="section-area">
					<div id="section-area" align="center" style="padding: 10px 15%">

						<div class="test-body">
							<h3>비밀번호 찾기</h3>
							<br>
							<div class="form-group">
								<label for="id">아이디 :</label> <input type="text"
									class="form-control" id="pw_uname" placeholder="Enter ID"
									name="uname" maxlength="20">
								<div id="id-feedback"></div>
							</div>
							<div class="form-group">
								<label for="name">이름 :</label> <input type="text"
									class="form-control" id="pw_name" placeholder="Enter name"
									name="name">
								<div id="name-feedback"></div>
							</div>
							<div class="form-group">
								<label for="name">전화번호 :&nbsp;<b class="text-secondary">(
										- 없이 숫자만 입력해 주세요!!)</b></label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="pw_phone-num"
										name="phone-num" placeholder="phone number">
								</div>
								<div id="phone-num-feedback"></div>
							</div>
							<div>
								<br> <input type="button" class="btn btn-danger btn-css"
									id="find-pw" value="비밀번호 찾기">
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../public/footer.jsp" />
</body>
</html>