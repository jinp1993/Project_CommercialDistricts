<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register1-page</title>
<style type="text/css">
.test-body {
   padding: 25px 20%;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
   
   var id_chk = false;
   var pw_chk =  false;
   var name_chk =  false;
   var year_chk =  false;
   var month_chk =  false;
   var day_chk =  false;
   // var email_chk = false;
   var tel_chk =  false;
   //var membership_type_chk = false;
   //var business_interests_chk = false;
   //var region_of_interest_chk = false;
   
   
   $(document).ready(function() {
      $(document).click(function() {
         var value = 0;
         if ((id_chk != false)
               && (pw_chk != false)
               && (name_chk != false) 
               && (year_chk != false)
               && (month_chk != false)
               && (day_chk != false)
               // && (email_chk == false)
               && (tel_chk != false)) {
               //&& (membership_type_chk == false)
               //&& (business_interests_chk == false)
               //&& (region_of_interest_chk == false)) {
            value = 1;
         } 
         console.log("value :" + id_chk + " / " + pw_chk + " / " + name_chk + " / " + year_chk + " / " + month_chk + " / " + day_chk + " / " 
               // + email_chk + " / " 
               + tel_chk);
               //+ " / " + membership_type_chk + " / " + business_interests_chk + " / " + region_of_interest_chk);
         $.ajax({
            url: "chk",
            type: "post",
            data: {value : value},
            success: function(result) {
               console.log("결과  : " + result);
               if(result == 0) {
                  $("#submit-chk").attr("disabled", true);
               } else {
                  $("#submit-chk").attr("disabled", false);
               }
            },
            error:function(){
               console.log("error");
            }
         })
      });
   });
   // 아이디 유효성 검사
   $(document).ready(function() {
      $("#uname").keyup(function() {
         var userId =  $("#uname").val();
         $.ajax({
            url: "test",
            type: "post",
            data: {userId : userId},
            success: function(result) {
               console.log("결과(0 : 조건 불충족 / 1 : 사용 가능 / 2 : 중복 존재) : " + result);
               if(result == 0) {
                  $("#id-feedback").text("5자 이상 입력해주세요.");
                  $("#id-feedback").css("color", "red");
                  // $("#submit-chk").attr("disabled", true);
               } else if(result == 1){
                  $("#id-feedback").text("사용 가능한 아이디 입니다.");
                  $("#id-feedback").css("color", "green");
                  id_chk = true;
                  // $("#submit-chk").attr("disabled", false);
               } else {
                  $("#id-feedback").text("중복된 아이디가 존재합니다.");
                  $("#id-feedback").css("color", "red");
                  // $("#submit-chk").attr("disabled", true);
               }
            },
            error:function(){
               console.log("error");
            }
         })
      });
   });
   
   $(document).ready(function() {
      $("#uname").click(function() {
         $(document).click(function() {
            var value =  $("#uname").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#id-feedback").text("필수항목 입니다.");
                     $("#id-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     // $("#id-feedback").empty();
                  }         
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   // 비빔번호 유효성 검사
   $(document).ready(function() {
      $("#pwd").keyup(function() {
         var userPw =  $("#pwd").val();
         $.ajax({
            url: "test2",
            type: "post",
            data: {userPw : userPw},
            success: function(result) {
               // console.log("결과(0 : 조건 불충족 / 1 : 사용 가능 / 2 : 중복 존재) : " + result);
               if(result == 0) {
                  $("#pw-feedback").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                  $("#pw-feedback").css("color", "red");
                  // $("#submit-chk").attr("disabled", true);
               } else {
                  $("#pw-feedback").text("사용 가능한 비밀번호 입니다.");
                  $("#pw-feedback").css("color", "green");
                  // $("#submit-chk").attr("disabled", false);
               }
            },
            error:function(){
               console.log("error");
            }
         })
      });
   });
   
   $(document).ready(function() {
      $("#pwd").click(function() {
         $(document).click(function() {
            var value =  $("#pwd").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#pw-feedback").text("필수항목 입니다.");
                     $("#pw-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     // $("#pw-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   // 비빔번호 재검사 유효성 검사
   $(document).ready(function() {
      $("#pwd2").keyup(function() {
         var userPwChk =  $("#pwd2").val();
         var userPw = $("#pwd").val();
         $.ajax({
            url: "test3",
            type: "post",
            data: {
               userPwChk : userPwChk,
               userPw : userPw
            },
            success: function(result) {
               
               if(result == 0) {
                  $("#pw2-feedback").text("비밀번호가 일치하지 않습니다.");
                  $("#pw2-feedback").css("color", "red");
                  // $("#submit-chk").attr("disabled", true);
               } else {
                  $("#pw2-feedback").text("비밀번호가 일치합니다.");
                  $("#pw2-feedback").css("color", "green");
                  pw_chk = true;
                  // $("#submit-chk").attr("disabled", false);
               }
            },
            error:function(){
               console.log("error");
            }
         })
      });
   });
   
   $(document).ready(function() {
      $("#pwd2").click(function() {
         $(document).click(function() {
            var value =  $("#pwd2").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#pw2-feedback").text("필수항목 입니다.");
                     $("#pw2-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     // $("#pw2-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   // 이름 유효성 검사
   $(document).ready(function() {
      $("#name").click(function() {
         $(document).click(function() {
            var value =  $("#name").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#name-feedback").html("필수항목 입니다.");
                     $("#name-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     name_chk = true;
                     $("#name-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   // 생년월일 유효성 검사 (year)
   $(document).ready(function() {   
      $("#year").keyup(function() {
         //$(document).click(function() {
            var year =  $("#year").val();
            $.ajax({
               url: "test4",
               type: "post",
               data: { year : year },
               success: function(result) {
                  
                  if(result == 0) {
                     $("#year-feedback").text("태어난 년도 4자리를 정확하게 입력하세요.");
                     $("#year-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     $("#year-feedback").empty();
                     year_chk = true;
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         //});
      });
   });
   
   $(document).ready(function() {
      $("#year").click(function() {
         $(document).click(function() {
            var value =  $("#year").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#year-feedback").text("태어난 년도 4자리를 정확하게 입력하세요.");
                     $("#year-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     // $("#pw2-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   // 생년월일 유효성 검사 (month)
   $(document).ready(function() {      
      $("#month").click(function() {
         //$(document).click(function() {
            var month =  $("#month").val();
            $.ajax({
               url: "test5",
               type: "post",
               data: { month : month },
               success: function(result) {
                  
                  if(result == 0) {
                     $("#month-feedback").text("태어난 날짜(월)를 정확하게 입력하세요.");
                     $("#month-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     month_chk = true;
                     $("#month-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         //});
      });
   });
   
   $(document).ready(function() {
      $("#month").click(function() {
         $(document).click(function() {
            var value =  $("#month").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#month-feedback").text("태어난 날짜(월)를 정확하게 입력하세요.");
                     $("#month-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     
                     // $("#pw2-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   // 생년월일 유효성 검사 (day)
   $(document).ready(function() {      
      $("#day").keyup(function() {
         //$(document).click(function() {
            var day =  $("#day").val();
            $.ajax({
               url: "test6",
               type: "post",
               data: { day : day },
               success: function(result) {
                  
                  if(result == 0) {
                     $("#day-feedback").text("태어난 날짜(일)를 정확하게 입력하세요.");
                     $("#day-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     $("#day-feedback").empty();
                     day_chk = true;
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         //});
      });
   });
   
   $(document).ready(function() {
      $("#day").click(function() {
         $(document).click(function() {
            var value =  $("#day").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#day-feedback").text("태어난 날짜(일)를 정확하게 입력하세요.");
                     $("#day-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     // $("#pw2-feedback").empty();
                  }
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   // 휴대폰 유효성 검사
   $(document).ready(function() {
      $("#phone-num").keyup(function() {
         var value =  $("#phone-num").val();
         $.ajax({
            url: "input-phone-num.do",
            type: "post",
            data: {value : value},
            success: function(result) {
               if(result == 0) {
                  $("#phone-num-feedback").text("폰 번호를 정확하게 입력해주세요");
                  $("#phone-num-feedback").css("color", "red");
                  // $("#submit-chk").attr("disabled", true);
               } else {
                  $("#phone-num-feedback").empty();
                  tel_chk = true;
               }
            },
            error:function(){
               console.log("error");
            }
         })
      });
   });
   
   $(document).ready(function() {
      $("#phone-num").click(function() {
         $(document).click(function() {
            var value =  $("#phone-num").val();
            $.ajax({
               url: "isInput",
               type: "post",
               data: {value : value},
               success: function(result) {            
                  if(result == 0) {
                     $("#phone-num-feedback").text("필수항목 입니다.");
                     $("#phone-num-feedback").css("color", "red");
                     // $("#submit-chk").attr("disabled", true);
                  } else {
                     // $("#id-feedback").empty();
                  }         
               },
               error:function(){
                  console.log("error");
               }
            })
         });
      });
   });
   
   
   $(document).ready(function() {
      $("#submit-chk").click(function() {
         var id =  $("#uname").val();
         var pw =  $("#pwd").val();
         var name =  $("#name").val();
         var birthdate =  $("#year").val() + $("#month").val() + $("#day").val();
         var email =  $("#email").val();
         var tel =  $("#phone-num").val();
         var membership_type = $("#membership-type").val();
         var business_interests = $("#business-interests").val();
         var region_of_interest = $("#region-of-interest").val();
         
         $.ajax({
            url: "register",
            type: "POST",
            data: {
               id : id,
               pw : pw,
               name : name,
               birthdate : birthdate,
               email : email,
               tel : tel,
               membership_type : membership_type,
               business_interests : business_interests,
               region_of_interest : region_of_interest
            },
            success: function(result) {
               if(result == 1) {
                  alert("회원가입 성공");
                  location.href='index';   
               } else {
                  alert("회원가입 실패");
                  
               }
            },
            error:function(){
               alert("error");
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
         <h1>회원가입 2단계 : 회원 정보 입력</h1>
         <br>
      </div>   
      <div class="test-body">
         <div class="form-group">
            <label for="id">아이디 :</label> <input type="text"
               class="form-control" id="uname" placeholder="Enter ID" name="uname"
               maxlength="20">
            <div id="id-feedback"></div>
         </div>

         <div class="form-group">
            <label for="pwd1">비밀번호 :</label> <input type="password"
               class="form-control" id="pwd" placeholder="Enter password"
               name="pwd" maxlength="16">
            <div id="pw-feedback"></div>
         </div>

         <div class="form-group">
            <label for="pwd2">비밀번호 재 확인 :</label> <input type="password"
               class="form-control" id="pwd2" placeholder="Enter password"
               name="pswd2" maxlength="16">
            <div id="pw2-feedback"></div>
         </div>

         <div class="form-group">
            <label for="name">이름 :</label> <input type="text"
               class="form-control" id="name" placeholder="Enter name" name="name">
            <div id="name-feedback"></div>
         </div>

         <div class="form-group">
            <label for="name">생년월일 :</label>
            <div class="input-group mb-3">
               <input type="text" class="form-control" placeholder="YY" id="year"
                  name="year" maxlength="4"> <select name="cars"
                  class="custom-select" id="month" name="month">
                  <option selected>MM</option>
                  <option value="01">1</option>
                  <option value="02">2</option>
                  <option value="03">3</option>
                  <option value="04">4</option>
                  <option value="05">5</option>
                  <option value="06">6</option>
                  <option value="07">7</option>
                  <option value="08">8</option>
                  <option value="09">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
               </select> <input type="text" class="form-control" placeholder="DD" id="day"
                  name="day">
            </div>
            <div id="year-feedback"></div>
            <div id="month-feedback"></div>
            <div id="day-feedback"></div>
         </div>

         <div class="form-group">
            <label for="name">이메일 :</label>
            <div class="input-group mb-3">
               <input type="text" class="form-control" placeholder="e-mail"
                  id="email" name=email aria-label="Recipient's username"
                  aria-describedby="basic-addon2">
               <!-- 
               <div class="input-group-append">
                  <select class="form-control" id="sel1">
                     <option selected>선택해주세요</option>
                     <option value="${email}@naver.com">@naver.com</option>
                     <option value="${email}@gmail.com">@gmail.com</option>
                     <option value="${email}@daum.net">@daum.net</option>
                     <option value="${email}">직접입력</option>
                  </select>
               </div>
                -->   
            </div>
         </div>

         <!--  
            <div class="form-group">
               <label for="name">성별 :</label>
               <div class="input-group mb-3">
                  <div class="form-check-inline">
                     <label class="form-check-label"> <input type="radio"
                        class="form-check-input" name="optradio" id="gender" value="man">남자
                     </label>
                  </div>
                  <div class="form-check-inline">
                     <label class="form-check-label"> <input type="radio"
                        class="form-check-input" name="optradio" id="gender" value="woman">여자
                     </label>
                  </div>
               </div>
               <div id="gender-feedback"></div>
            </div>
            -->

         <div class="form-group">
            <label for="name">전화번호 :&nbsp;<b class="text-secondary">(
                  - 없이 숫자만 입력해 주세요!!)</b></label>
            <div class="input-group mb-3">
               <input type="text" class="form-control" id="phone-num"
                  name="phone-num">
            </div>
            <div id="phone-num-feedback"></div>
         </div>

         <!-- 
         <div class="from-group">
            <label for="name">회원유형 :</label>
            <div class="input-group mb-3">
               <div class="form-check-inline">
                  <label class="form-check-label"> <input type="radio"
                     class="form-check-input" name="optradio">예비창업
                  </label>
               </div>
               <div class="form-check-inline">
                  <label class="form-check-label"> <input type="radio"
                     class="form-check-input" name="optradio">자영업자
                  </label>
               </div>
               <div class="form-check-inline">
                  <label class="form-check-label"> <input type="radio"
                     class="form-check-input" name="optradio">경영지원(컨설턴트)
                  </label>
               </div>
               <div class="form-check-inline">
                  <label class="form-check-label"> <input type="radio"
                     class="form-check-input" name="optradio">폐업예정
                  </label>
               </div>
            </div>
         </div>
         -->
         <div class="from-group">
            <label for="name">회원유형 :</label>
            <div class="input-group mb-3">
               <select class="form-control" id="membership-type">
                  <option selected>선택해주세요</option>
                  <option value="예비창업">예비창업</option>
                  <option value="자영업자">자영업자</option>
                  <option value="경영지원(컨설턴트)">경영지원(컨설턴트)</option>
                  <option value="폐업예정">폐업예정</option>
               </select>
            </div>
         </div>
         


         <div class="from-group">
            <label for="name">관심 업종 :</label>
            <div class="input-group mb-3">
               <select class="form-control" id="business-interests">
                  <option selected>선택해주세요</option>
                  <option value="음식업">음식업</option>
                  <option value="도소매업">도소매업</option>
                  <option value="서비스업">서비스업</option>
                  <option value="제조업">제조업</option>
                  <option value="복합업">복합업</option>
                  <option value="공통">공통</option>
               </select>
            </div>
         </div>

         <div class="from-group">
            <label for="name">관심 지역 :</label>
            <div class="input-group mb-3">
               <select class="form-control" id="region-of-interest">
                  <option selected>선택해주세요</option>
                  <option value="종로구">종로구</option>
                  <option value="중구">중구</option>
                  <option value="용산구">용산구</option>
                  <option value="성동구">성동구</option>
                  <option value="광진구">광진구</option>
                  <option value="동대문구">동대문구</option>
                  <option value="중랑구">중랑구</option>
                  <option value="성북구">성북구</option>
                  <option value="강북구">강북구</option>
                  <option value="도봉구">도봉구</option>
                  <option value="노원구">노원구</option>
                  <option value="은평구">은평구</option>
                  <option value="서대문구">서대문구</option>
                  <option value="마포구">마포구</option>
                  <option value="양천구">양천구</option>
                  <option value="강서구">강서구</option>
                  <option value="구로구">구로구</option>
                  <option value="금천구">금천구</option>
                  <option value="영등포구">영등포구</option>
                  <option value="동작구">동작구</option>
                  <option value="관악구">관악구</option>
                  <option value="서초구">서초구</option>
                  <option value="강남구">강남구</option>
                  <option value="송파구">송파구</option>
                  <option value="강동구">강동구</option>
               </select>
            </div>
         </div>

         <div style="padding: 25px 25%">
            <input type="button" class="btn btn-danger btn-block"
               id="submit-chk" value="회원가입">
         </div>
      </div>
   </div>

   <c:import url="../public/footer.jsp" />
</body>
</html>