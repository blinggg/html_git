<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex01.*"%>

<%
	String strbno=request.getParameter("bno");
	int bno=Integer.parseInt(strbno);
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	BBSVO vo=new BBSVO();
	vo.setBno(bno);
	vo.setTitle(title);
	vo.setContent(content);
	
	BBSDAO dao=new BBSDAO();
	dao.update(vo);
%>

<script>
	alret("수정되었습니다.");
	location.href="list.jsp";
</script>