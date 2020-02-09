<! DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<meta charset="UTF-8">
<title>SUC</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.4.1.min.js"></script>
</head>
<body>

	<c:import url="../public/header.jsp" />

	<div id="fh5co-services">
		<div class="container">
			<div class="row">
				<div class=" fh5co-service1">
					<div class="fh5co-desc2">


						<h3>
							<a href="Important_Notice" class="m-tcol-t1" title="공지사항">Important
								Notice</a>
						</h3>

						<hr class="hr">
						<table>
							<colgroup>

								<col width="60%" />
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />

							</colgroup>

							<tr>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">작성자</th>
								<th style="text-align: center;">작성일</th>
								<th style="text-align: center;">조회수</th>
							</tr>
							<c:forEach items="${list}" var="dto">



								<c:if test="${dto != null}">
							
									<tr>
										<td><a class="title"
											href="content_view?id=${dto.id }&idgroup=${dto.idgroup}">${dto.title}
											<c:if test="${dto.cnt > 0}">[${dto.cnt}]</c:if></a></td>
										<td align="center">${dto.name}</td>
										<td align="center"><fmt:formatDate value="${dto.savedate}"
												pattern="yyyy-MM-dd  HH:mm" /></td>
										<td align="center">${dto.hit }</td>
									</tr>
								</c:if>
								<c:if test="${dto == null}">

									<tr>
										<th colspan="3">등록된 정보가 없습니다</th>
									</tr>
								</c:if>


							</c:forEach>

							<tr>
								<td colspan="3" align="right">
									<button type="button" id="btn_regForm">등록</button>
								</td>
							</tr>

						</table>





						<form action="search" method="post" style="text-align: center;">
							<select size="1" name="sel">
								<option value="title" selected>제목
								<option value="name">작성자
							</select> <input type="text" name="search" style="width: 50%;"> <input
								type="submit" value="검색">
						</form>

						<div align="center">
							<ul class="ul">
								<c:if test="${pageMaker.prev}">
									<li><a class="title"
										href="Important_Notice?board=Important_Notice&page=${pageMaker.starPage - 1}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.starPage}"
									end="${pageMaker.endPage}" var="idx">
									
										<li
											<c:out value="${pageMaker.criteria.page == idx ? 'class=active':'d' }"/>>
											<a class="title" href="Important_Notice?board=Important_Notice&page=${idx}">${idx}</a>
										</li>
									
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li><a class="title"
										href="Important_Notice?board=Important_Notice&page=${pageMaker.endPage + 1 }">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





















	<c:import url="../public/footer.jsp" />



	<script type="text/javascript">
	
$("#btn_regForm").click(function() {
var name = '<%=(String) session.getAttribute("userId")%>';

console.log(name);
if (name=='null'){
	alert("로그인후 이용가능합니다");
	location.reload();
}else{
location.href="regForm";
}
});
</script>


</body>
</html>