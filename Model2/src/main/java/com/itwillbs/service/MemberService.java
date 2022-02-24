package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

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
	public void updateMember(MemberDTO mDTO) {
		System.out.println("MemberService updatePro()");
		MemberDAO mDAO = new MemberDAO();
		mDAO.updateMem(mDTO);
		
	}
	public void deleteMember(MemberDTO mDTO) {
		System.out.println("MemberService deletePro()");
		MemberDAO mDAO = new MemberDAO();
		mDAO.deleteMem(mDTO);
	}
	public List<MemberDTO> getList(){
		System.out.println("MemberService showlist()");
		MemberDAO mDAO = new MemberDAO();
		return mDAO.showList();
	}
}















