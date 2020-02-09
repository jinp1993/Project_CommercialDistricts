<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../public/header.jsp" />
	<!-- 
	<h3>My page</h3>

	id : ${login}
	<br> ${dto.name }님 환영합니다. 
	-->
	<div class="container">
		<div style="padding: 20px 0;">
			<h2>
				안녕하세요<br> &nbsp;&nbsp;&nbsp;&nbsp;<b>${userId}</b>님
			</h2>
			
		</div>
		<div align="center" style="padding: 20px 0;">
			<input type="button" class="btn btn-danger" id="modifiy-btn"
				value="회원정보 수정" onclick="location.href='modify'"> <input type="button" class="btn btn-danger"
				id="del-user-info" value="회원 탈퇴" onclick="location.href='memberDel'"> 
		</div>
	


	</div>


	<c:import url="../public/footer.jsp" />
</body>
</html>