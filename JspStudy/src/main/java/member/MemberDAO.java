package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {//(data access object)
	//멤버변수
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	public Connection getConnection() throws Exception {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbId = "root";
			String dbPass = "1234";
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
			con = DriverManager.getConnection(dbUrl,dbId, dbPass);
			
			return con;
		}

	public void insertMem(MemberDTO mDTO) {
		try {
			con = getConnection();
			sql = "insert into member(id,pass,name,date) values(?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setTimestamp(4, mDTO.getDate());
			//4.sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return;
	}//insertMember()
	
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO mDTO = null;
		try { 
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				return mDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mDTO;		
		
	}

	public MemberDTO getInfo(String id) {
		MemberDTO mDTO = null;
		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				return mDTO;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mDTO;
	}
	//이전
//	public ResultSet getInfo(MemberDTO mDTO) {
//		try {
//			sql = "SELECT * FROM member WHERE id=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1,mDTO.getId());
//			rs = pstmt.executeQuery();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return rs;
//	}

	public MemberDTO[] showList() {
		MemberDTO[] mDTO = null;
		int size = 0;
		try {
			con = getConnection();
			sql = "SELECT count(id) as size FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				size=rs.getInt("SIZE");
			}
			mDTO = new MemberDTO[size];
			sql = "SELECT * FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			for(int i=0; rs.next(); i++) {
				mDTO[i].setId(rs.getString("id"));
				mDTO[i].setPass(rs.getString("pass"));
				mDTO[i].setName(rs.getString("name"));
				mDTO[i].setDate(rs.getTimestamp("date"));
			}
			return mDTO;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mDTO;
	}	

	public void updateMem(MemberDTO updateDTO) {
		try {
			con = getConnection();
			sql = "UPDATE member set pass=?, name=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updateDTO.getPass());
			pstmt.setString(2,updateDTO.getName());
			pstmt.setString(3,updateDTO.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMem(MemberDTO mDTO) {
		try {
			con = getConnection();
			sql="DELETE FROM member WHERE id=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mDTO.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
































