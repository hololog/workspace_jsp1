<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/gupdatePro.jsp</title>
</head>
<body>
<%
//한글처리
// request.setCharacterEncoding("utf-8");
//파일업로드 프로그램 설치 cos.jar
//WEB-INF - lib - cos.jar 설치
//webapp - upload폴더 만들기

//MultipartRequest 객체생성
//생성자 request,upload폴더 물리적경로,파일크기설정,한글처리,파일이름동일 이름변경객체생성
String uploadPath=request.getRealPath("/upload");
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// num name subject content 파라미터 가져오기
int num = Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
// 새로 수정할 파일이름
String file=multi.getFilesystemName("file");
//수정할 파일이름이 없으면 기존파일이름 저장
if(file==null){
	file=multi.getParameter("oldfile");
}

// BoardDTO updateDTO객체생성
BoardDTO updateDTO=new BoardDTO();
// set <= 파라미터 값 저장
updateDTO.setNum(num);
updateDTO.setName(name);
updateDTO.setSubject(subject);
updateDTO.setContent(content);
//파일이름 추가
updateDTO.setFile(file);

// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// 리턴할형 없음   updateBoard(BoardDTO updateDTO) 메서드 정의
// updateBoard(updateDTO) 메서드 호출
bDAO.updateBoard(updateDTO);

// notice.jsp
response.sendRedirect("gnotice.jsp");
%>
</body>
</html>


