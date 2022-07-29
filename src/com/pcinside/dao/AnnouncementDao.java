package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.AnnouncementDto;

public class AnnouncementDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public AnnouncementDao() {
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
	public int announcementAll() {
		int announcementAll = 0;
		String sql = "SELECT COUNT(*) FROM ANNOUNCEMENT";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				announcementAll = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return announcementAll;
	}
	public ArrayList<AnnouncementDto> getAnnouncementList(int page) {
		ArrayList<AnnouncementDto> list = new ArrayList<AnnouncementDto>();
		int start = (page-1) * 10 + 1;
		int end = page * 10;
		String sql = "SELECT b2.rnum, b2.* FROM (SELECT rownum rnum, b.* FROM (SELECT BNO, TITLE, CONTENT, TO_CHAR(TIME, 'YYYY-MM-DD HH24:MI') AS TIME FROM announcement ORDER BY bno DESC) b) b2 WHERE b2.rnum>=? AND b2.rnum<=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String time = rs.getString("time");
				list.add(new AnnouncementDto(bno, title, content, time));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}
	public AnnouncementDto getAnnouncementShow(int bno) {
		AnnouncementDto writing = null;
		String sql = "SELECT * FROM ANNOUNCEMENT WHERE BNO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString(2);
				String content = rs.getString(3);
				String time = rs.getString(4);
				writing = new AnnouncementDto(bno, title, content, time);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return writing;
	}
	public void writeAnnouncement(AnnouncementDto aDto) {
		String sql = "INSERT INTO ANNOUNCEMENT VALUES(BNO_ANNOUNCEMENT.NEXTVAL, ?, ?, SYSDATE)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aDto.getTitle());
			pstmt.setString(2, aDto.getContent());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public AnnouncementDto getTitleAndContent(int bno) {
		AnnouncementDto aDto = null;
		String sql = "SELECT TITLE, CONTENT FROM ANNOUNCEMENT WHERE BNO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString(1);
				String content = rs.getString(2);
				aDto = new AnnouncementDto(title, content);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return aDto;
	}
	public void modifyAnnouncement(AnnouncementDto aDto) {
		String sql = "UPDATE ANNOUNCEMENT SET TITLE=?, CONTENT=? WHERE BNO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aDto.getTitle());
			pstmt.setString(2, aDto.getContent());
			pstmt.setInt(3, aDto.getBno());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteAnnouncement(int bno) {
		String sql = "DELETE FROM ANNOUNCEMENT WHERE BNO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
