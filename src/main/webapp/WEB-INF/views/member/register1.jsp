<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register1-page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
.register-space {
	padding: 10px 10% 10% 10%;
}

.agree {
	border: 1px solid #e6e6e6;
}

.agree>div {
	overflow: auto;
	height: 124px;
	padding: 26px 19px;
	font-size: 13px;
	color: #555;
}

td {
	border-bottom: 1px solid #f6f6f6;
	padding: 5px 10px;
}

td:nth-child(2) {
	text-align: right;
	width: 40px;
}

tr:last-child td {
	border: none;
	padding: 30px 10px 10px;
	text-align: center;
}

input[type=checkbox] {
	cursor: pointer;
	height: 30px;
	margin: 4px 0 0;
	position: absolute;
	opacity: 0;
	width: 30px;
	z-index: 2;
}

input[type=checkbox]+span {
	background: #e74c3c;
	border-radius: 50%;
	box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1);
	display: inline-block;
	height: 30px;
	margin: 4px 0 0;
	position: relative;
	width: 30px;
	transition: all .2s ease;
}

input[type=checkbox]+span::before, input[type=checkbox]+span::after {
	background: #fff;
	content: '';
	display: block;
	position: absolute;
	width: 4px;
	transition: all .2s ease;
}

input[type=checkbox]+span::before {
	height: 16px;
	left: 13px;
	top: 7px;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

input[type=checkbox]+span::after {
	height: 16px;
	right: 13px;
	top: 7px;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}

input[type=checkbox]:checked+span {
	background: #2ecc71;
}

input[type=checkbox]:checked+span::before {
	height: 9px;
	left: 9px;
	top: 13px;
	-webkit-transform: rotate(-47deg);
	transform: rotate(-47deg);
}

input[type=checkbox]:checked+span::after {
	height: 15px;
	right: 11px;
	top: 8px;
}

input[type=button] {
	width: 200px;
	background-color: #2ecc71;
	border: 0;
	border-radius: 4px;
	color: #FFF;
	cursor: pointer;
	display: inline-block;
	font-size: 16px;
	text-align: center;
	padding: 12px 20px 14px;
	background-color: #2ecc71;
	margin: 5px;
}

input[type=reset] {
	width: 200px;
	background-color: gray;
	border: 0;
	border-radius: 4px;
	color: #FFF;
	cursor: pointer;
	display: inline-block;
	font-size: 16px;
	text-align: center;
	padding: 12px 20px 14px;
	margin: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submit-chk").click(function() {
			var required1 = $("input[name='Required-agree1']").prop("checked");
			var required2 = $("input[name='Required-agree2']").prop("checked");
			$.ajax({
				url : "agreeChk",
				type : "POST",
				data : {
					required1 : required1,
					required2 : required2
				},
				success : function(result) {
					if(result == 1) {
						// alert("성공");
						location.href='register2';
					} else {
						alert("필수항목을 체크해주세요.");
					}

				},
				error : function() {
					alert("실패");
				}
			})
		});
	});
</script>
</head>
<body>
	<c:import url="../public/header.jsp" />
	<div class="container">
		<div align="center">
			<br>
			<h1>회원가입 1단계 : 이용 약관 동의</h1>
			<br>
		</div>
		<div class="register-space">
			<table width="100%">
				<tr>
					<td>이용약관 동의&nbsp;<b class="text-success">(필수)</b></td>
					<td>
						<div>
							<input type="checkbox" name="Required-agree1" /> <span></span>
						</div>
					</td>
				</tr>
				<tr id="agree1">
					<td colspan="2">
						<div class="agree">
							<div>
								<p>
								<p class="ls2 lh6 bs5 ts4">
									<em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의
									고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
								</p>
								<p class="ls2 lh6 bs5 ts4">
									<em class="emphasis"><suc>('suc')</em> 은(는) 회사는 개인정보처리방침을
									개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
								</p>
								<p class="ls2">
									○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">1</em>월
									<em class="emphasis">13</em>일부터 시행됩니다.
								</p>
								</br>
								<p class='lh6 bs4'>
									<strong>1. 개인정보의 처리 목적 <em class="emphasis"><suc>('http://ip:port/suc'이하
											'suc')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는
										사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.
									</strong>
								</p>
								<p class="ls2">가. 홈페이지 회원가입 및 관리</p>
								<p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격
									유지·관리 등을 목적으로 개인정보를 처리합니다.</p>
								</br> </br> </br>
								<p class='lh6 bs4'>
									<strong>2. 개인정보 파일 현황</br>('http://ip:port/suc'이하 'suc')가
										개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.
									</strong>
								</p>
								<p class='ls2'>
									1. 개인정보 파일명 : suc_member_info</br> - 개인정보 항목 : 이메일, 휴대전화번호, 자택주소,
									비밀번호, 로그인ID, 성별, 생년월일, 이름</br> - 수집방법 : 홈페이지</br> - 보유근거 : 공란</br> - 보유기간 :
									지체없이 파기</br> - 관련법령 :
								</p>
								</br> </br>※ 기타('http://ip:port/suc'이하 'suc')의 개인정보파일 등록사항 공개는 행정안전부
								개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일
								목록검색 메뉴를 활용해주시기 바랍니다.</br> </br>
								<p class='lh6 bs4'>
									<strong>3. 개인정보의 처리 및 보유 기간</strong></br> </br>① <em class="emphasis"><suc>('suc')</em>은(는)
									법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간
									내에서 개인정보를 처리,보유합니다.</br> </br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
								</p>
								1.
								<홈페이지 회원가입 및 관리> </br>
								<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<지체없이 파기>까지
								위 이용목적을 위하여 보유.이용됩니다.</br>
								-보유근거 : 공란</br>
								-관련법령 : </br>
								-예외사유 : </br>
								</br>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>4. 개인정보의 제3자 제공에 관한 사항</strong></br> </br> ① <em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는
									경우에만 개인정보를 제3자에게 제공합니다.
								</p>
								② <em class="emphasis"><suc>('http://ip:port/suc')</em>은(는)
								다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</br>
								</br>
								<p class='ls2'>
									</br>1. <></br>- 개인정보를 제공받는 자 : </br>- 제공받는 자의 개인정보 이용목적 : </br>- 제공받는 자의 보유.이용기간:
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>5. 개인정보처리 위탁</strong></br> </br> ① <em class="emphasis"><suc>('suc')</em>은(는)
									원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
								</p>
								<p class='ls2'>
									1. <></br>- 위탁받는 자 (수탁자) : </br>- 위탁하는 업무의 내용 : </br>- 위탁기간 :
								</p>
								</br>
								</br>
								② <em class="emphasis"><suc>('http://ip:port/suc'이하
									'suc')</em>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
								기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에
								명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</br>
								</br>
								③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</br>

								<p class="lh6 bs4">
									<strong>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써
										다음과 같은 권리를 행사할 수 있습니다.</strong>
								</p>
								<p class="ls2">
									① 정보주체는 suc에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</br>②
									제1항에 따른 권리 행사는suc에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편,
									모사전송(FAX) 등을 통하여 하실 수 있으며 suc은(는) 이에 대해 지체 없이 조치하겠습니다.</br>③ 제1항에 따른
									권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보
									보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</br>④ 개인정보 열람 및 처리정지 요구는
									개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</br>⑤ 개인정보의
									정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수
									없습니다.</br>⑥ suc은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등
									요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>7. 처리하는 개인정보의 항목 작성 </strong></br> </br> ① <em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.
								</p>
								<p class='ls2'>
									1
									<홈페이지 회원가입 및 관리> </br>
									- 필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름</br>
									- 선택항목 : 
								</p>
								</br>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>8. 개인정보의 파기<em class="emphasis"><suc>('suc')</em>은(는)
										원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및
										방법은 다음과 같습니다.
									</strong>
								</p>
								<p class='ls2'>
									-파기절차</br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타
									관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가
									아니고서는 다른 목적으로 이용되지 않습니다.</br> </br>-파기기한</br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는
									보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그
									개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를
									파기합니다.
								</p>
								<p class='ls2'>
									-파기방법</br>
								</p>
								</br>
								</br>
								<p class="lh6 bs4">
									<strong>9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong>
								</p>
								<p class="ls2">
									suc 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.</br> </br>
								<p class='lh6 bs4'>
									<strong>10. 개인정보 보호책임자 작성 </strong>
								</p>
								<br />
								① suc(‘http://ip:port/suc’이하 ‘suc) 은(는) 개인정보 처리에 관한 업무를 총괄해서
								책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를
								지정하고 있습니다.
								<p class='ls2'>
									<br />▶ 개인정보 보호책임자 <br />성명 :김주연<br />직책 :개발자<br />직급 :개발자<br />연락처
									:01026149913, skaxmin@gmail.com, <br />※ 개인정보 보호 담당부서로 연결됩니다.<br />
									<br />▶ 개인정보 보호 담당부서<br />부서명 :<br />담당자 :<br />연락처 :, , <br />②
									정보주체께서는 suc(‘http://ip:port/suc’이하 ‘suc) 의 서비스(또는 사업)을 이용하시면서
									발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로
									문의하실 수 있습니다. suc(‘http://ip:port/suc’이하 ‘suc) 은(는) 정보주체의 문의에 대해
									지체 없이 답변 및 처리해드릴 것입니다.
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>11. 개인정보 처리방침 변경 </strong>
								</p>
								<p>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이
									있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>12. 개인정보의 안전성 확보 조치 <em class="emphasis"><suc>('suc')</em>은(는)
										개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
									</strong>
								</p>
								<p class='ls2'>
									1. 내부관리계획의 수립 및 시행</br> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</br> </br>2.
									개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여
									개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을
									통제하고 있습니다.</br> </br>
								</p>
								</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>개인정보 수집 및 이용에 대한 안내&nbsp;<b class="text-success">(필수)</b></td>
					<td>
						<div>
							<input type="checkbox" name="Required-agree2" /> <span></span>
						</div>
					</td>
				</tr>
				<tr id="agree2">
					<td colspan="2">
						<div class="agree">
							<div>
								<p>
								<p class="ls2 lh6 bs5 ts4">
									<em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의
									고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
								</p>
								<p class="ls2 lh6 bs5 ts4">
									<em class="emphasis"><suc>('suc')</em> 은(는) 회사는 개인정보처리방침을
									개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
								</p>
								<p class="ls2">
									○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">1</em>월
									<em class="emphasis">13</em>일부터 시행됩니다.
								</p>
								</br>
								<p class='lh6 bs4'>
									<strong>1. 개인정보의 처리 목적 <em class="emphasis"><suc>('http://ip:port/suc'이하
											'suc')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는
										사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.
									</strong>
								</p>
								<p class="ls2">가. 홈페이지 회원가입 및 관리</p>
								<p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격
									유지·관리 등을 목적으로 개인정보를 처리합니다.</p>
								</br> </br> </br>
								<p class='lh6 bs4'>
									<strong>2. 개인정보 파일 현황</br>('http://ip:port/suc'이하 'suc')가
										개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.
									</strong>
								</p>
								<p class='ls2'>
									1. 개인정보 파일명 : suc_member_info</br> - 개인정보 항목 : 이메일, 휴대전화번호, 자택주소,
									비밀번호, 로그인ID, 성별, 생년월일, 이름</br> - 수집방법 : 홈페이지</br> - 보유근거 : 공란</br> - 보유기간 :
									지체없이 파기</br> - 관련법령 :
								</p>
								</br> </br>※ 기타('http://ip:port/suc'이하 'suc')의 개인정보파일 등록사항 공개는 행정안전부
								개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일
								목록검색 메뉴를 활용해주시기 바랍니다.</br> </br>
								<p class='lh6 bs4'>
									<strong>3. 개인정보의 처리 및 보유 기간</strong></br> </br>① <em class="emphasis"><suc>('suc')</em>은(는)
									법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간
									내에서 개인정보를 처리,보유합니다.</br> </br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
								</p>
								1.
								<홈페이지 회원가입 및 관리> </br>
								<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<지체없이 파기>까지
								위 이용목적을 위하여 보유.이용됩니다.</br>
								-보유근거 : 공란</br>
								-관련법령 : </br>
								-예외사유 : </br>
								</br>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>4. 개인정보의 제3자 제공에 관한 사항</strong></br> </br> ① <em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는
									경우에만 개인정보를 제3자에게 제공합니다.
								</p>
								② <em class="emphasis"><suc>('http://ip:port/suc')</em>은(는)
								다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</br>
								</br>
								<p class='ls2'>
									</br>1. <></br>- 개인정보를 제공받는 자 : </br>- 제공받는 자의 개인정보 이용목적 : </br>- 제공받는 자의 보유.이용기간:
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>5. 개인정보처리 위탁</strong></br> </br> ① <em class="emphasis"><suc>('suc')</em>은(는)
									원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
								</p>
								<p class='ls2'>
									1. <></br>- 위탁받는 자 (수탁자) : </br>- 위탁하는 업무의 내용 : </br>- 위탁기간 :
								</p>
								</br>
								</br>
								② <em class="emphasis"><suc>('http://ip:port/suc'이하
									'suc')</em>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
								기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에
								명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</br>
								</br>
								③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</br>

								<p class="lh6 bs4">
									<strong>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써
										다음과 같은 권리를 행사할 수 있습니다.</strong>
								</p>
								<p class="ls2">
									① 정보주체는 suc에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</br>②
									제1항에 따른 권리 행사는suc에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편,
									모사전송(FAX) 등을 통하여 하실 수 있으며 suc은(는) 이에 대해 지체 없이 조치하겠습니다.</br>③ 제1항에 따른
									권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보
									보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</br>④ 개인정보 열람 및 처리정지 요구는
									개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</br>⑤ 개인정보의
									정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수
									없습니다.</br>⑥ suc은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등
									요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>7. 처리하는 개인정보의 항목 작성 </strong></br> </br> ① <em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.
								</p>
								<p class='ls2'>
									1
									<홈페이지 회원가입 및 관리> </br>
									- 필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름</br>
									- 선택항목 : 
								</p>
								</br>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>8. 개인정보의 파기<em class="emphasis"><suc>('suc')</em>은(는)
										원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및
										방법은 다음과 같습니다.
									</strong>
								</p>
								<p class='ls2'>
									-파기절차</br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타
									관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가
									아니고서는 다른 목적으로 이용되지 않습니다.</br> </br>-파기기한</br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는
									보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그
									개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를
									파기합니다.
								</p>
								<p class='ls2'>
									-파기방법</br>
								</p>
								</br>
								</br>
								<p class="lh6 bs4">
									<strong>9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong>
								</p>
								<p class="ls2">
									suc 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.</br> </br>
								<p class='lh6 bs4'>
									<strong>10. 개인정보 보호책임자 작성 </strong>
								</p>
								<br />
								① suc(‘http://ip:port/suc’이하 ‘suc) 은(는) 개인정보 처리에 관한 업무를 총괄해서
								책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를
								지정하고 있습니다.
								<p class='ls2'>
									<br />▶ 개인정보 보호책임자 <br />성명 :김주연<br />직책 :개발자<br />직급 :개발자<br />연락처
									:01026149913, skaxmin@gmail.com, <br />※ 개인정보 보호 담당부서로 연결됩니다.<br />
									<br />▶ 개인정보 보호 담당부서<br />부서명 :<br />담당자 :<br />연락처 :, , <br />②
									정보주체께서는 suc(‘http://ip:port/suc’이하 ‘suc) 의 서비스(또는 사업)을 이용하시면서
									발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로
									문의하실 수 있습니다. suc(‘http://ip:port/suc’이하 ‘suc) 은(는) 정보주체의 문의에 대해
									지체 없이 답변 및 처리해드릴 것입니다.
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>11. 개인정보 처리방침 변경 </strong>
								</p>
								<p>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이
									있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>12. 개인정보의 안전성 확보 조치 <em class="emphasis"><suc>('suc')</em>은(는)
										개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
									</strong>
								</p>
								<p class='ls2'>
									1. 내부관리계획의 수립 및 시행</br> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</br> </br>2.
									개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여
									개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을
									통제하고 있습니다.</br> </br>
								</p>
								</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>위치정보 이용약관 동의&nbsp;<b class="text-secondary">(선택)</b></td>
					<td>
						<div>
							<input type="checkbox" /> <span></span>
						</div>
					</td>
				</tr>
				<tr id="agree3">
					<td colspan="2">
						<div class="agree">
							<div>
								<p>
								<p class="ls2 lh6 bs5 ts4">
									<em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의
									고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
								</p>
								<p class="ls2 lh6 bs5 ts4">
									<em class="emphasis"><suc>('suc')</em> 은(는) 회사는 개인정보처리방침을
									개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
								</p>
								<p class="ls2">
									○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">1</em>월
									<em class="emphasis">13</em>일부터 시행됩니다.
								</p>
								</br>
								<p class='lh6 bs4'>
									<strong>1. 개인정보의 처리 목적 <em class="emphasis"><suc>('http://ip:port/suc'이하
											'suc')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는
										사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.
									</strong>
								</p>
								<p class="ls2">가. 홈페이지 회원가입 및 관리</p>
								<p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격
									유지·관리 등을 목적으로 개인정보를 처리합니다.</p>
								</br> </br> </br>
								<p class='lh6 bs4'>
									<strong>2. 개인정보 파일 현황</br>('http://ip:port/suc'이하 'suc')가
										개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.
									</strong>
								</p>
								<p class='ls2'>
									1. 개인정보 파일명 : suc_member_info</br> - 개인정보 항목 : 이메일, 휴대전화번호, 자택주소,
									비밀번호, 로그인ID, 성별, 생년월일, 이름</br> - 수집방법 : 홈페이지</br> - 보유근거 : 공란</br> - 보유기간 :
									지체없이 파기</br> - 관련법령 :
								</p>
								</br> </br>※ 기타('http://ip:port/suc'이하 'suc')의 개인정보파일 등록사항 공개는 행정안전부
								개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일
								목록검색 메뉴를 활용해주시기 바랍니다.</br> </br>
								<p class='lh6 bs4'>
									<strong>3. 개인정보의 처리 및 보유 기간</strong></br> </br>① <em class="emphasis"><suc>('suc')</em>은(는)
									법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간
									내에서 개인정보를 처리,보유합니다.</br> </br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
								</p>
								1.
								<홈페이지 회원가입 및 관리> </br>
								<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<지체없이 파기>까지
								위 이용목적을 위하여 보유.이용됩니다.</br>
								-보유근거 : 공란</br>
								-관련법령 : </br>
								-예외사유 : </br>
								</br>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>4. 개인정보의 제3자 제공에 관한 사항</strong></br> </br> ① <em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는
									경우에만 개인정보를 제3자에게 제공합니다.
								</p>
								② <em class="emphasis"><suc>('http://ip:port/suc')</em>은(는)
								다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</br>
								</br>
								<p class='ls2'>
									</br>1. <></br>- 개인정보를 제공받는 자 : </br>- 제공받는 자의 개인정보 이용목적 : </br>- 제공받는 자의 보유.이용기간:
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>5. 개인정보처리 위탁</strong></br> </br> ① <em class="emphasis"><suc>('suc')</em>은(는)
									원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
								</p>
								<p class='ls2'>
									1. <></br>- 위탁받는 자 (수탁자) : </br>- 위탁하는 업무의 내용 : </br>- 위탁기간 :
								</p>
								</br>
								</br>
								② <em class="emphasis"><suc>('http://ip:port/suc'이하
									'suc')</em>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
								기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에
								명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</br>
								</br>
								③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</br>

								<p class="lh6 bs4">
									<strong>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써
										다음과 같은 권리를 행사할 수 있습니다.</strong>
								</p>
								<p class="ls2">
									① 정보주체는 suc에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</br>②
									제1항에 따른 권리 행사는suc에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편,
									모사전송(FAX) 등을 통하여 하실 수 있으며 suc은(는) 이에 대해 지체 없이 조치하겠습니다.</br>③ 제1항에 따른
									권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보
									보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</br>④ 개인정보 열람 및 처리정지 요구는
									개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</br>⑤ 개인정보의
									정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수
									없습니다.</br>⑥ suc은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등
									요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>7. 처리하는 개인정보의 항목 작성 </strong></br> </br> ① <em class="emphasis"><suc>('http://ip:port/suc'이하
										'suc')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.
								</p>
								<p class='ls2'>
									1
									<홈페이지 회원가입 및 관리> </br>
									- 필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름</br>
									- 선택항목 : 
								</p>
								</br>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>8. 개인정보의 파기<em class="emphasis"><suc>('suc')</em>은(는)
										원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및
										방법은 다음과 같습니다.
									</strong>
								</p>
								<p class='ls2'>
									-파기절차</br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타
									관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가
									아니고서는 다른 목적으로 이용되지 않습니다.</br> </br>-파기기한</br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는
									보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그
									개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를
									파기합니다.
								</p>
								<p class='ls2'>
									-파기방법</br>
								</p>
								</br>
								</br>
								<p class="lh6 bs4">
									<strong>9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong>
								</p>
								<p class="ls2">
									suc 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.</br> </br>
								<p class='lh6 bs4'>
									<strong>10. 개인정보 보호책임자 작성 </strong>
								</p>
								<br />
								① suc(‘http://ip:port/suc’이하 ‘suc) 은(는) 개인정보 처리에 관한 업무를 총괄해서
								책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를
								지정하고 있습니다.
								<p class='ls2'>
									<br />▶ 개인정보 보호책임자 <br />성명 :김주연<br />직책 :개발자<br />직급 :개발자<br />연락처
									:01026149913, skaxmin@gmail.com, <br />※ 개인정보 보호 담당부서로 연결됩니다.<br />
									<br />▶ 개인정보 보호 담당부서<br />부서명 :<br />담당자 :<br />연락처 :, , <br />②
									정보주체께서는 suc(‘http://ip:port/suc’이하 ‘suc) 의 서비스(또는 사업)을 이용하시면서
									발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로
									문의하실 수 있습니다. suc(‘http://ip:port/suc’이하 ‘suc) 은(는) 정보주체의 문의에 대해
									지체 없이 답변 및 처리해드릴 것입니다.
								</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>11. 개인정보 처리방침 변경 </strong>
								</p>
								<p>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이
									있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
								</br>
								</br>
								<p class='lh6 bs4'>
									<strong>12. 개인정보의 안전성 확보 조치 <em class="emphasis"><suc>('suc')</em>은(는)
										개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
									</strong>
								</p>
								<p class='ls2'>
									1. 내부관리계획의 수립 및 시행</br> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</br> </br>2.
									개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여
									개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을
									통제하고 있습니다.</br> </br>
								</p>
								</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>이벤트 등 프로모션 알림 메일 수신&nbsp;<b class="text-secondary">(선택)</b></td>
					<td>
						<div>
							<input type="checkbox" /> <span></span>
						</div>
					</td>
				</tr>
				<tr>
					<!-- onclick="location.href='register2'" -->
					<td colspan="2"><input type="button" id="submit-chk"
						value="확인"> <input type="reset" value="취소"></td>
				</tr>
			</table>
		</div>
	</div>

	<c:import url="../public/footer.jsp" />
</body>
</html>