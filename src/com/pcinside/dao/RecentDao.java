package com.pcinside.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pcinside.dto.RecentDto;

public class RecentDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public RecentDao(){
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "pcinside";
		String dbPW = "1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbID, dbPW);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<RecentDto> getRecent() {
		
			ArrayList<RecentDto> list = new ArrayList<RecentDto>();
		
			String sql = "select CPU_MAKER , CPU_TYPE, CPU_NAME , GRAPHIC_NAME ,PRICE , to_char(SELL_TIME, 'YYYY-MM-DD') from PC where SELL_TIME IS NOT NULL order by SELL_TIME desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String CPU_MAKER = rs.getString("CPU_MAKER");
				String CPU_TYPE = rs.getString("CPU_TYPE");
				String CPU_NAME = rs.getString("CPU_NAME");
				String GRAPHIC_NAME = rs.getString("GRAPHIC_NAME");
				int PRICE = rs.getInt("PRICE");
				String SELL_TIME = rs.getString(6);
				
			list.add(new RecentDto(CPU_MAKER, CPU_TYPE, CPU_NAME ,GRAPHIC_NAME ,PRICE ,SELL_TIME ));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int recentAll() {
		int recentAll = 0;
		String sql = "SELECT COUNT(*) FROM PC WHERE SELL_TIME IS NOT NULL";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recentAll = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recentAll;
	}
}//main
