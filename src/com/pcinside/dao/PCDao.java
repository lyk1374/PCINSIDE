package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.PCDto;

public class PCDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public PCDao() {
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
	public String pcName(int pcNum) {
		String pcName = null;
		String sql = "SELECT CPU_MAKER, CPU_TYPE, CPU_NAME, GRAPHIC_CHIPSET, GRAPHIC_NAME\r\n" + 
						"FROM PC\r\n" + 
						"WHERE PC_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcNum);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String cpuMaker = rs.getString(1);
				String cpuType = rs.getString(2);
				String cpuName = rs.getString(3);
				String graphicChipset = rs.getString(4);
				String graphicName = rs.getString(5);
				pcName = "" + cpuMaker + " " + cpuType + " " + cpuName + " " + graphicChipset + " " + graphicName;
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pcName;
	}
	public ArrayList<PCDto> pcList() {
		ArrayList<PCDto> list = new ArrayList<PCDto>();
		String sql = "SELECT PC_NUM, IMAGE, PRICE, CPU_MAKER, CPU_TYPE, CPU_GEN, CPU_NAME, GRAPHIC_CHIPSET, GRAPHIC_NAME FROM PC WHERE SELL_TIME IS NULL ORDER BY PC_NUM DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pcNum = rs.getInt(1);
				String image = rs.getString(2);
				int price = rs.getInt(3);
				String cpuMaker = rs.getString(4);
				String cpuType = rs.getString(5);
				String cpuGen = rs.getString(6);
				String cpuName = rs.getString(7);
				String graphicChipset = rs.getString(8);
				String graphicName = rs.getString(9);
				
				list.add(new PCDto(pcNum, image, price, cpuMaker, cpuType, cpuGen, cpuName, graphicChipset, graphicName));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<PCDto> pcListSearchByPrice(int price2) {
		ArrayList<PCDto> list = new ArrayList<PCDto>();
		String sql = "SELECT PC_NUM, IMAGE, PRICE, CPU_MAKER, CPU_TYPE, CPU_GEN, CPU_NAME, GRAPHIC_CHIPSET, GRAPHIC_NAME FROM PC WHERE SELL_TIME IS NULL AND (? - 50000) <= PRICE AND PRICE <= (? + 50000) ORDER BY PC_NUM DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price2);
			pstmt.setInt(2, price2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pcNum = rs.getInt(1);
				String image = rs.getString(2);
				int price = rs.getInt(3);
				String cpuMaker = rs.getString(4);
				String cpuType = rs.getString(5);
				String cpuGen = rs.getString(6);
				String cpuName = rs.getString(7);
				String graphicChipset = rs.getString(8);
				String graphicName = rs.getString(9);
				
				list.add(new PCDto(pcNum, image, price, cpuMaker, cpuType, cpuGen, cpuName, graphicChipset, graphicName));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public PCDto pcDetail(int pcNum) {
		PCDto pc = null;
		String sql = "SELECT * FROM PC WHERE PC_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcNum);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String mining = rs.getString(2); 
				String smoking = rs.getString(3);
				int opinion1 = rs.getInt(4);
				int opinion2 = rs.getInt(5);
				int opinion3 = rs.getInt(6);
				String image = rs.getString(7);
				int price = rs.getInt(8);
				String cpuMaker = rs.getString(9);
				String cpuType = rs.getString(10);
				String cpuGen = rs.getString(11);
				String cpuName = rs.getString(12);
				String motherBoardMaker = rs.getString(13);
				String motherBoardName = rs.getString(14);
				String graphicChipset = rs.getString(15);
				String graphicName = rs.getString(16);
				String ramMaker = rs.getString(17);
				String ramGen = rs.getString(18);
				String ramVol = rs.getString(19);
				String ssdMaker = rs.getString(20);
				String ssdVol = rs.getString(21);
				String hddMaker = rs.getString(22);
				String hddVol = rs.getString(23);
				String powerMaker = rs.getString(24);
				String powerCap = rs.getString(25);
				String sellTime = rs.getString(26);
				int baseBranch = rs.getInt(27);
				
				pc = new PCDto(pcNum, mining, smoking, opinion1, opinion2, opinion3, image, price, cpuMaker, cpuType, cpuGen, cpuName, motherBoardMaker, motherBoardName, graphicChipset, graphicName, ramMaker, ramGen, ramVol, ssdMaker, ssdVol, hddMaker, hddVol, powerMaker, powerCap, sellTime, baseBranch);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pc;
	}
	public String opinion(int opinionNum) {
		String opinion = null;
		String sql = "SELECT CONTENT FROM OPINION WHERE OP_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, opinionNum);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				opinion = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return opinion;
	}
	public String location(int pcNum) {
		String baseBranch = null;
		String sql = "SELECT B.LOCATION FROM PC P, BRANCH B WHERE P.BASE_BRANCH = B.IDX AND P.PC_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcNum);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				baseBranch = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return baseBranch;
	}
	public ArrayList<PCDto> myPagePC(String id) {
		String sql = "SELECT P.PC_NUM, P.IMAGE, P.PRICE, P.CPU_MAKER, P.CPU_TYPE, P.CPU_GEN, P.CPU_NAME, P.GRAPHIC_CHIPSET, P.GRAPHIC_NAME FROM (SELECT PL.PC_NUM AS PN FROM MEMBER M, PC_LIKE PL WHERE M.ID = PL.MEMBER_ID AND M.ID = ?) , PC P WHERE PN = P.PC_NUM";
		ArrayList<PCDto> list = new ArrayList<PCDto>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pcNum = rs.getInt(1);
				String image = rs.getString(2);
				int price = rs.getInt(3);
				String cpuMaker = rs.getString(4);
				String cpuType = rs.getString(5);
				String cpuGen = rs.getString(6);
				String cpuName = rs.getString(7);
				String graphicChipset = rs.getString(8);
				String graphicName = rs.getString(9);
				list.add(new PCDto(pcNum, image, price, cpuMaker, cpuType, cpuGen, cpuName, graphicChipset, graphicName));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void uploadPC(PCDto pcDto) {
		String sql = "INSERT INTO PC VALUES(PC_NUM_PC.NEXTVAL, ?, ?, ?, ?, ?, TO_CHAR(SEQ_IMAGE.NEXTVAL) || '_1', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcDto.getMining());
			pstmt.setString(2, pcDto.getSmoking());
			pstmt.setInt(3, pcDto.getOpinion1());
			pstmt.setInt(4, pcDto.getOpinion2());
			pstmt.setInt(5, pcDto.getOpinion3());
			pstmt.setInt(6, pcDto.getPrice());
			pstmt.setString(7, pcDto.getCpuMaker());
			pstmt.setString(8, pcDto.getCpuType());
			pstmt.setString(9, pcDto.getCpuGen());
			pstmt.setString(10, pcDto.getCpuName());
			pstmt.setString(11, pcDto.getMotherBoardMaker());
			pstmt.setString(12, pcDto.getMotherBoardName());
			pstmt.setString(13, pcDto.getGraphicChipset());
			pstmt.setString(14, pcDto.getGraphicName());
			pstmt.setString(15, pcDto.getRamMaker());
			pstmt.setString(16, pcDto.getRamGen());
			pstmt.setString(17, pcDto.getRamVol());
			pstmt.setString(18, pcDto.getSsdMaker());
			pstmt.setString(19, pcDto.getSsdVol());
			pstmt.setString(20, pcDto.getHddMaker());
			pstmt.setString(21, pcDto.getHddVol());
			pstmt.setString(22, pcDto.getPowerMaker());
			pstmt.setString(23, pcDto.getPowerCap());
			pstmt.setInt(24, pcDto.getBaseBranch());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
