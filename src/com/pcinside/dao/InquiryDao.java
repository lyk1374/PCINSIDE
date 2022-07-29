package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pcinside.dto.InquiryDto;

public class InquiryDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public InquiryDao() {
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
	public ArrayList<InquiryDto> getInquiryList(){
		ArrayList<InquiryDto> list = new ArrayList<InquiryDto>();
		String sql = "SELECT * FROM INQUIRY order by idx desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String email = rs.getString(4);
				String title = rs.getString(5);
				String content = rs.getString(6);
				list.add(new InquiryDto(name, phone, email, title, content));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void inquiry(InquiryDto iDto) {
		
		String sql = "insert into inquiry values(SEQ_INQUIRY.nextval, ?, ?, ?, ?, ?, 'N', 'N')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, iDto.getName());
			pstmt.setString(2, iDto.getPhone());
			pstmt.setString(3, iDto.getEmail());
			pstmt.setString(4, iDto.getTitle());
			pstmt.setString(5, iDto.getContent());
			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
