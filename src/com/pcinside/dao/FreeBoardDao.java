package com.pcinside.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pcinside.dto.AnnouncementDto;
import com.pcinside.dto.CommentDto;
import com.pcinside.dto.FreeBoardDto;

public class FreeBoardDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public FreeBoardDao() {
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
	public int freeBoardAll() {
		int freeBoardAll = 0;
		String sql = "SELECT COUNT(*) FROM FREE_BOARD WHERE BOARD_DELETE IS NULL";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				freeBoardAll = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return freeBoardAll;
	}	
	public ArrayList<FreeBoardDto> getFreeBoardList(int page) {
		
		ArrayList<FreeBoardDto> list = new ArrayList<FreeBoardDto>();
		int start = (page-1) * 10 + 1;
		int end = page * 10;
		String sql = "SELECT b2.rnum, b2.* FROM (SELECT rownum rnum, b.* FROM (SELECT BNO, WRITER, TITLE, CONTENT, TO_CHAR(TIME, 'YYYY-MM-DD HH24:MI') AS TIME FROM free_board where board_delete is null ORDER BY bno DESC) b) b2 WHERE b2.rnum>=? AND b2.rnum<=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String time = rs.getString("time");
				
				list.add(new FreeBoardDto(bno,writer,title,content,time)); //순서대로 담아야함
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public FreeBoardDto getFreeBoardShow(int bno) {
		
		FreeBoardDto writing = null;
		
		String sql = "select * from Free_Board where bno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String writer = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String time = rs.getString(5);
				
				writing = new FreeBoardDto(bno,writer,title,content,time); 
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return writing;
	}
	public ArrayList<CommentDto> getCommentList(int bno) {
		
		String sql = "select * from Free_board_comment where bno=? order by time desc";
			ArrayList<CommentDto> list = new ArrayList<CommentDto>();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.executeUpdate();
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String memberID = rs.getString(2);
					String content= rs.getString(3);
					String time = rs.getString(4);
					int rno = rs.getInt(5);
					list.add(new CommentDto(bno, memberID , content, time, rno));
				}
				rs.close();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
	}
	public void freeBoardWrite(String writer, String title, String content) {
		
		String sql= "insert into free_board values(bno_free_board.nextval, ?,?,?, sysdate, null)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			pstmt.close();
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	public FreeBoardDto getTitleAndContent(int bno) {
		FreeBoardDto fDto = null;
		String sql = "SELECT TITLE, CONTENT FROM FREE_BOARD WHERE BNO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString(1);
				String content = rs.getString(2);
				fDto = new FreeBoardDto(title, content);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fDto;
	}
	public void freeBoardModify(int bno ,String title,String content) {
		
		String sql = "update free_board set title=? ,content=? where bno=?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void freeBoardDelete(int bno) {
		
		String sql = "update free_board set board_delete = 'true' where bno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void commentWrite(int bno ,String memberID ,String content) {
		
		String sql = "insert into FREE_BOARD_COMMENT values(?,?,?,sysdate, seq_comment_rno.nextval)";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, memberID);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void commentModify(String content , int rno) {
		
		String sql = "update Free_board_comment set content=? where rno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,content);
			pstmt.setInt(2, rno);
			pstmt.executeUpdate();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void commentDelete(int rno) {
		
		String sql = "delete FROM free_Board_comment where rno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,rno);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
}
