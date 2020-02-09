<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html >
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<meta charset="UTF-8">
<title>SUC</title>


</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<c:import url="../public/header.jsp" />

	<div id="fh5co-services">
		<div class="container">
			<div class="row2">
				<div class="fh5co-desc2">
					
						<div id="nboard" style="width: 100%; text-align: left;">
							<ul class="subject">
								<li><div>
										<label for="boardCategory">게시판</label> <select name="menuid"
											style="width: 152px;"
											onchange="BoardCategoryMgr.onChangeBoardCategory(); return false;"
											id="boardCategory">
											<!--onchange function으로 기본양식 만들때 사용  -->
											<option value="-1">게시판선택</option>
											<option value="Free_Board">FreeBoard</option>
											<option value="Important_Notice">ImportantNotice</option>
											<option value="Publicity_Activities">PublicityActivities</option>
											<option value="Q&A/Tip">Q&A/Tip</option>
										</select>
									</div></li>
								<li><div>
										<label for="subject">제목</label> <input type="text"
											name="title" value="${list.title}" id="subject"
											style="width: 60%;">
									</div></li>
							</ul>
							<textarea id="textbox" 
								style="visibility: visible; margin: 0 25px 0 25px; height: 300px; width: 90%;"
								name="content" title="내용 입력" cols="120" rows="28">${list.content}</textarea>
						</div>
						<div align="center">
							<span style="float: inherit; padding: 0 0 0 0;">
								<button type="button" id = "btn_update" >수정</button>
							</span>
						</div>
					
					<button onclick="back();">뒤로가기</button>
				</div>
			</div>
		</div>
	</div>

<c:import url="../public/footer.jsp" />
<script type="text/javascript" src="resources/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function back() {
			window.history.back()
		}
		
		$("#btn_update").click(function() {
			var name = '<%=(String) session.getAttribute("userId")%>';		
			var menuid = $('#boardCategory').val();
			var title = $('#subject').val();
			var content = $("#textbox").val();
			var id= "${list.id}"
			console.log(id+'id');
			console.log(menuid+'menuid');
			console.log(title+'title');
			console.log(content+'content');
			if (name=='null'){
				alert("비정상적인 경로로 접근하였습니다.\n로그인후 이용가능합니다");
				location.href="index";
			}else if(menuid=='-1'){			
				 alert("게시판을 선택해주세요");
				 return false;		
			}else if(!title){			
				 alert("제목을 입력해주세요");
				 return false;		
			}else if(!content){			
				 alert("내용을 입력해주세요");
				 return false;		
			}else{
			$.ajax({
				type : "post",
				url : "revise_save", //데이터를 보낼 url
				data : {
					"id" : id,
					"menuid" : menuid,
					"title" : title,
					"content" : content
				}, //보낼 데이터
				success : function(data) {
					
					
					location.href=menuid;
				}
				
		});
			}
		});
	</script>
	

</body>
</html>