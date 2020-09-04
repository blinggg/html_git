<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0429.*, java.util.*"%>

<%
	String scode=request.getParameter("scode");
	String lcode=request.getParameter("lcode");
	String strGrade=request.getParameter("grade");
	int grade=Integer.parseInt(strGrade);
	
	System.out.println(scode+"\n"+lcode+"\n"+grade);
	EVO vo=new EVO();
	vo.setScode(scode);
	vo.setLcode(lcode);
	vo.setGrade(grade);
	
	EDAO edao=new EDAO();
	edao.update(vo);
%>