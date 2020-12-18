package com.jy.aboutme.index.model;

import java.util.List;

public class HistoryVO {
	private String myIp;
	private String ip_addr;
	private String os;
	private String browser;
	private String agent;
	private String r_dt;
	
	private List<HistoryDMI> myIpList;
	
	
	
	
	public List<HistoryDMI> getMyIpList() {
		return myIpList;
	}
	public void setMyIpList(List<HistoryDMI> myIpList) {
		this.myIpList = myIpList;
	}
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
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
	
	@Override
	public String toString() {
		return String.format("%s", myIp);
	}
	
}
