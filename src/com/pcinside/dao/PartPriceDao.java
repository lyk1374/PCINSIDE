package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.PartDto;

public class PartPriceDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public PartPriceDao() {
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
	public ArrayList<PartDto> getPartInfo(String str) {
		String sql = "SELECT PART_NAME, PRICE, IMAGE FROM PART_PRICE WHERE PART_NAME LIKE '%"+str+"%'";
		ArrayList<PartDto> list = new ArrayList<PartDto>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String partName = rs.getString(1);
				String price = rs.getString(2);
				String image = rs.getString(3);
				list.add(new PartDto(partName, price, image));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
