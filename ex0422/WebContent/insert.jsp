<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="ex0422.*"%>

<%
	MovieDAO dao=new MovieDAO();
	String title=request.getParameter("title");
	String actor=request.getParameter("actor");
	
	MovieVO vo=new MovieVO();
	vo.setTitle(title);
	vo.setActor(actor);
	
	dao.insert(vo);

%>