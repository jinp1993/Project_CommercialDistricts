<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <style>
.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 12px;
    top: -5px;
    left: 15px;
    padding:2px;
}

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}
</style>

</head>


<body>

<div id="map" style="width:100%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6794b0bea644a59aa74978d850641aa7"></script>
<script>

var latitude_analysis = ${latitude_analysis};
var longitude_analysis = ${longitude_analysis};





if((latitude_analysis == 37.5631473) && (longitude_analysis == 126.9747710)) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = { 
	    center: new kakao.maps.LatLng(latitude_analysis, longitude_analysis), // 지도의 중심좌표
	    level: 9 // 지도의 확대 레벨
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); 
}else {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = { 
	    center: new kakao.maps.LatLng(latitude_analysis, longitude_analysis), // 지도의 중심좌표
	    level: 1 // 지도의 확대 레벨
	};	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var markerPosition  = new kakao.maps.LatLng(latitude_analysis, longitude_analysis); 
	
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	var circle = new kakao.maps.Circle({
		center : new kakao.maps.LatLng(latitude_analysis, longitude_analysis),  // 원의 중심좌표 입니다 
	    radius: 50, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 5, // 선의 두께입니다 
	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'dashed', // 선의 스타일 입니다
	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    fillOpacity: 0.7 
	});
	var linePath = [
	    new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
	    new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
	    new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
	];
	marker.setMap(map);
	circle.setMap(map);
}

</script>
</body>
<c:set var="latitude_analysis" value="${latitude_analysis} "/>
<c:set var="longitude_analysis" value="${longitude_analysis} "/>
</html>