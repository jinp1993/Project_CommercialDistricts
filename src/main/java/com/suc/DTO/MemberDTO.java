package com.suc.DTO;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private int birthdate;
	private String email;
	private String tel;
	private String membership_type;
	private String business_interests;
	private String region_of_interest;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(int birthdate) {
		this.birthdate = birthdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMembership_type() {
		return membership_type;
	}
	public void setMembership_type(String membership_type) {
		this.membership_type = membership_type;
	}
	public String getBusiness_interests() {
		return business_interests;
	}
	public void setBusiness_interests(String business_interests) {
		this.business_interests = business_interests;
	}
	public String getRegion_of_interest() {
		return region_of_interest;
	}
	public void setRegion_of_interest(String region_of_interest) {
		this.region_of_interest = region_of_interest;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", birthdate=" + birthdate + ", email=" + email
				+ ", tel=" + tel + ", membership_type=" + membership_type + ", business_interests=" + business_interests
				+ ", region_of_interest=" + region_of_interest + "]";
	}
	
}
