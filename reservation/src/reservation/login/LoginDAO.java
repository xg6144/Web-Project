package reservation.login;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDAO {
	
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL = 0;
	public static final int NOT_ID = -1;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private DataSource ds;
	boolean loginCheck;
	public LoginDAO()
	{
		try {	
			Context context = new InitialContext();			
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int userCheck(String id, String pw) {
		int check = 0;
		String dbPw;
		
		String sql = "select password from register where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dbPw = rs.getString("password");
				if(dbPw.equals(pw))
				{
					check = LOGIN_SUCCESS;
				}else
				{
					check = LOGIN_FAIL;
				}
			}else
			{
				check = NOT_ID;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(pstmt != null) {pstmt.close();}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return check;
		
	}
	
	public LoginDTO getMember(String id) {
		LoginDTO loginDTO = new LoginDTO();
		String sql = "select * from register where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				loginDTO.setId(rs.getString("id"));
				loginDTO.setPassword(rs.getString("password"));
				loginDTO.setName(rs.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(pstmt != null) {pstmt.close();}
				if(rs != null) {rs.close();}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return loginDTO;
	}
}
