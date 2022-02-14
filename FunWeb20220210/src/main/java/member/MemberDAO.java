package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//멤버변수 
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	//데이터 베이스 연결 메서드 정의 
	// throws Exception 메서드 호출하는 곳에서 예외처리 함
	public Connection getConnection() throws Exception{
		// JDBC 설치
		// WEB-INF - lib - mysql-connector-java-5.1.39-bin.jar
//		 // 1단계 드라이버 불러오기
//		 Class.forName("com.mysql.jdbc.Driver");
//		 // 2단계 디비연결
//		 String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
//		 String dbId="root";
//		 String dbPass="1234";
//		 con=DriverManager.getConnection(dbUrl, dbId, dbPass);	
//		 return con;
		
		//DataBase Connection Pool : 미리 서버에서 연결하고 연결정보를 저장
		//                           필요할때 연결자원의 이름을 불러서 사용
		// 수정 1회 최소화, 성능 높아짐 
		
		//  context.xml 불러오기 위해 객체생성  import javax.naming.Context;
		Context init=new InitialContext();
		// 자원이름 찾아서 불러오기 javax.sql.DataSource
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		// 디비연결
		con=ds.getConnection();
		return con;
	}
	
	
	// 예외 상관없이 마무리 작업(insert작업이 끝나면 기억장소 정리) =>메서드 정의
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
	
	// 리턴할형없음 insertMember(MemberDTO mDTO) 메서드 정의 
	public void insertMember(MemberDTO mDTO) {
//		System.out.println("메서드시작");
		try {
//			int a=10;
//			int b=0;
//			System.out.println(a/b); //에러발생
			
			// 예외가 발생할 가능성이 높은 코드 
			 // 1단계 드라이버 불러오기 	// 2단계 디비연결  디비연결 메서드호출
			 con=getConnection();
			 
			 // 3단계 sql 구문 만들기 insert
			 String sql="insert into member(id,pass,name,date,email,address,phone,mobile) values(?,?,?,?,?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mDTO.getId());
			 pstmt.setString(2, mDTO.getPass());
			 pstmt.setString(3, mDTO.getName());
			 pstmt.setTimestamp(4, mDTO.getDate());
			 pstmt.setString(5, mDTO.getEmail());
			 pstmt.setString(6, mDTO.getAddress());
			 pstmt.setString(7, mDTO.getPhone());
			 pstmt.setString(8, mDTO.getMobile());
			 // 4단계 실행
			 pstmt.executeUpdate();
			
		} catch (Exception e) {
//			System.out.println("에러처리");
			e.printStackTrace();
		}finally {
			//마무리
//			System.out.println("마무리");
			dbClose();
		}
//		System.out.println("메서드끝");
	}
	
	// MemberDTO 리턴할형  userCheck(String id, String pass) 메서드 정의
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO mDTO=null;
		try {
			//1,2 디비연결 메서드 호출
			con=getConnection();
			//3 sql
			String sql="select * from member where id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			//4 실행 => 결과 저장
			rs=pstmt.executeQuery();
			//5 결과 접근 데이터있으면 MemberDTO에 멤버변수 저장
			if(rs.next()) {
				//첫행 이동 데이터 있으면 true 아이디 비밀번호 일치
				// MemberDTO 객체생성
				mDTO=new MemberDTO();
				// 열접근해서 멤버변수에 set호출하면서 열에서 가져온 값을 저장
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setMobile(rs.getString("mobile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return mDTO;
	}//
	
	// MemberDTO 리턴할형 getMember(String id) 메서드 정의
	public MemberDTO getMember(String id) {
		MemberDTO mDTO=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//4 실행 -> 결과 저장
			rs=pstmt.executeQuery();
			//5 결과 행접근 MemberDTO 객체생성 set메서드호출 열접근해서 저장
			if(rs.next()) {
				//첫행 이동 데이터 있으면 true 아이디  일치
				// MemberDTO 객체생성
				mDTO=new MemberDTO();
				// 열접근해서 멤버변수에 set호출하면서 열에서 가져온 값을 저장
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setDate(rs.getTimestamp("date"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setMobile(rs.getString("mobile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return mDTO;
	}//
	
//	리턴할형 없음 updateMember(MemberDTO updateDTO) 메서드 정의
	public void updateMember(MemberDTO updateDTO) {
		try {
			//1,2 디비연결 메서드 호출
			con=getConnection();
			//3 sql
			String sql="update member set name=?,email=?,address=?,phone=?,mobile=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, updateDTO.getName());
			pstmt.setString(2, updateDTO.getEmail());
			pstmt.setString(3, updateDTO.getAddress());
			pstmt.setString(4, updateDTO.getPhone());
			pstmt.setString(5, updateDTO.getMobile());
			pstmt.setString(6, updateDTO.getId());
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//
	
}//클래스
