package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {//(data access object)
	//멤버변수
	Connection con;
	String sql;
	PreparedStatement pstmt;
	
	String dbId;
	String dbPass;
	String dbUrl;
	
	//생성자 ///자습
	public MemberDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		dbId="root";
		dbPass="1234";
		dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
		
	}
	
	//멤버함수(메서드)
	//자바파일에 메서드 만들기
	//회원가입 (insert) => 매개변수로 값받기
//	public void insertMem(String id, String pass, String name, Timestamp date) {
	public void insertMem(MemberDTO mDTO) {
		System.out.println("MemberDAO의 insertMember() 호출!");
		System.out.println(mDTO.getId() + "," + mDTO.getPass() + "," 
		                 + mDTO.getName() + "," + mDTO.getDate());
		  
		try {//예외처리
			//1.드라이버 로더 
//			Class.forName("com.mysql.jdbc.Driver");
			//2.db연결
//			String dbId="root";
//			String dbPass="1234";
//			String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
			con = DriverManager.getConnection(dbUrl,dbId, dbPass);
			//3.sql작성
			sql = "insert into member(id,pass,name,date) values(?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setTimestamp(4, mDTO.getDate());
			//4.sql 실행
			pstmt.executeUpdate();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return;
	}//insertMember()

	public void loginMem(MemberDTO mDTO) {
		try {
			con = DriverManager.getConnection(dbUrl, dbId, dbPass);
			sql = "select * from member where id=? and pass=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, mDTO.getId());
			 pstmt.setString(2, mDTO.getPass());

			 ResultSet rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 5단계 다음행으로 이동 데이터 있으면(true) => 아이디 비밀번호 일치
//		                         없으면 false => 아이디 비밀번호 틀림 
		// if(rs.next()){
//		 	//true 일치  => 로그인인증 => 세션값 생성(중복되지 않는 값) => 페이지 상관없이 값유지 => main.jsp 이동
//		 	out.println("일치");
//		 	session.setAttribute("id", id);
//		 	response.sendRedirect("main.jsp");
		// }else{
			//false 틀림 => "입력하신 정보 틀림"  뒤로이동
//		 	out.println("틀림");
	}
}
