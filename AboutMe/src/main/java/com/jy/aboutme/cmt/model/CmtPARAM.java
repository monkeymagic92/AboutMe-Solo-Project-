package com.jy.aboutme.cmt.model;

public class CmtPARAM extends CmtVO{

	private int countI_cmt;
	
	private int pageStart;
	private int perPageNum;
	private int cmt_pageStart;
	private int cmt_perPageNum;
	
	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getCmt_pageStart() {
		return cmt_pageStart;
	}

	public void setCmt_pageStart(int cmt_pageStart) {
		this.cmt_pageStart = cmt_pageStart;
	}

	public int getCmt_perPageNum() {
		return cmt_perPageNum;
	}

	public void setCmt_perPageNum(int cmt_perPageNum) {
		this.cmt_perPageNum = cmt_perPageNum;
	}

	public int getCountI_cmt() {
		return countI_cmt;
	}

	public void setCountI_cmt(int countI_cmt) {
		this.countI_cmt = countI_cmt;
	}
	
	
}
