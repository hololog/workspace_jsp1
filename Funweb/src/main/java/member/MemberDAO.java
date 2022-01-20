package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	//멤버변수
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnetion() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl ="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
		conn=DriverManager.getConnection(dbUrl, "root", "1234");
		
		return conn;
	}
	
	public void dbClose() {
		if(conn!=null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(rs!=null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public void insertMem(MemberDTO mDTO) {
		try {
			conn=getConnetion();
			String sql="INSERT INTO member VALUES (?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
}
