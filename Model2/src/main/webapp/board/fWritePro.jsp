<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		request.setCharacterEncoding("UTF-8"); 
  	%> 
<jsp:useBean id="bean" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writePro.jsp</title>
</head>
<body>
<%
//request한글처리
//파일업로드 cos.jar설치
//업로드 폴더만들기 /src/webapp/upload폴더(서버에)
// MultipartRequest객체생성
// new MultipartRequest(requset,파일 물리적 경로, 파일크기, 한글처리, 이름중복처리)매개변수 구하기
//물리적 경로 설정
String uploadPath=request.getRealPath("/upload");
System.out.println("물리적 경로:"+uploadPath);
//최대파일크기 설정 10메가
int maxSize=10*1024*1024;
//한글처리=> UTF-8
//중복이름 변경

MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"UTF-8",new DefaultFileRenamePolicy());

// // 업로드된 file 이름 가져오기
String file=multi.getFilesystemName("file");
System.out.println("업로드된 파일이름:"+file);

BoardDAO bDAO=new BoardDAO();



// request => multi에 저장된 요청정보 name pass subject content 가져오기
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");


BoardDTO bDTO=new BoardDTO();
bDTO.setNum(bDAO.getNextNum());
bDTO.setPass(pass);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setFile(file);

bDAO.insertBoard(bDTO);

response.sendRedirect("list.jsp");
%>
</body>
</html>