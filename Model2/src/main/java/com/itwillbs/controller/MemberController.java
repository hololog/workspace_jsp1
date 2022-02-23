package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

//서블릿(처리담당자)로 만들기
public class MemberController extends HttpServlet {
	//가상주소 http://localhost:8080/Model2/insert.me
	
	//서블릿 자동으로 메서드 동작 doGet(),doPost(), service()
	//가상주소 => 실제jsp, 자바메서드 연결


	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController servlet doPro()");
//		   => 처리담당자 가상주소 insert.me     파일 insertForm.jsp 연결시켜주는 명령
//		   => 가상주소 insertPro.me  자바 insertPro메서드 호출 (자바 디비메서드호출) 
		
		//URL주소 = 서버주소 + URI (http://localhost:8080/Model2/insert.me)
		String requestURL = request.getRequestURL().toString();
		//URI =  /contextPath + 가상주소 (/Model2/insert.me)
		String requestURI = request.getRequestURI().toString();
		System.out.println(requestURL);
		System.out.println(requestURI);
		//프로젝트 경로(/Model2)
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		//가상주소 뽑기(/insert.me)
		String substringPath = requestURI.substring(contextPath.length());
		
		System.out.println(substringPath);
		
		if(substringPath.equals("/insert.me")) {
			//이동방식 1. 하이퍼링크 2.location.href 3.response.sendRedirect() 4.requestDispatcher(포워드방식)
//			response.sendRedirect("member/insertForm.jsp");
			//이동할 페이지로 요청과 응답 객체를 새로 생성하여 전송하므로 요청, 응답정보가 유지되지않는 특성이 있다.=>주소표시줄 주소변경
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertForm.jsp");
			dispatcher.forward(request, response);
			//포워드방식 : 요청과 응답에 대한 제어권을 다른 페이지로 넘기더라도 브라우저에 표시되는 주소가 유지되는 방식 
			
		} else if(substringPath.equals("/insertPro.me")) {
			//=> 가상주소 insertPro.me 자바 insertPro메서드 호출 
			// 주소매핑=> 처리작업 자바파일 MemberService => 디비작업 자바파일 MemberDAO
			request.setCharacterEncoding("UTF-8");
			MemberDTO mDTO = new MemberDTO();
			mDTO.setId(request.getParameter("id"));
			mDTO.setPass(request.getParameter("pass"));
			mDTO.setName(request.getParameter("name"));
			
			MemberService memberService = new MemberService();
			memberService.insertPro(mDTO);
			
			response.sendRedirect("login.me");//jsp만 주소안보이면 됨
			
		} else if(substringPath.equals("/login.me")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/loginForm.jsp");
			dispatcher.forward(request, response);
			
		} else if(substringPath.equals("/loginPro.me")) {
			
			request.setCharacterEncoding("utf-8");
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			
			MemberService memberService = new MemberService();
			memberService.usercheck(id, pass);
			
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController servlet doget메소드");
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController servlet dopost메소드");
		doPro(request, response);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
