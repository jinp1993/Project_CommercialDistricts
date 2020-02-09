<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Analysis</title>
<style type="text/css">
.analysis-header {
   background-color: #009fe3;
   color: white;
   padding: 10px 20px 10px 20px;
}
.tab {
   color: white;
}
.tab.active{
   background-color: #2366b4;
}

.tab li {
   text-align: center;
   padding: 1px 1px;
   color: white;
   width: 50%;
   background-color: #b4c4d5;
   
}
.tab li.active{
   background-color: #2366b4;
}
.tab ul li {
   text-decoration: none;
   display: inline;
   width: 80px;
   height: 30px;
   background-color: #b4c4d5;
}

.tab ul li a {
   margin: 10px;
   margin-top: 20px;
   margin-bottom: 20px;
   padding-left: 50px;
   padding-right: 50px;
   color: white;
}

.section-area {
   text-align: center;
}

</style>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
 $(document).ready(function(){
	$("#show").click(function(){
	    $("#address").show();
	  });
	  $("#hide").click(function(){
	    $("#address").hide();
	  });	  
	});
</script>
</head>
<body>


<div class="analysis-header">
<c:set var="sales" value="${analysis_dto.sales} }"/>
<c:set var="number_of_market" value="${analysis_dto.number_of_market }"/>
<c:set var="living_population" value="${analysis_dto.living_population }"/>
<c:set var="market_on_business" value="${analysis_dto.market_on_business }"/>
<c:set var="market_closed_business" value="${analysis_dto.market_closed_business }"/>
<c:set var="office_furniture" value="${analysis_dto.office_furniture }"/>
<c:set var="floating_population" value="${analysis_dto.floating_population }"/>
<c:set var="risk_level" value="${analysis_dto.risk_level }"/>
<c:set var="commercial_change_rate" value="${analysis_dto.commercial_change_rate }"/>
<c:set var="longitude" value="${analysis_dto.longitude }"/>
<c:set var="latitude" value="${analysis_dto.latitude }"/>
<c:set var="analysis_list" value="${analysis_dto.analysis_list }"/>
<c:set var="analysis_type" value="${analysis_dto.analysis_type }"/>
<h4>우리 마을 가게</h4>
<h6>상권분석서비스</h6>

</div>

   <div class="container">
      <div class="row">
         <br>
         <div class="col-md-4 col-md-offset-4" style="padding-top: 20px;">
            <div class="form-body">
               <ul class="nav nav-tabs tab">
                  <li><a data-toggle="tab" href="#sectionA" id="cover">표지</a></li>
                  <li><a data-toggle="tab" href="#sectionB" id="summary">개요</a></li>
               </ul>
               <!-- 
               <div class="tab-content">
                  <div id="sectionA" class="tab-pane fade in active">
                     <div class="section-area"></div>
                  </div>
                  <div id="sectionB" class="tab-pane fade">
                     B
                     </div>
                     
                  </div>
               </div>
               -->
            </div>
         </div>

      </div>
      <div class="tab-content">
         <div id="sectionA" class="tab-pane fade in active">
            <div class="section-area">
               <br>
               <h2>우리마을가게 상권 분석 리포트</h2>
               <br>
               <div style="border: solid gray; align-items: center;">
                  <div style="margin: 10px 15%;">
                  <!-- 
                     <span style="background-color: gray; color: white;">상권유형</span>&nbsp;
                     <span>###  </span>&nbsp;&nbsp;&nbsp;&nbsp; --> 
                     <span                
                        style="background-color: gray; color: white;">분석지역</span>&nbsp;
                     <span>${analysis_list } </span>&nbsp;&nbsp;&nbsp;&nbsp; <span
                        style="background-color: gray; color: white;">분석업종</span>&nbsp;
                     <span>${analysis_type } </span>&nbsp;&nbsp;&nbsp;&nbsp; 
                    
                  </div>
               </div>
            </div>
         </div>
         <div id="sectionB" class="tab-pane fade">
            
            <div class="section-area">
               <br>
               <h2>상권요약</h2>
               <br>
               <div style="border-top: solid gray; border-bottom: solid gray; align-items: center;">
                  <div>
                     <table border="2" style="width: 100%">
                        <tr align="center">
                           <th align="center" style="background-color: #CEE3F6; width: 25%">점포수(개)</th><td align="center" style="width: 25%">${number_of_market }</td>
                           <th align="center" style="background-color: #CEE3F6; width: 25%">주거인구(명/ha)</th><td align="center" style="width: 25%">${living_population }</td>               
                        </tr>
                        <tr align="center">
                           <th align="center" style="background-color: #CEE3F6; width: 25%">운영 영업 개월 평균</th><td align="center" style="width: 25%">${market_on_business }</td>
                           <th align="center" style="background-color: #CEE3F6; width: 25%">폐업 영업 개월 평균</th><td align="center" style="width: 25%">${market_closed_business }</td>               
                        </tr>
                        <tr align="center">
                           <th align="center" style="background-color: #CEE3F6; width: 25%">직장인구(명/ha)</th><td align="center" style="width: 25%">${office_furniture }</td>
                           <th align="center" style="background-color: #CEE3F6; width: 25%">유동인구(명/ha)</th><td align="center" style="width: 25%">${floating_population }</td>               
                        </tr>
                        <tr align="center">
                           <th align="center" style="background-color: #CEE3F6; width: 25%">창업위험도</th><td align="center" style="width: 25%">${risk_level }</td>
                           <th align="center" style="background-color: #CEE3F6; width: 25%">상권변화지표</th><td align="center" style="width: 25%">${commercial_change_rate }</td>               
                        </tr>            
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <br>
	      <div style="border: solid gray; height: 605px; text-align: center;" id="map">
			<c:import url="./map_analysis.jsp"/>
		</div>
   </div>
</body>
</html>