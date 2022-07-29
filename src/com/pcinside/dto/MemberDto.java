package com.pcinside.dto;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String admin;
	private String phone;
	private int authCode;
		
	public MemberDto() {}
	public MemberDto(String id, String pw, String name, String email, String admin, String phone, int authCode) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.admin = admin;
		this.phone = phone;
		this.authCode = authCode;
	}
	
	
	public MemberDto(String id, String pw, String name, String email, String phone) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	

	public MemberDto(String id, String pw, String name, String email, String phone, int authCode) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.authCode = authCode;
	}
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAuthCode() {
		return authCode;
	}

	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
	
	
}
