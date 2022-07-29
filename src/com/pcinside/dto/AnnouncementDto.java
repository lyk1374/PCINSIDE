package com.pcinside.dto;

public class AnnouncementDto {
	private int bno;
	private String title;
	private String content;
	private String time;
	public AnnouncementDto(int bno, String title, String content, String time) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.time = time;
	}
	
	public AnnouncementDto(String title, String content) {
		this.title = title;
		this.content = content;
	}
	
	public AnnouncementDto(int bno, String title, String content) {
		this.bno = bno;
		this.title = title;
		this.content = content;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	
}
