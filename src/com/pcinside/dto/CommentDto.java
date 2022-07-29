package com.pcinside.dto;

public class CommentDto {
	private int bno;
	private String memberID;
	private String content;
	private String time;
	private int rno;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
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
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public CommentDto(int bno, String memberID, String content, String time, int rno) {
		this.bno = bno;
		this.memberID = memberID;
		this.content = content;
		this.time = time;
		this.rno = rno;
	}
	
	
}
