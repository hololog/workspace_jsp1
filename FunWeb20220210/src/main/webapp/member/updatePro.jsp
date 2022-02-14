<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 파라미터 id pass name email address phone mobile 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");

// MemberDAO 객체생성
MemberDAO mDAO=new MemberDAO();
// MemberDTO mDTO = userCheck(id,pass) 메서드호출
MemberDTO mDTO=mDAO.userCheck(id, pass);

// mDTO !=null 아이디 비밀번호 일치  
//             수정할 정보 저장 MemberDTO updateDTO 객체생성
//                             set메서드 호출 파라미터 저장
//             수정  리턴할형 없음 updateMember(MemberDTO updateDTO) 메서드 정의 
//                  updateMember(updateDTO) 메서드 호출
//              ../main/main.jsp 이동
// mDTO ==null 아이디 비밀번호 틀림  "입력하신 정보 틀림" 뒤로이동
if(mDTO!=null){
	// mDTO !=null 아이디 비밀번호 일치  
	MemberDTO updateDTO=new MemberDTO();
	updateDTO.setId(id);
	updateDTO.setPass(pass);
	updateDTO.setName(name);
	updateDTO.setAddress(address);
	updateDTO.setEmail(email);
	updateDTO.setPhone(phone);
	updateDTO.setMobile(mobile);
	
	mDAO.updateMember(updateDTO);
	response.sendRedirect("../main/main.jsp");
}else{
	// mDTO ==null 아이디 비밀번호 틀림  "입력하신 정보 틀림" 뒤로이동	
	%>
	<script type="text/javascript">
		alert("입력하신정보 틀림");
		history.back();
	</script>
	<%		
}
%>
</body>
</html>



