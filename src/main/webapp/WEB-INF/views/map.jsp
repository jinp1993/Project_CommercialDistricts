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

var latitude =  ${latitude};
var longitude = ${longitude};

if((latitude == 37.5631473) && (longitude == 126.9747710)) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = { 
	    center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
	    level: 9 // 지도의 확대 레벨
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); 
}else {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = { 
	    center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
	
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);
	
}

</script>
</body>
<c:set var="latitude" value=" ${latitude}" />
<c:set var="longitude" value="${longitude}" />

<c:set var="latitude_analysis" value="${data.latitude} "/>
<c:set var="longitude_analysis" value="${data.longitude} "/>
</html>