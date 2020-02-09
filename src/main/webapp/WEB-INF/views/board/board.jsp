<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<meta charset="UTF-8">
<title>SUC</title>

</head>
<body>



	<c:import url="../public/header.jsp" />



	<div id="fh5co-services">
		<div class="container">
			<div class="row">
				<div class="">
					<div class="row">


						<div class="fh5co-service2">
							<div class="fh5co-desc2">
								<div>
									<span style="float: right;"><a class="a1"
										href="Important_Notice" title="공지사항">더보기</a></span>
									<h3>
										<a href="Important_Notice" class="m-tcol-t1" title="공지사항">Important
											Notice</a>
									</h3>
								</div>
								<hr class="hr">
								<table class="table_layout">
									<colgroup>

										<col width="80%" />

										<col width="10%" />

										<col width="10%" />

									</colgroup>
									<tr>
										<th style="text-align: center;">제목</th>
										<th style="text-align: left;">작성자</th>
										<th style="text-align: left;">조회수</th>
									</tr>

									<tbody>
										<c:forEach items="${ImportantNotice}" var="dto">
											<c:if test="${dto != null}">
												<tr>
													<td ><a class="title inner"
														href="content_view?id=${dto.id }&idgroup=${dto.idgroup}">${dto.title}
															<c:if test="${dto.cnt > 0}">[${dto.cnt}]</c:if>
													</a></td>
													<td>${dto.name}</td>
													<td>${dto.hit }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class=" fh5co-service2">
							<div class=""></div>
							<div class="fh5co-desc2">
								<div>
									<span style="float: right;"><a class="a1"
										href="Free_Board">더보기</a></span>
									<h3>
										<a href="Free_Board" class="m-tcol-t1" title="자유게시판">Free
											Board</a>
									</h3>
								</div>
								<hr class="hr">

								<table class="table_layout">
									<colgroup>

										<col width="80%" />

										<col width="10%" />

										<col width="10%" />

									</colgroup>
									<tr>
										<th style="text-align: center;">제목</th>
										<th style="text-align: left;">작성자</th>
										<th style="text-align: left;">조회수</th>
									</tr>

									<tbody>
										<c:forEach items="${FreeBoard}" var="dto">
											<c:if test="${dto != null}">
												<tr>
													<td class="inner"><a class="title"
														href="content_view?id=${dto.id }&idgroup=${dto.idgroup}">${dto.title}
															<c:if test="${dto.cnt > 0}">[${dto.cnt}]</c:if>
													</a></td>
													<td>${dto.name}</td>
													<td>${dto.hit }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>


						<div class="fh5co-service2">
							<div class="fh5co-desc2">
								<div>
									<span style="float: right;"><a class="a1"
										style="text-align: left;" href="Publicity_Activities">더보기</a></span>
									<h3>
										<a href="Publicity_Activities" class="m-tcol-t1" title="홍보">Publicity
											Activities </a>
									</h3>
								</div>
								<hr class="hr">
								<table class="table_layout">
										<colgroup>

										<col width="80%" />

										<col width="10%" />

										<col width="10%" />

									</colgroup>
									<tr>
										<th style="text-align: center;">제목</th>
										<th style="text-align: left;">작성자</th>
										<th style="text-align: left;">조회수</th>
									</tr>

									<tbody>
										<c:forEach items="${PublicityActivities}" var="dto">
											<c:if test="${dto != null}">
												<tr>
													<td class="inner"><a class="title"
														href="content_view?id=${dto.id }&idgroup=${dto.idgroup}">${dto.title}
															<c:if test="${dto.cnt > 0}">[${dto.cnt}]</c:if>
													</a></td>
													<td>${dto.name}</td>
													<td>${dto.hit }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="fh5co-service2">
							<div class="fh5co-icon to-animate"></div>
							<div class="fh5co-desc2">
								<div>
									<span style="float: right;"><a class="a1"
										style="text-align: left;" href="Q&A&TIP">더보기</a></span>
									<h3>
										<a href="Tip" class="m-tcol-t1" title="팁&질문&답변">Tip&Q&A
											Board</a>
									</h3>
								</div>
								<hr class="hr">
								<table class="table_layout">
									<colgroup>

										<col width="80%" />

										<col width="10%" />

										<col width="10%" />

									</colgroup>
										<tr>
										<th style="text-align: center;">제목</th>
										<th style="text-align: left;">작성자</th>
										<th style="text-align: left;">조회수</th>
									</tr>

									<tbody>
										<c:forEach items="${Tip}" var="dto">
											<c:if test="${dto != null}">
												<tr>
													<td class="inner"><a class="title"
														href="content_view?id=${dto.id }&idgroup=${dto.idgroup}">${dto.title}
															<c:if test="${dto.cnt > 0}">[${dto.cnt}]</c:if>
													</a></td>
													<td>${dto.name}</td>
													<td>${dto.hit }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
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