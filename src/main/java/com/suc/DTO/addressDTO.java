package com.suc.DTO;

public class addressDTO {
	
	@Override
	public String toString() {
		return "addressDTO [market_name=" + market_name + ", mkrket_name_area=" + mkrket_name_area + ", devide_big="
				+ devide_big + ", devide_mid=" + devide_mid + ", devide_unit=" + devide_unit + ", city=" + city
				+ ", area=" + area + ", dong=" + dong + ", address_name=" + address_name + ", name_load=" + name_load
				+ ", building_name=" + building_name + ", address_road=" + address_road + ", longitude=" + longitude
				+ ", latitude=" + latitude + "]";
	}
	private String market_name;
	private String mkrket_name_area;
	private String devide_big;
	private String devide_mid;
	private String devide_unit;
	private String city;
	private String area;
	private String dong;
	private String address_name;
	private String name_load;
	private String building_name;
	private String address_road;
	private String longitude;
	private String latitude;
	
	public String getMarket_name() {
		return market_name;
	}
	public void setMarket_name(String market_name) {
		this.market_name = market_name;
	}
	public String getMkrket_name_area() {
		return mkrket_name_area;
	}
	public void setMkrket_name_area(String mkrket_name_area) {
		this.mkrket_name_area = mkrket_name_area;
	}
	public String getDevide_big() {
		return devide_big;
	}
	public void setDevide_big(String devide_big) {
		this.devide_big = devide_big;
	}
	public String getDevide_mid() {
		return devide_mid;
	}
	public void setDevide_mid(String devide_mid) {
		this.devide_mid = devide_mid;
	}
	public String getDevide_unit() {
		return devide_unit;
	}
	public void setDevide_unit(String devide_unit) {
		this.devide_unit = devide_unit;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getName_load() {
		return name_load;
	}
	public void setName_load(String name_load) {
		this.name_load = name_load;
	}
	public String getBuilding_name() {
		return building_name;
	}
	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}
	public String getAddress_road() {
		return address_road;
	}
	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
}
