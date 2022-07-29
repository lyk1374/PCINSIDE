package com.pcinside.dto;

public class ReviewDto {
	private int bno;
	private int pcNum;
	private String memberID;
	private String title;
	private String content;
	private String time;
	private String best;
	
	public ReviewDto(int bno, int pcNum, String memberID, String title, String content, String time, String best) {
		this.bno = bno;
		this.pcNum = pcNum;
		this.memberID = memberID;
		this.title = title;
		this.content = content;
		this.time = time;
		this.best = best;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getPcNum() {
		return pcNum;
	}

	public void setPcNum(int pcNum) {
		this.pcNum = pcNum;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getBest() {
		return best;
	}

	public void setBest(String best) {
		this.best = best;
	}
	
	
}
