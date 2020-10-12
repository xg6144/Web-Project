package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import book.vo.BookVO;
import lib.dbconn.DBConnection;

public class BookDAO {
	private static BookDAO instance;
	
	public static final int BOOK_INS_SUCC = 1;
	public static final int BOOK_INS_FAIL = 0;
	
	public static BookDAO getInstance()
	{
		if(instance == null) 
			instance = new BookDAO();
		return instance;
	}
	
	private BookDAO(){}
	
	public int insertBook(String book_id, String book_name, String book_writer, String book_pub, String book_ge)
	{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into book values(?,?,?,?,?)";
		
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_id);
			pstmt.setString(2, book_name);
			pstmt.setString(3, book_writer);
			pstmt.setString(4, book_pub);
			pstmt.setString(5, book_ge);
			
			pstmt.executeUpdate();
			
			result = BOOK_INS_SUCC;
		}catch(Exception e)
		{
			result = BOOK_INS_FAIL;
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public ArrayList<BookVO> bookList(String id){
		ArrayList<BookVO> vos = new ArrayList<BookVO>();
		
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		String sql1 = "Select book_id from rent where user_id = ?";
		String sql2 = "select * from book where book_id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, id);
			rs1 = pstmt1.executeQuery();
			
			while(rs1.next()) {
				String book_id = rs1.getString("book_id");
		
				if(book_id!=null)
				{
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, book_id);
					rs2 = pstmt2.executeQuery();
					
					while(rs2.next())
					{
						String book_name = rs2.getString("book_name");
						String book_writer = rs2.getString("book_writer");
						String book_pub = rs2.getString("book_pub");
						BookVO vo = new BookVO(book_name, book_writer, book_pub);
						vos.add(vo);
					}
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt1!=null) pstmt1.close();
				if(rs1!=null) rs1.close();
				if(pstmt2!=null) pstmt2.close();
				if(rs2!=null) rs2.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return vos;
	}
	
	public ArrayList<BookVO> bookDate(String id){
		ArrayList<BookVO> vos = new ArrayList<BookVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql1 = "Select rent_date, rent_end from rent where user_id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Timestamp rent_date = rs.getTimestamp("rent_date");
				Timestamp rent_end = rs.getTimestamp("rent_end");
				BookVO vo = new BookVO(rent_date, rent_end);
				vos.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return vos;
	}
	
	public ArrayList<BookVO> borrowList() {
		ArrayList<BookVO> vos = new ArrayList<BookVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from book";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String bookId = rs.getString("book_id");
				String bookName = rs.getString("book_name");
				String bookWriter = rs.getString("book_writer");
				String bookPub = rs.getString("book_pub");
				String bookGe = rs.getString("book_ge");
				
				BookVO vo = new BookVO(bookId, bookName, bookWriter, bookPub, bookGe);
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
	
	public ArrayList<BookVO> borrowListSearch(BookVO bookVO)
	{
		ArrayList<BookVO> listSearch = new ArrayList<BookVO>();
		String _name = bookVO.getBookName();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from book";
		try {
			conn = DBConnection.getConnection();
			if((_name != null && _name.length()!=0)) {
				sql += "where book_name = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, _name);
			}else {
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				String bookId = rs.getString("book_id");
				String bookName = rs.getString("book_name");
				String bookWriter = rs.getString("book_writer");
				String bookPub = rs.getString("book_pub");
				String bookGe = rs.getString("book_ge");
				
				BookVO vo = new BookVO();
				vo.setBookId(bookId);
				vo.setBookName(bookName);
				vo.setBookWriter(bookWriter);
				vo.setBookPub(bookPub);
				vo.setBookGe(bookGe);
				
				listSearch.add(vo);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return listSearch;
	}
}
