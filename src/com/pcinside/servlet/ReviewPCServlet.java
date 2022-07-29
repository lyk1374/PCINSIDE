package com.pcinside.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/ReviewPCServlet")
public class ReviewPCServlet extends HttpServlet {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ReviewPCServlet() {
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
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcNum = Integer.parseInt(request.getParameter("pcNum"));
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		obj.put("pcName", pcName);
		out.println(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
