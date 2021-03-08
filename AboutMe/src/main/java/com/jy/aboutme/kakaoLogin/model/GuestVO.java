package com.jy.aboutme.kakaoLogin.model;

public class GuestVO {
	private int i_guest;
	private String nickname;
	private String profile_image;
	private String email;
	private String gender;
	private String token;
	private String r_dt;
	private String myIp;
	private String ip_addr;
	private String os;
	private String browser;
	private String agent;
	
	public String getMyIp() {
		return myIp;
	}
	public void setMyIp(String myIp) {
		this.myIp = myIp;
	}
	public String getIp_addr() {
		return ip_addr;
	}
	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public int getI_guest() {
		return i_guest;
	}
	public void setI_guest(int i_guest) {
		this.i_guest = i_guest;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
