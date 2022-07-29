package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pcinside.dto.ReviewDto;

public class ReviewDao {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ReviewDao() {
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
	public ArrayList<ReviewDto> mainScreenReview(){
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		String sql = "SELECT * FROM(SELECT R.BNO, R.PC_NUM, R.MEMBER_ID, R.TITLE, R.CONTENT, R.TIME, R.BEST FROM REVIEW R, PC P, MEMBER M WHERE R.PC_NUM = P.PC_NUM AND R.MEMBER_ID = M.ID AND BEST IS NOT NULL ORDER BY R.BNO DESC) WHERE ROWNUM <= 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt(1);
				int pcNum = rs.getInt(2);
				String id = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String time = rs.getString(6);
				String best = rs.getString(7);
				list.add(new ReviewDto(bno, pcNum, id, title, content, time, best));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ReviewDto> review(int page){
		int start = (page-1) * 10 + 1;
		int end = page * 10;
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		String sql = "SELECT b2.rnum, b2.* FROM (SELECT rownum rnum, b.* FROM (SELECT R.BNO, R.PC_NUM, R.MEMBER_ID, R.TITLE, R.CONTENT, R.TIME, R.BEST FROM REVIEW R, PC P, MEMBER M WHERE R.PC_NUM = P.PC_NUM AND R.MEMBER_ID = M.ID ORDER BY R.BNO DESC) b) b2 WHERE b2.rnum>=? AND b2.rnum<=?";
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt(3);
				int pcNum = rs.getInt(4);
				String id = rs.getString(5);
				String title = rs.getString(6);
				String content = rs.getString(7);
				String time = rs.getString(8);
				String best = rs.getString(9);
				list.add(new ReviewDto(bno, pcNum, id, title, content, time, best));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public String reviewItemImage(int pcNum) {
		String pcImage = null;
		String sql = "SELECT IMAGE FROM PC WHERE PC_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcNum);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pcImage = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pcImage;
	}
	public int getAllReview() {
		int reviewCnt = 0;
		String sql = "SELECT COUNT(*) FROM REVIEW";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewCnt = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reviewCnt;
	}
}
