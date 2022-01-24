package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//멤버변수
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnetion() throws Exception {
//		Class.forName("com.mysql.jdbc.Driver");
//		String dbUrl ="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
//		conn=DriverManager.getConnection(dbUrl, "root", "1234");
//		
//		return conn;
		
		//커넥션풀적용
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
	
	public void insertMem(MemberDTO mDTO) {
		try {
			conn=getConnetion();
			String sql="INSERT INTO member VALUES (?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setTimestamp(4, mDTO.getDate());
			pstmt.setString(5, mDTO.getEmail());
			pstmt.setString(6, mDTO.getAddress());
			pstmt.setString(7, mDTO.getPhone());
			pstmt.setString(8, mDTO.getMobile());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO mDTO=null;
		
		try {
			conn=getConnetion();
			String sql="SELECT * FROM member WHERE id=? and pass=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mDTO=new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setMobile(rs.getString("mobile"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return mDTO;
	}

	public MemberDTO getMember(String id) {
		MemberDTO mDTO=null;
		try {
			conn=getConnetion();
			String sql="SELECT * FROM member WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mDTO=new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setMobile(rs.getString("mobile"));
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return mDTO;
	}

	public void updateMember(MemberDTO mDTO) {
		try {
			conn=getConnetion();
			String sql="UPDATE member SET name=?, email=?, address=?, phone=?, mobile=? WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getName());
			pstmt.setString(2, mDTO.getEmail());
			pstmt.setString(3, mDTO.getAddress());
			pstmt.setString(4, mDTO.getPhone());
			pstmt.setString(5, mDTO.getMobile());
			pstmt.setString(6, mDTO.getId());
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
}
