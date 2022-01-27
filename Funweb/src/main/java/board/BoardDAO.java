package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnetion() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		conn=ds.getConnection();
		return conn;
	}
	
	public void dbClose() {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void getBoardList(){
		
	}
	
}
