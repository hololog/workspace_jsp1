package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		conn=ds.getConnection();
		return conn;
	}
	
	public void closeDB() {
		try {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int getNextNum() {
		String sql="SELECT MAX(num) FROM board;";

		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) 
				return rs.getInt(1)+1; //게시물 번호
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return -1; //예외처리
	}
	
	public void insertBoard(BoardDTO bDTO){
		String sql="INSERT INTO board(num,name,pass,subject,content,readcount,date) VALUES(?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,bDTO.getNum());
			pstmt.setString(2,bDTO.getName());
			pstmt.setString(3,bDTO.getPass());
			pstmt.setString(4,bDTO.getSubject());
			pstmt.setString(5,bDTO.getContent());
//			pstmt.setInt(6,bDTO.getReadcount());
			pstmt.setInt(6,0);
//			pstmt.setTimestamp(7, bDTO.getDate());
			pstmt.setTimestamp(7,new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	public void updateReadCount(int num) {
		String sql="UPDATE board SET readcount=readcount+1 WHERE num=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	public List<BoardDTO> showList() {
		String sql="SELECT num,name,subject,readcount,date FROM board ORDER BY num desc";
		List<BoardDTO> list=new ArrayList<BoardDTO>();
		BoardDTO bDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				bDTO = new BoardDTO();
				bDTO.setNum(rs.getInt(1));
				bDTO.setName(rs.getString(2));
				bDTO.setSubject(rs.getString(3));
				bDTO.setReadcount(rs.getInt(4));
				bDTO.setDate(rs.getTimestamp(5));
				
				list.add(bDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return list;
	}
	
	public BoardDTO getContent(int num) {
		String sql="SELECT * FROM board WHERE num=?";
		BoardDTO bDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bDTO=new BoardDTO();
				bDTO.setNum(rs.getInt(1));
				bDTO.setName(rs.getString(2));
				bDTO.setPass(rs.getString(3));
				bDTO.setSubject(rs.getString(4));
				bDTO.setContent(rs.getString(5));
				bDTO.setReadcount(rs.getInt(6));
				bDTO.setDate(rs.getTimestamp(7));
			} else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return bDTO;
	}

	public int updateBoard(BoardDTO bDTO) {
		String sql="SELECT * FROM board WHERE num=? and pass=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bDTO.getNum());
			pstmt.setString(2, bDTO.getPass());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				sql="UPDATE board SET name=?,subject=?,content=? WHERE num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,bDTO.getName());
				pstmt.setString(2,bDTO.getSubject());
				pstmt.setString(3,bDTO.getContent());
				pstmt.setInt(4,bDTO.getNum());
				pstmt.executeUpdate();
				
				return 1; //업데이트 성공
			}
			return 0; //패스워드 틀림	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return -1; //업데이트 실패
	}

}

































