<%@page import="member.memberVO"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//joinProcess.jsp에서 db작업하기
	request.setCharacterEncoding("utf-8");

	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
	memberDAO dao = new memberDAO();
	
	memberVO vo = new memberVO();
	vo.setUserid(userid);
	vo.setPassword(password);
	vo.setName(name);
	vo.setGender(gender);
	vo.setEmail(email);
	
	int result = dao.member_insert(vo);
	
	if(result>0){ //회원가입이 완료되면 loginForm.jsp로 이동
		out.print("<script>");
		out.print("alert('회원가입되었습니다');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");
	}else{ //회원가입 실패 시 joinForm.jsp로 이동
		out.print("<script>");
		out.print("alert('회원가입 실패했습니다');");
		out.print("history.back();");
		out.print("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>