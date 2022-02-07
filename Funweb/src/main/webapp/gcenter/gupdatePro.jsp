<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gcenter/gupdatePro.jsp</title>
</head>
<body>
<%
int maxSize=10*1024*1024;
String uploadPath=request.getRealPath("/upload");

MultipartRequest multi=new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

int num = Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
if(file==null){
	file=multi.getFilesystemName("oldFile");	
}

BoardDTO bDTO=new BoardDTO();
bDTO.setNum(num);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setFile(file);
BoardDAO bDAO= new BoardDAO();

bDAO.updateBoard(bDTO);
response.sendRedirect("gnotice.jsp");
%>
</body>
</html>