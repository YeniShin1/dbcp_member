<%@page import="member.memberVO"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  //로그인처리
	//loginForm.jsp에서 사용자가 입력한 id와 current_password를 가져온 후
	//DB를 거쳐 확인 후 존재하는 사용자라면 세션에 담기
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String password = request.getParameter("current_password");
	
	memberDAO dao = new memberDAO();
	memberVO vo = dao.isLogin(userid, password);
		
	if(vo!=null){ //존재하는 사용자이기 때문에 세션에 정보 담기
		//session.setAttribute("userid", vo.getUserid());
		//session.setAttribute("name", vo.getName());
		//세션은 정보를 서버에 저장(객체 형태자체로 담을 수 있음), 
		//쿠키는 정보를 브라우저에 저장(많은 데이터 저장x, 객체데이터 담을 수 x)
		session.setAttribute("vo", vo);
		out.print("<script>");
		out.print("alert('로그인되었습니다.');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");		
	}else {
		out.print("<script>");
		out.print("alert('아이디와 비밀번호를 확인해주세요');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");		
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>loginProcess.jsp</title>
</head>
<body>

</body>
</html>