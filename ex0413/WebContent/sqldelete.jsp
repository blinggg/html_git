<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ex01.*" %>
<%
	String strbno=request.getParameter("bno");
	int bno=Integer.parseInt(strbno);
	
	BBSDAO dao=new BBSDAO();
	
	dao.delete(bno);
	
%>

<script>
	alert("삭제되었습니다.");
	location.href="list.jsp";
</script>