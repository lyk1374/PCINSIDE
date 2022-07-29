package com.pcinside.dto;

public class FreeBoardDto {
	private int bno;
	private String writer;
	private String title;
	private String content;
	private String time;
	private String boardDelete;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getBoardDelete() {
		return boardDelete;
	}
	public void setBoardDelete(String boardDelete) {
		this.boardDelete = boardDelete;
	}
	public FreeBoardDto(int bno, String writer, String title, String content, String time) {
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.time = time;
	}
	public FreeBoardDto(String title, String content) {
		this.title = title;
		this.content = content;
	}
	
	
}
