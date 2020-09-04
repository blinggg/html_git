<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0429.*, java.util.*"%>

<%
	String scode=request.getParameter("scode");
	String lcode=request.getParameter("lcode");
	
	EDAO edao=new EDAO();
	edao.insert(scode,lcode);

%>