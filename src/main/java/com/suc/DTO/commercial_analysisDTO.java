package com.suc.DTO;

public class commercial_analysisDTO {
	private String sales; //추정매출
	private String number_of_market; //점포 수
	private String living_population; //주거인구
	private String market_on_business; //운영 영업 평균 개월
	private String market_closed_business; //폐업 영업 평균 개월
	private String office_furniture; //직장인구
	private String floating_population; //유동인구
	private String risk_level; //창업위험도
	private String commercial_change_rate; //상권변화지표
	private String longitude; //경도
	private String latitude; //위도
	private String analysis_list; //도로명 값
	private String analysis_type; //상권유형
	
	
	public String getAnalysis_type() {
		return analysis_type;
	}
	public void setAnalysis_type(String analysis_type) {
		this.analysis_type = analysis_type;
	}
	public String getAnalysis_list() {
		return analysis_list;
	}
	public void setAnalysis_list(String analysis_list) {
		this.analysis_list = analysis_list;
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
	public String getCommercial_change_rate() {
		return commercial_change_rate;
	}
	public void setCommercial_change_rate(String commercial_change_rate) {
		this.commercial_change_rate = commercial_change_rate;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getNumber_of_market() {
		return number_of_market;
	}
	public void setNumber_of_market(String number_of_market) {
		this.number_of_market = number_of_market;
	}
	public String getLiving_population() {
		return living_population;
	}
	public void setLiving_population(String living_population) {
		this.living_population = living_population;
	}
	public String getMarket_on_business() {
		return market_on_business;
	}
	public void setMarket_on_business(String market_on_business) {
		this.market_on_business = market_on_business;
	}
	public String getMarket_closed_business() {
		return market_closed_business;
	}
	public void setMarket_closed_business(String market_closed_business) {
		this.market_closed_business = market_closed_business;
	}
	public String getOffice_furniture() {
		return office_furniture;
	}
	public void setOffice_furniture(String office_furniture) {
		this.office_furniture = office_furniture;
	}
	public String getFloating_population() {
		return floating_population;
	}
	public void setFloating_population(String floating_population) {
		this.floating_population = floating_population;
	}
	public String getRisk_level() {
		return risk_level;
	}
	public void setRisk_level(String risk_level) {
		this.risk_level = risk_level;
	}
	
	
}
