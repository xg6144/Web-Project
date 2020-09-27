package lib.dbconn;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//DB와 연결하는 클래스
public class DBConnection {
	public static Connection getConnection() throws SQLException, NamingException,
	ClassNotFoundException{
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle18c");
		Connection conn = ds.getConnection();
		return conn;
	}
}
