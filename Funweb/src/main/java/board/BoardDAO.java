package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnection() throws Exception {
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
	public List<BoardDTO> getBoardList(int startRow, int pageSize) {
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		try {
			conn=getConnection();
			String sql="select * from board order by num desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bDTO=new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setPass(rs.getString("pass"));
				bDTO.setName(rs.getString("name"));
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setReadcount(rs.getInt("readcount"));
				bDTO.setFile(rs.getString("file"));
				bDTO.setDate(rs.getTimestamp("date"));
				boardList.add(bDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return boardList;
	}//
	public int getBoardCount() {
		String sql="SELECT COUNT(*) FROM board";
		int result=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return result;
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
			dbClose();
		}
	}
	public BoardDTO getBoard(int num) {
		String sql="SELECT * FROM board WHERE num=?";
		BoardDTO bDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bDTO=new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setName(rs.getString("name"));
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setReadcount(rs.getInt("readcount"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return bDTO;
	}
	public void updateBoard(BoardDTO bDTO) {
		String sql="UPDATE board set subject=?,content=?,file=? WHERE num=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bDTO.getSubject());
			pstmt.setString(2, bDTO.getContent());
			pstmt.setString(3, bDTO.getFile());
			pstmt.setInt(4, bDTO.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	public void deleteBoard(int num) {
		String sql="DELETE FROM board WHERE num=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	public int getMaxNum() {
		String sql="SELECT max(num) FROM board";
		int result=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("max(num)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return result;
	}
	public void insertBoard(BoardDTO insertDTO) {
		String sql="INSERT INTO board(num,name,pass,subject,content,readcount,date,file)"
				 + "VALUES(?,?,?,?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, insertDTO.getNum());
			pstmt.setString(2, insertDTO.getName());
			pstmt.setString(3, insertDTO.getPass());
			pstmt.setString(4, insertDTO.getSubject());
			pstmt.setString(5, insertDTO.getContent());
			pstmt.setInt(6, insertDTO.getReadcount());
			pstmt.setTimestamp(7, insertDTO.getDate());
			pstmt.setString(8, insertDTO.getFile());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} 
	}
}
