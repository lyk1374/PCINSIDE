package com.pcinside.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.pcinside.dao.PCDao;
import com.pcinside.dao.ReviewDao;
import com.pcinside.dto.ReviewDto;


@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ReviewServlet() {
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
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page-1) * 10 + 1;
		int end = page * 10;
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		ReviewDao rDao = new ReviewDao();
		PCDao pDao = new PCDao();
		list = rDao.review(page);
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		for(ReviewDto r : list) {
			JSONObject obj = new JSONObject();
			obj.put("bno",r.getBno());
			String pcName = pDao.pcName(r.getPcNum());
			obj.put("pcName",pcName);
			obj.put("id",r.getMemberID());
			obj.put("title",r.getTitle());
			obj.put("content",r.getContent());
			obj.put("time",r.getTime());
			obj.put("best",r.getBest());
			String image = rDao.reviewItemImage(r.getPcNum());
			obj.put("image", image);
			array.add(obj);
		}
		out.println(array);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
}
