<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex01.*" %>
<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");

	out.println(title);
	out.println(content);
	
	BoardVO vo=new BoardVO();
	vo.setTitle(title);
	vo.setContent(content);
	
	BoardDAO dao=new BoardDAO();
	dao.insert(vo);
%>

<script>
    	alert("저장되었습니다.");
    	location.href="list.jsp";
    </script>
