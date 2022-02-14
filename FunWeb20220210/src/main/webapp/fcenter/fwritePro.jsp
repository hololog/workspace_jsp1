<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/fwritePro.jsp</title>
</head>
<body>
<%
//한글처리
// request.setCharacterEncoding("utf-8");
// 파일업로드 프로그램 설치 cos.jar
// WEB-INF - lib - cos.jar 설치
// webapp - upload폴더 만들기

// MultipartRequest 객체생성
// 생성자 request,upload폴더 물리적경로,파일크기설정,한글처리,파일이름동일 이름변경객체생성
String uploadPath=request.getRealPath("/upload");
System.out.println(uploadPath);
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// name subject content 파라미터 가져오기
// pass = "1111" 로그인 게시판 비밀번호 필요없음
// readcount=0, date 시스템날짜 시간 설정
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String pass="1111";
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
//num구하기
//리턴할형 int  getMaxNum()메서드 정의
//file이름 추가
String file=multi.getFilesystemName("file");

// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// BoardDTO 객체생성
BoardDTO bDTO=new BoardDTO();
// set메서드 호출 <= 파라미터값 저장
// setNum(getMaxNum()+1)
bDTO.setNum(bDAO.getMaxNum()+1);
bDTO.setName(name);
bDTO.setPass(pass);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadcount(readcount);
bDTO.setDate(date);
//file이름 추가
bDTO.setFile(file);

// 리턴할형없음 insertBoard(BoardDTO 주소받을변수) 메서드 정의
// insertBoard(BoardDTO 주소) 메서드호출
bDAO.insertBoard(bDTO);
// notice.jsp 이동
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>

