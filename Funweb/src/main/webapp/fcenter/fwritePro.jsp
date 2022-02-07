<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fcenter/fwritePro.jsp</title>
</head>
<body>
<%
int maxSize=10*1024*1024;
String uploadPath=request.getRealPath("/upload");
// String uploadPath=request.getSession().getServletContext().getRealPath("/upload");
MultipartRequest multi=new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

String name=multi.getParameter("name");
String pass="1234";
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());

BoardDAO bDAO=new BoardDAO();
BoardDTO bDTO=new BoardDTO();

bDTO.setNum(bDAO.getMaxNum()+1);
bDTO.setName(name);
bDTO.setPass(pass);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadcount(readcount);
bDTO.setFile(file);
bDTO.setDate(date);

bDAO.insertBoard(bDTO);
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>