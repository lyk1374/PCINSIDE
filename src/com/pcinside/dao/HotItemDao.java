package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.PCDto;

public class HotItemDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public HotItemDao() {
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
	
	public ArrayList<Integer> hotItemCntList(int page) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		int start = (page-1) * 10 + 1;
		int end = page * 10;
		String sql = "SELECT b2.rnum, b2.* FROM (SELECT rownum rnum, b.* FROM (select p.pc_num, count(l.pc_num) as cnt from pc p, pc_like l where p.pc_num = l.pc_num AND SELL_TIME IS NULL group by p.pc_num order by cnt desc) b) b2 WHERE b2.rnum>=? AND b2.rnum<=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getInt(4));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Integer> hotItemPCList(int page) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		int start = (page-1) * 10 + 1;
		int end = page * 10;
		String sql = "SELECT b2.rnum, b2.* FROM (SELECT rownum rnum, b.* FROM (select p.pc_num, count(l.pc_num) as cnt from pc p, pc_like l where p.pc_num = l.pc_num AND SELL_TIME IS NULL group by p.pc_num order by cnt desc) b) b2 WHERE b2.rnum>=? AND b2.rnum<=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getInt(3));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public PCDto hotItemPC(int pcNum) {
		PCDto pcInfo = null;
		String sql = "SELECT PRICE, CPU_MAKER, CPU_TYPE, CPU_NAME, GRAPHIC_CHIPSET, GRAPHIC_NAME, SELL_TIME FROM PC WHERE PC_NUM = ? AND SELL_TIME IS NULL";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcNum);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int price = rs.getInt(1);
				String cpuMaker = rs.getString(2);
				String cpuType = rs.getString(3);
				String cpuName = rs.getString(4);
				String graphicChipset = rs.getString(5);
				String graphicName = rs.getString(6);
				String sellTime = rs.getString(7);
				
				pcInfo = new PCDto(price, cpuMaker, cpuType, cpuName, graphicChipset, graphicName, sellTime);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pcInfo;
	}
	public int hotItemAll() {
		int hotItemAll = 0;
		String sql = "SELECT COUNT(*) FROM (select p.pc_num, count(l.pc_num) as cnt from pc p, pc_like l where p.pc_num = l.pc_num group by p.pc_num order by cnt desc)";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hotItemAll = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return hotItemAll;
	}
	public int likeChk(String id, int pcNum) {
		int likeChk = 0;
		ArrayList<Integer> list = new ArrayList<Integer>();
		String sql="SELECT PC_NUM FROM PC_LIKE WHERE MEMBER_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i) == pcNum) {
				likeChk = 1;
			}
		}
		return likeChk;
	}
	public void like(String id, int pcNum) {
		String sql = "INSERT INTO PC_LIKE VALUES(?,?,SYSDATE)";
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcNum);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void unLike(String id, int pcNum) {
		String sql = "DELETE FROM PC_LIKE WHERE MEMBER_ID = ? AND PC_NUM = ?";
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pcNum);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
