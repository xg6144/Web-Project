package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import lib.dbconn.DBConnection;
import user.vo.UserVO;

public class UserDAO {
	private static UserDAO instance;
	
	public static final int INSERT_SUCCESS = 1;
	public static final int INSERT_FAIL = 0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_PASSWORD_NOT = 0;
	private UserDAO()
	{
		
	}
	
	public static UserDAO getInstance() {
		if(instance == null) instance = new UserDAO();
		return instance;
	}
	
	public int insertUser(String id, String pw, String name, Timestamp regDate, String email) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into users values(?, ?, ?, ?, ?)";
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setTimestamp(4, regDate);
			pstmt.setString(5, email);
			
			pstmt.executeUpdate();
			result = INSERT_SUCCESS;
		}catch(Exception e) {
			try {
				//conn.rollback();
				result = INSERT_FAIL;
			}catch(Exception e2) {
				e2.printStackTrace();
			}finally {
				try {
					if(conn!=null)
						conn.close();
						conn=null;
					if(pstmt!=null)
						pstmt.close();
						pstmt = null;
				}catch(Exception e3)
				{
					e3.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public int userLogin(String id, String pw) {
		int result = 0;
		String dbPw;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select user_pw from users where USER_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPw = rs.getString("user_pw");
				if(dbPw.equals(pw)) {
					result = LOGIN_SUCCESS; 
				}else {
					result = LOGIN_PASSWORD_NOT; 
				}
			}else {
				result = -1;
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
		
		return result;
	}
	
	public UserVO getUser(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserVO vo = null;
		String sql = "select * from users where user_id = ?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new UserVO();
				vo.setId(rs.getString("user_id"));
				vo.setPw(rs.getString("user_pw"));
				vo.setName(rs.getString("user_name"));
				vo.setRegDate(rs.getTimestamp("user_reg"));
				vo.setEmail(rs.getString("user_email"));
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
		return vo;
	}
	
	public ArrayList<UserVO> getUserList() {
		ArrayList<UserVO> vos = new ArrayList<UserVO>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from users";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String userId = rs.getString("user_id");
				String userPw = rs.getString("user_pw");
				String userName = rs.getString("user_name");
				Timestamp regDate = rs.getTimestamp("user_reg");
				String userEmail = rs.getString("user_email");
				
				UserVO vo = new UserVO(userId, userPw, userName, userEmail, regDate);
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
