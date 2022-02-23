package com.itwillbs.service;

import java.sql.Timestamp;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	//처리작업
	public void insertPro(MemberDTO mDTO) {
		
		System.out.println("MemberService insertPro()");
		//날짜값 구하기
		mDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		MemberDAO mDAO = new MemberDAO();
		mDAO.insertMem(mDTO);
		
	}
	public void usercheck(String id, String pass) {
		
		MemberDAO mDAO = new MemberDAO();
		mDAO.userCheck(id, pass);
		
	}
	
	
}
