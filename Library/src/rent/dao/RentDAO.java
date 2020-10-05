package rent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import lib.dbconn.DBConnection;

public class RentDAO {
	
	public static final int INSERT_SUCC = 1;
	public static final int INSERT_FAIL = 0;
	private static RentDAO instance;
	
	public static RentDAO getInstance() {
		if(instance == null)
			instance = new RentDAO();
		return instance;
	}
	
	private RentDAO() {}
	
	public int rentInsert(String rentNum, String bookId, String userId, String bookRen, Timestamp rentStart, String rentEnd) 
	{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into rent values(?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rentNum);
			pstmt.setString(2, bookId);
			pstmt.setString(3, userId);
			pstmt.setString(4, bookRen);
			pstmt.setTimestamp(5, rentStart);
			pstmt.setString(6, rentEnd);
			
			pstmt.executeUpdate();
			
			result = INSERT_SUCC;
		}catch(Exception e) {
			e.printStackTrace();
			result = INSERT_FAIL;
		}try {
			if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int rentListInsert(String bookName, String bookWriter, String bookPub, String bookGe, String userName)
	{
		int result;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into rentlist values(?, ?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookName);
			pstmt.setString(2, bookWriter);
			pstmt.setString(3, bookPub);
			pstmt.setString(4, bookGe);
			pstmt.setString(5, userName);
			
			pstmt.executeUpdate();
			
			result = INSERT_SUCC;
			
		}catch(Exception e) {
			e.printStackTrace();
			result = INSERT_FAIL;
		}try {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
