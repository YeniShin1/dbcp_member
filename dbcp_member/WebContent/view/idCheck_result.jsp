<%@page import="member.memberVO"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//joinProcess.jsp에서 db작업하기
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");

	memberDAO dao = new memberDAO();
	boolean result = dao.checkId(userid);	
	
	if(result){
		out.print(0);
	}else{ 
		out.print(1);
	}
%>