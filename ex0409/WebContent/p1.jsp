<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex01.*" %>
    <%  
    
    String title=request.getParameter("title");
	String article=request.getParameter("article");
	
	BVO vo=new BVO();
	
	out.println("<div class='box'>");
    out.println("<h1 class='title'>"+vo.getBno()+")"+vo.getTitle()+"</h1>");
  
    out.println("<p class='article'>"+vo.getArticle()+"</p>");
    out.println("<a href='sqlDelete.jsp?bno="+vo.getBno()+"'>삭제</a>");
    out.println("</div>");

     
     %>