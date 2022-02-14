package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	//멤버변수
		private Connection con=null;
		private PreparedStatement pstmt=null;
		private ResultSet rs=null;
		
		//db연결
		public Connection getConnection() throws Exception{
			// JDBC 설치
			// WEB-INF - lib - mysql-connector-java-5.1.39-bin.jar
			//DataBase Connection Pool : 미리 서버에서 연결하고 연결정보를 저장
			//                           필요할때 연결자원의 이름을 불러서 사용
			// 수정 1회 최소화, 성능 높아짐 
			// META-INF context.xml
			
			//  context.xml 불러오기 위해 객체생성  import javax.naming.Context;
			Context init=new InitialContext();
			// 자원이름 찾아서 불러오기 javax.sql.DataSource
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			// 디비연결
			con=ds.getConnection();
			return con;
		}
		
		//객체마무리
		public void dbClose() {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	
	// 리턴할형 List  getBoardList(int startRow, int pageSize) 메서드 정의
		public List<BoardDTO> getBoardList(int startRow, int pageSize) {
//			List boardList=new ArrayList();
			List<BoardDTO> boardList=new ArrayList<BoardDTO>();
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql select * from board order by num desc limit startRow-1,pageSize
				String sql="select * from board order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				//4 실행 => 결과저장
				rs=pstmt.executeQuery();
				//5 결과 행접근 => BoardDTO객체생성 => set메서드호출 열접근해서 저장
				while(rs.next()) {
					//다음행 데이터 있으면 true => 열접근 => BoardDTO 멤버변수 저장
					BoardDTO bDTO=new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setPass(rs.getString("pass"));
					bDTO.setName(rs.getString("name"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setContent(rs.getString("content"));
					bDTO.setReadcount(rs.getInt("readcount"));
					bDTO.setDate(rs.getTimestamp("date"));
					//file이름 저장
					bDTO.setFile(rs.getString("file"));
					
					//배열한칸에 순서대로 저장
					// BoardDTO형을 모든형(Object)으로 잠시 변경해서 저장=> 업캐스팅
					boardList.add(bDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return boardList;
		}//
		
		
		// 리턴할형 List  getBoardList(int startRow, int pageSize,String search) 메서드 정의
		// 객체지향개념 메서드 오버로딩 이용
		public List<BoardDTO> getBoardList(int startRow, int pageSize, String search) {
//			List boardList=new ArrayList();
			List<BoardDTO> boardList=new ArrayList<BoardDTO>();
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql select * from board order by num desc limit startRow-1,pageSize
//				String sql="select * from board where subject like '%검색어%'  order by num desc limit ?,?";
				String sql="select * from board where subject like ?  order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				//4 실행 => 결과저장
				rs=pstmt.executeQuery();
				//5 결과 행접근 => BoardDTO객체생성 => set메서드호출 열접근해서 저장
				while(rs.next()) {
					//다음행 데이터 있으면 true => 열접근 => BoardDTO 멤버변수 저장
					BoardDTO bDTO=new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setPass(rs.getString("pass"));
					bDTO.setName(rs.getString("name"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setContent(rs.getString("content"));
					bDTO.setReadcount(rs.getInt("readcount"));
					bDTO.setDate(rs.getTimestamp("date"));
					//file이름 저장
					bDTO.setFile(rs.getString("file"));
					
					//배열한칸에 순서대로 저장
					// BoardDTO형을 모든형(Object)으로 잠시 변경해서 저장=> 업캐스팅
					boardList.add(bDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return boardList;
		}//
		
		
		// int  리턴할형  getBoardCount() 메서드 정의
		public int getBoardCount() {
			int count=0;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
				// 4실행=>결과저장
				rs=pstmt.executeQuery();
				//5 rs 다음행으로 접근 열접근 => count변수에 저장
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return count;
		}//
		
		// int  리턴할형  getBoardCount() 메서드 정의
		public int getBoardCount(String search) {
			int count=0;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
//				String sql="select count(*) from board where subject like '%검색어%'";
				String sql="select count(*) from board where subject like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				// 4실행=>결과저장
				rs=pstmt.executeQuery();
				//5 rs 다음행으로 접근 열접근 => count변수에 저장
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return count;
		}//
		
		
		//리턴할값없음 updateReadcount(int num) 메서드 정의
		public void updateReadcount(int num) {
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="update board set readcount=readcount+1 where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}//
		
		//BoardDTO 리턴할형 getBoard(int num)메서드 정의
		public BoardDTO getBoard(int num) {
			BoardDTO bDTO=null;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="select * from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4 실행 => 결과저장
				rs=pstmt.executeQuery();
				//5 결과 => BoardDTO 저장
				while(rs.next()) {
					//다음행 데이터 있으면 true => 열접근 => BoardDTO 멤버변수 저장
					bDTO=new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setPass(rs.getString("pass"));
					bDTO.setName(rs.getString("name"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setContent(rs.getString("content"));
					bDTO.setReadcount(rs.getInt("readcount"));
					bDTO.setDate(rs.getTimestamp("date"));
					//file이름 저장
					bDTO.setFile(rs.getString("file"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return bDTO;
		}//
		
		// 리턴할형 없음   updateBoard(BoardDTO updateDTO) 메서드 정의
		public void updateBoard(BoardDTO updateDTO) {
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="update board set subject=?,content=?,file=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, updateDTO.getSubject());
				pstmt.setString(2, updateDTO.getContent());
				pstmt.setString(3, updateDTO.getFile());
				pstmt.setInt(4, updateDTO.getNum());
				//4 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}//
		
		// 리턴할형 없음   deleteBoard(int num) 메서드 정의
		public void deleteBoard(int num) {
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="delete from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}//
		
		//리턴할형 int  getMaxNum()메서드 정의
		public int getMaxNum() {
			int num=0;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="select max(num) from board";
				pstmt=con.prepareStatement(sql);
				//4 실행 => 결과저장
				rs=pstmt.executeQuery();
				//5 결과 => BoardDTO 저장
				if(rs.next()) {
					num=rs.getInt("max(num)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			return num;
		}//
		
		// 리턴할형없음 insertBoard(BoardDTO 주소받을변수) 메서드 정의
		public void insertBoard(BoardDTO bDTO) {
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="insert into board(num,pass,name,subject,content,readcount,date,file) values(?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bDTO.getNum());
				pstmt.setString(2, bDTO.getPass());
				pstmt.setString(3, bDTO.getName());
				pstmt.setString(4, bDTO.getSubject());
				pstmt.setString(5, bDTO.getContent());
				pstmt.setInt(6, bDTO.getReadcount());
				pstmt.setTimestamp(7, bDTO.getDate());
				//file추가
				pstmt.setString(8, bDTO.getFile());
				//4 실행
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}//
		
	
}//클래스

