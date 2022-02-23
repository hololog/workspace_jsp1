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
	public MemberDTO usercheck(String id, String pass) {
		System.out.println("memberService usercheck()");
		MemberDAO mDAO = new MemberDAO();
		
		return mDAO.userCheck(id, pass);
	}
	public MemberDTO getMember(String id) {
		System.out.println("memberService getMember()");
		MemberDAO mDAO = new MemberDAO();
		
		return mDAO.getInfo(id);
	}
	public void updTe.
}
