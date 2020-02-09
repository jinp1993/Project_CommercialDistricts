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
</head>
<body>

	<fmt:requestEncoding value="utf-8" />
	<c:import url="../public/header.jsp" />
	






	<div id="fh5co-services" style="background-color: white;">
		<div class="row">
			<div class="container">
				
					<div class="fh5co-desc2">

						<div  style="margin: 10px;">


							<div>
								<label>${list.title}</label>
								<c:if test="${sessionScope.userId == list.name}">

									<a href="revise?id=${list.id }"><button
											style="display: inline-block; float: right;">수정</button></a>
									<a href="delete?id=${list.id }&menuid=${list.board}"><button
											style="display: inline-block; float: right;">삭제</button></a>
								</c:if>


							</div>

							<hr>
							<div>
								<label>${list.name}</label><span style="font-size: 10px; color: navy; padding-left: 15px; "><fmt:formatDate value="${list.savedate}"
												pattern="yyyy-MM-dd  HH:mm" /></span> <hr>



								<div>
								<p id= "main_content">${list.content} </p>

								</div>

								<table>
									<tr>
										<td><div style="height: 120px;"></div></td>
									</tr>
								
								</table>

							</div>

							<hr>

							<div >

								<div id="listReply"></div>


								<c:if test="${sessionScope.userId != null }">
								<div style="border:solid black thin; ">	<textarea id="textbox"
										style="margin: 0 0 0 0; height: 100px; border: 0px; width: 95%;"
										name="content" title="내용 입력" cols="93" rows="28"></textarea></div>
									<br>
									<button type="button" id="btnReply">등록</button>
								</c:if>
								<c:if test="${sessionScope.userId == null }">
									<span
										style="display: table; margin-left: auto; margin-right: auto;">로그인시
										입력이 가능합니다</span>
									<br>
								</c:if>
								<button id="back" style="float: right">목록보기</button>
							</div>
						</div>

					</div>
				</div>
	</div>

	</div>


	<script type="text/javascript" src="resources/jquery-3.4.1.min.js"></script>
	

	<script>
	
	$("#back").click(function() {
		var board="${list.board}";
		location.href=board;
	});
	
		$("#btnReply").click(function() {
			
			var content = $("#textbox").val(); //댓글 내용
			var id = "${list.id}"; //게시물 번호
			var step = "${list.step}"; //댓글순서
		
			if(!content){
				
				    alert("내용을 입력해주세요");
				    return false;		
				
			}
			$.ajax({
				type : "post",
				url : "reply_insert.do", //데이터를 보낼 url
				data : {
					"content" : content,
					"id" : id,
					"step" : step
				}, //보낼 데이터

				success : function(data) {
					console.log("저장 성공");
					
					$('#textbox').val('');
					listReply(); //댓글 목록 출력
				},
				error : function() {
					console.log("실패");
					
				}

			});
		});
		
		function listReply() {
			console.log("listReply()호출");
			$.ajax({
				type : "get",
				url : "reply_list.do",
				dataType : "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				data : {
					"id" : "${list.id}"
				},
				success : function(data) {
					  var name = '<%=(String) session.getAttribute("userId")%>';
							var a = '';
							if (data.length > 0) {

								for (i = 0; i < data.length; i++) {
									if (data[i].idgroup != data[i].id) {
										var repl=data[i].content
										repl = repl.replace(/  /gi,"&nbsp;&nbsp;");
						                repl = repl.replace(/</gi,"&lt;"); 
						                repl = repl.replace(/>/gi,"&gt;");
						                repl = repl.replace(/\n/gi,"<br>"); 

										a += '<div><table class="table"><span><strong>'
												+ data[i].name
												+ '</strong></span>';
										a += '<span style="margin-left:15px;font-size: 10px;">'
												+ new Date(data[i].savedate).format('yyyy.MM.dd hh:mm') + '</span>';
										if (name == data[i].name) {

											a += '<a style="margin-left:15px; margin-right:5px; font-size:13px;"id="cick" href="javascript:void(0)" onclick="replyUpdateview('
													+ data[i].id
													+ ')">수정</a><span style="font-size:13px;">|</span>';
											a += '<a style="margin-left:5px;font-size:13px;"href="javascript:void(0)" onclick="replyDelete('
													+ data[i].id + ')">삭제</a>';
											a += '<div id="textbox_'+data[i].id+'"></div>'
										}

										a += '<br><p id="content'+data[i].id+'">'
												+ repl
												+ '</p><tr><td></td></tr>';
										a += '</table></div>';

									}

								}
							} else {

								a += '<div>';
								a += '<div><table class="table"><h6><strong>등록된 댓글이 없습니다.</strong></h6>';
								a += '</table></div>';
								a += '</div>';

							}

							$("#listReply").html(a);
						},
						error : function(error) {
							console.log("에러");
						}

					});
		}

		/**
		 * 초기 페이지 로딩시 댓글 불러오기
		 */
		$(function() {
			var main= $('#main_content').text();
			main = main.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
			main = main.replace(/</gi,"&lt;"); //태그문자 처리
			main = main.replace(/>/gi,"&gt;");
            main = main.replace(/\n/gi,"<br>"); //줄바꿈 처리
			$('#main_content').html(main);
			listReply();

		});

		//댓글 수정

		function replyUpdateview(id) {

			var content = $('#content' + id).text();
			console.log(content + 'dd');

			var a = '';
			a += '<a href="javascript:void(0)" style="float: right;font-size:13px; margin: 0 2% 0 0;" onclick="listReply();">수정 취소</a>';
			a += '<table> <tr><td><div>';
			a += '<textarea id="textbox1" style="margin: 15px; height: 100px; border: 0px; width: 98%; float: left" name="content" title="내용 입력" cols="93" rows="28">'
					+ content + '</textarea>';

			a += '</td><td text-alige><button  type="button" style="display: inline-block; float: right; " onclick="replyUpdate('
					+ id + ');">수정</button>';
			a += '</div></td></tr></table>';
			$('p').remove('#content' + id);

			$('#textbox_' + id).html(a);

		}

		//댓글 수정
		function replyUpdate(id) {

			var updateContent = $('#textbox1').val();
			if (!updateContent) {

				alert("내용을 입력해주세요");
				return false;

			}
			$.ajax({
				url : 'reply_update',
				type : 'post',
				data : {
					'content' : updateContent,
					'id' : id
				},
				success : function(data) {

					listReply(); //댓글 수정후 목록 출력 
				}
			});
		}

		//댓글 삭제 
		function replyDelete(id) {
			var v = confirm("댓글을 삭제합니다");
			if (v) {
				$.ajax({
					url : 'reply_delete',
					type : 'post',
					data : {
						'id' : id
					},
					success : function(data) {
						listReply(); //댓글 삭제후 목록 출력 
					}
				});

			} else {
				return false;
			}

		}
		
		//시간출력
	Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

	</script>

<c:import url="../public/footer.jsp" />

</body>
</html>