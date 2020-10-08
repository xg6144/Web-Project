package rent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import lib.dbconn.DBConnection;
import rent.vo.RentVO;

public class RentDAO {
	
	public static final int INSERT_SUCC = 1;
	public static final int INSERT_FAIL = 0;
	
	public static final int GET_SUCC = 1;
	public static final int GET_FAIL = 0;
	
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
	public int rentListInsert(String bookName, String bookWriter, String bookPub, String bookGe, 
			String userName, Timestamp rentDate)
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
			pstmt.setTimestamp(6, rentDate);
			
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
	
	public ArrayList<RentVO> getRentList() {
		ArrayList<RentVO> vos = new ArrayList<RentVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		RentVO vo = null;
		String sql = "select * from rentlist";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String bookName = rs.getString("book_name");
				String bookWriter = rs.getString("book_writer");
				String bookPub = rs.getString("book_pub");
				String bookGe = rs.getString("book_ge");
				String user_Name = rs.getString("user_name");
				Timestamp rentDate = rs.getTimestamp("rent_date");
				vo = new RentVO(bookName, bookWriter, bookPub, bookGe, user_Name,rentDate);
				vos.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return vos;
	}
}
