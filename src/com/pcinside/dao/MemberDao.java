package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.MemberDto;

public class MemberDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDao() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "pcinside";
		String dbPW = "1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbID, dbPW);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String id, String pw) {
		String pwData = null;
		String sql = "SELECT PW FROM MEMBER WHERE ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pwData = rs.getString("PW");
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(pw.equals(pwData) == true) {
			return 1;
		}else {
			return 0;
		}
	}
	public String adminChk(String id) {
		String adminChk = null;
		String sql = "SELECT ADMIN FROM MEMBER WHERE ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				adminChk = rs.getString("ADMIN");
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return adminChk;
	}
	public ArrayList<String> getIdList(){
		String sql = "SELECT ID FROM MEMBER";
		ArrayList<String> list = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				list.add(id);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<String> getEmailList(){
		String sql = "SELECT EMAIL FROM MEMBER";
		ArrayList<String> list = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String email = rs.getString(1);
				list.add(email);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void signIn(MemberDto memberDto) {
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?, NULL, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPw());
			pstmt.setString(3, memberDto.getName());
			pstmt.setString(4, memberDto.getEmail());
			pstmt.setString(5, memberDto.getPhone());
			pstmt.setInt(6, memberDto.getAuthCode());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public MemberDto getMemberInfo(String id){
		MemberDto member = null;
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(6);
				
				member = new MemberDto(id, pw, name, email, phone);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	public void memberModify(MemberDto memberDto) {
		String sql = "UPDATE MEMBER SET PW = ?, NAME = ?, EMAIL = ?, PHONE = ?, AUTHCODE = ? WHERE ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getPw());
			pstmt.setString(2, memberDto.getName());
			pstmt.setString(3, memberDto.getEmail());
			pstmt.setString(4, memberDto.getPhone());
			pstmt.setInt(5, memberDto.getAuthCode());
			pstmt.setString(6, memberDto.getId());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getIdFromEmail(String email) {
		String sql = "SELECT ID FROM MEMBER WHERE EMAIL = ?";
		String id = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	public String getPwFromIdAndEmail(String id, String email) {
		String sql = "SELECT PW FROM MEMBER WHERE EMAIL = ? AND ID = ?";
		String pw = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pw;
	}
	public void signInKakao(String id, String email) {
		String pw = "" + ((int)(Math.random()*100000000));
		String name = "카카오";
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, NULL, NULL, NULL)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getKakaoNaver(String id) {
		String kakao = null;
		String sql = "SELECT NAME FROM MEMBER WHERE ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				kakao = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return kakao;
	}
	public void signInNaver(String id, String email) {
		String pw = "" + ((int)(Math.random()*100000000));
		String name = "네이버";
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, NULL, NULL, NULL)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int getTotalMember() {
		String sql = "SELECT COUNT(*) FROM MEMBER";
		int totalMember = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalMember = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return totalMember;
	}
}
