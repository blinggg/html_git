<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0417.*" %>

<%
	String content=request.getParameter("content");
	ReplyDAO dao=new ReplyDAO();
	ReplyVO vo=new ReplyVO();
	
	dao.insert(content);
%>

<script>
	alert("저장되었습니다.");
	location.href="list.jsp";
</script>