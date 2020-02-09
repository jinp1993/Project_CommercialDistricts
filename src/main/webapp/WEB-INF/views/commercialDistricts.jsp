<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/commercial-districts-info.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
/*주소검색*/
 $(document).ready(function(){
	$("#show").click(function(){
	    $("#address").show();
	  });
	  $("#hide").click(function(){
	    $("#address").hide();
	  });	  
	});

$(document).ready(function(){
	  $("#close").click(function(){
	    $("#searchInfo").hide();
	  });	  
	});
	
/*상권 리스트*/
$( document ).ready( function() {
    $( '#whole' ).click( function() {
      $( '#div_golmok' ).hide();
      $( '#div_baldal' ).hide();
      $( '#div_jeontong' ).hide();
      $( '#div_whole' ).show();
    } );
    $( '#golmok' ).click( function() {  	
        $( '#div_baldal' ).hide();
        $( '#div_jeontong' ).hide();
        $( '#div_whole' ).hide();
        $( '#div_golmok' ).show();
    } );
    $( '#baldal' ).click( function() {
    	$( '#div_golmok' ).hide();        
        $( '#div_jeontong' ).hide();
        $( '#div_whole' ).hide();
        $( '#div_baldal' ).show();
    } );
    $( '#jeontong' ).click( function() {
    	$( '#div_golmok' ).hide();              
        $( '#div_whole' ).hide();
        $( '#div_baldal' ).hide();
        $( '#div_jeontong' ).show();
    } );
  } );
</script>
<script>

function showPopup() { 
	var popup = window.open("about:blank", "winName","width=1000, height=800, left=100, top=50");
	var frm = document.form;
	frm.action = "commercial_analysis_result";
	frm.target = "winName";
	frm.submit();
}

//지도로 위도, 경도 값 전달
$(document).ready(function(){
	$('.map_class').click(function(){
		var id = $(this).attr("id");
		var longitude = $('#longitude'+id).val();
		var latitude = $('#latitude'+id).val();
		//$("#test1").text(longitude +" & "+ latitude);
		
		$.ajax({			
			url:"map_position",
			type:"POST",
			//data:form,
			data: {
				"longitude" : longitude,
				"latitude" : latitude	
			},	
			//data에는 controller에서 return으로 돌아오는 값이 들어간다.
			success:function(data){
				$('.map').load('./map');
			},
			/*실패하게 된다면 console.log("실패") 실행*/
			error:function(){
				alert("문제가 발생했습니다.");
				//console.log("실패")
			}
		})
	});
});
//업종 대,중분류 (list 형태로 값을 받아오기때문에 dependency 설정해야함. pom.xml)
$(document).ready(function() {
	$('.meal').click(function() {
		$('div').remove('#ct_result');
		var meal = $(this).attr('id');
		//console.log(meal);
		$.ajax ({
			url:"commercial_type",
			type:"POST",
			data: {
				"meal":meal
			},
			success:function(data) {
				//console.log(data);
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						$('#commercial_type_result').append("<div id='ct_result'><h5 class='selectBytype' style='font-size:14px;' id="+data[i]+">"+data[i]+"</h5></div>");
					}
				}
				
				$('.selectBytype').click(function() {
					$('div').remove('#final_select_type_inner');
					var selectBytype = $(this).attr('id');
					console.log(selectBytype);
					$.ajax({
						url:"selectBytype", 
						type:"GET",
						data: {
							"selectBytype" : selectBytype
						},
						success:function(data) {
							$('#final_select_type').append("<div id='final_select_type_inner'><input type='text' id='final_select_type_value' disabled=true  value="+data+"></div>");
						},
						error:function() {
							alert("문제 발생");
						}
					})
				});
			},
			error:function(data) {
				alert('meal 오류 발생');
			}
		})
	});
	$('.service').click(function() {
		$('div').remove('#ct_result');
		var service = $(this).attr('id');
		//console.log(service)
		$.ajax ({
			url:"commercial_type",
			type:"POST",
			data: {
				"service":service
			},
			success:function(data) {
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						$('#commercial_type_result').append("<div id='ct_result'><h5 class='selectBytype' style='font-size:14px;' id="+data[i]+">"+data[i]+"</h5></div>");
					}
				}
				$('.selectBytype').click(function() {
					$('div').remove('#final_select_type_inner');
					var selectBytype = $(this).attr('id');
					console.log(selectBytype);
					$.ajax({
						url:"selectBytype",
						type:"GET",
						data: {
							"selectBytype" : selectBytype
						},
						success:function(data) {
							$('#final_select_type').append("<div id='final_select_type_inner'><input type='text' id='final_select_type_value' disabled=true  value="+data+"></div>");
						},
						error:function() {
							alert("문제 발생");
						}
					})
				});
			},
			error:function(data) {
				alert('service 오류 발생');
			}
		})
	});
	$('.retail').click(function() {
		$('div').remove('#ct_result');
		var retail = $(this).attr('id');
		//console.log(retail)
		$.ajax ({
			url:"commercial_type",
			type:"POST",
			data: {
				"retail":retail
			},
			success:function(data) {
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						$('#commercial_type_result').append("<div id='ct_result'><h5 class='selectBytype' style='font-size:14px;' id="+data[i]+">"+data[i]+"</h5></div>");
					}
				}
				$('.selectBytype').click(function() {
					$('div').remove('#final_select_type_inner');
					var selectBytype = $(this).attr('id');
					console.log(selectBytype);
					$.ajax({
						url:"selectBytype",
						type:"GET",
						data: {
							"selectBytype" : selectBytype
						},
						success:function(data) {
							$('#final_select_type').append("<div id='final_select_type_inner'><input type='text' id='final_select_type_value' disabled=true  value="+data+"></div>");
						},
						error:function() {
							alert("문제 발생");
						}
					})
				});
			},
			error:function(data) {
				alert('retail 오류 발생');
			}
		})
	});
});

//행정구역 select box 선택 시 행정 동 값 추출
$(document).ready(function(){
	$('#select_box_city').click(function(){
		$('option').remove('.selectByarea');
		//'~~구'로 값을 넘김
		var index = $("#select_box_city option:selected").val();

		//console.log(index);
		$.ajax({			
			url:"select_area_city",
			type:"POST",
			//data:form,
			data: {
				"index" : index
			},	
			//data에는 controller에서 return으로 돌아오는 값이 들어간다.
			success:function(data){				
				//console.log(data);
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						$('#select_box_dong').append("<option value="+data[i]+" class='selectByarea' id="+data[i]+">"+data[i]+"</option>");
						
					}
				}
				
				// test
				$(function() {
					$('#select_box_dong').change(function() {
						$('div').remove('#final_select_area_inner');
						$('#final_select_area').append("<div id='final_select_area_inner'><input id='final_select_area_value' type='text' disabled=true value="+this.value+"></div>");
					})
				})
			},
			/*실패하게 된다면 console.log("실패") 실행*/
			error:function(){
				alert("문제가 발생했습니다.");
				//console.log("실패")
			}
		})
	});
	//생활업종 및 지역 값으로 해당하는 지역의 세부 지역으로 세분화
	$('#search').click(function() {
				
		var type = $('#final_select_type_value').val();
		var area = $('#final_select_area_value').val();
		var index = $("#select_box_city option:selected").val();
		console.log("행정구역 : " + index);
		console.log("업종 : " + type);
		console.log("행정동 : " + area);
		if(type == null || area == null || area == "행정동선택"){
			alert("생활밀접업종 / 행정동을 선택하세요.");
		}else{
			
			$.ajax({
				url:"search_analysis",
				type:"POST",
				data: {
					"area" : area,
					"type" : type
				},
				success:function(data) {
					$('div').remove('#result_golmok1');
					$('div').remove('#result_baldal1');
					$('div').remove('#result_jeontong1');
					for(var i = 0; i < data.length; i=i+2) {
						if(data[i+1].includes('골목') == true) {
							console.log(data[i]);
							$('.golmok').append("<div id='result_golmok1'><h5 class = 'final_commercial_list' style='font-size:14px;' id ="+data[i]+">"+data[i]+"</h5></div>");
							$('.result-golmok').append("<div id='result_golmok1'><h5 class = 'final_commercial_list' style='font-size:14px;' id ="+data[i]+">"+data[i]+"</h5></div>");
						}else if (data[i+1].includes('발달') == true) {
							console.log(data[i]);
							$('.baldal').append("<div id='result_baldal1'><h5 class = 'final_commercial_list' style='font-size:14px;' id ="+data[i]+">"+data[i]+"</h5></div>");
							$('.result-baldal').append("<div id='result_baldal1'><h5 class = 'final_commercial_list' style='font-size:14px;' id ="+data[i]+">"+data[i]+"</h5></div>");
						}else if (data[i+1].includes('전통') == true) {
							console.log(data[i]);
							$('.jeontong').append("<div id='result_jeontong1'><h5 class = 'final_commercial_list' style='font-size:14px;' id ="+data[i]+">"+data[i]+"</h5></div>");
 							$('.result-jeontong').append("<div id='result_jeontong1'><h5 class = 'final_commercial_list' style='font-size:14px;' id ="+data[i]+">"+data[i]+"</h5></div>");
						}else {
							alert('검색결과 없음');						
						}
					}
					
					$("#searchInfo").show(function() {
				    	$( '#div_golmok' ).hide();
				        $( '#div_baldal' ).hide();
				        $( '#div_jeontong' ).hide();
				        $( '#div_whole' ).show();
				    })
				    //각 상권 및 시장 별 리스트 클릭 시 분석영역 보관함으로 해당 리스트 값 전달(ex:골목상권-xx로 3길 클릭 => 분석영역 보관함 리스트에 기재) 및 분석데이터 추출
				    $('.final_commercial_list').click(function() {
				    	var analysis_list = $(this).attr('id');
				    	
				    	$('div').remove('#input-group-result-list');
				    	$('.rb-area').append("<div id='input-group-result-list'><input type='text' id='analysis_final_list' readOnly style='text-align:center;'"+
				    			"value="+analysis_list+"></div>");	
				    	
				    	$.ajax({
				    		url:"analysis",
				    		type:"POST",
				    		data:{
				    			"index" : index,
	    						"type" : type,
	    						"analysis_list" : analysis_list,
	    						"area" : area
				    		},
				    		
				    		success:function(data) {	
				    			$('div').remove('#btn_area');
				    			console.log(data);
				    			$('#data_submit').append("<div id='btn_area'>" +
				    					"<form action='commercial_analysis_result' name='form' id='result_analysis'>" +
				    					"<input type='hidden' name = 'sales' value="+data.sales+">" +
				    					"<input type='hidden' name = 'number_of_market' value="+data.number_of_market+">" +
				    					"<input type='hidden' name = 'living_population' value="+data.living_population+">" +
				    					"<input type='hidden' name = 'market_on_business' value="+data.market_on_business+">" +
				    					"<input type='hidden' name = 'market_closed_business' value="+data.market_closed_business+">" +
				    					"<input type='hidden' name = 'office_furniture' value="+data.office_furniture+">" +
				    					"<input type='hidden' name = 'floating_population' value="+data.floating_population+">" +
				    					"<input type='hidden' name = 'risk_level' value="+data.risk_level+">" +
				    					"<input type='hidden' name = 'commercial_change_rate' value="+data.commercial_change_rate+">" +
				    					"<input type='hidden' name = 'longitude' value="+data.longitude+">" +
				    					"<input type='hidden' name = 'latitude' value="+data.latitude+">" + 
				    					"<input type='hidden' name = 'analysis_list' value="+data.analysis_list+">" +
				    					"<input type='hidden' name = 'analysis_type' value="+data.analysis_type+">" +
				    					"<input type='button' onclick='showPopup()' class='search_btn_3d btn' id='result_analysis'value='분석하기'>" +
				    					"</form></div>");
				    			
				    			$.ajax({
		    						url : "transmit_value",
		    						type : "POST",
		    						data : {
		    							"latitude_analysis" : data.latitude,
		    							"longitude_analysis" : data.longitude
		    						},
		    						success:function(data) {
		    							//console.log(data);
		    							$('.map').load('./map_analysis');
		    						},
		    						error:function() {
		    							alert('좌표 값 전송 실패!');
		    						}
		    					})
				    			
					    	},
					    	error:function() {
					    		alert('list불러오기 실패');
					    	}
				    	})
				    	
				    });
				   
				},
				error:function() {
					alert('오류 발생');
				}
			})
		}		
	});
});


</script>
</head>
<body>
<c:import url="./public/header.jsp" />
<!-- 장소 검색 -->
<c:set var="address" value="${address }"/>

<!-- 장소 검색 건수 -->
<c:set var="address_size" value="${address_size }"/>

<!-- 주소 검색 -->
<c:set var="administrative_agency" value="${administrative_agency }"/>

<!-- 주소 검색 건수 -->
<c:set var="agency_size" value="${agency_size }"/>

<div id="fh5co-main">
		<div class="fh5co-intro text-center">
			<div class="container">
				<div class="commercial-main">
					<div class="map">
						<c:import url="./map.jsp"/>
					</div>
					<div class="controller">
						<div class="title">
							<div class="title-text">서울 상권 검색</div>
						</div>
						<div class="search-area">
						<c:choose>
							<c:when test="${address != null }">
								<div class="search">
									<form action="address" method="post">
										<input type="text" placeholder="주소, 장소" name="address">
										<input type="submit" value="검색" id="show">
									</form>
								</div>								
								<div class="search-result" id="address">	
									<div class="search-title">
										<div class="title-text">
											주소 검색 결과
										</div>								
									</div>
									<div class="search-main">
										<h5 style="height:15px;">
										<input type="button" value="닫기" id="hide" style="float:right; position:relative margin:3px; font-size:16px;">
										<br>
										</h5>
										<div class="address">
											<div class="ad-title">
												주소(${agency_size }건)
											</div>
											<div class="ad-main">
												<table>
												<!-- 장소 검색 -->
													<c:forEach var="dto" items="${administrative_agency}">													
															<tr><td><form id="map">
																<input id="longitude${cnt}" type="hidden" name="longitude" value="${dto.longitude}">
																<input id="latitude${cnt}" type="hidden" name="latitude" value="${dto.latitude}">
																<c:choose>
																	<c:when test="${dto.address_name != null }">
																		<h5 class="map_class" style="font-size:14px;" id="${cnt}">${dto.address_name }</h5>	
																	</c:when>
																	<c:when test="${dto.name_load != null }">
																		<h5 class="map_class" style="font-size:14px;" id="${cnt}">${dto.name_load }</h5>	
																	</c:when>
																	<c:when test="${dto.address_road != null }">
																		<h5 class="map_class" style="font-size:14px;" id="${cnt}">${dto.address_road }</h5>	
																	</c:when>
																</c:choose>
																
																<c:set var="cnt" value="${ cnt+1 }"/>													
															</form></td></tr>																												
													</c:forEach>
												</table>
											</div>
										</div>
										<div class="place">
											<div class="pc-title">
												장소(${address_size }건)
											</div>
													<c:set var="cnt" value="1"/>
											<div class="pc-main">
												<table>
												<!-- 장소 검색 -->
													<c:forEach var="dto" items="${address}">													
															<tr><td><form id="map">
																<input id="longitude${cnt}" type="hidden" name="longitude" value="${dto.longitude}">
																<input id="latitude${cnt}" type="hidden" name="latitude" value="${dto.latitude}">
																<h5 class="map_class" style="font-size:14px;" id="${cnt}">${dto.market_name }</h5>	
																<c:set var="cnt" value="${ cnt+1 }"/>													
															</form></td></tr>																												
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="search">
									<form action="address" method="post">
										<input type="text" placeholder="주소, 장소" name="address">
										<input type="submit" value="검색" id="show">
									</form>
								</div>		
							</c:otherwise>
						</c:choose>											
						</div>	
							
					
						<div class="commercial-type">
							<div class="com-title">
								생활밀접업종 선택
							</div>
							<div class="com-main">
								<div class="classify-big">
									<div class="big-title">
										<h4>대분류</h4>
										<div class="big-main">
											<div class="title">
												<h4>전체</h4>
											</div>
											<div class="main">
												<h5 class="meal" id="meal" style="font-size:14px;">외식업</h5>
												<h5 class="service" id="service" style="font-size:14px;">서비스업</h5>
												<h5 class="retail" id="retail" style="font-size:14px;">소매업</h5>																															
											</div>
										</div>
									</div>
								</div>
								<div class="classify-mid">
									<div class="mid-title">
										<h4>중분류</h4>
										<div class="mid-main">
										<!-- 생활밀접업종 분류 -->
										<c:set var="list" value="${list }"/>
											<div class="title">
												<h4>선택</h4>
											</div>
											<div class="main" id = "commercial_type_result">	
												<!-- 생활밀접업종 분류 결과 출력 (ajax) -->											
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="com-type-area">
							<div class="com-type-title">
								서울 상권 선택
							</div>
							<div class="com-type-main">
								<div class="com-type-main1">
									<div class="select-area-left">
										행정구역
									</div>
									<div class="select-area-right">
									<c:set var="area_cnt" value="1"/>									
										<select name="gu" style="width:120px;" id="select_box_city">
										<option value="행정구역 선택">행정구역 선택</option>
										   	<c:forEach var="area" items="${list_area }" varStatus="status">					
										   		<option value="${area }" class="select_area_city" id="area${area_cnt }">${area }</option>
										   		
										   	</c:forEach>									
										</select>
										<select name="dong" style="width:120px;" id="select_box_dong">
											<option value="행정동선택">행정동 선택</option>
										</select>
									</div>
								</div>
								<div class="com-type-main2">
									<div class="searchbtn-area">
									<!-- 검색 버튼 -->
										<div id="final_select">
										<form action="test" method="post">






											<div id="final_select_type"><!-- 중분류 type ajax 결과 값 --></div>
											<div id="final_select_area"><!-- 행정동 area ajax 결과 값 --></div>






											<input type="button" class="search_btn_3d btn" value="검색하기" id="search">
										</form>
										</div>
									</div>
									<div class="com-area-result" id="searchInfo">
										<hr style="color:gray; width:70%; border:1px solid gray; background-color:gray;">
										<div class="btn-area">
											<input type="button" class="btn1" value="전체" id="whole" name="btn_option" checked>
											<input type="button" class="btn1" value="골목" id="golmok" name="btn_option">
											<input type="button" class="btn1" value="발달" id="baldal" name="btn_option">
											<input type="button" class="btn1" value="전통" id="jeontong" name="btn_option">
											<input type="button" class="btn1" value="닫기" style="float:right" id="close">
										</div>
										<div class="com-search-result" id="div_whole">
											<div class="result-all">
												<h5>골목상권</h5>
												<div class="golmok"><!-- 골목상권 검색결과 (ajax) --></div>
												<br>
												<h5>발달상권</h5>
												<div class="baldal"><!-- 발달상권 검색결과 (ajax) --></div>
												<br>
												<h5>전통상권</h5>
												<div class="jeontong"><!-- 전통시장 검색결과 (ajax) --></div>
											</div>
										</div>
										<div class="com-search-result" id="div_golmok">
											<h5>골목상권</h5>
											<div class="result-golmok">
												<!-- 골목상권 검색결과 (ajax) -->
											</div>
										</div>
										<div class="com-search-result" id="div_baldal">
											<h5>발달상권</h5>
											<div class="result-baldal">
												<!-- 발달상권 검색결과 (ajax) -->
											</div>
										</div>
										<div class="com-search-result" id="div_jeontong">
											<h5>전통상권</h5>
											<div class="result-jeontong">
												<!-- 전통시장 검색결과 (ajax) -->
											</div>
										</div>
									</div>
								</div>
							</div>							
						</div>
						<div class="result-box">
							<div class="rb-title">
								분석영역 보관함
							</div>
							<div class="rb-main">
								<div class="rb-area">
									<!-- 클릭한 곳 리스트 불러옴(ajax) -->			
								</div>
								<div class="rb-result">
									<hr style="color:gray; width:70%; border:1px solid gray; background-color:gray;">
									<div id="data_submit">
									</div>
								</div>
								
							</div>
						</div>					
					</div>
				</div>				
			</div>
		</div>
</div>
</body>
</html>