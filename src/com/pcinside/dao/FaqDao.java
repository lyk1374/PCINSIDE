package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.FAQDto;

public class FaqDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public FaqDao() {
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
	
	public ArrayList<FAQDto> mainScreenFAQ(){
		ArrayList<FAQDto> list = new ArrayList<FAQDto>();
		String sql = "SELECT BNO, TITLE FROM (SELECT BNO, TITLE FROM FAQ ORDER BY HITCOUNT DESC) WHERE ROWNUM <= 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt(1);
				String title = rs.getString(2);
				list.add(new FAQDto(bno, title));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<FAQDto> faqList() {
		
		ArrayList<FAQDto> list = new ArrayList<FAQDto>();
		
		String sql = "SELECT * FROM faq";
		
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt(1);
				String faqClass = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				list.add(new FAQDto(bno,faqClass,title,content));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list;
	}
}
