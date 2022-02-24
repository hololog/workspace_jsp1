package com.itwillbs.service;

import java.util.List;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;

public class BoardService {
	
	public int getNextNum() {
		System.out.println("getNum()");
		BoardDAO bDAO = new BoardDAO();
		
		return bDAO.getNextNum();
	}
	
	public void insertBoard(BoardDTO bDTO) {
		System.out.println("insertBoard()");
		BoardDAO bDAO = new BoardDAO();
		bDTO.setNum(getNextNum());
		bDAO.insertBoard(bDTO);
	}
	
	public List<BoardDTO> getBoardList(int startRow,int pageSize ) {
		System.out.println("insertBoard()");
		BoardDAO bDAO = new BoardDAO();

		return bDAO.showList(startRow, pageSize);
	}
	
	public int getBoardCount() {
		System.out.println("getBoardCount();");
		BoardDAO bDAO = new BoardDAO();

		return bDAO.getBoardCount();
	}
	
	
}



















