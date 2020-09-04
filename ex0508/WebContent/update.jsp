<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0508.*"%>

<%
	String lcode=request.getParameter("lcode");
	String scode=request.getParameter("scode");
	String grade=request.getParameter("grade");
	
	DAO dao=new DAO();
	dao.update(grade,scode,lcode);
	
%>