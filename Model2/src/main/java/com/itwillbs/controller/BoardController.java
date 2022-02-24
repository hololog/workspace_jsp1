package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

public class BoardController extends HttpServlet{
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("boardcontroller doPro()");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String substringPath = uri.substring(contextPath.length());
		System.out.println(substringPath);
		
		if(substringPath.equals("/write")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("board/writeForm.jsp");
			dispatcher.forward(request, response);
		
		} else if(substringPath.equals("/writePro")) {
			request.setCharacterEncoding("utf-8");
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			BoardDTO bDTO = new BoardDTO();
			bDTO.setName(name);
			bDTO.setPass(pass);
			bDTO.setSubject(subject);
			bDTO.setContent(content);

			BoardService boardService = new BoardService();
			boardService.insertBoard(bDTO);
			
			response.sendRedirect("list");
			
		} else if(substringPath.equals("/list")) {
			//페이징 처리
			//페이지번호 없으면 1
			//http://localhost:8080/Model2/list
			//http://localhost:8080/Model2/list?pageNum=2
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			int currentPage=Integer.parseInt(pageNum);
			int startRow=(currentPage-1)*pageSize+1;
			int endRow = startRow+pageSize-1;
			
			BoardService boardService = new BoardService();
			List<BoardDTO> boardList = boardService.getBoardList(startRow, pageSize);
			
			
			int count = boardService.getBoardCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount= count/pageSize + (count % pageSize==0 ? 0:1);
			if(endPage>pageCount){
				endPage=pageCount;
			}
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			pageDTO.setPageCount(pageCount);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setCount(count);
			pageDTO.setEndPage(endPage);
			pageDTO.setStartPage(startPage);
			
			
			request.setAttribute("boardList", boardList);
			requset.setAttri
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("board/list.jsp");
			dispatcher.forward(request, response);
		
		} 
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	
}
