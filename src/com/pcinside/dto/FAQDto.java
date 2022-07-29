package com.pcinside.dto;

public class FAQDto {
	private int bno;
	private String faqClass;
	private String title;
	private String content;
	
	public FAQDto(int bno, String faqClass, String title, String content) {
		super();
		this.bno = bno;
		this.faqClass = faqClass;
		this.title = title;
		this.content = content;
	}
	
	public FAQDto(int bno, String title) {
		super();
		this.bno = bno;
		this.title = title;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getFaqClass() {
		return faqClass;
	}

	public void setFaqClass(String faqClass) {
		this.faqClass = faqClass;
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
	
	
}
